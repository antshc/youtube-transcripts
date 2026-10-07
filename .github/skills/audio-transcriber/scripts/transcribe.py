#!/usr/bin/env python3
"""
Audio Transcriber v2.0.0
Transcribes audio to a timestamped Markdown transcript using Whisper.
"""

import os
import sys
import argparse
from datetime import datetime
from pathlib import Path

try:
    import truststore
    truststore.inject_into_ssl()
except ImportError:
    pass

try:
    from rich.console import Console
    from tqdm import tqdm
except ImportError:
    print("Missing dependencies. Run scripts/install-requirements.ps1")
    sys.exit(1)

# Whisper engines
try:
    from faster_whisper import WhisperModel
    TRANSCRIBER = "faster-whisper"
except ImportError:
    try:
        import whisper
        TRANSCRIBER = "whisper"
    except ImportError:
        print("No transcription engine found. Run scripts/install-requirements.ps1")
        sys.exit(1)

console = Console()


def transcribe_audio(audio_file, model="base"):
    """
    Transcribes audio using Whisper with a progress bar.

    Returns:
        dict: {language, duration, segments: [{start, end, text}]}
    """
    console.print(f"\n[cyan]Transcribing audio with {TRANSCRIBER} (model: {model})...[/cyan]")

    try:
        if TRANSCRIBER == "faster-whisper":
            model_obj = WhisperModel(model, device="cpu", compute_type="int8")
            segments, info = model_obj.transcribe(
                audio_file,
                language=None,
                vad_filter=True,
                word_timestamps=True
            )

            data = {
                "language": info.language,
                "language_probability": round(info.language_probability, 2),
                "duration": info.duration,
                "segments": []
            }

            # Segments is a lazy generator; the progress bar tracks decoding.
            for segment in tqdm(segments, desc="Segments", unit="seg"):
                data["segments"].append({
                    "start": round(segment.start, 2),
                    "end": round(segment.end, 2),
                    "text": segment.text.strip()
                })

        else:  # original whisper
            model_obj = whisper.load_model(model)
            result = model_obj.transcribe(audio_file, word_timestamps=True)

            data = {
                "language": result["language"],
                "duration": result["segments"][-1]["end"] if result["segments"] else 0,
                "segments": [
                    {"start": s["start"], "end": s["end"], "text": s["text"].strip()}
                    for s in result["segments"]
                ]
            }

        console.print(f"[green]Transcription complete. Language: {data['language'].upper()}[/green]")
        console.print(f"[dim]{len(data['segments'])} segments processed[/dim]")

        return data

    except Exception as e:
        console.print(f"[red]Transcription error: {e}[/red]")
        sys.exit(1)


def build_transcript_markdown(data, audio_file):
    """Builds the Markdown transcript with metadata and timestamped segments."""
    lines = [
        "# Audio Transcription",
        "",
        f"**File:** {Path(audio_file).name}",
        f"**Language:** {data['language'].upper()}",
        f"**Engine:** {TRANSCRIBER}",
        f"**Date:** {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}",
        "",
        "---",
        "",
        "## Full Transcription",
        "",
    ]

    for seg in data["segments"]:
        start = f"{int(seg['start'] // 60):02d}:{int(seg['start'] % 60):02d}"
        end = f"{int(seg['end'] // 60):02d}:{int(seg['end'] % 60):02d}"
        lines.append(f"**[{start} → {end}]**  ")
        lines.append(seg["text"])
        lines.append("")

    return "\n".join(lines)


def save_transcript(transcript_text, output_dir="."):
    """Saves the transcript to transcript-<timestamp>.md and returns its path."""
    timestamp = datetime.now().strftime("%Y%m%d-%H%M%S")
    transcript_path = Path(output_dir) / f"transcript-{timestamp}.md"
    transcript_path.parent.mkdir(parents=True, exist_ok=True)

    with open(transcript_path, "w", encoding="utf-8") as f:
        f.write(transcript_text)

    console.print(f"[green]Transcript saved:[/green] {transcript_path}")
    return str(transcript_path)


def main():
    parser = argparse.ArgumentParser(description="Audio Transcriber v2.0.0")
    parser.add_argument("audio_file", help="Audio file to transcribe")
    parser.add_argument("--model", default="base", help="Whisper model (tiny/base/small/medium/large)")
    parser.add_argument("--output-dir", default=".", help="Output directory")

    args = parser.parse_args()

    if not os.path.exists(args.audio_file):
        console.print(f"[red]File not found: {args.audio_file}[/red]")
        sys.exit(1)

    data = transcribe_audio(args.audio_file, model=args.model)
    transcript_text = build_transcript_markdown(data, args.audio_file)
    save_transcript(transcript_text, args.output_dir)


if __name__ == "__main__":
    main()
