---
title: "TweenBase"
description: "Abstract base class for in-between interpolation handlers. `Tween` inherits from `TweenBase`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TweenBase"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Abstract base class for in-between interpolation handlers. [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]] inherits from [[30 Official Roblox Docs/API Reference/Classes/TweenBase|TweenBase]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotBrowsable`

## Description

Abstract base class for in-between interpolation handlers; parent class of [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TweenBase#PlaybackState\|PlaybackState]] | [[30 Official Roblox Docs/API Reference/Enums/PlaybackState\|PlaybackState]] | Read-only property that shows the current state for the [[30 Official Roblox Docs/API Reference/Classes/Tween\|Tween]] animation. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Cancel\|Cancel()]] | () | Halts playback and resets the tween variables. If you then call [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Play\|TweenBase:Play()]], the properties of the tween resume interpolating towards their destination, but take the full length of the animation to do so. |
| [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Pause\|Pause()]] | () | Halts playback of the tween. Doesn't reset its progress variables, meaning that if you call [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Play\|TweenBase:Play()]], the tween resumes playback from the moment it was paused. |
| [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Play\|Play()]] | () | Starts playback of a tween. Note that if playback has already started, calling `Play()` has no effect unless the tween has finished or is stopped (either by [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Cancel\|TweenBase:Cancel()]] or [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Pause\|TweenBase:Pause()]]). |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Completed\|Completed]] | `playbackState` | Fires when the tween finishes playing or when stopped with [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Cancel\|TweenBase:Cancel()]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### PlaybackState

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PlaybackState|PlaybackState]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

Read-only property that shows the current stage for the [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]] animation. See [[30 Official Roblox Docs/API Reference/Enums/PlaybackState|Enum.PlaybackState]] for descriptions of each state. Change using functions like [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Play|Tween:Play()]].

*Code samples for this member (`Tween-PlaybackState`) are published on the source page; their code is not part of the open-source repo.*

## Methods

### Cancel

```lua
TweenBase:Cancel(): ()
```

**Thread safety:** Unsafe

Halts playback of a [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]] and resets the tween variables.

Only resets the tween variables, not the properties being changed by the tween. If you cancel a tween halfway through its animation, the properties do not reset to their original values. Differs from [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Pause|TweenBase:Pause()]] in that once resumed, it takes the full duration of the tween to complete the animation.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Tween-Cancel`) are published on the source page; their code is not part of the open-source repo.*

### Pause

```lua
TweenBase:Pause(): ()
```

**Thread safety:** Unsafe

Halts playback of the tween. Doesn't reset its progress variables, meaning that if you call [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Play|TweenBase:Play()]], the tween resumes playback from the moment it was paused.

If you want to reset the progress variables of the tween, use [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Cancel|TweenBase:Cancel()]].

You can only pause tweens that are in the [[30 Official Roblox Docs/API Reference/Classes/TweenBase#PlaybackState|PlaybackState]] of `Enum. PlaybackState.Playing`; tweens in other states won't pause. If a tween is in a different [[30 Official Roblox Docs/API Reference/Classes/TweenBase#PlaybackState|PlaybackState]] such as `Enum. PlaybackState.Delayed` (as a result of its [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#DelayTime|TweenInfo.DelayTime]] being greater than 0), attempting to pause the tween will fail and the tween will play following its specified delay time.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Tween-Pausing`) are published on the source page; their code is not part of the open-source repo.*

### Play

```lua
TweenBase:Play(): ()
```

**Thread safety:** Unsafe

Starts playback of a tween. Note that if playback has already started, calling `Play()` has no effect unless the tween has finished or is stopped (either by [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Cancel|TweenBase:Cancel()]] or [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Pause|TweenBase:Pause()]]).

Multiple tweens can be played on the same object at the same time, but they must not animate the same property. If two tweens attempt to modify the same property, the initial tween is cancelled and overwritten by the most recent tween (see examples).

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Tween-Creation`, `Tween-Conflict`) are published on the source page; their code is not part of the open-source repo.*

## Events

### Completed

```lua
TweenBase.Completed(playbackState: PlaybackState)
```

Fires when the tween finishes playing or when stopped with [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Cancel|TweenBase:Cancel()]].

Passes the [[30 Official Roblox Docs/API Reference/Enums/PlaybackState|Enum.PlaybackState]] of the tween to any connected functions to give an indication of why the tween ended. Note that calling [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Pause|TweenBase:Pause()]] does not fire the `Completed` event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `playbackState` | [[30 Official Roblox Docs/API Reference/Enums/PlaybackState\|PlaybackState]] |  | The [[30 Official Roblox Docs/API Reference/Enums/PlaybackState\|Enum.PlaybackState]] of the tween upon completion. |

*Code samples for this member (`Tween-Completed`, `Tween-Conflict`, `Tween-Completed-2`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [TweenBase](https://create.roblox.com/docs/reference/engine/classes/TweenBase) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
