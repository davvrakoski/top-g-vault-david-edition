---
title: "Studio testing modes"
description: "Explore the built-in Studio testing modes for games."
area: "30 Official Roblox Docs"
cluster: "Studio"
source: "https://create.roblox.com/docs/studio/testing-modes"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explore the built-in Studio testing modes for games.*

Because of the underlying [[30 Official Roblox Docs/Projects/Client-server runtime|client-server model]] of the Roblox Engine, it's important that you test your game in various modes before [[30 Official Roblox Docs/Production/Publishing/Create and publish games and places#Release games|releasing it to the public]]. All of the testing options are accessible in the left portion of the mezzanine.

*(image in the full Top G Vault)*

## Playtesting

There are three common options for playtesting a game. Choose the desired option from the dropdown menu and click the **Play** button to its right to begin the playtest.

*(image in the full Top G Vault)*

| Mode | Shortcut | Description |
| --- | --- | --- |
| **Test** | <kbd>F5</kbd> | Starts simulating the game, inserting your avatar at either a [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]] or coordinates of around `(0, 100, 0)`. |
| **Test Here** |  | Starts simulating the game, inserting your avatar in front of the camera's current position. |
| **Run** | <kbd>F8</kbd> | Starts simulating the game but does not insert your avatar. The simulation begins at the current camera position and you can navigate around using the Studio camera controls. |

Once a playtest is running, additional options become available in the mezzanine.

*(image in the full Top G Vault)*

| Action | Shortcut | Description |
| --- | --- | --- |
| **Pause** / **Resume** |  | Lets you [[30 Official Roblox Docs/Studio/Studio testing modes#Pause/resume\|pause/resume physics and animations]]. |
| **Stop** | <kbd>Shift</kbd><kbd>F5</kbd> | Stops simulation of the game and resets all objects and instances to how they were before the playtest. |
| **Client** / **Server** |  | During playtesting in a "solo" mode (**Test** or **Test Here**), toggles between **Client** mode and **Server** mode. See [[30 Official Roblox Docs/Studio/Studio testing modes#Toggle client/server\|toggle client/server]] for details. |

### Toggle client/server

When testing in either **Test** or **Test Here** mode, Studio runs two separate simulations — one [[30 Official Roblox Docs/Projects/Client-server runtime#Client|client]] simulation and one [[30 Official Roblox Docs/Projects/Client-server runtime#Server|server]] simulation — which can provide a more accurate impression of how the game will execute in production.

While solo playtesting, you can toggle between **Client** and **Server** modes by clicking the **Client/Server** toggle button. When you toggle, the button changes to reflect the current simulation mode.

*(image in the full Top G Vault)*

*Client*

*(image in the full Top G Vault)*

*Server*

Depending on the simulation mode, control of your character and the camera changes as follows:

#### Client Mode

*(image in the full Top G Vault)*

*In **Client** mode, the 3D viewport is surrounded by a **blue** border and the simulation uses your character controls and camera setup. This testing mode is a close simulation of the game running on the Roblox application, without multiple players.*

#### Server Mode

*(image in the full Top G Vault)*

*In **Server** mode, the 3D viewport is surrounded by a **green** border and your character is inserted but is not under your control. You can move about the place with a free‑floating camera, select objects, and inspect their properties.*

Within the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window hierarchy, certain objects only exist in their expected containers.

*(image in the full Top G Vault)*

*In **Client** mode, the expected client-side objects are present in the hierarchy, including those copied over from [[30 Official Roblox Docs/API Reference/Classes/StarterPack|StarterPack]] to the player's [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] and from [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]] into the player's [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]].*

*(image in the full Top G Vault)*

*In **Server** mode, the expected server-side objects are present in the hierarchy, including scripts in [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] and objects you placed in [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]].*

In the [[30 Official Roblox Docs/Studio/Output|Output]] window, messages are labeled **blue** (client) or **green** (server), indicating their origin from either the client or server. For messages output from [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]], the label color is determined by whether the module was called from a client-side [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] or from a server-side [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

*(image in the full Top G Vault)*

### Pause/resume

While solo playtesting, the **Pause/Resume** button is useful for debugging ephemeral scenes and mechanisms, without disabling rendering.

*(image in the full Top G Vault)*

By default, pausing and resuming acts upon both the client **and** server. If you wish to pause or resume only the client **or** server:

1. Set the [[30 Official Roblox Docs/Studio/Studio testing modes#Toggle client/server|client/server toggle]] based on which simulation you want to pause/resume.
2. Click the small arrow on the **Pause/Resume** button and select the alternate option of **Pause/Resume Client** or **Pause/Resume Server**. Clicking the button will then pause or resume only that side of the simulation.

When the simulation is paused, you can **step forward** 1/60th of a second (60 Hz) by clicking the **Step Forward** button. Like the **Pause/Resume** button to its left, clicking the small arrow lets you select stepping for only the client **or** server based on the [[30 Official Roblox Docs/Studio/Studio testing modes#Toggle client/server|client/server toggle]].

*(image in the full Top G Vault)*

Note the following technical details in relation to pause/resume:

- Although [[30 Official Roblox Docs/API Reference/Classes/Animation|Animations]] are not based on physics, these toolbar buttons also pause/resume animations.
- Pausing or resuming has no effect on running scripts.
- Only the [[30 Official Roblox Docs/API Reference/Classes/RunService|RunService]] callbacks [[30 Official Roblox Docs/API Reference/Classes/RunService#PreAnimation|PreAnimation]], [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation|PreSimulation]], [[30 Official Roblox Docs/API Reference/Classes/RunService#PostSimulation|PostSimulation]], and [[30 Official Roblox Docs/API Reference/Classes/RunService#Stepped|Stepped]] pause or resume through these toolbar buttons. Other callbacks ([[30 Official Roblox Docs/API Reference/Classes/RunService#PreRender|PreRender]], [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat|Heartbeat]], and [[30 Official Roblox Docs/API Reference/Classes/RunService#RenderStepped|RenderStepped]]) continue to fire, maintaining normal functionality of camera scripts, rendered visualizations, and plugins.

## Multi-client simulation

The **Server & Clients** option from the dropdown menu lets you launch multiple sessions of Studio, one acting as the server and each other acting as a client. This testing mode is a valuable tool for comparing how a client "sees" other clients within the game.

1. With the **Server & Clients** option selected in the dropdown menu, choose the number of client sessions to test. Usually 1–2 clients is sufficient, although you can simulate up to eight.

   *(image in the full Top G Vault)*

1. Press the **Play** button or <kbd>F7</kbd> to begin the client-server simulation.
1. When you're finished testing, press the **End Session** button from any of the simulation sessions to close all simulated clients and the simulated server.

   *(image in the full Top G Vault)*

## Party simulation

The **Party Simulator** allows you to test and debug games that use party-related APIs directly within Studio, without needing to publish and coordinate multiple devices. This tool lets you configure and emulate parties for test players in your [[30 Official Roblox Docs/Studio/Studio testing modes#Multi-client simulation|Server & Clients]] play tests.

When play testing, Party Simulator automatically assigns all test players to the configured simulated parties.

*(image in the full Top G Vault)*

If Party Simulator is enabled:

- Each [[30 Official Roblox Docs/API Reference/Classes/Player#PartyId|Player.PartyId]] property reflects the Party Simulator assignments.
- [[30 Official Roblox Docs/API Reference/Classes/SocialService#GetPartyAsync|SocialService:GetPartyAsync()]] returns a simulated table of party data.
- [[30 Official Roblox Docs/API Reference/Classes/SocialService#GetPlayersByPartyId|SocialService:GetPlayersByPartyId()]] returns a list of [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] instances assigned to the provided [[30 Official Roblox Docs/API Reference/Classes/Player#PartyId|Player.PartyId]].

You can adjust the number of local test players at any time using Studio's [[30 Official Roblox Docs/Studio/Studio testing modes#Multi-client simulation|Server & Clients]] setting. When the test player count changes, the emulator automatically updates to include or remove players in the configuration.

## Collaborative testing

If you're working on a game with others in [[30 Official Roblox Docs/Projects/Collaboration|collaboration]] mode, you can test with other collaborators as follows:

1. Select **Team Test** in the dropdown menu and press the **Play** button to open a new Studio session with your character inserted.

   *(image in the full Top G Vault)*

1. Other collaborators can then join by pressing the **Play** button from the mezzanine in their Studio session.

   > [!info]
   > Only one team test session can run at any given time. To close a session and kick out all testers, click the **End Session** button.

## Device simulation

Use [[30 Official Roblox Docs/Studio/Device Simulator|Device Simulator]] to preview how your experience looks and behaves on a device you don't have in front of you, including its screen dimensions, pixel density, on-screen keyboard, and touch input. Device Simulator pairs with [[30 Official Roblox Docs/Studio/Controller Emulator|Controller Emulator]] to emulate the gamepads, VR controllers, handhelds, and TV remotes players use to control your experience.

## Network simulation

Use [[30 Official Roblox Docs/Studio/Network Simulator|Network Simulator]] to add latency, jitter, and packet loss to Studio [[30 Official Roblox Docs/Studio/Studio testing modes#Playtesting|playtest]] connections and reproduce the network conditions players encounter on wired, Wi-Fi, and mobile connections. This is especially useful for testing games that use [[30 Official Roblox Docs/Projects/Server Authority/Server authority model|Server Authority]], since prediction and rollback/resimulation mechanisms are sensitive to networking conditions, and for testing [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvents]], which might be lost or arrive out of order.

## Scripted testing

In addition to the interactive testing tools above, Studio exposes services that let you drive testing programmatically from a plugin or build pipeline. All three services are Studio-only and do nothing when run in a published experience.

| Service | Purpose |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService\|StudioDeviceSimulatorService]] | Scriptable [[30 Official Roblox Docs/Studio/Device Simulator\|device simulation]]. Browse device presets, switch the active device, override resolution and DPI, control orientation and scaling, and create custom device profiles that persist to disk. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioTestService\|StudioTestService]] | Programmatic [[30 Official Roblox Docs/Studio/Studio testing modes#Multi-client simulation\|multi-client simulation]]. Start a server with up to 8 simulated clients, add players mid-session, pass arguments into the test, trigger client disconnects, and end tests from the server. |
| [[30 Official Roblox Docs/API Reference/Classes/VirtualInput\|VirtualInput]] | Simulated mouse, keyboard, and pointer events that are processed exactly like real hardware input. Obtain an instance from [[30 Official Roblox Docs/API Reference/Classes/UserInputService#CreateVirtualInput\|UserInputService:CreateVirtualInput()]]. |

These services enable include cross-device multiplayer testing (cycle through device profiles and launch a multiplayer test at each), player join/leave stress testing, orientation regression testing, and end-to-end UI flow automation.

## VR headsets

If you'd like to support virtual reality (VR) headsets for your game, make sure to test or [[30 Official Roblox Docs/Studio/Studio testing modes#VR emulation|emulate]] VR in Studio.

### VR emulation

**VR emulation** lets you test VR games in Studio without a physical headset. Just like emulating any other device, use [[30 Official Roblox Docs/Studio/Device Simulator|Device Simulator]] to choose a **Headset** device such as **Meta Quest 2** or **Meta Quest 3**. [[30 Official Roblox Docs/Studio/Controller Emulator|Controller Emulator]] automatically selects the appropriate controller for the headset.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

The combination of a headset and multiple controllers, each with motion tracking, make VR emulation more complex:

- For motion tracking emulation, press <kbd>Alt</kbd><kbd>1</kbd> (<kbd>⌥</kbd><kbd>1</kbd>) to lock the mouse to and unlock the mouse from the viewport.

- Use <kbd>Shift</kbd><kbd>←</kbd> or <kbd>Shift</kbd><kbd>→</kbd> to switch between common combinations of the headset, left controller, and right controller. For example, you might use the **Headset** option to look around as you walk forward with the left controller button, but then switch to the **Right Controller** when you need to use motion controls to aim at a target.

### Headset configuration

Studio supports testing for all VR headsets that are compatible with [OpenXR](https://www.khronos.org/openxr/), the open‑source industry standard providing access to VR.

> [!info]
> Currently, testing in VR is only supported on Windows.

To enable Studio testing in VR, you must connect your headset to your PC and configure the OpenXR runtime **before** launching Studio. If you've already launched Studio, quit and complete the configuration steps first.

If you only have one VR headset, installing the corresponding VR app automatically configures the runtime for you. If you have multiple headsets, you must set up the runtime manually and make sure to **only** configure the one that you want to use for testing.

The following steps are for the two most common VR apps:

- SteamVR for headsets such as the HTC Vive and Valve Index.
- Oculus for headsets such as the Meta Quest and Oculus Rift.

#### Steam VR

1. Install and open the SteamVR app on your computer.
2. Under **SteamVR Settings**, select the **Developer** tab. Then select **Show Advanced Settings**.
3. Set SteamVR as OpenXR runtime.
4. Turn the controllers on by pressing the **System** button until you hear a beeping sound.
   - To turn the controller off, press and hold the **System** button until you hear the same beeping sound.

If you follow the steps correctly, the status icons on the SteamVR app and the status lights on the hardware should all be green, indicating that the configuration is completed.

> [!info]
> When you quit the SteamVR app, the controllers automatically turn off. The controllers also automatically turn off after being idle for a period of time.

#### Oculus VR

1. Install and open the Oculus app on your computer.
2. Confirm that your device is connected and the status is ready.
3. Under **Settings / General** in the Oculus app, select **OpenXR Runtime**.
4. **OPTIONAL** Bring up the **Devices** tab and find your headset to confirm the configuration by checking if the status is green without errors.

> [!info]
> When using Oculus VR, ensure the following:
> - At minimum, Oculus drivers require an NVIDIA GeForce GTX 1060 graphics card or equivalent.
> - If you are using a Quest 2 with a link cable, you must enable the link inside the headset.

### Roblox Quest app

You can test your game in the Roblox app on Quest without linking your headset to your computer. Use the following steps to access your game on your headset in this mode:

1. In Studio, [[30 Official Roblox Docs/Production/Publishing/Create and publish games and places#Publish games|publish your game]].
2. Using your [Creator Dashboard](https://create.roblox.com/dashboard/creations) or the link in Studio, open the game page in your web browser.
3. On the game page, add the game to your favorites by clicking the **Favorite** icon.
4. Using your headset, open the standalone Roblox app.
5. Scroll down to the **Favorites** section in the home page and run your game.

### Studio VR mode

After [[30 Official Roblox Docs/Studio/Studio testing modes#Headset configuration|configuring your headset]], you can turn on the Studio VR testing mode through the following steps:

1. In the **File** menu, select **Studio Settings**.
2. Select **Rendering**.
3. Under **General** settings, turn on **Enable VR Mode**.

You can now test your game using your VR headset using any of the available [[30 Official Roblox Docs/Studio/Studio testing modes#Playtesting|playtest options]]. During a VR testing session, if your headset cable disconnects or you close the Roblox Studio Beta app on the headset, you'll need to restart Studio to re-run testing.

## Player emulation

For detailed emulation of game [[30 Official Roblox Docs/Production/Localization/Localization|localization]] and content policies, you can test through the **Player Emulator**, accessible from Studio's **Test** menu.

With the emulator window open, toggle on **Enable Test Profile**. Emulation will remain as toggled (enabled or disabled) even if you close the window.

Lower down in the window, commonly used options include:

| Option | Description |
| --- | --- |
| **Locale** | Lets you emulate a [[30 Official Roblox Docs/Production/Localization/Localization\|localized]] language while playtesting. |
| **Pseudolocalize** | Swaps out characters with similar but slightly different characters so that it's easy to identify which strings are going through the [[30 Official Roblox Docs/Production/Localization/Localization\|translation]] system. Enabling this helps you identify **unlocalized** text without having to change the emulation language. For example:• `Bloxy Cola`  ⟩  `ßℓôж¥ Çôℓá`<br>• `Dominus Empyreus`  ⟩  `Ðô₥ïñúƨ É₥ƥ¥řèúƨ` |
| **Elongate** | Elongates text strings by a factor defined via the slider. For example:• `Bloxy Cola`  ⟩  `Bloooxyy Coolaa` (50% longer)<br>• `Dominus Empyreus`  ⟩  `Doomiinuus Eempyyreus` (30% longer)<br>Using elongation helps you identify places where your user interfaces might not be able to handle text that's longer than the default translated text. Note that Spanish is on average 30% longer than English and the equivalent for German is even longer. Also note that this only affects text that goes through the [[30 Official Roblox Docs/Production/Localization/Localization\|translation]] system. |
| **Region** | Lets you emulate a player's country/region while playtesting; this selection may impact other toggles and checkboxes in the window as outlined in [[30 Official Roblox Docs/API Reference/Classes/PolicyService#GetPolicyInfoForPlayerAsync\|GetPolicyInfoForPlayerAsync()]]. |

---
*Source: [Studio testing modes](https://create.roblox.com/docs/studio/testing-modes) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
