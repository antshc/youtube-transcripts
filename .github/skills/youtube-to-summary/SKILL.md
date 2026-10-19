---
name: youtube-to-summary
description: 'End-to-end pipeline that turns a YouTube URL into a transcript and a structured summary, then deletes the downloaded audio. Use when the user shares a YouTube URL and wants it transcribed and summarized, or asks for a video summary from a link.'
argument-hint: 'YouTube video URL, with an optional output folder'
---

# YouTube to Summary

Orchestrates three existing skills, in order, and cleans up afterwards:

1. `youtube` — download the audio and read the metadata.
2. `audio-transcriber` — transcribe the audio to a timestamped Markdown transcript.
3. `transcript-summary` — write the summary from that transcript.

Follow each skill's own instructions for its step; this skill only defines the sequence, file naming, and cleanup. Use whatever shell and file tools the current platform provides.

## Inputs

- `URL` — the YouTube video URL (required).
- `OutDir` — where to save results. Default: the current workspace root.

For a playlist URL, ask whether to process one video or all, and run the pipeline once per video.

## Procedure

### 1. Prepare

- Confirm `yt-dlp` is available; if not, follow the `youtube` skill's Install section.
- Create a new, empty scratch directory in the operating system's temporary location, with a unique name. All downloaded audio goes here so cleanup cannot touch anything else. Remember its path as `WORK`.

### 2. Get metadata

Ask `yt-dlp` for the video ID, title, and uploader of the single video (no playlist expansion), as described in the `youtube` skill. Keep them for the summary header.

Build a safe file base name (`BASE`) from the title: replace characters that are invalid in file names on any platform (`\ / : * ? " < > |`) with `_`, and trim trailing dots and spaces.

### 3. Download audio

Use the `youtube` skill's audio-only download (mp3) for the single video, with the output file written inside `WORK` as `audio.mp3`.

This requires `ffmpeg`. If it is missing, tell the user to install it (see the `youtube` skill's Install section), run step 6, and stop. On 403 errors apply the `youtube` skill's Troubleshooting steps.

### 4. Transcribe

Run the `audio-transcriber` skill on `WORK/audio.mp3`, with its output directory set to `WORK`. Then move the generated `transcript-*.md` file (the most recent one) from `WORK` to `OutDir`, renaming it `BASE_transcript.md`.

Use a larger model (`small`, `medium`) only if the user wants higher accuracy. If no transcription engine is installed, follow the `audio-transcriber` skill's engine setup step.

### 5. Summarize

Run the `transcript-summary` skill on `OutDir/BASE_transcript.md`, passing the video URL and title so timestamps become clickable `https://www.youtube.com/watch?v=VIDEO_ID&t=SECONDSs` links. Save the result as `OutDir/BASE_summary.md`.

### 6. Remove the audio

Always do this, including when an earlier step failed, so no audio is left behind: delete the `WORK` directory and everything in it, then confirm it no longer exists.

Delete only `WORK` — never the transcript or summary, and never audio files the user supplied.

### 7. Report

State the transcript path, the summary path, and that the audio was removed. If any step failed, say which one and that the audio was still cleaned up.

## Notes

- The transcript is kept next to the summary so the summary's claims can be checked against it.
- Do not overwrite existing `_transcript.md` or `_summary.md` files without asking.
