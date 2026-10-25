---
title: "UI styling compatibility"
description: "Outlines all of the classes and associated properties which can be styled."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/styling/compatibility"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Outlines all of the classes and associated properties which can be styled.*

The following tables outline all of the classes and associated properties which can be styled. Additional support may be added over time, so please bookmark this page for reference.

## UI objects

### GuiObject

[[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] is an abstract class from which most UI classes inherit, including [[30 Official Roblox Docs/UI/Frames|frames]], [[30 Official Roblox Docs/UI/Text & image labels|labels]], [[30 Official Roblox Docs/UI/Text & image buttons|buttons]], and more.

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Active\|GuiObject.Active]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint\|GuiObject.AnchorPoint]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize\|GuiObject.AutomaticSize]] | [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize\|Enum.AutomaticSize]] |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor\|GuiObject.BackgroundColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|GuiObject.BackgroundColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency\|GuiObject.BackgroundTransparency]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderColor3\|GuiObject.BorderColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderMode\|GuiObject.BorderMode]] | [[30 Official Roblox Docs/API Reference/Enums/BorderMode\|Enum.BorderMode]] |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BorderSizePixel\|GuiObject.BorderSizePixel]] | integer |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ClipsDescendants\|GuiObject.ClipsDescendants]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Interactable\|GuiObject.Interactable]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#LayoutOrder\|GuiObject.LayoutOrder]] | integer |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Position\|GuiObject.Position]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation\|GuiObject.Rotation]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Selectable\|GuiObject.Selectable]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#SelectionOrder\|GuiObject.SelectionOrder]] | integer |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size\|GuiObject.Size]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#SizeConstraint\|GuiObject.SizeConstraint]] | [[30 Official Roblox Docs/API Reference/Enums/SizeConstraint\|Enum.SizeConstraint]] |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Transparency\|GuiObject.Transparency]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Visible\|GuiObject.Visible]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex\|GuiObject.ZIndex]] | integer |

### GuiButton

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GuiButton#AutoButtonColor\|GuiButton.AutoButtonColor]] | boolean |

### TextLabel

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#Font\|TextLabel.Font]] | [[30 Official Roblox Docs/API Reference/Enums/Font\|Enum.Font]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#FontFace\|TextLabel.FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#LineHeight\|TextLabel.LineHeight]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#MaxVisibleGraphemes\|TextLabel.MaxVisibleGraphemes]] | integer |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#OpenTypeFeatures\|TextLabel.OpenTypeFeatures]] | string |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#RichText\|TextLabel.RichText]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#Text\|TextLabel.Text]] | string |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextColor3\|TextLabel.TextColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextDirection\|TextLabel.TextDirection]] | [[30 Official Roblox Docs/API Reference/Enums/TextDirection\|Enum.TextDirection]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextScaled\|TextLabel.TextScaled]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextSize\|TextLabel.TextSize]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextStrokeColor3\|TextLabel.TextStrokeColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextStrokeTransparency\|TextLabel.TextStrokeTransparency]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextTransparency\|TextLabel.TextTransparency]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextTruncate\|TextLabel.TextTruncate]] | [[30 Official Roblox Docs/API Reference/Enums/TextTruncate\|Enum.TextTruncate]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextWrapped\|TextLabel.TextWrapped]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextXAlignment\|TextLabel.TextXAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/TextXAlignment\|Enum.TextXAlignment]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextYAlignment\|TextLabel.TextYAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/TextYAlignment\|Enum.TextYAlignment]] |

### TextButton

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#Font\|TextButton.Font]] | [[30 Official Roblox Docs/API Reference/Enums/Font\|Enum.Font]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#FontFace\|TextButton.FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#LineHeight\|TextButton.LineHeight]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#MaxVisibleGraphemes\|TextButton.MaxVisibleGraphemes]] | integer |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#OpenTypeFeatures\|TextButton.OpenTypeFeatures]] | string |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#RichText\|TextButton.RichText]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#Text\|TextButton.Text]] | string |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextColor3\|TextButton.TextColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextDirection\|TextButton.TextDirection]] | [[30 Official Roblox Docs/API Reference/Enums/TextDirection\|Enum.TextDirection]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextScaled\|TextButton.TextScaled]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextSize\|TextButton.TextSize]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextStrokeColor3\|TextButton.TextStrokeColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextStrokeTransparency\|TextButton.TextStrokeTransparency]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextTransparency\|TextButton.TextTransparency]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextTruncate\|TextButton.TextTruncate]] | [[30 Official Roblox Docs/API Reference/Enums/TextTruncate\|Enum.TextTruncate]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextWrapped\|TextButton.TextWrapped]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextXAlignment\|TextButton.TextXAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/TextXAlignment\|Enum.TextXAlignment]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextYAlignment\|TextButton.TextYAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/TextYAlignment\|Enum.TextYAlignment]] |

### ImageLabel

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#Image\|ImageLabel.Image]] | `ContentId` |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageColor3\|ImageLabel.ImageColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageContent\|ImageLabel.ImageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageRectOffset\|ImageLabel.ImageRectOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageRectSize\|ImageLabel.ImageRectSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageTransparency\|ImageLabel.ImageTransparency]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ResampleMode\|ImageLabel.ResampleMode]] | [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode\|Enum.ResamplerMode]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ScaleType\|ImageLabel.ScaleType]] | [[30 Official Roblox Docs/API Reference/Enums/ScaleType\|Enum.ScaleType]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#SliceCenter\|ImageLabel.SliceCenter]] | [[30 Official Roblox Docs/API Reference/Datatypes/Rect\|Rect]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#SliceScale\|ImageLabel.SliceScale]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#TileSize\|ImageLabel.TileSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |

### ImageButton

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#HoverImage\|ImageButton.HoverImage]] | `ContentId` |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#HoverImageContent\|ImageButton.HoverImageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#Image\|ImageButton.Image]] | `ContentId` |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageColor3\|ImageButton.ImageColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageContent\|ImageButton.ImageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageRectOffset\|ImageButton.ImageRectOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageRectSize\|ImageButton.ImageRectSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ImageTransparency\|ImageButton.ImageTransparency]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#PressedImage\|ImageButton.PressedImage]] | `ContentId` |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#PressedImageContent\|ImageButton.PressedImageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ResampleMode\|ImageButton.ResampleMode]] | [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode\|Enum.ResamplerMode]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#ScaleType\|ImageButton.ScaleType]] | [[30 Official Roblox Docs/API Reference/Enums/ScaleType\|Enum.ScaleType]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#SliceCenter\|ImageButton.SliceCenter]] | [[30 Official Roblox Docs/API Reference/Datatypes/Rect\|Rect]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#SliceScale\|ImageButton.SliceScale]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/ImageButton#TileSize\|ImageButton.TileSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |

### InputActionLabel

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#FontFace\|InputActionLabel.FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#ImageColor3\|InputActionLabel.ImageColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#ImageTransparency\|InputActionLabel.ImageTransparency]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextColor3\|InputActionLabel.TextColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextSize\|InputActionLabel.TextSize]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextTransparency\|InputActionLabel.TextTransparency]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextWrapped\|InputActionLabel.TextWrapped]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextXAlignment\|InputActionLabel.TextXAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/TextXAlignment\|Enum.TextXAlignment]] |
| [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel#TextYAlignment\|InputActionLabel.TextYAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/TextYAlignment\|Enum.TextYAlignment]] |

### TextBox

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#ClearTextOnFocus\|TextBox.ClearTextOnFocus]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#MultiLine\|TextBox.MultiLine]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#PlaceholderColor3\|TextBox.PlaceholderColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#PlaceholderText\|TextBox.PlaceholderText]] | string |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#ShowNativeInput\|TextBox.ShowNativeInput]] | string |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextEditable\|TextBox.TextEditable]] | boolean |

### ScrollingFrame

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#AutomaticCanvasSize\|ScrollingFrame.AutomaticCanvasSize]] | [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize\|Enum.AutomaticSize]] |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#BottomImage\|ScrollingFrame.BottomImage]] | `ContentId` |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#BottomImageContent\|ScrollingFrame.BottomImageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#CanvasSize\|ScrollingFrame.CanvasSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ElasticBehavior\|ScrollingFrame.ElasticBehavior]] | [[30 Official Roblox Docs/API Reference/Enums/ElasticBehavior\|Enum.ElasticBehavior]] |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#HorizontalScrollBarInset\|ScrollingFrame.HorizontalScrollBarInset]] | [[30 Official Roblox Docs/API Reference/Enums/ScrollBarInset\|Enum.ScrollBarInset]] |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#MidImage\|ScrollingFrame.MidImage]] | `ContentId` |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#MidImageContent\|ScrollingFrame.MidImageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollBarImageColor3\|ScrollingFrame.ScrollBarImageColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollBarImageTransparency\|ScrollingFrame.ScrollBarImageTransparency]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollBarThickness\|ScrollingFrame.ScrollBarThickness]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollingDirection\|ScrollingFrame.ScrollingDirection]] | [[30 Official Roblox Docs/API Reference/Enums/ScrollingDirection\|Enum.ScrollingDirection]] |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#ScrollingEnabled\|ScrollingFrame.ScrollingEnabled]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#TopImage\|ScrollingFrame.TopImage]] | `ContentId` |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#TopImageContent\|ScrollingFrame.TopImageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#VerticalScrollBarInset\|ScrollingFrame.VerticalScrollBarInset]] | [[30 Official Roblox Docs/API Reference/Enums/ScrollBarInset\|Enum.ScrollBarInset]] |
| [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#VerticalScrollBarPosition\|ScrollingFrame.VerticalScrollBarPosition]] | [[30 Official Roblox Docs/API Reference/Enums/VerticalScrollBarPosition\|Enum.VerticalScrollBarPosition]] |

### ViewportFrame

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#Ambient\|ViewportFrame.Ambient]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#ImageColor3\|ViewportFrame.ImageColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#ImageTransparency\|ViewportFrame.ImageTransparency]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#LightColor\|ViewportFrame.LightColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/ViewportFrame#LightDirection\|ViewportFrame.LightDirection]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |

### Path2D

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#Closed\|Path2D.Closed]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#Color3\|Path2D.Color3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#Thickness\|Path2D.Thickness]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#Visible\|Path2D.Visible]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/Path2D#ZIndex\|Path2D.ZIndex]] | integer |

### CanvasGroup

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CanvasGroup#GroupColor3\|CanvasGroup.GroupColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/CanvasGroup#GroupTransparency\|CanvasGroup.GroupTransparency]] | float |

## Appearance modifiers

### UICorner

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius\|UICorner.CornerRadius]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] |
| [[30 Official Roblox Docs/API Reference/Classes/UICorner#BottomLeftRadius\|UICorner.BottomLeftRadius]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] |
| [[30 Official Roblox Docs/API Reference/Classes/UICorner#BottomRightRadius\|UICorner.BottomRightRadius]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] |
| [[30 Official Roblox Docs/API Reference/Classes/UICorner#TopLeftRadius\|UICorner.TopLeftRadius]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] |
| [[30 Official Roblox Docs/API Reference/Classes/UICorner#TopRightRadius\|UICorner.TopRightRadius]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] |

### UIGradient

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Color\|UIGradient.Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence\|ColorSequence]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Enabled\|UIGradient.Enabled]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset\|UIGradient.Offset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation\|UIGradient.Rotation]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Transparency\|UIGradient.Transparency]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence\|NumberSequence]] |

### UIPadding

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIPadding#PaddingBottom\|UIPadding.PaddingBottom]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIPadding#PaddingLeft\|UIPadding.PaddingLeft]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIPadding#PaddingRight\|UIPadding.PaddingRight]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIPadding#PaddingTop\|UIPadding.PaddingTop]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] |

### UIShadow

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIShadow#BlurRadius\|UIShadow.BlurRadius]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Color\|UIShadow.Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Offset\|UIShadow.Offset]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Spread\|UIShadow.Spread]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Transparency\|UIShadow.Transparency]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/UIShadow#ZIndex\|UIShadow.ZIndex]] | integer |

### UIStroke

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIStroke#ApplyStrokeMode\|UIStroke.ApplyStrokeMode]] | [[30 Official Roblox Docs/API Reference/Enums/ApplyStrokeMode\|Enum.ApplyStrokeMode]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Color\|UIStroke.Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Enabled\|UIStroke.Enabled]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/UIStroke#LineJoinMode\|UIStroke.LineJoinMode]] | [[30 Official Roblox Docs/API Reference/Enums/LineJoinMode\|Enum.LineJoinMode]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Thickness\|UIStroke.Thickness]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Transparency\|UIStroke.Transparency]] | float |

## Layout structures

### UIListLayout

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#HorizontalFlex\|UIListLayout.HorizontalFlex]] | [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment\|Enum.UIFlexAlignment]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIListLayout\|UIListLayout.HorizontalPadding]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#ItemLineAlignment\|UIListLayout.ItemLineAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/ItemLineAlignment\|Enum.ItemLineAlignment]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#Padding\|UIListLayout.Padding]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#VerticalFlex\|UIListLayout.VerticalFlex]] | [[30 Official Roblox Docs/API Reference/Enums/UIFlexAlignment\|Enum.UIFlexAlignment]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIListLayout\|UIListLayout.VerticalPadding]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIListLayout#Wraps\|UIListLayout.Wraps]] | boolean |

### UIGridStyleLayout

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#FillDirection\|UIGridStyleLayout.FillDirection]] | [[30 Official Roblox Docs/API Reference/Enums/FillDirection\|Enum.FillDirection]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#HorizontalAlignment\|UIGridStyleLayout.HorizontalAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/HorizontalAlignment\|Enum.HorizontalAlignment]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#SortOrder\|UIGridStyleLayout.SortOrder]] | [[30 Official Roblox Docs/API Reference/Enums/SortOrder\|Enum.SortOrder]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#VerticalAlignment\|UIGridStyleLayout.VerticalAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/VerticalAlignment\|Enum.VerticalAlignment]] |

### UIGridLayout

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout#CellPadding\|UIGridLayout.CellPadding]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout#CellSize\|UIGridLayout.CellSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout#FillDirectionMaxCells\|UIGridLayout.FillDirectionMaxCells]] | integer |
| [[30 Official Roblox Docs/API Reference/Classes/UIGridLayout#StartCorner\|UIGridLayout.StartCorner]] | [[30 Official Roblox Docs/API Reference/Enums/StartCorner\|Enum.StartCorner]] |

### UIPageLayout

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Animated\|UIPageLayout.Animated]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Circular\|UIPageLayout.Circular]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#EasingDirection\|UIPageLayout.EasingDirection]] | [[30 Official Roblox Docs/API Reference/Enums/EasingDirection\|Enum.EasingDirection]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#EasingStyle\|UIPageLayout.EasingStyle]] | [[30 Official Roblox Docs/API Reference/Enums/EasingStyle\|Enum.EasingStyle]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#GamepadInputEnabled\|UIPageLayout.GamepadInputEnabled]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#Padding\|UIPageLayout.Padding]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#ScrollWheelInputEnabled\|UIPageLayout.ScrollWheelInputEnabled]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#TouchInputEnabled\|UIPageLayout.TouchInputEnabled]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout#TweenTime\|UIPageLayout.TweenTime]] | float |

## Size modifiers and constraints

### UIAspectRatioConstraint

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint#AspectRatio\|UIAspectRatioConstraint.AspectRatio]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint#AspectType\|UIAspectRatioConstraint.AspectType]] | [[30 Official Roblox Docs/API Reference/Enums/AspectType\|Enum.AspectType]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint#DominantAxis\|UIAspectRatioConstraint.DominantAxis]] | [[30 Official Roblox Docs/API Reference/Enums/DominantAxis\|Enum.DominantAxis]] |

### UISizeConstraint

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MaxSize\|UISizeConstraint.MaxSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |
| [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MinSize\|UISizeConstraint.MinSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |

### UITextSizeConstraint

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MaxTextSize\|UITextSizeConstraint.MaxTextSize]] | integer |
| [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MinTextSize\|UITextSizeConstraint.MinTextSize]] | integer |

### UIScale

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIScale#Scale\|UIScale.Scale]] | float |

### UIFlexItem

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#FlexMode\|UIFlexItem.FlexMode]] | [[30 Official Roblox Docs/API Reference/Enums/UIFlexMode\|Enum.UIFlexMode]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#GrowRatio\|UIFlexItem.GrowRatio]] | float |
| [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#ItemLineAlignment\|UIFlexItem.ItemLineAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/ItemLineAlignment\|Enum.ItemLineAlignment]] |
| [[30 Official Roblox Docs/API Reference/Classes/UIFlexItem#ShrinkRatio\|UIFlexItem.ShrinkRatio]] | float |

### StyleQuery

[[30 Official Roblox Docs/API Reference/Classes/StyleQuery|StyleQuery]] lets you define conditional breakpoints (like container/media queries) that control when styles apply to the query's parent instance.

| Property | Type |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StyleQuery\|StyleQuery.AspectRatioRange]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] |
| [[30 Official Roblox Docs/API Reference/Classes/StyleQuery\|StyleQuery.MaxSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |
| [[30 Official Roblox Docs/API Reference/Classes/StyleQuery\|StyleQuery.MinSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |
| [[30 Official Roblox Docs/API Reference/Classes/StyleQuery\|StyleQuery.PreferredInputType]] | [[30 Official Roblox Docs/API Reference/Enums/PreferredInput\|Enum.PreferredInput]] |
| [[30 Official Roblox Docs/API Reference/Classes/StyleQuery\|StyleQuery.ReduceMotionEnabled]] | boolean |
| [[30 Official Roblox Docs/API Reference/Classes/StyleQuery\|StyleQuery.ViewportDisplaySize]] | [[30 Official Roblox Docs/API Reference/Enums/DisplaySize\|Enum.DisplaySize]] |

---
*Source: [UI styling compatibility](https://create.roblox.com/docs/ui/styling/compatibility) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
