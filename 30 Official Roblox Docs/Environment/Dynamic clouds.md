---
title: "Dynamic clouds"
description: "Dynamic Clouds render realistic, customizable clouds that drift slowly across the sky."
area: "30 Official Roblox Docs"
cluster: "Environment"
source: "https://create.roblox.com/docs/environment/clouds"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Dynamic Clouds render realistic, customizable clouds that drift slowly across the sky.*

Roblox's **dynamic clouds** are realistic clouds that drift slowly across the sky. You can adjust their appearance through the [[30 Official Roblox Docs/API Reference/Classes/Clouds|Clouds]] object to create unique atmospheres such as stormy skies, stunning sunsets, and alien worlds. You can also customize their direction and speed through [[30 Official Roblox Docs/Environment/Global wind|global wind]].

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/clouds/Showcase.mp4)

## Enable clouds

You can manage dynamic clouds in a game through the [[30 Official Roblox Docs/API Reference/Classes/Clouds|Clouds]] object. While you can place this object anywhere for organization or replication purposes, clouds only render if you parent the object under the [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] class.

To enable dynamic clouds:

1. In the **Explorer** window, hover over **Terrain** and click the ⊕ button. A contextual menu displays.
1. From the menu, insert **Clouds**.

   *(image in the full Top G Vault)*

1. Adjust the appearance of clouds through the new object's properties.
1. Set the clouds in motion through [[30 Official Roblox Docs/Environment/Global wind|global wind]].

## Cloud properties

From the [[30 Official Roblox Docs/API Reference/Classes/Clouds|Clouds]] object under [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]], you can adjust the appearance of clouds through the **Properties** window.

### Cover

The [[30 Official Roblox Docs/API Reference/Classes/Clouds#Cover|Cover]] property controls how much the clouds span across the overall skyscape layer from a value of 0 (sparse cloud cover) to 1 (full cloud cover).

#### 0.65

*(image in the full Top G Vault)*

#### 0.8

*(image in the full Top G Vault)*

### Density

The [[30 Official Roblox Docs/API Reference/Classes/Clouds#Density|Density]] property controls the intensity of the particles that make up each cloud, mainly affecting their transparency. For example, lower values produce light, semi-translucent clouds, and higher values produce heavy, dark clouds with a stormy appearance.

#### 0.1

*(image in the full Top G Vault)*

#### 0.3

*(image in the full Top G Vault)*

### Color

The [[30 Official Roblox Docs/API Reference/Classes/Clouds#Color|Color]] property controls the material color of cloud particles. It's important to note that several [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] and [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] properties also influence cloud color, so if you want to simulate specific atmospheres, experiment with multiple properties until you have the effect you want.

#### [255, 255, 255]

*(image in the full Top G Vault)*

#### [75, 50, 255]

*(image in the full Top G Vault)*

---
*Source: [Dynamic clouds](https://create.roblox.com/docs/environment/clouds) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
