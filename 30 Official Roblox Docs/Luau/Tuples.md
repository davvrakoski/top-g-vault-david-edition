---
title: "Tuples"
description: "Tuples are lists of values."
area: "30 Official Roblox Docs"
cluster: "Luau"
source: "https://create.roblox.com/docs/luau/tuples"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Tuples are lists of values.*

A **tuple** is a list of values. Many [[30 Official Roblox Docs/Luau/Functions#Methods|methods]] and [[30 Official Roblox Docs/Luau/Functions#Callbacks|callbacks]] in the [[30 Official Roblox Docs/API Reference/API Reference|Roblox Engine API]] accept and return multiple values, but the API Reference says "Tuple" instead of those values.

## Parameters

If a [[30 Official Roblox Docs/Luau/Functions#Methods|method]] or [[30 Official Roblox Docs/Luau/Functions#Callbacks|callback]] accepts a tuple as a parameter, then it accepts multiple values. For example, the API Reference shows that the [[30 Official Roblox Docs/API Reference/Classes/BindableFunction#Invoke|BindableFunction:Invoke()]] method accepts a "Tuple" as a parameter, so it accepts multiple arguments.

```lua
BindableFunction:Invoke(1, true, "string", Vector3.new(0, 0, 0))
```

## Returns

If a [[30 Official Roblox Docs/Luau/Functions#Methods|method]] or [[30 Official Roblox Docs/Luau/Functions#Callbacks|callback]] returns a tuple, then it returns multiple values. For example, the API Reference shows that the [[30 Official Roblox Docs/API Reference/Classes/Players#GetUserThumbnailAsync|Players:GetUserThumbnailAsync()]] method returns a "Tuple", so it returns multiple values. The first return value is a Content URL, and the second is a [[30 Official Roblox Docs/Luau/Booleans|boolean]].

```lua
local Players = game:GetService("Players")

local userId = 156 -- builderman
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
print(content, isReady) -- rbxthumb://type=AvatarHeadShot&id=156&w=420&h=420 true
```

---
*Source: [Tuples](https://create.roblox.com/docs/luau/tuples) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
