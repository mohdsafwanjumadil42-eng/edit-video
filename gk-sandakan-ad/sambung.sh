#!/usr/bin/env bash
# Join the live-action GKCAR clip: your clip (booking + car arriving ONLY) + continuation clip(s) -> 7s 9:16.
# Note: the original clip after 6.0s shows the woman going to the DRIVER's door (wrong) - not used.
# Usage: ./sambung.sh sambungan_A.mp4 [sambungan_B.mp4]
set -euo pipefail
cd "$(dirname "$0")"
SRC=source/klip_tempah_gk.mp4; A="$1"; B="${2:-}"; OUT=gkcar_live_action_7s.mp4
V="scale=1080:1920:force_original_aspect_ratio=increase:flags=lanczos,crop=1080:1920,setsar=1,fps=24,format=yuv420p"
dur() { ffprobe -v error -show_entries format=duration -of csv=p=0 "$1"; }
# Part 1 (2.3 s): select a driver (2.5-3.3) + car approaching (4.5-6.0), cut before she reaches the car
INPUTS=(-i "$SRC" -i "$A"); FC="[0:v]trim=2.5:3.3,setpts=PTS-STARTPTS,$V[p1];[0:v]trim=4.5:6.0,setpts=PTS-STARTPTS,$V[p2];"
if [[ -n "$B" ]]; then
  INPUTS+=(-i "$B"); DA=$(dur "$A"); DB=$(dur "$B")
  # Remaining 4.7 s split between A (2.6 s) and B (2.1 s), sped up/slowed to fit
  FA=$(python3 -c "print($DA/2.6)"); FB=$(python3 -c "print($DB/2.1)")
  FC+="[1:v]setpts=(PTS-STARTPTS)/$FA,$V,trim=0:2.6[p3];[2:v]setpts=(PTS-STARTPTS)/$FB,$V,trim=0:2.1[p4];[p1][p2][p3][p4]concat=n=4:v=1:a=0"
else
  DA=$(dur "$A"); FA=$(python3 -c "print($DA/4.7)")
  FC+="[1:v]setpts=(PTS-STARTPTS)/$FA,$V,trim=0:4.7[p3];[p1][p2][p3]concat=n=3:v=1:a=0"
fi
FC+=",fade=t=in:d=0.2,fade=t=out:st=6.6:d=0.4[v];[0:a]atrim=2.5,asetpts=PTS-STARTPTS,apad,atrim=0:7,afade=t=in:d=0.2,afade=t=out:st=6.3:d=0.7[a]"
ffmpeg -y -loglevel error "${INPUTS[@]}" -filter_complex "$FC" -map "[v]" -map "[a]" -c:v libx264 -crf 18 -c:a aac -t 7 -movflags +faststart "$OUT"
echo "Done: $OUT"
