// Record the GK Sandakan driver app (pemandu.html) as a 1080x1920 9:16 video.
// node rakam.js pemandu.html outDir   -> outDir/frames + outDir/list.txt (ffmpeg concat)
const { chromium } = require('playwright'); const fs = require('fs'); const path = require('path');
(async () => {
  const [html, out] = process.argv.slice(2);
  fs.mkdirSync(out + '/frames', { recursive: true });
  const b = await chromium.launch();
  const p = await b.newPage({ viewport: { width: 360, height: 640 }, deviceScaleFactor: 3, hasTouch: true });
  await p.goto('file://' + path.resolve(html)); await p.waitForLoadState('networkidle');
  // tap indicator
  await p.addStyleTag({ content: `.tap{position:fixed;width:44px;height:44px;margin:-22px 0 0 -22px;border-radius:50%;background:rgba(0,0,0,.25);border:2px solid rgba(255,255,255,.9);pointer-events:none;z-index:9999;animation:tp .5s ease-out forwards}@keyframes tp{from{transform:scale(.5);opacity:1}to{transform:scale(1.3);opacity:0}}` });
  const tap = async sel => {
    const el = p.locator(sel).first(); const bb = await el.boundingBox();
    const x = bb.x + bb.width / 2, y = bb.y + bb.height / 2;
    await p.evaluate(([x, y]) => { const d = document.createElement('div'); d.className = 'tap'; d.style.left = x + 'px'; d.style.top = y + 'px'; document.body.appendChild(d); setTimeout(() => d.remove(), 600); }, [x, y]);
    await p.mouse.click(x, y);
  };
  const wait = ms => new Promise(r => setTimeout(r, ms));
  let shots = [], running = true, i = 0;
  const loop = (async () => { while (running) { const t = Date.now(); const f = `${out}/frames/f${String(i++).padStart(5, '0')}.jpg`; await p.screenshot({ path: f, type: 'jpeg', quality: 92 }); shots.push([f, t]); } })();
  await wait(700);
  await tap('#phoneInput'); await p.keyboard.type('12-345 6789', { delay: 45 }); await wait(300);
  await tap('#loginScreen .btn-primary'); await wait(1100);
  await tap('#goOnlineBtn'); await wait(900);
  await tap('#homeScreen .nav-item[data-screen="offersScreen"]'); await wait(700);
  await p.evaluate(() => { clearTimeout(state.searchTimer); showIncomingOffer(); }); await wait(1400);
  await tap('.offer-accept'); await wait(1700);
  await tap('.active-complete-btn'); await wait(1500);
  await tap('#homeScreen .nav-item[data-screen="earningsScreen"]'); await wait(1500);
  running = false; await loop; await b.close();
  const lines = shots.map(([f, t], k) => `file '${path.resolve(f)}'\nduration ${(((shots[k + 1] || [0, t + 80])[1] - t) / 1000).toFixed(3)}`);
  fs.writeFileSync(out + '/list.txt', lines.join('\n') + `\nfile '${path.resolve(shots.at(-1)[0])}'\n`);
  console.log(shots.length, 'frames', ((shots.at(-1)[1] - shots[0][1]) / 1000).toFixed(1), 's');
})();
