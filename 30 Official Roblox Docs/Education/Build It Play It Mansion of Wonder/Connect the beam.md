---
title: "Connect the beam"
description: "Learn how to connect a beam effect in Roblox Studio, and to configure its properties to customize it to your game's needs. Part of the Build It Play It Mansion of Wonders series."
area: "30 Official Roblox Docs"
cluster: "Education"
source: "https://create.roblox.com/docs/education/build-it-play-it-mansion-of-wonder/connect-the-beam"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Learn how to connect a beam effect in Roblox Studio, and to configure its properties to customize it to your game's needs. Part of the Build It Play It Mansion of Wonders series.*

Now that you've made the attachments, it's time to connect them to the beam so that a texture can be shown.

1. Under **TestPlayer**, select the **TutorialBeam**. In the **Properties** window, find **Attachment0**. Click the empty box to the right of the property. Then, in the **Explorer** window, find **TestPlayer** and click on **PlayerAttachment**.

   [Video: attachment0-to-player.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-mansion-of-wonder/connect-the-beam/attachment0-to-player.mp4)

2. In the **TutorialBeam** properties, set **Attachment1** to the attachment you created in **GoalPart1**, the **GoalAttachment**.

   *(image in the full Top G Vault)*

## Adjust the beam

By default, a beam doesn't always face the camera. This may lead to situations where players are unable to see a beam from different angles. This can be fixed by turning on a property called **FaceCamera**.

*(image in the full Top G Vault)*

*FaceCamera Off*

*(image in the full Top G Vault)*

*FaceCamera On*

1. Make the beam visible at any position by going into the beam's properties and enabling **FaceCamera**.

   *(image in the full Top G Vault)*

   Once finished, you should see a white beam between the player and goal, regardless of camera angle.

   *(image in the full Top G Vault)*

## Make the tutorial arrows

The image displayed along the beam can be customized by changing its 2D texture. In addition, beams have a variety of visual options, such as texture, color, motion that can be modified.

1. To stream arrows along the beam like in the example, copy `5886559421` and paste it into the beam's **Texture** property.

   [Video: beam-texture-change.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-mansion-of-wonder/connect-the-beam/beam-texture-change.mp4)

   > [!info]
   > Custom textures can be any image that you have. Learn how to upload them in the [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md) article.

2. Right now, the arrow's texture is stretched. Set **TextureMode** to **Static** to make the arrow repeat at its original size.

   *(image in the full Top G Vault)*

   > [!warning]
   > If the arrow doesn't point the correct direction, attachments may be swapped. Make sure that Attachment0 connects to PlayerAttachment and Attachment1 to GoalAttachment. Alternatively, if you're using a custom texture, you may need to mirror the image in a photo-editing program.

3. Modify beam properties like **Color**, **LightEmission**, and **TextureSpeed** to design something that feels eye-catching and appealing. Below is just one example.

   [Video: finished-beam-example.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-mansion-of-wonder/connect-the-beam/finished-beam-example.mp4)

### Tips for color choices

**Color** is one opportunity for improving a first time user experience. For example, contrasting or saturated colors get more attention, making it easier to inform players where to look on their screen.

Additionally, as you design, consider [[30 Official Roblox Docs/Production/Publishing/Accessibility guidelines|accessibility]] for your players. Some players may struggle to see certain color combinations, making it important that colors appeal to the broadest audience.

---
*Source: [Connect the beam](https://create.roblox.com/docs/education/build-it-play-it-mansion-of-wonder/connect-the-beam) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
