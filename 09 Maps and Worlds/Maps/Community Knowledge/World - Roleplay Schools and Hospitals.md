---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "World - Roleplay Schools and Hospitals"
tags: [roblox, community-knowledge, maps, roleplay, school, hospital]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
  - https://create.roblox.com/docs/reference/engine/classes/Seat
  - https://create.roblox.com/docs/reference/engine/classes/CollectionService
  - https://kenney.nl/assets/furniture-kit
---
# World - Roleplay Schools and Hospitals

In roleplay games, buildings are stages. A school or hospital works when every room implies a role (teacher, nurse, patient, janitor) and gives that role something to sit on, use or open. A beautiful building with nothing to interact with gets abandoned in minutes.

## Layout plan: school
- **Main corridor with classrooms both sides**, lockers along the walls. Corridors 16-20 studs wide for crowds and the camera.
- **Rooms that imply roles:** classroom (teacher desk + 12-20 student desks), principal's office, cafeteria, gym, nurse's office, library, bathrooms, janitor closet, roof or courtyard.
- **One big gathering room** (gym or cafeteria) near the entrance for events.
- **Front office at the entrance** with a reception desk: the natural spawn for staff roles.

## Layout plan: hospital
- **Lobby + reception -> triage -> wards -> surgery/ICU**, in that order, so a patient's story is a walk through the building.
- Emergency entrance with an ambulance bay on a different side from the visitor entrance.
- Wards of 4-6 beds, curtains, and a nurse station that can see every door.
- Elevator or ramp between floors (stretchers and wheelchairs hate stairs).

## Interactions per room
| Object | Roblox piece |
|---|---|
| Chairs, beds, desks | `Seat` (beds too, rotated) |
| Doors, lockers, vending | `ProximityPrompt` with clear `ActionText` ("Open", "Buy snack") |
| Whiteboard | `SurfaceGui` with a TextBox; filter player text with TextService |
| Bells, PA, alarms | Server-triggered sounds with capped volume, never sudden loud audio |

Keep `ProximityPrompt.MaxActivationDistance` short (6-10 studs) in dense rooms so prompts don't stack on screen.

Short pattern: tag every interactive chair `RPSeat` with CollectionService and wire them from one script instead of a script per chair.

```lua
local CollectionService = game:GetService("CollectionService")
for _, seatPart in CollectionService:GetTagged("RPSeat") do
	seatPart:GetPropertyChangedSignal("Occupant"):Connect(function()
		seatPart:SetAttribute("Busy", seatPart.Occupant ~= nil)
	end)
end
```

## Key kits
- Kenney **Furniture Kit** (CC0, bundle-safe) for desks, beds, chairs, cabinets.
- ambientCG linoleum, ceiling tile and painted plaster textures (CC0).

## Lighting tips
- Cool white for classrooms and wards, warmer light in offices and the cafeteria, so rooms are recognisable at a glance.
- Ceiling lights without shadows; one or two shadowed lights per wing for depth.
- Colored floor stripes or wall bands per wing (red = emergency, blue = wards) double as wayfinding.

## Performance budget
- Hundreds of seats and prompts: create them from tags at runtime, not one script each.
- Desks and beds: one mesh each, `CollisionFidelity = Box`.
- A school with 30 classrooms is large; turn streaming on and keep each classroom a Model.

## Common mistakes
- Real-width corridors: avatars and cameras clip constantly.
- Rooms with no purpose: cut them, or give them one prop that suggests a role.
- Prompts on every object at once, filling the screen with key hints.
- Copying the layout or name of a famous roleplay game.

## Related
[[Maps - Hub]] - [[Camera-Friendly Interiors - Occlusion Mode, Ceiling Height and Zoom Limits]] - [[Wayfinding with Landmarks and Weenies]] - [[World Interaction System Blueprint]]
