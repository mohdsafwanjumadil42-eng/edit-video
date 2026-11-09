#!/usr/bin/env bash
# Finish an AI-generated clip: force 1080x1920 9:16, trim to 7s, optional real logo end card + audio.
# Usage: ./finish.sh input.mp4 [logo.png] [music.mp3]   -> output: gk_sandakan_ad_7s.mp4
set -euo pipefail
IN="$1"; LOGO="${2:-}"; MUSIC="${3:-}"; OUT="gk_sandakan_ad_7s.mp4"
VF="scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,fps=24,trim=0:7,setpts=PTS-STARTPTS,fade=t=out:st=6.6:d=0.4"
ARGS=(-y -i "$IN")
if [[ -n "$LOGO" ]]; then
  ARGS+=(-loop 1 -t 7 -i "$LOGO")
  FC="[0:v]${VF}[v];[1:v]scale=600:-1,format=rgba,fade=t=in:st=5.8:d=0.4:alpha=1[l];[v][l]overlay=(W-w)/2:H-h-260:shortest=1[out]"
else
  FC="[0:v]${VF}[out]"
fi
AMAP=(-an)
if [[ -n "$MUSIC" ]]; then
  IDX=$([[ -n "$LOGO" ]] && echo 2 || echo 1)
  ARGS+=(-i "$MUSIC"); FC="$FC;[$IDX:a]atrim=0:7,afade=t=out:st=6.3:d=0.7[a]"; AMAP=(-map "[a]" -c:a aac -b:a 192k)
fi
ffmpeg "${ARGS[@]}" -filter_complex "$FC" -map "[out]" "${AMAP[@]}" -c:v libx264 -crf 18 -pix_fmt yuv420p -t 7 -movflags +faststart "$OUT"
echo "Wrote $OUT"
