---
title: "Script Editor"
description: "Roblox's built-in, fully-featured script editor includes modern conveniences like autocomplete, code highlighting, and multi-cursor editing."
area: "30 Official Roblox Docs"
cluster: "Studio"
source: "https://create.roblox.com/docs/studio/script-editor"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Roblox's built-in, fully-featured script editor includes modern conveniences like autocomplete, code highlighting, and multi-cursor editing.*

The **Script Editor** in Studio is the primary tool for scripting on Roblox. It's a self-improving environment that can help you write high-impact code, shorten your development time, and iterate on your games. It can improve your scripting experience by:

- Formatting and highlighting syntax in your code.
- Offering ways to [[30 Official Roblox Docs/Studio/Script Editor#Autocomplete features|autocomplete]] phrases in your code as you type.
- Helping you [[30 Official Roblox Docs/Studio/Script Editor#Code navigation|navigate code]] by jumping to variable and function declarations.
- Helping you [[30 Official Roblox Docs/Studio/Script Editor#Find and replace|find and replace]] code in open scripts or all scripts.
- Providing [[30 Official Roblox Docs/Studio/Script Editor#Real-time feedback|real-time feedback]] on your code quality and performance.

The Script Editor supports all types of [[30 Official Roblox Docs/Scripting/Scripting|scripts]] and opens automatically when you create a new script or double-click an existing script in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window.

> [!success]
> You can [[30 Official Roblox Docs/Studio/Script Editor#Editor settings|customize]] the Script Editor to suit your preferences and workflows, including font family/size, formatting behavior, and colors for syntax highlighting. You can also toggle features such as [[30 Official Roblox Docs/Studio/Script Editor#Autocomplete features|autocomplete]], and [[30 Official Roblox Docs/Studio/Script Editor#Script Analysis|script analysis]].

## Autocomplete features

The Script Editor's autocomplete features generate code-related information that can improve your programming efficiency, such as:

- **Informed suggestions** on how to complete phrases as you type them that are contextual to the game's [[30 Official Roblox Docs/Projects/Data model|data model]]. For example, if you have a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] in [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] called **RocketShip**, autocomplete suggests `RocketShip` when you type `workspace.roc` and indicates that it's a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].

   *(image in the full Top G Vault)*

   > [!info]
   > Use the <kbd>↑</kbd> and <kbd>↓</kbd> keys to browse the suggestions, then press <kbd>Tab</kbd> or <kbd>Enter</kbd> to accept a suggestion and insert the complete phrase.

- **Autofill names** for variables and functions that you declare, helping you avoid pesky typos.

   *(image in the full Top G Vault)*

- **Documentation pop-ups with code samples** that are similar to those on the [[30 Official Roblox Docs/API Reference/API Reference|Engine API Reference]], giving you context on the API's usage.

   *(image in the full Top G Vault)*

- **On-hover tooltips** that you can customize with your own defined documentation. Place a [[30 Official Roblox Docs/Luau/Luau comments#Block comments|block comment]] immediately before a function, variable, or other declaration, and the Script Editor shows that comment as a tooltip when you hover over the name later. This also works when the declaration appears inside a type expression, such as `typeof()`:

  ```lua
  export type Icon = {
  	new: typeof(--[[Constructs an empty icon.]] function(): Icon
  		return (nil :: any) :: Icon
  	end),
  }
  ```

   *(image in the full Top G Vault)*

- **On-hover script analysis diagnostics** with information you can use to troubleshoot errors.

   *(image in the full Top G Vault)*

- **Function signatures** when you type an argument, providing you a reference for its parameters and return values.

   *(image in the full Top G Vault)*

## Code navigation

### Go to declaration

You can jump to the declaration of a function or variable by holding <kbd>Ctrl</kbd> on Windows or <kbd>⌘</kbd> on Mac when clicking the call, or by right-clicking its call and clicking **Go to Declaration**.

*(image in the full Top G Vault)*

### Script function filter

The **Script Function Filter** displays a list of all functions declared in a script. To open it, press <kbd>Alt</kbd><kbd>F</kbd> on Windows or <kbd>⌥</kbd><kbd>F</kbd> on Mac. With the list open, you can browse the signatures for each function, filter through them by name, and double-click one to jump to its declaration.

*(image in the full Top G Vault)*

## Find and replace

The **Find/Replace** widget lets you find and replace code in an open script. The widget supports matching case, matching the whole word, and searching by regular expressions. To open it, press <kbd>Ctrl</kbd><kbd>F</kbd> on Windows or <kbd>⌘</kbd><kbd>F</kbd> on Mac.

*(image in the full Top G Vault)*

> [!info]
> For broader searches, the **Find All / Replace All** window lets you find/replace code across multiple scripts in the game. To open it, press <kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>F</kbd> on Windows or <kbd>⌘</kbd><kbd>Shift</kbd><kbd>F</kbd> on Mac.

## Real-time feedback

### Script Analysis

The **Script Analysis** window, accessible through the **Analysis** button in Studio's **Script** tab toolbar, performs static analysis on your scripts and displays active errors and warnings. For more information on the errors and warnings, see the [Luau linting](https://luau.org/lint) documentation.

*(image in the full Top G Vault)*

*Script errors underlined in Script Editor*

*(image in the full Top G Vault)*

*Errors explained in Script Analysis window*

### Output

The [[30 Official Roblox Docs/Studio/Output|Output]] window displays errors captured from running scripts, messages from the Roblox engine, messages from calls to `print()`, and errors from calls to `warn()`.

*(image in the full Top G Vault)*

## Code Assist

**Code Assist** is a feature that suggests lines or functions of code as you type, helping you code more efficiently and stay focused. Based on contexts from your comment and code, suggestions will be triggered in two ways:

- **Automatically** when you pause on a line for a few seconds and the AI model has enough context for a suggestion.
- **Manually** with shortcut <kbd>Alt</kbd><kbd>∖</kbd> on Windows or <kbd>⌥</kbd><kbd>∖</kbd> on Mac.

Press <kbd>Tab</kbd> to accept a suggestion, or ignore it by continuing to type. Currently, your script needs to contain at least a few lines of code to trigger a suggestion.

[Video: Code-Assist.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/script-editor/Code-Assist.mp4)

> [!warning]
> **Code Assist** helps automate basic coding tasks so you can focus on creative work, but it does not always suggest perfect code (see [[30 Official Roblox Docs/Studio/Script Editor#Limitations|Limitations]]). It's still your responsibility to review, test, and determine if the code suggestion is contextually appropriate.

### Improve suggestions

To get more accurate and relevant suggestions, it's recommended that you follow clean coding practices, regardless of assistance, and:

- Break down your code into smaller functions.
- Use descriptive script names that capture the overall intent of what each script does. For example, name a script **SyncCustomSounds** instead of just **Sounds**.
- Assign descriptive names for parameters, functions, and scripts. For example, name a part **GreenSphere** instead of simply **grs**, or name a function `generateSphere()` instead of `gen()`. Using named functions versus anonymous functions can also produce better hints.
- Consistently include well-written [[30 Official Roblox Docs/Luau/Luau comments|comments]] that describe the task you're implementing and what the inputs/outputs should be.
  - Consider including some sample calls with expected results in comments.
  - Suggest how to solve a problem, for instance `-- Use raycast`.
  - Use the exact function or variable name you defined, for example `-- Create 10 greenSphere objects` instead of `-- Create 10 spheres`.
- If you're a novice scripter, start with basic projects such as "make the player jump when they touch the part" or use the tool to generate small code snippets that you can expand upon as your knowledge grows.

### Limitations

The tool helps automate basic coding tasks but it does not always suggest perfect code. Known limitations include:

- Manual triggering does not **always** force-generate a suggestion.
- Suggestions are machine learned from a corpus of code and can thus reflect some limitations of the code they're trained on. For example, suggestions may not use newer APIs in favor of older APIs, or they may use Lua instead of [[30 Official Roblox Docs/Luau/Luau|Luau]].
- The tool may generate incorrect or misleading information that is not useful for your purpose.
- Internal filters attempt to block offensive language, but they're not all-encompassing and there's a possibility the tool may generate offensive or biased information.
- The suggestions may be the same, similar, or different among users, even with the same prompts. Your code, however, will never be shared with others.
- The suggestion may be incomplete due to the limited length of output from the learning models.
- There's a daily cap for the number of suggestions and, once the cap is reached, you will get no suggestions until the next day.

### Code privacy

Currently, Roblox does not use any non-public data to train the learning models. The tool only uses a small subset of free marketplace assets for tuning large language models and the subset has passed various checks for quality and safety filters.

Furthermore, all suggestions are generated **by** the AI model and do not transfer from one user to another. Since your code is not used for model training, it won't be suggested to other users of **Code Assist**, with the one exception of code being posted to free marketplace items.

## Multi-cursor

The Script Editor supports usage of multiple cursors to make edits simultaneously. You can add cursors based on your needs with a mouse click or keyboard shortcut. The initial cursor is called the **primary cursor** and additional cursors are called **secondary cursors**.

- Edits that you make at the primary cursor copy to the secondary cursors. Each edit counts as one action, so undo/redo of an edit applies to all cursors.
- Widgets such as [[30 Official Roblox Docs/Studio/Script Editor#Autocomplete features|autocomplete]] appear on the primary cursor but not the secondary cursors.
- All of the standard [[30 Official Roblox Docs/Studio/Script Editor#Keyboard shortcuts|keyboard shortcuts]] for script editing work with multi-cursor editing, including code indentation, toggling comments, and deleting lines.

The following table summarizes multi-cursor workflows and their shortcuts.

| Command | Windows | Mac |
| --- | --- | --- |
| **Add/remove cursor at mouse location** | <kbd>Alt</kbd> + click | <kbd>⌥</kbd> + click |
| **Remove most recently added cursor** | <kbd>Ctrl</kbd><kbd>U</kbd> | <kbd>⌘</kbd><kbd>U</kbd> |
| **Add/modify cursor on mouse drag** | <kbd>Alt</kbd> + drag | <kbd>⌥</kbd> + drag |
| **Add cursor above/below** | <kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>↑</kbd> / <kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>↓</kbd> | <kbd>⌘</kbd><kbd>⌥</kbd><kbd>↑</kbd> / <kbd>⌘</kbd><kbd>⌥</kbd><kbd>↓</kbd> |
| **Add cursor to next matching selection** | <kbd>Ctrl</kbd><kbd>D</kbd> | <kbd>⌘</kbd><kbd>D</kbd> |
| **Add cursor to every matching selection** | <kbd>Shift</kbd><kbd>Alt</kbd><kbd>L</kbd> | <kbd>Shift</kbd><kbd>⌥</kbd><kbd>L</kbd> |
| **Column/block select** | <kbd>Shift</kbd><kbd>Alt</kbd> + drag | <kbd>Shift</kbd><kbd>⌥</kbd> + drag |
| **Split selections into lines** | <kbd>Shift</kbd><kbd>Alt</kbd><kbd>I</kbd> | <kbd>Shift</kbd><kbd>⌥</kbd><kbd>I</kbd> |

> [!info]
> To remove all secondary cursors, exit multi-cursor editing, and return to the primary cursor, press <kbd>Esc</kbd>.

### Add cursors

You can add cursors with a combination of keyboard shortcuts and mouse maneuvers. Cursors merge if they occupy the same space, such as if you add cursors with arrow keys or delete all the characters between cursors.

#### At mouse location

To add a cursor at your mouse pointer location:

1. Hold <kbd>Alt</kbd> on Windows or <kbd>⌥</kbd> on Mac.
2. Click where you want to add the cursor.

   [Video: AddWithClick.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/script-editor/AddWithClick.mp4)

#### With mouse drag

You can drag the mouse to add a cursor to a selection, split a multi-line selection into lines, or select columns and blocks of code/whitespace.

##### Drag select

To add a cursor to a selection of code through dragging:

1. Hold <kbd>Alt</kbd> on Windows or <kbd>⌥</kbd> on Mac.
2. Click and drag your mouse over the selection of code.

   [Video: AddWithDrag.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/script-editor/AddWithDrag.mp4)

##### Split into lines

To split a multi-line selection into lines and add a cursor at the end of each line, press <kbd>Shift</kbd><kbd>Alt</kbd><kbd>I</kbd> on Windows or <kbd>Shift</kbd><kbd>⌥</kbd><kbd>I</kbd> on Mac.

[Video: SplitSelectionsIntoLines.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/script-editor/SplitSelectionsIntoLines.mp4)

##### Column/block select

To select columns and blocks of code or whitespace, drag the mouse while holding <kbd>Shift</kbd><kbd>Alt</kbd> on Windows or <kbd>Shift</kbd><kbd>⌥</kbd> on Mac. As you drag, a cursor will be added on each highlighted line.

[Video: ColumnBlockSelect.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/script-editor/ColumnBlockSelect.mp4)

#### Above and below primary cursor

To add a cursor directly above or below the primary cursor:

1. Press and hold <kbd>Ctrl</kbd><kbd>Alt</kbd> on Windows or <kbd>⌘</kbd><kbd>⌥</kbd> on Mac.
2. Press the <kbd>↑</kbd> or <kbd>↓</kbd> arrows.

   [Video: AddAboveBelow.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/script-editor/AddAboveBelow.mp4)

#### To matching selections

You can add cursors to all matches of a selection or to the next/previous match, and optionally toggle whether matches are case-sensitive and/or match the whole word.

##### All matching

To add a cursor to all matches of a selected portion:

1. Select the code that you want to search for matches of.
2. Press <kbd>Shift</kbd><kbd>Alt</kbd><kbd>L</kbd> on Windows or <kbd>Shift</kbd><kbd>⌥</kbd><kbd>L</kbd> on Mac.

   [Video: AddToAllMatches.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/script-editor/AddToAllMatches.mp4)

##### Next/previous match

To add a cursor to the **next** matching selection:

1. Select the code that you want to search for matches of.
2. Press <kbd>Ctrl</kbd><kbd>D</kbd> on Windows or <kbd>⌘</kbd><kbd>D</kbd> on Mac.
3. Continue pressing <kbd>Ctrl</kbd><kbd>D</kbd> or <kbd>⌘</kbd><kbd>D</kbd> until you've selected all the next matches that you want.

   [Video: AddToNextPrevMatch.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/script-editor/AddToNextPrevMatch.mp4)

There is no default shortcut for adding a cursor to the **previous** matching selection, but you can add your own:

1. Open **File** ⟩ **Advanced** ⟩ **Customize Shortcuts**.
2. In the shortcuts window, locate **Select previous occurrence**.

   *(image in the full Top G Vault)*

3. Double-click the action's **Shortcut** field and enter your own custom key combination, such as <kbd>Shift</kbd><kbd>Ctrl</kbd><kbd>D</kbd> to pair alongside "next" matching's default of <kbd>Ctrl</kbd><kbd>D</kbd>.
4. Confirm your setting by clicking **OK** in the bottom-right corner of the window.

##### Case or whole word match

For each of the matching-related workflows above, you can match **case** and/or **whole word** as follows:

1. Open the Find/Replace tool (<kbd>Ctrl</kbd><kbd>F</kbd> on Windows or <kbd>⌘</kbd><kbd>F</kbd> on Mac).
2. Use the toggle buttons to choose if a matched selection should be case-sensitive and/or match the whole word only.

   *(image in the full Top G Vault)*

   [Video: MatchCaseWholeWord1.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/script-editor/MatchCaseWholeWord1.mp4)

   [Video: MatchCaseWholeWord2.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/script-editor/MatchCaseWholeWord2.mp4)

### Remove cursors

You can remove cursors with the following keyboard shortcuts and mouse maneuvers. Alternatively, you can exit multi-cursor editing by pressing <kbd>Esc</kbd>.

#### At mouse location

To remove a cursor:

1. Press and hold <kbd>Alt</kbd> on Windows or <kbd>⌥</kbd> on Mac.
2. Click the cursor you want to remove.

   [Video: RemoveWithClick.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/script-editor/RemoveWithClick.mp4)

#### Most recently added

To remove the most recently added cursor, press <kbd>Ctrl</kbd><kbd>U</kbd> on Windows or <kbd>⌘</kbd><kbd>U</kbd> on Mac.

[Video: UndoRecentCursor.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/script-editor/UndoRecentCursor.mp4)

### Copy and paste cursors

Copying a selection of code includes the cursors within it. The behavior of the paste depends on the number of cursors at the source and the number of cursors at the destination:

- If the number of cursors are the same, then each copied cursor pastes to each corresponding destination cursor.
- If the number of cursors are different, then each cursor at the destination receives the entire paste with each copied cursor as a new line.

[Video: CopyPaste.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/script-editor/CopyPaste.mp4)

### On-type formatting

Pressing enter/return will auto-indent each cursor at the new line relative to
the previous line. If the previous line starts with an incomplete block, the formatter will try to complete it.

[Video: OnTypeFormatting.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/script-editor/OnTypeFormatting.mp4)

## Editor settings

Many customization options are accessible via the **Script Editor** tab of [[30 Official Roblox Docs/Studio/Roblox Studio setup#Customization|Studio Settings]]. Commonly modified options include:

| Option | Description |
| --- | --- |
| **Font** | Font face and size for code in the editor. |
| **Tab width** | Number of spaces representing a <kbd>Tab</kbd> indent. |
| **Indent using spaces** | If enabled, spaces equal to **Tab Width** are inserted with <kbd>Tab</kbd> press. |
| **Text wrapping** | If enabled, longer lines of code wrap to the next line. |
| **Script Editor color preset** | Color preset for code elements, selection colors, and more. After choosing a preset, you can set specific colors for options like **Selection Color** and **Comment Color**. |

## Keyboard shortcuts

The Script Editor has the following keyboard shortcuts.

### File and display

| Command | Windows | Mac |
| --- | --- | --- |
| **Close script** | <kbd>Ctrl</kbd><kbd>W</kbd> | <kbd>⌘</kbd><kbd>W</kbd> |
| **Reopen last closed script** | <kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>T</kbd> | <kbd>⌘</kbd><kbd>Shift</kbd><kbd>T</kbd> |
| **Quick open** | <kbd>Ctrl</kbd><kbd>P</kbd> | <kbd>⌘</kbd><kbd>P</kbd> |
| **Show script in Explorer** | <kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>K</kbd> | <kbd>⌘</kbd><kbd>⌥</kbd><kbd>K</kbd> |
| **Zoom in** | <kbd>Ctrl</kbd><kbd>=</kbd> | <kbd>⌘</kbd><kbd>=</kbd> |
| **Zoom out** | <kbd>Ctrl</kbd><kbd>-</kbd> | <kbd>⌘</kbd><kbd>-</kbd> |
| **Reset script zoom** | <kbd>Ctrl</kbd><kbd>0</kbd> | <kbd>⌘</kbd><kbd>0</kbd> |

### Basic editing

| Command | Windows | Mac |
| --- | --- | --- |
| **Cut** | <kbd>Ctrl</kbd><kbd>X</kbd> | <kbd>⌘</kbd><kbd>X</kbd> |
| **Copy** | <kbd>Ctrl</kbd><kbd>C</kbd> | <kbd>⌘</kbd><kbd>C</kbd> |
| **Paste** | <kbd>Ctrl</kbd><kbd>V</kbd> | <kbd>⌘</kbd><kbd>V</kbd> |
| **Undo** | <kbd>Ctrl</kbd><kbd>Z</kbd> | <kbd>⌘</kbd><kbd>Z</kbd> |
| **Redo** | <kbd>Ctrl</kbd><kbd>Y</kbd> | <kbd>Shift</kbd><kbd>⌘</kbd><kbd>Z</kbd> |
| **Select all** | <kbd>Ctrl</kbd><kbd>A</kbd> | <kbd>⌘</kbd><kbd>A</kbd> |
| **Find** / **Replace** | <kbd>Ctrl</kbd><kbd>F</kbd> | <kbd>⌘</kbd><kbd>F</kbd> |
| **Find all** / **replace all** | <kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>F</kbd> | <kbd>⌘</kbd><kbd>Shift</kbd><kbd>F</kbd> |
| **Indent** / **unindent** | <kbd>Ctrl</kbd><kbd>\]</kbd> / <kbd>Ctrl</kbd><kbd>\[</kbd> | <kbd>⌘</kbd><kbd>\]</kbd> / <kbd>⌘</kbd><kbd>\[</kbd> |
| **Toggle comment** | <kbd>Ctrl</kbd><kbd>/</kbd> | <kbd>⌘</kbd><kbd>/</kbd> |
| **Expand all folds** | <kbd>Ctrl</kbd><kbd>E</kbd> | <kbd>⌘</kbd><kbd>E</kbd> |
| **Collapse all folds** | <kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>E</kbd> | <kbd>⌘</kbd><kbd>Shift</kbd><kbd>E</kbd> |
| **Delete line** | <kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>K</kbd> | <kbd>⌘</kbd><kbd>Shift</kbd><kbd>K</kbd> |
| **Delete to start of line** | <kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>Backspace</kbd> | <kbd>⌘</kbd><kbd>Delete</kbd> |
| **Move line up/down** | <kbd>Alt</kbd><kbd>↑</kbd> / <kbd>Alt</kbd><kbd>↓</kbd> | <kbd>⌥</kbd><kbd>↑</kbd> / <kbd>⌥</kbd><kbd>↓</kbd> |
| **Go to declaration** | <kbd>Ctrl</kbd><kbd>F12</kbd> | <kbd>⌘</kbd><kbd>F12</kbd> |
| **Open script function filter** | <kbd>Alt</kbd><kbd>F</kbd> | <kbd>⌥</kbd><kbd>F</kbd> |
| **Format selection** | <kbd>Alt</kbd><kbd>Shift</kbd><kbd>F</kbd> | <kbd>⌥</kbd><kbd>Shift</kbd><kbd>F</kbd> |

### Multi-Cursor

| Command | Windows | Mac |
| --- | --- | --- |
| **Add/remove cursor at mouse location** | <kbd>Alt</kbd> + click | <kbd>⌥</kbd> + click |
| **Remove most recently added cursor** | <kbd>Ctrl</kbd><kbd>U</kbd> | <kbd>⌘</kbd><kbd>U</kbd> |
| **Add/modify cursor on mouse drag** | <kbd>Alt</kbd> + drag | <kbd>⌥</kbd> + drag |
| **Add cursor above/below** | <kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>↑</kbd> / <kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>↓</kbd> | <kbd>⌘</kbd><kbd>⌥</kbd><kbd>↑</kbd> / <kbd>⌘</kbd><kbd>⌥</kbd><kbd>↓</kbd> |
| **Add cursor to next matching selection** | <kbd>Ctrl</kbd><kbd>D</kbd> | <kbd>⌘</kbd><kbd>D</kbd> |
| **Add cursor to every matching selection** | <kbd>Shift</kbd><kbd>Alt</kbd><kbd>L</kbd> | <kbd>Shift</kbd><kbd>⌥</kbd><kbd>L</kbd> |
| **Column/block select** | <kbd>Shift</kbd><kbd>Alt</kbd> + drag | <kbd>Shift</kbd><kbd>⌥</kbd> + drag |
| **Split selections into lines** | <kbd>Shift</kbd><kbd>Alt</kbd><kbd>I</kbd> | <kbd>Shift</kbd><kbd>⌥</kbd><kbd>I</kbd> |

---
*Source: [Script Editor](https://create.roblox.com/docs/studio/script-editor) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
