---
title: "Usage guide for assets"
description: "Explains how to use Open Cloud Web APIs for assets to support usage such as uploading and updating."
area: "30 Official Roblox Docs"
cluster: "Cloud"
source: "https://create.roblox.com/docs/cloud/guides/usage-assets"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to use Open Cloud Web APIs for assets to support usage such as uploading and updating.*

The [Assets API](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/v1.json) of Open Cloud allows you to upload and update assets with a single HTTP request rather than manually importing them to Studio. This API supports:

- Uploading new assets.
- Updating existing assets with version control.
- Updating asset metadata, including descriptions, display names, icons, and previews.
- Managing asset versions, such as rolling back to a specified previous version.
- Checking existing information of an asset, including metadata, versions, and any in-process updating operations.

> [!info]
> This API contains beta endpoints that might be subject to changes for future releases.

## Supported asset types and limits

For endpoints that don't create a new asset or update the content of existing assets, there are no restrictions and limits. However, the asset content uploading functionality powered by the **Create Asset** and **Update Asset** endpoints only supports limited types of assets with restrictions. For each call, you can only create or update one asset with the file size up to 20 MB with the following limits:

> [!info]
> Updating asset metadata using the **Update Asset** endpoint is not subject to the following limits.

| Asset type | Format | Content type | Restrictions |
| --- | --- | --- | --- |
| [[30 Official Roblox Docs/Animation/Animation in Roblox\|Animation]] | • `.rbxm`<br>• `.rbxmx` | • `model/x-rbxm`<br>• `model/x-rbxm` | • `.rbxm` or `.rbxmx` files edited outside of [[30 Official Roblox Docs/Studio/Roblox Studio setup\|Roblox Studio]] might not upload or function. |
| [[30 Official Roblox Docs/Audio/Audio assets\|Audio]] | • `.mp3`<br>• `.ogg`<br>• `.wav`<br>• `.flac` | • `audio/mpeg`<br>• `audio/ogg`<br>• `audio/wav`<br>• `audio/flac` | • Up to 7 minutes of duration.<br>• Up to 100 uploads per month if you're ID-verified.<br>• Up to 10 total uploads per month if you aren't ID-verified.<br>• Not available for updating. |
| [[30 Official Roblox Docs/Parts/Textures and decals\|Decal, Image]] | • `.png`<br>• `.jpeg`<br>• `.bmp`<br>• `.tga` | • `image/png`<br>• `image/jpeg`<br>• `image/bmp`<br>• `image/tga` | • Must be smaller than 8000x8000 pixels.<br>• Not available for updating. |
| [[30 Official Roblox Docs/Parts/Meshes\|Mesh]] |  | • `model/x-file-mesh-data` | • Only content downloaded from [Asset delivery API](https://create.roblox.com/docs/cloud/reference/domains/assetdelivery) is accepted. If you are not trying to download and re-upload meshes, then use [[30 Official Roblox Docs/Studio/Importer\|Importer]] to import meshes instead.<br>• Not available for updating. |
| [[30 Official Roblox Docs/Parts/Models\|Model]] | • `.fbx`<br>• `.gltf`<br>• `.glb`<br>• `.rbxm`<br>• `.rbxmx` | • `model/fbx`<br>• `model/gltf+json`<br>• `model/gltf-binary`<br>• `model/x-rbxm`<br>• `model/x-rbxm` | • Imports custom 3D models as a [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] container containing one or more [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] objects.<br>• `.rbxm` or `.rbxmx` files edited outside of [[30 Official Roblox Docs/Studio/Roblox Studio setup\|Roblox Studio]] might not upload or function.<br>• Will be uploaded as [packages](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/packages.md) |
| [[30 Official Roblox Docs/UI/Video frames\|Video]] | • `.mp4`<br>• `.mov` | • `video/mp4`<br>• `video/mov` | • Up to 5 minutes of duration.<br>• Up to 4096x2160 resolution.<br>• Up to 3.75 GB.<br>• Up to 20 uploads per day if you're 13+ and ID-verified.<br>• Not available for updating. |

## Security permissions

The API supports both first-party use with [[30 Official Roblox Docs/Cloud/Auth/Manage API keys|API key authorization]] and third-party use in [[30 Official Roblox Docs/Cloud/Auth/OAuth 2.0 overview|OAuth 2 applications]]. Each way requires different security permission settings.

### API keys

To use the API in your own scripts or tools, you need to [[30 Official Roblox Docs/Cloud/Auth/Manage API keys#Create API keys|create an API key]] for authorization and security.

> [!warning]
> To create an API key for managing group assets, you must have the corresponding permissions. For more information on granting group permissions, see [[30 Official Roblox Docs/Projects/Groups (teams)#Roles and permissions|Group roles and permissions]].

When creating an API key, make sure to add the following permissions:

1. Add **assets** to **Access Permissions**.
1. Add **Read** and **Write** operation permissions to your selected game, depending on the required scopes of the endpoints you plan to call.

Once you have the API key, copy it to the `x-api-key` request header. All endpoints require the `x-api-key` request header.

```bash title ="Example API Request Header"
--header 'x-api-key: ${ApiKey}' \
```

### OAuth 2.0 apps

To use the API for a third-party OAuth 2.0 application, add the `asset:read` and `asset:write` permission scopes when [[30 Official Roblox Docs/Cloud/Auth/OAuth 2.0 app registration#Add permissions|registering your app]]. Choose these scopes based on the requirements of the endpoints you plan to use.

## Create a new asset

To upload a new asset by an HTTP request:

1. Copy the API key to the `x-api-key` request header of the [Create Asset](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/v1.json) endpoint.
1. In your request:

   1. Specify the target [[30 Official Roblox Docs/Cloud/Guides/Usage guide for assets#Supported asset types and limits|asset type]].
   1. Add your asset name and description.
   1. Add the creator information.
      - If you want to create the asset **on your own behalf**, add your user ID. You can find your user ID on the URL of your Roblox profile. For example, for `https://www.roblox.com/users/1234567/profile`, your user ID is `1234567`.
      - If you want to create the asset **as a group asset**, add the group ID of your group. You can find the group ID on the URL of your group's page. For example, for `https://www.roblox.com/groups/7654321/example-group#!/`, the group ID is `7654321`.
   1. Add the file path and content type of your asset.

   ```bash title ="Example Request for Create Asset"
   curl --location 'https://apis.roblox.com/assets/v1/assets' \
   --header 'x-api-key: ${ApiKey}' \
   --form 'request="{
     \"assetType\": \"Model\",
     \"displayName\": \"Name\",
     \"description\": \"This is a description\",
     \"creationContext\": {
       \"creator\": {
         \"userId\": \"${userId}\" # Use groupId for creating a group asset
       }
     }
   }"' \
   --form 'fileContent=@"/filepath/model.fbx";type=model/fbx'

   ```

## Update an existing asset

> [!info]
> Asset updating is powered by beta endpoints that might be subject to changes for future releases.

To update an existing asset by an HTTP request:

1. Copy the API key to the `x-api-key` request header of the [Update Asset](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/v1.json) endpoint.
1. Add the asset type and asset ID in your request. To copy your asset ID:
   1. Navigate to the [Creation](https://create.roblox.com/dashboard/creations) page of the **Creator Dashboard**.
   1. Select the **Development Items** category.
   1. Select the category of your asset and find the target asset.
   1. Hover over the thumbnail of the target asset and click the **⋯** button to display a list of options, then select **Copy Asset ID** from the list.

### Asset Content

> [!warning]
> Currently, you can only update the asset content for `.fbx` files. The update creates a new version.

```bash title ="Example Request for Updating Asset Content"
curl --location --request PATCH 'https://apis.roblox.com/assets/v1/assets/{assetId}' \
--header 'x-api-key: {apiKey}' \
--form 'request={
    \"assetType\": \"{assetType}\",
    \"assetId\": \"{assetId}\",
    \"creationContext\": {
        \"creator\": {
            \"userId\": {userId}
        },
        \"expectedPrice\":{expectedPrice}
    },
}' \
--form 'fileContent=@"{file-path}"'

```

### Metadata

```bash title ="Example Request for Updating Asset Metadata"
curl --location --request PATCH 'https://apis.roblox.com/assets/v1/assets/{assetId}?updateMask=description%2CdisplayName' \
--header 'x-api-key;' \
--form 'request={
    \"assetType\": \"{assetType}\",
    \"assetId\": \"{assetId}\",
    \"displayName\": \"{new display name}\",
    \"description\": \"{new description}\"
}'

```

### Content and Metadata

```bash title ="Example Request for Updating Both Asset Content and Metadata"
curl --location --request PATCH 'https://apis.roblox.com/assets/v1/assets/{assetId}?updateMask=description%2CdisplayName' \
--header 'x-api-key: {apiKey}' \
--form 'request={
    \"assetType\": \"{assetType}\",
    \"assetId\": \"{assetId}\",
    \"displayName\": \"{new display name}\",
    \"description\": \"{new description}\",
    \"creationContext\": {
        \"creator\": {
            \"userId\": {userId}
        },
        \"expectedPrice\":{expectedPrice}
    },
}' \
--form 'fileContent=@\"{file-path}\"'

```

## Retrieve asset operation status

If your request for creating a new asset or updating an existing asset succeeds, it returns an **Operation ID** in the format of `{ "path": "operations/${operationId}" }`. You can use it to check the status and result of your upload with the following steps:

1. Copy the API key to the `x-api-key` request header of the [Get Operation](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/v1.json) method and send the request, like the following code sample:

   ```bash title ="Example Request for Get Operation"
   curl --location 'https://apis.roblox.com/assets/v1/operations/{operationId}' \
   --header 'x-api-key: {$ApiKey}'

   ```

2. If your request succeeds, it returns an `Operation` object, either including a `response` representing the uploaded asset information or a `status` explaining why the asset upload fails as the following code sample shows:

   ```json title ="Example Response for Get Operation"
   {
     "path": "operations/{operationId}",
     "done": true,
     "response": {
       "@type": "type.googleapis.com/roblox.open_cloud.assets.v1.Asset",
       "path": "assets/2205400862",
       "revisionId": "1",
       "revisionCreateTime": "2023-03-02T22:27:04.062164400Z",
       "assetId": "2205400862",
       "displayName": "Name",
       "description": "This is a description",
       "assetType": "ASSET_TYPE_DECAL",
       "creationContext": {
         "creator": {
           "userId": "11112938575"
         }
       },
       "moderationResult": {
         "moderationState": "MODERATION_STATE_APPROVED"
       }
     }
   }
   ```

3. **OPTIONAL** Check the created asset on your Roblox account.
   1. Navigate to the **Inventory** page of your [Roblox account](https://www.roblox.com/home).
   2. Select the **Category** of the asset that you want to check.
   3. Find the target asset and click its thumbnail to view the asset.

## Use uploaded assets in Studio

An asset that you upload belongs to the user or group in the `creationContext` of your request, so it's available in Studio like any other asset that creator owns:

- Insert it from the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) or the [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md).
- Models upload as [packages](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/packages.md), so check **Inventory** ⟩ **My Packages** in the Toolbox (or **Creations** ⟩ **Group Packages** if a group owns them).
- To use an asset in a property, enter `rbxassetid://` followed by the `assetId` from the operation response in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window. In a script, assign that string to a string property such as [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Asset|AudioPlayer.Asset]], or pass the `assetId` to [[30 Official Roblox Docs/API Reference/Datatypes/Content#fromAssetId|Content.fromAssetId()]] for a property of type [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]], such as [[30 Official Roblox Docs/API Reference/Classes/Decal#ColorMapContent|Decal.ColorMapContent]]. For more information, see [rbxassetid](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md).

## Add assets API to OAuth 2.0 apps

You can create [[30 Official Roblox Docs/Cloud/Auth/OAuth 2.0 overview|OAuth 2.0 applications]] supporting Assets API to allow your users to upload and update assets to Roblox.

> [!warning]
> Third-Party app support through OAuth 2.0 is a Beta feature that might be subject to changes for future releases.

To use Assets API for your application and request permissions from your users, perform the following settings:

1. When [[30 Official Roblox Docs/Cloud/Auth/OAuth 2.0 app registration#Register your app|registering your application]], under **Permissions**, select **asset:read** and **asset:write** scopes.

1. When [[30 Official Roblox Docs/Cloud/Auth/OAuth 2.0 overview|implementing the authorization flow]], include `asset:read` and `asset:write` as the scope parameters of the authorization URL that redirects users back to your application, like the following example:

   ```plain
   https://apis.roblox.com/oauth/v1/authorize?client_id=819547628404595165403873012&redirect_uri=https://my-app.com/redirect&scope=asset:read+asset:write&response_type=Code&prompts=login+consent&nonce=12345&state=6789
   ```

1. When sending the request, include the access token in the authorization header and the form data of the asset content to create or update in the request URI in. The following example shows a sample request for uploading a new asset:

   ```bash title="Example Request"
   curl --location --request POST 'https://apis.roblox.com/assets/v1/assets' \

   --header 'Authorization: Bearer <access_token>' \

   --header 'Content-Type: application/json' \

   --form 'request="{

     \"assetType\": \"Decal\",

     \"displayName\": \"DecalDemo123\",

     \"description\": \"This is a description\",

     \"creationContext\": {

       \"creator\": {

       \"userId\": \"<user_id>\"

       }
     }

   }"' \

   --form 'fileContent=@"/filepath/p1.png"'

   ```

---
*Source: [Usage guide for assets](https://create.roblox.com/docs/cloud/guides/usage-assets) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
