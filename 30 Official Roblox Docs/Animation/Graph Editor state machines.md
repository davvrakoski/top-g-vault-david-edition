---
title: "Graph Editor state machines"
description: "Use state machines in the Animation Graph Editor to organize state-driven animations and control how they transition."
area: "30 Official Roblox Docs"
cluster: "Animation"
source: "https://create.roblox.com/docs/animation/graph-editor-state-machine"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use state machines in the Animation Graph Editor to organize state-driven animations and control how they transition.*

A **state machine** combines animation nodes into named states, such as **Idle**, **Walk**, **Run**, and **Jump**. It plays the active state and blends to another state when a transition condition evaluates to `true`. Use a state machine to define which animations can follow each other without writing transition logic in Luau.

Each state connects to an input on the state machine. A state can be a clip, a blend node, or another state machine. The state machine outputs the active animation pose or a blend between two poses if transitioning, which you connect to the next node in the graph.

## Prerequisites

Before you create a state machine, familiarize yourself with the [[30 Official Roblox Docs/Animation/Animation Graph Editor|Animation Graph Editor]], including how to [[30 Official Roblox Docs/Animation/Animation Graph Editor#Build a graph|open it and create an animation graph]].

## Create a state machine

The following example uses three states from **JumpFallLandRunExample**: **Locomotion**, **Fall**, and **LandIdle**. The character moves normally, switches to a falling animation when airborne, and plays a landing animation before returning to locomotion. These steps focus on the state machine; start with animation nodes for locomotion, falling, and landing.

1. In the **Graph Editor**, right-click and select **Insert Node** ⟩ **State Machine**.

   *(image in the full Top G Vault)*

2. On the state machine node, click **Open**. In the **State Machine** view, use **Create State** to add three states named `Locomotion`, `Fall`, and `LandIdle`.

   *(image in the full Top G Vault)*

3. Click **Back to Graph** and connect your animation nodes to the corresponding state machine inputs:
   - **Locomotion**: Connect your locomotion animation. The reference graph uses an [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|Blend1DNode]] named **IdleRunBlend** to blend idle and running animations based on `Speed`.
   - **Fall**: Connect a falling [[30 Official Roblox Docs/API Reference/Enums/AnimationNodeType|ClipNode]] and set **Play Mode** to [OnceAndHold](https://create.roblox.com/docs/reference/engine/enums/AnimationNodePlayMode), so it holds its final pose until the character lands.
   - **LandIdle**: Connect a landing clip and set **Play Mode** to [OnceAndHold](https://create.roblox.com/docs/reference/engine/enums/AnimationNodePlayMode), so it can finish and transition back to locomotion.

   Connect the state machine output to the **Pose** input of **Graph Output**.

   *(image in the full Top G Vault)*

4. Open the **State Machine** view again and drag a transition from **(Entry)** to **Locomotion**. The state machine starts in this state when the graph starts.

   *(image in the full Top G Vault)*

5. Add a Boolean graph parameter named `Grounded` and set it to `true`. This parameter indicates whether the character is on the ground.

6. Add the following transitions by dragging a connection from the source state to the destination state, then configure each transition:
   - **Locomotion** to **Fall**: Set **Wait For** to [[30 Official Roblox Docs/Animation/Graph Editor expressions|Expression]], **Expression** to `not Grounded`, and **Length** to `0.2` seconds. The falling animation begins when the character leaves the ground.
   - **Fall** to **LandIdle**: Set **Wait For** to **Expression**, **Expression** to `Grounded`, and **Length** to `0.1` seconds. The landing animation begins when the character touches the ground.
   - **LandIdle** to **Locomotion**: Set **Wait For** to **Finished**, **When** to [BeforeFinished](https://create.roblox.com/docs/reference/engine/enums/AnimationNodeTransitionWhen), and **Length** to `0.2` seconds. The state machine begins blending back to locomotion during the final 0.2 seconds of the landing animation.

   *(image in the full Top G Vault)*

7. Leave **Curve** as the default ([[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle|Linear]]) for all three transitions. Preview the graph and change `Grounded` to `false` to enter **Fall**, then back to `true` to play **LandIdle** and return to **Locomotion**.

8. Update `Grounded` from your gameplay code as the character leaves and touches the ground. If your locomotion blend uses `Speed`, update that parameter as the character moves. For the parameter workflow, see [[30 Official Roblox Docs/Animation/Animation Graph Editor#API integration|API integration]].

9. Extend the state machine with jumping and additional landing states to create the full movement graph. **JumpFallLandRunExample** includes separate jumps for standing and running, plus different landings based on movement and fall speed.

> [!success]
> For the full state machine, open **JumpFallLandRunExample** in the [reference place](https://www.roblox.com/games/116845448376632).

## State machine properties

### State machine node properties

****Inputs****

- **State1...StateN**: The animation nodes that define each state. The name of the state must match the name of the input to the state machine node.

****Properties****

| Property | Type | Description | | --- | --- | --- | | **EntryState** | [[30 Official Roblox Docs/API Reference/Classes/ObjectValue\|ObjectValue]] | An [[30 Official Roblox Docs/API Reference/Classes/ObjectValue\|ObjectValue]] whose [[30 Official Roblox Docs/API Reference/Classes/ObjectValue#Value\|Value]] points to the [[30 Official Roblox Docs/API Reference/Classes/AnimationNodeDefinition\|AnimationNodeDefinition]] for the state that is active when the graph starts. |

****Event data****

- **Event Handling:** Events from the active state pass through with their weight unchanged. - **Event Emission:** Passes through events from the active state only. During a transition, event emission follows the [[30 Official Roblox Docs/Animation/Animation Graph Editor#Global event rules|global event rules]].

### Transition properties

A transition has one or more source states, a destination state, and a condition. When the active state matches a source state, the state machine checks the condition. It blends to the destination state when the condition evaluates to `true`.

**Wait For** determines the transition condition UI. Select [[30 Official Roblox Docs/Animation/Graph Editor expressions|Expression]] ([Trigger](https://create.roblox.com/docs/reference/engine/enums/AnimationNodeWaitFor)) to display an **Expression** box. An **Expression** can reference a boolean graph parameter directly, such as `ShouldJump`, or evaluate a condition, such as `Speed >= 12`. Select **Finished** ([Finished](https://create.roblox.com/docs/reference/engine/enums/AnimationNodeWaitFor)) to display the **When** dropdown.

If more than one transition has a true **Expression**, the state machine evaluates the transition with the highest **Priority** value first. When priorities are the same, it selects one transition at random. Assign different priorities to competing transitions to make the result predictable.

| Property | Type | Description |
| --- | --- | --- |
| **From** | [[30 Official Roblox Docs/API Reference/Classes/ObjectValue\|ObjectValue]] | An [[30 Official Roblox Docs/API Reference/Classes/ObjectValue\|ObjectValue]] whose [[30 Official Roblox Docs/API Reference/Classes/ObjectValue#Value\|Value]] points to the [[30 Official Roblox Docs/API Reference/Classes/AnimationNodeDefinition\|AnimationNodeDefinition]] for the state that can begin the transition. Leave this property unset for an **(Any)** transition. |
| **To** | [[30 Official Roblox Docs/API Reference/Classes/ObjectValue\|ObjectValue]] | An [[30 Official Roblox Docs/API Reference/Classes/ObjectValue\|ObjectValue]] whose [[30 Official Roblox Docs/API Reference/Classes/ObjectValue#Value\|Value]] points to the [[30 Official Roblox Docs/API Reference/Classes/AnimationNodeDefinition\|AnimationNodeDefinition]] for the destination state. |
| **WaitFor** | [Enum.AnimationNodeWaitFor](https://create.roblox.com/docs/reference/engine/enums/AnimationNodeWaitFor) | Determines which transition condition UI appears. [Trigger](https://create.roblox.com/docs/reference/engine/enums/AnimationNodeWaitFor) displays the **Expression** box. [Finished](https://create.roblox.com/docs/reference/engine/enums/AnimationNodeWaitFor) displays the **When** dropdown. |
| **When** | [Enum.AnimationNodeTransitionWhen](https://create.roblox.com/docs/reference/engine/enums/AnimationNodeTransitionWhen) | Available when **Wait For** is **Finished**. Select [Finished](https://create.roblox.com/docs/reference/engine/enums/AnimationNodeTransitionWhen) to begin after the source state finishes, or [BeforeFinished](https://create.roblox.com/docs/reference/engine/enums/AnimationNodeTransitionWhen) to begin blending one **Duration** before the source state finishes. |
| **Expression** | String | Available when **Wait For** is [[30 Official Roblox Docs/Animation/Graph Editor expressions\|Expression]]. A boolean graph parameter or expression that, when it evaluates to `true`, begins the transition. See [[30 Official Roblox Docs/Animation/Graph Editor expressions\|Expression]] for what's supported. |
| **Priority** | Number | The order used when more than one **Expression** is true. Higher values take precedence. Valid values range from 0 to 65,535. |
| **Duration** | Number | The time, in seconds, to blend into the destination state. The default is 0.15 seconds. |
| **Curve** | [[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle\|Enum.PoseEasingStyle]] | The easing used during the blend. Only [[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle\|Linear]] and [[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle\|CubicV2]] are supported. The default is [[30 Official Roblox Docs/API Reference/Enums/PoseEasingStyle\|Linear]]. |

---
*Source: [Graph Editor state machines](https://create.roblox.com/docs/animation/graph-editor-state-machine) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
