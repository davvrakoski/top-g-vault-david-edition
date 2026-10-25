---
title: "AvatarCreationService"
description: "A service to support developer avatar creators."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AvatarCreationService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service to support developer avatar creators.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

`AvatarCreationService` is a service that supports developer avatar creators, providing methods that support the prompting of avatar creation from within experiences.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#AutoSetupAvatarAsync\|AutoSetupAvatarAsync()]] | string | Automatically sets up a custom [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] and/or avatar accessories. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#GenerateAvatar2DPreviewAsync\|GenerateAvatar2DPreviewAsync()]] | string | Creates a 2D avatar preview and returns a `previewId`. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#GenerateAvatarAsync\|GenerateAvatarAsync()]] | string | Generates an avatar and returns a generationId. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#GetBatchTokenDetailsAsync\|GetBatchTokenDetailsAsync()]] | Array | Gets the avatar creation token details for a list of avatar creation tokens at once. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#GetValidationRules\|GetValidationRules()]] | Dictionary | Gets data regarding rules that assets must abide by to pass UGC validation. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#LoadAvatar2DPreviewAsync\|LoadAvatar2DPreviewAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] | Load an AvatarGeneration 2D preview on the client from a previewId. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#LoadGeneratedAvatarAsync\|LoadGeneratedAvatarAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | Loads a generated avatar using an avatar generation ID. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PrepareAvatarForPreviewAsync\|PrepareAvatarForPreviewAsync()]] | () | Prepares in-experience avatar for preview. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateAvatarAssetAsync\|PromptCreateAvatarAssetAsync()]] | Tuple | Prompts a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to purchase and create an avatar asset from an [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateAvatarAsync\|PromptCreateAvatarAsync()]] | Tuple | Prompts a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to purchase and create an avatar from a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateMakeupAsync\|PromptCreateMakeupAsync()]] | Tuple | Prompts a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to create and publish a makeup look from multiple makeup assets. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptSelectAvatarGenerationImageAsync\|PromptSelectAvatarGenerationImageAsync()]] | string | Prompt the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to take a selfie and return the FileId. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#RequestAvatarGenerationSessionAsync\|RequestAvatarGenerationSessionAsync()]] | Tuple | Request an AvatarGeneration session for a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#ValidateUGCAccessoryAsync\|ValidateUGCAccessoryAsync()]] | Tuple | Studio only. Runs UGC validation for an [[30 Official Roblox Docs/API Reference/Enums/AccessoryType\|Enum.AccessoryType]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#ValidateUGCBodyPartAsync\|ValidateUGCBodyPartAsync()]] | Tuple | Studio only. Runs UGC validation for an [[30 Official Roblox Docs/API Reference/Enums/BodyPart\|Enum.BodyPart]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#ValidateUGCFullBodyAsync\|ValidateUGCFullBodyAsync()]] | Tuple | Studio only. Runs UGC validation for a whole body. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#AvatarAssetModerationCompleted\|AvatarAssetModerationCompleted]] | `assetId`, `moderationStatus` | Fires when an in-experience-created avatar asset's moderation status has been updated from pending. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#AvatarModerationCompleted\|AvatarModerationCompleted]] | `outfitId`, `moderationStatus` | **Deprecated.** Fires when an in-experience-created avatar's moderation status has been updated from pending. |
| [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#AvatarOutfitModerationCompleted\|AvatarOutfitModerationCompleted]] | `outfitId`, `moderationStatus`, `outfitType` | Fires on the client when moderation completes for an in-experience-created outfit. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### AutoSetupAvatarAsync

```lua
AvatarCreationService:AutoSetupAvatarAsync(player: Player, autoSetupParams: Dictionary, progressCallback: Function?): string
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration · **Tags:** `Yields`

Automatically sets up a custom [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] as an avatar asset. This method returns a `string` generation ID which can be passed to [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#LoadGeneratedAvatarAsync|LoadGeneratedAvatarAsync()]] to load the generated avatar and return a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] with all the generated instances and properties. The load method can be called on both the server and client, allowing the generated avatar to be loaded in both places (on the client for previewing, and on the server for saving the generated avatar to the player's inventory using [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateAvatarAsync|PromptCreateAvatarAsync()]]).

Auto-setup has specific model requirements and accepts certain configurations of models. For more information, see [[30 Official Roblox Docs/Avatar Setup/Avatar Setup specifications|Auto-setup requirements]].

**Note**: this API requires the `Enable Mesh / Image APIs` setting to be turned on under Content Settings for your experience.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] that the avatar is being set up for. |
| `autoSetupParams` | Dictionary |  | A table containing the arguments. Type: `type AutoSetupAccessory = { AccessoryType: Enum.AccessoryType, IsLayered: bool, Instance: Model, } type AutoSetupParams = { Body: Model?, Accessories: {AutoSetupAccessory}, }` |
| `progressCallback` | Function? |  | Optional callback function that will be invoked periodically with a progressInfo table with the overall progress (from 0 to 1). Type: `(progressInfo: { Progress: number }) -> ()` |

**Returns**

| Type | Description |
| --- | --- |
| string | A unique identifier for the generated avatar. |

*Code samples for this member (`AvatarCreationService-AutoSetupAvatarAsync`) are published on the source page; their code is not part of the open-source repo.*

### GenerateAvatar2DPreviewAsync

```lua
AvatarCreationService:GenerateAvatar2DPreviewAsync(avatarGeneration2dPreviewParams: Dictionary, progressCallback: Function?): string
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration · **Tags:** `Yields`

Creates a 2D avatar image preview, taking as input the FileId from [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptSelectAvatarGenerationImageAsync|PromptSelectAvatarGenerationImageAsync()]] and an optional text prompt. It returns a `previewId` which can be passed to [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#LoadAvatar2DPreviewAsync|LoadAvatar2DPreviewAsync()]] to retrieve the preview image on the client. This API can only be used on the game server.

**Note**: this API requires the `Enable Mesh / Image APIs` setting to be turned on under Content Settings for your experience.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `avatarGeneration2dPreviewParams` | Dictionary |  | A table of arguments for 2D preview generation. Type: `avatarGeneration2dPreviewParams: {SessionId: string, FileId: string, TextPrompt: string?}` |
| `progressCallback` | Function? |  | Optional callback function that will be invoked periodically with a progressInfo table with the overall progress (from 0 to 1). Type: `(progressInfo: { Progress: number }) -> ()` |

**Returns**

| Type | Description |
| --- | --- |
| string | A string previewId |

*Code samples for this member (`AvatarCreationService-GenerateAvatar2DPreviewAsync`) are published on the source page; their code is not part of the open-source repo.*

### GenerateAvatarAsync

```lua
AvatarCreationService:GenerateAvatarAsync(avatarGenerationParams: Dictionary, progressCallback: Function?): string
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration · **Tags:** `Yields`

Generate an avatar from a preview and return the generationId. The [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#LoadGeneratedAvatarAsync|LoadGeneratedAvatarAsync()]] method is then called to retrieve the generated [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] avatar. This API can only be used on the game server.

**Note**: this API requires the `Enable Mesh / Image APIs` setting to be turned on under Content Settings for your experience.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `avatarGenerationParams` | Dictionary |  | A table of arguments for generating an avatar. Type: `avatarGenerationParams: {SessionId: string, PreviewId: string}` |
| `progressCallback` | Function? |  | Optional callback function that will be invoked periodically with a progressInfo table with the overall progress (from 0 to 1). Type: `(progressInfo: { Progress: number }) -> ()` |

**Returns**

| Type | Description |
| --- | --- |
| string | A string generationId. |

*Code samples for this member (`AvatarCreationService-GenerateAvatarAsync`) are published on the source page; their code is not part of the open-source repo.*

### GetBatchTokenDetailsAsync

```lua
AvatarCreationService:GetBatchTokenDetailsAsync(tokenIds: Array): Array
```

**Thread safety:** Unsafe · **Capabilities:** Monetization · **Tags:** `Yields`

Gets the avatar creation token details for a list of avatar creation tokens at once (tokens are generated through the [[30 Official Roblox Docs/Production/Monetization/Avatar creation token|token creation]] process). Returns an array of avatar creation token details; each token detail is a dictionary with the fields indicated in the example result below:

```lua
{
	["Name"] = "string",
	["Description"] = "string",
	["UniverseId"] = 0,
	["CreatorId"] = 0,
	["CreatorType"] = Enum.CreatorType.User,
	["OnSale"] = true,
	["Price"] = 0,
	["OffSaleReasons"] = {
		"string",
	}
}
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `tokenIds` | Array |  | The list of avatar creation token IDs to get details of. |

**Returns**

| Type | Description |
| --- | --- |
| Array | Array of avatar creation token details as outlined above. |

### GetValidationRules

```lua
AvatarCreationService:GetValidationRules(): Dictionary
```

**Thread safety:** Unsafe · **Tags:** `CustomLuaState`

Gets data regarding rules that assets must abide by to pass UGC validation. Validation is an essential step before creating avatars and there are various checks that occur, including mesh triangle limits, texture sizes, body part size limits, attachment positions, and more.

The returned dictionary of validation rules takes the following form:

```
{
	["MeshRules"] = {
		["BodyPartMaxTriangles"] = {
			Enum.AssetType.DynamicHead: number,
			Enum.AssetType.LeftArm: number,
			Enum.AssetType.RightArm: number,
			Enum.AssetType.Torso: number,
			Enum.AssetType.LeftLeg: number,
			Enum.AssetType.RightLeg: number,
		},
			["AccessoryMaxTriangles"]: number,
			["MeshVertColor"]: Color3,
			["CageMeshMaxDistanceFromRenderMesh"]: number,
	},
	["TextureRules"] = {
		["MaxTextureSize"]: number,
	},
	["BodyPartRules"] = {
		[Enum.AssetType.DynamicHead] = {
			["Bounds"] = {
				["Classic"] = {
					["MinSize"]: Vector3,
					["MaxSize"]: Vector3,
			},
				["ProportionsSlender"] = {
					["MinSize"]: Vector3,
					["MaxSize"]: Vector3,
				},
				["ProportionsNormal"] = {
					["MinSize"]: Vector3,
					["MaxSize"]: Vector3,
				},
			},
			["SubParts"] = {
				["Head"] = {
					["NeckRigAttachment"] = {
						["LowerBound"]: Vector3,
						["UpperBound"]: Vector3,
					},
					["FaceFrontAttachment"] = {
						["LowerBound"]: Vector3,
						["UpperBound"]: Vector3,
					},
					["HatAttachment"] = {
						["LowerBound"]: Vector3,
						["UpperBound"]: Vector3,
					},
					["HairAttachment"] = {
						["LowerBound"]: Vector3,
						["UpperBound"]: Vector3,
					},
					["FaceCenterAttachment"] = {
						["LowerBound"]: Vector3,
						["UpperBound"]: Vector3,
					},
				},
			},
		},
		[Enum.AssetType.LeftArm] = {
			["Bounds"] = {
				["Classic"] = {
					["MinSize"]: Vector3,
					["MaxSize"]: Vector3,
				},
				["ProportionsSlender"] = {
					["MinSize"]: Vector3,
					["MaxSize"]: Vector3,
				},
				["ProportionsNormal"] = {
					["MinSize"]: Vector3,
					["MaxSize"]: Vector3,
				},
			},
			["SubParts"] = {
				["LeftHand"] = {
					["LeftWristRigAttachment"] = {
						["LowerBound"]: Vector3,
						["UpperBound"]: Vector3,
					},
					["LeftGripAttachment"] = {
						["LowerBound"]: Vector3,
						["UpperBound"]: Vector3,
					},
				},
				["LeftUpperArm"] = {
					["LeftShoulderRigAttachment"] = {
						["LowerBound"]: Vector3,
						["UpperBound"]: Vector3,
					},
					["LeftShoulderAttachment"] = {
						["LowerBound"]: Vector3,
						["UpperBound"]: Vector3,
					},
						["LeftElbowRigAttachment"] = {
						["LowerBound"]: Vector3,
						["UpperBound"]: Vector3,
					},
				},
				["LeftLowerArm"] = {
					["LeftElbowRigAttachment"] = {
						["LowerBound"]: Vector3,
						["UpperBound"]: Vector3,
					},
					["LeftWristRigAttachment"] = {
						["LowerBound"]: Vector3,
						["UpperBound"]: Vector3,
					},
				},
			},
		},
		...
	},
	["AccessoryRules"] = {
		[Enum.AssetType.HairAccessory] = {
			["Attachments"] = {
				{
					["Size"]: Vector3,
					["Offset"]: Vector3,
					["Name"]: string,
				},
			},
			["RigidAllowed"]: boolean,
		},
		...
      	},
        ["MakeupRules"] = {
		["ReferenceCageMeshId"]: number,
		["WrapTextureTransferUVBounds"] = {
			["MinBound"]: Vector2,
            		["MaxBound"]: Vector2,
          	},
          	["ExcludeUVBounds"] = {
            		[Enum.AssetType.FaceMakeup] = {
              			["LeftEye"] = {
                			["MinBound"]: Vector2,
                			["MaxBound"]: Vector2,
              			},
              			["RightEye"] = {
                			["MinBound"]: Vector2,
                			["MaxBound"]: Vector2,
              			},
              			["Lips"] = {
                			["MinBound"]: Vector2,
                			["MaxBound"]: Vector2,
              			},
            		},
          	},
          	["IncludeUVBounds"] = {
			[Enum.AssetType.LipMakeup] = {
				["MinBound"]: Vector2,
				["MaxBound"]: Vector2,
		    	},
		    	[Enum.AssetType.EyeMakeup] = {
		      		["MinBound"]: Vector2,
		      		["MaxBound"]: Vector2,
		    	},
          	}
	}
}
```

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | Dictionary of validation rules as detailed above. |

### LoadAvatar2DPreviewAsync

```lua
AvatarCreationService:LoadAvatar2DPreviewAsync(previewId: string): EditableImage
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration · **Tags:** `Yields`

Load an AvatarGeneration 2D preview as an [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] on the client for the given previewId. This API can only be used on the client.

**Note**: this API requires the `Enable Mesh / Image APIs` setting to be turned on under Content Settings for your experience.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `previewId` | string |  | Load the preview generated from [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#GenerateAvatar2DPreviewAsync\|GenerateAvatar2DPreviewAsync()]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] | An [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] containing the preview image. |

*Code samples for this member (`AvatarCreationService-LoadAvatar2DPreviewAsync`) are published on the source page; their code is not part of the open-source repo.*

### LoadGeneratedAvatarAsync

```lua
AvatarCreationService:LoadGeneratedAvatarAsync(generationId: string): HumanoidDescription
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration · **Tags:** `Yields`

Loads a generated avatar using an avatar generation ID, as returned by [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#AutoSetupAvatarAsync|AutoSetupAvatarAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#GenerateAvatarAsync|GenerateAvatarAsync()]]. The generated avatar will be returned as a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] with all the generated instances and properties. Mesh and texture assets will be provided as [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] and [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] objects, respectively, to allow continued editing of the generated avatar.

This method can be called on both the server and client, allowing the generated avatar to be loaded in both places (on the client for previewing, and on the server for saving the generated avatar to the player's inventory using [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateAvatarAsync|PromptCreateAvatarAsync()]]). Once the method has been invoked on both the client and server, the data associated with the generation ID will be erased and subsequent calls to his method with the same generation ID will fail.

**Note**: this API requires the `Enable Mesh / Image APIs` setting to be turned on under Content Settings for your experience.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `generationId` | string |  | A unique string that identifies the generated avatar, as returned by [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#AutoSetupAvatarAsync\|AutoSetupAvatarAsync()]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | The [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] of the generated avatar, which includes all the generated instances and properties. |

*Code samples for this member (`AvatarCreationService-LoadGeneratedAvatarAsync`) are published on the source page; their code is not part of the open-source repo.*

### PrepareAvatarForPreviewAsync

```lua
AvatarCreationService:PrepareAvatarForPreviewAsync(humanoidModel: Model): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance · **Tags:** `Yields`

Triggers HSR generation and attachment point updating for in-experience avatar previews. This allows for previewing of avatars created in experience with layered clothing and accessories in the same way they will appear when published through [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateAvatarAsync|PromptCreateAvatarAsync()]].

When developers use [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] and [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformer]] to modify avatars before publishing, the original HSR data may not accurately account for the new deformations. This method generates updated HSR data and corrects attachment points based on the [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformer]] modifications, ensuring consistent preview and published avatar appearance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoidModel` | [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] containing [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] children with [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer\|WrapDeformer]] instances that require HSR data updating for preview. |

**Returns**

| Type | Description |
| --- | --- |
| () | void |

### PromptCreateAvatarAssetAsync

```lua
AvatarCreationService:PromptCreateAvatarAssetAsync(tokenId: string, player: Player, assetInstance: Instance, assetType: AvatarAssetType): Tuple
```

**Thread safety:** Unsafe · **Tags:** `Yields`

Prompts a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] to purchase and create an avatar asset from an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]. The price of the creation is dictated by the price attributed to the avatar creation token. This creation token is required for the purchasing and creation of the asset and can be generated by following the [[30 Official Roblox Docs/Production/Monetization/Avatar creation token|token creation]] process.

For accessory creation, the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] is expected to include a new accessory to be created. This includes the following types: [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|Hat]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|Hair]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|FaceAccessory]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|NeckAccessory]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|ShoulderAccessory]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|FrontAccessory]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|BackAccessory]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|WaistAccessory]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|TShirtAccessory]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|ShirtAccessory]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|PantsAccessory]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|JacketAccessory]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|SweaterAccessory]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|ShortsAccessory]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|DressSkirtAccessory]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|EyebrowAccessory]], and [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|EyelashAccessory]].

To support this, the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] should be an [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] instance or contain an [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] child instance. This should include a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] child instance which makes up the accessory.

The avatar asset [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] will also need to include:

- An [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]].
- An [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]].

If creating a layered clothing accessory such as a shirt, the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] should include a [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformer]] with an [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]].

This method also supports [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|FaceMakeup]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|LipMakeup]], and [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|EyeMakeup]]. For these types, `assetInstance` must be a [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] whose [[30 Official Roblox Docs/API Reference/Classes/Decal#TextureContent|Decal.TextureContent]] references an [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]], with exactly one [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer|WrapTextureTransfer]] child. The accessory and MeshPart requirements above do not apply to these types.

Finally, the provided [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType|Enum.AvatarAssetType]] should match the creation type of the token and the type of asset for upload.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `tokenId` | string |  | The ID of a creation token. The token must be valid in that the universe the method is called from is the same universe the token was created for. Furthermore, the token creator must maintain ID verification and [Roblox Premium](https://www.roblox.com/premium/membership). To create a token for utilization in this API, follow the [[30 Official Roblox Docs/Production/Monetization/Avatar creation token\|token creation]] process. The token's creation type must match the [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|Enum.AvatarAssetType]] passed in to the method. |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] intended to be presented with the creation prompt. |
| `assetInstance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] of the avatar asset intended for creation. |
| `assetType` | [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|AvatarAssetType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|Enum.AvatarAssetType]] of the expected creation. This must match the creation type of the provided token. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple containing, in order:<br><br>- An [[30 Official Roblox Docs/API Reference/Enums/PromptCreateAssetResult\|Enum.PromptCreateAssetResult]] indicating the result of the creation prompt.<br><br>- A string result. In the case of [[30 Official Roblox Docs/API Reference/Enums/PromptCreateAssetResult\|Enum.PromptCreateAssetResult.Success]], this will indicate the asset ID. In the case of any failure enum, this will indicate the resultant error message. |

*Code samples for this member (`AvatarCreationService-PromptCreateAvatarAssetAsync`) are published on the source page; their code is not part of the open-source repo.*

### PromptCreateAvatarAsync

```lua
AvatarCreationService:PromptCreateAvatarAsync(tokenId: string, player: Player, humanoidDescription: HumanoidDescription): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** AssetCreateUpdate, Monetization · **Tags:** `Yields`

Prompts a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] to purchase and create an avatar from a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]]. The price of the creation is dictated by the price attributed to the avatar creation token. This avatar creation token is required for the purchasing and creation of the body and can be generated by following the [[30 Official Roblox Docs/Production/Monetization/Avatar creation token|token creation]] process.

For avatar creation, the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] is expected to include new assets to be created for each of the 6 body parts ([[30 Official Roblox Docs/API Reference/Enums/BodyPart|Head]], [[30 Official Roblox Docs/API Reference/Enums/BodyPart|Torso]], [[30 Official Roblox Docs/API Reference/Enums/BodyPart|RightLeg]], [[30 Official Roblox Docs/API Reference/Enums/BodyPart|LeftLeg]], [[30 Official Roblox Docs/API Reference/Enums/BodyPart|RightArm]], [[30 Official Roblox Docs/API Reference/Enums/BodyPart|LeftArm]]). Optionally, it can also include a new [[30 Official Roblox Docs/API Reference/Enums/AccessoryType|Hair]] accessory.

To support this, the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] should include 6 [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription|BodyPartDescription]] children (one for each body part). For each, the [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription#Instance|BodyPartDescription.Instance]] property references a [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] which includes all of the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] instances which make up the body part, for example a `LeftArm` folder which has `LeftHand`, `LeftUpperArm`, and `LeftLowerArm` [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]]. The [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription#BodyPart|BodyPartDescription.BodyPart]] property should also be set to the relevant [[30 Official Roblox Docs/API Reference/Enums/BodyPart|Enum.BodyPart]].

Each body part [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] will also need to include:

- An [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]].
- A [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformer]] with an [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]].

If including an accessory such as hair, the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] should include a child [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription|AccessoryDescription]] where:

- The [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription#Instance|AccessoryDescription.Instance]] property references the [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] instance.
- The [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription#AccessoryType|AccessoryDescription.AccessoryType]] property is set to the relevant [[30 Official Roblox Docs/API Reference/Enums/AccessoryType|Enum.AccessoryType]].

Finally, the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] should include the humanoid scales of [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BodyTypeScale|BodyTypeScale]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeadScale|HeadScale]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeightScale|HeightScale]], [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WidthScale|WidthScale]], and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ProportionScale|ProportionScale]]. Be mindful of the scales that a base body is imported with so that they match the scales provided to the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `tokenId` | string |  | The ID of an avatar creation token. The token must be valid in that the universe the method is called from is the same universe the token was created for. Furthermore, the token creator must maintain ID verification and [Roblox Premium](https://www.roblox.com/premium/membership). To create a token for utilization in this API, follow the [[30 Official Roblox Docs/Production/Monetization/Avatar creation token\|token creation]] process. |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] intended to be presented with the creation prompt. |
| `humanoidDescription` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | The [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] of the avatar intended for creation. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple containing, in order:<br><br>- An [[30 Official Roblox Docs/API Reference/Enums/PromptCreateAvatarResult\|Enum.PromptCreateAvatarResult]] indicating the result of the creation prompt.<br><br>- A string result. In the case of [[30 Official Roblox Docs/API Reference/Enums/PromptCreateAvatarResult\|Enum.PromptCreateAvatarResult.Success]], this will indicate the bundle ID. In the case of any failure enum, this will indicate the resultant error message.<br><br>- A secondary optional string result. In the case of [[30 Official Roblox Docs/API Reference/Enums/PromptCreateAvatarResult\|Enum.PromptCreateAvatarResult.Success]], this will indicate the outfit ID. In the case of any failure enum, this will be `nil`. |

*Code samples for this member (`AvatarCreationService-PromptCreateAvatarAsync`) are published on the source page; their code is not part of the open-source repo.*

### PromptCreateMakeupAsync

```lua
AvatarCreationService:PromptCreateMakeupAsync(player: Player, makeupAssetEntries: Array, thumbnailHeadColor: Color3? = nil): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** AssetCreateUpdate, Monetization · **Tags:** `Yields`

Prompts a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] to create and publish a makeup look from two to six makeup assets. For example, an in-experience creation tool can use this method to let a player publish lip and face makeup together as a single look. This method can only be called from the server and yields until the operation completes.

Each asset requires a creation token for its asset type and the current experience. See the [[30 Official Roblox Docs/Production/Monetization/Avatar creation token|token creation]] process. The input entries are checked before the prompt opens. Creation token and user-generated content validation run while the prompt is loading; the player can proceed with creation after validation succeeds.

For `FaceMakeup`, `LipMakeup`, and `EyeMakeup`, the asset instance must be a [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] whose [[30 Official Roblox Docs/API Reference/Classes/Decal#TextureContent|Decal.TextureContent]] references an [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]], with exactly one [[30 Official Roblox Docs/API Reference/Classes/WrapTextureTransfer|WrapTextureTransfer]] child.

The overall [[30 Official Roblox Docs/API Reference/Enums/PromptCreateOutfitResult|Enum.PromptCreateOutfitResult]] describes creation of the look:

- [[30 Official Roblox Docs/API Reference/Enums/PromptCreateOutfitResult|Success]] means all submitted assets and the makeup look were created.
- [[30 Official Roblox Docs/API Reference/Enums/PromptCreateOutfitResult|PartialSuccess]] means at least one asset was created, but another asset or the makeup look composition failed. If the look was created, the second return value is its outfit ID; if composition failed, it is an error message instead.
- [[30 Official Roblox Docs/API Reference/Enums/PromptCreateOutfitResult|CreationFailure]] means no assets were created, so no makeup look was created.

Inspect the per-asset results to determine which assets were created. Each entry contains [[30 Official Roblox Docs/API Reference/Enums/PromptCreateAssetResult|Success]] and an asset ID, or [[30 Official Roblox Docs/API Reference/Enums/PromptCreateAssetResult|UploadFailed]] without an asset ID. If a failure occurs before asset uploads, the results array may be empty.

For [[30 Official Roblox Docs/API Reference/Enums/PromptCreateOutfitResult|PermissionDenied]], [[30 Official Roblox Docs/API Reference/Enums/PromptCreateOutfitResult|Timeout]], and [[30 Official Roblox Docs/API Reference/Enums/PromptCreateOutfitResult|NoUserInput]], only the result enum is returned; variables assigned to the other return values receive `nil`.

This method can raise an error for invalid input, request throttling, or unexpected failures. Validation failures may raise an error or return [[30 Official Roblox Docs/API Reference/Enums/PromptCreateOutfitResult|UGCValidationFailed]] with an error message and an empty per-asset results array. Use `pcall()` to handle errors as well as checking the returned result enum.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who receives the creation prompt and owns the uploaded makeup look. |
| `makeupAssetEntries` | Array |  | An array containing between two and six asset-entry dictionaries. Each dictionary contains:<br><br>- `TokenId` (string) – The ID of a creation token valid for the current experience and the entry's `AvatarAssetType`. - `Instance` ([[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]) – The makeup asset instance to upload. - `AvatarAssetType` ([[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|Enum.AvatarAssetType]]) – The asset type. Supported types are [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|FaceMakeup]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|LipMakeup]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|EyeMakeup]], [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|EyebrowAccessory]], and [[30 Official Roblox Docs/API Reference/Enums/AvatarAssetType\|EyelashAccessory]]. - `SortOrder` (number) – The asset's ordering within the makeup look. |
| `thumbnailHeadColor` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]? | `nil` | Optional [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] for the head in the makeup look thumbnail. If omitted, the default gray head color is used. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple containing, in order:<br><br>- An [[30 Official Roblox Docs/API Reference/Enums/PromptCreateOutfitResult\|Enum.PromptCreateOutfitResult]] indicating the overall creation outcome.<br><br>- A string containing the outfit ID when the makeup look is created, or an error message otherwise. This value is not returned for `PermissionDenied`, `Timeout`, or `NoUserInput`.<br><br>- An array of per-asset result dictionaries in the same order as the input entries. Each dictionary contains `Result` ([[30 Official Roblox Docs/API Reference/Enums/PromptCreateAssetResult\|Enum.PromptCreateAssetResult]]) and, for successfully created assets, `AssetId` (string). This value is not returned for `PermissionDenied`, `Timeout`, or `NoUserInput`. |

### PromptSelectAvatarGenerationImageAsync

```lua
AvatarCreationService:PromptSelectAvatarGenerationImageAsync(player: Player): string
```

**Thread safety:** Unsafe · **Capabilities:** SensitiveInput · **Tags:** `Yields`

Prompt the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] to take a selfie and return the FileId of the selfie. This FileId is then passed as an argument to [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#GenerateAvatar2DPreviewAsync|GenerateAvatar2DPreviewAsync()]]. This API can only be used on the game server.

```lua
local AvatarCreationService = game:GetService("AvatarCreationService")

function promptSelectAvatarGenerationImage(player)
    local pcallSuccess, result = pcall(function()
        return AvatarCreationService:PromptSelectAvatarGenerationImageAsync(player)
    end)

    if not pcallSuccess then
        errName, errDesc = unpack(string.split(result, ": "))
        if errName == "SelfieConsentDenied" then
            warn("Player must accept consent to use feature.")
        else
            warn("Failed to prompt for image: ", errDesc)
        end
    end

    return result
end
```

On failure, the result string has the format `ErrorName: Error description`, allowing the error type to be identified programmatically.

| Error name | Error description |
| --- | --- |
| `SelfieConsentDenied` | Selfie consent not accepted |
| `QRTooManyRequests` | Failure to generate QR url due to too many requests; please wait and try again later |
| `MediaPermissionsDenied` | Permissions not granted for taking photo |
| `FeatureUnavailable` | Feature not available for player |
| `GenerationInProgress` | Generation already in progress for player |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to prompt for taking a selfie. |

**Returns**

| Type | Description |
| --- | --- |
| string | A string FileId of the selfie on success, or an error string describing the reason for failure. |

### RequestAvatarGenerationSessionAsync

```lua
AvatarCreationService:RequestAvatarGenerationSessionAsync(player: Player, callback: Function): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration · **Tags:** `Yields`

Request an AvatarGeneration session for a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]]. Information about the session is returned via the callback, including the SessionId which is passed to the [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#GenerateAvatar2DPreviewAsync|GenerateAvatar2DPreviewAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#GenerateAvatarAsync|GenerateAvatarAsync()]] methods. Additional session information includes allowed 2d preview generations, allowed 3d avatar generations, and the session time. The method returns a `Tuple` with an [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection|RBXScriptConnection]] and estimated `waitTime`. The [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection|RBXScriptConnection]] allows canceling a session request. The estimated `waitTime` is used to provide the player an estimated time in seconds until the session will be ready. This API can only be used on the game server.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to request an AvatarGeneration session for. |
| `callback` | Function |  | Callback function that is invoked with a SessionInfo table, with information about the session. Type: `(SessionInfo: { SessionId: string, Allowed2DGenerations: number, Allowed3DGenerations: number, SessionTime: number }) -> ()` |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple containing a [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] that can be used to cancel the session request and the estimated wait time in seconds. |

*Code samples for this member (`AvatarCreationService-RequestAvatarGenerationSessionAsync`) are published on the source page; their code is not part of the open-source repo.*

### ValidateUGCAccessoryAsync

```lua
AvatarCreationService:ValidateUGCAccessoryAsync(player: Player, accessory: Instance, accessoryType: AccessoryType): Tuple
```

**Thread safety:** Unsafe · **Tags:** `Yields`

Studio only. Given a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] and [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] for an [[30 Official Roblox Docs/API Reference/Enums/AccessoryType|Enum.AccessoryType]], determines if UGC validation passes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] validation is completed for. |
| `accessory` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The instance validation is run on. |
| `accessoryType` | [[30 Official Roblox Docs/API Reference/Enums/AccessoryType\|AccessoryType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/AccessoryType\|Enum.AccessoryType]] the instance is expected to be. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple containing, in order:<br><br>- A boolean indicating if validation was successful for the accessory. - An optional table of strings. This includes failure reasons if validation was unsuccessful; otherwise `nil` if validation was successful. |

### ValidateUGCBodyPartAsync

```lua
AvatarCreationService:ValidateUGCBodyPartAsync(player: Player, instance: Instance, bodyPart: BodyPart): Tuple
```

**Thread safety:** Unsafe · **Tags:** `Yields`

Studio only. Given a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] and [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] for an [[30 Official Roblox Docs/API Reference/Enums/BodyPart|Enum.BodyPart]], determines if UGC validation passes. The `instance` parameter is expected as a [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] in the following example format with relevant [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]]:

- `LeftArm` ([[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]])
  - `R15ArtistIntent` ([[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]])
    - `LeftLowerArm` ([[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]])
    - `LeftUpperArm` ([[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]])
    - `LeftHand` ([[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]])

However, if the expected `bodyPart` is [[30 Official Roblox Docs/API Reference/Enums/BodyPart|Enum.BodyPart.Head]], the function takes a singular `Head` [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] directly.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] validation is completed for. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The instance validation is run on. |
| `bodyPart` | [[30 Official Roblox Docs/API Reference/Enums/BodyPart\|BodyPart]] |  | [[30 Official Roblox Docs/API Reference/Enums/BodyPart\|Enum.BodyPart]] the instance is expected to be. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple containing, in order:<br><br>- A boolean indicating if validation was successful for the body part. - An optional table of strings. This includes failure reasons if validation was unsuccessful; otherwise `nil` if validation was successful. |

### ValidateUGCFullBodyAsync

```lua
AvatarCreationService:ValidateUGCFullBodyAsync(player: Player, humanoidDescription: HumanoidDescription): Tuple
```

**Thread safety:** Unsafe · **Tags:** `Yields`

Studio only. Given a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] and [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]], all instances in the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] will be validated.

The [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] is expected to include instances set on [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription|BodyPartDescription]] children for each of the six required [[30 Official Roblox Docs/API Reference/Enums/BodyPart|Enum.BodyPart]] values. Optionally, it can include instances set on [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription|AccessoryDescription]] children for any supported [[30 Official Roblox Docs/API Reference/Enums/AccessoryType|Enum.AccessoryType]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] validation is completed for. |
| `humanoidDescription` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] representing the body that validation is run on. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple containing, in order:<br><br>- A boolean indicating if validation was successful for the body. - An optional table of strings. This includes failure reasons if validation was unsuccessful; otherwise `nil` if validation was successful. |

## Events

### AvatarAssetModerationCompleted

```lua
AvatarCreationService.AvatarAssetModerationCompleted(assetId: int64, moderationStatus: ModerationStatus)
```

**Capabilities:** DynamicGeneration

Fires when an in-experience-created avatar asset's moderation status has been updated from pending. This event provides a streamlined way to know when an avatar asset created through [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateAvatarAssetAsync|PromptCreateAvatarAssetAsync()]] has completed the moderation process and is ready for use in-experience.

Note that this event only fires for avatar assets created within the current experience and will trigger when the [[30 Official Roblox Docs/API Reference/Enums/ModerationStatus|Enum.ModerationStatus]] changes from [[30 Official Roblox Docs/API Reference/Enums/ModerationStatus|NotReviewed]] to any other status. The event fires on the client only.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | int64 |  | The asset ID of the asset that has completed moderation. |
| `moderationStatus` | [[30 Official Roblox Docs/API Reference/Enums/ModerationStatus\|ModerationStatus]] |  | The final [[30 Official Roblox Docs/API Reference/Enums/ModerationStatus\|Enum.ModerationStatus]] result after moderation completed. |

*Code samples for this member (`AvatarCreationService-AvatarAssetModerationCompleted`) are published on the source page; their code is not part of the open-source repo.*

### AvatarModerationCompleted

> [!warning] Deprecated
> This event is deprecated. Use
> `Class.AvatarCreationService.AvatarOutfitModerationCompleted` instead; the
> replacement event supports avatar outfits and other in-experience-created
> outfit types.

```lua
AvatarCreationService.AvatarModerationCompleted(outfitId: int64, moderationStatus: ModerationStatus)
```

**Capabilities:** DynamicGeneration

Fires when an in-experience-created avatar's moderation status has been updated from pending. This event provides a streamlined way to know when an avatar created through [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateAvatarAsync|PromptCreateAvatarAsync()]] has completed the moderation process and is ready for use in-experience.

Note that this event only fires for avatars created within the current experience and will trigger when the [[30 Official Roblox Docs/API Reference/Enums/ModerationStatus|Enum.ModerationStatus]] changes from [[30 Official Roblox Docs/API Reference/Enums/ModerationStatus|NotReviewed]] to any other status. The event fires on the client only. [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService#GetOutfitDetailsAsync|GetOutfitDetailsAsync]] can be used on the server to verify the current moderation status if needed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `outfitId` | int64 |  | The outfit ID of the avatar that has completed moderation. |
| `moderationStatus` | [[30 Official Roblox Docs/API Reference/Enums/ModerationStatus\|ModerationStatus]] |  | The final [[30 Official Roblox Docs/API Reference/Enums/ModerationStatus\|Enum.ModerationStatus]] result after moderation completion. |

### AvatarOutfitModerationCompleted

```lua
AvatarCreationService.AvatarOutfitModerationCompleted(outfitId: int64, moderationStatus: ModerationStatus, outfitType: OutfitType)
```

**Capabilities:** DynamicGeneration

Fires on the client when an in-experience-created outfit's moderation status changes from [[30 Official Roblox Docs/API Reference/Enums/ModerationStatus|NotReviewed]] to another status. Use this event for any in-experience-created outfit type. Current outfit creation flows include [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateAvatarAsync|PromptCreateAvatarAsync()]]. Future in-experience outfit types will use this event as well ([[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#AvatarModerationCompleted|AvatarModerationCompleted]] is deprecated).

Use `outfitType` to determine the kind of outfit that completed moderation. This event is informational: an outfit cannot be used until its moderation status permits it.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `outfitId` | int64 |  | The outfit ID of the outfit that has completed moderation. |
| `moderationStatus` | [[30 Official Roblox Docs/API Reference/Enums/ModerationStatus\|ModerationStatus]] |  | The final [[30 Official Roblox Docs/API Reference/Enums/ModerationStatus\|Enum.ModerationStatus]] result after moderation completion. |
| `outfitType` | [[30 Official Roblox Docs/API Reference/Enums/OutfitType\|OutfitType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/OutfitType\|Enum.OutfitType]] of the moderated outfit. |

---
*Source: [AvatarCreationService](https://create.roblox.com/docs/reference/engine/classes/AvatarCreationService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
