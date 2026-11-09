// node render.js scene.html outDir fps seconds
const { chromium } = require('playwright'); const fs = require('fs'); const path = require('path');
(async () => {
  const [html, out, fps = 24, secs = 7] = process.argv.slice(2);
  fs.mkdirSync(out, { recursive: true });
  const b = await chromium.launch(); const p = await b.newPage({ viewport: { width: 1080, height: 1920 } });
  await p.goto('file://' + path.resolve(html));
  const n = Math.round(fps * secs);
  for (let i = 0; i < n; i++) {
    const d = await p.evaluate(t => { render(t); return document.getElementById('c').toDataURL('image/jpeg', .95); }, i / fps);
    fs.writeFileSync(`${out}/f${String(i).padStart(4, '0')}.jpg`, Buffer.from(d.split(',')[1], 'base64'));
  }
  await b.close();
})();
