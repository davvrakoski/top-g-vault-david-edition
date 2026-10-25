---
area: "01 Start Here"
cluster: "Start Here"
title: "Reading the API Reference - Inheritance, Members and Tags"
tags: [roblox, community-knowledge, start-here, api-reference, documentation, learning]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine
  - https://create.roblox.com/docs/reference/engine/classes/Part
  - https://create.roblox.com/docs/scripting/capabilities
  - https://create.roblox.com/docs/scripting/multithreading
---
# Reading the API Reference - Inheritance, Members and Tags

Tutorials teach one way to do one thing. The **Engine API reference** tells you everything an object can do, and it is always more current than any video. Beginners avoid it because the pages look dense. They are not hard once you know the layout: five kinds of pages, four kinds of members, and a handful of small tags that answer questions like "can I call this from a LocalScript?" or "will this pause my script?". The vault has a full offline copy under [[API Reference]].

## The five kinds of pages

| Page type | What it describes | Examples |
| --- | --- | --- |
| **Classes** | Instances you see in the Explorer, and services | `Part`, `Humanoid`, `TweenService` |
| **Datatypes** | Values that are not instances | `Vector3`, `CFrame`, `Color3`, `UDim2` |
| **Enums** | Fixed lists of options | `Enum.Material`, `Enum.KeyCode` |
| **Libraries** | Built-in function tables | `math`, `string`, `table`, `task` |
| **Globals** | Functions available everywhere | `print`, `require`, `pcall`, `typeof` |

If you are not sure which one you need: things with `.new()` (like `Vector3.new`) are datatypes; things you `Instance.new()` or find in the Explorer are classes.

## Read the inheritance line first

Near the top of a class page is its inheritance chain, for example:

`Part` > `FormFactorPart` > `BasePart` > `PVInstance` > `Instance` > `Object`

A Part has every member of every class in that chain, but each page lists only its **own** members. So if the Part page does not mention `Anchored`, `Touched` or `CFrame`, look at **BasePart**. `Name`, `Parent`, `Destroy` and `FindFirstChild` live on **Instance**. `PivotTo` lives on **PVInstance**. This one habit answers most "the docs don't have it" moments.

## The four kinds of members

- **Properties**: values you read or set (`part.Transparency = 0.5`). The page shows the type, and the detail section often explains defaults and side effects.
- **Methods**: functions you call with a colon (`humanoid:MoveTo(pos)`). Look at the signature: `MoveTo(location: Vector3, part: Instance = nil): ()` means the second argument is optional (defaults to nil) and nothing is returned.
- **Events**: signals you `:Connect()` to. The list shows the arguments your function receives, for example `Touched(otherPart)`.
- **Callbacks**: functions *you* assign that the engine calls, for example `MarketplaceService.ProcessReceipt = function(info) ... end`. Only one function can be assigned; do not `:Connect` them.

## The small tags that matter

| Tag | Meaning for you |
| --- | --- |
| `Deprecated` | Still works for now, but a newer replacement exists. The page usually names it (`wait` > `task.wait`, `SetPrimaryPartCFrame` > `PivotTo`, `LoadCharacter` > `LoadCharacterAsync`). Do not start new code with it. |
| `Yields` | Calling it pauses your script until it finishes (often a web request). Expect a delay, and wrap it in `pcall` if it can fail. |
| `NotReplicated` | Changes are not copied between server and clients. Set it where it is used. |
| `NotCreatable` | You cannot `Instance.new()` it; the engine makes it (services, some internals). |
| `Service` | Get it with `game:GetService("Name")`. |
| `NotScriptable` | Your scripts cannot read or write it at all. |
| **Security**: `PluginSecurity` | Only plugins and the Command Bar can use it; your game scripts get a permission error. |
| **Security**: `RobloxScriptSecurity` | Reserved for Roblox's own scripts. Ignore it. |
| **Thread safety** `ReadSafe` / `Safe` / `Unsafe` | Only relevant with Parallel Luau (Actors). Beginners can ignore it. |
| **Capabilities** | Tied to the experimental script capabilities sandbox. Beginners can ignore it. |

## A worked example: "Can I make a part glow when touched?"

1. Open **BasePart** (because Part inherits it). Find the event **Touched**; it gives `otherPart`.
2. Properties: `Material` (Enum.Material, so check the **Material** enum page for `Neon`) and `Color` (a `Color3` datatype).
3. For a real light, open **PointLight**. Its own page lists `Range`; `Brightness`, `Color` and `Enabled` are on its parent class **Light**, which proves the inheritance habit again.
4. Done: you built the whole feature from the reference, no tutorial needed.

## Habits that save time

- **Search by member name** at the top of the docs site (for example "MoveToFinished"). It finds the class for you.
- **Read the code samples** at the bottom of a member's section; they are short and official.
- **Check the deprecated list** when a tutorial is older than about two years. Old tutorials are the main source of `wait()`, `Instance.new("Part", parent)` and `SetPrimaryPartCFrame`.
- **Trust the reference over AI answers.** If an assistant suggests a method, search it here. If it is not on the page (or its parent pages), it does not exist.

## Related
[[00 START HERE - Top G Vault]] · [[API Reference]] · [[Learning Resources - Official Courses and DevForum Categories]] · [[Starter - Using AI Assistants Safely for Roblox Code]] · [[The Data Model and Finding Objects - GetService, FindFirstChild, WaitForChild]]
