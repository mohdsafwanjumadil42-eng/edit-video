# GKCAR – Live-action clip: passenger sits in the FRONT LEFT seat

> ⚠️ Do NOT use the last frame of the old clip as a start frame — in that clip the woman goes to the **DRIVER's door (right)**.
> Use **text-to-video** with the prompt below.

**Settings:** 9:16, 1080x1920, 24 fps, 5 s, photorealistic. Auto captions OFF.
Tools: Google Veo 3 / Flow, Kling 2.x, Runway Gen-4, Hailuo.

## Logic of the scene (Malaysia = drive on the LEFT, steering wheel on the RIGHT)
- The car stops at the **left kerb**. The **passenger's** door (front left) faces the **sidewalk**.
- The **driver's** door (right) faces the **road** → the passenger must NOT go to that side.
- The camera is on the **sidewalk**, so the front door closest to the camera = the passenger's door, and the driver is visible **across from it** (behind the empty passenger seat).

## Prompt (copy as-is)

Photorealistic live-action commercial, real Malaysian actors, real vehicles, realistic Sandakan streets. Absolutely no cartoon, no animation, no illustration, no 3D characters.

Malaysia, right-hand-drive car, traffic drives on the LEFT. A silver compact hatchback with a white roof sign pulls up and stops at the LEFT kerb beside the sidewalk in front of colourful Sandakan shophouses. The camera stands ON THE SIDEWALK, looking at the car's LEFT side. The driver, a Malaysian man in a green and white polo shirt, sits on the FAR side of the car (the right-hand driver's seat, steering wheel on the right), seen through the EMPTY front passenger seat nearest the camera.

A young Malay woman in a sage-green hijab, green blouse and black trousers walks along the SIDEWALK to the FRONT LEFT PASSENGER DOOR (the door closest to the sidewalk and the camera, the seat next to the driver, NOT the driver's door). She opens it, gets in and sits in the FRONT PASSENGER SEAT beside the driver, then pulls the front passenger door closed.

Cut to a shot through the windshield from the front: driver on the RIGHT behind the steering wheel, passenger on the LEFT, both side by side in the FRONT ROW, rear seat empty. She fastens her seatbelt, they exchange a friendly smile, and the driver pulls away driving on the LEFT side of the road.

Natural movement, real skin texture, accurate hands, overcast natural daylight, handheld commercial camera feel, shallow depth of field, green and white color grade. No text, no subtitles, no new logos, no watermark.

## Negative prompt
```
cartoon, animation, illustration, 3D render, CGI characters, anime, painting,
passenger opens the driver's door, passenger walks to the road side, passenger on the right, passenger in the driver's seat,
two people at the steering wheel, rear seat passenger, sitting in back seat, opening rear door, left-hand-drive,
steering wheel on the left, driving on the right side of the road, text, subtitles, captions, new logos, watermark,
readable license plate, distorted hands, extra fingers, face morphing, car morphing
```

## If one shot is too hard for the tool, split it into 2 clips
1. **Clip A (3 s):** from the sidewalk: she opens the front LEFT door (the driver is visible across, on the right), sits beside the driver, closes the door.
2. **Clip B (2–3 s):** through the windshield: driver on the right, passenger on the front left, seatbelt, smile, car pulls away.

**Check before using:** the steering wheel must be on the RIGHT and the woman must be on the LEFT of the driver. If not, regenerate.

Then run: `./sambung.sh clipA.mp4 [clipB.mp4]`  
(The script only uses the app booking part + the GK car approaching from your clip — the part where she goes to the driver's door is cut.)
