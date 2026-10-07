#requires -Version 5.1
param(
    [string]$Model = 'base',
    [switch]$SkipModelDownload
)

$ErrorActionPreference = 'Stop'

$python = Get-Command py -ErrorAction SilentlyContinue
$pythonArguments = @('-3')

if (-not $python) {
    $python = Get-Command python -ErrorAction SilentlyContinue
    $pythonArguments = @()
}

if (-not $python) {
    throw 'Python 3.10+ is required. Install Python and ensure py.exe or python.exe is on PATH.'
}

$pythonCommand = $python.Source
& $pythonCommand @pythonArguments -c "import sys; sys.exit(0 if sys.version_info >= (3, 10) else 1)"
if ($LASTEXITCODE -ne 0) {
    throw 'Python 3.10 or later is required for the installed truststore package.'
}

& $pythonCommand @pythonArguments -m pip --version *> $null
if ($LASTEXITCODE -ne 0) {
    throw 'pip not found. Install pip for this Python (python -m ensurepip).'
}

Write-Host 'Installing Faster-Whisper and audio-transcriber dependencies...'
& $pythonCommand @pythonArguments -m pip install --upgrade 'faster-whisper' 'av>=11,<19' 'truststore'
if ($LASTEXITCODE -eq 0) {
    $engine = 'faster-whisper'
} else {
    Write-Warning 'Faster-Whisper installation failed, trying openai-whisper...'
    & $pythonCommand @pythonArguments -m pip install --upgrade 'openai-whisper' 'truststore'
    if ($LASTEXITCODE -ne 0) {
        throw 'Failed to install a transcription engine (faster-whisper and openai-whisper both failed).'
    }
    $engine = 'whisper'
}

Write-Host 'Installing UI libraries (tqdm, rich)...'
& $pythonCommand @pythonArguments -m pip install --upgrade 'tqdm' 'rich'
if ($LASTEXITCODE -ne 0) {
    throw 'tqdm/rich installation failed; transcribe.py requires them.'
}

Write-Host 'Verifying installed packages...'
if ($engine -eq 'faster-whisper') {
    & $pythonCommand @pythonArguments -c "import av, faster_whisper, rich, truststore, tqdm; major = int(av.__version__.split('.')[0]); assert 11 <= major < 19, f'Unsupported PyAV version: {av.__version__}'; truststore.inject_into_ssl(); print(f'Faster-Whisper available; PyAV {av.__version__}; truststore, tqdm, and rich available')"
} else {
    & $pythonCommand @pythonArguments -c "import whisper, rich, truststore, tqdm; truststore.inject_into_ssl(); print('openai-whisper, truststore, tqdm, and rich available')"
}
if ($LASTEXITCODE -ne 0) {
    throw 'Dependency verification failed.'
}

if (Get-Command ffmpeg -ErrorAction SilentlyContinue) {
    Write-Host 'ffmpeg is available.'
} else {
    Write-Warning 'ffmpeg is not installed. It is optional for MP3 transcription but required for format conversion. Install: winget install Gyan.FFmpeg'
}

if ($SkipModelDownload) {
    Write-Host "Skipping model download; '$Model' downloads on first transcription."
} else {
    Write-Host "Downloading '$Model' model..."
    $env:WHISPER_MODEL = $Model
    $env:WHISPER_ENGINE = $engine
    $downloadScript = @'
import os
import truststore
truststore.inject_into_ssl()
model = os.environ["WHISPER_MODEL"]
if os.environ["WHISPER_ENGINE"] == "faster-whisper":
    from faster_whisper import WhisperModel
    WhisperModel(model, device="cpu", compute_type="int8")
else:
    import whisper
    whisper.load_model(model)
print(f"Model '{model}' ready")
'@
    try {
        $downloadScript | & $pythonCommand @pythonArguments -
        if ($LASTEXITCODE -ne 0) {
            throw "Model download failed (exit code $LASTEXITCODE)."
        }
    } finally {
        Remove-Item Env:WHISPER_MODEL, Env:WHISPER_ENGINE -ErrorAction SilentlyContinue
    }
}

Write-Host "Ready. Transcription engine: $engine"