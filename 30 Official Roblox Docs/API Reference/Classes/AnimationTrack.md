---
title: "AnimationTrack"
description: "Controls the playback of an animation on an `Animator`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AnimationTrack"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Controls the playback of an animation on an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Animation
- **Tags:** `NotCreatable`

## Description

Controls the playback of an animation on an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]]. This object cannot be created, instead it is returned by the [[30 Official Roblox Docs/API Reference/Classes/Animator#LoadAnimation|Animator:LoadAnimation()]] method.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Animation\|Animation]] | [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]] | The [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]] object that was used to create this [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#IsPlaying\|IsPlaying]] | boolean | A read-only property that returns true when the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] is playing. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Length\|Length]] | float | A read-only property that returns the length (in seconds) of an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]]. This will return `0` until the animation has fully loaded and thus may not be immediately available. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Looped\|Looped]] | boolean | Sets whether the animation will repeat after finishing. If it is changed while playing the result will take effect after the animation finishes. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Priority\|Priority]] | [[30 Official Roblox Docs/API Reference/Enums/AnimationPriority\|AnimationPriority]] | Sets the priority of an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]]. Depending on what this is set to, playing multiple animations at once will look to this property to figure out which [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]] [[30 Official Roblox Docs/API Reference/Classes/Pose\|Poses]] should be played over one another. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Speed\|Speed]] | float | Read-only property that gives the current playback speed of the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#TimePosition\|TimePosition]] | float | Returns the position in time in seconds that an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] is through playing its source animation. Can be set to make the track jump to a specific moment in the animation. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightCurrent\|WeightCurrent]] | float | Read-only property that gives the current weight of the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightTarget\|WeightTarget]] | float | Read-only property that gives the current weight of the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#AdjustSpeed\|AdjustSpeed()]] | () | Changes the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Speed\|AnimationTrack.Speed]] of an animation. A positive value for speed plays the animation forward, a negative one plays it backwards, and `0` pauses it. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#AdjustWeight\|AdjustWeight()]] | () | Changes the weight of an animation, with the optional `fadeTime` parameter determining how long it takes for [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightCurrent\|AnimationTrack.WeightCurrent]] to reach [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightTarget\|AnimationTrack.WeightTarget]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#GetMarkerReachedSignal\|GetMarkerReachedSignal()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | Returns an [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] (event) that fires when a specified [[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker\|KeyframeMarker]] has been hit in an [[30 Official Roblox Docs/API Reference/Classes/Animation\|animation]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#GetParameter\|GetParameter()]] | Variant | Returns the value of a parameter on the animation graph by key. Returns nil if the parameter has not been set. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#GetParameterDefaults\|GetParameterDefaults()]] | Dictionary | Returns a dictionary of parameter values initially set as instance attributes on the [AnimationGraphDefinition](https://create.roblox.com/docs/reference/engine/classes/AnimationGraphDefinition) instance used to build the animation graph inside this track. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#GetTimeOfKeyframe\|GetTimeOfKeyframe()]] | double | Returns the time position of the first [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]] of the given name in an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Play\|Play()]] | () | Plays the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]]. Once called an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] will play with the specified `fadeTime`, weight and speed. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#SetParameter\|SetParameter()]] | () | Sets a parameter value on the animation graph, driving animation graph node inputs. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Stop\|Stop()]] | () | Stops the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#DidLoop\|DidLoop]] |  | Fires when an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] loops on the next update following the end of the previous animation loop. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Ended\|Ended]] |  | Fires when the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] is completely done moving anything in the world. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#KeyframeReached\|KeyframeReached]] | `keyframeName` | **Deprecated.** Fires every time playback of an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] reaches a [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]] that does not have the default name of `Keyframe`. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Stopped\|Stopped]] |  | Fires when the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] finishes playing. The AnimationTrack might still animate the subject while the animation "fades out". To catch when the AnimationTrack is completely done moving anything in the world, use the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Ended\|AnimationTrack.Ended]] event. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Animation

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `ReadOnly`, `NotReplicated`

The [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] object that was used to create this [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]]. To create an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]], you must load an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] object onto an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] using the [[30 Official Roblox Docs/API Reference/Classes/Animator#LoadAnimation|Animator:LoadAnimation()]] method.

*Code samples for this member (`AnimationPlayed`) are published on the source page; their code is not part of the open-source repo.*

### IsPlaying

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `ReadOnly`, `NotReplicated`

A read-only property that returns true when the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] is playing.

This property can be used to check if an animation is already playing before playing it (as that would cause it to restart). If you want to obtain all playing [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTracks]] on an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] or a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], they should use [[30 Official Roblox Docs/API Reference/Classes/Animator#GetPlayingAnimationTracks|Animator:GetPlayingAnimationTracks()]]

*Code samples for this member (`AnimationTrack-IsPlaying`) are published on the source page; their code is not part of the open-source repo.*

### Length

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `ReadOnly`, `NotReplicated`

A read-only property that returns the length (in seconds) of an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]]. This will return `0` until the animation has fully loaded and thus may not be immediately available.

When the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Speed|AnimationTrack.Speed]] of an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] is equal to `1`, the animation will take [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Length|AnimationTrack.Length]] (in seconds) to complete.

*Code samples for this member (`Animation-Speed-2`) are published on the source page; their code is not part of the open-source repo.*

### Looped

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Animation

This property sets whether the animation will repeat after finishing. If it is changed while playing the result will take effect after the animation finishes.

This property defaults to how it was set in the [[30 Official Roblox Docs/Animation/Animation Editor|Animation Editor]]. However, this property can be changed, allowing control over the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] while it is running. This property also correctly handles animations played in reverse (negative [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Speed|AnimationTrack.Speed]]). After the first keyframe is reached, it will restart at the last keyframe.

*Code samples for this member (`Animation-Looping`, `AnimationTrack-DidLoop`) are published on the source page; their code is not part of the open-source repo.*

### Priority

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AnimationPriority|AnimationPriority]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Animation

This property sets the priority of an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]]. Depending on what this is set to, playing multiple animations at once will look to this property to figure out which [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] poses should be played over one another. It uses [[30 Official Roblox Docs/API Reference/Enums/AnimationPriority|Enum.AnimationPriority]] which has 7 priority levels:

1. [[30 Official Roblox Docs/API Reference/Enums/AnimationPriority|Action4]] (highest priority)
2. [[30 Official Roblox Docs/API Reference/Enums/AnimationPriority|Action3]]
3. [[30 Official Roblox Docs/API Reference/Enums/AnimationPriority|Action2]]
4. [[30 Official Roblox Docs/API Reference/Enums/AnimationPriority|Action]]
5. [[30 Official Roblox Docs/API Reference/Enums/AnimationPriority|Movement]]
6. [[30 Official Roblox Docs/API Reference/Enums/AnimationPriority|Idle]]
7. [[30 Official Roblox Docs/API Reference/Enums/AnimationPriority|Core]] (lowest priority)

Properly set animation priorities, either through the [[30 Official Roblox Docs/Animation/Animation Editor|Animation Editor]] or through this property, allow multiple animations to be played without them clashing. Where two playing animations direct the target to move the same limb in different ways, the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] with the highest priority will show. If both animations have the same priority, the weights of the tracks will be used to combine the animations.

### Speed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `ReadOnly`, `NotReplicated`

This read-only property gives the current playback speed of the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]]. When equal to `1`, the amount of time an animation takes to complete is equal to [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Length|AnimationTrack.Length]], in seconds.

If the speed is adjusted through [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#AdjustSpeed|AnimationTrack:AdjustSpeed()]], the actual time it will take a track to play can be computed by dividing the length by the speed. Speed is a unitless quantity.

*Code samples for this member (`Animation-Speed`, `Animation-Speed-2`) are published on the source page; their code is not part of the open-source repo.*

### TimePosition

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Returns the position in time in seconds that an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] is through playing its source animation. Can be set to make the track jump to a specific moment in the animation, but the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] must be playing to do so. It can also be used in combination with [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#AdjustSpeed|AnimationTrack:AdjustSpeed()]] to freeze the animation at a desired point by setting speed to `0`.

*Code samples for this member (`Animation-TimePosition`) are published on the source page; their code is not part of the open-source repo.*

### WeightCurrent

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `ReadOnly`, `NotReplicated`

When weight is set in an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] it does not change instantaneously but moves from [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightCurrent|AnimationTrack.WeightCurrent]] to [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightTarget|AnimationTrack.WeightTarget]]. The time it takes to do this is determined by the `fadeTime` parameter given when the animation is played, or the weight is adjusted.

[[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightCurrent|AnimationTrack.WeightCurrent]] can be checked against [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightTarget|AnimationTrack.WeightTarget]] to see if the desired weight has been reached. Note that these values should not be checked for equality with the `==` operator, as both of these values are floats. To see if [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightCurrent|AnimationTrack.WeightCurrent]] has reached the target weight, it is recommended to see if the distance between those values is sufficiently small.

*Code samples for this member (`AnimationWeight`) are published on the source page; their code is not part of the open-source repo.*

### WeightTarget

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `ReadOnly`, `NotReplicated`

This read-only property gives the current weight of the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]]. It has a default value of `1` and is set when [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Play|AnimationTrack:Play()]], [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Stop|AnimationTrack:Stop()]] or [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#AdjustWeight|AnimationTrack:AdjustWeight()]] is called. When weight is set in an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] it does not change instantaneously but moves from [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightCurrent|AnimationTrack.WeightCurrent]] to [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightTarget|AnimationTrack.WeightTarget]]. The time it takes to do this is determined by the `fadeTime` parameter given when the animation is played, or the weight is adjusted.

[[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightCurrent|AnimationTrack.WeightCurrent]] can be checked against [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightTarget|AnimationTrack.WeightTarget]] to see if the desired weight has been reached. Note that these values should not be checked for equality with the `==` operator, as both of these values are floats. To see if [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightCurrent|AnimationTrack.WeightCurrent]] has reached the target weight, it is recommended to see if the distance between those values is sufficiently small.

*Code samples for this member (`AnimationWeight`) are published on the source page; their code is not part of the open-source repo.*

## Methods

### AdjustSpeed

```lua
AnimationTrack:AdjustSpeed(speed: float = 1): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `CustomLuaState`

This method changes the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Speed|AnimationTrack.Speed]] of an animation. A positive value for speed plays the animation forward, a negative one plays it backwards, and `0` pauses it.

A track's initial speed is set as a parameter in [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Play|AnimationTrack:Play()]]. However a track's [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Speed|AnimationTrack.Speed]] can be changed during playback using this method. When speed is equal to `1`, the amount of time an animation takes to complete is equal to [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Length|AnimationTrack.Length]] (in seconds).

When is adjusted, then the actual time it will take a track to play can be computed by dividing the length by the speed. [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Speed|AnimationTrack.Speed]] is a unitless quantity.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `speed` | float | `1` | The playback speed the animation is to be changed to. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Animation-Speed-2`, `Animation-Speed`) are published on the source page; their code is not part of the open-source repo.*

### AdjustWeight

```lua
AnimationTrack:AdjustWeight(weight: float = 1, fadeTime: float = 0.100000001): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `CustomLuaState`

Changes the weight of an animation, with the optional `fadeTime` parameter determining how long it takes for [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightCurrent|AnimationTrack.WeightCurrent]] to reach [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightTarget|AnimationTrack.WeightTarget]].

When weight is set in an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] it does not change instantaneously but moves from [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightCurrent|AnimationTrack.WeightCurrent]] to [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightTarget|AnimationTrack.WeightTarget]]. The time it takes to do this is determined by the `fadeTime` parameter given when the animation is played, or the weight is adjusted.

The animation weighting system is used to determine how [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTracks]] playing at the same priority are blended together. The default weight is `1`, and no movement will be visible on an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] with a weight of `0`. The pose that is shown at any point in time is determined by the weighted average of all the [[30 Official Roblox Docs/API Reference/Classes/Pose|Poses]] and the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#WeightCurrent|AnimationTrack.WeightCurrent]] of each [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]]. See below for an example of animation blending in practice. In most cases blending animations is not required and using [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Priority|AnimationTrack.Priority]] is more suitable.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `weight` | float | `1` | The weight the animation is to be changed to. |
| `fadeTime` | float | `0.100000001` | The duration of time that the animation will fade between the old weight and the new weight for. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`AnimationTrack-Change-Weight`) are published on the source page; their code is not part of the open-source repo.*

### GetMarkerReachedSignal

```lua
AnimationTrack:GetMarkerReachedSignal(name: string): RBXScriptSignal
```

**Thread safety:** Unsafe · **Capabilities:** Animation

This method returns an [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal|RBXScriptSignal]] (event) similar to the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#KeyframeReached|AnimationTrack.KeyframeReached]] event, except it only fires when a specified [[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker|KeyframeMarker]] has been hit in an [[30 Official Roblox Docs/API Reference/Classes/Animation|animation]]. The difference allows for greater control of when the event will fire.

To learn more about using this method, see [[30 Official Roblox Docs/Animation/Animation events|here]].

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker|KeyframeMarker]]
- [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]], controls the playback of an animation on a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] or [[30 Official Roblox Docs/API Reference/Classes/AnimationController|AnimationController]]
- [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]], holds the [[30 Official Roblox Docs/API Reference/Classes/Pose|Poses]] applied to joints in a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] at a given point of time in an animation
- [[30 Official Roblox Docs/API Reference/Classes/Keyframe#AddMarker|Keyframe:AddMarker()]]
- [[30 Official Roblox Docs/API Reference/Classes/Keyframe#RemoveMarker|Keyframe:RemoveMarker()]]
- [[30 Official Roblox Docs/API Reference/Classes/Keyframe#GetMarkers|Keyframe:GetMarkers()]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the [[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker\|KeyframeMarker]] the signal is being created for. Not to be confused with the name of the [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal\|RBXScriptSignal]] | The signal created and fired when the animation reaches the created [[30 Official Roblox Docs/API Reference/Classes/KeyframeMarker\|KeyframeMarker]]. |

*Code samples for this member (`listening-to-keyframemarkers`) are published on the source page; their code is not part of the open-source repo.*

### GetParameter

```lua
AnimationTrack:GetParameter(key: string): Variant
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Returns the value of a parameter on the animation graph by key. If the parameter has not been set via [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#SetParameter|AnimationTrack:SetParameter()]], this method returns nil.

Parameters are used to drive inputs on animation graph nodes. Use this method to read back the current value of a parameter that was previously set with [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#SetParameter|AnimationTrack:SetParameter()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The name of the parameter to retrieve. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | The current value of the parameter, or nil if not set. |

### GetParameterDefaults

```lua
AnimationTrack:GetParameterDefaults(): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Returns a dictionary of default parameter values defined by the animation graph. This can be used to discover what parameters are available on an animation graph and their initial values.

If the underlying [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] is not an animation graph, this method returns an empty dictionary.

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary mapping parameter names to their default values. Returns an empty dictionary if the animation is not an animation graph. |

### GetTimeOfKeyframe

```lua
AnimationTrack:GetTimeOfKeyframe(keyframeName: string): double
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Returns the time position of the first [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] of the given name in an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]]. If multiple [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframes]] share the same name, it will return the earliest one in the animation.

This method will return an error if it is uses with an invalid keyframe name (one that does not exist for example) or if the underlying [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] has not yet loaded. To address this make sure only correct keyframe names are used and the animation has loaded before calling this method.

To check if the animation has loaded, verify that the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Length|AnimationTrack.Length]] is greater than zero.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `keyframeName` | string |  | The name associated with the [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]] to be found. |

**Returns**

| Type | Description |
| --- | --- |
| double | The time, in seconds, the [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]] occurs at normal playback speed. |

*Code samples for this member (`Animation-GetTimeOfKeyframe`) are published on the source page; their code is not part of the open-source repo.*

### Play

```lua
AnimationTrack:Play(fadeTime: float = 0.100000001, weight: float = 1, speed: float = 1): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `CustomLuaState`

When [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Play|AnimationTrack:Play()]] is called the track's animation will begin playing and the weight of the animation will increase from `0` to the specified `weight` (defaults to `1`) over the specified `fadeTime`.

The speed the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] will play at is determined by the speed parameter (defaults to `1`). When the speed is equal to `1` the number of seconds the track will take to complete is equal to the track's [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Length|AnimationTrack.Length]] property. For example, a speed of `2` will cause the track to play twice as fast.

The weight and speed of the animation can also be changed after the animation has begun playing by using the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#AdjustWeight|AnimationTrack:AdjustWeight()]] and [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#AdjustSpeed|AnimationTrack:AdjustSpeed()]] methods.

If you want to start the animation at a specific point using [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#TimePosition|AnimationTrack.TimePosition]], it's important the animation is played before this is done.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `fadeTime` | float | `0.100000001` | The duration of time that the animation's weight should be faded in for. |
| `weight` | float | `1` | The weight the animation is to be played at. |
| `speed` | float | `1` | The playback speed of the animation. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Animation-Speed-2`, `Animation-TimePosition`) are published on the source page; their code is not part of the open-source repo.*

### SetParameter

```lua
AnimationTrack:SetParameter(key: string, value: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Sets a parameter value on the animation graph, driving animation graph node inputs. Parameters can be set before or during playback. If set before the animation graph has loaded, the value is stored and applied once the graph is ready.

Non-finite numeric values (NaN, Inf) are sanitized to 0 and produce a warning. Use [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#GetParameterDefaults|AnimationTrack:GetParameterDefaults()]] to discover what parameters are available and their default values.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The name of the parameter to set. |
| `value` | Variant |  | The value to assign to the parameter. Non-finite numeric values are sanitized to 0. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Stop

```lua
AnimationTrack:Stop(fadeTime: float = 0.100000001): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `CustomLuaState`

Stops the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]]. Once called, the weight of the animation will move towards zero over a length of time specified by the optional `fadeTime` parameter. For example, if `Stop()` is called with a `fadeTime` of `2`, it will take two seconds for the weight of the track to reach zero and its effects completely end. Please note this will be the case regardless of the initial weight of the animation.

#### Usage Notes

After calling `Stop()`, subsequent calls to `Stop()` and [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#AdjustWeight|AdjustWeight()]] will not work as expected. To adjust a track that's fading out, you must first call [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Play|Play()]] to reset the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#IsPlaying|IsPlaying]] property to `true`.

It is not recommended to use a `fadeTime` of `0` in an attempt to override this effect and end the animation immediately for [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6Ds]] that have their [[30 Official Roblox Docs/API Reference/Classes/Motor#MaxVelocity|Motor.MaxVelocity]] set to zero, as this causes the joints to freeze in place. If it must end immediately, ensure the [[30 Official Roblox Docs/API Reference/Classes/Motor#MaxVelocity|Motor.MaxVelocity]] of [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6Ds]] in your rig are high enough for them to snap properly.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `fadeTime` | float | `0.100000001` | The time, in seconds, for which animation weight is to be faded out over. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`AnimationTrack-Stop`) are published on the source page; their code is not part of the open-source repo.*

## Events

### DidLoop

```lua
AnimationTrack.DidLoop()
```

**Capabilities:** Animation

This event fires whenever a looped [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] completes a loop, on the next update.

Currently it may also fire at the exact end of a non looped animation track but this behavior should not be relied upon.

*Code samples for this member (`AnimationTrack-DidLoop`) are published on the source page; their code is not part of the open-source repo.*

### Ended

```lua
AnimationTrack.Ended()
```

**Capabilities:** Animation

Fires when the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] is completely done moving anything in the world, meaning the animation has finished playing, the "fade out" is finished, and the subject is in a neutral pose.

You can use this to take action when the animation track's subject is back in a neutral pose that's unaffected by the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] or to clean up the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]].

*Code samples for this member (`AnimationTrack-Ended`) are published on the source page; their code is not part of the open-source repo.*

### KeyframeReached

> [!warning] Deprecated
> This event has been superseded by the
> `Class.AnimationTrack:GetMarkerReachedSignal()` method.

```lua
AnimationTrack.KeyframeReached(keyframeName: string)
```

**Capabilities:** Animation

Fires every time playback of an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] reaches a [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] that does not have the default name of `Keyframe`. This event lets you run code at predefined points in an animation (set by [[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] names).

[[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] names do not need to be unique. For example, if an animation has three keyframes named `Particles`, this event will fire each time one of these keyframes is reached.

[[30 Official Roblox Docs/API Reference/Classes/Keyframe|Keyframe]] names can be set in the [[30 Official Roblox Docs/Animation/Animation Editor|Animation Editor]] when creating or editing an animation. They cannot however be set by a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] on an existing animation prior to playing it.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `keyframeName` | string |  | The name of the [[30 Official Roblox Docs/API Reference/Classes/Keyframe\|Keyframe]] reached. |

### Stopped

```lua
AnimationTrack.Stopped()
```

**Capabilities:** Animation

Fires whenever the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] finishes playing.

This event has a number of uses. It can be used to wait until an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] has stopped before continuing (for example, if chaining a series of animations to play after each other). It can also be used to clean up any [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] created during the animation playback.

*Code samples for this member (`AnimationTrack-Stopped`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [AnimationTrack](https://create.roblox.com/docs/reference/engine/classes/AnimationTrack) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
