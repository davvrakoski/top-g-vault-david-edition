---
title: "Rich text markup"
description: "Rich Text Markup are simple markup tags to style sections of a string."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/rich-text"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Rich Text Markup are simple markup tags to style sections of a string.*

UI **rich text** utilizes simple markup tags to style sections of a string in bold, italics, underline, fill color, stroke variations, and more. You can apply styling tags to [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]], [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]], and [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] objects.

## Enable rich text

You must enable rich text on a per-object basis through its **RichText** property in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, or by setting the property to `true` in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

*(image in the full Top G Vault)*

```lua highlight="2"
local title = Instance.new("TextLabel")
title.RichText = true

title.Text = "Use a <b>bold title</b>"
```

> [!info]
> When editing an object's **Text** property in Studio, toggling the **RichText** checkbox in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window displays the text string as a final render. This is useful for identifying and correcting mistakes in any [[30 Official Roblox Docs/UI/Rich text markup#Supported tags|supported tags]].

> [!warning]
> [[30 Official Roblox Docs/Production/Localization/Localization|Localizing]] a game to support other languages removes rich text formatting tags. To ensure formatting appears in other languages, re-apply the tags manually to your localized strings.

## Supported tags

Rich text tags are similar to XML/HTML tags and you must include both an opening and closing tag around the formatted text.

`<b>Formatted text</b>`

You can also nest tags inside each other as long as you close them in the reverse order of how you opened them.

`<b><i><u>Formatted text</u></i></b>`

### Font color

`<font color=""> </font>`

> `I want the <font color="#FF7800">orange</font> candy.`<br>
> `I want the <font color="rgb(255,125,0)">orange</font> candy.`
> *(image in the full Top G Vault)*

### Font size

`<font size=""> </font>`

> `<font size="40">This is big.</font> <font size="20">This is small.</font>`
> *(image in the full Top G Vault)*

### Font face

`<font face=""> </font>`

> `<font face="Michroma">This is Michroma face.</font>`
> *(image in the full Top G Vault)*

> [!info]
> Font face/family names are listed on the [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]] enum reference page.

### Font family

`<font family=""> </font>`

> `<font family="rbxasset://fonts/families/Michroma.json">This is Michroma face.</font>`
> *(image in the full Top G Vault)*

> [!info]
> Font face/family names are listed on the [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]] enum reference page.

### Font weight

`<font weight=""> </font>`

> `This is normal. <font weight="heavy">This is heavy.</font>`<br>
> `This is normal. <font weight="900">This is heavy.</font>`
> *(image in the full Top G Vault)*

> [!info]
> Font weight can be a case-insensitive string name including `Thin`, `ExtraLight`, `Light`, `Regular`, `Medium`, `SemiBold`, `Bold`, `ExtraBold`, or `Heavy`; it can also be a number in factors of 100 between `100` and `900`.

### Font transparency

`<font transparency=""> </font>`

> `Text at <font transparency="0.5">50% transparency</font>.`
> *(image in the full Top G Vault)*

### Stroke

`<stroke> </stroke>`

| Parameter | Equivalent Property | Example Values |
| --- | --- | --- |
| `color` | [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Color\|UIStroke.Color]] | `"rgb(255,125,0)"`, `"#FF7800"` |
| `thickness` or `th` | [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Thickness\|UIStroke.Thickness]] | `"1"`, `"4"`, `"0.5"` |
| `transparency` or `tr` | [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Transparency\|UIStroke.Transparency]] | `"0"`, `"0.5"`, `"1"` |
| `joins` | [[30 Official Roblox Docs/API Reference/Classes/UIStroke#LineJoinMode\|UIStroke.LineJoinMode]] | `"round"`, `"bevel"`, `"miter"` |
| `sizing` | [[30 Official Roblox Docs/API Reference/Classes/UIStroke#StrokeSizingMode\|UIStroke.StrokeSizingMode]] | `"fixed"`, `"scaled"` |

> `You won <stroke color="#00A2FF" thickness="2" transparency="0.25" joins="miter">25 gems</stroke>.`
> *(image in the full Top G Vault)*

> [!info]
> See [[30 Official Roblox Docs/UI/UI appearance modifiers#Stroke|UI appearance modifiers]] for details on `<stroke>` tag parameters such as `thickness` and `joins`.

### Bold

`<b> </b>`

> `Text in <b>bold</b>.`
> *(image in the full Top G Vault)*

### Italic

`<i> </i>`

> `Text <i>italicized</i>.`
> *(image in the full Top G Vault)*

### Underline

`<u> </u>`

> `Text <u>underlined</u>.`
> *(image in the full Top G Vault)*

### Strikethrough

`<s> </s>`

> `Text with <s>strikethrough</s> applied.`
> *(image in the full Top G Vault)*

### Line break

`<br/>`

> `New line occurs after this sentence.<br/>Next sentence...`
> *(image in the full Top G Vault)*

### Uppercase

`<uppercase> </uppercase>`<br>`<uc> </uc>`

> `<uppercase>Uppercase</uppercase> makes words read loudly!`<br>
> `<uc>Uppercase</uc> makes words read loudly!`
> *(image in the full Top G Vault)*

### Small caps

`<smallcaps> </smallcaps>`<br>`<sc> </sc>`

> `My name is <smallcaps>Diva Dragonslayer</smallcaps>.`<br>
> `My name is <sc>Diva Dragonslayer</sc>.`
> *(image in the full Top G Vault)*

### Mark

`<mark> </mark>`

> `Text <mark color="#009966" transparency="0">highlighted</mark>.`
> *(image in the full Top G Vault)*

### Comment

`<!-- -->`

> `After this is a comment...<!--This does not appear in the final text--> and now more text...`
> *(image in the full Top G Vault)*

## Escape forms

If you want to render certain characters like `<` or `>` and exempt them from consideration as part of rich text tags, you can write them in their **escape form**.

| Character | Escape | Example | Result |
| --- | --- | --- | --- |
| `<` | `&lt;` | `10 &lt; 100` | 10 &lt; 100 |
| `>` | `&gt;` | `100 &gt; 10` | 100 &gt; 10 |
| `"` | `&quot;` | `Meet &quot;Diva Dragonslayer&quot;` | Meet "Diva Dragonslayer" |
| `'` | `&apos;` | `Diva&apos;s pet is a falcon!` | Diva's pet is a falcon! |
| `&` | `&amp;` | `Render another escape form <b>&amp;lt;</b> by escaping an ampersand` | Render another escape form **&amp;lt;** by escaping an ampersand |

---
*Source: [Rich text markup](https://create.roblox.com/docs/ui/rich-text) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
