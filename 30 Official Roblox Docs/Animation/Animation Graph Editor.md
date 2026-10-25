---
title: "Animation Graph Editor"
description: "The animation graph editor is a visual, node-based tool that lets you build complex animation logic."
area: "30 Official Roblox Docs"
cluster: "Animation"
source: "https://create.roblox.com/docs/animation/graph-editor"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The animation graph editor is a visual, node-based tool that lets you build complex animation logic.*

The **Animation Graph Editor** is a visual, node-based tool that empowers technical artists and animators to build complex animation logic directly within Roblox Studio. By providing a streamlined interface for creating behaviors like blend trees, it removes the traditional dependency on manual scripting for character motion.

This system works in tandem with your existing animation workflow:

- **Animation Editor**: Continue using the [[30 Official Roblox Docs/Animation/Animation Editor|Animation Editor]] as your primary tool for authoring individual clips and fine-tuning keyframes and curves.
- **Animation Graph Editor**: Use this tool to take those clips and organize them into a logic tree to drive sophisticated gameplay behavior.

Designed to enhance collaboration, the visual graph allows developers to quickly inspect, debug, and understand the logic created by animators. While artists focus on refining interactive motion, developers can still access animation graph nodes programmatically for direct control over blended animations and states.

## Build a graph

![](https://www.youtube.com/watch?v=VgMUCph3bOI)

To begin building logic for an animatable character, access the Animation Graph editor via the Avatar tab in the Studio ribbon. The following steps demonstrate how to initialize a rig and construct a basic node network using default walking and waving animations.

For a deeper dive into practical applications, you can explore the [Animation Graph Reference File](https://www.roblox.com/games/92493993350916/Animation-Graph-Editor-Simple-Demo), which contains both foundational and complex implementation examples.

To create your own animation graph, similar to the basic example provided in the reference, use the following steps:

1. In Studio, add an animatable rig by navigating to the **Avatar** tab and selecting **Character** ⟩ **My Avatar**.

   *(image in the full Top G Vault)*

2. Open the Animation Graph Editor by navigating to **Graph Editor** in the **Avatar** tab.

   *(image in the full Top G Vault)*

3. Select the animatable rig in the 3D viewport. In the graph edtior view, select **Graph** in the top left corner and select **New** to create a new graph.
4. In the Graph Editor, right-click and select **Insert Node** ⟩ **Clip**.

   *(image in the full Top G Vault)*

5. In the new Clip node, set the Animation ID.
   1. Select the **Animation ID** dropdown.
   2. To submit a specific animation asset ID, click **Import**.

      *(image in the full Top G Vault)*

   3. In the **Animation ID** field, add the default Walk animation: `507777826`.
   4. Select **Import**.

6. Add another clip node by repeating steps 4-5 using the default Wave animation: `507770239`.

   *(image in the full Top G Vault)*

7. In the Graph Editor, right-click and select **Add**.

   *(image in the full Top G Vault)*

8. **Connect the Clip nodes to the Add node** by dragging the top-right output connector to the appropriate port:
   1. Connect the **Clip** node with the Walking animation to the **Base** port.
   2. Connect the **Clip** node with the Waving animation to the **Additive** port.

     *(image in the full Top G Vault)*

9. From the Add node, connect the top-right output connector to the Graph Output **Pose** port.

   *(image in the full Top G Vault)*

10. **OPTIONAL** Assign a parameter to your `Speed` variable.
    1. Click and drag the green Speed port to an empty area. A new parameter node displays.
       *(image in the full Top G Vault)*

    2. In the top left of the graph editor, use the parameter pane to quickly modify parameters in your nodes. You can also access this [[30 Official Roblox Docs/Animation/Animation Graph Editor#API integration|programmatically]].
       *(image in the full Top G Vault)*

11. Test the animation by pressing the **play button**.

    *(image in the full Top G Vault)*

12. Try testing various weights, speeds, playmodes, and other animations. For more information on individual nodes, see the [[30 Official Roblox Docs/Animation/Animation Graph Editor#Node reference|Node reference]].

> [!success]
> Check out the [reference place](https://www.roblox.com/games/92493993350916/Animation-Graph-Editor-Simple-Demo) for different examples of various animation graph configurations.

## API integration

Creating and deploying an Animation Graph follows the standard Roblox animation pipeline. After selecting a rig in the Animation Graph Editor, a new `AnimationGraphDefinition` asset is created. This asset serves as the container for your nodes, connections, and parameters. Once your logic is finalized, you publish the graph to receive a standard Asset ID.

In your scripts, you interact with these graphs by loading them onto an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] as you would a traditional animation. To drive the graph's internal logic, use [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#SetParameter|AnimationTrack:SetParameter]] to pass real-time values—such as movement speed or state booleans—directly into the graph's variables.

```lua
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://123456789" -- Your Published Graph ID

local animationTrack = animator:LoadAnimation(animation)
animationTrack:Play()

-- Dynamic parameter updates via RunService
game:GetService("RunService").Stepped:Connect(function(_, dt)
    local currentSpeed = humanoidRootPart.AssemblyLinearVelocity.Magnitude
    animationTrack:SetParameter("humanoidSpeed", currentSpeed)
end)
```

## Node reference

> [!success]
> For details about each node type, see [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|Enum.AnimationNodeType]].

### Global event rules

For all nodes and [[30 Official Roblox Docs/Animation/Animation Graph Editor#Transitions|transitions]], the following rules apply by default:

- Events propagate upward from their source node through the graph. Each event carries a weight representing its source's influence in the final blend. If the weight reaches zero at any point, the event is silenced.
- Nodes without custom event logic pass all events through unchanged; nodes that blend or select between inputs may scale the weight or block events from non-primary inputs (see per-node Event section).
- Marker events that reach the top of the graph can be observed via [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#GetMarkerReachedSignal|AnimationTrack:GetMarkerReachedSignal]].

## Transitions

Several nodes in the Animation Graph (such as **Select**, **Priority Select**, **Sequence**, and **Random Sequence**) manage how animations blend when switching between active inputs. To prevent redundancy in the node reference, these behaviors are defined by standardized transition property groups.

### Default transition

*(image in the full Top G Vault)*

The baseline blending behavior applied to the node whenever it switches to a new active input.

- **DefaultTransitionDuration** (number): The time (in seconds) it takes to fully blend into the new pose.
- **DefaultTransitionCurve** ([[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle|Enum.PoseEasingStyle]]): The easing function applied during the blend. Currently only supports [[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle|Enum.PoseEasingStyle.Linear]] and [[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle|Enum.PoseEasingStyle.CubicV2]].

### Transition override

*(image in the full Top G Vault)*

Input-specific link properties that supersede the default transition. Duration and curve overrides apply when the node transitions **to** that input, except for **BeforeFinished** transitions, which use the outgoing input's overrides.

- **TransitionOverrideDuration** (number): Overrides the default transition duration.
- **TransitionOverrideCurve** ([[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle|Enum.PoseEasingStyle]]): Overrides the default transition curve. Currently only supports [[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle|Enum.PoseEasingStyle.Linear]] and [[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle|Enum.PoseEasingStyle.CubicV2]]

### Transition timing

For sequence node types, the following settings control when the sequence advances to the next input:

- **WaitFor** ([Enum.AnimationNodeWaitFor](https://create.roblox.com/docs/reference/engine/enums/AnimationNodeWaitFor)): Sets the condition for advancing. Use [Finished](https://create.roblox.com/docs/reference/engine/enums/AnimationNodeWaitFor) (default) to wait for the current input to finish or complete a loop, or [Trigger](https://create.roblox.com/docs/reference/engine/enums/AnimationNodeWaitFor) to advance when **WaitForTrigger** is `true`. Set the node-level default with **DefaultWaitFor**, or override it for an input with **TransitionOverrideWaitFor**.
  - **When** ([Enum.AnimationNodeTransitionWhen](https://create.roblox.com/docs/reference/engine/enums/AnimationNodeTransitionWhen)): Applies when **Wait For** is [Finished](https://create.roblox.com/docs/reference/engine/enums/AnimationNodeWaitFor). Set the node-level default with **DefaultTransitionWhen**, or override it for the outgoing input with **TransitionOverrideWhen**.
    - [Finished](https://create.roblox.com/docs/reference/engine/enums/AnimationNodeTransitionWhen) (default): Begins blending after the current input finishes.
    - [BeforeFinished](https://create.roblox.com/docs/reference/engine/enums/AnimationNodeTransitionWhen): Begins blending one transition duration before the current input finishes, so the blend overlaps the end of its animation. For example, a 0.2-second transition starts during the final 0.2 seconds of the animation.

[[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|RandomSequenceNode]] also supports **DefaultTransitionWhen** and **TransitionOverrideWhen** to control when blending begins.

For state machine transitions, see [[30 Official Roblox Docs/Animation/Graph Editor state machines#Transition properties|Transition properties]].

## Replication

Animation graph parameters and internal node state replicate automatically. The replication mode is determined by [[30 Official Roblox Docs/API Reference/Classes/Workspace#AuthorityMode|Workspace.AuthorityMode]] at the time the Animate script is created:

- **In [[30 Official Roblox Docs/API Reference/Enums/AuthorityMode|Enum.AuthorityMode.Automatic]]**: Parameters set via [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#SetParameter|AnimationTrack:SetParameter]] replicate automatically to other peers.
- **In [[30 Official Roblox Docs/API Reference/Enums/AuthorityMode|Enum.AuthorityMode.Server]]**: The server drives the full graph simulation. All node states, such as elapsed time for [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|Enum.AnimationNodeType.ClipNode]], and graph parameters replicate automatically from server to clients. The owning player's client uses prediction for smooth local playback.

### Sample Animate Scripts

To generate example scripts to drive an animation graph for a rig, use **Graph -> Create Animate script** in the Animation Graph Editor. This produces a script hierarchy placed under [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts|StarterCharacterScripts]] (for player characters) or directly on the rig (for NPCs):

```text
Animate (ModuleScript)
├── RunClient (LocalScript)
└── RunServer (Script, RunContext = Legacy)
```

The **Animate** [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] contains the graph-loading logic. The **RunClient** and **RunServer** scripts invoke it in the appropriate context. Which scripts are included depends on the use case:

| Use Case | Scripts Included | Behavior |
| --- | --- | --- |
| **NPC** (any mode) | RunServer | Server loads and plays the graph. State replicates to all clients automatically. |
| **Player + [[30 Official Roblox Docs/API Reference/Enums/AuthorityMode\|Enum.AuthorityMode.Server]]** | RunServer + RunClient | Server drives the graph authoritatively. The owning client enables [[30 Official Roblox Docs/API Reference/Enums/PredictionMode\|Enum.PredictionMode]] for rollback-based local prediction. |
| **Player + [[30 Official Roblox Docs/API Reference/Enums/AuthorityMode\|Enum.AuthorityMode.Automatic]]** | RunClient | Owning client loads and plays the graph. Parameters replicate automatically to the server and other clients. |

The following attributes are stored on the Animate script and configure its behavior:

| Attribute | Type | Description |
| --- | --- | --- |
| **GraphName** | String | Name of the animation graph asset. |
| **CharacterName** | String | Name of the rig the graph targets. |
| **SourceAssetId** | String | The published Asset ID of the graph. Used at runtime in published games. |
| **IsServerAuthority** | Boolean | Whether the script was created with [[30 Official Roblox Docs/API Reference/Classes/Workspace#AuthorityMode\|Workspace.AuthorityMode]] set to **Server**. Determines the replication strategy. |
| **PreviewInStudio** | Boolean | When true (default), Studio play-testing loads the unpublished graph locally so you can iterate without publishing. Set to false to test the published asset in Studio. Note that this is currently not supported in [[30 Official Roblox Docs/API Reference/Enums/AuthorityMode\|Enum.AuthorityMode.Server]]. |

### Parameter replication in Automatic mode

When [[30 Official Roblox Docs/API Reference/Classes/Workspace#AuthorityMode|Workspace.AuthorityMode]] is **Automatic**:

- The **owning client** drives player character graphs; the **server** drives NPC graphs.
- Parameters set via [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#SetParameter|AnimationTrack:SetParameter]] are automatically replicated to other peers. Multiple `SetParameter` calls within a single frame are coalesced (last-writer-wins).
- No additional scripting is needed for parameter transport — the engine handles replication internally.
- Other clients see parameter updates with a small delay (one send interval plus network latency).

### Server authority

When [[30 Official Roblox Docs/API Reference/Classes/Workspace#AuthorityMode|Workspace.AuthorityMode]] is **Server**:

- The **server** is authoritative for all graphs — it runs the simulation and replicates the full graph state.
- **What is replicated**: Both parameters and internal node state, including elapsed time, current selections, transition progress, loop counts, and RNG seeds. This ensures all clients see identical animation behavior.
- **Player characters**: The server drives the graph. The owning client's **RunClient** script automatically enables [[30 Official Roblox Docs/API Reference/Enums/PredictionMode|Enum.PredictionMode]] on the [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]], so the local player sees smooth, predicted animation that reconciles with the server on mismatch.
- **NPCs**: The server drives the graph exclusively; clients observe the replicated state with no local simulation.

### Driving parameters

Use [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#SetParameter|AnimationTrack:SetParameter]] from every script that runs the graph:

- **NPC (any mode)**: Call `SetParameter` from **RunServer** (or any server [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with access to the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]]).
- **Player character in [[30 Official Roblox Docs/API Reference/Enums/AuthorityMode|Enum.AuthorityMode.Server]]**: Call `SetParameter` from **both** **RunServer** and **RunClient**. The server needs parameters to drive the authoritative simulation, and the owning client needs the same parameters to drive its local prediction.
- **Player character in [[30 Official Roblox Docs/API Reference/Enums/AuthorityMode|Enum.AuthorityMode.Automatic]]**: Call `SetParameter` from **RunClient** (or any client [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] with access to the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]]).

The generated Animate script includes a commented-out `SetParameter` block as a starting point. Uncomment and modify it to drive parameters from gameplay state (movement speed, humanoid state, input direction, etc.).

---
*Source: [Animation Graph Editor](https://create.roblox.com/docs/animation/graph-editor) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
