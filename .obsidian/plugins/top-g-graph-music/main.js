// Top G Graph Music 1.1 (by TDOD): plays a YouTube track while any Graph view is open, with an on-graph player
// (play / pause, mute, volume, off) and a graph HUD (area colour legend + "By TDOD" credit).
// Streams from YouTube (nothing is downloaded or bundled). Desktop uses a hidden <webview>, mobile an <iframe>.
const { Plugin, PluginSettingTab, Setting, Notice } = require("obsidian");

// a <webview>'s executeJavaScript throws (synchronously, uncaught) until its page is ready: before that, calls just fail
// quietly through the callers' own .catch
const guardWebview = (el) => {
  el.addEventListener("dom-ready", () => { el.tgReady = true; });
  el.executeJavaScript = (code) => {
    const fn = Object.getPrototypeOf(el).executeJavaScript;
    if (!el.tgReady || !el.isConnected || !fn) return Promise.reject(new Error("webview not ready"));
    try { return fn.call(el, code); } catch (e) { return Promise.reject(e); }
  };
  return el;
};

const TRACKS = ["DvZR7GglBSQ", "9a51n1lMF38", "-kBnCqwSO98", "2WxlAqbutu0",   // owner's picks
  "ZHqZPgcNl8Y", "cvgk7xHM1XU", "FZXyvvb5BYE"];   // mog music: MOGGED! (Phonk Killer x ZomboBox! x ShardKill), ARXMANE - mogged!, 20+ phonk edit audios mix   // the vault playlist (loops)
const DEFAULTS = { videoId: "DvZR7GglBSQ", volume: 20, introVolume: 70, enabled: true, paused: false, muted: false, legendOpen: true, hud: true };
const UI_GROUPS = [   // the gear box: [group, [[key, label], ...]]
  ["PANELS", [["areas", "Areas"], ["stats", "Stats bar"], ["community", "Community"], ["clock", "World clock"], ["ticker", "Market ticker"], ["ask", "Ask the vault"], ["warning", "Heavy-vault notice"]]],
  ["BRANDING", [["credit", "Crafted by TDOD"], ["emblem", "TD logo"], ["corners", "Frame corners"]]],
  ["MUSIC", [["music", "Music"], ["player", "Music player"]]],
  ["EFFECTS", [["bg", "3D background"], ["intro", "Intro on open"], ["engine", "Intro engine sound"], ["laugh", "Intro laugh"], ["brokie", "Intro joke line"]]],
];
const UI_PARTS = UI_GROUPS.flatMap((g) => g[1]);
const TICKER_SYMBOLS = [["FOREXCOM:SPXUSD", "S&P 500"], ["FOREXCOM:NSXUSD", "US 100"], ["FOREXCOM:DJI", "Dow 30"], ["NASDAQ:NVDA", "NVIDIA"],
  ["NASDAQ:AAPL", "Apple"], ["NASDAQ:TSLA", "Tesla"], ["NASDAQ:MSFT", "Microsoft"], ["NASDAQ:AMZN", "Amazon"], ["NASDAQ:META", "Meta"],
  ["NASDAQ:GOOGL", "Alphabet"], ["NYSE:RBLX", "Roblox"], ["BITSTAMP:BTCUSD", "Bitcoin"], ["BITSTAMP:ETHUSD", "Ethereum"], ["OANDA:XAUUSD", "Gold"], ["FX_IDC:EURUSD", "EUR/USD"]];
// live market ticker tape: TradingView's free embeddable widget (read-only; keep the attribution link)
const TICKER_HTML = '<!doctype html><html><head><meta charset="utf-8"><style>html,body{margin:0;background:transparent;overflow:hidden;font-family:Segoe UI,sans-serif}'
  + '.tradingview-widget-copyright{font-size:10px;text-align:right;padding-right:10px;line-height:14px}.tradingview-widget-copyright a{color:#6f86a6;text-decoration:none}</style></head><body>'
  + '<div class="tradingview-widget-container"><div class="tradingview-widget-container__widget"></div>'
  + '<div class="tradingview-widget-copyright"><a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank">Market data by TradingView</a></div>'
  + '<script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-ticker-tape.js" async>'
  + JSON.stringify({ symbols: TICKER_SYMBOLS.map(([proName, title]) => ({ proName, title })), showSymbolLogo: true, isTransparent: true, displayMode: "adaptive", colorTheme: "dark", locale: "en" })
  + '</scr' + 'ipt></div></body></html>';
const CLOCKS = [["LOCAL", ""], ["LOS ANGELES", "America/Los_Angeles"], ["NEW YORK", "America/New_York"], ["LONDON", "Europe/London"], ["DUBAI", "Asia/Dubai"], ["TOKYO", "Asia/Tokyo"]];
const LAUGH_ID = "mOAtoqlB1hc";   // laugh (0-10 s)
const BROKIE_ID = "_f_Wd8PQCf0", BROKIE_START = 0;   // YouTube: "Andrew Tate you're a brokie" (5 s from BROKIE_START); laugh = "Andrew tate laugh for 1 hour"
const DISCORDS = [   // the Community panel: 2 Discord servers + the owner's YouTube
  { name: "TOP G", sub: "Discord server", url: "https://discord.gg/xugZVyyX2K", kind: "discord", icon: "topg-chip.svg" },
  { name: "TDOD COMMUNITY", sub: "Discord server", url: "https://discord.gg/uA3SpahkM2", logo: true, kind: "discord" },
  { name: "TDOD", sub: "YouTube · @TDODYT", url: "https://www.youtube.com/@TDODYT", logo: true, kind: "youtube", go: "SUBSCRIBE" },
  { name: "TDOD", sub: "TikTok · @tdodyt", url: "https://www.tiktok.com/@tdodyt", logo: true, kind: "tiktok", go: "FOLLOW" },
];

function parseId(text) {
  const m = String(text).match(/(?:youtu\.be\/|v=|embed\/)([A-Za-z0-9_-]{11})/);
  return m ? m[1] : String(text).trim();
}

module.exports = class TopGGraphMusic extends Plugin {
  async onload() {
    this.settings = Object.assign({}, DEFAULTS, await this.loadData());
    this.player = null;
    this.state = "";
    this.groups = [];
    const sync = () => this.sync();
    this.app.workspace.onLayoutReady(async () => { await this.loadGroups(); sync(); });
    this.registerEvent(this.app.workspace.on("layout-change", sync));
    this.registerEvent(this.app.workspace.on("active-leaf-change", sync));
    this.ribbon = this.addRibbonIcon("music", "Graph music on/off", () => this.toggle());
    this.addCommand({ id: "toggle-graph-music", name: "Toggle graph music", callback: () => this.toggle() });
    this.addCommand({ id: "pause-graph-music", name: "Pause / resume graph music", callback: () => this.togglePause() });
    this.addCommand({ id: "mute-graph-music", name: "Mute / unmute graph music", callback: () => this.toggleMute() });
    this.addCommand({ id: "graph-music-volume-up", name: "Graph music volume up", callback: () => this.changeVolume(10) });
    this.addCommand({ id: "graph-music-volume-down", name: "Graph music volume down", callback: () => this.changeVolume(-10) });
    this.addCommand({ id: "replay-graph-intro", name: "Replay the graph intro", callback: () => {
      const host = this.graphLeaves().map((l) => l.view && l.view.containerEl && l.view.containerEl.querySelector(".view-content")).find((h) => h && h.offsetParent);
      if (!host) { new Notice("Open the graph first"); return; }
      if (host.querySelector(".tg-intro") || this.introEnd) return;   // one intro (and one set of its sounds) at a time
      delete host.dataset.tgIntro; this.introPlayed = true; this.playIntro(host);
    } });
    this.addSettingTab(new MusicSettings(this.app, this));
    this.status = this.addStatusBarItem();
    this.status.addClass("tg-music-status");
    this.status.setText("");
    this.status.onClickEvent(() => this.togglePause());
    this.registerInterval(window.setInterval(() => this.poll(), 2000));
    this.registerInterval(window.setInterval(() => this.tickClocks(), 1000));
  }

  log(msg) { if (this.settings && this.settings.debug) console.log("[top-g-graph-music] " + msg); }   // console only (no log file ships)

  async save() { await this.saveData(this.settings); this.renderHuds(); }

  // the vault's graph colour groups (Settings > Graph > Groups) = the legend
  async loadGroups() {
    try {
      const g = JSON.parse(await this.app.vault.adapter.read(this.app.vault.configDir + "/graph.json"));
      // colour groups can be whole areas ("02 Game Design and Economy") or sub-clusters ("02 .../Foundations Planning/"):
      // the legend shows one row per top-level area, with every colour used inside it as a swatch strip
      const areas = new Map();
      for (const c of g.colorGroups || []) {
        const m = String(c.query).match(/path:"?([^"]+)"?/);
        const full = (m ? m[1] : "").replace(/\/+$/, "");
        const top = full.split("/")[0];
        if (!top) continue;
        const color = "#" + (c.color.rgb >>> 0).toString(16).padStart(6, "0");
        if (!areas.has(top)) areas.set(top, { path: top, name: top.replace(/^\d+\s+/, ""), color, colors: [], count: 0 });
        const a = areas.get(top);
        if (!full.includes("/")) a.color = color;
        if (!a.colors.includes(color)) a.colors.push(color);
      }
      this.groups = [...areas.values()].sort((a, b) => a.path.localeCompare(b.path, undefined, { numeric: true }));
    } catch (e) { this.groups = []; }
    this.countStats();
    this.registerEvent(this.app.metadataCache.on("resolved", () => { this.countStats(); this.renderHuds(); }));
  }

  // notes per area + vault totals for the HUD (cheap: one pass over the file list and the resolved-links map)
  countStats() {
    const files = this.app.vault.getMarkdownFiles();
    for (const g of this.groups) g.count = g.path ? files.filter((f) => f.path.startsWith(g.path + "/")).length : 0;
    let links = 0;
    const rl = this.app.metadataCache.resolvedLinks || {};
    for (const k in rl) links += Object.keys(rl[k]).length;
    const key = files.length + "/" + links + "/" + this.groups.map((g) => g.count).join(",");
    this.stats = { notes: files.length, links, areas: this.groups.length };
    this.maxCount = Math.max(1, ...this.groups.map((g) => g.count));
    if (key === this.statsKey) return;
    this.statsKey = key;
    this.removeHuds();          // rebuilt with the new numbers
    this.ensureHuds();
  }

  // status bar + the player cards; keeps the track playing unless the user paused it
  poll() {
    const p = this.player;
    if (!p) { this.setState(this.settings.enabled ? "" : "off"); return; }
    if (p.tagName.toLowerCase() !== "webview") { this.setState(this.settings.paused ? "paused" : "playing"); return; }
    const keep = this.settings.paused ? "if(y&&y.pauseVideo)y.pauseVideo();m.pause();" : "if(m.paused&&!m.ended){if(y&&y.playVideo)y.playVideo();m.play&&m.play().catch(function(){});}";
    // reads the REAL volume from YouTube's own player (#movie_player) + the <video>, and puts it back if it drifted
    p.executeJavaScript(`(function(){var y=document.getElementById('movie_player')||document.querySelector('.html5-video-player');var m=document.querySelector('video');if(!m)return JSON.stringify({s:'loading'});${keep}var v=(y&&y.getVolume)?y.getVolume():Math.round(m.volume*100);var mu=(y&&y.isMuted)?y.isMuted():m.muted;var vd=(y&&y.getVideoData)?y.getVideoData():{};var ti=vd.title||'';var pl=(y&&y.getPlaylist&&y.getPlaylist())||[];return JSON.stringify({ti:ti,id:vd.video_id||'',ended:!!m.ended,pi:(y&&y.getPlaylistIndex)?y.getPlaylistIndex():-1,pl:pl.length,s:m.paused?'paused':'playing',t:Math.round(m.currentTime),v:v,mu:!!(mu||m.muted),mv:Math.round(m.volume*100)});})()`)
      .then((r) => {
        const o = JSON.parse(r);
        this.real = o;
        if (o.ti) this.trackTitle = o.ti;
        // song over: next song; after the last one, a YouTube mix of similar songs ("Similar songs after the playlist" setting)
        this.endedPolls = o.ended ? (this.endedPolls || 0) + 1 : 0;   // YouTube usually advances itself: act only if it stays ended
        if (o.ended && !this.settings.paused && this.endedPolls >= 2) {
          this.endedPolls = 0;
          if (this.settings.autoMix !== false && !this.inMix && o.pl && o.pi >= o.pl - 1 && o.id) this.startMix(o.id);
          else this.skip(1);
          return;
        }
        this.setState(o.s);
        if (o.s !== this.lastState) { this.log("state " + r); this.lastState = o.s; }
        const want = this.musicLevel();
        const real = o.mu ? 0 : Math.min(o.v, o.mv);
        if (o.s !== "loading" && Math.abs(real - want) > 2) this.setVolume(this.settings.volume);
      }).catch(() => this.setState("loading"));
  }

  setState(s) {
    this.state = s;
    const label = { playing: "♫ Top G Phonk playing", paused: "♫ paused", loading: "♫ loading", off: "Graph music off", "": "" }[s];
    this.status.setText(label === undefined ? "♫ " + s : label);
    this.renderHuds();
  }

  onunload() {
    if (this.introEnd) this.introEnd();                 // a running intro takes its clips + engine with it
    this.stop(); this.removeHuds();
    document.querySelectorAll("webview.top-g-graph-music, webview.tg-intro-clip").forEach((w) => w.remove());
  }

  async toggle() {
    this.settings.enabled = !this.settings.enabled;
    if (this.settings.enabled) this.settings.paused = false;
    await this.save();
    new Notice(`Graph music ${this.settings.enabled ? "ON" : "OFF"}`);
    this.sync();
  }

  async togglePause() {
    if (!this.settings.enabled) { await this.toggle(); return; }
    this.settings.paused = !this.settings.paused;
    await this.save();
    this.applyPause();
    this.poll();
  }

  async toggleMute() {
    this.settings.muted = !this.settings.muted;
    await this.save();
    this.setVolume(this.settings.volume);
  }

  async changeVolume(d) {
    this.settings.volume = Math.max(0, Math.min(100, this.settings.volume + d));
    if (d > 0) this.settings.muted = false;
    await this.save();
    this.setVolume(this.settings.volume);
    new Notice(`Graph music volume ${this.settings.volume}`);
  }

  graphLeaves() {
    const ws = this.app.workspace;
    return ws.getLeavesOfType("graph").concat(ws.getLeavesOfType("localgraph"));
  }

  graphOpen() { return this.graphLeaves().length > 0; }

  sync() {
    if (this.settings.enabled && this.graphOpen() && !this.holdMusic) this.play();
    else this.stop();
    this.ensureHuds();
  }

  url() {
    const ids = TRACKS.includes(this.settings.videoId) ? TRACKS : [this.settings.videoId].concat(TRACKS);
    const id = ids[0];
    return `https://www.youtube.com/embed/${id}?autoplay=1&loop=1&playlist=${ids.slice(1).concat(id).join(",")}&controls=0&enablejsapi=1&playsinline=1`;
  }

  play() {
    if (this.player) return;
    const desktop = !!(window.require && document.createElement("webview").constructor !== HTMLUnknownElement);
    // exactly one music player ever: sweep any stray copy (e.g. left by a plugin reload) before making this one
    document.querySelectorAll("webview.top-g-graph-music, iframe.top-g-graph-music").forEach((x) => x.remove());
    const el = document.createElement(desktop ? "webview" : "iframe");
    if (desktop) guardWebview(el);
    el.setAttribute("src", this.url());
    el.setAttribute("allow", "autoplay; encrypted-media");
    el.addClass("top-g-graph-music");
    el.style.cssText = "position:fixed;width:2px;height:2px;left:-10px;bottom:0;opacity:0;pointer-events:none;border:0;";
    document.body.appendChild(el);
    this.player = el;
    const ready = () => { this.setVolume(this.settings.volume); this.applyPause(); };
    this.log("play desktop=" + desktop + " " + this.url());
    if (desktop) {
      el.addEventListener("did-fail-load", (e) => this.log("fail " + e.errorCode + " " + e.errorDescription));
      el.addEventListener("console-message", (e) => { if (/error|153|150|101/i.test(e.message)) this.log("console " + e.message); });
      el.addEventListener("dom-ready", () => {
        try { el.setAudioMuted(this.settings.muted || this.settings.volume === 0); } catch (e) {}
        [500, 1500, 3000].forEach((t) => window.setTimeout(ready, t));
      });
    } else {
      el.addEventListener("load", () => [800, 2000, 4000].forEach((t) => window.setTimeout(ready, t)));
    }
  }

  // YouTube "Mix" (radio) seeded by the last song: endless similar songs
  startMix(id) {
    this.inMix = true;
    this.log("mix from " + id);
    const url = `https://www.youtube.com/embed/${id}?list=RD${id}&autoplay=1&controls=0&enablejsapi=1&playsinline=1`;
    if (this.player) { this.player.setAttribute("src", url); window.setTimeout(() => { this.setVolume(this.settings.volume); this.poll(); }, 2500); }
  }

  // playlist: next / previous song through YouTube's own player
  skip(d) {
    const p = this.player;
    if (!p || p.tagName.toLowerCase() !== "webview") return;
    p.executeJavaScript(`(function(){var y=document.getElementById('movie_player')||document.querySelector('.html5-video-player');if(y){${d > 0 ? "y.nextVideo&&y.nextVideo();" : "y.previousVideo&&y.previousVideo();"}}return !!y;})()`).catch(() => {});
    this.trackTitle = "";
    window.setTimeout(() => { this.setVolume(this.settings.volume); this.poll(); }, 1500);
  }

  applyPause() {
    const p = this.player;
    if (!p) { if (this.settings.enabled && !this.settings.paused) this.sync(); return; }
    const paused = this.settings.paused;
    if (p.tagName.toLowerCase() === "webview") {
      p.executeJavaScript(`(function(){var y=document.getElementById('movie_player')||document.querySelector('.html5-video-player');var m=document.querySelector('video');${paused ? "if(y&&y.pauseVideo)y.pauseVideo();if(m)m.pause();" : "if(y&&y.playVideo)y.playVideo();if(m&&m.play)m.play();"}return !!m;})()`).catch(() => {});
    } else {
      p.contentWindow && p.contentWindow.postMessage(JSON.stringify({ event: "command", func: paused ? "pauseVideo" : "playVideo", args: [] }), "*");
    }
  }

  // the level the music should be at right now: muted / held silent = 0; during the intro its own level (not the slider),
  // ducked under the voice lines
  musicLevel() {
    if (this.settings.muted || this.introMute) return 0;
    const base = this.introLevel != null ? this.introLevel : this.settings.volume;
    return Math.max(0, Math.min(100, Math.round(base * (this.duck ?? 1))));
  }

  setVolume() { this.renderHuds(); this.applyMusicLevel(); }

  // smooth level changes (YouTube's setVolume is instant): step a level field ("duck" or "introLevel") to its target
  rampMusic(field, to, ms, then) {
    window.clearInterval(this.ramps && this.ramps[field]);
    this.ramps = this.ramps || {};
    const from = this[field] ?? to, steps = Math.max(1, Math.round(ms / 80));
    let i = 0;
    this.ramps[field] = window.setInterval(() => {
      i++; this[field] = from + (to - from) * (i / steps);
      this.applyMusicLevel();
      if (i >= steps) { window.clearInterval(this.ramps[field]); if (then) then(); }
    }, 80);
  }

  applyMusicLevel() {
    const p = this.player;
    if (!p) return;
    const eff = this.musicLevel();
    if (p.tagName.toLowerCase() === "webview") {
      // mute = the whole webview's audio (Electron) + YouTube's player; volume = YouTube's player API + the <video> (YouTube overrides a bare video.volume)
      try { p.setAudioMuted(eff === 0); } catch (e) {}
      p.executeJavaScript(`(function(){var y=document.getElementById('movie_player')||document.querySelector('.html5-video-player');var m=document.querySelector('video');if(y&&y.setVolume){y.setVolume(${eff});if(${eff}===0){y.mute();}else{y.unMute();}}if(m){m.volume=${eff / 100};m.muted=${eff === 0};}return !!(y||m);})()`).catch(() => {});
    } else {
      p.contentWindow && p.contentWindow.postMessage(JSON.stringify({ event: "command", func: "setVolume", args: [eff] }), "*");
    }
  }

  stop() {
    this.inMix = false;
    if (this.player) { this.player.remove(); this.player = null; }
  }

  // ------------------------------------------------------------------ graph HUD: player card + legend + credit
  ensureHuds() {
    for (const leaf of this.graphLeaves()) {
      const host = leaf.view && leaf.view.containerEl && leaf.view.containerEl.querySelector(".view-content");
      if (!host) continue;
      if (!host.querySelector(".tg-hud")) this.buildHud(host);
      // the drive intro: once per Obsidian session, on the first graph you can actually see (not a background tab);
      // opening the graph again later goes straight to the graph
      if (!this.introPlayed && this.ui("intro") && host.offsetParent) { this.introPlayed = true; this.playIntro(host); }
    }
    this.renderHuds();
  }

  // area click: the graph shows only that folder (graph search path:"..."), re-centred on it; same area again / ALL = everything.
  // MIX mode (or Ctrl/Shift-click): clicks add / remove areas and the graph shows them TOGETHER (path:"A" OR path:"B" ...)
  focusArea(path, add) {
    const cur = new Set(this.activeAreas || []);
    const prevCount = cur.size;
    if (!path) cur.clear();
    else if (add || this.mixMode) { if (cur.has(path)) cur.delete(path); else cur.add(path); }
    else if (cur.size === 1 && cur.has(path)) cur.clear();
    else { cur.clear(); cur.add(path); }
    const zoom = cur.size && !prevCount ? 7 : !cur.size && prevCount ? -7 : 0;   // zoom in once when focusing, back out for ALL
    this.activeAreas = [...cur];
    this.activeArea = this.activeAreas[0] || "";
    const parts = this.activeAreas.map((p) => `path:"${p}"`);
    const q = parts.length > 1 ? "(" + parts.join(" OR ") + ")" : parts[0] || "";
    for (const leaf of this.app.workspace.getLeavesOfType("graph")) {
      const v = leaf.view;
      let done = false;
      try {   // the graph's own Filters > Search box: typing into it is what the user would do
        const s = v.dataEngine && v.dataEngine.filterOptions && v.dataEngine.filterOptions.search;
        if (s && s.inputEl) { s.inputEl.value = q; s.inputEl.dispatchEvent(new Event("input", { bubbles: true })); if (s.onChanged) s.onChanged(); done = true; }
      } catch (e) { this.log("search box " + e); }
      if (!done) {
        try { const st = v.getState(); st.options = Object.assign({}, st.options, { search: q }); v.setState(st, { history: false }); } catch (e) { this.log("setState " + e); }
      }
      if (zoom) this.zoomGraph(v, zoom);
    }
    this.renderHuds();
  }

  // zoom the graph in on an area (out again for ALL): mouse-wheel steps at the canvas centre once the layout has settled
  zoomGraph(view, steps) {
    const canvas = view.containerEl.querySelector("canvas");
    if (!canvas) return;
    const r = canvas.getBoundingClientRect();
    const cx = r.left + r.width / 2, cy = r.top + r.height / 2;
    for (let i = 0; i < Math.abs(steps); i++) {
      window.setTimeout(() => canvas.dispatchEvent(new WheelEvent("wheel", { deltaY: steps > 0 ? -120 : 120, clientX: cx, clientY: cy, bubbles: true, cancelable: true })), 700 + i * 60);
    }
  }

  // vault search for the "Ask the vault" box: words scored against note title (x4), headings (x2), tags + folder path (x1)
  askVault(q, res) {
    res.empty();
    const words = q.toLowerCase().split(/[^a-z0-9]+/).filter((w) => w.length > 1);
    if (!words.length) return;
    const hits = [];
    for (const f of this.app.vault.getMarkdownFiles()) {
      const title = f.basename.toLowerCase(), path = f.parent ? f.parent.path.toLowerCase() : "";
      const c = this.app.metadataCache.getFileCache(f) || {};
      const heads = (c.headings || []).map((h) => h.heading.toLowerCase()).join(" ");
      const tags = ((c.frontmatter && c.frontmatter.tags) || []).toString().toLowerCase();
      let score = 0, all = true;
      for (const w of words) {
        const s = (title.includes(w) ? 4 : 0) + (heads.includes(w) ? 2 : 0) + (tags.includes(w) || path.includes(w) ? 1 : 0);
        if (!s) all = false; score += s;
      }
      if (score) hits.push({ f, score: score + (all ? 5 : 0) - (title.endsWith("hub") ? 0 : 0) });
    }
    hits.sort((a, b) => b.score - a.score || a.f.basename.length - b.f.basename.length);
    const top = hits.slice(0, 7);
    res.createDiv({ cls: "tg-ask-say", text: top.length ? `Found ${hits.length} notes for "${q.trim()}". Best matches:` : `Nothing for "${q.trim()}" yet. Try other words.` });
    for (const { f } of top) {
      const h = res.createDiv({ cls: "tg-ask-hit" });
      h.createDiv({ cls: "tg-ask-t", text: f.basename });
      h.createDiv({ cls: "tg-ask-p", text: (f.parent ? f.parent.path : "").replace(/^\d+\s+/, "").replace(/\/\d+\s+/g, " / ") });
      h.onClickEvent(() => this.app.workspace.openLinkText(f.path, "", "tab"));
    }
  }

  // the owner's TD logo, shipped in this plugin folder
  logoSrc() { return this.app.vault.adapter.getResourcePath(this.manifest.dir + "/tdod-logo.webp"); }

  removeHuds() { document.querySelectorAll(".tg-hud, .tg-bg").forEach((el) => el.remove()); }

  // 3D background behind the graph canvas (z-index -1 inside the isolated view-content): sky, stars, neon grid floor + ceiling,
  // horizon glow, slowly turning rings. Transform-only animations; switch off in settings.
  buildBg(host) {
    const bg = createDiv({ cls: "tg-bg" });
    host.prepend(bg);
    bg.createDiv({ cls: "tg-bg-sky" });
    bg.createDiv({ cls: "tg-bg-stars tg-bg-stars1" });
    bg.createDiv({ cls: "tg-bg-stars tg-bg-stars2" });
    bg.createDiv({ cls: "tg-bg-ceil" }).createDiv({ cls: "tg-grid" });
    bg.createDiv({ cls: "tg-bg-floor" }).createDiv({ cls: "tg-grid" });
    bg.createDiv({ cls: "tg-bg-aurora tg-bg-aurora1" });
    bg.createDiv({ cls: "tg-bg-aurora tg-bg-aurora2" });
    bg.createDiv({ cls: "tg-bg-horizon" });
    const embers = bg.createDiv({ cls: "tg-bg-embers" });
    for (let i = 0; i < 26; i++) {
      const e = embers.createSpan({ cls: "tg-ember" });
      e.style.left = ((i * 37.3) % 100).toFixed(1) + "%";
      e.style.setProperty("--dur", (7 + (i * 13) % 9) + "s");
      e.style.setProperty("--del", (-((i * 7) % 11)) + "s");
      e.style.setProperty("--sz", (2 + (i % 3)) + "px");
      e.style.setProperty("--c", ["#ffc83d", "#4cc9f0", "#ff5da2", "#a78bfa"][i % 4]);
    }
    const rings = bg.createDiv({ cls: "tg-bg-rings" });
    for (let i = 1; i <= 3; i++) rings.createDiv({ cls: "tg-ring tg-ring" + i });
  }

  // 20 s FIRST-PERSON HYPERCAR intro (Bugatti-style cockpit, no-hesi night highway) the first time this graph view opens:
  // 0-15 s drive (speedo to ~420 km/h, wet-road reflections, traffic, overhead TOP G sign at 6 s, LOADING bar), 15 s shockwave
  // slam into the title, 20 s opens the graph. Sound (gear "Intro laugh"): streamed 10 s laugh from 0 s + "brokie" clip at
  // 15.6 s; the music starts with it through an in-car bass filter that opens up when the intro ends. Click to skip.
  playIntro(host) {
    if (host.dataset.tgIntro) return;
    host.dataset.tgIntro = "1";
    const DUR = 20000, SLAM = 15000;
    const it = host.createDiv({ cls: "tg-intro tg-drive tg-bug" });
    it.createDiv({ cls: "tg-edit-bars" });      // edit look: cinematic letterbox + film grain
    it.createDiv({ cls: "tg-grain" });
    const scene = it.createDiv({ cls: "tg-dv-scene" });
    scene.createDiv({ cls: "tg-dv-sky" });
    scene.createDiv({ cls: "tg-dv-moon" });
    scene.createDiv({ cls: "tg-dv-city tg-dv-city2" });
    scene.createDiv({ cls: "tg-dv-city" });
    scene.createDiv({ cls: "tg-dv-glow" });
    const bokeh = scene.createDiv({ cls: "tg-dv-bokeh" });
    for (let i = 0; i < 14; i++) {
      const b = bokeh.createSpan();
      b.style.left = ((i * 7.3 + 3) % 100) + "%"; b.style.top = (36 + (i * 13) % 9) + "%";
      b.style.setProperty("--c", ["#ff4fa3", "#4aa8ff", "#ffcf4a", "#a78bfa"][i % 4]); b.style.setProperty("--s", (10 + (i * 7) % 22) + "px");
    }
    const road = scene.createDiv({ cls: "tg-dv-road" });
    road.createDiv({ cls: "tg-dv-asphalt" });
    road.createDiv({ cls: "tg-dv-wet" });
    road.createDiv({ cls: "tg-dv-lanes" });
    road.createDiv({ cls: "tg-dv-edges" });
    const world = scene.createDiv({ cls: "tg-dv-world" });
    for (let i = 0; i < 8; i++) for (const side of [-1, 1]) {
      const p = world.createDiv({ cls: "tg-dv-pole" });
      p.style.setProperty("--x", side * 520 + "px");
      p.style.setProperty("--d", (-i * 0.19).toFixed(2) + "s");
      p.toggleClass("tg-dv-right", side > 0);
      p.createDiv({ cls: "tg-dv-lamp" });
      p.createDiv({ cls: "tg-dv-refl" });
    }
    [[-150, 0, 3.2], [150, -1.4, 2.6], [-150, -2.3, 3.6], [150, -0.6, 2.9], [-150, -3.1, 4.1]].forEach(([x, d, dur]) => {
      const c = world.createDiv({ cls: "tg-dv-car" });
      c.style.setProperty("--x", x + "px"); c.style.setProperty("--d", d + "s"); c.style.setProperty("--dur", dur + "s");
      c.createSpan(); c.createSpan();
    });
    // 3D buildings lining the highway (front + side faces, lit windows), passing slower than the lamps: real depth
    for (let i = 0; i < 10; i++) for (const side of [-1, 1]) {
      const b = world.createDiv({ cls: "tg-dv-bld" });
      const h = 380 + ((i * 97 + (side > 0 ? 53 : 0)) % 420), w = 260 + ((i * 61) % 180);
      b.style.setProperty("--x", side * (980 + ((i * 131) % 260)) + "px");
      b.style.setProperty("--h", h + "px"); b.style.setProperty("--w", w + "px");
      b.style.setProperty("--d", (-i * 0.36).toFixed(2) + "s");
      b.style.setProperty("--hue", ["#ffcf7a", "#9fd3ff", "#ff9ed1", "#fff1c9"][(i + (side > 0 ? 1 : 0)) % 4]);
      b.toggleClass("tg-dv-bld-r", side > 0);
      b.createDiv({ cls: "tg-dv-bld-front" }); b.createDiv({ cls: "tg-dv-bld-side" }); b.createDiv({ cls: "tg-dv-bld-top" });
    }
    const bridge = world.createDiv({ cls: "tg-dv-bridge" });      // overpass, roars overhead at ~10 s
    bridge.createDiv({ cls: "tg-dv-bridge-deck" }); bridge.createDiv({ cls: "tg-dv-bridge-lights" });
    // overhead gantry signs flying past, lit and flickering: [big text, exit panel, when (s), colour]
    [["SUCCESS", "EXIT 1 ⟶", 1.6, ""], ["TOP G VAULT", "NEXT EXIT ⟶", 4.2, ""], ["MONEY", "$ $ $ ⟶", 6.6, "tg-dv-sign-gold"],
      ["GET RICH BITCH", "NO EXIT ⟶", 10.9, "tg-dv-sign-red"], ["SUCCESS", "KEEP GOING ⟶", 12.4, "tg-dv-sign-gold"]].forEach(([l, r, at, cls]) => {
      const sign = world.createDiv({ cls: "tg-dv-sign " + cls });
      sign.style.animationDelay = at + "s";
      sign.createDiv({ cls: "tg-dv-sign-l", text: l });
      sign.createDiv({ cls: "tg-dv-sign-r", text: r });
    });
    const streaks = scene.createDiv({ cls: "tg-dv-streaks" });
    for (let i = 0; i < 26; i++) {
      const s = streaks.createSpan();
      s.style.setProperty("--a", (i * 360 / 26 + (i % 3) * 4) + "deg");
      s.style.setProperty("--d", (-(i * 0.37) % 1.1).toFixed(2) + "s");
    }
    scene.createDiv({ cls: "tg-dv-beams" });
    it.createDiv({ cls: "tg-dv-fringe" });
    // hypercar cockpit: glowing centre spine, round analog speedo (0-500), side screens, flat-bottom wheel with the TD badge
    // windshield: A-pillars, roof edge, glass reflection
    const glass = it.createDiv({ cls: "tg-dv-glass" });
    glass.createDiv({ cls: "tg-dv-pillar tg-dv-pillar-l" }); glass.createDiv({ cls: "tg-dv-pillar tg-dv-pillar-r" });
    glass.createDiv({ cls: "tg-dv-roof" }); glass.createDiv({ cls: "tg-dv-reflect" });
    const cock = it.createDiv({ cls: "tg-dv-cockpit" });
    cock.createDiv({ cls: "tg-dv-hood" });
    cock.createDiv({ cls: "tg-dv-dash" });
    cock.createDiv({ cls: "tg-dv-leather" });
    cock.createDiv({ cls: "tg-dv-ambient" });
    cock.createDiv({ cls: "tg-bg-spine" });
    const dial = cock.createDiv({ cls: "tg-bg-dial" });
    let ticks = "";
    for (let v = 0; v <= 500; v += 25) {
      const a = (-135 + 270 * v / 500) * Math.PI / 180, big = v % 100 === 0, r1 = big ? 78 : 84;
      ticks += `<line x1="${100 + Math.sin(a) * r1}" y1="${100 - Math.cos(a) * r1}" x2="${100 + Math.sin(a) * 92}" y2="${100 - Math.cos(a) * 92}" stroke="${v >= 400 ? "#ff4d6d" : "#cfe3ff"}" stroke-width="${big ? 2.4 : 1.2}"/>`;
      if (big) ticks += `<text x="${100 + Math.sin(a) * 64}" y="${104 - Math.cos(a) * 64}" fill="#9fb6d6" font-size="11" font-weight="700" text-anchor="middle" font-family="Segoe UI">${v}</text>`;
    }
    dial.innerHTML = `<svg viewBox="0 0 200 200"><circle cx="100" cy="100" r="97" fill="#05070d" stroke="#2a3346" stroke-width="2"/>${ticks}<circle cx="100" cy="100" r="6" fill="#4aa8ff"/></svg>`;
    const needle = dial.createDiv({ cls: "tg-bg-needle" });
    const num = dial.createDiv({ cls: "tg-dv-kmh", text: "0" });
    dial.createDiv({ cls: "tg-dv-unit", text: "KM/H" });
    const scrL = cock.createDiv({ cls: "tg-bg-screen tg-bg-scr-l" });
    const gear = scrL.createDiv({ cls: "tg-dv-gear", text: "1" });
    scrL.createDiv({ cls: "tg-bg-lab", text: "GEAR" });
    const rpm = scrL.createDiv({ cls: "tg-dv-bar" }).createDiv();
    const scrR = cock.createDiv({ cls: "tg-bg-screen tg-bg-scr-r" });
    scrR.createDiv({ cls: "tg-bg-lab", text: "W16 · 1,600 HP" });
    const pwr = scrR.createDiv({ cls: "tg-dv-bar tg-bg-pwr" }).createDiv();
    const wheel = cock.createDiv({ cls: "tg-dv-wheel" });
    wheel.createDiv({ cls: "tg-dv-rim" });
    for (let i = 0; i < 3; i++) wheel.createDiv({ cls: "tg-dv-spoke tg-dv-spoke" + i });
    wheel.createEl("img", { cls: "tg-dv-hub", attr: { src: this.logoSrc(), alt: "" } });
    // No Hesi driver view: cowl over the cluster, rear-view mirror right of centre (left-hand drive), driver's side mirror
    cock.createDiv({ cls: "tg-dv-binnacle" });
    cock.createDiv({ cls: "tg-dv-rvm" }).createDiv({ cls: "tg-dv-mirror-glass" }).createSpan();
    cock.createDiv({ cls: "tg-dv-svm" }).createDiv({ cls: "tg-dv-mirror-glass" }).createSpan();
    // LOADING bar (top)
    const prog = it.createDiv({ cls: "tg-dv-prog" });
    const ph = prog.createDiv({ cls: "tg-dv-prog-h" });
    ph.createSpan({ text: "LOADING TOP G VAULT" });
    const pct = ph.createSpan({ cls: "tg-dv-pct", text: "0%" });
    const pfill = prog.createDiv({ cls: "tg-dv-track" }).createDiv({ cls: "tg-dv-fill" });
    const pstage = prog.createDiv({ cls: "tg-dv-stage", text: "Starting engine" });
    const stages = () => { const st = this.stats || { notes: this.app.vault.getMarkdownFiles().length, links: 0, areas: this.groups.length };   // live: counts may land mid-intro
      return ["Starting engine", `Loading ${st.notes.toLocaleString()} notes`, `Linking ${(st.links || 0).toLocaleString()} connections`,
        `Painting ${st.areas} areas`, "Spinning up the music", "Opening the vault"]; };
    const eng = this.ui("engine") ? this.engineSound() : null;
    const t0 = performance.now();
    let lastG = 1;
    const speedo = window.setInterval(() => {
      const el = performance.now() - t0, t = Math.min(1, el / 12500);
      const kmh = Math.round(420 * (1 - Math.pow(1 - t, 2.1)));
      num.setText(String(kmh));
      needle.style.transform = `rotate(${-135 + 270 * kmh / 500}deg)`;
      const g = Math.min(7, 1 + Math.floor(kmh / 62)); gear.setText(String(g));
      if (g > lastG) { it.removeClass("tg-shift"); void it.offsetWidth; it.addClass("tg-shift"); }   // gear change: the cabin jolts
      lastG = g;
      rpm.style.width = (35 + ((kmh % 62) / 62) * 65) + "%"; pwr.style.width = Math.min(100, kmh / 4.2) + "%";
      it.style.setProperty("--spd", (kmh / 420).toFixed(3));
      if (eng && el < SLAM) eng.update(kmh, g);
      const p = Math.min(100, Math.round(el / 145));
      pct.setText(p + "%"); pfill.style.width = p + "%";
      const sg = stages(); pstage.setText(sg[Math.min(sg.length - 1, Math.floor(p / 17))]);
    }, 50);
    // the slam at 15 s
    const fin = it.createDiv({ cls: "tg-dv-final" });
    fin.createDiv({ cls: "tg-dv-shock" });
    fin.createEl("img", { cls: "tg-intro-logo", attr: { src: this.logoSrc(), alt: "TDOD" } });
    const title = fin.createDiv({ cls: "tg-intro-title" });
    "TOP G VAULT".split("").forEach((ch, i) => { const sp = title.createSpan({ text: ch === " " ? " " : ch }); sp.style.setProperty("--i", i); if (i >= 6) sp.addClass("tg-v"); });
    const by = fin.createDiv({ cls: "tg-intro-by" });
    by.appendText("CRAFTED BY ");
    by.createEl("b", { text: "TDOD" });
    if (this.ui("brokie")) {
      const br = fin.createDiv({ cls: "tg-intro-brokie" });
      br.createDiv({ cls: "tg-brokie-1", text: "HERE YOU GO" });
      br.createDiv({ cls: "tg-brokie-2", text: "YOU FUCKING BROKIE" });
    }
    it.createDiv({ cls: "tg-intro-flash" });
    it.createDiv({ cls: "tg-intro-skip", text: "CLICK TO SKIP" });
    // SOUND PLAN (no two loud sources at full level, fades instead of cuts):
    //   0 s ............ laugh (Intro volume) over the engine, engine ducked to 35 %; laugh fades out by 10 s
    //   10-15 s ........ engine alone, revving through the gears
    //   15 s (slam) .... engine fades out for good + boom; music drops in from 0:00 at its intro level
    //   15.6-19.4 s .... "brokie" voice; music ducked to 30 % under it, then back up
    //   20 s (end) ..... music glides from its intro level down to the player's own volume over 4 s
    // Sound sources are hidden YouTube embeds (streamed, nothing bundled) + one WebAudio engine. Each clip loads early and
    // silent, plays on its cue, and every one is removed when the intro ends or is skipped.
    const clips = [];
    let done = false;                                 // set by end(): nothing scheduled may fire after a skip
    document.querySelectorAll("webview.tg-intro-clip").forEach((x) => x.remove());   // never two of the same clip
    const count = (at) => this.log(`intro ${at}: music players=${document.querySelectorAll("webview.top-g-graph-music").length}` +
      ` clips=${document.querySelectorAll("webview.tg-intro-clip").length} engine=${eng ? "on" : "off"}`);
    // the owner wants music on the intro: a paused player is un-paused for it
    if (this.settings.paused && this.settings.enabled) { this.settings.paused = false; this.save(); }
    const sfx = this.ui("laugh") && !this.settings.muted && !!window.require;
    // intro sounds have their own level (settings "Intro volume"), so a quiet music volume no longer buries the laugh
    const clipVol = Math.round(Math.max(0, Math.min(100, this.settings.introVolume ?? 70)));
    const clip = (id, start, cue, len, lead) => {
      if (!sfx) return;
      let w = null, armed = false, live = false;
      const run = (body) => (w && w.isConnected
        ? w.executeJavaScript(`(function(){var y=document.getElementById('movie_player');if(!y||!y.getPlayerState)return -9;${body}})()`).catch(() => -9)
        : Promise.resolve(-9));
      const go = () => {
        if (live || done || !w) return;
        live = true;
        run(`y.seekTo(${start},true);y.setVolume(${clipVol});y.unMute();y.playVideo();return 1;`)
          .then(() => { try { if (w.isConnected) w.setAudioMuted(false); } catch (e) {} });
        if (eng) eng.duck(0.35);                       // the engine drops under the voice, comes back after
        // the laugh (cue 0) never runs into the slam
        const left = cue === 0 ? Math.min(len, SLAM - 400 - (performance.now() - t0)) : len;
        window.setTimeout(() => {
          if (eng && !done) eng.duck(1);
          [0.7, 0.45, 0.25, 0.1, 0].forEach((f, i) => window.setTimeout(() =>
            run(f ? `y.setVolume(${Math.round(clipVol * f)});return 1;` : "y.pauseVideo();return 1;"), i * 110));
        }, Math.max(1500, left));
      };
      window.setTimeout(() => {
        if (!it.isConnected) return;
        w = guardWebview(document.createElement("webview"));
        w.classList.add("tg-intro-clip");
        w.setAttribute("src", `https://www.youtube.com/embed/${id}?autoplay=1&mute=1&start=${start}&controls=0&enablejsapi=1&playsinline=1`);
        w.setAttribute("allow", "autoplay; encrypted-media");
        w.style.cssText = "position:fixed;width:2px;height:2px;left:-10px;bottom:0;opacity:0;pointer-events:none;border:0;";
        w.addEventListener("dom-ready", () => { try { if (!live) w.setAudioMuted(true); } catch (e) {} });
        document.body.appendChild(w); clips.push(w);
        // ready = playing or parked (not an ad): park it on its start until the cue, or play right away if the cue has passed
        const poll = window.setInterval(() => {
          if (!it.isConnected || live || !w.isConnected) { window.clearInterval(poll); return; }
          run("return y.classList.contains('ad-showing') ? -2 : y.getPlayerState();").then((st) => {
            if (live || (st !== 1 && st !== 2)) return;
            if (performance.now() - t0 >= cue) { window.clearInterval(poll); go(); }
            else if (!armed) { armed = true; run(`y.pauseVideo();y.seekTo(${start},true);return 1;`); }
          });
        }, 120);
      }, Math.max(0, cue - lead));
      if (cue > 0) window.setTimeout(() => { if (armed) go(); }, cue);   // exact cue when already parked
    };
    clip(LAUGH_ID, 0, 0, 10000, 0);                                     // laugh: starts the moment it can, 10 s
    clip(BROKIE_ID, BROKIE_START, SLAM + 600, 3800, 5000);              // "brokie": preloaded 5 s early, on cue, faded by 19.4 s
    // music: held through the drive, loaded silently 4.5 s early, restarted from 0:00 and dropped exactly on the slam
    const introMusic = Math.round(clipVol * 0.6);       // e.g. 42 at Intro volume 70: under the voice level, well above a 5 % slider
    this.holdMusic = true; this.stop(); this.duck = 1; this.introLevel = introMusic;
    count("start");
    window.setTimeout(() => { if (done) return; this.holdMusic = false; this.introMute = true; this.sync(); count("music loading"); }, SLAM - 4500);
    window.setTimeout(() => {
      if (done) return;
      const p = this.player;
      if (p && p.tagName.toLowerCase() === "webview") p.executeJavaScript("(function(){var y=document.getElementById('movie_player');if(y&&y.seekTo){y.seekTo(0,true);y.playVideo();}return 1;})()").catch(() => {});
      window.setTimeout(() => { if (done) return; this.introMute = false; this.applyMusicLevel(); count("slam"); }, 60);
      if (eng) { eng.fade(); eng.boom(); }
    }, SLAM);
    if (sfx) {
      window.setTimeout(() => { if (!done) this.rampMusic("duck", 0.3, 250); }, SLAM + 600);
      window.setTimeout(() => { if (!done) this.rampMusic("duck", 1, 900); }, SLAM + 600 + 3800);
    }
    // phonk-edit beat punches on the slam: zoom hit + flash + RGB split, 4 hits in rhythm
    [0, 430, 860, 1290].forEach((d) => window.setTimeout(() => {
      if (!it.isConnected) return; it.addClass("tg-hit"); window.setTimeout(() => it.removeClass("tg-hit"), 170);
    }, SLAM + d));
    const end = () => {
      if (done) return;                          // once only (a click and the 20 s timer can both call it)
      done = true;
      window.clearInterval(speedo);
      // warp into the graph: the intro rushes through the camera (zoom blur + RGB split), the graph punches in from blurry to sharp.
      // If the graph tab was closed mid-intro, only the sound clean-up below runs.
      if (it.isConnected) {
        it.addClass("tg-intro-warp"); host.addClass("tg-enter");
        window.setTimeout(() => it.remove(), 950); window.setTimeout(() => host.removeClass("tg-enter"), 1600);
      }
      clips.forEach((w) => w.remove()); clips.length = 0;
      if (eng) eng.stop();
      this.introEnd = null;
      this.introMute = false;
      if (this.holdMusic) {                     // skipped before the music loaded: start it straight at the player's volume
        this.holdMusic = false; this.introLevel = null; this.duck = 1; this.sync();
      } else {                                  // glide from the intro level down to the player's own volume
        this.rampMusic("duck", 1, 300);
        this.rampMusic("introLevel", this.settings.volume, 4000, () => { this.introLevel = null; this.setVolume(); });
      }
      count("end");
    };
    this.introEnd = end;
    it.addEventListener("click", end);
    window.setTimeout(end, DUR);
  }

  // synthesized exotic-car engine for the intro (WebAudio, nothing downloaded), mixed UNDER the laugh + music:
  // 12-harmonic growl (custom wave, 2 detuned voices + sub), firing-rate rumble (AM), exhaust noise texture, intake whoosh,
  // crackles/pops + turbo blow-off on every upshift. update(kmh, gear); boom(); fade(); stop().
  engineSound() {
    const AC = window.AudioContext || window.webkitAudioContext;
    if (!AC || this.settings.muted) return null;
    const ctx = new AC();
    const vol = Math.max(0, Math.min(1, (this.settings.introVolume ?? 70) / 100));   // follows "Intro volume", like the laugh
    const master = ctx.createGain(); master.gain.value = 0;
    const comp = ctx.createDynamicsCompressor(); comp.threshold.value = -14; comp.ratio.value = 4;
    master.connect(comp); comp.connect(ctx.destination);
    master.gain.linearRampToValueAtTime(0.22 * vol, ctx.currentTime + 0.8);        // quiet: the laugh + music stay on top
    // tone: custom harmonic wave -> waveshaper warmth -> rpm low-pass -> low-mid body
    const real = new Float32Array(14), imag = new Float32Array(14);
    [0, 1, .85, .7, .62, .45, .4, .3, .26, .2, .16, .12, .1, .08].forEach((a, i) => { imag[i] = a; });
    const wave = ctx.createPeriodicWave(real, imag);
    const shaper = ctx.createWaveShaper(); const cv = new Float32Array(2048);
    for (let i = 0; i < 2048; i++) { const x = i / 1024 - 1; cv[i] = Math.tanh(1.8 * x) * 0.9; }
    shaper.curve = cv; shaper.oversample = "4x";
    const lp = ctx.createBiquadFilter(); lp.type = "lowpass"; lp.frequency.value = 500; lp.Q.value = 1.4;
    const body = ctx.createBiquadFilter(); body.type = "peaking"; body.frequency.value = 140; body.gain.value = 5; body.Q.value = 0.9;
    const am = ctx.createGain(); am.gain.value = 0.75;                               // firing-rate rumble
    shaper.connect(lp); lp.connect(body); body.connect(am); am.connect(master);
    const lfo = ctx.createOscillator(); lfo.type = "sine"; const lfoG = ctx.createGain(); lfoG.gain.value = 0.25;
    lfo.connect(lfoG); lfoG.connect(am.gain); lfo.start();
    const voice = (mul, g, type) => {
      const o = ctx.createOscillator(); if (type) o.type = type; else o.setPeriodicWave(wave);
      const og = ctx.createGain(); og.gain.value = g; o.connect(og); og.connect(shaper); o.start(); return { o, mul };
    };
    const voices = [voice(1, 0.32), voice(1.004, 0.28), voice(0.5, 0.42, "sine"), voice(2.01, 0.08)];
    // noise layers: exhaust texture + intake / wind
    const nb = ctx.createBuffer(1, ctx.sampleRate * 2, ctx.sampleRate), nd = nb.getChannelData(0);
    for (let i = 0; i < nd.length; i++) nd[i] = Math.random() * 2 - 1;
    const loopNoise = (type, f, q) => {
      const s = ctx.createBufferSource(); s.buffer = nb; s.loop = true;
      const bf = ctx.createBiquadFilter(); bf.type = type; bf.frequency.value = f; bf.Q.value = q;
      const g = ctx.createGain(); g.gain.value = 0; s.connect(bf); bf.connect(g); g.connect(master); s.start(); return { bf, g };
    };
    const exhaust = loopNoise("bandpass", 220, 1.4), wind = loopNoise("bandpass", 900, 0.4);
    const burst = (t, f, len, amp) => {
      const s = ctx.createBufferSource(); s.buffer = nb;
      const bf = ctx.createBiquadFilter(); bf.type = "bandpass"; bf.frequency.value = f; bf.Q.value = 2;
      const g = ctx.createGain(); g.gain.setValueAtTime(0.0001, t); g.gain.exponentialRampToValueAtTime(amp, t + 0.004);
      g.gain.exponentialRampToValueAtTime(0.0001, t + len);
      s.connect(bf); bf.connect(g); g.connect(master); s.start(t, Math.random()); s.stop(t + len + 0.02);
    };
    const shift = () => {                       // turbo blow-off + exhaust crackles
      const t = ctx.currentTime;
      const s = ctx.createBufferSource(); s.buffer = nb;
      const bp = ctx.createBiquadFilter(); bp.type = "bandpass"; bp.frequency.setValueAtTime(3200, t); bp.frequency.exponentialRampToValueAtTime(1100, t + 0.4); bp.Q.value = 1.6;
      const g = ctx.createGain(); g.gain.setValueAtTime(0.0001, t); g.gain.exponentialRampToValueAtTime(0.35, t + 0.03); g.gain.exponentialRampToValueAtTime(0.0001, t + 0.42);
      s.connect(bp); bp.connect(g); g.connect(master); s.start(t); s.stop(t + 0.45);
      for (let i = 0; i < 7; i++) burst(t + 0.05 + Math.random() * 0.45, 900 + Math.random() * 2400, 0.02 + Math.random() * 0.03, 0.25 + Math.random() * 0.35);
    };
    let lastGear = 1, faded = false;                  // after the slam fade the engine never comes back (no ghost engine under the voice)
    return {
      update: (kmh, gear) => {
        const t = ctx.currentTime;
        const rpm = 1300 + ((kmh % 62) / 62) * 6900 + (kmh < 5 ? 0 : 500);
        const f = rpm / 28;
        voices.forEach(({ o, mul }) => o.frequency.setTargetAtTime(f * mul, t, gear !== lastGear ? 0.015 : 0.05));
        lfo.frequency.setTargetAtTime(f / 4, t, 0.05);
        lp.frequency.setTargetAtTime(380 + rpm * 0.42, t, 0.06);
        exhaust.bf.frequency.setTargetAtTime(140 + rpm * 0.05, t, 0.1);
        exhaust.g.gain.setTargetAtTime(0.1 + Math.min(0.18, kmh / 1600), t, 0.15);
        wind.g.gain.setTargetAtTime(Math.min(0.32, kmh / 1100), t, 0.25);
        if (gear > lastGear) shift();
        lastGear = gear;
      },
      boom: () => {
        const t = ctx.currentTime, o = ctx.createOscillator(), g = ctx.createGain();
        o.type = "sine"; o.frequency.setValueAtTime(72, t); o.frequency.exponentialRampToValueAtTime(30, t + 1.3);
        g.gain.setValueAtTime(0.0001, t); g.gain.exponentialRampToValueAtTime(Math.max(0.0001, 0.4 * vol), t + 0.015); g.gain.exponentialRampToValueAtTime(0.0001, t + 1.5);
        o.connect(g); g.connect(ctx.destination); o.start(t); o.stop(t + 1.6);
      },
      duck: (f) => { if (faded) return; const t = ctx.currentTime; master.gain.cancelScheduledValues(t); master.gain.setTargetAtTime(0.22 * vol * f, t, 0.25); },
      fade: () => { faded = true; const t = ctx.currentTime; master.gain.cancelScheduledValues(t); master.gain.setTargetAtTime(0, t, 0.3); },
      stop: () => { try { master.gain.setTargetAtTime(0, ctx.currentTime, 0.1); window.setTimeout(() => ctx.close(), 600); } catch (e) {} },
    };
  }

  // music through an in-car filter (WebAudio inside the YouTube player page): bass shelf + sub peak + muffled highs + light
  // compression. Only built if the page's AudioContext is allowed to run (otherwise the music would go silent).
  cabinEQ(on) {
    const p = this.player;
    if (!p || p.tagName.toLowerCase() !== "webview") return;
    p.executeJavaScript(`(function(on){var m=document.querySelector('video');if(!m)return 'novideo';var w=window;
      if(!w.__tgEq){var AC=w.AudioContext||w.webkitAudioContext;if(!AC)return 'noac';var C=new AC();if(C.state!=='running'){C.resume();if(C.state!=='running'){C.close();return 'suspended';}}
        var s=C.createMediaElementSource(m);var ls=C.createBiquadFilter();ls.type='lowshelf';ls.frequency.value=120;
        var pk=C.createBiquadFilter();pk.type='peaking';pk.frequency.value=55;pk.Q.value=1.1;
        var lp=C.createBiquadFilter();lp.type='lowpass';lp.frequency.value=20000;lp.Q.value=0.6;
        var cp=C.createDynamicsCompressor();cp.threshold.value=-20;cp.ratio.value=3;
        s.connect(ls);ls.connect(pk);pk.connect(lp);lp.connect(cp);cp.connect(C.destination);w.__tgEq={C:C,ls:ls,pk:pk,lp:lp};}
      var e=w.__tgEq,n=e.C.currentTime;
      e.ls.gain.setTargetAtTime(on?11:0,n,0.25);e.pk.gain.setTargetAtTime(on?7:0,n,0.25);
      e.lp.frequency.setTargetAtTime(on?1700:20000,n,on?0.25:0.9);return 'ok';})(${on ? "true" : "false"})`)
      .then((r) => this.log("cabinEQ " + on + " " + r)).catch(() => {});
  }

  // world clock (gear "World clock"): local + 5 cities, ticks every second
  tickClocks() {
    const now = new Date();
    document.querySelectorAll(".tg-clock-row").forEach((row) => {
      const tz = row.dataset.tz || undefined;
      const t = now.toLocaleTimeString("en-GB", { timeZone: tz, hour: "2-digit", minute: "2-digit", second: "2-digit", hour12: false });
      const d = now.toLocaleDateString("en-GB", { timeZone: tz, weekday: "short" });
      const h = Number(now.toLocaleTimeString("en-GB", { timeZone: tz, hour: "2-digit", hour12: false }));
      row.querySelector(".tg-clock-t").setText(t);
      row.querySelector(".tg-clock-d").setText(d.toUpperCase());
      row.toggleClass("is-night", h < 6 || h >= 20);
    });
  }

  // UI parts the gear box can switch off (all on by default except the joke line)
  ui(key) {
    const u = this.settings.ui || {};
    if (key in u) return !!u[key];
    if (key === "bg") return this.settings.bg !== false;
    if (key === "intro") return this.settings.intro !== false;
    return true;
  }

  buildHud(host) {
    if (!host.querySelector(".tg-bg")) this.buildBg(host);
    const hud = host.createDiv({ cls: "tg-hud" });
    hud.createDiv({ cls: "tg-vignette" });
    for (const c of ["tl", "tr", "bl", "br"]) hud.createDiv({ cls: "tg-corner tg-" + c });
    // TD logo emblem left of the title (static: no spinning money coin)
    hud.createEl("img", { cls: "tg-emblem", attr: { src: this.logoSrc(), alt: "TDOD" } });

    const credit = hud.createDiv({ cls: "tg-credit" });
    credit.createSpan({ cls: "tg-credit-by", text: "CRAFTED BY" });
    credit.createEl("img", { cls: "tg-logo", attr: { src: this.logoSrc(), alt: "TDOD logo" } });
    credit.createSpan({ cls: "tg-credit-name", text: "TDOD", attr: { "data-text": "TDOD" } });

    const legend = hud.createDiv({ cls: "tg-legend tg-panel" });
    const lh = legend.createDiv({ cls: "tg-legend-head" });
    lh.createSpan({ cls: "tg-legend-title", text: "AREAS" });
    lh.createSpan({ cls: "tg-legend-count" });
    lh.createSpan({ cls: "tg-legend-caret" });
    lh.onClickEvent(async () => { this.settings.legendOpen = !this.settings.legendOpen; await this.save(); });
    const list = legend.createDiv({ cls: "tg-legend-list" });
    for (const g of this.groups) {
      const row = list.createDiv({ cls: "tg-legend-row" });
      row.style.setProperty("--tg-c", g.color);
      row.style.setProperty("--tg-w", Math.max(4, Math.round(100 * g.count / (this.maxCount || 1))) + "%");
      row.createSpan({ cls: "tg-dot" });
      row.createSpan({ cls: "tg-legend-name", text: g.name });
      row.createSpan({ cls: "tg-legend-n", text: g.count.toLocaleString() });
      row.createDiv({ cls: "tg-legend-bar" });
      if (g.colors && g.colors.length > 1) {
        const sw = row.createDiv({ cls: "tg-swatches", attr: { title: g.colors.length + " colour groups" } });
        for (const c of g.colors.slice(0, 12)) sw.createSpan().style.background = c;
      }
      row.dataset.path = g.path;
      row.setAttr("title", "Show only " + g.name + " in the graph (click again for all)");
      row.onClickEvent((e) => this.focusArea(g.path, e.ctrlKey || e.shiftKey || e.metaKey));
    }
    const all = lh.createSpan({ cls: "tg-legend-all", text: "ALL" });
    all.onClickEvent((e) => { e.stopPropagation(); this.focusArea(""); });
    const mix = lh.createSpan({ cls: "tg-legend-mix", text: "MIX", attr: { title: "MIX: pick several areas and see them together (or Ctrl+click)" } });
    mix.onClickEvent((e) => { e.stopPropagation(); this.mixMode = !this.mixMode; this.renderHuds(); });

    const st = this.stats || { notes: 0, links: 0, areas: 0 };
    const stats = hud.createDiv({ cls: "tg-stats tg-panel" });
    for (const [k, v] of [["NOTES", st.notes], ["LINKS", st.links], ["AREAS", st.areas]]) {
      const cell = stats.createDiv({ cls: "tg-stat" });
      cell.createDiv({ cls: "tg-stat-v", text: v.toLocaleString() });
      cell.createDiv({ cls: "tg-stat-k", text: k });
    }
    // "Ask the vault": type what you need, the best-matching notes appear, click / Enter opens one
    const ask = hud.createDiv({ cls: "tg-ask tg-panel" });
    const res = ask.createDiv({ cls: "tg-ask-res" });
    const row = ask.createDiv({ cls: "tg-ask-row" });
    row.createSpan({ cls: "tg-ask-icon", text: "⌕" });
    const inp = row.createEl("input", { cls: "tg-ask-in", attr: { type: "text", placeholder: "Ask the vault... e.g. datastore, drift car, slash vfx" } });
    inp.addEventListener("input", () => this.askVault(inp.value, res));
    inp.addEventListener("keydown", (e) => {
      e.stopPropagation();
      if (e.key === "Enter") { const hit = res.querySelector(".tg-ask-hit"); if (hit) hit.click(); }
      if (e.key === "Escape") { inp.value = ""; res.empty(); inp.blur(); }
    });
    if (this.ui("ticker") && window.require) {    // market ticker tape along the bottom (streamed webview, read-only)
      const tk = hud.createDiv({ cls: "tg-ticker tg-panel" });
      const w = document.createElement("webview");
      w.setAttribute("src", "data:text/html;charset=utf-8," + encodeURIComponent(TICKER_HTML));
      w.setAttribute("allowpopups", "");
      w.className = "tg-ticker-view";
      tk.appendChild(w);
    }
    const live = stats.createDiv({ cls: "tg-stat tg-live" });
    live.createSpan({ cls: "tg-live-dot" });
    live.createSpan({ cls: "tg-live-t", text: "LIVE" });

    // Discord: two servers (Top G + the owner's TDOD Community)
    const dc = hud.createDiv({ cls: "tg-discord tg-panel" });
    const dh = dc.createDiv({ cls: "tg-discord-head" });
    const logo = dh.createDiv({ cls: "tg-discord-logo" });
    logo.innerHTML ='<svg viewBox="0 0 127.14 96.36" aria-hidden="true"><path fill="currentColor" d="M107.7 8.07A105.15 105.15 0 0 0 81.47 0a72.06 72.06 0 0 0-3.36 6.83 97.68 97.68 0 0 0-29.11 0A72.37 72.37 0 0 0 45.64 0a105.89 105.89 0 0 0-26.25 8.09C2.79 32.65-1.71 56.6.54 80.21a105.73 105.73 0 0 0 32.17 16.15 77.7 77.7 0 0 0 6.89-11.11 68.42 68.42 0 0 1-10.85-5.18c.91-.66 1.8-1.34 2.66-2a75.57 75.57 0 0 0 64.32 0c.87.71 1.76 1.39 2.66 2a68.68 68.68 0 0 1-10.87 5.19 77 77 0 0 0 6.89 11.1 105.25 105.25 0 0 0 32.19-16.14c2.64-27.38-4.51-51.11-18.9-72.15ZM42.45 65.69C36.18 65.69 31 60 31 53s5-12.74 11.43-12.74S54 46 53.89 53s-5.05 12.69-11.44 12.69Zm42.24 0C78.41 65.69 73.25 60 73.25 53s5-12.74 11.44-12.74S96.23 46 96.12 53s-5.04 12.69-11.43 12.69Z"/></svg>';
    const dt = dh.createDiv({ cls: "tg-discord-text" });
    dt.createDiv({ cls: "tg-discord-name", text: "COMMUNITY" });
    dt.createDiv({ cls: "tg-discord-sub", text: "2 DISCORDS · YOUTUBE · TIKTOK" });
    for (const srv of DISCORDS) {
      const row = dc.createEl("a", { cls: "tg-dc-row tg-dc-" + srv.kind, attr: { href: srv.url, title: srv.url, "aria-label": (srv.go || "Join") + " " + srv.name } });
      if (srv.icon) row.createEl("img", { cls: "tg-dc-icon tg-dc-img", attr: { src: this.app.vault.adapter.getResourcePath(this.manifest.dir + "/" + srv.icon), alt: "" } });
      else if (srv.logo) row.createEl("img", { cls: "tg-dc-icon tg-logo", attr: { src: this.logoSrc(), alt: "" } });
      else row.createDiv({ cls: "tg-dc-icon tg-dc-g", text: "G" });
      const tx = row.createDiv({ cls: "tg-dc-text" });
      tx.createDiv({ cls: "tg-dc-name", text: srv.name });
      tx.createDiv({ cls: "tg-dc-sub", text: srv.sub });
      const tag = tx.createDiv({ cls: "tg-dc-kind" });
      tag.innerHTML = srv.kind === "youtube"
        ? '<svg viewBox="0 0 24 17" aria-hidden="true"><path fill="currentColor" d="M23.5 2.65A3 3 0 0 0 21.4.53C19.5 0 12 0 12 0S4.5 0 2.6.53A3 3 0 0 0 .5 2.65 31.6 31.6 0 0 0 0 8.5a31.6 31.6 0 0 0 .5 5.85 3 3 0 0 0 2.1 2.12C4.5 17 12 17 12 17s7.5 0 9.4-.53a3 3 0 0 0 2.1-2.12A31.6 31.6 0 0 0 24 8.5a31.6 31.6 0 0 0-.5-5.85ZM9.6 12.13V4.87L15.8 8.5Z"/></svg>'
        : srv.kind === "tiktok"
        ? '<svg viewBox="0 0 24 24" aria-hidden="true"><path fill="currentColor" d="M16.6 2h-3.4v13.4a3 3 0 1 1-3-3c.3 0 .6 0 .9.1V9a6.4 6.4 0 1 0 5.5 6.4V8.6a8.1 8.1 0 0 0 4.4 1.3V6.5a4.6 4.6 0 0 1-4.4-4.5Z"/></svg>'
        : logo.innerHTML;
      row.createDiv({ cls: "tg-discord-go", text: srv.go || "JOIN" });
      row.addEventListener("click", (e) => { e.preventDefault(); window.open(srv.url, "_blank"); });
    }

    // heavy-vault notice (friendly, dismissible): big vault = the graph can lag on low-end PCs
    const warn = hud.createDiv({ cls: "tg-warn tg-panel" });
    warn.createDiv({ cls: "tg-warn-icon", text: "!" });
    const wt = warn.createDiv({ cls: "tg-warn-text" });
    wt.createDiv({ cls: "tg-warn-title", text: "HEAVY VAULT, HEADS UP" });
    wt.createDiv({ text: `${(st.notes || 0).toLocaleString()} notes and a 9,000+ file FBX library live in here. On a lower-end PC the graph can lag: close it when you're done, or use the Filters panel to show fewer areas.` });
    const by = wt.createDiv({ cls: "tg-warn-by" });
    by.appendText("MADE BY ");
    by.createEl("img", { cls: "tg-logo tg-logo-sm", attr: { src: this.logoSrc(), alt: "TDOD logo" } });
    by.createEl("b", { text: "TDOD" });
    const ok = warn.createEl("button", { cls: "tg-warn-badge tg-warn-ok", text: "OK" });
    ok.onClickEvent(() => { this.warnClosed = true; this.renderHuds(); });   // gone until Obsidian restarts

    const card = hud.createDiv({ cls: "tg-player tg-panel" });
    card.createDiv({ cls: "tg-now", text: "NOW PLAYING" });
    const top = card.createDiv({ cls: "tg-player-top" });
    const art = top.createDiv({ cls: "tg-art" });
    art.createEl("img", { cls: "tg-art-logo", attr: { src: this.logoSrc(), alt: "" } });
    const meta = top.createDiv({ cls: "tg-meta" });
    meta.createDiv({ cls: "tg-track", text: "TOP G PHONK", attr: { "data-text": "TOP G PHONK" } });
    meta.createDiv({ cls: "tg-state" });
    const viz = card.createDiv({ cls: "tg-viz" });
    for (let i = 0; i < 28; i++) {
      const b = viz.createSpan({ cls: "tg-vb" });
      b.style.setProperty("--d", (-((i * 37) % 11) / 10).toFixed(2) + "s");
      b.style.setProperty("--h", (30 + ((i * 53) % 70)) + "%");
    }
    const ctl = card.createDiv({ cls: "tg-controls" });
    const btn = (cls, title, fn) => { const b = ctl.createEl("button", { cls: "tg-btn " + cls, attr: { "aria-label": title, title } }); b.onClickEvent(fn); return b; };
    btn("tg-prev", "Previous song", () => this.skip(-1)).setText("⏮");
    btn("tg-play", "Play / pause", () => this.togglePause());
    btn("tg-next", "Next song", () => this.skip(1)).setText("⏭");
    btn("tg-mute", "Mute / unmute", () => this.toggleMute());
    const vol = ctl.createEl("input", { cls: "tg-vol", attr: { type: "range", min: "0", max: "100", step: "5", "aria-label": "Volume" } });
    vol.addEventListener("input", () => { this.settings.volume = Number(vol.value); this.settings.muted = false; this.setVolume(this.settings.volume); });
    vol.addEventListener("change", () => this.save());
    ctl.createSpan({ cls: "tg-vol-num" });
    btn("tg-off", "Turn graph music off / on", () => this.toggle());
    // world clock
    const clk = hud.createDiv({ cls: "tg-clock tg-panel" });
    clk.createDiv({ cls: "tg-clock-h", text: "WORLD CLOCK" });
    for (const [city, tz] of CLOCKS) {
      const row = clk.createDiv({ cls: "tg-clock-row" });
      if (tz) row.dataset.tz = tz; else row.addClass("is-local");
      row.createSpan({ cls: "tg-clock-c", text: city });
      row.createSpan({ cls: "tg-clock-d" });
      row.createSpan({ cls: "tg-clock-t" });
    }
    this.tickClocks();
    // gear box: switch any part of the HUD on / off (saved)
    const gear = hud.createDiv({ cls: "tg-gearbox tg-panel" });
    const gb = gear.createEl("button", { cls: "tg-gear-btn", attr: { "aria-label": "UI settings", title: "UI settings" } });
    gb.innerHTML = '<svg viewBox="0 0 24 24" aria-hidden="true"><path fill="currentColor" d="M19.4 13a7.5 7.5 0 0 0 0-2l2.1-1.6-2-3.5-2.5 1a7.4 7.4 0 0 0-1.7-1L15 3.3h-4l-.4 2.6a7.4 7.4 0 0 0-1.7 1l-2.5-1-2 3.5L6.6 11a7.5 7.5 0 0 0 0 2l-2.1 1.6 2 3.5 2.5-1a7.4 7.4 0 0 0 1.7 1l.4 2.6h4l.4-2.6a7.4 7.4 0 0 0 1.7-1l2.5 1 2-3.5ZM13 15.5a3.5 3.5 0 1 1 0-7 3.5 3.5 0 0 1 0 7Z" transform="translate(-1 0)"/></svg>';
    const menu = gear.createDiv({ cls: "tg-gear-menu" });
    const mh = menu.createDiv({ cls: "tg-gear-head" });
    mh.createSpan({ cls: "tg-gear-title", text: "DISPLAY" });
    const setAll = async (on) => {
      const u = Object.assign({}, this.settings.ui);
      for (const [k] of UI_PARTS) if (!["music", "intro", "laugh", "brokie"].includes(k)) u[k] = on;
      this.settings.ui = u; this.settings.bg = u.bg; await this.save();
    };
    mh.createEl("button", { cls: "tg-gear-all", text: "ALL ON" }).onClickEvent(() => setAll(true));
    mh.createEl("button", { cls: "tg-gear-all", text: "ALL OFF" }).onClickEvent(() => setAll(false));
    for (const [group, items] of UI_GROUPS) {
      menu.createDiv({ cls: "tg-gear-group", text: group });
      for (const [k, label] of items) {
        const row = menu.createEl("label", { cls: "tg-gear-row" });
        row.createSpan({ cls: "tg-gear-label", text: label });
        const cb = row.createEl("input", { attr: { type: "checkbox" } });
        cb.dataset.key = k;
        row.createSpan({ cls: "tg-sw" });
        cb.addEventListener("change", async () => {
          this.settings.ui = Object.assign({}, this.settings.ui, { [k]: cb.checked });
          if (k === "music") { this.settings.enabled = cb.checked; if (cb.checked) this.settings.paused = false; }
          if (k === "bg" || k === "intro") this.settings[k] = cb.checked;
          await this.save();
          if (k === "music") this.sync();
          if (k === "ticker") { this.removeHuds(); this.ensureHuds(); }
        });
      }
    }
    gb.onClickEvent(() => gear.toggleClass("is-open", !gear.hasClass("is-open")));
    ["pointerdown", "wheel", "mousedown"].forEach((ev) => hud.querySelectorAll(".tg-panel").forEach((el) => el.addEventListener(ev, (e) => e.stopPropagation())));
  }

  renderHuds() {
    const s = this.settings;
    const state = !s.enabled ? "off" : s.paused ? "paused" : this.state || "loading";
    document.querySelectorAll(".tg-bg").forEach((bg) => bg.toggleClass("tg-hidden", !this.ui("bg")));
    document.querySelectorAll(".tg-hud").forEach((hud) => {
      hud.toggleClass("tg-hidden", !s.hud);
      hud.toggleClass("tg-legend-closed", !s.legendOpen);
      hud.toggleClass("tg-focused", !!this.activeArea);
      for (const [k] of UI_PARTS) hud.toggleClass("tg-hide-" + k, k === "music" ? false : !this.ui(k));
      hud.querySelectorAll(".tg-gear-menu input").forEach((cb) => { cb.checked = cb.dataset.key === "music" ? !!s.enabled : this.ui(cb.dataset.key); });
      hud.toggleClass("tg-warn-hidden", !!this.warnClosed);
      const act = new Set(this.activeAreas || []);
      hud.querySelectorAll(".tg-legend-row").forEach((r) => r.toggleClass("is-active", act.has(r.dataset.path)));
      hud.toggleClass("tg-mix-on", !!this.mixMode);
      const lc = hud.querySelector(".tg-legend-count");
      if (lc) lc.setText(act.size > 1 ? act.size + " / " + this.groups.length : String(this.groups.length));
      hud.dataset.state = state;
      const tr = hud.querySelector(".tg-track");
      if (tr) tr.setText(this.trackTitle ? this.trackTitle.toUpperCase() : "TOP G PHONK");
      const st = hud.querySelector(".tg-state");
      if (st) st.setText({ off: "MUSIC OFF", paused: "PAUSED", playing: "PLAYING  ·  LOOP", loading: "LOADING..." }[state] || state);
      const lt = hud.querySelector(".tg-live-t");
      if (lt) lt.setText(state === "playing" ? "LIVE" : state === "off" ? "SILENT" : "PAUSED");
      const play = hud.querySelector(".tg-play");
      if (play) play.setText(state === "playing" || state === "loading" ? "❚❚" : "▶");
      const mute = hud.querySelector(".tg-mute");
      if (mute) { mute.setText(s.muted || s.volume === 0 ? "🔇" : "🔊"); mute.toggleClass("is-on", s.muted); }
      const off = hud.querySelector(".tg-off");
      if (off) off.setText(s.enabled ? "OFF" : "ON");
      const vol = hud.querySelector(".tg-vol");
      if (vol && document.activeElement !== vol) vol.value = String(s.volume);
      if (vol) vol.style.setProperty("--tg-fill", (s.muted ? 0 : s.volume) + "%");
      const num = hud.querySelector(".tg-vol-num");
      if (num) num.setText(s.muted ? "0" : String(s.volume));
    });
  }
};

class MusicSettings extends PluginSettingTab {
  constructor(app, plugin) { super(app, plugin); this.plugin = plugin; }
  display() {
    const { containerEl } = this;
    const p = this.plugin;
    containerEl.empty();
    new Setting(containerEl).setName("Play music while the graph is open").addToggle((t) =>
      t.setValue(p.settings.enabled).onChange(async (v) => { p.settings.enabled = v; await p.save(); p.sync(); }));
    new Setting(containerEl).setName("Volume").setDesc("0 to 100 (also on the player card on the graph)").addSlider((s) =>
      s.setLimits(0, 100, 5).setValue(p.settings.volume).setDynamicTooltip().onChange(async (v) => {
        p.settings.volume = v; await p.save(); p.setVolume(v); }));
    new Setting(containerEl).setName("Intro volume").setDesc("Laugh, voice and engine in the drive intro, separate from the music volume").addSlider((s) =>
      s.setLimits(0, 100, 5).setValue(p.settings.introVolume ?? 70).setDynamicTooltip().onChange(async (v) => {
        p.settings.introVolume = v; await p.save(); }));
    new Setting(containerEl).setName("Show the graph HUD").setDesc("Player card, area legend and the By TDOD credit on the graph").addToggle((t) =>
      t.setValue(p.settings.hud).onChange(async (v) => { p.settings.hud = v; await p.save(); }));
    new Setting(containerEl).setName("Similar songs after the playlist").setDesc("When the last song ends, keep going with a YouTube mix of similar songs").addToggle((t) =>
      t.setValue(p.settings.autoMix !== false).onChange(async (v) => { p.settings.autoMix = v; await p.save(); }));
    new Setting(containerEl).setName("3D intro").setDesc("The fly-in intro when the graph opens").addToggle((t) =>
      t.setValue(p.settings.intro !== false).onChange(async (v) => { p.settings.intro = v; await p.save(); }));
    new Setting(containerEl).setName("3D background").setDesc("Neon grid, stars and rings behind the graph (turn off on a slow PC)").addToggle((t) =>
      t.setValue(p.settings.bg !== false).onChange(async (v) => { p.settings.bg = v; await p.save(); }));
    new Setting(containerEl).setName("YouTube link").setDesc("Any YouTube video link or ID.").addText((t) =>
      t.setValue(`https://youtu.be/${p.settings.videoId}`).onChange(async (v) => {
        p.settings.videoId = parseId(v); await p.save(); p.stop(); p.sync(); }));
  }
}
