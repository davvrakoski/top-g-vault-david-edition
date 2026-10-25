---
title: "Particle emitters"
description: "Particle emitters emit 2D images to simulate special effects like fire, smoke, and sparks."
area: "30 Official Roblox Docs"
cluster: "Effects"
source: "https://create.roblox.com/docs/effects/particle-emitters"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Particle emitters emit 2D images to simulate special effects like fire, smoke, and sparks.*

A [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] is an object that emits customizable 2D images (particles) into the world, useful for simulating special effects like fire, smoke, and sparks.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/particle-emitter/Showcase.mp4)

## Create particle emitters

You can parent a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] to an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] or an object of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] class. When parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], particles spawn randomly within the part's bounding box or [[30 Official Roblox Docs/Effects/Particle emitters#Shape|shape]]; when parented to an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], particles spawn from the attachment's position.

Additionally, the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#EmissionDirection|EmissionDirection]] property determines the face ([[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId]]) of emission when the emitter is parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. When you change this property, you consequently change the particle emission direction as well.

> [!info]
> When you rotate an emitter's parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], the orientation of its
> face also changes, altering the direction of particle emission. Alternatively,
> if you add an emitter to an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], you can rotate the attachment
> itself instead of using [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#EmissionDirection|EmissionDirection]].

[Video: Emission-Direction.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/particle-emitter/Emission-Direction.mp4)

To create a particle emitter on a part or attachment:

1. In the **Explorer** window, hover over the part or attachment and click the ⊕ button. A contextual menu displays.
2. From the menu, insert a **ParticleEmitter**. The particle emitter immediately emits particles within the part's area or from the attachment's position.

   *(image in the full Top G Vault)*

## Customize particles

By experimenting with the following properties, you can customize a particle's visual appearance to make unique gameplay elements like bursting volcanos, magical dust, and dust motes.

> [!info]
> The visual quality of your particles can change depending on the graphic settings on the player's device. To review your particles across quality levels, it's recommended to open [[30 Official Roblox Docs/Studio/Roblox Studio setup#Customization|Studio Settings]], search for **Editor Quality Level**, and set it to the both the lowest and highest level after you finish customizing your particles.

### Texture

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Texture|Texture]]
property renders the image that each particle displays. By default,
particle emitters have particles with a white sparkle texture, but you
can change it to any texture to achieve interesting effects.

[Video: Texture-Examples.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/particle-emitter/Texture-Examples.mp4)

*Three similar particle emitters with different [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Texture|Texture]] assets*

If you're creating an image to use as a particle texture, it's best to use `.png` format with a transparent background. If your texture is grayscale with no alpha channel, try setting the particle emitter's [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightEmission|LightEmission]] property to **1** to hide the darker regions.

> [!info]
> For steps on how to import an image for use as a particle texture,
> see [here](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md).

To insert an image into a particle emitter:

1. From Studio's **Window** menu or **Home** tab toolbar, open the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md).
2. If you want to insert an image that you have previously imported, click the **Inventory** tab. If you want to insert an image from another creator, click the **Creator Store** tab.

   *(image in the full Top G Vault)*

   *(image in the full Top G Vault)*

3. Right-click on the image you want to insert into a particle emitter and select **Copy Asset ID**.
4. In the **Explorer** window, select a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]].
5. In the **Properties** window, paste the asset ID into the **Texture** property.

### Color

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Color|Color]] property tints each particle's texture to either a specific hue, or to a gradient [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]] across its [[30 Official Roblox Docs/Effects/Particle emitters#Lifetime|lifetime]].

#### Constant Color

1. In the **Explorer** window, select the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]].
1. In the **Properties** window, select the **Color** property. You can either:

   1. Click on the color square to open the **Colors** pop-up window and select a color.
   2. Input three numbers into the RGB color value field.

   *(image in the full Top G Vault)*
   *(image in the full Top G Vault)*

   *Similar particle emitters with different colored particles*

#### Color Gradient

1. In the **Explorer** window, select the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]].
1. In the **Properties** window, click inside the **Color** property field, then click the **⋯** button.

   *(image in the full Top G Vault)*

   In the color sequence popup, each triangle on the bottom axis is a
   **keypoint** that determines the color value of the property at that point in
   the particle's lifetime.

    *(image in the full Top G Vault)*

1. Click the keypoint at the start of the color sequence, click the
   small square next to **Color**, and select a color from the popup window.

 *(image in the full Top G Vault)*

1. If you want particles to change their color near the end of their
   lifetime, click the keypoint at the end of the color sequence, click the small square next to **Color**, and select a color from the popup window.

   *(image in the full Top G Vault)*

1. For more customization, you can:

   - Add another keypoint by clicking anywhere on the graph.
   - Make a color change sooner or later within the gradient by dragging an intermediary keypoint to a new position.
   - Delete an intermediary keypoint by selecting it and clicking the **Delete** button.
   - Reset the entire sequence by clicking the **Reset** button.

### Size

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Size|Size]] property sets the size of each particle to a consistent size, or to a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]] across its [[30 Official Roblox Docs/Effects/Particle emitters#Lifetime|lifetime]].

#### Constant Size

1. In the **Explorer** window, select the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]].
1. In the **Properties** window, select the **Size** property.
1. Input the size that you want each particle to be.

#### Number Sequence

1. In the **Explorer** window, select the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]].
1. In the **Properties** window, click inside the **Size** property field, then click the **⋯** button.

   *(image in the full Top G Vault)*

   In the number sequence popup, each square at the start and end of the graph is a **keypoint** that determines the size value of the property at that
   point in the particle's lifetime. By default, the graph defaults to a straight line and a particle remains the same size throughout its lifetime.

   *(image in the full Top G Vault)*

1. Perform any of the following actions:

   - To change the size at a point, click on a keypoint and either
     drag it up or down, or enter a value in the **Value** field.
   - To insert a new keypoint, click on any point in the graph.
   - To delete a keypoint, select it and click the **Delete** button.
   - Reset the entire sequence by clicking the **Reset** button.
   - To add a random range for size, click on any keypoint and
     drag the **envelope lines** up or down. At that time, particles
     generate at a random size between the pink envelope.

     *(image in the full Top G Vault)*

     [Video: Size-Envelope.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/particle-emitter/Size-Envelope.mp4)

     *Emitter with large size envelope toward end of its lifetime*

> [!warning]
> Particle size can impact performance due to fill-rate. The more pixels particles occupy on a player's screen, the more costly it is on the GPU.

### Transparency

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Transparency|Transparency]] property sets the opacity of each particle as a consistent value, or as a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]] opacity across its [[30 Official Roblox Docs/Effects/Particle emitters#Lifetime|lifetime]]. Opacity can range from **0** (totally opaque) to **1** (fully clear). For details on how to set particles to either a specific opacity or to a number sequence, follow the process in customizing [[30 Official Roblox Docs/Effects/Particle emitters#Size|Size]] but use the emitter's **Transparency** property field instead.

> [!success]
> The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Transparency|Transparency]] property is one of the most vital properties of a particle emitter. Fading particles near the start and/or end of their lifetime avoids a popping in/out effect and provides a more realistic effect.

[Video: Transparency.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/particle-emitter/Transparency.mp4)

*Static transparency vs. fading in/out*

### Lifetime

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Lifetime|Lifetime]]
property sets the lifetime of a particle in seconds. You can set this
property either as a consistent value, or provide a **Min** and **Max**
range from which a random lifetime will be chosen for each particle.

> [!info]
> Particles have a maximum lifetime of 20 seconds. [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Lifetime|Lifetime]] values higher than this will be internally capped at 20.

### Speed

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Speed|Speed]] property determines a random range of velocities (minimum to maximum) at which new particles will emit, measured in studs per second. Each particle's velocity is chosen upon emission and it applies in the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#EmissionDirection|EmissionDirection]]. Negative values cause particles to travel in reverse.

Note that changing [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Speed|Speed]] does not affect active particles and they retain whatever speed they already have. However, [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Acceleration|Acceleration]], [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Drag|Drag]], and [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#VelocityInheritance|VelocityInheritance]] can be used to affect the speed of active particles over their lifetime.

[Video: Speed.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/particle-emitter/Speed.mp4)

### Rate

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Rate|Rate]] property sets the number of particles that emit per second. A single particle emitter can create up to 400 particles per second (100 per second on mobile). For best performance, keep the particle rate as low as possible and experiment with [[30 Official Roblox Docs/Effects/Particle emitters#Size|size]] and [[30 Official Roblox Docs/Effects/Particle emitters#Other properties|other properties]] to achieve the desired visual effect.

> [!warning]
> Particle count can impact performance due to overdraw, especially when particles are overlapping. The more layers of transparent effects on screen, the more costly it is on the GPU.

### Orientation

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Orientation|Orientation]] property determines which
orientation mode to use for an emitter's particle geometry.

| Orientation | Particle behavior |
| --- | --- |
| **FacingCamera** | Standard camera-facing billboard quad; default behavior. |
| **FacingCameraWorldUp** | Facing the camera, but rotating only on the vertical upward world **Y** axis. |
| **VelocityParallel** | Aligned parallel to their direction of movement. |
| **VelocityPerpendicular** | Aligned perpendicular to their direction movement. |

[Video: Orientation.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/particle-emitter/Orientation.mp4)

*Expected outcome of particle orientation*

### LightEmission

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightEmission|LightEmission]] property determines the blending of particle [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Texture|Texture]] colors with the colors behind them. A value of 0 uses normal blending mode while a value of 1 uses additive blending. Higher values can make particles glow even in environments with low lighting.

[Video: LightEmission.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/particle-emitter/LightEmission.mp4)

### SpreadAngle

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#SpreadAngle|SpreadAngle]] property has an **X** and a **Y** value which determine the range of angles from which a particle can emit. The range is calculated from both sides around the axes; for example, a value of `(45, 0)` emits particles in a range of 0° to 45° away from the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#EmissionDirection|EmissionDirection]] across the **X** axis.

[Video: SpreadAngle.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/particle-emitter/SpreadAngle.mp4)

### WindAffectsDrag

If you've enabled [[30 Official Roblox Docs/Environment/Global wind|global wind]] in a game, particles will follow the global wind vector as long as the emitter's [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#WindAffectsDrag|WindAffectsDrag]] property is enabled and its [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Drag|Drag]] property is greater than 0.

*(image in the full Top G Vault)*

### Shape

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Shape|Shape]] property sets the shape of the particle emitter to either a **Box**, **Sphere**, **Cylinder**, or **Disc**.

*(image in the full Top G Vault)*

*Box*

*(image in the full Top G Vault)*

*Sphere*

*(image in the full Top G Vault)*

*Cylinder*

*(image in the full Top G Vault)*

*Disc*

After you select a shape for your particle emitter, you can experiment
with the [[30 Official Roblox Docs/Effects/Particle emitters#ShapeStyle|ShapeStyle]], [[30 Official Roblox Docs/Effects/Particle emitters#ShapeInOut|ShapeInOut]], and
[[30 Official Roblox Docs/Effects/Particle emitters#ShapePartial|ShapePartial]] properties to further customize particle
emission.

> [!warning]
> If you parent a particle emitter to an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], the **Sphere** and **Cylinder** shapes will not display correctly. These shapes should only be used if the emitter is parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].

#### ShapeStyle

The
[[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#ShapeStyle|ShapeStyle]]
property sets the emission type to either:

- **Volume** — Particles emit anywhere within the shape.
- **Surface** — Particles only emit from the outside of the shape.

*(image in the full Top G Vault)*

*Cylinder + Volume*

*(image in the full Top G Vault)*

*Cylinder + Surface*

#### ShapeInOut

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#ShapeInOut|ShapeInOut]] property sets the emission as follows:

- **Inward** — Particles emit toward the shape.
- **Outward** — Particles emit away from the shape.
- **InAndOut** — Particles randomly behave as both **Inward** and **Outward**.

[Video: ShapeInOut.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/particle-emitter/ShapeInOut.mp4)

#### ShapePartial

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#ShapePartial|ShapePartial]] property is a factor you can use to further modify **Cylinder**, **Disc**, and **Sphere** shapes.

##### Cylinder

For cylinders, [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#ShapePartial|ShapePartial]] multiplies the radius of the cylinder on the side of its **EmissionDirection**.

*(image in the full Top G Vault)*

*ShapePartial = 0.5*

*(image in the full Top G Vault)*

*ShapePartial = 0*

##### Disc

For discs, [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#ShapePartial|ShapePartial]] inversely multiplies the **inner radius** of the disc.

*(image in the full Top G Vault)*

*ShapePartial = 0.5*

*(image in the full Top G Vault)*

*ShapePartial = 0.1*

##### Sphere

For spheres, [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#ShapePartial|ShapePartial]] multiplies the **hemispherical angle**.

*(image in the full Top G Vault)*

*ShapePartial = 1*

*(image in the full Top G Vault)*

*ShapePartial = 0.5*

### Squash

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Squash|Squash]] property allows for non-uniform scaling of particles, curve-controlled over their lifetime. Values greater than 0 cause particles to both shrink horizontally and grow vertically, while values less than 0 cause particles to both grow horizontally and shrink vertically. For details on how to set the squash amount to either a constant or to a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]], follow the process in customizing [[30 Official Roblox Docs/Effects/Particle emitters#Size|Size]] but use the emitter's **Squash** property field instead.

[Video: Squash.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/particle-emitter/Squash.mp4)

Squash is especially useful for rain. Stretching a particle makes its texture much less recognizable, so even the default sparkle texture can pass as a falling raindrop. For details, see [[30 Official Roblox Docs/Effects/Particle emitters#Simulate rain|Simulate rain]].

### Flipbooks

Particle flipbook textures let you animate a particle's texture over its lifetime.

[Video: Flipbook.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/particle-emitter/Flipbook.mp4)

The flipbook texture can have a frame layout of 2×2, 4×4, 8×8, or custom. For example, the following 1024×1024 image has an 8×8 layout, so it's suitable for a 64‑frame animation.

*(image in the full Top G Vault)*

> [!danger]
> When you create a flipbook texture, include spacing between each of the particle frames. In some cases, mip filtering might require even more spacing. The previous image has transparent spacing around each frame for the flipbook texture.

> [!warning]
> Features with custom textures such as flipbooks cost memory to render. If you use many flipbooks with other features that use high memory, then clients automatically deactivate flipbooks when they are low on memory, which is likely for older mobile phones. To reduce the memory usage of flipbooks, use fewer unique animated particle effects or choose a texture of smaller resolution when possible. Reusing textures costs less memory than using unique textures.

Once you've specified a valid flipbook [[30 Official Roblox Docs/Effects/Particle emitters#Texture|texture]] for the emitter's [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Texture|Texture]] property, the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookLayout|FlipbookLayout]] property determines the layout of the texture. It can be any value of the [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookLayout|Enum.ParticleFlipbookLayout]] enum:

- [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookLayout|None]] — Disable flipbook features and use the texture as a single static texture over the particle's lifetime.
- [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookLayout|Grid2x2]] — 2×2 frames for a 4-frame animation.
- [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookLayout|Grid4x4]] — 4×4 frames for a 16-frame animation.
- [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookLayout|Grid8x8]] — 8×8 frames for a 64-frame animation.
- [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookLayout|Custom]] — A custom grid size defined by [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookSizeX|FlipbookSizeX]] and [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookSizeY|FlipbookSizeY]].

To further customize the flipbook behavior, you can adjust the following properties:

#### FlipbookFramerate

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookFramerate|FlipbookFramerate]] property determines how fast the flipbook texture animates in frames per second. Like [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Lifetime|Lifetime]], you can set a minimum and maximum range to randomize the framerate of the flip book, with a maximum of 30 frames per second.

#### FlipbookMode

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookMode|FlipbookMode]] property determines the type of the flipbook animation. The property can be any value of the [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookMode|Enum.ParticleFlipbookMode]] enum:

- **Loop** — Continuously play through all frames, starting back at the first frame after playing the last.
- **OneShot** — Play through the animation only once across the particle's lifetime. With this setting, the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookFramerate|FlipbookFramerate]] property doesn't apply; instead, the framerate is determined by the particle's [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Lifetime|Lifetime]] divided evenly by the number of frames in the animation. **OneShot** animations are useful for clear non-repeating animations, such as an explosion that creates a puff of smoke and then fades out.
- **PingPong** — Play from the first to the last frame, then in reverse from the last to the first, repeating throughout the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Lifetime|Lifetime]] of the particle.
- **Random** — Play the frames in a random order, blending/crossfading from one frame to the next. This can be useful for organic particle textures at low framerates, such as stars slowly twinkling between subtly different shapes.

#### FlipbookStartRandom

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookStartRandom|FlipbookStartRandom]] property determines whether each particle begins at a random frame of the animation instead of always starting at the first frame. One use case is to enable this property and also set [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookFramerate|FlipbookFramerate]] to zero, causing each emitted particle to be a static frame chosen randomly from the flipbook texture.

### Other properties

To further customize particles, consider the following emitter properties, and click through to the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] reference page for more details.

#### Appearance

The following appearance properties are in addition to [[30 Official Roblox Docs/Effects/Particle emitters#Color|color]], [[30 Official Roblox Docs/Effects/Particle emitters#LightEmission|light emission]], [[30 Official Roblox Docs/Effects/Particle emitters#Orientation|orientation]], [[30 Official Roblox Docs/Effects/Particle emitters#Size|size]], [[30 Official Roblox Docs/Effects/Particle emitters#Texture|texture]], [[30 Official Roblox Docs/Effects/Particle emitters#Transparency|transparency]], [[30 Official Roblox Docs/Effects/Particle emitters#Squash|squash]], and [[30 Official Roblox Docs/Effects/Particle emitters#Flipbooks|flipbooks]].

| Property | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightInfluence\|LightInfluence]] | Determines how much environmental light affects the color of individual particles. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Brightness\|Brightness]] | Scales the light emitted from the emitter when [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightInfluence\|LightInfluence]] is 0. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#ZOffset\|ZOffset]] | Determines the forward-backward render position of particles, in studs, without changing their size on the screen. This allows for multiple emitters to be layered, or to render particles in front of or behind the parent object. |

#### Emission

The following emission properties are in addition to [[30 Official Roblox Docs/Effects/Particle emitters#Create particle emitters|emission direction]], [[30 Official Roblox Docs/Effects/Particle emitters#Lifetime|lifetime]], [[30 Official Roblox Docs/Effects/Particle emitters#Speed|speed]], [[30 Official Roblox Docs/Effects/Particle emitters#Rate|rate]], [[30 Official Roblox Docs/Effects/Particle emitters#SpreadAngle|spread angle]], and [[30 Official Roblox Docs/Effects/Particle emitters#Shape|shape]].

| Property | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Enabled\|Enabled]] | Determines if particles emit from the emitter. Setting this to `false` stops further particles from spawning, but any existing particles remain active until they expire or the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Clear\|Clear()]] method is called. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Rotation\|Rotation]] | Determines the angle of rotation for newly-emitted particles. Single numbers create particles at that angle, while two numbers (minimum, maximum) set a random rotation for each particle. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#RotSpeed\|RotSpeed]] | Determines the angular speed in degrees per second for particles. This can be a single number or a number range for a randomized speed. Negative values cause particles to rotate counter-clockwise. |

#### Motion

The following motion properties are in addition to [[30 Official Roblox Docs/Effects/Particle emitters#WindAffectsDrag|wind influence]].

| Property | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Acceleration\|Acceleration]] | Determines by how much the velocity of particles changes per second. You can use this property to create effects such as particles being affected by gravity. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Drag\|Drag]] | Determines the rate in seconds that particles lose half their speed. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LockedToPart\|LockedToPart]] | Determines if particles will "stick" to the emission source to which the emitter is parented. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#TimeScale\|TimeScale]] | A value between 0 and 1 that controls the speed of the particle effect. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#VelocityInheritance\|VelocityInheritance]] | Determines how much of the parent object's velocity is inherited by particles when they are emitted. |

## Simulate rain

Simulating every raindrop isn't practical, but particle emitters can create a convincing illusion of rain in a 3D world:

1. Insert a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] above the area where you want rain to fall. Anchor it, set its **Transparency** to `1`, and disable **CanCollide**.
1. Insert a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] into the part and set its [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#EmissionDirection|EmissionDirection]] to **Bottom**.
1. Set [[30 Official Roblox Docs/Effects/Particle emitters#Squash|Squash]] to a positive value, such as `3`, to stretch each particle into a streak. Higher values make particles thinner, so you might need to increase [[30 Official Roblox Docs/Effects/Particle emitters#Size|size]] as well.

   > [!success]
   > If you set [[30 Official Roblox Docs/Effects/Particle emitters#Orientation|Orientation]] to **VelocityParallel** so that streaks align with their direction of travel, use a negative squash value instead.

1. Darken [[30 Official Roblox Docs/Effects/Particle emitters#Color|Color]], increase **LightInfluence** so that the rain reacts to the lighting around it, increase [[30 Official Roblox Docs/Effects/Particle emitters#Speed|Speed]], and decrease [[30 Official Roblox Docs/Effects/Particle emitters#Lifetime|Lifetime]] so that particles disappear near the ground.
1. To angle the rain, set a small **Rotation** or enable [[30 Official Roblox Docs/Effects/Particle emitters#WindAffectsDrag|WindAffectsDrag]] so that particles follow [[30 Official Roblox Docs/Environment/Global wind|global wind]]. Drag slows the fall in addition to applying the wind, so you might need to increase the downward **Acceleration** to keep the rain falling quickly.

A single emitter can create a limited number of particles per second (see [[30 Official Roblox Docs/Effects/Particle emitters#Rate|Rate]]), so heavier rain or a larger area requires many parts with emitters. Arrange them in a grid over the desired area.

To show rain landing, place transparent parts on the ground with emitters whose **EmissionDirection** is **Top**. Splash particles aren't stretched like falling rain, so they usually need a custom [[30 Official Roblox Docs/Effects/Particle emitters#Texture|texture]] and a [[30 Official Roblox Docs/Effects/Particle emitters#Transparency|Transparency]] sequence that makes each splash appear to dissipate. Splashes only look right on surfaces where you've placed them carefully. If you can't place them by hand, low-lying mist is much more forgiving.

### Manage particle limits

Rain that covers a large area reaches particle limits quickly, and mobile devices have much lower limits than desktops. If particles flicker in the distance, reduce how many are on screen at once:

- Place the emitter parts lower in the air and shorten **Lifetime** to match.
- Decrease **Rate** to turn a downpour into a lighter shower.
- Cover a smaller area with fewer emitter parts.

### Rain examples

- For a hand-built example, see [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/The Mystery of Duvall Drive|The Mystery of Duvall Drive]]. It uses emitters for [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Develop a moving world#Make storm debris|rain, mist, splashes, and water dripping from awnings]].
- For a scripted example, see the [weather-island](https://github.com/Roblox/resources/tree/main/experiences/weather-island) project. It schedules storms, transitions [[30 Official Roblox Docs/Environment/Dynamic clouds|clouds]] and wind, spawns rain and mist emitters, and performs roof detection.

---
*Source: [Particle emitters](https://create.roblox.com/docs/effects/particle-emitters) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
