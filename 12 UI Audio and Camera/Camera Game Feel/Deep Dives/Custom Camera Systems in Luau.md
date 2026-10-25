---
area: "12 UI Audio and Camera"
cluster: "Camera Game Feel"
tags: [deep-dive, roblox, camera, luau, over-the-shoulder, game-feel]
verified: 2026-10-25
cssclasses: [tg-a12]
---

# Custom Camera Systems in Luau

## Why this matters
The camera is the player's eyes, hands and comfort all at once. A jittery, clipping or nauseating camera makes players leave even when the game is good, and the default camera doesn't fit shooters, top-down games, racing or cinematic moments.
This note shows when to configure the default camera, when to replace it, and how to write a Scriptable camera (over-the-shoulder, isometric, cinematic) that handles collision, gamepad, mobile and reduced-motion players.

---

## 1. Configure before you replace

Most games need **settings**, not a new camera. In `StarterPlayer` (or per player on `Player`):

| Property | Options / meaning |
|---|---|
| `CameraMaxZoomDistance` / `CameraMinZoomDistance` | Zoom range. Set both equal to lock distance |
| `CameraMode` | `Classic` (third person, zoom to first) or `LockFirstPerson` |
| `DevCameraOcclusionMode` | `Zoom` (zooms in past parts with Transparency < 0.25) or `Invisicam` (fades parts with Transparency < 0.75) |
| `DevComputerCameraMovementMode` / `DevTouchCameraMovementMode` | `UserChoice`, `Classic`, `Follow`, `Orbital`, `CameraToggle` (computer only) |

> [!warning] Docs sample bug
> The official "Camera Zoom Range" sample sets `CameraMaxZoomDistance = 25` and `CameraMinZoomDistance = 50`, so the minimum is larger than the maximum. Use `Min ≤ Max`.

Default `Camera.FieldOfView` is **70** (range 1–120).

---

## 2. Replacing the camera: the rules

- Each client has its own `Camera` at `workspace.CurrentCamera`. Camera code is always client-side (LocalScript in `StarterPlayerScripts` or `StarterCharacterScripts`).
- Set `Camera.CameraType = Enum.CameraType.Scriptable` to stop the default camera scripts from moving it.
- Update `Camera.CFrame` **and** `Camera.Focus` every frame. The docs say to update Focus when Scriptable, because some visuals use the focus point to decide detail.
- Run camera code at the camera render priority with `RunService:BindToRenderStep(name, Enum.RenderPriority.Camera.Value, fn)`. Use `Camera.Value + 1` if you want to run *after* the default camera and offset it rather than replace it.
- Unbind with `RunService:UnbindFromRenderStep(name)` and set `CameraType` back to `Custom` when your mode ends (cutscene over, vehicle exited).
- `workspace.CurrentCamera` can be replaced on respawn in some setups. Re-fetch it on `workspace:GetPropertyChangedSignal("CurrentCamera")`.

---

## 3. Over-the-shoulder (OTS) camera with collision, gamepad and mobile

```lua
-- StarterPlayerScripts/OTSCamera.client.luau
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local OFFSET = Vector3.new(2.5, 2, 9)   -- right, up, back (studs)
local MIN_PITCH, MAX_PITCH = math.rad(-70), math.rad(60)
local MOUSE_SENS = 0.0035               -- radians per pixel
local PAD_SENS = math.rad(220)          -- radians per second at full stick
local COLLISION_RADIUS = 0.6

local yaw, pitch = 0, 0
local padLook = Vector2.zero
local shoulder = 1 -- 1 = right, -1 = left

local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude

UserInputService.InputChanged:Connect(function(input, processed)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		yaw -= input.Delta.X * MOUSE_SENS
		pitch = math.clamp(pitch - input.Delta.Y * MOUSE_SENS, MIN_PITCH, MAX_PITCH)
	elseif input.KeyCode == Enum.KeyCode.Thumbstick2 then
		padLook = Vector2.new(input.Position.X, input.Position.Y)
		if padLook.Magnitude < 0.15 then padLook = Vector2.zero end -- dead zone
	elseif input.UserInputType == Enum.UserInputType.Touch and not processed then
		-- simple touch look: drags on the right half of the screen
		if input.Position.X > camera.ViewportSize.X * 0.5 then
			yaw -= input.Delta.X * MOUSE_SENS * 1.5
			pitch = math.clamp(pitch - input.Delta.Y * MOUSE_SENS * 1.5, MIN_PITCH, MAX_PITCH)
		end
	end
end)

UserInputService.InputBegan:Connect(function(input, processed)
	if processed then return end
	if input.KeyCode == Enum.KeyCode.Q or input.KeyCode == Enum.KeyCode.ButtonL3 then
		shoulder = -shoulder -- shoulder swap
	end
end)

local currentDistanceScale = 1

local function update(dt: number)
	local character = player.Character
	local root = character and character:FindFirstChild("HumanoidRootPart")
	if not root then return end

	yaw -= padLook.X * PAD_SENS * dt
	pitch = math.clamp(pitch + padLook.Y * PAD_SENS * dt, MIN_PITCH, MAX_PITCH)

	local rotation = CFrame.Angles(0, yaw, 0) * CFrame.Angles(pitch, 0, 0)
	local pivot = root.Position + Vector3.new(0, 1.5, 0)
	local desired = CFrame.new(pivot) * rotation * CFrame.new(OFFSET.X * shoulder, OFFSET.Y, OFFSET.Z)

	-- Collision: spherecast from pivot towards desired position
	rayParams.FilterDescendantsInstances = { character }
	local dir = desired.Position - pivot
	local hit = workspace:Spherecast(pivot, COLLISION_RADIUS, dir, rayParams)
	local targetScale = if hit then math.max(0.1, (hit.Distance - 0.2) / dir.Magnitude) else 1
	-- pull in instantly, ease back out (prevents popping through walls)
	currentDistanceScale = if targetScale < currentDistanceScale
		then targetScale
		else currentDistanceScale + (targetScale - currentDistanceScale) * math.min(1, dt * 8)

	local camPos = pivot + dir * currentDistanceScale
	camera.CFrame = CFrame.lookAt(camPos, camPos + rotation.LookVector)
	camera.Focus = CFrame.new(pivot)
end

local function enable()
	camera.CameraType = Enum.CameraType.Scriptable
	UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
	RunService:BindToRenderStep("OTSCamera", Enum.RenderPriority.Camera.Value, update)
end

local function disable()
	RunService:UnbindFromRenderStep("OTSCamera")
	UserInputService.MouseBehavior = Enum.MouseBehavior.Default
	camera.CameraType = Enum.CameraType.Custom
end

-- Release the mouse while the Roblox menu is open
GuiService.MenuOpened:Connect(function() UserInputService.MouseBehavior = Enum.MouseBehavior.Default end)
GuiService.MenuClosed:Connect(function() UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter end)

enable()
return { enable = enable, disable = disable }
```

Make the character face the camera's yaw while aiming (set `Humanoid.AutoRotate = false` and rotate the root on the server-trusted movement path, or use an `AlignOrientation`). Exactly how depends on your movement system.

**Mobile:** the simple right-half drag above conflicts with on-screen buttons. A production version should track one touch ID per drag and ignore touches that began on GUI (`processed`). Test it on phone profiles.

---

## 4. Other camera types in brief

### Isometric / top-down
```lua
local HEIGHT, BACK, FOV = 60, 60, 20 -- narrow FOV fakes orthographic
camera.FieldOfView = FOV
RunService:BindToRenderStep("Iso", Enum.RenderPriority.Camera.Value, function()
	local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if not root then return end
	local target = root.Position
	local pos = target + Vector3.new(BACK, HEIGHT, BACK)
	camera.CFrame = CFrame.lookAt(pos, target)
	camera.Focus = CFrame.new(target)
end)
```
A narrow FOV from far away approximates an orthographic view. Check that streaming radius and fog still cover what the camera sees.

### Cinematic (cutscenes)
- Tween `Camera.CFrame` (and `FieldOfView`) between authored, invisible "camera marker" parts with `TweenService`. Keep each shot as data (marker, duration, easing) so designers can edit it.
- Lock input during the shot and **always** restore `CameraType = Custom` at the end, including when the player dies or leaves mid-cutscene (use `task.delay` safety timeouts).
- Let players skip.

### Vehicle chase camera
Offset relative to the vehicle's `CFrame`, smooth with exponential damping (`alpha = 1 - math.exp(-k * dt)`) so it is frame-rate independent, and widen the FOV slightly with speed (cap it, see below).

---

## 5. Game feel without nausea

| Effect | Good default | Comfort rule |
|---|---|---|
| Screen shake | 0.1–0.4 stud amplitude, < 0.3 s | Disable or reduce when `GuiService.ReducedMotionEnabled` is true |
| FOV kick (sprint, dash) | +5 to +10° | Ease in and out; cap at about 90° |
| Head bob | Off by default in third person | Offer a setting |
| Camera smoothing | Exponential damping with dt | Never lerp with a fixed alpha per frame (frame-rate dependent) |
| Hit stop | 30–80 ms | Don't freeze the camera on every hit |

```lua
local function shakeOffset(t: number, strength: number): CFrame
	if GuiService.ReducedMotionEnabled then
		strength *= 0.2
	end
	local x = math.noise(t * 25, 0, 0) * strength
	local y = math.noise(0, t * 25, 0) * strength
	return CFrame.new(x, y, 0)
end
-- in update(): camera.CFrame = camera.CFrame * shakeOffset(os.clock(), currentShake)
```

---

## 6. Utilities you'll need
- `camera:WorldToViewportPoint(pos)`: world-space markers and nameplates (returns the screen point and an on-screen boolean).
- `camera:ViewportPointToRay(x, y)`: tap or click to select objects in the world (respects the GUI inset differently from `ScreenPointToRay`; test both).
- `camera:GetPartsObscuringTarget(castPoints, ignoreList)`: custom transparency occlusion.
- `camera.ViewportSize`: changes on rotation and resize; listen for changes.

---

## Common mistakes
- Replacing the camera when `StarterPlayer` settings would do.
- Updating the camera in `Heartbeat` or a `while true do wait()` loop, which causes jitter. Use `BindToRenderStep` at camera priority.
- Not updating `Camera.Focus` in Scriptable mode.
- Forgetting to restore `CameraType = Custom` and `MouseBehavior` after cutscenes, vehicles or menus.
- Raycasting for collision without excluding the character.
- Pulling the camera out instantly after a wall, so it pops; pull in fast, ease out slow.
- Frame-rate-dependent smoothing (`lerp(a, b, 0.1)` every frame).
- Shake and FOV kicks that ignore `ReducedMotionEnabled`.
- Desktop-only look controls: no gamepad stick, no touch.

## Checklist
- [ ] Default camera settings evaluated first
- [ ] Scriptable camera bound with `BindToRenderStep` at `RenderPriority.Camera`
- [ ] CFrame and Focus updated every frame
- [ ] Collision with spherecast, character excluded, smooth recovery
- [ ] Mouse, gamepad (Thumbstick2 with dead zone) and touch look all work
- [ ] Mouse unlocks when the Roblox menu opens
- [ ] Mode exit restores `CameraType` and `MouseBehavior`
- [ ] Shake/FOV respect `ReducedMotionEnabled`; FOV capped
- [ ] Tested on phone, console (Controller Emulator) and desktop

---

**Sources checked (2026-10-25):** Creator Docs: Workspace › Customize the camera; Engine API: Camera (CameraType, CFrame, Focus, FieldOfView, WorldToViewportPoint, ViewportPointToRay, GetPartsObscuringTarget), RunService.BindToRenderStep, RenderPriority, WorldRoot.Spherecast, StarterPlayer camera properties, GuiService (ReducedMotionEnabled, MenuOpened/MenuClosed), UserInputService.MouseBehavior.

**Related:** [[Camera Game Feel - Hub]] · [[Camera Obstruction, Shoulder Swap and Lock-On]] · [[Camera, Feel and Game Juice]] · [[Gamepad and Console Design]] · [[Safe Areas, Thumb Zones and Console UI Navigation]]
