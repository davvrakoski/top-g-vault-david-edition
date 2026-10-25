---
title: "StarterPlayer"
description: "A service which allows the defaults of properties in the `Player` object to be set."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StarterPlayer"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service which allows the defaults of properties in the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object to be set.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

A service which allows the defaults of properties in the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object to be set. When a player enters the server, each property of the player object is set to the current value of the corresponding property in [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]].

Additionally, you may add four objects to this service:

- A [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]] instance with scripts that run once for each player.
- A [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts|StarterCharacterScripts]] instance with scripts to add to each player's character every time they spawn.
- A [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] instance named `StarterHumanoid` which will be used as the default humanoid for each player's character.
- A [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] instance named `StarterCharacter` which will be used as the character model for all players.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#AllowCustomAnimations\|AllowCustomAnimations]] | boolean | Describes the current game's permission levels regarding custom avatar animations from the website. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#AutoJumpEnabled\|AutoJumpEnabled]] | boolean | Sets whether the character will automatically jump when hitting an obstacle on a mobile device. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#AvatarJointUpgrade\|AvatarJointUpgrade]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] | Controls whether avatars spawn with [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint\|AnimationConstraint]] joints for physical simulation. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CameraMaxZoomDistance\|CameraMaxZoomDistance]] | float | The maximum distance the player's default camera is allowed to zoom out in studs. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CameraMinZoomDistance\|CameraMinZoomDistance]] | float | The minimum distance in studs the player's default camera is allowed to zoom in. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CameraMode\|CameraMode]] | [[30 Official Roblox Docs/API Reference/Enums/CameraMode\|CameraMode]] | Changes the default camera's mode to either first or third person. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterBreakJointsOnDeath\|CharacterBreakJointsOnDeath]] | boolean | Determines the starting value of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#BreakJointsOnDeath\|Humanoid.BreakJointsOnDeath]] for [[30 Official Roblox Docs/API Reference/Classes/Player#Character\|Player.Character]]. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterJumpHeight\|CharacterJumpHeight]] | float | Determines the starting value of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpHeight\|Humanoid.JumpHeight]] for [[30 Official Roblox Docs/API Reference/Classes/Player#Character\|Player.Character]]. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterJumpPower\|CharacterJumpPower]] | float | Determines the starting value of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpPower\|Humanoid.JumpPower]] for [[30 Official Roblox Docs/API Reference/Classes/Player#Character\|Player.Character]]. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterMaxSlopeAngle\|CharacterMaxSlopeAngle]] | float | Determines the starting value of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxSlopeAngle\|Humanoid.MaxSlopeAngle]] for [[30 Official Roblox Docs/API Reference/Classes/Player#Character\|Player.Character]]. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterUseJumpPower\|CharacterUseJumpPower]] | boolean | Determines the starting state of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#UseJumpPower\|Humanoid.UseJumpPower]] for [[30 Official Roblox Docs/API Reference/Classes/Player#Character\|Player.Character]]. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterWalkSpeed\|CharacterWalkSpeed]] | float | Determines the starting value of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkSpeed\|Humanoid.WalkSpeed]] for [[30 Official Roblox Docs/API Reference/Classes/Player#Character\|Player.Character]]. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#ClassicDeath\|ClassicDeath]] | boolean | Controls whether the character uses the classic death behavior when the Humanoid's health reaches zero. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CreateDefaultPlayerModule\|CreateDefaultPlayerModule]] | boolean | Controls how the default player module and related scripts are handled. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#DevCameraOcclusionMode\|DevCameraOcclusionMode]] | [[30 Official Roblox Docs/API Reference/Enums/DevCameraOcclusionMode\|DevCameraOcclusionMode]] | Sets how the default camera handles objects between the camera and the player. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#DevComputerCameraMovementMode\|DevComputerCameraMovementMode]] | [[30 Official Roblox Docs/API Reference/Enums/DevComputerCameraMovementMode\|DevComputerCameraMovementMode]] | Lets you overwrite the player's camera mode on a computer. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#DevComputerMovementMode\|DevComputerMovementMode]] | [[30 Official Roblox Docs/API Reference/Enums/DevComputerMovementMode\|DevComputerMovementMode]] | Lets you overwrite the player's movement mode on a computer. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#DevTouchCameraMovementMode\|DevTouchCameraMovementMode]] | [[30 Official Roblox Docs/API Reference/Enums/DevTouchCameraMovementMode\|DevTouchCameraMovementMode]] | Lets you overwrite the player's camera mode on a touch-enabled device. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#DevTouchMovementMode\|DevTouchMovementMode]] | [[30 Official Roblox Docs/API Reference/Enums/DevTouchMovementMode\|DevTouchMovementMode]] | Lets you overwrite the player's movement mode on a touch-enabled device. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#EnableDynamicHeads\|EnableDynamicHeads]] | [[30 Official Roblox Docs/API Reference/Enums/LoadDynamicHeads\|LoadDynamicHeads]] | Sets the use of dynamic heads. When true, enables the use of avatar heads with facial animation data. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#EnableMouseLockOption\|EnableMouseLockOption]] | boolean | Determines if a player can toggle mouse lock by default. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#HealthDisplayDistance\|HealthDisplayDistance]] | float | Sets the distance at which this player will see other [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] health bars. If set to 0, the health bars will not be displayed. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#LoadCharacterAppearance\|LoadCharacterAppearance]] | boolean | Whether or not the appearance of a player's character should be loaded. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer\|LoadCharacterLayeredClothing]] | [[30 Official Roblox Docs/API Reference/Enums/LoadCharacterLayeredClothing\|LoadCharacterLayeredClothing]] | Indicates whether characters spawning into an experience will have layered clothing accessories equipped on them. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#LuaCharacterController\|LuaCharacterController]] | [[30 Official Roblox Docs/API Reference/Enums/CharacterControlMode\|CharacterControlMode]] | Sets the character controller mode used by the player's character. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#NameDisplayDistance\|NameDisplayDistance]] | float | Sets the distance at which this player will see other [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] names. |
| [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#UserEmotesEnabled\|UserEmotesEnabled]] | boolean | Determines if user-owned emotes are loaded when loading avatars. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AllowCustomAnimations

**Type:** boolean

**Security:** read None / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Character · **Loaded/Saved:** true/true · **Capabilities:** Players · **Tags:** `Hidden`

This property describes the current game's permission levels regarding custom avatar [[30 Official Roblox Docs/API Reference/Classes/Animation|Animations]] from the website.

As such, this value cannot be changed from within the game. It can only be changed by changing the game's permission levels within the game's setting's page on the website.

This property is not intended for use in the game.

### AutoJumpEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Mobile · **Loaded/Saved:** true/true · **Capabilities:** Players

This property sets whether the character will automatically jump when hitting an obstacle on a mobile device.

This property is copied from the [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]] to a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] when they join the game. Following that. the value of this property is copied to [[30 Official Roblox Docs/API Reference/Classes/Humanoid#AutoJumpEnabled|Humanoid.AutoJumpEnabled]] property of the character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] on spawn. In other words, it is possible to set the auto-jump behavior on a per-character, per-player and per-game basis using these three properties.

*Code samples for this member (`Auto-Jump-Toggle`) are published on the source page; their code is not part of the open-source repo.*

### AvatarJointUpgrade

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Character · **Loaded/Saved:** false/false · **Capabilities:** Players · **Tags:** `NotReplicated`

This property controls the rollout state of new [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]] joints in avatars. When disabled, avatars spawn with legacy [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6Ds]] connecting their limbs. When enabled, avatars spawn with [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraints]] and [[30 Official Roblox Docs/API Reference/Classes/BallSocketConstraint|BallSocketConstraints]] connecting their limbs. This makes it easier to write scripts that enable physical simulation, like arm strength and ragdoll falling down.

### CameraMaxZoomDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Players

This property sets the maximum distance in studs the camera can be from the character with the default cameras.

This property sets the default value of [[30 Official Roblox Docs/API Reference/Classes/Player#CameraMaxZoomDistance|Player.CameraMaxZoomDistance]] for each player who joins the game. If this value is set to a lower value than [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CameraMinZoomDistance|StarterPlayer.CameraMinZoomDistance]] it will be increased to CameraMinZoomDistance.

*Code samples for this member (`setting-camera-zoom-distance`) are published on the source page; their code is not part of the open-source repo.*

### CameraMinZoomDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Players

This property sets the minimum distance in studs the camera can be from the character with the default cameras.

This property sets the default value of [[30 Official Roblox Docs/API Reference/Classes/Player#CameraMinZoomDistance|Player.CameraMinZoomDistance]] for each player who joins the game. If this value is set to a higher value than [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CameraMaxZoomDistance|StarterPlayer.CameraMaxZoomDistance]] it will be decreased to CameraMaxZoomDistance.

*Code samples for this member (`setting-camera-zoom-distance`) are published on the source page; their code is not part of the open-source repo.*

### CameraMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/CameraMode|CameraMode]]

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Players

Sets the default value for [[30 Official Roblox Docs/API Reference/Classes/Player#CameraMode|Player.CameraMode]] for each player in the game. The camera has two modes:

#### First Person

In first person mode, the player's camera is zoomed all the way in. Unless there is a visible GUI present with the [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Modal|GuiButton.Modal]] property set to `true`, the mouse will be locked and the user's camera will turn as the mouse moves.

#### Third Person

In third person mode (default), the character can be seen in the camera. While in third person mode on Roblox:

- You may right-click and drag to rotate your camera, or use the arrow keys at the bottom right-hand corner of the screen.
- When you move your mouse, your camera does not change (unless you move the mouse to the end of the screen).
- When you press any of the arrow keys, the user's character will face in the corresponding arrow key's direction.
- You can zoom in and out freely.

*Code samples for this member (`playing-in-first-person`) are published on the source page; their code is not part of the open-source repo.*

### CharacterBreakJointsOnDeath

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Character · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines the starting value of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#BreakJointsOnDeath|Humanoid.BreakJointsOnDeath]] for a player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]].

Note that [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#AvatarJointUpgrade|AvatarJointUpgrade]] must be enabled for this property to take effect.

### CharacterJumpHeight

**Type:** float

**Thread safety:** ReadSafe · **Category:** Character Jump Settings · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines the starting value of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpHeight|Humanoid.JumpHeight]] for a player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]] in studs, with a default of `7.2`.

This property is only visible in the **Properties** window If [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterUseJumpPower|CharacterUseJumpPower]] is set to `false`, as it would not be relevant otherwise.

Since this property is only relevant for characters being spawned in the future, changing it will not change any existing player characters. Changes to this property will only take effect when a player respawns.

### CharacterJumpPower

**Type:** float

**Thread safety:** ReadSafe · **Category:** Character Jump Settings · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines the starting value of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpPower|Humanoid.JumpPower]] for a player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]], with a default of `50`, minimum of `0`, and maximum of `1000`.

This property is only visible in the **Properties** window If [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterUseJumpPower|CharacterUseJumpPower]] is set to `true`, as it would not be relevant otherwise.

Since this property is only relevant for characters being spawned in the future, changing it will not change any existing player characters. Changes to this property will only take effect when a player respawns.

### CharacterMaxSlopeAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Character · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines the starting value of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxSlopeAngle|Humanoid.MaxSlopeAngle]] for a player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]] in degrees. It defaults to `89`, so humanoids can climb pretty much any slope they want by default.

Since this property is only relevant for characters being spawned in the future, changing it will not change any existing player characters. Changes to this property will only take effect when a player respawns.

### CharacterUseJumpPower

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Character Jump Settings · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines the starting value of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#UseJumpPower|Humanoid.UseJumpPower]] for a player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]]. Toggling it will change which property is visible in the **Properties** window ([[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterJumpHeight|CharacterJumpHeight]] if `false` or [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterJumpPower|CharacterJumpPower]] if `true`). Defaults to `true`.

Since this property is only relevant for characters being spawned in the future, changing it will not change any existing player characters. Changes to this property will only take effect when a player respawns.

### CharacterWalkSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Character · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines the starting value of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkSpeed|Humanoid.WalkSpeed]] for a player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]] with a default of `16`.

Since this property is only relevant for characters being spawned in the future, changing it will not change any existing player characters. Changes to this property will only take effect when a player respawns.

### ClassicDeath

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Character · **Loaded/Saved:** true/true · **Capabilities:** Players

When enabled, the character uses the classic death behavior (joints break apart and parts scatter). When disabled, characters spawn with [[30 Official Roblox Docs/API Reference/Classes/Humanoid#BreakJointsOnDeath|Humanoid.BreakJointsOnDeath]] = `false`, and will ragdoll when they die.

### CreateDefaultPlayerModule

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Controls · **Loaded/Saved:** true/true · **Capabilities:** Players, PluginOrOpenCloud

This property is only visible when [[30 Official Roblox Docs/API Reference/Classes/Workspace#PlayerScriptsUseInputActionSystem|Workspace.PlayerScriptsUseInputActionSystem]] is enabled. When set to `true` (default), the `PlayerModule` injection point occurs at [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]]. When set to `false`, the default camera and control scripts will not be added to the place.

### DevCameraOcclusionMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DevCameraOcclusionMode|DevCameraOcclusionMode]]

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Players

Defines how the default camera scripts handle objects between the camera and the camera subject. Applies to all players as they join the experience and can't be changed for individual players.

The default value is [[30 Official Roblox Docs/API Reference/Enums/DevCameraOcclusionMode|Zoom]] (0). See [[30 Official Roblox Docs/API Reference/Enums/DevCameraOcclusionMode|Enum.DevCameraOcclusionMode]] for a list of available modes.

### DevComputerCameraMovementMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DevComputerCameraMovementMode|DevComputerCameraMovementMode]]

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Players

This property lets you overwrite the player's camera mode on a computer.

If set to [[30 Official Roblox Docs/API Reference/Enums/DevComputerCameraMovementMode|UserChoice]], the player's camera movement mode will be determined by whatever they set in the experience's settings. Otherwise, the mode will be set based on this property.

This property does not affect players who are not on a computer.

### DevComputerMovementMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DevComputerMovementMode|DevComputerMovementMode]]

**Thread safety:** ReadSafe · **Category:** Controls · **Loaded/Saved:** true/true · **Capabilities:** Players

This property lets you overwrite the player's movement mode on a computer.

If set to [[30 Official Roblox Docs/API Reference/Enums/DevComputerMovementMode|UserChoice]], the player's movement mode will be determined by whatever they set in the experience's settings. Otherwise, the mode will be set based on this property.

This property does not affect players who are not on a computer.

### DevTouchCameraMovementMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DevTouchCameraMovementMode|DevTouchCameraMovementMode]]

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Players

This property lets you overwrite the player's camera mode on a touch-enabled device.

If set to [[30 Official Roblox Docs/API Reference/Enums/DevTouchCameraMovementMode|UserChoice]], the player's camera movement mode will be determined by whatever they set in the experience's settings. Otherwise, the mode will be set based on this property.

This property does not affect players who are not on a touch-enabled device.

### DevTouchMovementMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DevTouchMovementMode|DevTouchMovementMode]]

**Thread safety:** ReadSafe · **Category:** Controls · **Loaded/Saved:** true/true · **Capabilities:** Players

Lets you overwrite the player's movement mode on a touch-enabled device.

If set to [[30 Official Roblox Docs/API Reference/Enums/DevTouchMovementMode|UserChoice]], the player's movement mode will be determined by whatever they set in the experience's settings. Otherwise, the mode will be set based on this property.

This property does not affect players who are not on a touch-enabled device.

### EnableDynamicHeads

**Type:** [[30 Official Roblox Docs/API Reference/Enums/LoadDynamicHeads|LoadDynamicHeads]]

**Thread safety:** ReadSafe · **Category:** Character · **Loaded/Saved:** true/true · **Capabilities:** Players · **Tags:** `NotScriptable`

Sets the use of dynamic heads. When true, enables the use of avatar heads with facial animation data.

### EnableMouseLockOption

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Controls · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines if a player can toggle mouse lock by default.

Mouselock will lock the player's cursor to the center of the screen. Moving the mouse will rotate the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] and [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] will move relative to the current rotation of the camera.

This property sets the value of [[30 Official Roblox Docs/API Reference/Classes/Player#DevEnableMouseLock|Player.DevEnableMouseLock]].

Note that shift-lock related APIs are in the process of being deprecated, so it's recommended to use [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseBehavior|UserInputService.MouseBehavior]] instead to lock the mouse.

*Code samples for this member (`enabling-a-player-s-mouse-lock`) are published on the source page; their code is not part of the open-source repo.*

### HealthDisplayDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Players

This property sets the distance in studs at which this player will see other [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] health bars. If set to 0, the health bars will not be displayed. This property is set to 100 studs by default.

To change the display distance for a player once they join the game, you can set the [[30 Official Roblox Docs/API Reference/Classes/Player#HealthDisplayDistance|Player.HealthDisplayDistance]] property.

If a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] health bar is visible, you can set the display type using [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayDistanceType|Humanoid.DisplayDistanceType]].

*Code samples for this member (`hiding-player-health-and-names`) are published on the source page; their code is not part of the open-source repo.*

### LoadCharacterAppearance

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Character · **Loaded/Saved:** true/true · **Capabilities:** Players

This property sets whether or not the appearance of a player's character should be loaded.

Setting this to `false` results in the player having no clothes (including hats), body colors, body packages or anything else related to the appearance of the player's avatar. By default, this property is set to `true`.

Setting this to `true` results in the player loading the appearance corresponding to the player's [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAppearanceId|Player.CharacterAppearanceId]].

If [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterWithHumanoidDescriptionAsync|Player:LoadCharacterWithHumanoidDescriptionAsync()]] is used, it can be advantageous to set [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#LoadCharacterAppearance|StarterPlayer.LoadCharacterAppearance]] to false as the player's avatar is not required as all asset IDs to equip on the character will come from the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].

*Code samples for this member (`disabling-a-player-s-appearance`) are published on the source page; their code is not part of the open-source repo.*

### LoadCharacterLayeredClothing

**Type:** [[30 Official Roblox Docs/API Reference/Enums/LoadCharacterLayeredClothing|LoadCharacterLayeredClothing]]

**Thread safety:** ReadSafe · **Category:** Character · **Loaded/Saved:** false/false · **Capabilities:** Players · **Tags:** `NotReplicated`, `NotScriptable`

Indicates whether characters spawning into an experience will have layered clothing accessories equipped on them (Although [[30 Official Roblox Docs/API Reference/Classes/Workspace#MeshPartHeadsAndAccessories|Workspace.MeshPartHeadsAndAccessories]] also need to be enabled in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]).

This property also gates the [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#AutoSkin|WrapLayer.AutoSkin]] feature. When set to `Disabled`, the automatic skinning transfer pipeline for WrapLayers does not run, and [[30 Official Roblox Docs/API Reference/Classes/WrapLayer#AutoSkin|WrapLayer.AutoSkin]] has no effect. For more information, see [[30 Official Roblox Docs/Avatar/Automatic Skinning Transfer|Automatic Skinning Transfer]].

### LuaCharacterController

**Type:** [[30 Official Roblox Docs/API Reference/Enums/CharacterControlMode|CharacterControlMode]]

**Thread safety:** ReadSafe · **Category:** Controls · **Loaded/Saved:** true/true · **Capabilities:** Players

Determines which character controller implementation drives the player's character movement. Accepts a value from [[30 Official Roblox Docs/API Reference/Enums/CharacterControlMode|Enum.CharacterControlMode]]: `Default`, `Legacy`, `NoCharacterController`, or `LuaCharacterController`.

### NameDisplayDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Players

Sets the distance at which this player will see other [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] names. If set to `0`, names are hidden. This property is set to `100` studs by default.

To change the display distance for a player once they join the game, you can set the [[30 Official Roblox Docs/API Reference/Classes/Player#NameDisplayDistance|Player.NameDisplayDistance]] property.

If a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] name is visible, you can set the display type using [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayDistanceType|Humanoid.DisplayDistanceType]].

*Code samples for this member (`hiding-player-health-and-names`) are published on the source page; their code is not part of the open-source repo.*

### UserEmotesEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Character · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines if user-owned emotes are loaded when loading avatars. Setting this property to `false` disables loading. Developers can set the property in Studio directly.

When emote loading is disabled, the emotes UI will still work as long as developers choose to use the emotes feature by adding emotes within their game.

See also [[30 Official Roblox Docs/Characters/Emotes|Avatar Emotes]], an article detailing how to control, customize, and play avatar emotes.

---
*Source: [StarterPlayer](https://create.roblox.com/docs/reference/engine/classes/StarterPlayer) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
