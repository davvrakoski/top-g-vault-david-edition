---
area: "06 Characters and Animation"
cluster: "Characters Customization"
tags: [deep-dive, roblox, characters, rigging, r15, r6]
cssclasses: [tg-a06]
---

# R6 vs R15 vs Custom Rigs - Choosing a Character Rig

> **Why this matters:** The rig decision locks in your animation pipeline, your avatar compatibility, your NPC cost and how much marketplace content players can bring. Changing it after launch means re-authoring every animation.
> Decide it in week one with the trade-offs below, then write it into your project rules.

---

## 1. The four real options in 2026

| Option | What it is | Joints | Player avatars | Typical use |
|---|---|---|---|---|
| **R6** | 6 parts: Head, Torso, 2 arms, 2 legs. `Motor6D` joints. | 6 parts, 5 joints + root | Avatars are converted to R6 bodies | Retro obbies, classic sword fighting, competitive games that want identical hitboxes |
| **R15 (standard)** | 15 `MeshPart` body parts with standard names | 15 required poseable joints | Full marketplace support: bodies, layered clothing, animatable heads, emotes | Default for almost every new game |
| **R15 advanced** | R15 plus optional extra joints | 15 + up to 37 optional (spine/chest, clavicles, `HeadBase`, fingers, toes) | Same as R15 | Higher-fidelity characters, hand animation, cinematic games |
| **Custom rig** | Your own skeleton (bones in a skinned mesh) with a `Humanoid` or an `AnimationController` | Anything | Not used by player avatars unless you replace the character | Monsters, animals, vehicles with moving parts, stylized NPCs, bosses |

A fifth path sits between R15 and custom: a **custom humanoid with Adaptive Animation**. You import your own humanoid-shaped rig with **Rig Type = Custom**, then use the Avatar tab's **Adaptive Animation** tools to create a `HumanoidRigDescription` (and `DigitsRigDescription` per hand), map at least the 15 standard joints and enforce a T-pose. After that, the docs state the character can play back any R15 animation. This is how you get a unique-proportion hero that still uses catalog emotes and your R15 clip library.

## 2. Decision guide

Answer these in order; the first "yes" usually decides it.

1. **Do players need to look like their own Roblox avatar?** Pick **R15**. Players expect their bodies, layered clothing and animated heads to work. Forcing R6 strips most of that (the R6-to-R15 adapter, below, softens this).
2. **Is the game a twitch-competitive fighter or classic sword game where hitbox fairness beats expression?** **R6** gives everyone the same simple silhouette and the community has deep R6 animation know-how. Many top battleground games still use R6.
3. **Is the character non-humanoid (wolf, spider, mech, dragon)?** **Custom rig + AnimationController**.
4. **Is it a humanoid NPC or hero with non-standard proportions (chibi, giant, long arms) that should still use your R15 animations?** **Custom humanoid + Adaptive Animation**.
5. **Everything else:** **R15**.

You set the player avatar type in **Game Settings > Avatar** (R6, R15, or player choice). Decide this before making animations; R6 and R15 clips are not interchangeable.

## 3. The R6-to-R15 adapter (`AvatarUnificationMode`)

`Workspace.AvatarUnificationMode`, when enabled in an R6 experience, lets R15 avatars join through an adapter: R15 characters get invisible adapter parts with R6-compatible names welded to the matching R15 parts. The docs say this preserves R6-like scale and movement while enabling R15 features such as layered clothing and animatable heads.

What that means in practice:

- Old R6 scripts that look for `Torso`, `Left Arm`, `Right Leg` keep finding parts.
- You still need to test every combat/hitbox script; the visual body is R15 while the named parts are adapters.
- It is a migration tool for existing R6 games, not a reason to start a new game on R6.

## 4. Humanoid vs AnimationController

Both can host an `Animator`. Choose by what you need, not by habit.

| Need | Humanoid | AnimationController |
|---|---|---|
| Built-in walking/jumping/climbing/swimming states | Yes | No (you move it yourself) |
| `MoveTo`, `WalkSpeed`, `Health`, name/health display | Yes | No |
| Equipping `Tool`s | Yes | No |
| Accessories, layered clothing | Yes | No |
| CPU cost per instance | Higher (state machine, physics controller) | Low |
| Works with `IKControl` | Yes | Yes |
| Plays Animation Editor clips | Yes | Yes |

Rule of thumb: **players and NPCs that walk with the engine's controller get a Humanoid; everything you move with CFrames, constraints or your own controller gets an AnimationController.** For 100-zombie hordes, AnimationController NPCs moved by a server scheduler are dramatically cheaper than 100 Humanoids. See [[NPC Crowds, Animation LOD and Server Budgets]].

If you keep Humanoids on NPCs, turn off states they never use. Each disabled state is one less thing the controller evaluates:

```lua
local function slimHumanoid(humanoid: Humanoid)
	local S = Enum.HumanoidStateType
	for _, state in { S.Climbing, S.Swimming, S.Seated, S.FallingDown, S.Ragdoll, S.GettingUp, S.Flying, S.StrafingNoPhysics } do
		humanoid:SetStateEnabled(state, false)
	end
	humanoid.BreakJointsOnDeath = false     -- you control death/ragdoll
	humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
end
```

Call it on the machine that owns the humanoid's physics (the server for server-owned NPCs). Keep `Ragdoll`/`FallingDown` enabled if your death system uses them; see [[Ragdoll Engineering and Recovery]].

The new **Character Controller Library** (CCL) documented on Creator Hub replaces the fixed Humanoid state machine with ability modules (`StartsWhen`, `RunsWhile`, `ExclusiveGroup`, inputs and replicated state). It is worth evaluating for new projects that want custom movement (wall-run, slide, dash) without fighting `HumanoidStateType`. It is new; prototype one ability before committing a whole game to it.

## 5. Motor6D vs AnimationConstraint joints

Classic rigs use `Motor6D` joints: the animator writes each joint's `Transform`, and the result is kinematic (no physical force limits). `StarterPlayer.AvatarJointUpgrade` replaces character `Motor6D`s with force- and torque-limited `AnimationConstraint` objects, which the docs describe as enabling physics-driven movement such as fully simulated limbs and powered ragdolls.

Consequences you must plan for:

- Code that does `character.LowerTorso.Root :: Motor6D` or edits `C0`/`C1` breaks. Search your codebase for `Motor6D` before enabling the upgrade.
- Ragdoll systems that disable Motor6Ds and add `BallSocketConstraint`s need a different path.
- Powered ragdoll and physical hit reactions become possible without hand-rolled constraints.

Treat it as an opt-in for games that want physical characters. For a standard action game, classic Motor6D joints are simpler and better documented.

## 6. Custom rig checklist (skinned mesh)

For a custom creature rigged in Blender (or one of the bundled Kenney characters, see [[Importing FBX Animations and Retargeting - Kenney Rig Walkthrough]]):

1. **One armature, clean names.** No spaces or duplicate bone names; animations bind by name.
2. **Root bone at the origin**, character facing -Z in Roblox terms (Blender: export so the character faces forward in Studio; verify by importing once).
3. **Apply transforms and scale** before export. Roblox's 1 stud is 28 cm per the physics units page, so a 1.8 m human is about 6.4 studs tall. Many teams model to "Roblox scale" (a 5-stud-tall R15 reference) instead of real metres; pick one and stay consistent.
4. **Weight painting limits.** Roblox skinned meshes support a limited number of bone influences per vertex; keep it to 4 or fewer to be safe. (The exact cap is not stated on the pages checked for this note; 4 is the common industry-safe value.)
5. **Import via Import 3D** with the right **Rig Type**. For non-humanoids, make sure the result has an `AnimationController` with an `Animator`; add them if the importer did not.
6. **Collision proxies.** Skinned meshes deform visually, but physics uses the part's collision geometry. Add simple invisible hitbox parts welded to bones (or to the root) for combat queries; never hit-test against a deforming mesh.
7. **Animation Editor works on bones.** Select the model; the editor exposes bones as tracks.

## 7. Hitboxes per rig type

| Rig | Recommended combat hitbox |
|---|---|
| R6 | The six parts themselves, or a single box around the torso for fairness |
| R15 | `UpperTorso`/`LowerTorso`/`Head` for body shots; a single capsule-like box per character for melee queries |
| Custom | Invisible `Part`s welded to key bones, `CanQuery = true`, `CanCollide = false`, `CanTouch = false`, in a `Hitbox` collision group |

Never rely on accessory meshes or layered clothing for hit detection; they vary per player and would make some avatars bigger targets. See [[Hitbox Detection - Spatial Queries vs Raycasts vs Shapecasts]].

## 8. Scale and proportions

R15 avatars can be scaled (height, width, head, proportions, body type). That affects:

- **Reach:** a tall avatar's sword swing reaches further if your hitbox is attached to the hand. Competitive games normalize: hitboxes are attached to the root and sized by config, not by limbs.
- **Camera:** first-person offsets need to follow head height.
- **Animations:** retargeting adapts clips to different proportions; `Workspace.Retargeting` (an `AnimatorRetargetingMode`: `Default`, `Disabled`, `Enabled`) controls whether that is on. Leave it at default unless you have a specific reason, and test with extreme avatar scales.

## Common mistakes

- Choosing R6 for a new social or roleplay game, then losing layered clothing and animated heads.
- Making R15 animations, then switching the game to R6 (all clips must be redone).
- Giving 200 NPCs full Humanoids with every state enabled.
- Hit detection on visual meshes or accessories instead of fixed hitbox parts.
- Enabling `AvatarJointUpgrade` without auditing scripts that touch `Motor6D`.
- Custom rigs with bone names that differ between the model and the animation export.
- Forgetting the `Animator` under an `AnimationController`, so nothing plays.

## Checklist

- [ ] Avatar type chosen in Game Settings and written into project rules.
- [ ] NPC types listed with Humanoid vs AnimationController decided per type.
- [ ] Unused Humanoid states disabled on NPCs.
- [ ] Hitboxes defined per rig, independent of accessories and scale.
- [ ] Custom rigs: clean bone names, applied transforms, Animator present.
- [ ] Custom humanoids that must use R15 clips set up with Adaptive Animation.
- [ ] `AvatarJointUpgrade` decision made, Motor6D-dependent code audited.
- [ ] Tested with tiny, huge and wide avatars.

---

**Related:** [[Characters Customization - Hub]] · [[Character Materials, Rigging and Layering]] · [[Character Controllers]] · [[Character Damage, Limbs and Status Model]] · [[Roblox Mesh and Avatar Geometry Specs — 2026 Snapshot]] · [[Animation - Hub]]
