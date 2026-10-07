#requires -Version 5.1
<#
.SYNOPSIS
    Basic audio transcription example: validates a file and writes a Markdown transcript.
.EXAMPLE
    .\basic-transcription.ps1 -AudioFile meeting.mp3 -Model small
#>
param(
    [Parameter(Mandatory)][string]$AudioFile,
    [ValidateSet('tiny', 'base', 'small', 'medium', 'large')][string]$Model = 'base'
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $AudioFile -PathType Leaf)) {
    throw "File not found: $AudioFile"
}
$AudioFile = (Resolve-Path -LiteralPath $AudioFile).Path

$python = Get-Command py -ErrorAction SilentlyContinue
$pythonArguments = @('-3')
if (-not $python) {
    $python = Get-Command python -ErrorAction SilentlyContinue
    $pythonArguments = @()
}
if (-not $python) {
    throw 'Python 3 not found on PATH.'
}
$pythonCommand = $python.Source

Write-Host 'Step 0: Discovering transcription tools...'
& $pythonCommand @pythonArguments -c 'import faster_whisper' 2>$null
if ($LASTEXITCODE -eq 0) {
    $transcriber = 'faster-whisper'
} else {
    & $pythonCommand @pythonArguments -c 'import whisper' 2>$null
    if ($LASTEXITCODE -ne 0) {
        throw 'No transcription tool found. Run scripts\install-requirements.ps1'
    }
    $transcriber = 'whisper'
}
Write-Host "Detected: $transcriber"

if (-not (Get-Command ffmpeg -ErrorAction SilentlyContinue)) {
    Write-Warning 'ffmpeg not found (limited format support).'
}

Write-Host 'Step 1: Checking file...'
$file = Get-Item -LiteralPath $AudioFile
$sizeMb = [math]::Round($file.Length / 1MB, 1)
Write-Host "File size: $sizeMb MB"

if ($sizeMb -gt 25) {
    Write-Warning "Large file ($sizeMb MB) - processing may take several minutes."
    $answer = Read-Host 'Continue? [Y/n]'
    if ($answer -match '^[Nn]') {
        Write-Host 'Transcription cancelled.'
        return
    }
}

Write-Host 'Step 2: Transcribing...'
$transcribeScript = Join-Path $PSScriptRoot '..\scripts\transcribe.py'
& $pythonCommand @pythonArguments $transcribeScript $AudioFile --model $Model --output-dir $file.DirectoryName
if ($LASTEXITCODE -ne 0) {
    throw 'Transcription failed.'
}

Write-Host "Done. Engine: $transcriber, model: $Model"
