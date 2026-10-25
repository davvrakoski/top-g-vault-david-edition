---
title: "Studio"
description: "Represents Roblox Studio's script editor settings."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Studio"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Represents Roblox Studio's script editor settings.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

The Studio object is a settings object that is exclusive to Roblox Studio. It can be found in Roblox Studio's settings under the Studio tab.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#"function" Color\|"function" Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the `function` keyword in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#"local" Color\|"local" Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the `local` keyword in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#"nil" Color\|"nil" Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the `nil` keyword in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#"self" Color\|"self" Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the `self` keyword in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#"TODO" Color\|"TODO" Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of TODO comments in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#ActionOnStopSync\|ActionOnStopSync]] | [[30 Official Roblox Docs/API Reference/Enums/ActionOnStopSync\|ActionOnStopSync]] | Sets the action Studio takes when stopping file sync. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Active Color\|Active Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of active UI elements in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Active Hover Over Color\|Active Hover Over Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of active UI elements when hovered in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Always Save Script Changes\|Always Save Script Changes]] | boolean | If set to true, Roblox Studio will attempt to transfer script changes that were made during a Play Solo session to the opened place. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Animate Hover Over\|Animate Hover Over]] | boolean | If set to true, the hover selection box that is shown when mousing over selectable objects in the [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]] will flash between `Hover Over Color` and `Select Color` based on the `Hover Animate Speed`. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Auto Clean Empty Line\|Auto Clean Empty Line]] | boolean | Controls whether trailing whitespace is automatically removed from empty lines in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Auto Closing Brackets\|Auto Closing Brackets]] | boolean | Controls whether the script editor automatically inserts a matching closing bracket. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Auto Closing Quotes\|Auto Closing Quotes]] | boolean | Controls whether the script editor automatically inserts a matching closing quote. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Auto Delete Closing Brackets and Quotes\|Auto Delete Closing Brackets and Quotes]] | boolean | Controls whether deleting an opening bracket or quote also removes its closing counterpart. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Auto Indent Rule\|Auto Indent Rule]] | [[30 Official Roblox Docs/API Reference/Enums/AutoIndentRule\|AutoIndentRule]] | Sets the rule used to determine automatic indentation in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Auto-Recovery Enabled\|Auto-Recovery Enabled]] | boolean | Controls whether Studio automatically saves recovery files at a set interval. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Auto-Recovery Interval (Minutes)\|Auto-Recovery Interval (Minutes)]] | int | Sets the interval in minutes at which Studio saves auto-recovery files. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#AutocompleteAcceptanceBehavior\|AutocompleteAcceptanceBehavior]] | [[30 Official Roblox Docs/API Reference/Enums/CompletionAcceptanceBehavior\|CompletionAcceptanceBehavior]] | Sets the key used to accept autocomplete suggestions in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Automatically trigger AI Code Completion\|Automatically trigger AI Code Completion]] | boolean | Controls whether AI code completion suggestions trigger automatically while typing. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#AutoResumeSyncOnPlaceOpen\|AutoResumeSyncOnPlaceOpen]] | boolean | Controls whether file sync resumes automatically when a place is opened. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#AutoUpdateEnabled\|AutoUpdateEnabled]] | boolean | Controls whether Studio updates itself automatically when a new version is available. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Background Color\|Background Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Specifies the background color of Roblox Studio's script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Basic Objects Display Mode\|Basic Objects Display Mode]] | [[30 Official Roblox Docs/API Reference/Enums/ListDisplayMode\|ListDisplayMode]] | Sets the scrolling mode of the `Advanced Objects` tab in Roblox Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Bool Color\|Bool Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of boolean literals in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Bracket Color\|Bracket Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of brackets in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Built-in Function Color\|Built-in Function Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of built-in functions and keywords in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Camera Mouse Wheel Speed\|Camera Mouse Wheel Speed]] | float | Sets how many studs the camera will move forward or backwards when using the mouse wheel. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Camera Pan Speed\|Camera Pan Speed]] | float | Sets the speed of camera panning in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Camera Shift Speed\|Camera Shift Speed]] | float | Sets the speed in studs/sec that the camera moves while holding down Shift with the movement keys. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Camera Speed\|Camera Speed]] | float | Sets the speed in studs/sec that the camera moves when movement keys are pressed. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Camera Speed Adjust Binding\|Camera Speed Adjust Binding]] | [[30 Official Roblox Docs/API Reference/Enums/CameraSpeedAdjustBinding\|CameraSpeedAdjustBinding]] | Sets the mouse button used to adjust the camera speed in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Camera Zoom to Mouse Position\|Camera Zoom to Mouse Position]] | boolean | Controls whether the camera zooms toward the mouse cursor position. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#CameraNavigationModel\|CameraNavigationModel]] | [[30 Official Roblox Docs/API Reference/Enums/CameraNavigationModel\|CameraNavigationModel]] | Sets the navigation model used for camera movement in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#CameraShiftFactor\|CameraShiftFactor]] | float | Sets the speed multiplier applied to camera movement when Shift is held. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#CameraTweenFocus\|CameraTweenFocus]] | boolean | Controls whether the camera smoothly tweens when refocusing on a selected object. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Clear Output On Start\|Clear Output On Start]] | boolean | If set to true, the output will be automatically cleared when game sessions are switched. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#CommandBarEnterExec\|CommandBarEnterExec]] | boolean | Controls whether pressing Enter immediately executes the command bar input. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#CommandBarFont\|CommandBarFont]] | QFont | Sets the font used in the Studio command bar. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#CommandBarLocalState\|CommandBarLocalState]] | boolean | Controls whether the command bar retains its input state between sessions. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Comment Color\|Comment Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Specifies the color of comments in Roblox Studio's script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Current Line Highlight Color\|Current Line Highlight Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the current line highlight in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Debugger Current Line Color\|Debugger Current Line Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the current debugger line in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Debugger Error Line Color\|Debugger Error Line Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of debugger error lines in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DefaultInstancesDir\|DefaultInstancesDir]] | QDir | Sets the default directory where Studio saves instance files. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DefaultScriptSyncFileType\|DefaultScriptSyncFileType]] | [[30 Official Roblox Docs/API Reference/Enums/DefaultScriptSyncFileType\|DefaultScriptSyncFileType]] | Sets the default file type used when syncing scripts to the file system. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DeprecatedObjectsShown\|DeprecatedObjectsShown]] | boolean | If set to true, deprecated objects will be shown in the Advanced Objects window, as well as the Object Browser. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DisplayLanguage\|DisplayLanguage]] | string | Sets the display language used by the Studio interface. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DraggerActiveColor\|DraggerActiveColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the active dragger handle in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DraggerLengthFactor\|DraggerLengthFactor]] | float | Sets the length scale factor of dragger handles in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DraggerMajorGridIncrement\|DraggerMajorGridIncrement]] | int | Sets the major grid increment used when snapping with the dragger. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DraggerMaxSoftSnaps\|DraggerMaxSoftSnaps]] | int | Sets the maximum number of soft snap points shown by the dragger. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DraggerPassiveColor\|DraggerPassiveColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of inactive dragger handles in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DraggerScaleFactor\|DraggerScaleFactor]] | float | Sets the scale factor controlling the overall size of dragger handles. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DraggerShowAxisTicks\|DraggerShowAxisTicks]] | boolean | Controls whether tick marks are shown on dragger axis lines. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DraggerShowHoverRuler\|DraggerShowHoverRuler]] | boolean | Controls whether a ruler is shown when hovering near the dragger. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DraggerShowMeasurement\|DraggerShowMeasurement]] | boolean | Controls whether distance measurements are shown while dragging. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DraggerShowNegativeAxes\|DraggerShowNegativeAxes]] | boolean | Controls whether negative axis handles are shown on the dragger. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DraggerShowPlanes\|DraggerShowPlanes]] | boolean | Controls whether planar translation handles are shown on the dragger. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DraggerShowTargetSnap\|DraggerShowTargetSnap]] | boolean | Controls whether the target snap indicator is shown on the dragger. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DraggerShowTrackball\|DraggerShowTrackball]] | boolean | Controls whether the trackball handle is shown on the rotation dragger. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DraggerShowWhileDragging\|DraggerShowWhileDragging]] | boolean | Controls whether dragger handles remain visible while actively dragging. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DraggerSoftSnapMarginFactor\|DraggerSoftSnapMarginFactor]] | float | Sets the margin factor used to determine proximity for soft snapping. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DraggerSummonMarginFactor\|DraggerSummonMarginFactor]] | float | Sets the margin factor used to summon the dragger near a surface. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#DraggerTiltRotateDuration\|DraggerTiltRotateDuration]] | float | Sets the duration in seconds of the tilt rotation animation in the dragger. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Enable Autocomplete\|Enable Autocomplete]] | boolean | When set to true, the script editor and command bar will show an autocomplete menu while writing. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Enable Autocomplete Doc View\|Enable Autocomplete Doc View]] | boolean | Controls whether documentation is shown alongside autocomplete suggestions. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Enable CoreScript Debugger\|Enable CoreScript Debugger]] | boolean | Controls whether the CoreScript debugger is available in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Enable Http Sandboxing\|Enable Http Sandboxing]] | boolean | Controls whether HTTP requests from plugins are sandboxed. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Enable Internal Beta Features\|Enable Internal Beta Features]] | boolean | Controls whether internal beta features are accessible in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Enable Internal Features\|Enable Internal Features]] | boolean | Controls whether internal developer features are accessible in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Enable Script Analysis\|Enable Script Analysis]] | boolean | Controls whether the script editor performs real-time Luau script analysis. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Enable Scrollbar Markers\|Enable Scrollbar Markers]] | boolean | Controls whether error and warning markers are shown on the script editor scrollbar. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Enable Signature Help\|Enable Signature Help]] | boolean | Controls whether function signature help popups are shown while typing. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Enable Signature Help Doc View\|Enable Signature Help Doc View]] | boolean | Controls whether documentation is shown alongside signature help popups. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Enable Temporary Tabs\|Enable Temporary Tabs]] | boolean | Controls whether opening a script creates a temporary tab that is replaced on the next open. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Enable Temporary Tabs In Explorer\|Enable Temporary Tabs In Explorer]] | boolean | Controls whether clicking a script in the Explorer opens it in a temporary tab. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Enable Type Hover\|Enable Type Hover]] | boolean | Controls whether hovering over an identifier shows its inferred type. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#EnableCodeAssist\|EnableCodeAssist]] | boolean | Controls whether AI-powered code assist features are enabled in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#EnableFindOnType\|EnableFindOnType]] | boolean | Controls whether the Find bar activates when typing in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#EnableIndentationRulers\|EnableIndentationRulers]] | boolean | Controls whether indentation ruler lines are shown in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#EnableSelectionTooltips\|EnableSelectionTooltips]] | boolean | Controls whether tooltips are shown when hovering over selected objects. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#EnableStudioStreaming\|EnableStudioStreaming]] | boolean | Controls whether Studio streaming mode is enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Error Color\|Error Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Specifies the color of the wavy underline shown when malformed code is detected in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#ExternalEditorMode\|ExternalEditorMode]] | [[30 Official Roblox Docs/API Reference/Enums/ExternalEditorMode\|ExternalEditorMode]] | Sets the mode used when opening scripts in an external editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#ExternalEditorSelection\|ExternalEditorSelection]] | QDir | Sets which external editor Studio opens scripts with. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Find Selection Background Color\|Find Selection Background Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the highlight color of matches in the script editor's Find Selection operation (Ctrl+F). |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Font\|Font]] | QFont | Specifies the font used in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Format On Paste\|Format On Paste]] | boolean | Controls whether pasted code is automatically formatted in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Format On Type\|Format On Type]] | boolean | Controls whether code is automatically formatted as you type in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Function Name Color\|Function Name Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of function names in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Highlight Current Line\|Highlight Current Line]] | boolean | Controls whether the current line is highlighted in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Highlight Occurances\|Highlight Occurances]] | boolean | Controls whether other occurrences of the word under the cursor are highlighted. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#HintColor\|HintColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of hint diagnostics in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Hover Animate Speed\|Hover Animate Speed]] | [[30 Official Roblox Docs/API Reference/Enums/HoverAnimateSpeed\|HoverAnimateSpeed]] | Specifies how frequently the hover animation flashes when the mouse is hovering over a selectable object in the [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Hover Box Thickness\|Hover Box Thickness]] | float | Sets the thickness of the selection box shown when hovering over objects. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Hover Line Thickness\|Hover Line Thickness]] | int | Sets the line thickness of the hover selection box. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Hover Over Color\|Hover Over Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Specifies the color that the hover selection box uses. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#IconOverrideDir\|IconOverrideDir]] | QDir | Sets the directory Studio uses to load icon overrides. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Indent Using Spaces\|Indent Using Spaces]] | boolean | Controls whether the script editor uses spaces instead of tabs for indentation. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#IndentationRulerColor\|IndentationRulerColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of indentation rulers in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#InformationColor\|InformationColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of information diagnostics in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Keyword Color\|Keyword Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the text color of built-in Luau keywords. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#LargeFileLineCountThreshold\|LargeFileLineCountThreshold]] | int | Sets the line count at which a script is treated as a large file by the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#LargeFileThreshold\|LargeFileThreshold]] | int | Sets the byte size at which a script is treated as a large file by the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Line Thickness\|Line Thickness]] | float | Sets the thickness of the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|Model.PrimaryPart]] selection adornee. This value is constrained between 0 and 0.05. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#LoadAllBuiltinPluginsInRunModes\|LoadAllBuiltinPluginsInRunModes]] | boolean | Controls whether all built-in plugins are loaded when using run modes. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#LoadInternalPlugins\|LoadInternalPlugins]] | boolean | Controls whether internal Roblox plugins are loaded in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#LoadUserPluginsInRunModes\|LoadUserPluginsInRunModes]] | boolean | Controls whether user-installed plugins are loaded when using run modes. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#LocalAssetsFolder\|LocalAssetsFolder]] | QDir | Sets the local folder Studio uses for local asset storage. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#LuaDebuggerEnabled\|LuaDebuggerEnabled]] | boolean | Specifies whether or not the Lua Debugger feature is enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#LuaDebuggerEnabledAtStartup\|LuaDebuggerEnabledAtStartup]] | boolean | Controls whether the Lua debugger is enabled when Studio starts. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Luau Keyword Color\|Luau Keyword Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of Luau-specific keywords in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Main Volume\|Main Volume]] | float | Sets the main audio playback volume in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Matching Word Background Color\|Matching Word Background Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the highlight color of double-clicked variables in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#MaxFindReplaceAllResults\|MaxFindReplaceAllResults]] | int | Sets the maximum number of results returned by the Find All operation. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Maximum Output Lines\|Maximum Output Lines]] | int | The maximum number of lines that can be displayed in the output. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Menu Item Background Color\|Menu Item Background Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the background color of menu items in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Method Color\|Method Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of method names in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Number Color\|Number Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Specifies the color of numbers in Roblox Studio's script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Only Play Audio from Window in Focus\|Only Play Audio from Window in Focus]] | boolean | If set to true, audio being played will only be heard if the game window is being focused on. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Operator Color\|Operator Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the text color of operator characters in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Output Font\|Output Font]] | QFont | Specifies the font used by the output. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Output Layout Mode\|Output Layout Mode]] | [[30 Official Roblox Docs/API Reference/Enums/OutputLayoutMode\|OutputLayoutMode]] | Sets the layout mode of the output. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#PermissionLevelShown\|PermissionLevelShown]] | [[30 Official Roblox Docs/API Reference/Enums/PermissionLevelShown\|PermissionLevelShown]] | Sets the highest permission level that APIs have to have in order to be shown in the Object Browser. See [[30 Official Roblox Docs/API Reference/Enums/PermissionLevelShown\|Enum.PermissionLevelShown]] for more info. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Physical Draggers Select Scope By Default\|Physical Draggers Select Scope By Default]] | boolean | Controls whether physical draggers default to selecting within the current scope. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Pivot Snap To Geometry Color\|Pivot Snap To Geometry Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the pivot snap-to-geometry indicator in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#PluginDebuggingEnabled\|PluginDebuggingEnabled]] | boolean | Controls whether plugin script debugging is enabled in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#PluginsDir\|PluginsDir]] | QDir | The directory where local plugins are stored. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#PreferredTextSize\|PreferredTextSize]] | [[30 Official Roblox Docs/API Reference/Enums/PreferredTextSize\|PreferredTextSize]] | Sets the preferred font size in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Primary Text Color\|Primary Text Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the primary text color in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Property Color\|Property Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of property names in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#ReloadBuiltinPluginsOnChange\|ReloadBuiltinPluginsOnChange]] | boolean | Controls whether built-in plugins are automatically reloaded when their files change. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#ReloadLocalPluginsOnChange\|ReloadLocalPluginsOnChange]] | boolean | Controls whether local plugins are automatically reloaded when their files change. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Respect Studio shortcuts when game has focus\|Respect Studio shortcuts when game has focus]] | boolean | When set to true, Roblox Studio shortcuts will take priority over inputs being captured in the game window. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Ruler Color\|Ruler Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the column ruler in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Rulers\|Rulers]] | string | Sets the column positions at which vertical ruler lines are drawn in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#RuntimeUndoBehavior\|RuntimeUndoBehavior]] | [[30 Official Roblox Docs/API Reference/Enums/RuntimeUndoBehavior\|RuntimeUndoBehavior]] | Sets how Studio handles undo operations during runtime playback. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Script Editor Color Preset\|Script Editor Color Preset]] | [[30 Official Roblox Docs/API Reference/Enums/StudioScriptEditorColorPresets\|StudioScriptEditorColorPresets]] | Sets the color preset applied to the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Script Editor Scrollbar Background Color\|Script Editor Scrollbar Background Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the background color of the script editor scrollbar in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Script Editor Scrollbar Handle Color\|Script Editor Scrollbar Handle Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the handle color of the script editor scrollbar in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#ScriptTimeoutLength\|ScriptTimeoutLength]] | int | The time (in seconds) a script can wait to be resumed before timing out. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Scroll Past Last Line\|Scroll Past Last Line]] | boolean | Controls whether the script editor allows scrolling below the last line. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Secondary Text Color\|Secondary Text Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the secondary text color in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Select Color\|Select Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | The color of the selection box used with object selections in the [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Select/Hover Color\|Select/Hover Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|Model.PrimaryPart]] selection box. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Selected Menu Item Background Color\|Selected Menu Item Background Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the background color of selected menu items in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Selected Text Color\|Selected Text Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of selected text in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Selection Background Color\|Selection Background Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the background color of selected text in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Selection Box Thickness\|Selection Box Thickness]] | float | Sets the thickness of the selection box around selected objects. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Selection Color\|Selection Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the text color of selected text in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Selection Line Thickness\|Selection Line Thickness]] | int | Sets the line thickness of the selection box around selected objects. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Set Pivot of Imported Parts\|Set Pivot of Imported Parts]] | boolean | Sets whether the pivot point is repositioned when parts are imported. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Show Core GUI in Explorer while Playing\|Show Core GUI in Explorer while Playing]] | boolean | If set to true, the [[30 Official Roblox Docs/API Reference/Classes/CoreGui\|CoreGui]] will be visible in the Explorer while the game is running. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Show Diagnostics Bar\|Show Diagnostics Bar]] | boolean | If set to true, basic diagnostic information is shown in the bottom right. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Show FileSyncService\|Show FileSyncService]] | boolean | Controls whether FileSyncService is shown in the Explorer panel. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Show Hidden Objects in Explorer\|Show Hidden Objects in Explorer]] | boolean | Controls whether hidden objects are visible in the Explorer panel. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Show Hover Over\|Show Hover Over]] | boolean | If set to true, hovering over an object in the [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]] will show a selection box. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Show Light Guides\|Show Light Guides]] | boolean | Controls whether light guide visualizations are shown in the viewport. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Show Navigation Labels\|Show Navigation Labels]] | boolean | Controls whether navigation mesh region labels are shown in the viewport. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Show Navigation Mesh\|Show Navigation Mesh]] | boolean | When set to true, the navigation mesh used by the [[30 Official Roblox Docs/API Reference/Classes/PathfindingService\|PathfindingService]] will be visualized. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Show Pathfinding Links\|Show Pathfinding Links]] | boolean | Controls whether PathfindingLink visualizations are shown in the viewport. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Show Plugin GUI Service in Explorer\|Show Plugin GUI Service in Explorer]] | boolean | When set to true, the [[30 Official Roblox Docs/API Reference/Classes/PluginGuiService\|PluginGuiService]] will be shown in Roblox Studio's explorer. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Show plus button on hover in Explorer\|Show plus button on hover in Explorer]] | boolean | Controls whether a plus button appears when hovering over items in the Explorer. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Show Singly Selected Attachment Parent Frame\|Show Singly Selected Attachment Parent Frame]] | boolean | Controls whether the parent part frame is shown when a single attachment is selected. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Show Whitespace\|Show Whitespace]] | boolean | Controls whether whitespace characters are shown as visible glyphs in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#ShowCorePackagesInExplorer\|ShowCorePackagesInExplorer]] | boolean | Controls whether core packages are shown in the Explorer panel. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Skip Closing Brackets and Quotes\|Skip Closing Brackets and Quotes]] | boolean | Controls whether the cursor skips over a typed closing bracket or quote if one already exists. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#String Color\|String Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Specifies the color of strings in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Tab Width\|Tab Width]] | int | Specifies how many spaces are used to represent a tab in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Text Color\|Text Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Specifies the color of normal text in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Text Wrapping\|Text Wrapping]] | boolean | If set to true, text in the script editor will be wrapped. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Theme\|Theme]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Used to get/set current [[30 Official Roblox Docs/API Reference/Classes/StudioTheme\|theme]] used by Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#TypeColor\|TypeColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of type annotations in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#UI Theme\|UI Theme]] | [[30 Official Roblox Docs/API Reference/Enums/UITheme\|UITheme]] | **Deprecated.** Specifies the color scheme of Roblox Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Use Bounding Box Move Handles\|Use Bounding Box Move Handles]] | boolean | Controls whether move handles are placed at the bounding box edges instead of the pivot. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#UseDefaultExternalEditor\|UseDefaultExternalEditor]] | boolean | Controls whether Studio uses the system's default application to open scripts externally. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#VAxisColor\|VAxisColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the V axis handle in Studio's draggers. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Warning Color\|Warning Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Specifies the color of the wavy underline shown when the script analyzer picks up a problem that should be addressed in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#Whitespace Color\|Whitespace Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of visible whitespace characters in the script editor. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#XAxisColor\|XAxisColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the X axis handle in Studio's draggers. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#YAxisColor\|YAxisColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the Y axis handle in Studio's draggers. |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#ZAxisColor\|ZAxisColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the Z axis handle in Studio's draggers. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#GetAvailableThemes\|GetAvailableThemes()]] | Array | Returns a list of [[30 Official Roblox Docs/API Reference/Classes/StudioTheme\|themes]] available in Studio. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Studio#ThemeChanged\|ThemeChanged]] |  | Event called when Studio's [[30 Official Roblox Docs/API Reference/Classes/StudioTheme\|theme]] changes. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### "function" Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of the `function` keyword in the script editor. This must be set in Studio Settings > Studio tab.

### "local" Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of the `local` keyword in the script editor. This must be set in Studio Settings > Studio tab.

### "nil" Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of the `nil` keyword in the script editor. This must be set in Studio Settings > Studio tab.

### "self" Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of the `self` keyword in the script editor. This must be set in Studio Settings > Studio tab.

### "TODO" Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of TODO comments in the script editor. This must be set in Studio Settings > Studio tab.

### ActionOnStopSync

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ActionOnStopSync|ActionOnStopSync]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Directories · **Loaded/Saved:** true/true

Sets the action Studio takes when stopping file sync. This must be set in Studio Settings > Studio tab.

### Active Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Tools · **Loaded/Saved:** true/true

Sets the color of active UI elements in Studio. This must be set in Studio Settings > Studio tab.

### Active Hover Over Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Tools · **Loaded/Saved:** true/true

Sets the color of active UI elements when hovered in Studio. This must be set in Studio Settings > Studio tab.

### Always Save Script Changes

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** General · **Loaded/Saved:** true/true

If set to true, Roblox Studio will attempt to transfer script changes that were made during a Play Solo session to the opened place.

### Animate Hover Over

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Tools · **Loaded/Saved:** true/true

If set to true, the hover selection box that is shown when mousing over selectable objects in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] will flash between `Hover Over Color` and `Select Color` based on the `Hover Animate Speed`.

### Auto Clean Empty Line

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether trailing whitespace is automatically removed from empty lines in the script editor. This must be set in Studio Settings > Studio tab.

### Auto Closing Brackets

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether the script editor automatically inserts a matching closing bracket. This must be set in Studio Settings > Studio tab.

### Auto Closing Quotes

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether the script editor automatically inserts a matching closing quote. This must be set in Studio Settings > Studio tab.

### Auto Delete Closing Brackets and Quotes

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether deleting an opening bracket or quote also removes its closing counterpart. This must be set in Studio Settings > Studio tab.

### Auto Indent Rule

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AutoIndentRule|AutoIndentRule]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Sets the rule used to determine automatic indentation in the script editor. This must be set in Studio Settings > Studio tab.

### Auto-Recovery Enabled

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Auto-Recovery · **Loaded/Saved:** true/true

Controls whether Studio automatically saves recovery files at a set interval. This must be set in Studio Settings > Studio tab.

### Auto-Recovery Interval (Minutes)

**Type:** int

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Auto-Recovery · **Loaded/Saved:** true/true

Sets the interval in minutes at which Studio saves auto-recovery files. This must be set in Studio Settings > Studio tab.

### AutocompleteAcceptanceBehavior

**Type:** [[30 Official Roblox Docs/API Reference/Enums/CompletionAcceptanceBehavior|CompletionAcceptanceBehavior]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Sets the key used to accept autocomplete suggestions in the script editor. This must be set in Studio Settings > Studio tab.

### Automatically trigger AI Code Completion

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether AI code completion suggestions trigger automatically while typing. This must be set in Studio Settings > Studio tab.

### AutoResumeSyncOnPlaceOpen

**Type:** boolean

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Directories · **Loaded/Saved:** true/true

Controls whether file sync resumes automatically when a place is opened. This must be set in Studio Settings > Studio tab.

### AutoUpdateEnabled

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Updates · **Loaded/Saved:** true/true

Controls whether Studio updates itself automatically when a new version is available. This must be set in Studio Settings > Studio tab.

### Background Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Specifies the background color of Roblox Studio's script editor.

### Basic Objects Display Mode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ListDisplayMode|ListDisplayMode]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** General · **Loaded/Saved:** true/true

Sets the scrolling mode of the `Advanced Objects` tab in Roblox Studio.

### Bool Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of boolean literals in the script editor. This must be set in Studio Settings > Studio tab.

### Bracket Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of brackets in the script editor. This must be set in Studio Settings > Studio tab.

### Built-in Function Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of built-in functions and keywords in the script editor.

### Camera Mouse Wheel Speed

**Type:** float

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true

Sets how many studs the camera will move forward or backwards when using the mouse wheel.

### Camera Pan Speed

**Type:** float

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true

Sets the speed of camera panning in Studio. This must be set in Studio Settings > Studio tab.

### Camera Shift Speed

**Type:** float

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true

Sets the speed in studs/sec that the camera moves while holding down Shift with the movement keys.

### Camera Speed

**Type:** float

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true

Sets the speed in studs/sec that the camera moves when movement keys are pressed.

### Camera Speed Adjust Binding

**Type:** [[30 Official Roblox Docs/API Reference/Enums/CameraSpeedAdjustBinding|CameraSpeedAdjustBinding]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true

Sets the mouse button used to adjust the camera speed in Studio. This must be set in Studio Settings > Studio tab.

### Camera Zoom to Mouse Position

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true

Controls whether the camera zooms toward the mouse cursor position. This must be set in Studio Settings > Studio tab.

### CameraNavigationModel

**Type:** [[30 Official Roblox Docs/API Reference/Enums/CameraNavigationModel|CameraNavigationModel]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true

Sets the navigation model used for camera movement in Studio. This must be set in Studio Settings > Studio tab.

### CameraShiftFactor

**Type:** float

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true

Sets the speed multiplier applied to camera movement when Shift is held. This must be set in Studio Settings > Studio tab.

### CameraTweenFocus

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true

Controls whether the camera smoothly tweens when refocusing on a selected object. This must be set in Studio Settings > Studio tab.

### Clear Output On Start

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Output · **Loaded/Saved:** true/true

If set to true, the output will be automatically cleared when game sessions are switched.

### CommandBarEnterExec

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether pressing Enter immediately executes the command bar input. This must be set in Studio Settings > Studio tab.

### CommandBarFont

**Type:** QFont

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Sets the font used in the Studio command bar. This must be set in Studio Settings > Studio tab.

### CommandBarLocalState

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Lua Debugger · **Loaded/Saved:** true/true

Controls whether the command bar retains its input state between sessions. This must be set in Studio Settings > Studio tab.

### Comment Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Specifies the color of comments in Roblox Studio's script editor.

### Current Line Highlight Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of the current line highlight in the script editor. This must be set in Studio Settings > Studio tab.

### Debugger Current Line Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of the current debugger line in the script editor. This must be set in Studio Settings > Studio tab.

### Debugger Error Line Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of debugger error lines in the script editor. This must be set in Studio Settings > Studio tab.

### DefaultInstancesDir

**Type:** QDir

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Directories · **Loaded/Saved:** true/true

Sets the default directory where Studio saves instance files. This must be set in Studio Settings > Studio tab.

### DefaultScriptSyncFileType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DefaultScriptSyncFileType|DefaultScriptSyncFileType]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Directories · **Loaded/Saved:** true/true

Sets the default file type used when syncing scripts to the file system. This must be set in Studio Settings > Studio tab.

### DeprecatedObjectsShown

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Browsing · **Loaded/Saved:** true/true

If set to true, deprecated objects will be shown in the Advanced Objects window, as well as the Object Browser.

### DisplayLanguage

**Type:** string

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** General · **Loaded/Saved:** true/true

Sets the display language used by the Studio interface. This must be set in Studio Settings > Studio tab.

### DraggerActiveColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Sets the color of the active dragger handle in Studio. This must be set in Studio Settings > Studio tab.

### DraggerLengthFactor

**Type:** float

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Sets the length scale factor of dragger handles in Studio. This must be set in Studio Settings > Studio tab.

### DraggerMajorGridIncrement

**Type:** int

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Sets the major grid increment used when snapping with the dragger. This must be set in Studio Settings > Studio tab.

### DraggerMaxSoftSnaps

**Type:** int

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Sets the maximum number of soft snap points shown by the dragger. This must be set in Studio Settings > Studio tab.

### DraggerPassiveColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Sets the color of inactive dragger handles in Studio. This must be set in Studio Settings > Studio tab.

### DraggerScaleFactor

**Type:** float

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Sets the scale factor controlling the overall size of dragger handles. This must be set in Studio Settings > Studio tab.

### DraggerShowAxisTicks

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Controls whether tick marks are shown on dragger axis lines. This must be set in Studio Settings > Studio tab.

### DraggerShowHoverRuler

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Controls whether a ruler is shown when hovering near the dragger. This must be set in Studio Settings > Studio tab.

### DraggerShowMeasurement

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Controls whether distance measurements are shown while dragging. This must be set in Studio Settings > Studio tab.

### DraggerShowNegativeAxes

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Controls whether negative axis handles are shown on the dragger. This must be set in Studio Settings > Studio tab.

### DraggerShowPlanes

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Controls whether planar translation handles are shown on the dragger. This must be set in Studio Settings > Studio tab.

### DraggerShowTargetSnap

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Controls whether the target snap indicator is shown on the dragger. This must be set in Studio Settings > Studio tab.

### DraggerShowTrackball

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Controls whether the trackball handle is shown on the rotation dragger. This must be set in Studio Settings > Studio tab.

### DraggerShowWhileDragging

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Controls whether dragger handles remain visible while actively dragging. This must be set in Studio Settings > Studio tab.

### DraggerSoftSnapMarginFactor

**Type:** float

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Sets the margin factor used to determine proximity for soft snapping. This must be set in Studio Settings > Studio tab.

### DraggerSummonMarginFactor

**Type:** float

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Sets the margin factor used to summon the dragger near a surface. This must be set in Studio Settings > Studio tab.

### DraggerTiltRotateDuration

**Type:** float

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Sets the duration in seconds of the tilt rotation animation in the dragger. This must be set in Studio Settings > Studio tab.

### Enable Autocomplete

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

When set to true, the script editor and command bar will show an autocomplete menu while writing.

### Enable Autocomplete Doc View

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether documentation is shown alongside autocomplete suggestions. This must be set in Studio Settings > Studio tab.

### Enable CoreScript Debugger

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Advanced · **Loaded/Saved:** true/true

Controls whether the CoreScript debugger is available in Studio. This must be set in Studio Settings > Studio tab.

### Enable Http Sandboxing

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Advanced · **Loaded/Saved:** true/true

Controls whether HTTP requests from plugins are sandboxed. This must be set in Studio Settings > Studio tab.

### Enable Internal Beta Features

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Advanced · **Loaded/Saved:** true/true

Controls whether internal beta features are accessible in Studio. This must be set in Studio Settings > Studio tab.

### Enable Internal Features

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Advanced · **Loaded/Saved:** true/true

Controls whether internal developer features are accessible in Studio. This must be set in Studio Settings > Studio tab.

### Enable Script Analysis

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether the script editor performs real-time Luau script analysis. This must be set in Studio Settings > Studio tab.

### Enable Scrollbar Markers

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether error and warning markers are shown on the script editor scrollbar. This must be set in Studio Settings > Studio tab.

### Enable Signature Help

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether function signature help popups are shown while typing. This must be set in Studio Settings > Studio tab.

### Enable Signature Help Doc View

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether documentation is shown alongside signature help popups. This must be set in Studio Settings > Studio tab.

### Enable Temporary Tabs

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether opening a script creates a temporary tab that is replaced on the next open. This must be set in Studio Settings > Studio tab.

### Enable Temporary Tabs In Explorer

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether clicking a script in the Explorer opens it in a temporary tab. This must be set in Studio Settings > Studio tab.

### Enable Type Hover

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether hovering over an identifier shows its inferred type. This must be set in Studio Settings > Studio tab.

### EnableCodeAssist

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether AI-powered code assist features are enabled in the script editor. This must be set in Studio Settings > Studio tab.

### EnableFindOnType

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Controls whether the Find bar activates when typing in the script editor. This must be set in Studio Settings > Studio tab.

### EnableIndentationRulers

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether indentation ruler lines are shown in the script editor. This must be set in Studio Settings > Studio tab.

### EnableSelectionTooltips

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether tooltips are shown when hovering over selected objects. This must be set in Studio Settings > Studio tab.

### EnableStudioStreaming

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Streaming · **Loaded/Saved:** true/true

Controls whether Studio streaming mode is enabled. This must be set in Studio Settings > Studio tab.

### Error Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Specifies the color of the wavy underline shown when malformed code is detected in the script editor.

### ExternalEditorMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ExternalEditorMode|ExternalEditorMode]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Directories · **Loaded/Saved:** true/true

Sets the mode used when opening scripts in an external editor. This must be set in Studio Settings > Studio tab.

### ExternalEditorSelection

**Type:** QDir

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Directories · **Loaded/Saved:** true/true

Sets which external editor Studio opens scripts with. This must be set in Studio Settings > Studio tab.

### Find Selection Background Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the highlight color of matches in the script editor's Find Selection operation (Ctrl+F).

### Font

**Type:** QFont

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Specifies the font used in the script editor.

### Format On Paste

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether pasted code is automatically formatted in the script editor. This must be set in Studio Settings > Studio tab.

### Format On Type

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether code is automatically formatted as you type in the script editor. This must be set in Studio Settings > Studio tab.

### Function Name Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of function names in the script editor. This must be set in Studio Settings > Studio tab.

### Highlight Current Line

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether the current line is highlighted in the script editor. This must be set in Studio Settings > Studio tab.

### Highlight Occurances

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether other occurrences of the word under the cursor are highlighted. This must be set in Studio Settings > Studio tab.

### HintColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of hint diagnostics in the script editor. This must be set in Studio Settings > Studio tab.

### Hover Animate Speed

**Type:** [[30 Official Roblox Docs/API Reference/Enums/HoverAnimateSpeed|HoverAnimateSpeed]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Tools · **Loaded/Saved:** true/true

Specifies how frequently the hover animation flashes when the mouse is hovering over a selectable object in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]].

### Hover Box Thickness

**Type:** float

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Tools · **Loaded/Saved:** true/true

Sets the thickness of the selection box shown when hovering over objects. This must be set in Studio Settings > Studio tab.

### Hover Line Thickness

**Type:** int

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Tools · **Loaded/Saved:** true/true

Sets the line thickness of the hover selection box. This must be set in Studio Settings > Studio tab.

### Hover Over Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Tools · **Loaded/Saved:** true/true

Specifies the color that the hover selection box uses.

### IconOverrideDir

**Type:** QDir

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Directories · **Loaded/Saved:** true/true

Sets the directory Studio uses to load icon overrides. This must be set in Studio Settings > Studio tab.

### Indent Using Spaces

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether the script editor uses spaces instead of tabs for indentation. This must be set in Studio Settings > Studio tab.

### IndentationRulerColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of indentation rulers in the script editor. This must be set in Studio Settings > Studio tab.

### InformationColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of information diagnostics in the script editor. This must be set in Studio Settings > Studio tab.

### Keyword Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the text color of built-in Luau keywords.

### LargeFileLineCountThreshold

**Type:** int

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Sets the line count at which a script is treated as a large file by the script editor. This must be set in Studio Settings > Studio tab.

### LargeFileThreshold

**Type:** int

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Sets the byte size at which a script is treated as a large file by the script editor. This must be set in Studio Settings > Studio tab.

### Line Thickness

**Type:** float

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Primary Part · **Loaded/Saved:** true/true

Sets the thickness of the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|Model.PrimaryPart]] selection adornee. This value is constrained between 0 and 0.05.

### LoadAllBuiltinPluginsInRunModes

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Controls whether all built-in plugins are loaded when using run modes. This must be set in Studio Settings > Studio tab.

### LoadInternalPlugins

**Type:** boolean

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Controls whether internal Roblox plugins are loaded in Studio. This must be set in Studio Settings > Studio tab.

### LoadUserPluginsInRunModes

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Controls whether user-installed plugins are loaded when using run modes. This must be set in Studio Settings > Studio tab.

### LocalAssetsFolder

**Type:** QDir

**Security:** read None / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Directories · **Loaded/Saved:** true/true

Sets the local folder Studio uses for local asset storage. This must be set in Studio Settings > Studio tab.

### LuaDebuggerEnabled

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Lua Debugger · **Loaded/Saved:** true/true

Specifies whether or not the Lua Debugger feature is enabled.

### LuaDebuggerEnabledAtStartup

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Lua Debugger · **Loaded/Saved:** false/false · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`

Controls whether the Lua debugger is enabled when Studio starts. This must be set in Studio Settings > Studio tab.

### Luau Keyword Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of Luau-specific keywords in the script editor. This must be set in Studio Settings > Studio tab.

### Main Volume

**Type:** float

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Audio · **Loaded/Saved:** true/true

Sets the main audio playback volume in Studio. This must be set in Studio Settings > Studio tab.

### Matching Word Background Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the highlight color of double-clicked variables in the script editor.

### MaxFindReplaceAllResults

**Type:** int

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Sets the maximum number of results returned by the Find All operation. This must be set in Studio Settings > Studio tab.

### Maximum Output Lines

**Type:** int

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Output · **Loaded/Saved:** true/true

The maximum number of lines that can be displayed in the output.

### Menu Item Background Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the background color of menu items in Studio. This must be set in Studio Settings > Studio tab.

### Method Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of method names in the script editor. This must be set in Studio Settings > Studio tab.

### Number Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Specifies the color of numbers in Roblox Studio's script editor.

### Only Play Audio from Window in Focus

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Audio · **Loaded/Saved:** true/true

If set to true, audio being played will only be heard if the game window is being focused on.

### Operator Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the text color of operator characters in the script editor.

### Output Font

**Type:** QFont

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Output · **Loaded/Saved:** true/true

Specifies the font used by the output.

### Output Layout Mode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/OutputLayoutMode|OutputLayoutMode]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Output · **Loaded/Saved:** true/true

Sets the layout mode of the output.

### PermissionLevelShown

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PermissionLevelShown|PermissionLevelShown]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Browsing · **Loaded/Saved:** true/true

Sets the highest permission level that APIs have to have in order to be shown in the Object Browser. See [[30 Official Roblox Docs/API Reference/Enums/PermissionLevelShown|Enum.PermissionLevelShown]] for more info.

### Physical Draggers Select Scope By Default

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Tools · **Loaded/Saved:** true/true

Controls whether physical draggers default to selecting within the current scope. This must be set in Studio Settings > Studio tab.

### Pivot Snap To Geometry Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Tools · **Loaded/Saved:** true/true

Sets the color of the pivot snap-to-geometry indicator in Studio. This must be set in Studio Settings > Studio tab.

### PluginDebuggingEnabled

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Lua Debugger · **Loaded/Saved:** true/true

Controls whether plugin script debugging is enabled in Studio. This must be set in Studio Settings > Studio tab.

### PluginsDir

**Type:** QDir

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Directories · **Loaded/Saved:** true/true

The directory where local plugins are stored.

### PreferredTextSize

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PreferredTextSize|PreferredTextSize]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** General · **Loaded/Saved:** true/true

Sets the preferred font size in the script editor. This must be set in Studio Settings > Studio tab.

### Primary Text Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the primary text color in Studio. This must be set in Studio Settings > Studio tab.

### Property Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of property names in the script editor. This must be set in Studio Settings > Studio tab.

### ReloadBuiltinPluginsOnChange

**Type:** boolean

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Directories · **Loaded/Saved:** true/true

Controls whether built-in plugins are automatically reloaded when their files change. This must be set in Studio Settings > Studio tab.

### ReloadLocalPluginsOnChange

**Type:** boolean

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Directories · **Loaded/Saved:** true/true

Controls whether local plugins are automatically reloaded when their files change. This must be set in Studio Settings > Studio tab.

### Respect Studio shortcuts when game has focus

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Advanced · **Loaded/Saved:** true/true

When set to true, Roblox Studio shortcuts will take priority over inputs being captured in the game window.

### Ruler Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of the column ruler in the script editor. This must be set in Studio Settings > Studio tab.

### Rulers

**Type:** string

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Sets the column positions at which vertical ruler lines are drawn in the script editor. This must be set in Studio Settings > Studio tab.

### RuntimeUndoBehavior

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RuntimeUndoBehavior|RuntimeUndoBehavior]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Undo · **Loaded/Saved:** true/true

Sets how Studio handles undo operations during runtime playback. This must be set in Studio Settings > Studio tab.

### Script Editor Color Preset

**Type:** [[30 Official Roblox Docs/API Reference/Enums/StudioScriptEditorColorPresets|StudioScriptEditorColorPresets]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** true/true

Sets the color preset applied to the script editor. This must be set in Studio Settings > Studio tab.

### Script Editor Scrollbar Background Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the background color of the script editor scrollbar in Studio. This must be set in Studio Settings > Studio tab.

### Script Editor Scrollbar Handle Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the handle color of the script editor scrollbar in Studio. This must be set in Studio Settings > Studio tab.

### ScriptTimeoutLength

**Type:** int

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Lua Debugger · **Loaded/Saved:** true/true

The time (in seconds) a script can wait to be resumed before timing out.

### Scroll Past Last Line

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether the script editor allows scrolling below the last line. This must be set in Studio Settings > Studio tab.

### Secondary Text Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the secondary text color in Studio. This must be set in Studio Settings > Studio tab.

### Select Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Tools · **Loaded/Saved:** true/true

The color of the selection box used with object selections in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]

### Select/Hover Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Primary Part · **Loaded/Saved:** true/true

Sets the color of the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|Model.PrimaryPart]] selection box.

### Selected Menu Item Background Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the background color of selected menu items in Studio. This must be set in Studio Settings > Studio tab.

### Selected Text Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of selected text in Studio. This must be set in Studio Settings > Studio tab.

### Selection Background Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the background color of selected text in the script editor.

### Selection Box Thickness

**Type:** float

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Tools · **Loaded/Saved:** true/true

Sets the thickness of the selection box around selected objects. This must be set in Studio Settings > Studio tab.

### Selection Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the text color of selected text in the script editor.

### Selection Line Thickness

**Type:** int

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Tools · **Loaded/Saved:** true/true

Sets the line thickness of the selection box around selected objects. This must be set in Studio Settings > Studio tab.

### Set Pivot of Imported Parts

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Advanced · **Loaded/Saved:** true/true

Sets whether the pivot point is repositioned when parts are imported. This must be set in Studio Settings > Studio tab.

### Show Core GUI in Explorer while Playing

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Explorer · **Loaded/Saved:** true/true

If set to true, the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] will be visible in the Explorer while the game is running.

### Show Diagnostics Bar

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Advanced · **Loaded/Saved:** true/true

If set to true, basic diagnostic information is shown in the bottom right.

### Show FileSyncService

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Explorer · **Loaded/Saved:** true/true

Controls whether FileSyncService is shown in the Explorer panel. This must be set in Studio Settings > Studio tab.

### Show Hidden Objects in Explorer

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Explorer · **Loaded/Saved:** true/true

Controls whether hidden objects are visible in the Explorer panel. This must be set in Studio Settings > Studio tab.

### Show Hover Over

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Tools · **Loaded/Saved:** true/true

If set to true, hovering over an object in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] will show a selection box.

### Show Light Guides

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Visualization · **Loaded/Saved:** true/true

Controls whether light guide visualizations are shown in the viewport. This must be set in Studio Settings > Studio tab.

### Show Navigation Labels

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Visualization · **Loaded/Saved:** true/true

Controls whether navigation mesh region labels are shown in the viewport. This must be set in Studio Settings > Studio tab.

### Show Navigation Mesh

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Visualization · **Loaded/Saved:** true/true

When set to true, the navigation mesh used by the [[30 Official Roblox Docs/API Reference/Classes/PathfindingService|PathfindingService]] will be visualized.

### Show Pathfinding Links

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Visualization · **Loaded/Saved:** true/true

Controls whether PathfindingLink visualizations are shown in the viewport. This must be set in Studio Settings > Studio tab.

### Show Plugin GUI Service in Explorer

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Explorer · **Loaded/Saved:** true/true

When set to true, the [[30 Official Roblox Docs/API Reference/Classes/PluginGuiService|PluginGuiService]] will be shown in Roblox Studio's explorer.

### Show plus button on hover in Explorer

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Explorer · **Loaded/Saved:** true/true

Controls whether a plus button appears when hovering over items in the Explorer. This must be set in Studio Settings > Studio tab.

### Show Singly Selected Attachment Parent Frame

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Visualization · **Loaded/Saved:** true/true

Controls whether the parent part frame is shown when a single attachment is selected. This must be set in Studio Settings > Studio tab.

### Show Whitespace

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether whitespace characters are shown as visible glyphs in the script editor. This must be set in Studio Settings > Studio tab.

### ShowCorePackagesInExplorer

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Explorer · **Loaded/Saved:** true/true

Controls whether core packages are shown in the Explorer panel. This must be set in Studio Settings > Studio tab.

### Skip Closing Brackets and Quotes

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Controls whether the cursor skips over a typed closing bracket or quote if one already exists. This must be set in Studio Settings > Studio tab.

### String Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Specifies the color of strings in the script editor.

### Tab Width

**Type:** int

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

Specifies how many spaces are used to represent a tab in the script editor.

### Text Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Specifies the color of normal text in the script editor.

### Text Wrapping

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor · **Loaded/Saved:** true/true

If set to true, text in the script editor will be wrapped.

### Theme

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** General · **Loaded/Saved:** false/false

The Theme property is used to get/set the current [[30 Official Roblox Docs/API Reference/Classes/StudioTheme|StudioTheme]] used by [[30 Official Roblox Docs/API Reference/Classes/Studio|Studio]].

This is intended for use within [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugins]], but will also execute in the Command Line. You can access the function via:

```lua
settings().Studio.Theme
```

For instance, if you would like to print the current Studio theme:

```lua
print("The current Studio theme is:", settings().Studio.Theme)
```

### TypeColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of type annotations in the script editor. This must be set in Studio Settings > Studio tab.

### UI Theme

> [!warning] Deprecated
> This member is deprecated.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/UITheme|UITheme]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** General · **Loaded/Saved:** false/true · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`, `Deprecated`

Specifies the color scheme of Roblox Studio.

### Use Bounding Box Move Handles

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Tools · **Loaded/Saved:** true/true

Controls whether move handles are placed at the bounding box edges instead of the pivot. This must be set in Studio Settings > Studio tab.

### UseDefaultExternalEditor

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Directories · **Loaded/Saved:** true/true

Controls whether Studio uses the system's default application to open scripts externally. This must be set in Studio Settings > Studio tab.

### VAxisColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Sets the color of the V axis handle in Studio's draggers. This must be set in Studio Settings > Studio tab.

### Warning Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Specifies the color of the wavy underline shown when the script analyzer picks up a problem that should be addressed in the script editor.

### Whitespace Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Script Editor Colors · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Sets the color of visible whitespace characters in the script editor. This must be set in Studio Settings > Studio tab.

### XAxisColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Sets the color of the X axis handle in Studio's draggers. This must be set in Studio Settings > Studio tab.

### YAxisColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Sets the color of the Y axis handle in Studio's draggers. This must be set in Studio Settings > Studio tab.

### ZAxisColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Sets the color of the Z axis handle in Studio's draggers. This must be set in Studio Settings > Studio tab.

## Methods

### GetAvailableThemes

```lua
Studio:GetAvailableThemes(): Array
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

The **GetAvailableThemes()** function returns a list of [[30 Official Roblox Docs/API Reference/Classes/StudioTheme|StudioThemes]] available in [[30 Official Roblox Docs/API Reference/Classes/Studio|Studio]]. You can access the function via:

**Returns**

| Type | Description |
| --- | --- |
| Array | A list of themes available in Studio. |

*Code samples for this member (`getavailablethemes`, `Studio-GetAvailableThemes`) are published on the source page; their code is not part of the open-source repo.*

## Events

### ThemeChanged

```lua
Studio.ThemeChanged()
```

**Security:** PluginSecurity

The **ThemeChanged** event fires when Studio's [[30 Official Roblox Docs/API Reference/Classes/Studio#Theme|Theme]] changes. The best use of this event is to get the colors from the theme that changed and update your plugin's UI accordingly.

---
*Source: [Studio](https://create.roblox.com/docs/reference/engine/classes/Studio) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
