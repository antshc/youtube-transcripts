---
name: audio-transcriber
description: Transcribe audio or video files (MP3, WAV, M4A, OGG, FLAC, WEBM, MP4) to a timestamped Markdown transcript with local Faster-Whisper or Whisper. Use when the user asks to transcribe or convert audio to text. Does not summarize; use the transcript-summary skill for that.
license: MIT
---

## Purpose

Converts audio recordings into a Markdown transcript with metadata (file name, language, engine, date) and timestamped segments. Runs 100% locally with Faster-Whisper (preferred) or OpenAI Whisper; no API keys or cloud uploads.

This skill only produces the transcript. Summaries, minutes, and action items are out of scope; hand the transcript to the `transcript-summary` skill.

## When to Use

- User wants to transcribe audio/video files to text
- User says "transcribe this audio", "convert audio to text"
- Files in MP3, WAV, M4A, OGG, FLAC, WEBM, MP4

## Workflow

All commands are PowerShell. `<skill-directory>` is the folder containing this file.

### Step 1: Detect the transcription engine

```powershell
python -c "import faster_whisper" 2>$null
if ($LASTEXITCODE -eq 0) { 'faster-whisper detected' }
else {
    python -c "import whisper" 2>$null
    if ($LASTEXITCODE -eq 0) { 'whisper detected' } else { 'no transcription engine' }
}

if (Get-Command ffmpeg -ErrorAction SilentlyContinue) { 'ffmpeg available' } else { 'ffmpeg missing' }
```

If no engine is found, ask the user to confirm, then install:

```powershell
& "<skill-directory>\scripts\install-requirements.ps1"
```

The installer installs Faster-Whisper (falling back to openai-whisper), PyAV, truststore, tqdm, and rich, then downloads the `base` model. Options: `-Model <name>` to pick another model, `-SkipModelDownload` to defer the download to the first transcription.

ffmpeg is optional for common formats and required for conversion. If missing, suggest `winget install Gyan.FFmpeg`.

### Step 2: Validate the audio file

1. Confirm the file exists (`Test-Path -LiteralPath <file> -PathType Leaf`); otherwise show the exact path and ask for a correct one.
2. Warn if the file is large (over 25 MB) that processing can take several minutes; continue unless the user declines.
3. If the extension is not in the supported list and ffmpeg is available, convert first:

```powershell
ffmpeg -i "<file>" -ar 16000 "<file-without-extension>.wav" -y
```

### Step 3: Transcribe

```powershell
python "<skill-directory>\scripts\transcribe.py" "<audio-file>" --model base --output-dir "<output-dir>"
```

- `--model`: `tiny`, `base` (default), `small`, `medium`, `large`. Larger is more accurate and slower.
- `--output-dir`: defaults to the current directory.

Output: `transcript-YYYYMMDD-HHMMSS.md` containing metadata and segments formatted as `**[MM:SS → MM:SS]**` followed by the text. The timestamp in the file name avoids overwriting earlier runs.

For batch input, run the command once per file.

### Step 4: Report

Tell the user the output path, detected language, and segment count. For summaries, offer the `transcript-summary` skill with the transcript path.

## Error Handling

| Error | Likely Cause | Action |
|-------|-------------|--------|
| No transcription engine | `faster-whisper` and `openai-whisper` not installed | Offer to run `install-requirements.ps1` |
| Unsupported audio format | Extension not in supported list | Convert with ffmpeg if available; otherwise suggest installing it |
| File not found | Wrong or moved path | Show the exact path; ask for the correct one |
| Very large file | Long recordings | Warn about processing time; offer to split with ffmpeg |
| Garbled transcript | Poor audio, noise, overlapping speakers | Report it; suggest a larger `--model` or a better source |
| ffmpeg not found | Not installed | Suggest `winget install Gyan.FFmpeg` |
| Model download fails | Network or proxy/TLS issue | Retry; truststore is used so the Windows certificate store applies |
| Permission denied | File locked | Ask the user to close the file or copy it elsewhere |

## Example

```powershell
python "<skill-directory>\scripts\transcribe.py" meeting.mp3 --model small
```

A runnable wrapper that validates the file and calls the script is in `examples\basic-transcription.ps1`.
