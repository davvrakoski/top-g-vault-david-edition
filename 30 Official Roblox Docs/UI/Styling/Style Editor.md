---
title: "Style Editor"
description: "Explore the built-in Style Editor, a comprehensive tool that allows you to create, manage, and apply UI styles for Roblox games."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/styling/editor"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explore the built-in Style Editor, a comprehensive tool that allows you to create, manage, and apply UI styles for Roblox games.*

The built-in **Style Editor** is a comprehensive tool that allows you to create, manage, and apply UI styles for Roblox games through a combination of [[30 Official Roblox Docs/UI/Styling/Style Editor#Style tokens|tokens]], [[30 Official Roblox Docs/UI/Styling/Style Editor#Design sheets|design sheets]], [[30 Official Roblox Docs/UI/Styling/Style Editor#Style rules|style rules]], and [[30 Official Roblox Docs/UI/Styling/Style Editor#Style themes|themes]].

![](https://www.youtube.com/watch?v=_k1ea0OIKaU)

Access the **Style Editor** via the **UI** tab.

*(image in the full Top G Vault)*

Once open, click the **Create Design** button to generate a base style set.

*(image in the full Top G Vault)*

> [!warning]
> Creating a design style set through the Style Editor generates a **BaseStyleSheet** inside a **Design** folder within [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]. This base sheet syncs specific engine‑level defaults like the [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] default of
>
> `[163, 162, 165]`
>
>  with defaults that come from insertion workflows in Studio. It's highly recommended that you do **not** delete or attempt to modify the base style sheet — instead, build tokens and style rules around a design sheet to match your UI goals.
>
> Additionally, a **StyleSheet** sheet is generated in the **Design** folder which contains a [[30 Official Roblox Docs/API Reference/Classes/StyleDerive|StyleDerive]] to the base style sheet. If you choose to remove that [[30 Official Roblox Docs/API Reference/Classes/StyleDerive|StyleDerive]], unstyled values for [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] may become unexpected values, for example a default [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] of
>
> `0, 0, 0, 0`
>
> .

## Style tokens

Style **tokens**, defined through [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attributes]] of a token [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]], represent UI property variables that can be used across styles and components; for example, there could be a common color for a [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|Frame.BackgroundColor3]], [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextColor3|TextLabel.TextColor3]], and [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Color|UIStroke.Color]]. Tokens are comparable to [[30 Official Roblox Docs/UI/Styling/CSS Comparisons#Variables|CSS variables]].

> [!success]
> Although not required for UI styling, tokens are highly recommended for extensible UI design and style updates over time. You should begin by creating the following tokens to understand how they tie into other aspects of universal styling.

1. Create a new token style sheet:

   1. In the left column of the Style Editor, hover over **Tokens**, click the **⊕**, and select **New Token StyleSheet**.
   2. Rename the new sheet to `TokenSheet`.

   *(image in the full Top G Vault)*

2. With the new token sheet selected, create several tokens by clicking **Add a Token…** in the main panel. These tokens will be used throughout this guide for both [[30 Official Roblox Docs/UI/Styling/Style Editor#Style rules|rules]] and [[30 Official Roblox Docs/UI/Styling/Style Editor#Style themes|themes]].

   *(image in the full Top G Vault)*

   | Token Name | Type | Value |
   | --- | --- | --- |
   | `Gold` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | `#ffcc00` |
   | `Magenta` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | `#ff0099` |
   | `Orange` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | `#dd6030` |
   | `Oswald` | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] | `Oswald` |
   | `Rad20` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] | `0, 20` |
   | `RectL` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | `0, 300, 0, 160` |
   | `SquareL` | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | `0, 200, 0, 200` |
   | `Text24` | number | `24` |
   | `Text32` | number | `32` |

   *(image in the full Top G Vault)*

## Design sheets

A design style sheet aggregates [[30 Official Roblox Docs/UI/Styling/Style Editor#Style rules|style rules]] and can be linked to [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] trees to apply style properties to UI instances. Only one [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]] can apply to a given tree, although you can use [[30 Official Roblox Docs/UI/Styling/Style Editor#Style themes|themes]] to swap related styles across your UI, a concept covered later in this guide.

A prepopulated design sheet named **StyleSheet** is created via the **Create Design** button. It contains class rules for common UI objects such as [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] and [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]]. It also contains two [[30 Official Roblox Docs/API Reference/Classes/StyleDerive|StyleDerive]] instances which derive (inherit) [[30 Official Roblox Docs/UI/Styling/Style Editor#Style tokens|tokens]] and styles from the base style sheet for use in your custom styling configurations.

*(image in the full Top G Vault)*

Once you have a design sheet, you can set up a test [[30 Official Roblox Docs/UI/On-screen UI containers|on‑screen container]] to use with the Style Editor, or an [[30 Official Roblox Docs/UI/In-game UI containers|in‑game container]] if desired.

1. Hover over [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] and insert a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]].
2. Confirm that a new [[30 Official Roblox Docs/API Reference/Classes/StyleLink|StyleLink]] instance appears under the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] with its [[30 Official Roblox Docs/API Reference/Classes/StyleLink#StyleSheet|StyleSheet]] property set to the **StyleSheet** design sheet.

   *(image in the full Top G Vault)*

   *(image in the full Top G Vault)*

   > [!info]
   > If the [[30 Official Roblox Docs/API Reference/Classes/StyleLink|StyleLink]] is not created, you can quickly create one by selecting the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] as well as the **StyleSheet** design sheet in the left column of the Style Editor. Then, click the **Insert StyleLink** button in the upper‑right section of the editor's main panel.

## Style rules

Style **rules** apply to every instance that matches the rule's [[30 Official Roblox Docs/API Reference/Classes/StyleRule#Selector|Selector]] definition to match characteristics such as class name, instance tag, and hierarchy relationships. At a high level, instance matching and modification via a rule's [[30 Official Roblox Docs/API Reference/Classes/StyleRule#Selector|Selector]] definition operates through:

- Roblox [[30 Official Roblox Docs/UI/Styling/Style Editor#Class rule|class]] selectors which target all instances of a given UI class, for example [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]], [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]], [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]], etc.
- Instance [[30 Official Roblox Docs/UI/Styling/Style Editor#Tag rule|tag]] selectors that target specific UI objects [[30 Official Roblox Docs/Studio/Properties window#Instance tags|tagged]] through [[30 Official Roblox Docs/API Reference/Classes/CollectionService|CollectionService]].
- Instance [[30 Official Roblox Docs/UI/Styling/Style Editor#UI modifier|modifiers]] applied through phantom [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponents]] such as [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]] or [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]].
- [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] [[30 Official Roblox Docs/UI/Styling/Style Editor#State rule|state]] selectors which correspond to one of the four [[30 Official Roblox Docs/API Reference/Enums/GuiState|Enum.GuiState]] enum values such as [[30 Official Roblox Docs/API Reference/Enums/GuiState|Hover]].
- Instance name selection according to the value of the UI object's [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Instance.Name]].

### Class rule

A style **class** selector targets all instances of a given UI class. The following rule setup styles all [[30 Official Roblox Docs/API Reference/Classes/Frame|Frames]] with a uniform background color and size.

1. In the left column of the Style Editor, select **Frame** in the **UI Elements** branch.

   *(image in the full Top G Vault)*

2. Link two previously created [[30 Official Roblox Docs/UI/Styling/Style Editor#Style tokens|style tokens]] to two [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] properties:

   | Property | Style Token |
   | --- | --- |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|BackgroundColor3]] | `$Magenta` |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size\|Size]] | `$SquareL` |

   1. Click **Add a Property…** in the main panel and select the necessary property. Note that you can type keywords to more quickly find properties in the dropdown menu.
   2. Instead of entering a static value, click the **⋮** button and select **Link Token**.
   3. Click the `$` which appears in the value field and select the proper associated token.

	 *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

3. Insert a new [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] into the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] you previously [[30 Official Roblox Docs/UI/Styling/Style Editor#Design sheets|created and linked]]. The styles you defined should automatically apply to it.

   *(image in the full Top G Vault)*

### Tag rule

Instance **tag** selectors target specific UI objects [[30 Official Roblox Docs/Studio/Properties window#Instance tags|tagged]] through [[30 Official Roblox Docs/API Reference/Classes/CollectionService|CollectionService]]. The following rule setup styles a [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] tagged as `ButtonPrimary` with a custom background color, font, and text size.

1. In the left column of the Style Editor, hover over the **StyleSheet** sheet, click the **⋮** button, and navigate through to **New** ⟩ **Tag**.

   *(image in the full Top G Vault)*

2. Rename the new tag rule `.ButtonPrimary` (note the leading `.`).

   *(image in the full Top G Vault)*

3. Link three previously created [[30 Official Roblox Docs/UI/Styling/Style Editor#Style tokens|style tokens]] to three [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] properties:

   | Property | Style Token |
   | --- | --- |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|BackgroundColor3]] | `$Gold` |
   | [[30 Official Roblox Docs/API Reference/Classes/TextButton#FontFace\|FontFace]] | `$Oswald` |
   | [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextSize\|TextSize]] | `$Text32` |

   1. Click **Add a Property…** in the main panel and select the necessary property. Remember that you can type keywords to more quickly find properties in the dropdown menu.
   2. Instead of entering a static value, click the **⋮** button and select **Link Token**.
   3. Click the `$` which appears in the value field and select the proper associated token.

   *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

4. Insert a new [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] into the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] you previously [[30 Official Roblox Docs/UI/Styling/Style Editor#Design sheets|created and linked]] and [[30 Official Roblox Docs/Studio/Properties window#Instance tags|tag]] it as `ButtonPrimary`. A convenient shortcut is as follows:

   1. Make sure the new [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] is selected in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]].
   2. With the **.ButtonPrimary** tag rule selected in the left column of the Style Editor, click **Apply Tag** in the main panel. The styles you defined should automatically apply to the button.

   *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

### UI modifier

Instance modifier selectors apply phantom [[30 Official Roblox Docs/API Reference/Classes/UIComponent|UIComponents]] such as [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]] or [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] to further style an object. The following rule setup styles a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] with a custom text size and rounded corners.

1. In the left column of the Style Editor, select **TextLabel** in the **UI Elements** branch.

   *(image in the full Top G Vault)*

2. Link a previously created [[30 Official Roblox Docs/UI/Styling/Style Editor#Style tokens|style token]] to the [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextSize|TextSize]] property:

   1. Click **Add a Property…** in the main panel and select the [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextSize|TextSize]] property. Remember that you can type keywords to more quickly find properties in the dropdown menu.
   2. Instead of entering a static value, click the **⋮** button and select **Link Token**.
   3. Click the `$` which appears in the value field and select the `$Text32` token.

   *(image in the full Top G Vault)*

	 *(image in the full Top G Vault)*

A **pseudo instance** is required to configure and apply rounded corners to other elements. To create one:

1. In the left column, hover over **TextLabel**, click the **⋮** button, and navigate through to **New** ⟩ **Pseudo Instance** ⟩ **UICorner**.

   *(image in the full Top G Vault)*

   A new **UICorner** pseudo instance appears under the **TextLabel** element in the left column.

	 *(image in the full Top G Vault)*

2. With the new **UICorner** instance selected in the left column, link a previously created [[30 Official Roblox Docs/UI/Styling/Style Editor#Style tokens|style token]] to the [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius|CornerRadius]] property:

   1. Click **Add a Property…** in the main panel and select the [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius|CornerRadius]] property.
   2. Instead of entering a static value, click the **⋮** button and select **Link Token**.
   3. Click the `$` which appears in the value field and select the `$Rad20` token.

	 *(image in the full Top G Vault)*

3. Insert a new [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] into the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] you previously [[30 Official Roblox Docs/UI/Styling/Style Editor#Design sheets|created and linked]]. The styles you defined should automatically apply to it.

   *(image in the full Top G Vault)*

### State rule

[[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] **state** selectors correspond to one of the four [[30 Official Roblox Docs/API Reference/Enums/GuiState|GuiState]] enum values such as [[30 Official Roblox Docs/API Reference/Enums/GuiState|Hover]], letting you automatically configure style changes for interactive states. The following rule setup creates a hover state of `-4` degrees rotation for all [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButtons]].

1. In the left column of the Style Editor, select **ImageButton** in the **UI Elements** branch.

   *(image in the full Top G Vault)*

2. Click the **⋮** button and navigate through to **New** ⟩ **GuiState** ⟩ **Hover**.

   *(image in the full Top G Vault)*

	 A new **Hover** state modifier instance appears under the **ImageButton** element in the left column.

	 *(image in the full Top G Vault)*

3. With the new **Hover** modifier selected in the left column, click **Add a Property…** in the main panel and select [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation|Rotation]]. Remember that you can type keywords to more quickly find properties in the dropdown menu.
4. Enter `-4` in the property's value field.

   *(image in the full Top G Vault)*

5. Insert a new [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]] into the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] you previously [[30 Official Roblox Docs/UI/Styling/Style Editor#Design sheets|created and linked]]. When you hover over the button in the viewport, it should rotate 4 degrees counterclockwise.

   *(image in the full Top G Vault)*

## Style queries

Style **queries**, similar to [[30 Official Roblox Docs/UI/Styling/CSS Comparisons#Queries|CSS container and media queries]], allow you to apply conditional logic to your UI based on container size, input type, or other factors. The Style Editor provides a streamlined workflow to create both the query logic (conditions) and the resulting styles as a unified set.

### Built-in queries

Some [[30 Official Roblox Docs/API Reference/Classes/StyleQuery|StyleQuery]] conditions are very common, such as changing properties based on the [[30 Official Roblox Docs/API Reference/Classes/GuiService#ViewportDisplaySize|ViewportDisplaySize]]. To simplify this, the Style Editor includes **built‑in** queries which allow you to create conditional rules without needing a pseudo or real instance of a [[30 Official Roblox Docs/API Reference/Classes/StyleQuery|StyleQuery]]; instead, you simply use a query rule with a predefined selector like `ViewportDisplaySizeSmall`.

The following steps demonstrate how to generate built‑in queries for a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] to handle [[30 Official Roblox Docs/API Reference/Enums/DisplaySize|Small]], [[30 Official Roblox Docs/API Reference/Enums/DisplaySize|Medium]], and [[30 Official Roblox Docs/API Reference/Enums/DisplaySize|Large]] viewport sizes.

1. In the left column of the Style Editor, hover over **TextLabel**, click the **⋮** button, and navigate through to **New** ⟩ **StyleQuery** ⟩ **Builtin** ⟩ **ViewportDisplaySize**.

   *(image in the full Top G Vault)*

   This creates a **Queries** folder under the **TextLabel** rule containing three query rules:

   - **@ViewportDisplaySizeLarge** — Define properties that apply when the viewport is [[30 Official Roblox Docs/API Reference/Enums/DisplaySize|Large]].
   - **@ViewportDisplaySizeMedium** — Define properties that apply when the viewport is [[30 Official Roblox Docs/API Reference/Enums/DisplaySize|Medium]].
   - **@ViewportDisplaySizeSmall** — Define properties that apply when the viewport is [[30 Official Roblox Docs/API Reference/Enums/DisplaySize|Small]].

   *(image in the full Top G Vault)*

2. Click **Add a Property…** under each query rule and set the specific [[30 Official Roblox Docs/API Reference/Classes/TextLabel#Text|Text]] string that should display when that query is active:

   | Query Rule | Property | Value |
   | --- | --- | --- |
   | **@ViewportDisplaySizeLarge** | [[30 Official Roblox Docs/API Reference/Classes/TextLabel#Text\|Text]] | `Large Text` |
   | **@ViewportDisplaySizeMedium** | [[30 Official Roblox Docs/API Reference/Classes/TextLabel#Text\|Text]] | `Medium Text` |
   | **@ViewportDisplaySizeSmall** | [[30 Official Roblox Docs/API Reference/Classes/TextLabel#Text\|Text]] | `Small Text` |

3. To verify the queries, use the [[30 Official Roblox Docs/Studio/Studio testing modes|Device Emulator]] to test how the UI responds to different resolutions across three distinct devices:

   1. Insert a new [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] into the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]].
   2. Change the **Device** in the [[30 Official Roblox Docs/Studio/Studio testing modes|Device Emulator]] to see the text change in real time.

      | Size | Example Emulations |
      | --- | --- |
      | [[30 Official Roblox Docs/API Reference/Enums/DisplaySize\|Large]] | **PS5**, **PS4**, **Xbox One** |
      | [[30 Official Roblox Docs/API Reference/Enums/DisplaySize\|Medium]] | **Average Laptop**, **HD 720** |
      | [[30 Official Roblox Docs/API Reference/Enums/DisplaySize\|Small]] | **iPhone XR**, **iPad 7th Generation** |

### Custom query

You can add a style query to any existing rule to create responsive UI that adapts to its container. The following setup configures a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] to automatically change its appearance only when it expands to a width of 400 pixels or more.

1. In the left column of the Style Editor, hover over **TextLabel**, click the **⋮** button, and navigate through to **New** ⟩ **StyleQuery** ⟩ **Custom**.

   *(image in the full Top G Vault)*

   This action creates a **Queries** folder under the **TextLabel** rule containing two linked items:

   - **::StyleQuery** pseudo-instance rule where you define the **Conditions**.
   - **@StyleQuery** rule where you define the **Properties** to apply when those conditions are met.

   *(image in the full Top G Vault)*

2. Select the parent **TextLabel** rule in the main panel and define the following default properties:

   | Property | Value |
   | --- | --- |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|BackgroundColor3]] | `$Magenta` |
   | [[30 Official Roblox Docs/API Reference/Classes/TextLabel#Text\|Text]] | `Default Text` |

3. Select the **::StyleQuery** rule in the main panel, click **Add a Condition…**, and configure the following:

   | Condition | Value |
   | --- | --- |
   | `MinSize` | `400, 0` |

	 > [!info]
	 > See [[30 Official Roblox Docs/API Reference/Classes/StyleQuery#IsActive|StyleQuery.IsActive]] as a reference for other conditions available through the **::StyleQuery** rule.

4. Select the **@StyleQuery** rule in the main panel and set the properties that should apply when the query is active:

   | Property | Value |
   | --- | --- |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|BackgroundColor3]] | `$Gold` |
   | [[30 Official Roblox Docs/API Reference/Classes/TextLabel#Text\|Text]] | `Large Text` |

To verify the query, you can manually resize a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] in the viewport.

1. Insert a new [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] into the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]].
2. Adjust its width to see the style swap in real-time.

   #### 0–400 Pixel Width

   While the [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] width is smaller, the `MinSize` condition is not met and the label uses its default background color and text.

   *(image in the full Top G Vault)*

   #### Over 400 Pixel Width

   As you drag the [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] wider than 400 pixels, the query becomes active and the `@StyleQuery` immediately overrides the base style.

   *(image in the full Top G Vault)*

> [!info]
> While manual resizing is a quick way to check responsive logic, you can also use Studio's built‑in emulation tools for more precise testing:
> - Use the [[30 Official Roblox Docs/Studio/Studio testing modes|Device Emulator]] to test how your UI responds to specific screen resolutions and [[30 Official Roblox Docs/API Reference/Classes/GuiService#ViewportDisplaySize|ViewportDisplaySize]] conditions.
> - Use the [[30 Official Roblox Docs/Studio/Studio testing modes|Controller Emulator]] to verify [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|PreferredInput]] logic, such as switching styles when a gamepad is detected.

## Style transitions

Style **transitions**, comparable to [[30 Official Roblox Docs/UI/Styling/CSS Comparisons#Transitions|CSS transitions]], let you tween property values over a set duration.

### Default

To tween many UI properties with the same parameters, you can set a default transition that applies to **all** properties unless another transition is explicitly set for a specific property.

1. Select **TextButton** in the **UI Elements** branch and then, in the main panel, add three new properties with the following values:

   | Property | Value |
   | --- | --- |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiButton#AutoButtonColor\|AutoButtonColor]] | `false` |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|BackgroundColor3]] | `#335FFF` |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation\|Rotation]] | `0` |

   *(image in the full Top G Vault)*

2. Hover over the parent **TextButton** row, click the ⋮ button, and navigate through to **Insert** ⟩ **Transition**.

   *(image in the full Top G Vault)*

   A default transition of `1, Quad, Out, 0` inserts directly under the **TextButton** rule, indicating a transition of 1 second, easing style [[30 Official Roblox Docs/API Reference/Enums/EasingStyle|Quad]], easing direction [[30 Official Roblox Docs/API Reference/Enums/EasingDirection|Out]], and no delay.

	 *(image in the full Top G Vault)*

3. Hover over the parent **TextButton** row, click the **⋮** button, and navigate through to **New** ⟩ **GuiState** ⟩ **Hover**.

   *(image in the full Top G Vault)*

4. For the new **Hover** modifier, add two new properties as the **targets** for the hover state.

   | Property | Value |
   | --- | --- |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|BackgroundColor3]] | `#33AAFF` |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation\|Rotation]] | `-5` |

	 *(image in the full Top G Vault)*

5. Insert a new [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] into the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] you previously [[30 Official Roblox Docs/UI/Styling/Style Editor#Design sheets|created and linked]]. When you hover over the button in the viewport, it should gradually brighten and rotate 5 degrees counterclockwise.

   *(image in the full Top G Vault)*

### Token-linked

To reuse transition behaviors across multiple rules, you can define **tokens** representing the [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo|TweenInfo]] data type. The following rule setup creates a hover state to transition all [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButtons]] to/from -5 degrees rotation and a lighter background color.

1. If you haven't already, create a [[30 Official Roblox Docs/UI/Styling/Style Editor#Style tokens|token style sheet]] named `TokenSheet`.

   *(image in the full Top G Vault)*

2. With the new token sheet selected, create two new tokens by clicking **Add a Token…** in the main panel.

   | Token Name | Type | Tween Parameters |
   | --- | --- | --- |
   | `CubicOut` | [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo\|TweenInfo]] | • `Duration` = `1.25`<br>• `EasingStyle` = `Cubic`<br>• `EasingDirection` = `Out`<br>• `Delay` = `0` |
   | `QuadInOut` | [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo\|TweenInfo]] | • `Duration` = `0.5`<br>• `EasingStyle` = `Quad`<br>• `EasingDirection` = `InOut`<br>• `Delay` = `0` |

   *(image in the full Top G Vault)*

3. Select **TextButton** in the **UI Elements** branch and then, in the main panel, add three new properties with the following values:

   | Property | Value |
   | --- | --- |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiButton#AutoButtonColor\|AutoButtonColor]] | `false` |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|BackgroundColor3]] | `#335FFF` |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation\|Rotation]] | `0` |

   *(image in the full Top G Vault)*

4. For each new property except for [[30 Official Roblox Docs/API Reference/Classes/GuiButton#AutoButtonColor|AutoButtonColor]], hover over its row, click the **⋮** button, and select **Insert** ⟩ **Transition**.

   *(image in the full Top G Vault)*

5. Hover over the new **Transition** row under each property, click the **⋮** button, and select **Link Token**. Then, instead of entering a static value, click the `$` which appears in the value field and select the proper transition token.

   *(image in the full Top G Vault)*

   | Property Transition | Transition Token |
   | --- | --- |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|BackgroundColor3]] | `$CubicOut` |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size\|Size]] | `$QuadInOut` |

	 *(image in the full Top G Vault)*

6. Hover over the parent **TextButton** row, click the **⋮** button, and navigate through to **New** ⟩ **GuiState** ⟩ **Hover**.

   *(image in the full Top G Vault)*

7. For the new **Hover** modifier, add two new properties as the **targets** for the hover state.

   | Property | Value |
   | --- | --- |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|BackgroundColor3]] | `#33AAFF` |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation\|Rotation]] | `-5` |

	 *(image in the full Top G Vault)*

8. Insert a new [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] into the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] you previously [[30 Official Roblox Docs/UI/Styling/Style Editor#Design sheets|created and linked]]. When you hover over the button in the viewport, it should gradually brighten and rotate 5 degrees counterclockwise.

   *(image in the full Top G Vault)*

## Style themes

Style **themes** consist of sets of specific tokens that can be swapped, for example color tokens that define a "light" and "dark" theme.

### Theme creation

For extensibility, themes are organized into folders. While a single folder may suffice for most purposes, you're free to organize themes in folders like "colors" or "fonts" if desired.

1. Create a new theme folder:

   1. In the left column of the Style Editor, hover over **Themes**, click the **⊕**, and select **New Theme**.
   2. Rename the new **Folder** item to **General**.

   *(image in the full Top G Vault)*

2. Create a new theme style sheet:

   1. Hover over the new **General** folder, click the **⋮** button, and select **New Theme StyleSheet**.
   2. Rename it to **ThemeA**.

   *(image in the full Top G Vault)*

### Theme tokens

Once a theme is constructed, you can link its tokens to various UI object properties such as the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3|BackgroundColor3]] of a [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]]. Theme sheets must use a common set of tokens to work correctly.

With **ThemeA** selected in the left column of the Style Editor:

1. Link three previously created [[30 Official Roblox Docs/UI/Styling/Style Editor#Style tokens|style tokens]] to three new theme tokens:

   | Theme Token | Style Token |
   | --- | --- |
   | `BackColor` | `$Gold` |
   | `ButtonFont` | `$Oswald` |
   | `ButtonTextSize` | `$Text32` |

   1. Click **Add a Token…** in the main panel and enter the theme token's name.
   2. Click the `$` which appears in the value field and select the associated style token.

	 *(image in the full Top G Vault)*

2. In the left column of the Style Editor, select **TextButton** in the **UI Elements** branch.

   *(image in the full Top G Vault)*

3. Link the theme's tokens to three new [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] properties:

   | Property | Theme Token |
   | --- | --- |
   | [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundColor3\|BackgroundColor3]] | `$BackColor` |
   | [[30 Official Roblox Docs/API Reference/Classes/TextButton#FontFace\|FontFace]] | `$ButtonFont` |
   | [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextSize\|TextSize]] | `$ButtonTextSize` |

   1. Click **Add a Property…** in the main panel and select the necessary property.
   2. Instead of entering a static value, click the **⋮** button and select **Link Token**.
   3. Click the `$` which appears in the value field and select the proper theme token.

   *(image in the full Top G Vault)*

   > [!warning]
   > When linking the theme's tokens, look for **\$\[Token\] in ThemeA** in the hover‑over to know the token is coming from the **theme** and not from the global token sheet (remember that the theme already derives the global tokens).

*(image in the full Top G Vault)*

### Theme duplication

Once you have a theme generally established, you can **duplicate** it and change various tokens to define a unique theme style.

1. In the left column of the Style Editor, hover over the **ThemeA** theme, click the **⋮** button, and select **Duplicate**.
2. Rename the duplicated theme to **ThemeB**.

   *(image in the full Top G Vault)*

3. Link two of the theme's tokens to two different style tokens:

   | Theme Token | Style Token |
   | --- | --- |
   | `BackColor` | `$Magenta` |
   | `ButtonTextSize` | `$Text24` |

   1. To the right of the property's value field, click the **⋮** button and select **Unlink Token**.
   2. Click **⋮** again and select **Link Token**.
   3. In its value field, click the `$` and select the new associated style token.

   *(image in the full Top G Vault)*

### Theme swapping

Once you have [[30 Official Roblox Docs/UI/Styling/Style Editor#Theme duplication|multiple themes]], you can swap between them via the theme's folder, or via a script as outlined in [[30 Official Roblox Docs/API Reference/Classes/StyleSheet#SetDerives|SetDerives()]].

1. In the left column of the Style Editor, select the **General** folder in the **Themes** branch.
2. In the main panel, swap between the themes using the radio buttons.

   #### ThemeA

   *(image in the full Top G Vault)*
   *(image in the full Top G Vault)*

   #### ThemeB

   	 *(image in the full Top G Vault)*
      *(image in the full Top G Vault)*

---
*Source: [Style Editor](https://create.roblox.com/docs/ui/styling/editor) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
