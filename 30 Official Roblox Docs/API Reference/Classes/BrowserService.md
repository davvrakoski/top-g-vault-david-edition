---
title: "BrowserService"
description: "Bridges the Roblox client to its native web browser or WebView."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BrowserService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Bridges the Roblox client to its native web browser or WebView.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

This service is reserved for Roblox's own code and isn't accessible from experience scripts.

`BrowserService` bridges the Roblox client to its native web browser or embedded WebView. It opens browser windows and native overlays, runs JavaScript inside the resulting WebView, and relays messages to and from the web-side hybrid bridge (`window.Roblox.Hybrid`).

`OpenBrowserWindow` opens a URL only if it is allowlisted (a Roblox site, a `youtube.com/watch` page, or a `stripe.com` or `vnggames.com` subdomain); otherwise the request is rejected. `OpenNativeOverlay` opens a native overlay for Roblox URLs only. `SendCommand` forwards a JSON command to the WebView, `ExecuteJavaScript` evaluates a script inside it, and `CloseBrowserWindow` closes it. `OpenWeChatAuthWindow` launches the Tencent (WeChat) authentication flow, while `ReturnToJavaScript` and `EmitHybridEvent` invoke callbacks and dispatch events on the web-side hybrid bridge. Signals such as `BrowserWindowClosed`, `BrowserWindowWillNavigate`, `JavaScriptCallback`, and `AuthCookieCopiedToEngine` report WebView activity back to the client.

---
*Source: [BrowserService](https://create.roblox.com/docs/reference/engine/classes/BrowserService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
