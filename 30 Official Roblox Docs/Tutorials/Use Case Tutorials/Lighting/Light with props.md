---
title: "Light with props"
description: "The process for creating light sources out of props."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/use-case-tutorials/lighting/light-with-props"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The process for creating light sources out of props.*

While overall world lighting is globally controlled through the [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service, games can also include in-game **light sources** like lamps, torches, spotlights, TV screens, etc.

*(image in the full Top G Vault)*

## Starter project

The remainder of this tutorial uses the [Misty Harbor](https://www.roblox.com/games/6445909934/Misty-Harbor) project as a showcase. To follow along, open it in Studio before proceeding.

*(image in the full Top G Vault)*

## Point lights

A [[30 Official Roblox Docs/API Reference/Classes/PointLight|PointLight]] emits light **spherically** from a single point. This object is ideal for non-directional light sources like bulbs, torches, and fireballs.

Light sources like point lights need to be inserted directly into parts, meshes, or attachments. Here, a point light will be inserted into an existing model within the darkened city.

1. Find and select a **LightPole** model like the one shown below, near the central fountain.

   *(image in the full Top G Vault)*

2. In the **Explorer** window, expand the model's tree and select the **LightCasing** part.

   *(image in the full Top G Vault)*

3. Change its **Material** property to **Neon** — this will make the part appear to glow brightly, although it will not actually emit any light.

   *(image in the full Top G Vault)*
   *(image in the full Top G Vault)*

4. With **LightCasing** still selected, insert a new **PointLight** object.

   *(image in the full Top G Vault)*
   *(image in the full Top G Vault)*

5. With **PointLight** selected, customize its **Brightness** and **Color** values.

   *(image in the full Top G Vault)*

   *Brightness = 4*

   *(image in the full Top G Vault)*

   *Color = 255, 175, 100*

6. Further customize the light by adjusting its **Range** property. This value defines the radial distance of illumination from the light's position, measured in studs.

   *(image in the full Top G Vault)*

   *Range = 8*

   *(image in the full Top G Vault)*

   *Range = 12*

## Spot lights

A [[30 Official Roblox Docs/API Reference/Classes/SpotLight|SpotLight]] emits light in the shape of a **cone**. This object is ideal for light sources like street lamps, flashlights, and headlights.

1. Select the taller arched **StreetLight** model next to the construction across the street. Currently the light is pointed out instead of down at the street.

   *(image in the full Top G Vault)*

2. Expand the model's tree to reveal the **SpotLight** object.

   *(image in the full Top G Vault)*

3. With **SpotLight** selected, test out different values for its **Face** property to change which face/axis light is emitted from.

   *(image in the full Top G Vault)*

   *Face = Left*

   *(image in the full Top G Vault)*

   *Face = Bottom*

4. Adjust the **Angle** property to increase or decrease the spread of light emission. The maximum value is 180 which illuminates a full half sphere from the cone's apex.

   *(image in the full Top G Vault)*

   *Angle = 30*

   *(image in the full Top G Vault)*

   *Angle = 75*

5. Experiment with different **Brightness** and **Color** values, as with the point light.

## Surface lights

A [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight|SurfaceLight]] emits light from the entire surface/face of a part, rather than just from a single point. This object is useful for light sources like TV or computer screens, lighted billboards, and fluorescent panels.

1. Find and select the lighted **RobloxBillboard** sign on top of the café.

   *(image in the full Top G Vault)*

2. Expand the model's tree to reveal the SurfaceLight object.

   *(image in the full Top G Vault)*

3. With **SurfaceLight** selected, test out different **Face** values to change which face/surface light is emitted from. Notice that light is emitted from the **entire surface**, not a point upon it.

   *(image in the full Top G Vault)*

   *Face = Bottom*

   *(image in the full Top G Vault)*

   *Face = Right*

4. Adjust the **Angle** property to increase or decrease the spread of light emission from the part's surface. An angle of 0 means that light travels directly outward from the surface while an angle of 180 means light travels outward perpendicular to the surface.

   *(image in the full Top G Vault)*

   *Angle = 60*

   *(image in the full Top G Vault)*

   *Angle = 0*

By using lighting props instead of just general world lighting, you open up the possibility of creating new genres and environments like cyberpunk cities, traditional light festivals, or moody detective scenes.

---
*Source: [Light with props](https://create.roblox.com/docs/tutorials/use-case-tutorials/lighting/light-with-props) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
