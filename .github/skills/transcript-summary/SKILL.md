---
name: transcript-summary
description: 'Create deep, structured summaries from YouTube or audio transcripts. Use for video summaries, transcript analysis, extracting theses, practical takeaways, or timestamped notes.'
argument-hint: 'Transcript path, with an optional video URL or title'
---

# Transcript Summary

Turn a transcribed video or audio source into a clear, detailed, example-rich Markdown summary. Use the source transcript as the authority; do not fill gaps with assumed content.

## Procedure

1. Read the transcript, and note its title, speaker, source URL, and available timestamps. Use metadata only when supplied or directly available in the workspace.
2. Identify the central argument, distinct theses, supporting reasoning, examples, caveats, and practical recommendations. Consolidate repetition without losing meaningful nuance.
3. Write the summary using the following sections:

### Executive Summary

Write about one page of concise narrative prose, not bullets. Cover the central theme, key insights and implications, main lessons, and connection to real-world practice or decisions.

### Core Theses: Deep Insights and Real-World Anchors

For each major thesis, use a short, memorable quoted principle as its heading. Explain its meaning and significance, the reasoning or mechanism behind it, and include two or three concrete examples from different domains when the source supports them. Clearly label any examples that are applications or extrapolations rather than examples stated in the transcript. Add a caution or counterpoint when it improves accuracy. Do not invent theses or force a fixed number.

### Easy-Recall: Actionable Insights for Practice

Give concise, practical bullets. Include relevant best practices, pitfalls, trade-offs, rules of thumb, memorable phrases, or if-then decision guidance. Use only categories that fit the source; phrase actions directly and preserve any conditions or limitations.

### Key Points with Timestamps

List the main insights in chronological order, each with a timestamp and a short description. Use timestamps from the transcript. Never guess or manufacture timestamps; if the source has none, say that timestamps were not available.

When the source is a YouTube video and its URL or video ID is known, make each timestamp a clickable link that opens the video at that moment: convert the timestamp to total seconds and link to `https://www.youtube.com/watch?v=VIDEO_ID&t=SECONDSs` (for example, `[12:34](https://www.youtube.com/watch?v=VIDEO_ID&t=754s)`; `1:02:03` becomes `t=3723s`). If the URL already has other query parameters, append `&t=SECONDSs` and replace any existing `t=`. Strip playlist or tracking parameters only when they interfere. If the video URL is not available, use plain-text timestamps.

4. Include the video title or source link and transcript filename at the top when available. Omit unavailable metadata rather than leaving placeholders.
5. Return the result as Markdown. Save it to a file only when asked, using the requested path and format.
6. Before finishing, check that all four sections are present, claims are grounded in the transcript, extrapolated examples are identified, and timestamps are accurate (and linked with correct seconds when the YouTube URL is known) or explicitly unavailable.