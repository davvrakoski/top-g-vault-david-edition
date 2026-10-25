---
title: "EditableMesh"
description: "Object which allows for the runtime creation and manipulation of meshes."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/EditableMesh"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Object which allows for the runtime creation and manipulation of meshes.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

`EditableMesh` changes the applied visual mesh when linked to a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]], allowing for querying and modification of the mesh both in Studio and in-game.

#### Enabling for published games

For security purposes, using `EditableMesh` fails by default in published games. To enable it, open the [Creator Dashboard](https://create.roblox.com/dashboard/creations), go to the game's **Configure** ⟩ **Settings**, and toggle on **Enable Mesh / Image APIs**. Alternatively, in Studio, open **Experience Settings** and toggle on **Allow Mesh / Image APIs** under **Security**. Remember to review the [Terms of Use](https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use) before enabling the toggle.

#### Permissions

To prevent misuse, [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateEditableMeshAsync|AssetService:CreateEditableMeshAsync()]] only allows you to load and edit mesh assets if any of the following is true:

- Owned by or explicitly shared with the game owner.
- Owned by or explicitly shared with the logged in Studio user.
- Owned by or explicitly shared with the logged in player if the `EditableMesh` is on the client side.
- Owned by a group where the game owner, Studio user, or player has a role with permission to edit the group's assets. See [[30 Official Roblox Docs/Projects/Groups (teams)#Roles and permissions|Roles and permissions]] for more information.

See [Grant permissions](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/privacy.md) to learn how to share assets with users or groups.

The APIs throw an error if they are used to load an asset that does not meet the criteria above.

#### Memory limits

Editable assets are currently expensive for memory usage. To minimize its impact on client performance, `EditableMesh` has strict client-side memory budgets, although the server, Studio, and plugins operate with unlimited memory. Using [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#FixedSize|FixedSize]] may help you stay within the memory budget and, in some scenarios, linking one `EditableMesh` to multiple [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] (multi-referencing) can help with memory optimization.

#### Creation and display

An `EditableMesh` can be created from an existing [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] of a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] or a mesh ID using [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateEditableMeshAsync|AssetService:CreateEditableMeshAsync()]], or a blank `EditableMesh` can be created with [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateEditableMesh|AssetService:CreateEditableMesh()]]. It can then be displayed, modified, and its collision model updated. Not all of the steps are necessary; for example, you might want to create an `EditableMesh` just to raycast without ever displaying it.

```lua
local AssetService = game:GetService("AssetService")

-- Create empty EditableMesh
local editableMesh = AssetService:CreateEditableMesh()

-- Create EditableMesh from asset ID
local editableMeshFromAsset = nil
local success, errorMessage = pcall(function()
	editableMeshFromAsset = AssetService:CreateEditableMeshAsync(Content.fromAssetId(ASSET_ID))
end)

-- Create EditableMesh from another EditableMesh
local editableMeshFromAnother = nil
local success, errorMessage = pcall(function()
	editableMeshFromAnother = AssetService:CreateEditableMeshAsync(Content.fromObject(OTHER_EDITABLE_MESH))
end)

-- Create EditableMesh from MeshPart
local editableMeshFromMeshPart = nil
local success, errorMessage = pcall(function()
	editableMeshFromMeshPart = AssetService:CreateEditableMeshAsync(MESH_PART.MeshContent)
end)
```

An `EditableMesh` is displayed when it's linked to a new [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]], through [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateMeshPartAsync|AssetService:CreateMeshPartAsync()]]. You can create more [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] instances that reference the same `EditableMesh` [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]], or link to an existing [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] through [[30 Official Roblox Docs/API Reference/Classes/MeshPart#ApplyMesh|MeshPart:ApplyMesh()]].

```lua
local AssetService = game:GetService("AssetService")
local Workspace = game:GetService("Workspace")

-- Create EditableMesh from asset ID
local editableMeshFromAsset = nil
local success, errorMessage = pcall(function()
	editableMeshFromAsset = AssetService:CreateEditableMeshAsync(Content.fromAssetId(ASSET_ID))
end)

-- Create new MeshPart linked to the EditableMesh
local newMeshPart = nil
local success, errorMessage = pcall(function()
	newMeshPart = AssetService:CreateMeshPartAsync(Content.fromObject(editableMeshFromAsset))
end)

-- Alternatively, link the new MeshPart created above to an existing MeshPart
local existingMeshPart = Workspace:FindFirstChild("EXISTING_MESH_PART")
existingMeshPart:ApplyMesh(newMeshPart)
```

To recalculate collision and fluid geometry after editing, you can again call [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateMeshPartAsync|AssetService:CreateMeshPartAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/MeshPart#ApplyMesh|MeshPart:ApplyMesh()]] to update an existing [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]]. It's generally recommended to do this at the end of a conceptual edit, not after individual calls to methods that manipulate geometry. Visual changes to the mesh will always be immediately reflected by the engine, without the need to call [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateMeshPartAsync|AssetService:CreateMeshPartAsync()]].

#### Fixed-size meshes

When creating an `EditableMesh` from an existing mesh asset (via [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateEditableMeshAsync|AssetService:CreateEditableMeshAsync()]]), the resulting editable mesh is fixed-size by default. Fixed-size meshes are more efficient in terms of memory but you cannot change the number of vertices, faces, or attributes. Only the values of vertex attributes and positions can be edited.

```lua
local AssetService = game:GetService("AssetService")

-- Create EditableMesh without fixed-size default
local editableMeshFromAsset = nil
local success, errorMessage = pcall(function()
	editableMeshFromAsset = AssetService:CreateEditableMeshAsync(Content.fromAssetId(ASSET_ID), {FixedSize = false})
end)
```

#### Stable IDs

Many `EditableMesh` methods take **vertex**, **normal**, **UV**, **color** and **face** IDs. These are represented as integers in Luau but they require some special handling. The main difference is that IDs are stable and they remain the same even if other parts of the mesh change. For example, if an `EditableMesh` has five vertices `{1, 2, 3, 4, 5}` and you remove vertex `4`, the new vertices will be `{1, 2, 3, 5}`.

Note that the IDs are not guaranteed to be in order and there may be holes in the numbering, so when iterating through vertices or faces, you should iterate through the table returned by [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertices|GetVertices()]] or [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFaces|GetFaces()]].

For debugging purposes, it can be very helpful to get a more readable string for a stable ID with [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#IdDebugString|IdDebugString()]].

#### Split vertex attributes

A **vertex** is a corner of a face, and topologically connects faces together. Each vertex has a single **position**, while its **normal**, **UV coordinate**, and **color** (with transparency) are stored per face corner. A vertex shared by multiple faces can use the same values on every face, or different values on each.

Sometimes it's useful for all faces that touch a vertex to use the same attribute values, but sometimes you'll want different faces to use different attribute values on the same vertex. For example, on a smooth sphere, each vertex will only have a single normal. In contrast, at the corner of a cube, the vertex will have 3 different normals (one for each adjacent face). You can also have seams in the UV coordinates or sharp changes in the vertex colors.

When creating faces with [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddFace|AddFace()]] or [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddTriangle|AddTriangle()]], each corner of the new face is automatically assigned a normal, UV, and color attribute. If a vertex already belongs to an existing face, the new face **reuses** that vertex's existing attributes (producing smooth shading and continuous UVs). If the vertex is new, fresh attribute IDs are created with default values (auto-computed normal, UV of `(0, 0)`, white color). To create a seam, you should create new attributes and set them on the face. For example, this code will create a sharp cube:

```lua
local AssetService = game:GetService("AssetService")

-- Given 4 vertex IDs, adds a new normal and a quad face, making a sharp quad
local function addSharpQuad(editableMesh, vid0, vid1, vid2, vid3)
	local nid = editableMesh:AddNormal() -- This creates a normal ID which is automatically computed

	local fid = editableMesh:AddFace({vid0, vid1, vid2, vid3})
	editableMesh:SetFaceNormals(fid, {nid, nid, nid, nid})
end

-- Makes a cube with creased edges between the 6 sides
local function makeSharpCube()
	local editableMesh = AssetService:CreateEditableMesh()

	local v1 = editableMesh:AddVertex(Vector3.new(0, 0, 0))
	local v2 = editableMesh:AddVertex(Vector3.new(1, 0, 0))
	local v3 = editableMesh:AddVertex(Vector3.new(0, 1, 0))
	local v4 = editableMesh:AddVertex(Vector3.new(1, 1, 0))
	local v5 = editableMesh:AddVertex(Vector3.new(0, 0, 1))
	local v6 = editableMesh:AddVertex(Vector3.new(1, 0, 1))
	local v7 = editableMesh:AddVertex(Vector3.new(0, 1, 1))
	local v8 = editableMesh:AddVertex(Vector3.new(1, 1, 1))

	addSharpQuad(editableMesh, v5, v6, v8, v7) -- Front
	addSharpQuad(editableMesh, v1, v3, v4, v2) -- Back
	addSharpQuad(editableMesh, v1, v5, v7, v3) -- Left
	addSharpQuad(editableMesh, v2, v4, v8, v6) -- Right
	addSharpQuad(editableMesh, v1, v2, v6, v5) -- Bottom
	addSharpQuad(editableMesh, v3, v7, v8, v4) -- Top

	editableMesh:RemoveUnused()
	return editableMesh
end
```

#### Winding

Mesh faces have a front side and a back side. When drawing meshes, only the front of the faces are drawn by default, although you can change this by setting the mesh' [[30 Official Roblox Docs/API Reference/Classes/MeshPart#DoubleSided|DoubleSided]] property to `true`.

The order of the vertices around the face determines whether you are looking at the front or the back. The front of the face is visible when the vertices go counterclockwise around it.

*(image in the full Top G Vault)*

#### FACS poses

Animatable heads use the Facial Action Coding System (FACS). See the [[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference|FACS poses reference]] for helpful information when using [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFacsPoses|GetFacsPoses()]] and similar methods.

Each FACS pose is specified by an [[30 Official Roblox Docs/API Reference/Enums/FacsActionUnit|Enum.FacsActionUnit]] value. For the FACS pose, virtual bones can each have a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] that transforms the bones' initial [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] in the bind pose of the mesh into the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] for that FACS action unit's pose. All bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrames]] are in the mesh's local space.

These FACS poses are blended together during animation. Sometimes, the blending of the base poses produces poor results. In those cases, you can override the blending of specific combinations of base poses with a [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads#Combination poses|corrective pose]] that is more pleasing. A corrective pose is specified by 2 or 3 [[30 Official Roblox Docs/API Reference/Enums/FacsActionUnit|Enum.FacsActionUnit]] values. Like a base FACS pose, for a corrective pose, virtual bones can each have a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] that transforms the bones' initial [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] in the bind pose of the mesh into the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] for that FACS corrective.

Please note that corrective poses that operate on both left and right action units are not currently expressible. For example, using `LeftCheekPuff` and `RightEyeClosed` together in a corrective pose is not currently possible.

#### Batching

The **batch** methods let you create, read, update, and remove many mesh elements in a single call instead of invoking the singular methods ([[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddVertex|AddVertex()]], [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetPosition|SetPosition()]], [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetColor|GetColor()]], and so on) once per element. Batching your mesh operations is typically much more performant than handling them one by one.

Rather than one method per attribute, each batch method shares a small set of general entry points and uses an [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute|Enum.MeshAttribute]] value (or the type already encoded in each mesh ID) to determine which attribute you mean. For example, [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#BatchSetValues|BatchSetValues()]] sets positions when called with vertex IDs, but sets normals when called with normal IDs. You cannot mix-and-match ID types within a single call.

Batch setters take parallel arrays: element `i` of every argument array describes the same logical operation. In [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#BatchSetValues|BatchSetValues(ids, values)]], `values[i]` is written to `ids[i]`. All argument arrays must be the same length or the call errors. Batch getters take an array of IDs and return results in the same order.

If a mesh ID is invalid, batching still applies updates to all elements before the invalid ID, then stops.

#### Limitations

`EditableMesh` currently has a limit of 60,000 vertices and 20,000 triangles. Faces can be triangles or quads, and each quad counts as 2 triangles toward the triangle limit. Attempting to add too many vertices or triangles will cause an error.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#FixedSize\|FixedSize]] | boolean | Returns `true` if a mesh is fixed-size. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddBone\|AddBone()]] | int64 | Adds a new bone and returns a bone ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddColor\|AddColor()]] | int64 | Adds a new color to the geometry and returns a color ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddFace\|AddFace()]] | int64 | Adds a new triangle or quad face to the mesh and returns a face ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddNormal\|AddNormal()]] | int64 | Adds a new normal to the geometry and returns a normal ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddTriangle\|AddTriangle()]] | int64 | Adds a new triangle to the mesh and returns a face ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddUV\|AddUV()]] | int64 | Adds a new UV to the geometry and returns a UV ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddVertex\|AddVertex()]] | int64 | Adds a new vertex to the geometry and returns a vertex ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#BatchAdd\|BatchAdd()]] | Array | Creates new mesh elements of the given attribute type and returns their IDs. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#BatchGetFaceAttributes\|BatchGetFaceAttributes()]] | Array | Returns the per-corner attribute IDs for each face in a batch. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#BatchGetValues\|BatchGetValues()]] | Tuple | Returns attribute values for each ID in a batch. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#BatchGetVertexAttributes\|BatchGetVertexAttributes()]] | Array | Returns the attribute IDs associated with each vertex in a batch. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#BatchGetVertexFaceAttributes\|BatchGetVertexFaceAttributes()]] | Array | Returns the attribute ID at each specified corner for a batch of vertex–face pairs. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#BatchRemove\|BatchRemove()]] | () | Removes a batch of faces. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#BatchSetFaceAttributes\|BatchSetFaceAttributes()]] | () | Sets the per-corner attribute IDs for each face in a batch. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#BatchSetValues\|BatchSetValues()]] | () | Writes attribute values to a batch of mesh element IDs. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#BatchSetVertexFaceAttributes\|BatchSetVertexFaceAttributes()]] | () | Sets the attribute at a specific corner for each vertex–face pair in a batch. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#Clear\|Clear()]] | () | Clears all of an EditableMesh's geometry. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#Destroy\|Destroy()]] | () | Destroys the mesh. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#FindClosestPointOnSurface\|FindClosestPointOnSurface()]] | Tuple | Finds the closest point on the mesh's surface. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#FindClosestVertex\|FindClosestVertex()]] | int64 | Finds the closest vertex to a specific point in space. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#FindVerticesWithinSphere\|FindVerticesWithinSphere()]] | Array | Finds all vertices within a specific sphere. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetAdjacentFaces\|GetAdjacentFaces()]] | Array | Returns a list of faces adjacent to a given face. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetAdjacentVertices\|GetAdjacentVertices()]] | Array | Returns a list of vertices adjacent to a given vertex. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetBoneByName\|GetBoneByName()]] | int64 | Finds the bone ID of the bone with the given name. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetBoneCFrame\|GetBoneCFrame()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Returns the initial [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the bone in the bind pose of the mesh. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetBoneIsVirtual\|GetBoneIsVirtual()]] | boolean | Returns `true` if the bone is virtual. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetBoneName\|GetBoneName()]] | string | Returns the bone name. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetBoneParent\|GetBoneParent()]] | int64 | Returns the parent bone ID, if any. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetBones\|GetBones()]] | Array | Returns all bones of the mesh. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetCenter\|GetCenter()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the center of the mesh's axis-aligned bounding box. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetColor\|GetColor()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]? | Returns the color for the given color ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetColorAlpha\|GetColorAlpha()]] | float? | Returns the color alpha (transparency) at the given color ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetColors\|GetColors()]] | Array | Returns all colors of the mesh. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFaceColors\|GetFaceColors()]] | Array | Returns the face's color IDs for the vertices on the face. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFaceNormals\|GetFaceNormals()]] | Array | Returns the face's normal IDs for the vertices on the face. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFaces\|GetFaces()]] | Array | Returns all faces of the mesh. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFacesWithAttribute\|GetFacesWithAttribute()]] | Array | **Deprecated.** Returns a list of faces that use a given attribute ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFacesWithColor\|GetFacesWithColor()]] | Array | Returns an array of face IDs that use the given color ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFacesWithNormal\|GetFacesWithNormal()]] | Array | Returns an array of face IDs that use the given normal ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFacesWithUV\|GetFacesWithUV()]] | Array | Returns an array of face IDs that use the given UV ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFaceUVs\|GetFaceUVs()]] | Array | Returns the face's UV IDs for the vertices on the face. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFaceVertices\|GetFaceVertices()]] | Array | Returns the face's vertex IDs. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFacsCorrectivePose\|GetFacsCorrectivePose()]] | Tuple | Returns bone IDs and bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrames]] for all bones in a specific FACS corrective pose. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFacsCorrectivePoses\|GetFacsCorrectivePoses()]] | Array | Returns all FACS corrective poses that are in use. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFacsPose\|GetFacsPose()]] | Tuple | Returns bone IDs and bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrames]] for all bones in a specific FACS action unit. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFacsPoses\|GetFacsPoses()]] | Array | Returns all FACS action units that have poses defined. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetNormal\|GetNormal()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]? | Returns the normal vector for the given normal ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetNormals\|GetNormals()]] | Array | Returns all normals of the mesh. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetPosition\|GetPosition()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Gets the position of a vertex. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetSize\|GetSize()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the size of the mesh's axis-aligned bounding box. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetUV\|GetUV()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]]? | Returns UV coordinates at the given UV ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetUVs\|GetUVs()]] | Array | Returns all UVs of the mesh. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertexBones\|GetVertexBones()]] | Array | Returns all bone IDs that are associated with the vertex for skinning. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertexBoneWeights\|GetVertexBoneWeights()]] | Array | Returns skinning blend weights for each bone that is associated with the vertex. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertexColors\|GetVertexColors()]] | Array | Returns the color IDs of the faces attached to the given vertex. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertexFaceColor\|GetVertexFaceColor()]] | int64 | Returns the color ID of a vertex/face pair. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertexFaceNormal\|GetVertexFaceNormal()]] | int64 | Returns the normal ID of a vertex/face pair. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertexFaces\|GetVertexFaces()]] | Array | Returns the face IDs of the faces attached to the given vertex. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertexFaceUV\|GetVertexFaceUV()]] | int64 | Returns the UV ID of a vertex/face pair. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertexNormals\|GetVertexNormals()]] | Array | Returns the normal IDs of the faces attached to the given vertex. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertexUVs\|GetVertexUVs()]] | Array | Returns the UV IDs of the faces attached to the given vertex. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertices\|GetVertices()]] | Array | Returns all vertices as a list of vertex IDs. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVerticesWithAttribute\|GetVerticesWithAttribute()]] | Array | **Deprecated.** Returns a list of vertices that use a given attribute ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVerticesWithColor\|GetVerticesWithColor()]] | Array | Returns an array of vertex IDs that use the given color ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVerticesWithNormal\|GetVerticesWithNormal()]] | Array | Returns an array of vertex IDs that use the given normal ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVerticesWithUV\|GetVerticesWithUV()]] | Array | Returns an array of vertex IDs that use the given UV ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#IdDebugString\|IdDebugString()]] | string | Returns a string describing an ID, useful for debugging purposes. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#MergeVertices\|MergeVertices()]] | Map | Merges vertices that touch together. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#RaycastLocal\|RaycastLocal()]] | Tuple | Casts a ray and returns the intersection point, face ID, and barycentric coordinates. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#RemoveBone\|RemoveBone()]] | () | Removes a bone using its bone ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#RemoveFace\|RemoveFace()]] | () | Removes a face using its face ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#RemoveUnused\|RemoveUnused()]] | Array | Removes all unused vertices, normals, UVs, and colors, and returns the removed IDs. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#ResetNormal\|ResetNormal()]] | () | Reset this normal ID to be automatically calculated. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetBoneCFrame\|SetBoneCFrame()]] | () | Set the initial [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] for a bone in the mesh's bind pose. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetBoneIsVirtual\|SetBoneIsVirtual()]] | () | Set whether a bone is virtual. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetBoneName\|SetBoneName()]] | () | Sets the name for a bone. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetBoneParent\|SetBoneParent()]] | () | Set a parent for a bone. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetColor\|SetColor()]] | () | Sets the color for a color ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetColorAlpha\|SetColorAlpha()]] | () | Sets the color alpha (transparency) for a color ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetFaceColors\|SetFaceColors()]] | () | Sets the face's vertex colors to new color IDs. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetFaceNormals\|SetFaceNormals()]] | () | Sets the face's vertex normals to new normal IDs. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetFaceUVs\|SetFaceUVs()]] | () | Sets the face's vertex UVs to new UV IDs. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetFaceVertices\|SetFaceVertices()]] | () | Sets the face's vertices to new vertex IDs. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetFacsBonePose\|SetFacsBonePose()]] | () | Set [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] for an individual bone in a specific FACS action unit. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetFacsCorrectivePose\|SetFacsCorrectivePose()]] | () | Set pose for all bones in a specific FACS corrective pose. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetFacsPose\|SetFacsPose()]] | () | Set pose for all bones in a specific FACS action unit. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetNormal\|SetNormal()]] | () | Set the normal for a normal ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetPosition\|SetPosition()]] | () | Sets a vertex position in the mesh's local object space. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetUV\|SetUV()]] | () | Sets UV coordinates for a UV ID. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetVertexBones\|SetVertexBones()]] | () | Assign a list of bones with the vertex for skinning. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetVertexBoneWeights\|SetVertexBoneWeights()]] | () | Sets skinning blend weights for each bone associated with the vertex. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetVertexFaceColor\|SetVertexFaceColor()]] | () | Sets the color ID of a vertex/face pair. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetVertexFaceNormal\|SetVertexFaceNormal()]] | () | Sets the normal ID of a vertex/face pair. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetVertexFaceUV\|SetVertexFaceUV()]] | () | Sets the UV ID of a vertex/face pair. |
| [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#Triangulate\|Triangulate()]] | () | Splits all faces on the mesh to be triangles. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### FixedSize

**Type:** boolean

**Security:** read None / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** DynamicGeneration · **Tags:** `ReadOnly`, `NotReplicated`

Fixed-sized meshes allow changing the values of vertex attributes but do not allow vertices and faces to be added or deleted.

## Methods

### AddBone

```lua
EditableMesh:AddBone(boneProperties: Dictionary): int64
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Adds a new bone to the mesh and returns a bone ID that persists across topology changes. An error is thrown if the bone name is already in use, the parent ID is invalid, or the mesh already contains the maximum number of bones.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `boneProperties` | Dictionary |  | Options table containing bone parameters:<br><br>- `Name` — A string that specifies the bone name. Note that all bone names in a mesh must be unique, and the maximum length is 100 characters. - `ParentId` — Optional bone ID of the new bone's parent. - `CFrame` — Initial [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the bone in the bind pose of the mesh, in the mesh's local space. - `Virtual` — Boolean that specifies whether this bone is virtual. Virtual bones can only be bound to a [[30 Official Roblox Docs/API Reference/Classes/FaceControls\|FaceControls]] instance. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | Bone ID of the new bone. |

### AddColor

```lua
EditableMesh:AddColor(color: Color3, alpha: float): int64
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Adds a new vertex color attribute to the mesh and returns a color ID.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `color` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |  | The new color. |
| `alpha` | float |  | The color alpha (transparency). `0` is fully transparent, and `1` is fully opaque. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | Color ID of the new color. |

### AddFace

```lua
EditableMesh:AddFace(vertexIds: Tuple): int64
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Adds a new face from an array of vertex IDs and returns a stable face ID. A face is either a **triangle** (3 vertex IDs) or a **quad** (4 vertex IDs); any other count throws an error. For adding triangles specifically, it is preferable to use [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddTriangle|AddTriangle()]], which is equivalent but slightly more performant as it avoids constructing an array for the vertices.

For rendering and collision, each quad is internally split into 2 triangles, so a quad counts as 2 triangles toward the mesh's triangle limit.

#### Automatic attribute assignment

`AddFace()` only takes vertex IDs as arguments. For each vertex of the new face, it automatically assigns normal, UV, and color attributes using the following logic:

- If the vertex **already belongs to another face**, the new face corner **reuses** the same normal, UV, and color IDs from the existing face. This produces smooth shading and continuous UVs across adjacent faces by default.
- If the vertex **does not yet belong to any face**, new normal, UV, and color IDs are created with default values (auto-computed normal, UV coordinate of `(0, 0)`, and white color).

*(image in the full Top G Vault)*

#### Overriding attributes after adding a face

The auto-assigned attributes can be customized after adding a face. The approach depends on whether you want to change attribute **values** while keeping the topology intact, or create entirely new attribute IDs to add or remove **seams** between faces.

**To change values in-place**, retrieve the auto-created IDs with methods like [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertexFaceUV|GetVertexFaceUV()]] and set their values directly. This is more performant and avoids leaving unused IDs in the mesh:

```lua
-- Create a triangle
local faceId = editableMesh:AddFace({v0, v1, v2})

-- Get the UV IDs that were automatically created
local uvId0 = editableMesh:GetVertexFaceUV(v0, faceId)
local uvId1 = editableMesh:GetVertexFaceUV(v1, faceId)
local uvId2 = editableMesh:GetVertexFaceUV(v2, faceId)

-- Set UV values on those existing UV IDs
editableMesh:SetUV(uvId0, Vector2.new(0, 0))
editableMesh:SetUV(uvId1, Vector2.new(1, 0))
editableMesh:SetUV(uvId2, Vector2.new(0, 1))
```

**To create a seam** — where the same vertex needs different attribute values on different faces (for example, a UV seam or a sharp edge) — create new attribute IDs with [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddUV|AddUV()]], [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddNormal|AddNormal()]], or [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddColor|AddColor()]], then assign them to the face with [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetFaceUVs|SetFaceUVs()]], [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetFaceNormals|SetFaceNormals()]], or [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetFaceColors|SetFaceColors()]]:

```lua
-- Create a triangle
local faceId = editableMesh:AddFace({v0, v1, v2})

-- Create new UV IDs with custom coordinates
local uv0 = editableMesh:AddUV(Vector2.new(0, 0))
local uv1 = editableMesh:AddUV(Vector2.new(1, 0))
local uv2 = editableMesh:AddUV(Vector2.new(0, 1))

-- Replace the face's UV IDs (creates a seam if the vertex had different UVs on another face)
editableMesh:SetFaceUVs(faceId, {uv0, uv1, uv2})
```

#### Normal sharing and smooth vs. sharp edges

Because new faces reuse normal IDs from adjacent faces by default, meshes appear smooth. To create a **sharp edge** (crease) between faces, create a separate normal ID for each face and assign it with [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetFaceNormals|SetFaceNormals()]]:

*(image in the full Top G Vault)*

```lua
-- Two triangles sharing vertices v0 and v1, but with a sharp edge between them
local fid1 = editableMesh:AddFace({v0, v1, v2})
local fid2 = editableMesh:AddFace({v0, v3, v1})

-- Create separate normals for each face to produce a hard edge
local n1 = editableMesh:AddNormal() -- Auto-computed for fid1
local n2 = editableMesh:AddNormal() -- Auto-computed for fid2
editableMesh:SetFaceNormals(fid1, {n1, n1, n1})
editableMesh:SetFaceNormals(fid2, {n2, n2, n2})
```

See also [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetNormal|SetNormal()]] to manually specify a normal vector, and [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#ResetNormal|ResetNormal()]] to revert a normal back to automatic computation.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexIds` | Tuple |  | Array of the new face's vertex IDs, in order around the face. Provide 3 IDs to create a triangle or 4 IDs to create a quad. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | Face ID of the new face. |

### AddNormal

```lua
EditableMesh:AddNormal(normal: Vector3?): int64
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Adds a new normal to the geometry and returns a normal ID. If the normal value isn't specified, the normal will be automatically calculated.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]? |  | The normal vector. If the normal value isn't specified, the normal will be automatically calculated. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | Normal ID of the new normal. |

### AddTriangle

```lua
EditableMesh:AddTriangle(vertexId0: int64, vertexId1: int64, vertexId2: int64): int64
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Adds a new triangle to the mesh and returns a stable face ID. This is equivalent to passing an array of 3 vertex IDs to [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddFace|AddFace()]], but is slightly more performant as it avoids constructing an array for each call.

See [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddFace|AddFace()]] for information on how all faces are added, including those added by [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddTriangle|AddTriangle()]]. This includes details related to automatic attribute assignment, overriding attributes, and more.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId0` | int64 |  | ID of the first vertex of the triangle. |
| `vertexId1` | int64 |  | ID of the second vertex of the triangle. |
| `vertexId2` | int64 |  | ID of the third vertex of the triangle. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | Stable face ID of the new face. |

### AddUV

```lua
EditableMesh:AddUV(uv: Vector2): int64
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Adds a new UV coordinate attribute to the mesh and returns a UV ID.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `uv` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | The new UV coordinate. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | UV ID of the new UV. |

### AddVertex

```lua
EditableMesh:AddVertex(p: Vector3): int64
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Adds a new vertex to the mesh and returns a vertex ID. The position is specified in the mesh's local object space. An error is thrown if the mesh already contains 60,000 vertices.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Position in the mesh's local object space. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | Vertex ID of the new vertex. |

### BatchAdd

```lua
EditableMesh:BatchAdd(attr: MeshAttribute, data: Array): Array
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Creates new mesh elements of the given attribute type and returns their IDs in the same order as the input data. This method always requires an explicit [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute|Enum.MeshAttribute]] because its input is raw values with no existing IDs to inspect. Throws an error if the attribute type is invalid, the data format does not match, or adding the elements would exceed mesh limits.

```lua
local vIds = mesh:BatchAdd(Enum.MeshAttribute.Vertex, positions)     -- Positions: {Vector3}
local nIds = mesh:BatchAdd(Enum.MeshAttribute.Normal, normals)       -- Normals: {Vector3}
local uIds = mesh:BatchAdd(Enum.MeshAttribute.UV, uvs)               -- UVs: {Vector2}
local cIds = mesh:BatchAdd(Enum.MeshAttribute.Color, colors, alphas) -- Colors: {Color3}, Alphas: {number}
local fIds = mesh:BatchAdd(Enum.MeshAttribute.Face, {
    {vIds[1], vIds[2], vIds[3]},
    {vIds[1], vIds[3], vIds[4]},
})
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `attr` | [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|MeshAttribute]] |  | The [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute]] type of element to create. |
| `data` | Array |  | Values to initialize the new elements. An array of [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] for [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Vertex]] or [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Normal]]; an array of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] for [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|UV]]; an array of [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] followed by a matching array of alpha numbers (same length) for [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Color]]; a 2D array of vertex-ID arrays for [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Face]]. |

**Returns**

| Type | Description |
| --- | --- |
| Array | Ordered array of new element IDs matching the input order. |

### BatchGetFaceAttributes

```lua
EditableMesh:BatchGetFaceAttributes(attr: MeshAttribute, faceIds: Array): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns, for each face, the array of per-corner attribute IDs, one per corner in the same order as [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFaceVertices|GetFaceVertices()]].

```lua
local faceNormals = mesh:BatchGetFaceAttributes(Enum.MeshAttribute.Normal, faceIds) -- {{normalId}}
local faceVerts = mesh:BatchGetFaceAttributes(Enum.MeshAttribute.Vertex, faceIds)   -- {{vertexId}}
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `attr` | [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|MeshAttribute]] |  | The attribute to retrieve for each face's corners. Must be [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute.Vertex]], [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute.Normal]], [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute.Color]], or [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute.UV]]; [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute.Face]] is not supported and throws an error. |
| `faceIds` | Array |  | Faces to query. |

**Returns**

| Type | Description |
| --- | --- |
| Array | 2D array where `result[i]` is the array of attribute IDs at the corners of `faceIds[i]`. |

### BatchGetValues

```lua
EditableMesh:BatchGetValues(ids: Array): Tuple
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns attribute values for the given IDs in the same order as the input. Passing an empty array returns an empty result.

```lua
local positions = mesh:BatchGetValues(vertexIds)     -- {Vector3}
local normals = mesh:BatchGetValues(normalIds)       -- {Vector3}
local uvs = mesh:BatchGetValues(uvIds)               -- {Vector2}
local colors, alphas = mesh:BatchGetValues(colorIds) -- {Color3}, {number}
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `ids` | Array |  | IDs of the elements to read. All must be the same attribute type — vertex, normal, color, or UV. The attribute is determined by the ID type, so no [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute]] argument is needed. Mixing types, or passing face or bone IDs, throws an error. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple of two values. The first is an array of attribute values: [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] for vertex or normal IDs, [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] for UV IDs, [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] for color IDs. The second is `nil` for all attribute types except color, where it is an array of alpha numbers. |

### BatchGetVertexAttributes

```lua
EditableMesh:BatchGetVertexAttributes(attr: MeshAttribute, vertexIds: Array): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns, for each vertex, the array of associated attribute IDs, gathered across all faces adjacent to that vertex. For example, using [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute|Enum.MeshAttribute.Face]] returns every face that references each vertex.

```lua
local adjFaces = mesh:BatchGetVertexAttributes(Enum.MeshAttribute.Face, vertexIds) -- {{faceId}}
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `attr` | [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|MeshAttribute]] |  | The attribute type to look up. Must be [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute.Face]] (faces that reference each vertex), [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute.Normal]], [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute.Color]], or [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute.UV]]; [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute.Vertex]] is not supported and throws an error (to read vertex positions, use [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#BatchGetValues\|BatchGetValues()]]). |
| `vertexIds` | Array |  | Vertices to query. |

**Returns**

| Type | Description |
| --- | --- |
| Array | 2D array where `result[i]` is the array of attribute IDs associated with `vertexIds[i]`. |

### BatchGetVertexFaceAttributes

```lua
EditableMesh:BatchGetVertexFaceAttributes(attr: MeshAttribute, vertexIds: Array, faceIds: Array): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns the attribute ID at each corner specified by a vertex–face pair.

```lua
local cornerColors = mesh:BatchGetVertexFaceAttributes(Enum.MeshAttribute.Color, vertexIds, faceIds)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `attr` | [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|MeshAttribute]] |  | The attribute to retrieve. Must be [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute.Normal]], [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute.Color]], or [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute.UV]]; [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute.Vertex]] and [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute.Face]] are not supported and throw an error. |
| `vertexIds` | Array |  | Vertices that identify each corner. |
| `faceIds` | Array |  | Faces that identify each corner. Must be the same length as `vertexIds`. |

**Returns**

| Type | Description |
| --- | --- |
| Array | Array of attribute IDs at each corner, in the same order as the inputs. |

### BatchRemove

```lua
EditableMesh:BatchRemove(faceIds: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Removes a batch of faces. As with [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#RemoveFace|RemoveFace()]], the vertices and attributes used by the removed faces are not automatically deleted; call [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#RemoveUnused|RemoveUnused()]] afterward to clean up unused elements.

```lua
mesh:BatchRemove(faceIds)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `faceIds` | Array |  | Face IDs to remove. An invalid or already-removed ID throws an error and removes nothing; duplicate IDs are collapsed to a single removal. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### BatchSetFaceAttributes

```lua
EditableMesh:BatchSetFaceAttributes(faceIds: Array, attrIdArrays: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Sets the per-corner attribute IDs for each face.

```lua
-- Assign normal IDs to every corner of two faces
mesh:BatchSetFaceAttributes(faceIds, {
	{n1, n2, n3},
	{n4, n5, n6},
})
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `faceIds` | Array |  | Face IDs to update. Must be the same length as `attrIdArrays`. |
| `attrIdArrays` | Array |  | 2D array. `attrIdArrays[i]` is the list of attribute IDs for the corners of `faceIds[i]`, in order. Each inner array must have one entry per corner of the face. All IDs must be of the same attribute type — vertex, normal, color, or UV; mixing types (or passing another ID type) throws an error. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### BatchSetValues

```lua
EditableMesh:BatchSetValues(ids: Array, values: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Writes attribute values to the given IDs. `values[i]` is written to `ids[i]`; the `ids` and `values` arrays must be the same length, unless `values` is `nil` to reset normals.

For color IDs, pass an array of [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] to set the colors, or an array of numbers to set the alphas. Mixing types in one call is an error.

```lua
mesh:BatchSetValues(vertexIds, positions) -- Positions: {Vector3}
mesh:BatchSetValues(normalIds, normals)   -- Normals: {Vector3}
mesh:BatchSetValues(uvIds, uvs)           -- UVs: {Vector2}
mesh:BatchSetValues(colorIds, colors)     -- Colors: {Color3}
mesh:BatchSetValues(colorIds, alphas)     -- Alphas: {number}
mesh:BatchSetValues(normalIds, nil)       -- Resets each normal to auto-computed
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `ids` | Array |  | IDs of the elements to write. All must be the same attribute type — vertex, normal, color, or UV. The attribute is determined by the ID type, so no [[30 Official Roblox Docs/API Reference/Enums/MeshAttribute\|Enum.MeshAttribute]] argument is needed. Mixing types, or passing face or bone IDs, throws an error. |
| `values` | Array |  | Values to assign. Type depends on the ID type: [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] for vertex or normal IDs, [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] for UV IDs, [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] or a number for color IDs. Pass `nil` for normal IDs to reset each normal to auto-computed values, equivalent to calling [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#ResetNormal\|ResetNormal()]] on each. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### BatchSetVertexFaceAttributes

```lua
EditableMesh:BatchSetVertexFaceAttributes(vertexIds: Array, faceIds: Array, attrIds: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Sets the attribute at a specific corner — identified by a vertex–face pair — for each element in the batch. For each index `i`, the attribute at corner `(vertexIds[i], faceIds[i])` is set to `attrIds[i]`.

```lua
mesh:BatchSetVertexFaceAttributes(vertexIds, faceIds, colorIds)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexIds` | Array |  | Vertex IDs that identify each corner. |
| `faceIds` | Array |  | Face IDs that identify each corner. Must be the same length as `vertexIds`. |
| `attrIds` | Array |  | Attribute IDs to assign, one per pair; must be the same length as `vertexIds`. All must be the same attribute type — normal, color, or UV; passing a vertex or face ID throws an error. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Clear

```lua
EditableMesh:Clear(): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Removes all vertex data (including positions, normals, UV coordinates, and colors), faces, bones, and FACS data without destroying the [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] or its allocated space.

This method cannot be called on a fixed-size mesh (where [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#FixedSize|FixedSize]] is `true`). Attempting to do so throws an error because fixed-size meshes do not allow adding or removing elements.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Destroy

```lua
EditableMesh:Destroy(): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Destroys the contents of the mesh, immediately reclaiming used memory.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### FindClosestPointOnSurface

```lua
EditableMesh:FindClosestPointOnSurface(point: Vector3): Tuple
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Finds the closest point on the mesh's surface. Returns the face ID, point on the mesh in local object space, the barycentric coordinates of the position within the face, and the 3 vertex IDs that the barycentric coordinates correspond to. See [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#RaycastLocal|RaycastLocal()]] for more information on barycentric coordinates, including how they apply to quad faces. When the mesh is skinned, this query operates against the bind-pose geometry, not the deformed mesh as it appears at runtime.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Point position in the mesh's local object space. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Tuple of the face ID, point on the mesh in local object space, the barycentric coordinate of the position within the face, and the 3 vertex IDs that the barycentric coordinate weights. |

### FindClosestVertex

```lua
EditableMesh:FindClosestVertex(toThisPoint: Vector3): int64
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Finds the closest vertex to a specific point in space and returns a vertex ID. When the mesh is skinned, this query operates against the bind-pose geometry, not the deformed mesh as it appears at runtime.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `toThisPoint` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Point position in the mesh's local object space. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | Closest vertex ID to the specified point in space. |

### FindVerticesWithinSphere

```lua
EditableMesh:FindVerticesWithinSphere(center: Vector3, radius: float): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Finds all vertices within a specific sphere and returns a list of vertex IDs. When the mesh is skinned, this query operates against the bind-pose geometry, not the deformed mesh as it appears at runtime.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Center of the sphere in the mesh's local object space. |
| `radius` | float |  | Radius of the sphere. |

**Returns**

| Type | Description |
| --- | --- |
| Array | List of vertex IDs within the requested sphere. |

### GetAdjacentFaces

```lua
EditableMesh:GetAdjacentFaces(faceId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Given a face ID, returns a list of adjacent faces.

*(image in the full Top G Vault)*

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `faceId` | int64 |  | Face ID for which to get adjacent faces. |

**Returns**

| Type | Description |
| --- | --- |
| Array | List of face IDs adjacent to the given face. |

### GetAdjacentVertices

```lua
EditableMesh:GetAdjacentVertices(vertexId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Given a vertex ID, returns a list of adjacent vertices.

*(image in the full Top G Vault)*

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId` | int64 |  | Vertex ID around which to get adjacent vertices. |

**Returns**

| Type | Description |
| --- | --- |
| Array | List of IDs of adjacent vertices around the given vertex ID. |

### GetBoneByName

```lua
EditableMesh:GetBoneByName(boneName: string): int64
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Finds the bone ID of the bone with the given name. Errors if no bone with that name exists.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `boneName` | string |  | Bone name to search for. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | Bone ID of the bone with the given name. |

### GetBoneCFrame

```lua
EditableMesh:GetBoneCFrame(boneId: int64): CFrame
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns the initial [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the bone in the bind pose of the mesh, in the mesh's local space.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `boneId` | int64 |  | Bone ID for which to get the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Initial [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the bone in the bind pose of the mesh, in the mesh's local space. |

### GetBoneIsVirtual

```lua
EditableMesh:GetBoneIsVirtual(boneId: int64): boolean
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns `true` if the bone is virtual. Virtual bones can only be bound to a [[30 Official Roblox Docs/API Reference/Classes/FaceControls|FaceControls]] instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `boneId` | int64 |  | Bone ID for which to get whether the bone is virtual. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the bone with the given bone ID is virtual. Virtual bones can only be bound to a [[30 Official Roblox Docs/API Reference/Classes/FaceControls\|FaceControls]] instance. |

### GetBoneName

```lua
EditableMesh:GetBoneName(boneId: int64): string
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns the name string of the bone identified by the given bone ID. Bone names are unique within the mesh and can be up to 100 characters long.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `boneId` | int64 |  | Bone ID for which to get the name. |

**Returns**

| Type | Description |
| --- | --- |
| string | Name of the bone with the given bone ID. |

### GetBoneParent

```lua
EditableMesh:GetBoneParent(boneId: int64): int64
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns the bone ID of the parent bone in the bone hierarchy. If the bone has no parent, returns `0`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `boneId` | int64 |  | Bone ID for which to get the parent. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | Bone ID for the parent of the bone with the given bone ID. If there is no parent, returns `0`. |

### GetBones

```lua
EditableMesh:GetBones(): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns all bones of the mesh as a list of bone IDs.

**Returns**

| Type | Description |
| --- | --- |
| Array | List of bone IDs. |

### GetCenter

```lua
EditableMesh:GetCenter(): Vector3
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns the center of the mesh's axis-aligned bounding box, in the mesh's local object space.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Center of the bounding box of the `EditableMesh`. |

### GetColor

```lua
EditableMesh:GetColor(colorId: int64): Color3?
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns the [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] value stored at the given color ID. Use [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetColorAlpha|GetColorAlpha()]] to retrieve the alpha component separately.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `colorId` | int64 |  | Color ID for which to get the color. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]? | Color for the requested color ID. |

### GetColorAlpha

```lua
EditableMesh:GetColorAlpha(colorId: int64): float?
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns the alpha component of the vertex color at the given color ID as a number between `0` (fully transparent) and `1` (fully opaque). Use [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetColor|GetColor()]] to retrieve the RGB component.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `colorId` | int64 |  | Color ID for which to get the alpha. |

**Returns**

| Type | Description |
| --- | --- |
| float? | Color alpha at the request color ID. |

### GetColors

```lua
EditableMesh:GetColors(): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns all colors of the mesh as a list of color IDs.

**Returns**

| Type | Description |
| --- | --- |
| Array | List of color IDs. |

### GetFaceColors

```lua
EditableMesh:GetFaceColors(faceId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns an array of color IDs, one per vertex corner of the specified face, in the same order as [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFaceVertices|GetFaceVertices()]]. Use these IDs with [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetColor|GetColor()]] and [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetColorAlpha|GetColorAlpha()]] to read the actual color values.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `faceId` | int64 |  | Face ID for which to get the color IDs. |

**Returns**

| Type | Description |
| --- | --- |
| Array | List of color IDs used for the vertices on the given face. |

### GetFaceNormals

```lua
EditableMesh:GetFaceNormals(faceId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns an array of normal IDs, one per vertex corner of the specified face, in the same order as [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFaceVertices|GetFaceVertices()]]. Use these IDs with [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetNormal|GetNormal()]] to read the actual normal vectors.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `faceId` | int64 |  | Face ID for which to get the normal IDs. |

**Returns**

| Type | Description |
| --- | --- |
| Array | List of normal IDs used for the vertices on the given face. |

### GetFaces

```lua
EditableMesh:GetFaces(): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns all faces of the mesh as a list of face IDs.

**Returns**

| Type | Description |
| --- | --- |
| Array | List of face IDs. |

### GetFacesWithAttribute

> [!warning] Deprecated
> This method is deprecated. Do not use it for new work.

```lua
EditableMesh:GetFacesWithAttribute(id: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `Deprecated`

Returns a list of faces that use a given vertex ID, normal ID, UV ID, or color ID.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | int64 |  | Attribute ID for which to find faces that use it. |

**Returns**

| Type | Description |
| --- | --- |
| Array | List of face IDs which use the given attribute ID. |

### GetFacesWithColor

```lua
EditableMesh:GetFacesWithColor(colorId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns an array of face IDs that use the given color ID. Use together with [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVerticesWithColor|GetVerticesWithColor()]] to obtain all face/vertex pairs.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `colorId` | int64 |  | Color ID to find faces for. |

**Returns**

| Type | Description |
| --- | --- |
| Array | List of face IDs that use the provided color ID. |

### GetFacesWithNormal

```lua
EditableMesh:GetFacesWithNormal(normalId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns an array of face IDs that use the given normal ID. Use together with [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVerticesWithNormal|GetVerticesWithNormal()]] to obtain all face/vertex pairs.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `normalId` | int64 |  | Normal ID to find faces for. |

**Returns**

| Type | Description |
| --- | --- |
| Array | List of face IDs that use the provided normal ID. |

### GetFacesWithUV

```lua
EditableMesh:GetFacesWithUV(uvId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns an array of face IDs that use the given UV ID. Use together with [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVerticesWithUV|GetVerticesWithUV()]] to obtain all face/vertex pairs.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `uvId` | int64 |  | UV ID to find faces for. |

**Returns**

| Type | Description |
| --- | --- |
| Array | List of face IDs that use the provided UV ID. |

### GetFaceUVs

```lua
EditableMesh:GetFaceUVs(faceId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns an array of UV IDs, one per vertex corner of the specified face, in the same order as [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFaceVertices|GetFaceVertices()]]. Use these IDs with [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetUV|GetUV()]] to read the actual UV coordinates.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `faceId` | int64 |  | Face ID for which to get the UV IDs. |

**Returns**

| Type | Description |
| --- | --- |
| Array | List of UV IDs used for the vertices on the given face. |

### GetFaceVertices

```lua
EditableMesh:GetFaceVertices(faceId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns an array of vertex IDs that define the corners of the given face, in the same order used when the face was created.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `faceId` | int64 |  | Face ID for which to get the vertex IDs. |

**Returns**

| Type | Description |
| --- | --- |
| Array | List of vertex IDs around the given face. |

### GetFacsCorrectivePose

```lua
EditableMesh:GetFacsCorrectivePose(actions: Array): Tuple
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns bone IDs and bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrames]] for all bones in a specific FACS corrective pose. Each bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] transforms the bone from the initial bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] in the bind pose of the mesh to the combined bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] for this pose. All [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrames]] are in the mesh's local space.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `actions` | Array |  | Array or 2 or 3 [[30 Official Roblox Docs/API Reference/Enums/FacsActionUnit\|Enum.FacsActionUnit]] values that specify a corrective pose. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Array of bone IDs and corresponding array of bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrames]]. |

### GetFacsCorrectivePoses

```lua
EditableMesh:GetFacsCorrectivePoses(): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns all FACS corrective poses that are in use. Each corrective pose is specified by 2 or 3 [[30 Official Roblox Docs/API Reference/Enums/FacsActionUnit|Enum.FacsActionUnit]] values.

**Returns**

| Type | Description |
| --- | --- |
| Array | Array of corrective poses. Each corrective pose is specified by a small array of 2 or 3 [[30 Official Roblox Docs/API Reference/Enums/FacsActionUnit\|Enum.FacsActionUnit]] values. |

### GetFacsPose

```lua
EditableMesh:GetFacsPose(action: FacsActionUnit): Tuple
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns bone IDs and bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrames]] for all bones in a specific FACS action unit. Each bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] transforms the bone from the initial bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] in the bind pose of the mesh to the combined bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] for this pose. All [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrames]] are in the mesh's local space.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `action` | [[30 Official Roblox Docs/API Reference/Enums/FacsActionUnit\|FacsActionUnit]] |  | FACS action unit for which to get the pose. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Array of bone IDs and corresponding array of bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. |

### GetFacsPoses

```lua
EditableMesh:GetFacsPoses(): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns an array of [[30 Official Roblox Docs/API Reference/Enums/FacsActionUnit|Enum.FacsActionUnit]] values representing all base FACS poses currently defined on this mesh. Use each returned value with [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFacsPose|GetFacsPose()]] to retrieve the bone transforms for that pose. See also [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFacsCorrectivePoses|GetFacsCorrectivePoses()]] for corrective poses.

**Returns**

| Type | Description |
| --- | --- |
| Array | Array of [[30 Official Roblox Docs/API Reference/Enums/FacsActionUnit\|Enum.FacsActionUnit]], one for each FACS action unit that has a pose defined. |

### GetNormal

```lua
EditableMesh:GetNormal(normalId: int64): Vector3?
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] normal vector at the given normal ID. If the normal vector was manually specified it will return that vector. If the normal vector was not specified or was reset, this will return an automatically calculated normal vector based on the shape of the mesh.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `normalId` | int64 |  | Normal ID for which to get the normal vector. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]? | Normal vector at the requested normal ID. |

### GetNormals

```lua
EditableMesh:GetNormals(): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns all normals of the mesh as a list of normal IDs.

**Returns**

| Type | Description |
| --- | --- |
| Array | List of normal IDs. |

### GetPosition

```lua
EditableMesh:GetPosition(vertexId: int64): Vector3
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Gets the position of a vertex in the mesh's local object space.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId` | int64 |  | Vertex ID for which to get the position. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Position of a vertex in the mesh's local object space. |

### GetSize

```lua
EditableMesh:GetSize(): Vector3
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns the size of the mesh's axis-aligned bounding box, in the mesh's local object space.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Size of the `EditableMesh`. |

### GetUV

```lua
EditableMesh:GetUV(uvId: int64): Vector2?
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] texture coordinate stored at the given UV ID. UV coordinates map the mesh surface to a 2D texture.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `uvId` | int64 |  | UV ID for which to get the UV coordinate. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]]? | UV coordinates at the requested UV ID. |

### GetUVs

```lua
EditableMesh:GetUVs(): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns all UVs of the mesh as a list of UV IDs.

**Returns**

| Type | Description |
| --- | --- |
| Array | List of UV IDs. |

### GetVertexBones

```lua
EditableMesh:GetVertexBones(vertexId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns an array of bone IDs that influence the given vertex during skinning deformation. A vertex can be influenced by up to 4 bones. The returned array corresponds index-by-index with the weights returned by [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertexBoneWeights|GetVertexBoneWeights()]] for the same vertex.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId` | int64 |  | Vertex ID for which to get the associated bones. |

**Returns**

| Type | Description |
| --- | --- |
| Array | Bone IDs associated with the vertex for skinning. |

### GetVertexBoneWeights

```lua
EditableMesh:GetVertexBoneWeights(vertexId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns an array of blend weights (each between `0` and `1`) for the bones influencing this vertex during skeletal deformation. The returned array corresponds index-by-index with the bone IDs returned by [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertexBones|GetVertexBones()]] for the same vertex.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId` | int64 |  | Vertex ID for which to get the associated bone weights. |

**Returns**

| Type | Description |
| --- | --- |
| Array | Skinning blend weights for each bone that is associated with the vertex. |

### GetVertexColors

```lua
EditableMesh:GetVertexColors(vertexId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns an array of color IDs used on all face corners that reference the given vertex. A vertex shared by multiple faces can have different color IDs on each face (a color seam); this method returns all of them.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId` | int64 |  | Vertex ID to find color IDs. |

**Returns**

| Type | Description |
| --- | --- |
| Array | Array of color IDs of faces attached to the given vertex. |

### GetVertexFaceColor

```lua
EditableMesh:GetVertexFaceColor(vertexId: int64, faceId: int64): int64
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns the color ID assigned to a specific corner of a face, identified by the vertex/face pair. This is useful when a vertex is shared by multiple faces and you need the color for one particular face corner rather than all of them.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId` | int64 |  | Vertex ID. |
| `faceId` | int64 |  | Face ID. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | Color ID of the vertex/face pair. |

### GetVertexFaceNormal

```lua
EditableMesh:GetVertexFaceNormal(vertexId: int64, faceId: int64): int64
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns the normal ID assigned to a specific corner of a face, identified by the vertex/face pair. This is useful when a vertex has split normals (a sharp edge) and you need the normal for one particular face corner rather than all of them.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId` | int64 |  | Vertex ID. |
| `faceId` | int64 |  | Face ID. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | Normal ID of the vertex/face pair. |

### GetVertexFaces

```lua
EditableMesh:GetVertexFaces(vertexId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns an array of face IDs for all faces that have the given vertex as one of their corners. Use this to traverse the mesh topology around a vertex, for example to find all faces affected by moving a vertex.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId` | int64 |  | Vertex ID to find faces for. |

**Returns**

| Type | Description |
| --- | --- |
| Array | Array of face IDs attached to the given vertex. |

### GetVertexFaceUV

```lua
EditableMesh:GetVertexFaceUV(vertexId: int64, faceId: int64): int64
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns the UV ID assigned to a specific corner of a face, identified by the vertex/face pair. This is useful when a vertex has a UV seam and you need the UV for one particular face corner rather than all of them.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId` | int64 |  | Vertex ID. |
| `faceId` | int64 |  | Face ID. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | UV ID of the vertex/face pair. |

### GetVertexNormals

```lua
EditableMesh:GetVertexNormals(vertexId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns an array of normal IDs used on all face corners that reference the given vertex. A vertex shared by multiple faces can have different normal IDs on each face (a hard/sharp edge); this method returns all of them.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId` | int64 |  | Vertex ID to find normal IDs. |

**Returns**

| Type | Description |
| --- | --- |
| Array | Array of normal IDs of faces attached to the given vertex. |

### GetVertexUVs

```lua
EditableMesh:GetVertexUVs(vertexId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns an array of UV IDs used on all face corners that reference the given vertex. A vertex shared by multiple faces can have different UV IDs on each face (a UV seam); this method returns all of them.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId` | int64 |  | Vertex ID to find UV IDs. |

**Returns**

| Type | Description |
| --- | --- |
| Array | Array of UV IDs of faces attached to the given vertex. |

### GetVertices

```lua
EditableMesh:GetVertices(): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Returns all vertex IDs in the mesh as a list of IDs. The IDs may not be contiguous. Use this list to iterate over vertices safely, rather than assuming consecutive numbering.

**Returns**

| Type | Description |
| --- | --- |
| Array | List of vertex IDs. |

### GetVerticesWithAttribute

> [!warning] Deprecated
> This method is deprecated. Do not use it for new work.

```lua
EditableMesh:GetVerticesWithAttribute(id: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `Deprecated`

Returns a list of vertices that use a given face ID, normal ID, UV ID, or color ID.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | int64 |  | Attribute ID for which to find vertices that use it. |

**Returns**

| Type | Description |
| --- | --- |
| Array | List of vertex IDs which use the given attribute ID. |

### GetVerticesWithColor

```lua
EditableMesh:GetVerticesWithColor(colorId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns an array of vertex IDs that use the given color ID. Use together with [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFacesWithColor|GetFacesWithColor()]] to obtain all face/vertex pairs.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `colorId` | int64 |  | Color ID to find faces for. |

**Returns**

| Type | Description |
| --- | --- |
| Array | List of face IDs that use the provided color ID. |

### GetVerticesWithNormal

```lua
EditableMesh:GetVerticesWithNormal(normalId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns an array of vertex IDs that use the given normal ID. Use together with [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFacesWithNormal|GetFacesWithNormal()]] to obtain all face/vertex pairs.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `normalId` | int64 |  | Normal ID to find vertices for. |

**Returns**

| Type | Description |
| --- | --- |
| Array | List of vertex IDs that use the provided normal ID. |

### GetVerticesWithUV

```lua
EditableMesh:GetVerticesWithUV(uvId: int64): Array
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Returns an array of vertex IDs that use the given UV ID. Use together with [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFacesWithUV|GetFacesWithUV()]] to obtain all face/vertex pairs.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `uvId` | int64 |  | UV ID to find vertices for. |

**Returns**

| Type | Description |
| --- | --- |
| Array | List of vertex IDs that use the provided UV ID. |

### IdDebugString

```lua
EditableMesh:IdDebugString(id: int64): string
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Returns a string describing an ID, useful for debugging purposes, like `f17` or `v12`, containing the type, ID number, and version.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | int64 |  | ID for which to return a debugging information string. |

**Returns**

| Type | Description |
| --- | --- |
| string | String that describes the ID in human-readable format. |

### MergeVertices

```lua
EditableMesh:MergeVertices(mergeTolerance: float): Map
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Merges vertices that touch together, to use a single vertex ID but keep the other original attribute IDs.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `mergeTolerance` | float |  | The distance at which the vertices are considered to touch each other. |

**Returns**

| Type | Description |
| --- | --- |
| Map | A mapping of old vertex ID to new vertex ID for vertices that have been merged. |

### RaycastLocal

```lua
EditableMesh:RaycastLocal(origin: Vector3, direction: Vector3): Tuple
```

**Thread safety:** Safe · **Capabilities:** DynamicGeneration

Casts a ray and returns the face ID, point of intersection, barycentric coordinates, and the 3 vertex IDs that the barycentric coordinates correspond to. The inputs and outputs of this method are in the mesh's local object space. When the mesh is skinned, this raycast operates against the bind-pose geometry, not the deformed mesh as it appears at runtime.

A **barycentric coordinate** is a way of specifying a point within a triangle as a weighted combination of the triangle's 3 vertices. This is useful as a general way of blending vertex attributes. See this method's code sample as an illustration.

Because a barycentric coordinate is defined over exactly 3 vertices, when the hit face is a quad, the coordinate and the returned vertex IDs refer to 3 of the quad's 4 vertices forming the corners of the sub-triangle that was hit. Use the returned vertex IDs, rather than the face's full vertex list, to identify which vertices the weights apply to.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Origin of the ray in the mesh's local object space. |
| `direction` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Direction of the ray. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Tuple of the face ID, point of intersection, barycentric coordinates, and the 3 vertex IDs that the barycentric coordinates weight. |

*Code samples for this member (`EditableMesh-RaycastLocal`) are published on the source page; their code is not part of the open-source repo.*

### RemoveBone

```lua
EditableMesh:RemoveBone(boneId: int64): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Removes a bone from the mesh using its bone ID. Any vertex skinning weights that referenced the removed bone are also cleared.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `boneId` | int64 |  | Bone ID of the bone to remove. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RemoveFace

```lua
EditableMesh:RemoveFace(faceId: int64): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Removes a face from the mesh using its face ID. The vertices and attributes that were used by the face are **not** automatically deleted; call [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#RemoveUnused|RemoveUnused()]] afterward if you want to clean up unused vertices and attributes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `faceId` | int64 |  | Face ID of the face to remove. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RemoveUnused

```lua
EditableMesh:RemoveUnused(): Array
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Removes all vertices, normals, UVs, and colors which are not used in any face, and returns the removed IDs.

**Returns**

| Type | Description |
| --- | --- |
| Array | All of the removed IDs. |

### ResetNormal

```lua
EditableMesh:ResetNormal(normalId: int64): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Reset this normal ID to be automatically calculated based on the shape of the mesh, instead of manually set.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `normalId` | int64 |  | Normal ID to reset. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetBoneCFrame

```lua
EditableMesh:SetBoneCFrame(boneId: int64, cframe: CFrame): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Set the initial [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] for a bone in the mesh's bind pose, in the mesh's local space.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `boneId` | int64 |  | Bone ID for which to set the initial [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. |
| `cframe` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | Initial [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] for the bone in the mesh's bind pose, in the mesh's local space. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetBoneIsVirtual

```lua
EditableMesh:SetBoneIsVirtual(boneId: int64, virtual: boolean): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Set whether a bone is virtual. Virtual bones can only be bound to a [[30 Official Roblox Docs/API Reference/Classes/FaceControls|FaceControls]] instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `boneId` | int64 |  | Bone ID for which to set whether the bone is virtual. |
| `virtual` | boolean |  | Whether the bone should be virtual. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetBoneName

```lua
EditableMesh:SetBoneName(boneId: int64, name: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Sets the name for a bone. Bone names can be 100 characters long and must be unique in the mesh.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `boneId` | int64 |  | Bone ID for which to set the name. |
| `name` | string |  | Bone name to set. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetBoneParent

```lua
EditableMesh:SetBoneParent(boneId: int64, parentBoneId: int64): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Sets the parent of a bone in the bone hierarchy. Pass a valid bone ID to parent the bone, or `0` to make it a root bone. The engine validates that the new parent does not create a cycle in the bone hierarchy and throws an error if the parent ID is invalid or would produce a circular dependency.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `boneId` | int64 |  | Bone ID for which to set the parent. |
| `parentBoneId` | int64 |  | Parent bone ID. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetColor

```lua
EditableMesh:SetColor(colorId: int64, color: Color3): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Sets the [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] value for a color ID. This changes the vertex color for every face corner that references this color ID. Use [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetColorAlpha|SetColorAlpha()]] to change the alpha component separately.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `colorId` | int64 |  | Color ID for which to set the color. |
| `color` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |  | Color to set. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetColorAlpha

```lua
EditableMesh:SetColorAlpha(colorId: int64, alpha: float): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Sets the alpha (transparency) component of the vertex color at the given color ID. The value is a number between `0` (fully transparent) and `1` (fully opaque). This changes the alpha for every face corner that references this color ID.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `colorId` | int64 |  | Color ID for which to set the color alpha. |
| `alpha` | float |  | Alpha to set. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetFaceColors

```lua
EditableMesh:SetFaceColors(faceId: int64, ids: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Assigns new color IDs to the corners of a face, replacing whatever color IDs were previously set. The array must contain one color ID per vertex of the face, in the same winding order as [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFaceVertices|GetFaceVertices()]]. Use this to create a color seam at a vertex shared by multiple faces.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `faceId` | int64 |  | Face ID for which to update the vertex colors. |
| `ids` | Array |  | List of new color IDs to use for the given face's vertices. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetFaceNormals

```lua
EditableMesh:SetFaceNormals(faceId: int64, ids: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Assigns new normal IDs to the corners of a face, replacing whatever normal IDs were previously set. The array must contain one normal ID per vertex of the face, in the same winding order as [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFaceVertices|GetFaceVertices()]]. Use this to create a hard/sharp edge by giving adjacent faces different normals at the same vertex.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `faceId` | int64 |  | Face ID for which to update the vertex normals. |
| `ids` | Array |  | List of new normal IDs to use for the given face's vertices. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetFaceUVs

```lua
EditableMesh:SetFaceUVs(faceId: int64, ids: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Assigns new UV IDs to the corners of a face, replacing whatever UV IDs were previously set. The array must contain one UV ID per vertex of the face, in the same winding order as [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetFaceVertices|GetFaceVertices()]]. Use this to create a UV seam at a vertex shared by multiple faces.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `faceId` | int64 |  | Face ID for which to update the vertex UVs. |
| `ids` | Array |  | List of new UV IDs to use for the given face's vertices. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetFaceVertices

```lua
EditableMesh:SetFaceVertices(faceId: int64, ids: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration · **Tags:** `CustomLuaState`

Replaces the vertex IDs at each corner of the given face, in winding order. Passing 3 vertex IDs makes the face a triangle and 4 makes it a quad, so this can convert a face between a triangle and a quad while keeping the same face ID.

The normal, UV, and color attributes on each of the existing corners are preserved. If a new corner is added, it follows the same automatic attribute assignment described in [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#AddFace|AddFace()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `faceId` | int64 |  | Face ID for which to update the vertices. |
| `ids` | Array |  | List of new vertex IDs to use for the given face. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetFacsBonePose

```lua
EditableMesh:SetFacsBonePose(action: FacsActionUnit, boneId: int64, cframe: CFrame): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Sets the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] for a single bone within a specific FACS action unit pose, without modifying the other bones in that pose. The bone must be virtual. The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] transforms the bone from its initial bind-pose position to the target pose position, in the mesh's local space. Use this for incremental edits to a FACS pose; use [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetFacsPose|SetFacsPose()]] to set all bones in a pose at once.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `action` | [[30 Official Roblox Docs/API Reference/Enums/FacsActionUnit\|FacsActionUnit]] |  | FACS action unit for which to set the pose. |
| `boneId` | int64 |  | Bone to set a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] for this pose. |
| `cframe` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] which transforms the bone from the initial bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] in the bind pose of the mesh to the combined bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] for this pose. All [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrames]] are in the mesh's local space. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetFacsCorrectivePose

```lua
EditableMesh:SetFacsCorrectivePose(actions: Array, boneIds: Array, cframes: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Sets all bone transforms for a FACS corrective pose, which overrides the blended result of 2 or 3 base poses when they are active simultaneously. The `actions` array must contain exactly 2 or 3 [[30 Official Roblox Docs/API Reference/Enums/FacsActionUnit|Enum.FacsActionUnit]] values that identify the combination. All referenced bones must be virtual. The `boneIds` and `cframes` arrays must be the same length; each [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] transforms the bone from the bind pose to the corrective target, in the mesh's local space. Throws if the action combination is not a valid corrective.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `actions` | Array |  | Array or 2 or 3 [[30 Official Roblox Docs/API Reference/Enums/FacsActionUnit\|Enum.FacsActionUnit]] values to apply as a corrective pose. |
| `boneIds` | Array |  | Bones to set a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] for this pose. |
| `cframes` | Array |  | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] transforms for the bones in this corrective pose.<br><br>Each bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] transforms the bone from the initial bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] in the bind pose of the mesh to the combined bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] for this pose. All [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrames]] are in the mesh's local space. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetFacsPose

```lua
EditableMesh:SetFacsPose(action: FacsActionUnit, boneIds: Array, cframes: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Sets all bone transforms for a FACS base pose (a single action unit). The `boneIds` and `cframes` arrays must be the same length; each [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] transforms the bone from the bind pose to the target pose, in the mesh's local space. All referenced bones must be virtual (non-virtual bones throw an error). This replaces any previously defined pose for the given action unit.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `action` | [[30 Official Roblox Docs/API Reference/Enums/FacsActionUnit\|FacsActionUnit]] |  | FACS action unit to set the pose for. |
| `boneIds` | Array |  | Bones for which to set a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] for this pose. |
| `cframes` | Array |  | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] transforms for the bones in this pose.<br><br>Each bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] transforms the bone from the initial bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] in the bind pose of the mesh to the combined bone [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] for this pose. All [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrames]] are in the mesh's local space. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetNormal

```lua
EditableMesh:SetNormal(normalId: int64, normal: Vector3): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Set the normal for a normal ID. This will change the normal value for every face vertex which is using the normal ID.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `normalId` | int64 |  | Normal ID for which to set the normal vector. |
| `normal` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Normal vector to set. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetPosition

```lua
EditableMesh:SetPosition(vertexId: int64, p: Vector3): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Sets a vertex position in the mesh's local object space. Please note that collision and other physics data on linked [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] is not updated until you call [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateMeshPartAsync|AssetService:CreateMeshPartAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/MeshPart#ApplyMesh|MeshPart:ApplyMesh()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId` | int64 |  | Vertex ID of the vertex to position. |
| `p` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Position in the mesh's local object space. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetUV

```lua
EditableMesh:SetUV(uvId: int64, uv: Vector2): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Sets the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] texture coordinate for a UV ID. This changes the UV mapping for every face corner that references this UV ID.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `uvId` | int64 |  | UV ID for which to set the UV coordinates. |
| `uv` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | UV coordinates. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetVertexBones

```lua
EditableMesh:SetVertexBones(vertexId: int64, boneIDs: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Assign a list of bones with the vertex for skinning.

Corresponds with the skinning blend weights used in [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetVertexBoneWeights|SetVertexBoneWeights()]]. In other words, [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertexBoneWeights|GetVertexBoneWeights(vertexId)i]] is the weight on this vertex for [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertexBones|GetVertexBones(vertexId)i]].

This method should be called before calling [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetVertexBoneWeights|SetVertexBoneWeights()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId` | int64 |  | Vertex ID to set vertex skinning bones. |
| `boneIDs` | Array |  | Bone IDs to use with this vertex for skinning. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetVertexBoneWeights

```lua
EditableMesh:SetVertexBoneWeights(vertexId: int64, boneWeights: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Sets skinning blend weights for each bone associated with the vertex.

Corresponds with the bone IDs used in [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetVertexBones|SetVertexBones()]]. In other words, [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertexBoneWeights|GetVertexBoneWeights(vertexId)i]] is the weight on this vertex for [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#GetVertexBones|GetVertexBones(vertexId)i]].

This method should be called after calling [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetVertexBones|SetVertexBones()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId` | int64 |  | Vertex ID on which to set skinning blend weights. |
| `boneWeights` | Array |  | Skinning blend weights to set on the vertex. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetVertexFaceColor

```lua
EditableMesh:SetVertexFaceColor(vertexId: int64, faceId: int64, colorId: int64): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Sets the color ID for a specific corner of a face, identified by the vertex/face pair. This is equivalent to changing just one element of the array set by [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetFaceColors|SetFaceColors()]], and is useful for creating or removing a color seam at a single vertex without affecting the other corners of the face.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId` | int64 |  | Vertex ID. |
| `faceId` | int64 |  | Face ID. |
| `colorId` | int64 |  | Color ID to set for the vertex/face pair. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetVertexFaceNormal

```lua
EditableMesh:SetVertexFaceNormal(vertexId: int64, faceId: int64, normalId: int64): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Sets the normal ID for a specific corner of a face, identified by the vertex/face pair. This is equivalent to changing just one element of the array set by [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetFaceNormals|SetFaceNormals()]], and is useful for creating or removing a hard edge at a single vertex without affecting the other corners of the face.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId` | int64 |  | Vertex ID. |
| `faceId` | int64 |  | Face ID. |
| `normalId` | int64 |  | Normal ID to set for the vertex/face pair. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetVertexFaceUV

```lua
EditableMesh:SetVertexFaceUV(vertexId: int64, faceId: int64, uvId: int64): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Sets the UV ID for a specific corner of a face, identified by the vertex/face pair. This is equivalent to changing just one element of the array set by [[30 Official Roblox Docs/API Reference/Classes/EditableMesh#SetFaceUVs|SetFaceUVs()]], and is useful for creating or removing a UV seam at a single vertex without affecting the other corners of the face.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `vertexId` | int64 |  | Vertex ID. |
| `faceId` | int64 |  | Face ID. |
| `uvId` | int64 |  | UV ID to set for the vertex/face pair. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Triangulate

```lua
EditableMesh:Triangulate(): ()
```

**Thread safety:** Unsafe · **Capabilities:** DynamicGeneration

Splits every quad face on the mesh into two triangle faces each. A heuristic is used to determine which diagonal each quad should be split along to produce better-shaped triangles. If your code relies on faces being triangles, call this method after [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateEditableMeshAsync|AssetService:CreateEditableMeshAsync()]], which may produce quad faces.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [EditableMesh](https://create.roblox.com/docs/reference/engine/classes/EditableMesh) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
