---
title: "Graph Editor expressions"
description: "Expressions let you calculate animation graph property and transition condition values with Luau-like formulas."
area: "30 Official Roblox Docs"
cluster: "Animation"
source: "https://create.roblox.com/docs/animation/expressions"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Expressions let you calculate animation graph property and transition condition values with Luau-like formulas.*

An **expression** is a short Luau-like formula that reads graph parameters and returns a value, such as `math.clamp((MovementSpeed + 0.5) / MaxSpeed, 0, 1)`. Use expressions to drive a node property or a [[30 Official Roblox Docs/Animation/Graph Editor state machines|state machine transition]]. Expressions keep parameter transformations and animation decisions in your graph, close to the nodes they drive.

## Prerequisites

Before you create an expression, familiarize yourself with the [[30 Official Roblox Docs/Animation/Animation Graph Editor|Animation Graph Editor]], including how to [[30 Official Roblox Docs/Animation/Animation Graph Editor#Build a graph|open it and create an animation graph]].

## Create an expression

This example uses an expression to drive the **Position** property of an [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|Blend1DNode]]. Configure the node with an idle animation at position 0 and a run animation at position 1. The expression converts the character's movement speed into the 0-to-1 range that the node uses to blend between those animations.

1. Add `MovementSpeed` and `MaxSpeed` Number graph parameters.

   *(image in the full Top G Vault)*

2. Drag a connection from the **Position** property pin of the [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|Blend1DNode]] and select **New Expression**.

   *(image in the full Top G Vault)*

3. Enter the following expression:

   ```lua
   math.clamp(MovementSpeed / MaxSpeed, 0, 1)
   ```

   *(image in the full Top G Vault)*

4. Click outside the expression box to refresh it. As `MovementSpeed` rises toward `MaxSpeed`, the [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|Blend1DNode]] receives a value from 0 to 1 and blends from the idle animation to the run animation.

After you load the graph onto an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]], update `MovementSpeed` and `MaxSpeed` from your gameplay script with [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#SetParameter|AnimationTrack:SetParameter]]. The following example uses the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MoveDirection|MoveDirection]] and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkSpeed|WalkSpeed]] properties of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]:

```lua title="Script - Drive expression parameters"
game:GetService("RunService").Stepped:Connect(function()
    animationTrack:SetParameter("MovementSpeed", humanoid.MoveDirection.Magnitude * humanoid.WalkSpeed)
    animationTrack:SetParameter("MaxSpeed", humanoid.WalkSpeed)
end)
```

The expression evaluates as the parameter values change. For the parameter workflow, see [[30 Official Roblox Docs/Animation/Animation Graph Editor#API integration|API integration]].

## What is supported

Expression support includes arithmetic and comparison operations, logical and conditional expressions, calls to functions in the [[30 Official Roblox Docs/API Reference/Libraries/math|math]] library, construction and member access for [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]], [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]], [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]], and [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] values, and string concatenation. The following sections list the supported syntax and functions.

### Arithmetic and comparisons

Use standard arithmetic and comparison operations, with the usual order of operations. For example, `//` divides and rounds down.

```lua
Speed * 2.0 + Offset
(Health / MaxHealth) * 100
DamageMultiplier ^ 2
Count % 3
10 // 3
Speed < 1
Health >= MaxHealth
```

Comparison operators work with numbers. Use `==` and `~=` to compare numbers, booleans, or strings.

### Logic and short-circuiting

`and`, `or`, and `not` follow Luau truthiness and short-circuit evaluation. Only `false` and `nil` are considered false.

```lua
IsGrounded and GroundSpeed or AirSpeed
not IsDisabled
```

### If-then-else expressions

Use Luau's conditional expression form to branch within a single expression:

```lua
if Speed > 10 then "sprint" elseif Speed > 2 then "run" else "idle"
```

### Math library

Use the [[30 Official Roblox Docs/API Reference/Libraries/math|math]] library. Graph expressions don't yet support [[30 Official Roblox Docs/API Reference/Libraries/math#frexp|math.frexp()]], [[30 Official Roblox Docs/API Reference/Libraries/math#noise|math.noise()]], or [[30 Official Roblox Docs/API Reference/Libraries/math#randomseed|math.randomseed()]]. [[30 Official Roblox Docs/API Reference/Libraries/math#modf|math.modf()]] currently returns only the integer portion.

```lua
math.clamp(Speed / MaxSpeed, 0, 1)
math.sin(Time * 2 * math.pi)
math.atan2(Direction.Y, Direction.X)
math.max(A, B, C)
```

### Vector construction and member access

Construct [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] and [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] values, perform vector arithmetic, and access vector members such as `Magnitude` and `Unit`.

```lua
Vector3.new(math.cos(Time), math.sin(Time), 0)
Vector2.new(InputX, InputY)
MoveDirection.Magnitude * 2.0
Position.X + Offset
Vector3.zero
```

### Color3 construction and member access

Construct [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] values and access their color channels.

```lua
Color3.fromRGB(255, 128, 0)
Color.R
```

### CFrame construction, member access, and operations

Construct [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] values, access CFrame members, and combine them with CFrames or [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] values.

```lua
CFrame.new(Position, LookAtPosition)
CFrame.Angles(RotationX, RotationY, RotationZ)
CFrame.identity
Transform.LookVector
Transform.Position + Vector3.new(0, 1, 0)
```

### String concatenation

Use `..` to concatenate two strings:

```lua
"state_" .. CurrentState
```

### Local variables and multi-line expressions

Use a multi-line expression to break a formula into named steps. A multi-line expression supports `local` declarations, `return`, `if`/`elseif`/`else`, and standalone expressions. Inside an `if` or `else` body, use only `return` or a standalone expression; nested `if` statements and local declarations aren't supported.

```lua
local normalizedSpeed = Speed / MaxSpeed
local eased = math.clamp(normalizedSpeed, 0, 1)
return eased
```

---
*Source: [Graph Editor expressions](https://create.roblox.com/docs/animation/expressions) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
