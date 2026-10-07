# Audio Transcriber Skill v2.0.0

Transcribe audio recordings to a timestamped Markdown transcript, locally, with Faster-Whisper (preferred) or OpenAI Whisper. Runs from GitHub Copilot in PowerShell.

Summaries, minutes, and action items are not part of this skill; use the `transcript-summary` skill on the generated transcript.

## Features

- Timestamped Markdown transcript with metadata (file, language, engine, date)
- 99 languages with auto-detection
- Local processing, no cloud uploads or API keys
- Formats: MP3, WAV, M4A, OGG, FLAC, WEBM, MP4 (ffmpeg for conversion)
- Output name `transcript-YYYYMMDD-HHMMSS.md`, so earlier runs are never overwritten

## Installation

```powershell
.\scripts\install-requirements.ps1                  # installs engine + pre-downloads the 'base' model
.\scripts\install-requirements.ps1 -Model small     # pre-download a different model
.\scripts\install-requirements.ps1 -SkipModelDownload
```

Requires Python 3.10+. The installer falls back to `openai-whisper` if Faster-Whisper cannot be installed. ffmpeg is optional: `winget install Gyan.FFmpeg`.

Linux/macOS users can use `scripts/install-requirements.sh`.

## Usage

From Copilot:

```
transcribe audio to markdown: meeting.mp3
```

Directly:

```powershell
python .\scripts\transcribe.py meeting.mp3 --model small --output-dir .\out
```

Or the example wrapper:

```powershell
.\examples\basic-transcription.ps1 -AudioFile meeting.mp3 -Model small
```

| Option | Default | Description |
|--------|---------|-------------|
| `--model` | `base` | `tiny`, `base`, `small`, `medium`, `large` |
| `--output-dir` | `.` | Where the transcript is written |

## Output

```markdown
# Audio Transcription

**File:** team-standup.mp3
**Language:** EN
**Engine:** faster-whisper
**Date:** 2026-02-02 14:35:21

---

## Full Transcription

**[00:12 → 00:45]**  
Good morning everyone. Let's start with updates from the frontend team.
```

## Troubleshooting

| Problem | Fix |
|---------|-----|
| No transcription engine | Run `scripts\install-requirements.ps1` |
| Unsupported format | Install ffmpeg: `winget install Gyan.FFmpeg` |
| Slow processing | Use `--model tiny` or `base` |
| Inaccurate text | Use `--model medium` or `large`; improve audio quality |
| Model download blocked by proxy | The scripts use `truststore`, so the Windows certificate store applies |

## Metadata

| Field | Value |
|-------|-------|
| Version | 2.0.0 |
| Category | content |
| Tags | audio, transcription, whisper, speech-to-text |
