---
title: "Avatar in-experience creation"
description: "Explains how to use AvatarCreationService to prompt users to create and purchase avatars from within your experience."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/in-experience-creation"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to use AvatarCreationService to prompt users to create and purchase avatars from within your experience.*

> [!warning]
> The following guide applies to creators who are familiar with scripting and Roblox Studio and intend to develop experiences that allow user-generated avatar items.

You can publish an experience that allows players to create, customize, and purchase avatar bodies in real time, in addition to [[30 Official Roblox Docs/Avatar/In-experience creation for makeup|in-experience makeup creation]]. When purchased, these custom items save directly to the player's Roblox inventory, allowing players to equip and wear them in other experiences.

Experience owners that implement in-experience avatar creation benefit from [[30 Official Roblox Docs/Marketplace/Marketplace fees and commissions#Commissions|Marketplace commissions]] as the **publisher** of the avatar item, while the player who creates it is the item's **creator**. If an asset created in-experience is inspected, the item provides a link to the original experience it was created.

You can test in-experience creation in Roblox's [Avatar Creator](https://www.roblox.com/games/124012682058672/Roblox-Avatar-Creator) demo.

> [!warning]
> Avatar assets created in-experience are not listed on the Marketplace, and cannot be resold or traded.

## How to implement in-experience creation

Use the following instructions and code references to create your first in-experience avatar creation project. The following instructions uses a base body [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] that players can modify and customize before publishing.

Before getting started, familiarize yourself with the following:

- Avatar models — The following implementation requires importing a base body that meets Roblox's 15 part specifications. This [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] serves as a base for additional user customization and modification.
  - The base body must meet Roblox's [[30 Official Roblox Docs/Marketplace/Marketplace policy#Avatar body guidelines|Avatar body guidelines]], including the minimum number of FACS control for facial rigging.
- [[30 Official Roblox Docs/Avatar/Avatar in-experience creation#Generate an avatar creation token|Avatar creation tokens]] — Experiences implementing avatar creation require at least one creation token. These tokens require Robux to purchase and allow you to set prices and other sale settings for purchases made in-experience.
- API classes
  - [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService|AvatarCreationService]] — Handles avatar creation prompting and validation.
  - [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] — Handles runtime creation and manipulation of textures.
  - [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] — Handles runtime manipulation of mesh geometry.
  - [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformer]] — Handles runtime manipulation of invisible outer cage geometry that allow avatar characters to equip [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessories|3D clothing]].

### Import a base body

The base body acts as the initial foundation which users can customize and edit. You can use your own [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], or import a custom asset with the [[30 Official Roblox Docs/Studio/Importer|Importer]] and setup through [[30 Official Roblox Docs/Avatar Setup/Avatar Setup|Avatar Setup]].

Base bodies must adhere to Roblox's avatar specifications, and must include components such as the 15 [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] instances that make up 6 body parts: head, torso, left arm, left leg, right arm, and right leg, as well as other [[30 Official Roblox Docs/Avatar/Character Bodies/Character bodies#Character body components|avatar components]].

> [!info]
> If you have a single-mesh body, you can try using the [[30 Official Roblox Docs/Avatar Setup/Avatar Setup|Avatar Auto Setup]] to automatically add all the necessary avatar components.

For references and samples of properly configured avatar bodies, see [[30 Official Roblox Docs/Avatar/Resources#References|Avatar references]].

### Implement editing APIs

To develop a system where users can edit the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] instances on an avatar in your experience for creation, use [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] for texture editing, [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] for mesh editing, and [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformer]] for maintaining skinning and FACS data during mesh edits.

1.  After importing your base body, use the following script to set up your [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImages]], [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMeshes]], and [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformers]].

        ```lua
        local AssetService = game:GetService("AssetService")

        local function setupBodyPart(meshPart, wrapTarget)
        	-- Create and attach a WrapDeformer to the MeshPart
        	local wrapDeformer = Instance.new("WrapDeformer")
        	wrapDeformer.Parent = meshPart

        	-- Create an editable mesh for the wrap target's cage mesh
        	local cageEditableMesh: EditableMesh =
        		AssetService:CreateEditableMeshAsync(Content.fromUri(wrapTarget.CageMeshId), {
        			FixedSize = true,
        		})

        	-- Assign the cage mesh to the WrapDeformer
        	wrapDeformer:SetCageMeshContent(Content.fromObject(cageEditableMesh))
        end

        local function setupRigidMesh(meshPart)
        	-- Create an editable mesh from the original MeshPart
        	local editableMesh = AssetService:CreateEditableMeshAsync(Content.fromUri(meshPart.MeshId), {
        		FixedSize = true,
        	})

        	-- Generate a new MeshPart from the editable mesh
        	local newMeshPart = AssetService:CreateMeshPartAsync(Content.fromObject(editableMesh))

        	-- Copy size, position, and texture from the original MeshPart
        	newMeshPart.Size = meshPart.Size
        	newMeshPart.CFrame = meshPart.CFrame
        	newMeshPart.TextureContent = meshPart.TextureContent

        	-- Apply the new MeshPart back to the original
        	meshPart:ApplyMesh(newMeshPart)
        end

        local function setupMeshTexture(meshPart, textureIdToEditableImageMap)
        	-- If EditableImage already exists for this TextureID, resuse it rather than making a new one
        	if textureIdToEditableImageMap[meshPart.TextureID] then
        		meshPart.TextureContent =
        			Content.fromObject(textureIdToEditableImageMap[meshPart.TextureID])
        		return
        	end

        	-- Create a new EditableImage and apply it as the texture content
        	local editableImage = AssetService:CreateEditableImageAsync(Content.fromUri(meshPart.TextureID))
        	textureIdToEditableImageMap[meshPart.TextureID] = editableImage
        	meshPart.TextureContent = Content.fromObject(editableImage)
        end

        local function setupModel(model)
        	-- Map for reusing EditableImage instances by texture ID
        	local textureIdToEditableImageMap = {}
        	for _, descendant in model:GetDescendants() do
        		if not descendant:IsA("MeshPart") then
        			continue
        		end

        		-- Configure MeshPart based on WrapTarget presence
        		-- If WrapTarget is present, add a WrapDeformer child with an EditableMesh
        		-- Otherwise, apply EditableMesh to the MeshPart directly
        		local wrapTarget = descendant:FindFirstChildOfClass("WrapTarget")
        		if wrapTarget then
        			setupBodyPart(descendant, wrapTarget)
        		else
        			setupRigidMesh(descendant)
        		end

        		-- Configure the EditableImage for the MeshPart
        		setupMeshTexture(descendant, textureIdToEditableImageMap)
        	end
        end
        ```

2.  Create [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] tools that allow players to recolor, draw, or add stickers to your base body. You can leverage APIs in like [[30 Official Roblox Docs/API Reference/Classes/EditableImage#DrawImage|DrawImage()]], [[30 Official Roblox Docs/API Reference/Classes/EditableImage#DrawRectangle|DrawRectangle()]], [[30 Official Roblox Docs/API Reference/Classes/EditableImage#WritePixelsBuffer|WritePixelsBuffer()]].

    - For advanced transformations, [[30 Official Roblox Docs/API Reference/Classes/EditableImage#DrawImageTransformed|DrawImageTransformed()]] allows you to specify position, rotation, and scale when drawing one EditableImage onto another. Similarly, [[30 Official Roblox Docs/API Reference/Classes/EditableImage#DrawImageProjected|DrawImageProjected()]] works much like [[30 Official Roblox Docs/API Reference/Classes/EditableImage#DrawImage|DrawImage()]] but projects the drawn image properly if the [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] instance is used with a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]].

            ```lua
            local function recolorTexture(
            	meshPart: MeshPart,
            	color: Color3
            )
            	local bodyPartTexture = AssetService:CreateEditableImageAsync(meshPart.TextureID)
            	meshPart.TextureContent = Content.fromObject(bodyPartTexture)

            	bodyPartTexture:DrawRectangle(
            		Vector2.new(0, 0),
            		bodyPartTexture.Size,
            		color,
            		0,
            		Enum.ImageCombineType.Overwrite
            	)
            end

            local function applySticker(
            	meshPart: MeshPart,
            	textureCoordinate: Vector2,
            	stickerId: TextureId
            )
            	local bodyPartTexture = AssetService:CreateEditableImageAsync(meshPart.TextureID)
            	meshPart.TextureContent = Content.fromObject(bodyPartTexture)

            	local stickerTexture = AssetService:CreateEditableImageAsync(stickerId)
            	bodyPartTexture:DrawImage(textureCoordinate, stickerTexture, Enum.ImageCombineType.BlendSourceOver)
            end

            local function applyStickerProjected(
              meshPart: MeshPart,
              targetMesh: EditableMesh,
              stickerId: TextureId,
              raycastHitPos: Vector3
            )
              local bodyPartTexture = AssetService:CreateEditableImageAsync(meshPart.TextureID)

              local relativePos = meshPart.CFrame:PointToWorldSpace(raycastHitPos)
              local direction = (workspace.CurrentCamera.CFrame.Position - relativePos).Unit

              local projectionParams: ProjectionParams = {
                  Direction = meshPart.CFrame:VectorToObjectSpace(direction),
                  Position = meshPart.CFrame:PointToObjectSpace(relativePos),
                  Size = Vector3.new(1, 1, 1),
                  Up = meshPart.CFrame:VectorToObjectSpace(Vector3.new(0, 1, 0)),
              }

              local stickerTexture = AssetService:CreateEditableImageAsync(stickerId)
              local localBrushConfig: BrushConfig = {
                  Decal = stickerTexture,
                  ColorBlendType = Enum.ImageCombineType.BlendSourceOver,
                  AlphaBlendType = Enum.ImageAlphaType.Default,
                  BlendIntensity = 1,
                  FadeAngle = 90.0
              }

              bodyPartTexture:DrawImageProjected(targetMesh, projectionParams, localBrushConfig)
            end
            ```

3.  Using [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformer]] and [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]], create tools for editing mesh deformations on your body.

    1.  [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformer]] handles the live deformations of the rendered [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] geometry while maintaining the underlying skinning and FACS data.
    2.  [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] allows you to modify the cage mesh that the [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformer]] responds to.

        1.  Use [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer#SetCageMeshContent|WrapDeformer:SetCageMeshContent()]] to apply the [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] instance that represents the relevant cage mesh to the [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformer]].
        2.  Use [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]], such as [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetPosition|SetPosition()]], to deform vertices and edit the shape of the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]].

        ```lua
        local function deformBodyPart(
        	meshPart: MeshPart,
        	controlPointCenter: Vector3,
        	controlPointRadius: number,
        	controlPointDeformation: Vector3
        )
        	local wrapTarget = meshPart:FindFirstChildWhichIsA("WrapTarget")
        	local cageMeshId = wrapTarget.CageMeshId
        	local wrapDeformer = Instance.new("WrapDeformer")
        	wrapDeformer.Parent = meshPart

        	local cageEditableMesh = AssetService:CreateEditableMeshAsync(cageMeshId)
        	local verticesWithinSphere =
        		cageEditableMesh:FindVerticesWithinSphere(controlPointCenter, controlPointRadius)
        	for _, vertexId in verticesWithinSphere do
        		local vertexPosition = cageEditableMesh:GetPosition(vertexId)
        		cageEditableMesh:SetPosition(vertexId, vertexPosition + controlPointDeformation)
        	end

        	wrapDeformer:SetCageMeshContent(Content.fromObject(cageEditableMesh))
        end
        ```

### Create creation prompt

After setting up your base body and editing APIs, create a prompt for users to create and purchase from the experience using [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateAvatarAsync|AvatarCreationService:PromptCreateAvatarAsync()]].

```lua
export type BodyPartInfo = {
	bodyPart: Enum.BodyPart,
	instance: Instance --Folder with Created MeshParts
}
export type BodyPartList = {BodyPartInfo}

local function publishAvatar(bodyPartInstances: BodyPartList, player: Player, tokenId: string)
	local humanoidDescription = Instance.new("HumanoidDescription")
	for _, bodyPartInfo in bodyPartInstances do
		local bodyPartDescription = Instance.new("BodyPartDescription")
		bodyPartDescription.Instance = bodyPartInfo.instance
		bodyPartDescription.BodyPart = bodyPartInfo.bodyPart
		bodyPartDescription.Parent = humanoidDescription
	end

	local success, result, bundleIdOrErrorMessage, outfitId = pcall(function()
		return AvatarCreationService:PromptCreateAvatarAsync(tokenId, player, humanoidDescription)
	end)
	if success then
		if result == Enum.PromptCreateAvatarResult.Success then
			print("Successfully uploaded with BundleId: ", bundleIdOrErrorMessage)
      print("Successfully uploaded with OutfitId: ", outfitId)
		else
			print("Unsuccessfully uploaded with error message:", bundleIdOrErrorMessage)
		end
	else
		print("Avatar creation unsuccessful")
	end
end
```

[[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateAvatarAsync|AvatarCreationService:PromptCreateAvatarAsync()]] takes a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] parameter to represent the avatar intended for purchase or creation. For avatar creation, the character's [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] must
include new assets to be created for each of the 6 body parts
([[30 Official Roblox Docs/API Reference/Enums/BodyPart|Head]],
[[30 Official Roblox Docs/API Reference/Enums/BodyPart|Torso]],
[[30 Official Roblox Docs/API Reference/Enums/BodyPart|RightLeg]],
[[30 Official Roblox Docs/API Reference/Enums/BodyPart|LeftLeg]],
[[30 Official Roblox Docs/API Reference/Enums/BodyPart|RightArm]],
[[30 Official Roblox Docs/API Reference/Enums/BodyPart|LeftArm]]). Optionally, it can also
include a new [[30 Official Roblox Docs/API Reference/Enums/AccessoryType|Hair]] accessory.

To support this, the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] should include 6
[[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription|BodyPartDescription]] children. Each [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription#Instance|BodyPartDescription.Instance]] property references a [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] which includes all of the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] instances that make up the body part. For example, the `LeftArm` folder contains
`LeftHand`, `LeftUpperArm`, and `LeftLowerArm` [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]].
The [[30 Official Roblox Docs/API Reference/Classes/BodyPartDescription#BodyPart|BodyPartDescription.BodyPart]] property should also be set to
the relevant [[30 Official Roblox Docs/API Reference/Enums/BodyPart|Enum.BodyPart]].

Each of the 15 [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] body parts must include:

- An [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]].
- A [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformer]] with an [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]].

The provided [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] should not include any pre-existing asset IDs to represent body parts or accessories on the intended creation. On the other hand, the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] may include the humanoid scales of [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#BodyTypeScale|BodyTypeScale]],
[[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeadScale|HeadScale]],
[[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#HeightScale|HeightScale]],
[[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#WidthScale|WidthScale]], and
[[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription#ProportionScale|ProportionScale]]. Be mindful of
the scales that a base body is imported with so that they match the scales
provided to the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].

*(image in the full Top G Vault)*

#### Include accessories

If including an accessory, such as hair, the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]]
should include a child [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription|AccessoryDescription]] where:

- The [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription#Instance|AccessoryDescription.Instance]] property references
  the [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] instance.
- The [[30 Official Roblox Docs/API Reference/Classes/AccessoryDescription#AccessoryType|AccessoryDescription.AccessoryType]] property is
  set to the relevant [[30 Official Roblox Docs/API Reference/Enums/AccessoryType|Enum.AccessoryType]].
  - In the case of including [[30 Official Roblox Docs/API Reference/Enums/AccessoryType|Enum.AccessoryType.Hair]] in your creations, the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] should include an [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]]. However, it should not include a [[30 Official Roblox Docs/API Reference/Classes/WrapDeformer|WrapDeformer]] child but should include an [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] set on the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] directly.

### Generate an avatar creation token

[[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateAvatarAsync|AvatarCreationService:PromptCreateAvatarAsync()]] takes an **Avatar Creation Token ID** parameter. This token is the key for creations from your universe, and it is what you can use to set the price of avatar creation from your experience. For instructions and additional details on generating tokens, see [[30 Official Roblox Docs/Production/Monetization/Avatar creation token|Avatar Creation Tokens]].

After purchasing and generating your token, you can inspect the token in the Creator Hub to find the ID which you can then use for the [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateAvatarAsync|AvatarCreationService:PromptCreateAvatarAsync()]] API.

*(image in the full Top G Vault)*

## Respond to players joining by attribution

Avatar bundles created in-experience include an attribution link to the original experience the avatar was created. If the avatar is inspected by another player, a prompt displays providing an option to visit the experience where the avatar was created.

*(image in the full Top G Vault)*

To handle players joining your experience using this attribution link, use [[30 Official Roblox Docs/API Reference/Classes/Player#GetJoinData|Player:GetJoinData()]] and parse the returned table for `GameJoinContext`.

`GameJoinContext` includes the following table values:

- `JoinSource` — [[30 Official Roblox Docs/API Reference/Enums/JoinSource|Enum.JoinSource]]
  - A [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] joining your experience from this attribution link will have [[30 Official Roblox Docs/API Reference/Enums/JoinSource|Enum.JoinSource.CreatedItemAttribution]] to indicate entry from a created item.
- `ItemType` — optional [[30 Official Roblox Docs/API Reference/Enums/AvatarItemType|Enum.AvatarItemType]]
- `AssetId` — optional `string`
- `OutfitId` — optional `string`
- `AssetType` — optional [[30 Official Roblox Docs/API Reference/Enums/AssetType|Enum.AssetType]]

---
*Source: [Avatar in-experience creation](https://create.roblox.com/docs/avatar/in-experience-creation) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
