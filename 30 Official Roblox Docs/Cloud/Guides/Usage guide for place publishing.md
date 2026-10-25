---
title: "Usage guide for place publishing"
description: "Explains how to use Open Cloud Place Publishing API to publish places programmatically with version control."
area: "30 Official Roblox Docs"
cluster: "Cloud"
source: "https://create.roblox.com/docs/cloud/guides/usage-place-publishing"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to use Open Cloud Place Publishing API to publish places programmatically with version control.*

The [place publishing API](https://create.roblox.com/docs/reference/cloud/universes-api/v1.json) offers similar functionality to [[30 Official Roblox Docs/Production/Publishing/Create and publish games and places|publishing to Roblox]] in Studio, with extra permission control and automation in continuous release workflow. You can use this API to update existing places of a game to a new version, making it useful for automating your publishing workflow. For example, you can call this API from a GitHub action and have it automatically push a binary place file to Roblox after successful integration testing.

## Limitations

- This API only supports HTTPS requests.
- The place publishing API doesn't update certain instance types. If your game contains [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]], [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]], [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]], [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]], or [[30 Official Roblox Docs/API Reference/Classes/BaseWrap|BaseWrap]] instances, publish from Studio after modifying them.

## Places on Roblox

Games on Roblox can have multiple places, with one **starting place** as the user entry point of your game and optional other places that you can [[30 Official Roblox Docs/Projects/Teleport between places|teleport users between]]. You can use the API to publish either the starting place or other places of your game with version control.

Before you can update an existing place of a game, you need the place's **Place ID** and the game's **Universe ID**. The **Place ID** identifies the place and the **Universe ID** identifies the game. Each is unique even if your game has only one place.

## Publish a place

To publish an existing place of a game with [Place Publishing API](https://create.roblox.com/docs/reference/cloud/universes-api/v1.json):

1. [[30 Official Roblox Docs/Cloud/Auth/Manage API keys#Create API keys|Create an API key]] on the **Creator Dashboard**. Make sure you perform the following settings:

   1. Add **universe-places** to **Access Permissions**.
   1. Add **Write** operation to your selected game.

1. Get the **Universe ID** of the game in which you want to publish the place.

   1. Navigate to the [Creator Dashboard](https://create.roblox.com/dashboard/creations).
   1. Find the game with the place that you want to update.
   1. Hover over the game's thumbnail, click the **⋯** button, and select **Copy Universe ID**.

      *(image in the full Top G Vault)*

1. Get the **Place ID** of the place that you want to update.

   1. Stay on the [Creations](https://create.roblox.com/dashboard/creations) page on **Creator Dashboard** and click the thumbnail of the target game.
   1. On the left navigation menu, click the **Places** tab.
   1. Find the place that you want to update and click its thumbnail.
   1. The **Place ID** is in the redirected URL. For example, in the URL `https://create.roblox.com/dashboard/creations/experiences/0000000/places/111111/configure`, the **Place ID** is `111111`.

1. Add the API Key in the **x-api-key** header of a `POST` request to the API. The following two example requests reference a Roblox XML place file (`.rbxlx`) and a binary place file (`.rbxl`).

   ```bash title="XML Place File Request"
   $ curl --verbose --location POST 'https://apis.roblox.com/universes/v1/{universeId}/places/{placeId}/versions?versionType=Published' \
   --header 'x-api-key: <your-api-key>' \
   --header 'Content-Type: application/xml' \
   --data-binary @/home/placefiles/place1.rbxlx
   ```

   ```bash title="Binary Place File Request"
   $ curl --verbose --location POST 'https://apis.roblox.com/universes/v1/{universeId}/places/{placeId}/versions?versionType=Published' \
   --header 'x-api-key: <your-api-key>' \
   --header 'Content-Type: application/octet-stream' \
   --data-binary @/home/placefiles/place1.rbxl
   ```

   To run the commands, replace `{universeId}` and `{placeId}` with the actual **Universe ID** and **Place ID** of the game and place that you want to publish.

1. If you send your request correctly, you receive a success response body with the place version number in the following format:

   ```json title="Example Response Body"
   { "versionNumber": 7 }
   ```

1. **OPTIONAL** Verify the upload in Studio or on [Creator Dashboard](https://create.roblox.com/dashboard/creations).

---
*Source: [Usage guide for place publishing](https://create.roblox.com/docs/cloud/guides/usage-place-publishing) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
