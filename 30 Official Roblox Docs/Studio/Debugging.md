---
title: "Debugging"
description: "Debugging tools help you resolve errors and inspect scripts line-by-line as they run."
area: "30 Official Roblox Docs"
cluster: "Studio"
source: "https://create.roblox.com/docs/studio/debugging"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Debugging tools help you resolve errors and inspect scripts line-by-line as they run.*

Studio offers many debugging tools and workflows commonly found in Integrated Development Environments (IDEs). These help you inspect and resolve errors in scripts as they run.

## Breakpoint debugging

Breakpoints are checkpoints that pause or "break" the execution of your scripts at specific lines. You can use the pauses to inspect and debug your game, [[30 Official Roblox Docs/Studio/Debugging#Watch|watch]] variables, and inspect the [[30 Official Roblox Docs/Studio/Debugging#Call Stack|call stack]]. Breakpoints are one of the most effective ways to debug functions, so they're one of the most important debugging tools.

### Management

In the [[30 Official Roblox Docs/Studio/Script Editor|Script Editor]], you can [[30 Official Roblox Docs/Studio/Debugging#Insert|insert]] several types of breakpoints and edit the configuration of a breakpoint at any time, including during playtest sessions. If you edit breakpoints during a playtest session, the edits persist even after you finish it. You can also edit a breakpoint that's actively pausing your playtest session, but changes don't apply until the next playtest session.

#### Insert

Breakpoints take multiple variations and can be inserted at any line of executable code as follows:

##### Standard

To insert a standard breakpoint at a line of code, click in the gutter directly to the right of its line number. Alternatively, right‑click in the gutter and select **Insert Breakpoint**. The breakpoint icon appears as a red circle.

*(image in the full Top G Vault)*

##### Conditional

A conditional breakpoint pauses your script only if a specified condition is true, so it's useful for debugging how functions execute when certain variables have certain values or if you want to break only on certain executions in a loop.

To insert a conditional breakpoint, right‑click in the gutter and select **Insert Conditional Breakpoint**. In the popup window that appears, enter the desired condition, such as

`var == 10`

, then click **Save**. The conditional breakpoint icon appears as a circled **=** sign.

*(image in the full Top G Vault)*

##### Logpoint

A logpoint is a special breakpoint that logs messages to the [[30 Official Roblox Docs/Studio/Output|Output]] window without pausing the script, making it useful for debugging the values of the variables before the line executes.

To insert a logpoint, right‑click in the gutter and select **Insert Logpoint**. In the popup window that appears, enter the desired log message, such as

`"The value of var:", var`

, then click **Save**. The logpoint icon appears as a red diamond.

*(image in the full Top G Vault)*

##### Temporary

A temporary breakpoint offers the same [[30 Official Roblox Docs/Studio/Debugging#Edit|options]] as other breakpoint types, except that it automatically removes itself after the first [[30 Official Roblox Docs/Studio/Debugging#Workflow|playtest session]]. This makes it ideal for quickly testing variable values or functionality without needing to disable or delete the breakpoint afterward.

To insert a temporary breakpoint, right‑click in the gutter and select **Insert Temporary Breakpoint**. It initially appears as red circle and then you can [[30 Official Roblox Docs/Studio/Debugging#Edit|edit]] its options to specify the behavior.

*(image in the full Top G Vault)*

#### Disable

To temporarily disable a breakpoint without [[30 Official Roblox Docs/Studio/Debugging#Delete|deleting]] it, use any of the following workflows:

- Click the breakpoint's icon.
- Right-click the breakpoint's icon and select **Disable Breakpoint**.
- [[30 Official Roblox Docs/Studio/Debugging#Edit|Edit]] the breakpoint and toggle its **Enabled** checkbox.

A disabled breakpoint appears as a hollow version of its enabled icon, for example a hollow circle for a disabled standard breakpoint, or a hollow diamond for a disabled logpoint.

*(image in the full Top G Vault)*

*Disabled standard breakpoint*

*(image in the full Top G Vault)*

*Disabled logpoint*

#### Delete

To delete a breakpoint, middle-click its icon or right‑click its icon and select **Delete Breakpoint**.

> [!warning]
> Deleting a breakpoint deletes its **Condition** and **Log Message**. If you want to keep this information for future debugging, [[30 Official Roblox Docs/Studio/Debugging#Disable|disable]] the breakpoint instead.

#### Edit

You can edit the configuration of a breakpoint at any time, including during playtest sessions. If you edit breakpoints during a playtest session, the edits persist even after you finish it. You can also edit a breakpoint that's actively pausing your playtest session, but changes don't apply until the next playtest session.

To edit a breakpoint:

1. Right-click the breakpoint icon and select **Edit Breakpoint**.
2. In the **Edit Breakpoint** window, configure the breakpoint as desired. You can mix these configurations together to best suit your debugging needs.

	 | Option | Description |
	 | --- | --- |
	 | **Condition** | An optional expression that determines whether the breakpoint activates. If the condition is empty, the breakpoint always activates. If the condition exists, the breakpoint becomes a [[30 Official Roblox Docs/Studio/Debugging#Insert\|conditional breakpoint]] and activates only if the condition is true. For example, if you want the breakpoint to activate only if the variable `var` equals `10`, set the condition to `var == 10`. |
	 | **Log Message** | An expression that prints to the [[30 Official Roblox Docs/Studio/Output\|Output]] window when the breakpoint is hit. The format of the log message is the same as that of a [[30 Official Roblox Docs/API Reference/Globals/Luau globals#print\|print()]] statement. For example, set the log message as `"The value of var:", var` to output the same message as `print("The value of var:", var)`. |
	 | **Continue Execution** | Determines whether the breakpoint pauses the script if it activates. This option is disabled by default unless the inserted breakpoint is a [[30 Official Roblox Docs/Studio/Debugging#Insert\|logpoint]]. |
	 | **Remove Breakpoint on Hit** | If checked, the breakpoint automatically removes itself after the first playtest session, effectively making it a [[30 Official Roblox Docs/Studio/Debugging#Insert\|temporary]] breakpoint. |
	 | **Trigger At** | The **context** of a breakpoint determines whether it should activate on the **Client** (client‑side scripts), **Server** (server‑side scripts), or **Edit** (debugging [[30 Official Roblox Docs/Studio/Studio plugins\|plugin]] scripts). If you choose **Custom Context**, the window indicates the current trigger contexts. |

### Workflow

The typical workflow for breakpoint debugging is as follows:

1. Open the script you'd like to debug and [[30 Official Roblox Docs/Studio/Debugging#Insert|insert breakpoints]] on the lines of codes that you want to examine.
1. From Studio's mezzanine, [[30 Official Roblox Docs/Studio/Studio testing modes#Playtesting|initiate a playtest]] to begin debugging.

   *(image in the full Top G Vault)*

1. When the script hits a breakpoint, the playtest session **pauses** unless that breakpoint is [[30 Official Roblox Docs/Studio/Debugging#Edit|configured]] to continue execution. A yellow arrow over the breakpoint indicates which line of code executes next.

   *(image in the full Top G Vault)*

1. As the script pauses, inspect the [[30 Official Roblox Docs/Studio/Debugging#Breakpoints|Breakpoints]] window, [[30 Official Roblox Docs/Studio/Debugging#Watch|Watch]] window, [[30 Official Roblox Docs/Studio/Debugging#Call Stack|Call Stack]] window, [[30 Official Roblox Docs/Studio/Output|Output]] window, and [[30 Official Roblox Docs/Studio/Debugging#Script Editor|Script Editor]] to find information about variable values and function executions.

1. To continue executing code after hitting a breakpoint, click **Resume Scripts** in the mezzanine.

   *(image in the full Top G Vault)*

   You can also execute code one line at a time with the stepping buttons in the mezzanine:

   *(image in the full Top G Vault)*

   | Action | Shortcut | Description |
   | --- | --- | --- |
   | **Step Into** | <kbd>F11</kbd> | The **Step Into** button moves the debugger into the code of the function on the current line. If there is no function on the current line, the debugger moves to the next line. |
   | **Step Over** | <kbd>F10</kbd> | The **Step Over** button moves the debugger to the next line of code, **not** moving into functions. |
   | **Step Out** | <kbd>Shift</kbd><kbd>F11</kbd> | The **Step Out** button moves the debugger out of the current function and to the next line of code after the function call. If the current line isn't inside a function, the debugger moves to the next line. |

1. When you're finished debugging the current session, click the **Stop** button.

   *(image in the full Top G Vault)*

### Monitoring

Studio includes multiple windows and tools to monitor variable values and function executions while debugging. With this information, you can find the root cause of most problems in your scripts.

*(image in the full Top G Vault)*

#### Breakpoints

The **Breakpoints** window is a unified view that shows all breakpoints within all scripts. To open it, click **Breakpoints** from Studio's **Script** tab toolbar, or navigate to the **Window** ⟩ **Debug** menu and toggle on **Breakpoints**.

In the window, the **Script** and **Line** columns always display, and you can toggle on/off other [[30 Official Roblox Docs/Studio/Debugging#Edit|configuration]] columns through the **⋮** menu in the upper‑right corner. Within the **Script** column, right‑click any breakpoint to reveal an options menu to [[30 Official Roblox Docs/Studio/Debugging#Edit|edit]], [[30 Official Roblox Docs/Studio/Debugging#Disable|disable/enable]], [[30 Official Roblox Docs/Studio/Debugging#Delete|delete]], or jump to the breakpoint's line within the script.

*(image in the full Top G Vault)*

While in a debugging session, the furthest left column shows **(x3)** which indicates the multiple contexts (**Client**, **Server**, **Edit**) for the breakpoint. By expanding any breakpoint's branch, you can then click the icon next to a specific context to [[30 Official Roblox Docs/Studio/Debugging#Disable|disable/enable]] it for that context, such as disabling a breakpoint only in the **Client** context while keeping it enabled in the **Server** context.

*(image in the full Top G Vault)*

#### Call Stack

The **Call Stack** window, accessible from Studio's **Script** tab toolbar or the **Window** ⟩ **Debug** menu, shows which line of code is going to execute next when the debugger reaches a breakpoint. If you call functions from inside other functions, it indicates which lines those functions were called from, letting you confirm whether the actual call flow matches the expected flow.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

As the script pauses at breakpoints, use the stepping buttons in the mezzanine to step into, over, or out of a function/line as outlined in [[30 Official Roblox Docs/Studio/Debugging#Workflow|workflow]].

*(image in the full Top G Vault)*

#### Watch

The **Watch** window, accessible from Studio's **Script** tab toolbar or the **Window** ⟩ **Debug** menu, lets you actively watch variable and expression values as you step through breakpoints.

##### Variables

The **Variables** tab shows information about the current variables in [[30 Official Roblox Docs/Luau/Scope|scope]], filterable by clicking the **All Scopes** button in the window's upper bar. Expanding a branch shows the members of that variable or instance and their values. You can also watch any variable by double‑click highlighting it in the [[30 Official Roblox Docs/Studio/Script Editor|Script Editor]], right‑clicking, and selecting **Add Watch** from the popup menu.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

##### My Watches

The **My Watches** tab shows the value of variables or expressions that you define. To watch a specific expression, click an empty row in the **Expression** column and type the expression into it. This allows you to check any expression value without monitoring individual variables in the **Variables** tab or adding [[30 Official Roblox Docs/API Reference/Globals/Luau globals#print|print()]] statements in the script to check expression values.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

#### Script Editor

The debugger is integrated with the [[30 Official Roblox Docs/Studio/Script Editor|Script Editor]]. When your game pauses at a breakpoint in a script, you can hover your mouse over the name of a variable to see its value. For example, you can see the composition of a table and its contained keys/values.

*(image in the full Top G Vault)*

## Additional debugging tools

In addition to the debugger, Studio offers additional debugging tools for you to fix problems and bugs in your game.

### Command Bar

The [[30 Official Roblox Docs/Studio/Studio interface#Command Bar|Command Bar]] allows you to run Luau commands while the game is running. It is available in Studio from the **Window** ⟩ **Script** menu and in the [[30 Official Roblox Docs/Studio/Developer Console|Developer Console]].

### Developer Console

The [[30 Official Roblox Docs/Studio/Developer Console|Developer Console]] provides a wide array of details including client and server output, memory usage, network performance, and more. To open console while testing or playing a game, type `/console` into the chat or press <kbd>F9</kbd>.

### Log files

When a script prints or errors in Studio or the player app, the app records the message in a log file in the local file system. These files are located in different places depending on the operating system.

#### Windows

To access log files on Windows:

1. Open **File Explorer**.
2. Navigate to the `%LOCALAPPDATA%\Roblox\logs` directory.
3. Double-click a log to open it. Logs with the same `XXXXX` value are from the same Studio session.

#### Mac

To access log files on Mac:

1. Open **Finder**.
2. In the menu bar, select **Go** ⟩ **Go to Folder...**.
3. In the dialog, enter `~/Library/Logs/Roblox`.
4. Double-click the result to navigate to the Roblox logs directory.
5. Inside the directory, double-click a log to open it.

#### iOS

You can collect iOS logs using a Mac or using an iOS device.

##### Mac

To access iOS log files on a Mac:

1. Connect the iOS device to a Mac.
2. Open **Finder**.
3. Navigate to **Utilities** and open the **Console** application.
4. To populate real-time logs in the Console application, select the iOS device from the sidebar, click the **Start** button, and reproduce the issue on the iOS device.
5. To populate archived logs in the Console application, run `sudo log collect --device-name "[iOS Device Name]"` in the **Terminal**. Make sure there are no apostrophes in the device's name or you might get an error when running the command.

##### Device

To access iOS log files on an iOS device:

1. Press and hold both volume buttons and the top or side button on the iOS device for 1 to 1.5 seconds to start the `sysdiagnose` program. This process might take up to 10 minutes to finish.
2. Navigate to **Settings** ⟩ **Privacy & Security** ⟩ **Analytics & Improvements** ⟩ **Analytics Data** to access the log files.
3. Tap on the a log file to open it.

#### Android

To access log files on Android:

1. Navigate to **Settings** ⟩ **System** ⟩ **Developer options**.
2. Toggle **Developer options** on.
3. On a computer, download and install [Android Studio](https://developer.android.com/studio).
4. In Android Studio, click **Logcat**.
5. Connect the Android device to the computer to automatically populate **Logcat** with logs.

---
*Source: [Debugging](https://create.roblox.com/docs/studio/debugging) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
