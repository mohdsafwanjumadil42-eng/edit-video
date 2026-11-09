# GK Sandakan – 7s Vertical Ad (9:16) — AI Video Generation Pack

Use with a text/image-to-video model (Google Veo 3, Kling 2.x, Runway Gen-4, Sora).
Settings: **9:16 vertical, 1080x1920, 24 fps, 7–8 s, photorealistic**. Turn OFF any auto-captions / text.

---

## 1. Master prompt (single-generation, copy-paste)

> Ultra-realistic cinematic commercial, vertical 9:16, 7 seconds, shot on ARRI Alexa, 35mm anamorphic look, shallow depth of field, warm golden-hour light, Sandakan, Sabah, Malaysia.
> A clean white compact sedan with subtle green accent stripes, **right-hand-drive Malaysian car, driving on the left side of the road**, pulls up at a roadside curb on a palm-lined seafront street with tropical green hills, shophouses and the Sulu Sea in the background.
> A friendly Malaysian driver (Malay man, early 30s, neat green polo shirt) sits in the **RIGHT-hand driver's seat** behind the steering wheel on the right.
> A young Malaysian woman passenger (late 20s, casual smart clothing, small handbag) walks to the **LEFT FRONT passenger door**, opens the **front** door, and sits in the **front passenger seat directly beside the driver**. She pulls the **front passenger door closed**.
> Interior shot from the windshield looking in: driver on the RIGHT, passenger on the LEFT, **both seated side by side in the front row**, rear seat empty. They exchange a warm smile and nod.
> Driver checks the mirror and smoothly drives away along the coastal road; car exits frame, warm lens flare.
> Natural human movement, realistic skin texture, accurate hands, real Malaysian faces, professional color grade with green and white tones.
> No text, no subtitles, no captions, no logos, no watermarks, no license-plate characters.

## 2. Negative prompt
```
rear seat passenger, passenger in back seat, sitting behind driver, left-hand-drive, steering wheel on left,
driving on right side of road, opening rear door, text, subtitles, captions, letters, logos, brand marks,
watermark, readable license plate, distorted hands, extra fingers, warped faces, cartoon, CGI look,
plastic skin, morphing car, flickering, slow motion artifacts
```

## 3. Shot-by-shot (if your tool supports multi-shot / you generate clips separately)

| # | Time | Shot | Prompt focus |
|---|------|------|--------------|
| 1 | 0.0–1.5s | Wide, low angle, front-left 3/4 of car | White/green RHD sedan glides to the LEFT curb on a Sandakan seafront road at golden hour; driver visible on the RIGHT through windshield. |
| 2 | 1.5–3.0s | Medium, outside, left side of car | Malaysian woman opens the **FRONT LEFT passenger door** (not rear), smiles, steps in. |
| 3 | 3.0–4.0s | Close-up, outside | Her hand pulls the **front passenger door** shut; satisfying close, reflection of palm trees on the white paint. |
| 4 | 4.0–5.5s | Interior, through windshield (dash cam angle) | Driver on RIGHT behind wheel, passenger on LEFT front seat, side by side; seatbelts on; warm smile exchange. Rear seat empty. |
| 5 | 5.5–7.0s | Wide tracking, rear 3/4 | Car pulls away driving on the LEFT side of the coastal road toward the hills, gentle lens flare. Leave the last 1s clean for your real logo end card. |

**Tip for seating accuracy:** generate Shot 4 first as a still image (Midjourney/Imagen/Flux) showing the exact
seating, verify it, then use it as the **image-to-video start frame**. This is the most reliable way to stop
models from putting the passenger in the back.

## 4. Branding
- Do **not** let the model render the logo. Add your **official GK Sandakan logo** in post with `finish.sh`.
- Brand colors are carried by the car accent, driver's polo and the grade (green + white).
