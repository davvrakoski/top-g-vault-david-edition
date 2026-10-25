---
title: "2D paths"
description: "The Path2D instance, along with its API methods and properties, lets you implement 2D splines and 2D curved lines."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/2D-paths"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Path2D instance, along with its API methods and properties, lets you implement 2D splines and 2D curved lines.*

The [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] instance, along with its API methods and properties, lets you implement 2D splines and 2D curved lines, useful for UI effects like path‑based animations and graph editors.

[Video: Path2D.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/2D-paths/Path2D.mp4)

## Create a 2D path

To add a [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] to the screen or an in-game object:

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, insert a [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] instance under a visible [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] or [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] (it does not need to be a direct child).

   *(image in the full Top G Vault)*

2. Select the new [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] to reveal the in-viewport tooling widget. By default, the **Add Point** tool is selected.

   *(image in the full Top G Vault)*

3. Begin clicking on the screen to add a series of **control points** to form a path. The initial path will likely be imprecise but you can [[30 Official Roblox Docs/UI/2D paths#Move points|fine‑tune]] the position of any control point later.

   *(image in the full Top G Vault)*

   > [!info]
   > If you drag the mouse after clicking, [[30 Official Roblox Docs/UI/2D paths#Control point tangents|tangents]] will be created on that point. Tangents can also be procedurally [[30 Official Roblox Docs/UI/2D paths#Add tangents|added]] to any control point.

4. When finished, click the widget's **Done** button or press <kbd>Enter</kbd>.

## Modify control points

With a [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] selected in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] hierarchy, you can modify its individual control points as well as their [[30 Official Roblox Docs/UI/2D paths#Control point tangents|tangents]].

### Move points

To move an individual control point on a path, enable the **Select** tool (<kbd>V</kbd>) and then click‑and‑drag it to a new position.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

For very specific positioning, select the control point and then, in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, set a new position for the point's [[30 Official Roblox Docs/API Reference/Classes/Path2D#SelectedControlPointData|SelectedControlPointData]] property ([[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]).

*(image in the full Top G Vault)*

Note that a point's position is not absolute, but rather **relative** to the path's parent container. For example, compare a control point 30% from left and 20% from top for a path inside a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]], versus an identical path placed inside a [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] located in the upper‑right corner of the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]].

*(image in the full Top G Vault)*

### Add points

New control points can be added to a [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] either between two existing points or from either end point using the **Add Point** tool (<kbd>P</kbd>).

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*Hover anywhere over the path and click to add a control point between two existing points*

*(image in the full Top G Vault)*

*Click on an end point and then click again to add a control point from that end*

> [!info]
> Remember that if you drag the mouse after clicking to add a new control point, [[30 Official Roblox Docs/UI/2D paths#Control point tangents|tangents]] will be created on that point.

### Delete points

To delete a control point, hover over and right‑click it, then select **Delete Point** from the contextual popup menu.

*(image in the full Top G Vault)*

### Control point tangents

Control point **tangents** let you create and adjust curves on a path.

*(image in the full Top G Vault)*

#### Add tangents

To add tangents to any control point that doesn't already have tangents:

1. Enable the **Add Tangent** tool in the tooling widget.

   *(image in the full Top G Vault)*

2. Hover over the desired control point, then click to add two [[30 Official Roblox Docs/UI/2D paths#Break and mirror|mirrored]] tangents (optionally drag after clicking to [[30 Official Roblox Docs/UI/2D paths#Adjust tangents|adjust]] the new tangents).

   *(image in the full Top G Vault)*

#### Adjust tangents

To adjust existing tangents for an individual control point:

1. Enable the **Select** tool (<kbd>V</kbd>).

   *(image in the full Top G Vault)*

2. Hover over a tangent marker (not the control point), then click‑and‑drag it to a new position. If the tangents are mirrored, the paired tangent point will move in unison.

   *(image in the full Top G Vault)*

To manually set a specific [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] position for a tangent:

1. Enable the **Select** tool (<kbd>V</kbd>) and select the control point.
In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, expand the [[30 Official Roblox Docs/API Reference/Classes/Path2D#SelectedControlPointData|SelectedControlPointData]] field to expose the [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint#LeftTangent|LeftTangent]] and [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint#RightTangent|RightTangent]] properties.

*(image in the full Top G Vault)*

2. Set the position for [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint#LeftTangent|LeftTangent]] and/or [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint#RightTangent|RightTangent]]. Note that this will [[30 Official Roblox Docs/UI/2D paths#Break and mirror|break the mirrored behavior]] of the tangents.

#### Delete tangents

To delete both tangents from a control point, hover over and right-click that point, then select **Clear Tangents** from the contextual popup menu.

*(image in the full Top G Vault)*

To delete just one of the tangents (left or right), hover over and right‑click that tangent's marker, then select **Delete Tangent**.

*(image in the full Top G Vault)*

#### Break and mirror

By default, tangents mirror each other. When you [[30 Official Roblox Docs/UI/2D paths#Adjust tangents|drag to adjust]] one tangent marker, the paired tangent point will move in unison.

*(image in the full Top G Vault)*

To "break" the tangents so that each can be moved independently of the other, hover over and right‑click the associated control point, then select **Break Tangents** from the contextual menu. Once broken, you can move each tangent marker without affecting the other.

*(image in the full Top G Vault)*

> [!info]
> To re-establish mirror behavior, hover over and right‑click the associated control point, then select **Mirror Tangents** from the contextual menu. Note that you will **not** see an immediate change in the path after re‑establishing mirror behavior, as the system cannot predict which tangent point you want to begin mirroring. Mirror behavior will resume only once you [[30 Official Roblox Docs/UI/2D paths#Adjust tangents|drag to adjust]] one of the tangent markers.

## Path visual properties

You can customize the visual appearance of a [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] with the following properties:

| Property | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#Color3\|Color3]] | Sets the color of the path line. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#Thickness\|Thickness]] | Sets the thickness of the path line, in pixels. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#Visible\|Visible]] | Make the path visible or not in both edit and runtime. |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#ZIndex\|ZIndex]] | Order in which a path renders relative to other GUIs. |

*(image in the full Top G Vault)*

*Thickness = 2<br>Color3 = (125, 125, 125)*

*(image in the full Top G Vault)*

*Thickness = 10<br>Color3 = (225, 0, 50)*

*(image in the full Top G Vault)*

*ZIndex layering*

## Path scripting

Scripting is useful for several path-related workflows. The following examples use methods such as [[30 Official Roblox Docs/API Reference/Classes/Path2D#GetControlPoints|GetControlPoints()]] which returns a table of [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint|Path2DControlPoints]] and [[30 Official Roblox Docs/API Reference/Classes/Path2D#GetPositionOnCurveArcLength|GetPositionOnCurveArcLength()]] which returns the [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]] position at a given `t` value along the spline.

```lua title="Arrange UI Objects Across Path"
local parent = script.Parent
local path = parent:FindFirstChildWhichIsA("Path2D")

local function arrangeChildren()
	local segmentCount = #path:GetControlPoints()
	local objectsToArrange = {}

	for _, child in parent:GetChildren() do
		if child:IsA("GuiObject") then
			table.insert(objectsToArrange, child)
		end
	end

	for idx, child in objectsToArrange do
		local t = idx / (#objectsToArrange + 1)
		child.Position = path:GetPositionOnCurveArcLength(t)
	end
end

-- Initially arrange child UI objects across path
arrangeChildren()

-- Listen for children being added/removed to adjust arrangement
parent.ChildAdded:Connect(arrangeChildren)
parent.ChildRemoved:Connect(arrangeChildren)
```

```lua title="Animate UI Object Along Path"
local Tweenservice = game:GetService("TweenService")

local parent = script.Parent
local path = parent:FindFirstChildWhichIsA("Path2D")
local objectToAnimate = parent:FindFirstChildWhichIsA("GuiObject")

local TWEEN_DURATION = 4
local TWEEN_EASING_STYLE = Enum.EasingStyle.Cubic
local TWEEN_EASING_DIRECTION = Enum.EasingDirection.InOut

local pathSampleValue = Instance.new("NumberValue")
local tweenInfo = TweenInfo.new(TWEEN_DURATION, TWEEN_EASING_STYLE, TWEEN_EASING_DIRECTION, 0, true, 2)
local tween = Tweenservice:Create(pathSampleValue, tweenInfo, {Value = 1})

local function onSampleValueChanged()
	objectToAnimate.Position = path:GetPositionOnCurveArcLength(pathSampleValue.Value)
end
pathSampleValue.Changed:Connect(onSampleValueChanged)

tween:Play()
```

## Generation details

A path is generated using a cubic Bézier spline. The mathematical function for the spline is given as follows, where \$\textbf_0\$ and \$\textbf_3\$ are the positional points, and \$\textbf_1\$ and \$\textbf_2\$ are the control points.

\$
\textbf(t) = \left(1-t\right)^\textbf_0+3\left(1-t\right)^t
\textbf_1+3\left(1-t\right)t^\textbf_2+t^\textbf_3
\$

For each section between two [[30 Official Roblox Docs/API Reference/Datatypes/Path2DControlPoint|Path2DControlPoints]], \$\textbf_0\$ represents the position of the first control point, \$\textbf_1\$ represents the first control point's position plus its right tangent, \$\textbf_2\$ represents the second control point's position plus its left tangent, and \$\textbf_3\$ represents the position of the second control point.

---
*Source: [2D paths](https://create.roblox.com/docs/ui/2D-paths) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
