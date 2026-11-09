# GKCAR – Continuation clip (live action) – passenger sits in the FRONT SEAT

**Mode:** Image-to-video. **Start frame:** `start_frame_pintu_depan.png` (last frame of your clip).
**Settings:** 9:16, 1080x1920, 24 fps, 5 s, photorealistic. Auto captions OFF.
Suitable tools: Google Veo 3 / Flow, Kling 2.x (image-to-video), Runway Gen-4, Hailuo.

---

## Prompt (copy as-is)

Photorealistic live-action commercial, real Malaysian actors, real vehicles, realistic Sandakan streets. Absolutely no cartoon, no animation, no illustration, no 3D characters.

Continue exactly from the start frame. The same young Malay woman in a sage-green hijab, green blouse and black trousers stands at the open FRONT LEFT passenger door of the silver hatchback with a white roof sign. She smiles, lowers her head and gets into the FRONT PASSENGER SEAT, sitting directly beside the driver. The driver, a Malaysian man in a green and white polo shirt, sits in the RIGHT-hand driver's seat behind the steering wheel on the right (Malaysian right-hand-drive car). She pulls the FRONT passenger door closed with her right hand.

Cut to a shot through the windshield from the front of the car: driver on the RIGHT holding the steering wheel, passenger on the LEFT in the front seat, both in the FRONT ROW side by side, rear seat empty. She fastens her seatbelt; they exchange a friendly nod and smile. The driver checks the mirror, signals and pulls away smoothly, driving on the LEFT side of the road past colourful Sandakan shophouses.

Natural movement, real skin texture, accurate hands, natural overcast daylight matching the start frame, handheld commercial camera feel, shallow depth of field, green and white color grade. No text, no subtitles, no new logos, no watermark.

## Negative prompt
```
cartoon, animation, illustration, 3D render, CGI characters, anime, painting,
rear seat passenger, sitting in back seat, opening rear door, left-hand-drive, steering wheel on the left,
driving on the right side of the road, different woman, outfit change, text, subtitles, captions, new logos,
watermark, readable license plate, distorted hands, extra fingers, face morphing, car morphing
```

## If the tool only allows one shot at a time
1. **Clip A (start frame = start_frame_pintu_depan.png, 3 s):** she gets into the front passenger seat and closes the front door.
2. **Clip B (text-to-video or a still image, 2–3 s):** through the windshield: driver on the right, passenger in the front left seat, seatbelt, smile, car pulls away.

Then run: `./sambung.sh clipA.mp4 [clipB.mp4]`
