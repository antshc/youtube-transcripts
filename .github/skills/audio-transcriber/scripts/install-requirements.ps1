#requires -Version 5.1

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

Write-Host 'Installing Faster-Whisper and audio-transcriber dependencies...'
& $pythonCommand @pythonArguments -m pip install --upgrade 'faster-whisper' 'av>=11,<19' 'truststore' 'tqdm' 'rich'
if ($LASTEXITCODE -ne 0) {
    throw 'Dependency installation failed.'
}

Write-Host 'Verifying installed packages and PyAV compatibility...'
& $pythonCommand @pythonArguments -c "import av, faster_whisper, rich, truststore, tqdm; major = int(av.__version__.split('.')[0]); assert 11 <= major < 19, f'Unsupported PyAV version: {av.__version__}'; truststore.inject_into_ssl(); print(f'Faster-Whisper available; PyAV {av.__version__}; truststore, tqdm, and rich available')"
if ($LASTEXITCODE -ne 0) {
    throw 'Dependency verification failed.'
}

if (Get-Command ffmpeg -ErrorAction SilentlyContinue) {
    Write-Host 'ffmpeg is available.'
} else {
    Write-Warning 'ffmpeg is not installed. It is optional for MP3 transcription but required for format conversion.'
}

Write-Host 'Ready. The Whisper model downloads from Hugging Face on first transcription; this installer does not download it.'