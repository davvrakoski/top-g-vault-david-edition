---
title: "BrickColor"
description: "A data type that provides a predefined list of named colors."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/BrickColor"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A data type that provides a predefined list of named colors.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] data type provides a predefined list of named colors, not to be confused with [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]], a more general data type that describes RGB colors. The following code shows how to use [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#new|BrickColor.new()]] to declare the [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] property of a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]].

```lua
local part = Instance.new("Part")

-- By color name
part.BrickColor = BrickColor.new("Pastel Blue")
print(part.BrickColor) --> Pastel Blue

-- By numerical index
part.BrickColor = BrickColor.new(11)
print(part.BrickColor) --> Pastel Blue

-- By RGB decimal values in range of 0-1
part.BrickColor = BrickColor.new(0.502, 0.734, 0.859)
print(part.BrickColor) --> Pastel Blue

-- By palette index
part.BrickColor = BrickColor.palette(70)
print(part.BrickColor) --> Gold
```

The following table is the list of available brick colors.

| Color | Name | Number | Palette Index | RGB Value (0‑255) | RGB Value (0‑1) |
| --- | --- | --- | --- | --- | --- |
| `#F2F3F3` | White | `1` | `87` | `242, 243, 243` | `0.950, 0.953, 0.953` |
| `#A1A5A2` | Grey | `2` |  | `161, 165, 162` | `0.632, 0.648, 0.636` |
| `#F9E999` | Light yellow | `3` |  | `249, 233, 153` | `0.977, 0.914, 0.600` |
| `#D7C59A` | Brick yellow | `5` | `109` | `215, 197, 154` | `0.844, 0.773, 0.604` |
| `#C2DAB8` | Light green (Mint) | `6` |  | `194, 218, 184` | `0.761, 0.855, 0.722` |
| `#E8BAC8` | Light reddish violet | `9` | `88` | `232, 186, 200` | `0.910, 0.730, 0.785` |
| `#80BBDB` | Pastel Blue | `11` | `51` | `128, 187, 219` | `0.502, 0.734, 0.859` |
| `#CB8442` | Light orange brown | `12` |  | `203, 132, 66` | `0.797, 0.518, 0.259` |
| `#CC8E69` | Nougat | `18` | `110` | `204, 142, 105` | `0.800, 0.557, 0.412` |
| `#C4281C` | Bright red | `21` | `68` | `196, 40, 28` | `0.769, 0.157, 0.110` |
| `#C470A0` | Med. reddish violet | `22` |  | `196, 112, 160` | `0.769, 0.440, 0.628` |
| `#0D69AC` | Bright blue | `23` | `21` | `13, 105, 172` | `0.051, 0.412, 0.675` |
| `#F5CD30` | Bright yellow | `24` | `71` | `245, 205, 48` | `0.961, 0.804, 0.189` |
| `#624732` | Earth orange | `25` |  | `98, 71, 50` | `0.385, 0.279, 0.197` |
| `#1B2A35` | Black | `26` | `3` | `27, 42, 53` | `0.106, 0.165, 0.208` |
| `#6D6E6C` | Dark grey | `27` |  | `109, 110, 108` | `0.428, 0.432, 0.424` |
| `#287F47` | Dark green | `28` | `8` | `40, 127, 71` | `0.157, 0.499, 0.279` |
| `#A1C48C` | Medium green | `29` | `59` | `161, 196, 140` | `0.632, 0.769, 0.550` |
| `#F3CF9B` | Lig. Yellowich orange | `36` |  | `243, 207, 155` | `0.953, 0.812, 0.608` |
| `#4B974B` | Bright green | `37` | `25` | `75, 151, 75` | `0.295, 0.593, 0.295` |
| `#A05F35` | Dark orange | `38` | `119` | `160, 95, 53` | `0.628, 0.373, 0.208` |
| `#C1CADE` | Light bluish violet | `39` |  | `193, 202, 222` | `0.757, 0.793, 0.871` |
| `#ECECEC` | Transparent | `40` |  | `236, 236, 236` | `0.926, 0.926, 0.926` |
| `#CD544B` | Tr. Red | `41` |  | `205, 84, 75` | `0.804, 0.330, 0.295` |
| `#C1DFF0` | Tr. Lg blue | `42` |  | `193, 223, 240` | `0.757, 0.875, 0.942` |
| `#7BB6E8` | Tr. Blue | `43` |  | `123, 182, 232` | `0.483, 0.714, 0.910` |
| `#F7F18D` | Tr. Yellow | `44` |  | `247, 241, 141` | `0.969, 0.946, 0.553` |
| `#B4D2E4` | Light blue | `45` | `63` | `180, 210, 228` | `0.706, 0.824, 0.895` |
| `#D9856C` | Tr. Flu. Reddish orange | `47` |  | `217, 133, 108` | `0.851, 0.522, 0.424` |
| `#84B68D` | Tr. Green | `48` |  | `132, 182, 141` | `0.518, 0.714, 0.553` |
| `#F8F184` | Tr. Flu. Green | `49` |  | `248, 241, 132` | `0.973, 0.946, 0.518` |
| `#ECE8DE` | Phosph. White | `50` |  | `236, 232, 222` | `0.926, 0.910, 0.871` |
| `#EEC4B6` | Light red | `100` |  | `238, 196, 182` | `0.934, 0.769, 0.714` |
| `#DA867A` | Medium red | `101` | `101` | `218, 134, 122` | `0.855, 0.526, 0.479` |
| `#6E99CA` | Medium blue | `102` | `20` | `110, 153, 202` | `0.432, 0.600, 0.793` |
| `#C7C1B7` | Light grey | `103` |  | `199, 193, 183` | `0.781, 0.757, 0.718` |
| `#6B327C` | Bright violet | `104` | `44` | `107, 50, 124` | `0.420, 0.197, 0.487` |
| `#E29B40` | Br. yellowish orange | `105` | `94` | `226, 155, 64` | `0.887, 0.608, 0.251` |
| `#DA8541` | Bright orange | `106` | `83` | `218, 133, 65` | `0.855, 0.522, 0.255` |
| `#008F9C` | Bright bluish green | `107` | `2` | `0, 143, 156` | `0.000, 0.561, 0.612` |
| `#685C43` | Earth yellow | `108` |  | `104, 92, 67` | `0.408, 0.361, 0.263` |
| `#435493` | Bright bluish violet | `110` |  | `67, 84, 147` | `0.263, 0.330, 0.577` |
| `#BFB7B1` | Tr. Brown | `111` |  | `191, 183, 177` | `0.750, 0.718, 0.695` |
| `#6874AC` | Medium bluish violet | `112` |  | `104, 116, 172` | `0.408, 0.455, 0.675` |
| `#E5ADC8` | Tr. Medi. reddish violet | `113` |  | `229, 173, 200` | `0.899, 0.679, 0.785` |
| `#C7D23C` | Med. yellowish green | `115` |  | `199, 210, 60` | `0.781, 0.824, 0.236` |
| `#55A5AF` | Med. bluish green | `116` |  | `85, 165, 175` | `0.334, 0.648, 0.687` |
| `#B7D7D5` | Light bluish green | `118` |  | `183, 215, 213` | `0.718, 0.844, 0.836` |
| `#A4BD47` | Br. yellowish green | `119` | `46` | `164, 189, 71` | `0.644, 0.742, 0.279` |
| `#D9E4A7` | Lig. yellowish green | `120` |  | `217, 228, 167` | `0.851, 0.895, 0.655` |
| `#E7AC58` | Med. yellowish orange | `121` |  | `231, 172, 88` | `0.906, 0.675, 0.346` |
| `#D36F4C` | Br. reddish orange | `123` |  | `211, 111, 76` | `0.828, 0.436, 0.299` |
| `#923978` | Bright reddish violet | `124` |  | `146, 57, 120` | `0.573, 0.224, 0.471` |
| `#EAB892` | Light orange | `125` | `100` | `234, 184, 146` | `0.918, 0.722, 0.573` |
| `#A5A5CB` | Tr. Bright bluish violet | `126` |  | `165, 165, 203` | `0.648, 0.648, 0.797` |
| `#DCBC81` | Gold | `127` |  | `220, 188, 129` | `0.863, 0.738, 0.506` |
| `#AE7A59` | Dark nougat | `128` |  | `174, 122, 89` | `0.683, 0.479, 0.350` |
| `#9CA3A8` | Silver | `131` |  | `156, 163, 168` | `0.612, 0.640, 0.659` |
| `#D5733D` | Neon orange | `133` | `82` | `213, 115, 61` | `0.836, 0.451, 0.240` |
| `#D8DD56` | Neon green | `134` |  | `216, 221, 86` | `0.848, 0.867, 0.338` |
| `#74869D` | Sand blue | `135` | `19` | `116, 134, 157` | `0.455, 0.526, 0.616` |
| `#877C90` | Sand violet | `136` |  | `135, 124, 144` | `0.530, 0.487, 0.565` |
| `#E09864` | Medium orange | `137` |  | `224, 152, 100` | `0.879, 0.597, 0.393` |
| `#958A73` | Sand yellow | `138` |  | `149, 138, 115` | `0.585, 0.542, 0.451` |
| `#203A56` | Earth blue | `140` |  | `32, 58, 86` | `0.126, 0.228, 0.338` |
| `#27462D` | Earth green | `141` | `0` | `39, 70, 45` | `0.153, 0.275, 0.177` |
| `#CFE2F7` | Tr. Flu. Blue | `143` |  | `207, 226, 247` | `0.812, 0.887, 0.969` |
| `#7988A1` | Sand blue metallic | `145` |  | `121, 136, 161` | `0.475, 0.534, 0.632` |
| `#958EA3` | Sand violet metallic | `146` |  | `149, 142, 163` | `0.585, 0.557, 0.640` |
| `#938767` | Sand yellow metallic | `147` |  | `147, 135, 103` | `0.577, 0.530, 0.404` |
| `#575857` | Dark grey metallic | `148` |  | `87, 88, 87` | `0.342, 0.346, 0.342` |
| `#161D32` | Black metallic | `149` |  | `22, 29, 50` | `0.087, 0.114, 0.197` |
| `#ABADAC` | Light grey metallic | `150` |  | `171, 173, 172` | `0.671, 0.679, 0.675` |
| `#789082` | Sand green | `151` | `34` | `120, 144, 130` | `0.471, 0.565, 0.510` |
| `#957977` | Sand red | `153` | `114` | `149, 121, 119` | `0.585, 0.475, 0.467` |
| `#7B2E2F` | Dark red | `154` |  | `123, 46, 47` | `0.483, 0.181, 0.185` |
| `#FFF67B` | Tr. Flu. Yellow | `157` |  | `255, 246, 123` | `1.000, 0.965, 0.483` |
| `#E1A4C2` | Tr. Flu. Red | `158` |  | `225, 164, 194` | `0.883, 0.644, 0.761` |
| `#756C62` | Gun metallic | `168` |  | `117, 108, 98` | `0.459, 0.424, 0.385` |
| `#97695B` | Red flip/flop | `176` |  | `151, 105, 91` | `0.593, 0.412, 0.357` |
| `#B48455` | Yellow flip/flop | `178` |  | `180, 132, 85` | `0.706, 0.518, 0.334` |
| `#898788` | Silver flip/flop | `179` |  | `137, 135, 136` | `0.538, 0.530, 0.534` |
| `#D7A94B` | Curry | `180` |  | `215, 169, 75` | `0.844, 0.663, 0.295` |
| `#F9D62E` | Fire Yellow | `190` |  | `249, 214, 46` | `0.977, 0.840, 0.181` |
| `#E8AB2D` | Flame yellowish orange | `191` |  | `232, 171, 45` | `0.910, 0.671, 0.177` |
| `#694028` | Reddish brown | `192` | `103` | `105, 64, 40` | `0.412, 0.251, 0.157` |
| `#CF6024` | Flame reddish orange | `193` |  | `207, 96, 36` | `0.812, 0.377, 0.142` |
| `#A3A2A5` | Medium stone grey | `194` | `123` | `163, 162, 165` | `0.640, 0.636, 0.648` |
| `#4667A4` | Royal blue | `195` |  | `70, 103, 164` | `0.275, 0.404, 0.644` |
| `#23478B` | Dark Royal blue | `196` |  | `35, 71, 139` | `0.138, 0.279, 0.546` |
| `#8E4285` | Bright reddish lilac | `198` |  | `142, 66, 133` | `0.557, 0.259, 0.522` |
| `#635F62` | Dark stone grey | `199` | `122` | `99, 95, 98` | `0.389, 0.373, 0.385` |
| `#828A5D` | Lemon metalic | `200` |  | `130, 138, 93` | `0.510, 0.542, 0.365` |
| `#E5E4DF` | Light stone grey | `208` | `62` | `229, 228, 223` | `0.899, 0.895, 0.875` |
| `#B08E44` | Dark Curry | `209` |  | `176, 142, 68` | `0.691, 0.557, 0.267` |
| `#709578` | Faded green | `210` |  | `112, 149, 120` | `0.440, 0.585, 0.471` |
| `#79B5B5` | Turquoise | `211` |  | `121, 181, 181` | `0.475, 0.710, 0.710` |
| `#9FC3E9` | Light Royal blue | `212` |  | `159, 195, 233` | `0.624, 0.765, 0.914` |
| `#6C81B7` | Medium Royal blue | `213` |  | `108, 129, 183` | `0.424, 0.506, 0.718` |
| `#904C2A` | Rust | `216` |  | `144, 76, 42` | `0.565, 0.299, 0.165` |
| `#7C5C46` | Brown | `217` | `111` | `124, 92, 70` | `0.487, 0.361, 0.275` |
| `#96709F` | Reddish lilac | `218` |  | `150, 112, 159` | `0.589, 0.440, 0.624` |
| `#6B629B` | Lilac | `219` |  | `107, 98, 155` | `0.420, 0.385, 0.608` |
| `#A7A9CE` | Light lilac | `220` |  | `167, 169, 206` | `0.655, 0.663, 0.808` |
| `#CD6298` | Bright purple | `221` |  | `205, 98, 152` | `0.804, 0.385, 0.597` |
| `#E4ADC8` | Light purple | `222` |  | `228, 173, 200` | `0.895, 0.679, 0.785` |
| `#DC9095` | Light pink | `223` |  | `220, 144, 149` | `0.863, 0.565, 0.585` |
| `#F0D5A0` | Light brick yellow | `224` |  | `240, 213, 160` | `0.942, 0.836, 0.628` |
| `#EBB87F` | Warm yellowish orange | `225` |  | `235, 184, 127` | `0.922, 0.722, 0.499` |
| `#FDEA8D` | Cool yellow | `226` | `73` | `253, 234, 141` | `0.993, 0.918, 0.553` |
| `#7DBBDD` | Dove blue | `232` |  | `125, 187, 221` | `0.491, 0.734, 0.867` |
| `#342B75` | Medium lilac | `268` |  | `52, 43, 117` | `0.204, 0.169, 0.459` |
| `#506D54` | Slime green | `301` | `1` | `80, 109, 84` | `0.314, 0.428, 0.330` |
| `#5B5D69` | Smoky grey | `302` | `10` | `91, 93, 105` | `0.357, 0.365, 0.412` |
| `#0010B0` | Dark blue | `303` | `5` | `0, 16, 176` | `0.000, 0.063, 0.691` |
| `#2C651D` | Parsley green | `304` | `7` | `44, 101, 29` | `0.173, 0.397, 0.114` |
| `#527CAE` | Steel blue | `305` | `11` | `82, 124, 174` | `0.322, 0.487, 0.683` |
| `#335882` | Storm blue | `306` | `12` | `51, 88, 130` | `0.200, 0.346, 0.510` |
| `#102ADC` | Lapis | `307` | `13` | `16, 42, 220` | `0.063, 0.165, 0.863` |
| `#3D1585` | Dark indigo | `308` | `14` | `61, 21, 133` | `0.240, 0.083, 0.522` |
| `#348E40` | Sea green | `309` | `16` | `52, 142, 64` | `0.204, 0.557, 0.251` |
| `#5B9A4C` | Shamrock | `310` | `17` | `91, 154, 76` | `0.357, 0.604, 0.299` |
| `#9FA1AC` | Fossil | `311` | `29` | `159, 161, 172` | `0.624, 0.632, 0.675` |
| `#592259` | Mulberry | `312` | `23` | `89, 34, 89` | `0.350, 0.134, 0.350` |
| `#1F801D` | Forest green | `313` | `24` | `31, 128, 29` | `0.122, 0.502, 0.114` |
| `#9FADC0` | Cadet blue | `314` | `39` | `159, 173, 192` | `0.624, 0.679, 0.753` |
| `#0989CF` | Electric blue | `315` | `30` | `9, 137, 207` | `0.036, 0.538, 0.812` |
| `#7B007B` | Eggplant | `316` | `33` | `123, 0, 123` | `0.483, 0.000, 0.483` |
| `#7C9C6B` | Moss | `317` | `35` | `124, 156, 107` | `0.487, 0.612, 0.420` |
| `#8AAB85` | Artichoke | `318` | `36` | `138, 171, 133` | `0.542, 0.671, 0.522` |
| `#B9C4B1` | Sage green | `319` | `37` | `185, 196, 177` | `0.726, 0.769, 0.695` |
| `#CACBD1` | Ghost grey | `320` | `50` | `202, 203, 209` | `0.793, 0.797, 0.820` |
| `#A75E9B` | Lilac | `321` | `42` | `167, 94, 155` | `0.655, 0.369, 0.608` |
| `#7B2F7B` | Plum | `322` | `43` | `123, 47, 123` | `0.483, 0.185, 0.483` |
| `#94BE81` | Olivine | `323` | `47` | `148, 190, 129` | `0.581, 0.746, 0.506` |
| `#A8BD99` | Laurel green | `324` | `48` | `168, 189, 153` | `0.659, 0.742, 0.600` |
| `#DFDFDE` | Quill grey | `325` | `49` | `223, 223, 222` | `0.875, 0.875, 0.871` |
| `#970000` | Crimson | `327` | `56` | `151, 0, 0` | `0.593, 0.000, 0.000` |
| `#B1E5A6` | Mint | `328` | `60` | `177, 229, 166` | `0.695, 0.899, 0.651` |
| `#98C2DB` | Baby blue | `329` | `64` | `152, 194, 219` | `0.597, 0.761, 0.859` |
| `#FF98DC` | Carnation pink | `330` | `65` | `255, 152, 220` | `1.000, 0.597, 0.863` |
| `#FF5959` | Persimmon | `331` | `66` | `255, 89, 89` | `1.000, 0.350, 0.350` |
| `#750000` | Maroon | `332` | `69` | `117, 0, 0` | `0.459, 0.000, 0.000` |
| `#EFB838` | Gold | `333` | `70` | `239, 184, 56` | `0.938, 0.722, 0.220` |
| `#F8D96D` | Daisy orange | `334` | `72` | `248, 217, 109` | `0.973, 0.851, 0.428` |
| `#E7E7EC` | Pearl | `335` | `75` | `231, 231, 236` | `0.906, 0.906, 0.926` |
| `#C7D4E4` | Fog | `336` | `76` | `199, 212, 228` | `0.781, 0.832, 0.895` |
| `#FF9494` | Salmon | `337` | `90` | `255, 148, 148` | `1.000, 0.581, 0.581` |
| `#BE6862` | Terra Cotta | `338` | `79` | `190, 104, 98` | `0.746, 0.408, 0.385` |
| `#562424` | Cocoa | `339` | `81` | `86, 36, 36` | `0.338, 0.142, 0.142` |
| `#F1E7C7` | Wheat | `340` | `84` | `241, 231, 199` | `0.946, 0.906, 0.781` |
| `#FEF3BB` | Buttermilk | `341` | `85` | `254, 243, 187` | `0.997, 0.953, 0.734` |
| `#E0B2D0` | Mauve | `342` | `77` | `224, 178, 208` | `0.879, 0.699, 0.816` |
| `#D490BD` | Sunrise | `343` | `78` | `212, 144, 189` | `0.832, 0.565, 0.742` |
| `#965555` | Tawny | `344` | `91` | `150, 85, 85` | `0.589, 0.334, 0.334` |
| `#8F4C2A` | Rust | `345` | `92` | `143, 76, 42` | `0.561, 0.299, 0.165` |
| `#D3BE96` | Cashmere | `346` | `95` | `211, 190, 150` | `0.828, 0.746, 0.589` |
| `#E2DCBC` | Khaki | `347` | `96` | `226, 220, 188` | `0.887, 0.863, 0.738` |
| `#EDEAEA` | Lily white | `348` | `97` | `237, 234, 234` | `0.930, 0.918, 0.918` |
| `#E9DADA` | Seashell | `349` | `98` | `233, 218, 218` | `0.914, 0.855, 0.855` |
| `#883E3E` | Burgundy | `350` | `102` | `136, 62, 62` | `0.534, 0.244, 0.244` |
| `#BC9B5D` | Cork | `351` | `104` | `188, 155, 93` | `0.738, 0.608, 0.365` |
| `#C7AC78` | Burlap | `352` | `105` | `199, 172, 120` | `0.781, 0.675, 0.471` |
| `#CABFA3` | Beige | `353` | `106` | `202, 191, 163` | `0.793, 0.750, 0.640` |
| `#BBB3B2` | Oyster | `354` | `107` | `187, 179, 178` | `0.734, 0.702, 0.699` |
| `#6C584B` | Pine Cone | `355` | `112` | `108, 88, 75` | `0.424, 0.346, 0.295` |
| `#A0844F` | Fawn brown | `356` | `113` | `160, 132, 79` | `0.628, 0.518, 0.310` |
| `#958988` | Hurricane grey | `357` | `115` | `149, 137, 136` | `0.585, 0.538, 0.534` |
| `#ABA89E` | Cloudy grey | `358` | `116` | `171, 168, 158` | `0.671, 0.659, 0.620` |
| `#AF9483` | Linen | `359` | `117` | `175, 148, 131` | `0.687, 0.581, 0.514` |
| `#966766` | Copper | `360` | `118` | `150, 103, 102` | `0.589, 0.404, 0.400` |
| `#564236` | Medium brown | `361` | `120` | `86, 66, 54` | `0.338, 0.259, 0.212` |
| `#7E683F` | Bronze | `362` | `121` | `126, 104, 63` | `0.495, 0.408, 0.248` |
| `#69665C` | Flint | `363` | `124` | `105, 102, 92` | `0.412, 0.400, 0.361` |
| `#5A4C42` | Dark taupe | `364` | `125` | `90, 76, 66` | `0.353, 0.299, 0.259` |
| `#6A3909` | Burnt Sienna | `365` | `126` | `106, 57, 9` | `0.416, 0.224, 0.036` |
| `#F8F8F8` | Institutional white | `1001` | `86` | `248, 248, 248` | `0.973, 0.973, 0.973` |
| `#CDCDCD` | Mid gray | `1002` | `108` | `205, 205, 205` | `0.804, 0.804, 0.804` |
| `#111111` | Really black | `1003` | `127` | `17, 17, 17` | `0.067, 0.067, 0.067` |
| `#FF0000` | Really red | `1004` | `67` | `255, 0, 0` | `1.000, 0.000, 0.000` |
| `#FFB000` | Deep orange | `1005` | `57` | `255, 176, 0` | `1.000, 0.691, 0.000` |
| `#B480FF` | Alder | `1006` | `41` | `180, 128, 255` | `0.706, 0.502, 1.000` |
| `#A34B4B` | Dusty Rose | `1007` | `80` | `163, 75, 75` | `0.640, 0.295, 0.295` |
| `#C1BE42` | Olive | `1008` | `45` | `193, 190, 66` | `0.757, 0.746, 0.259` |
| `#FFFF00` | New Yeller | `1009` | `58` | `255, 255, 0` | `1.000, 1.000, 0.000` |
| `#0000FF` | Really blue | `1010` | `22` | `0, 0, 255` | `0.000, 0.000, 1.000` |
| `#002060` | Navy blue | `1011` | `6` | `0, 32, 96` | `0.000, 0.126, 0.377` |
| `#2154B9` | Deep blue | `1012` | `4` | `33, 84, 185` | `0.130, 0.330, 0.726` |
| `#04AFEC` | Cyan | `1013` | `40` | `4, 175, 236` | `0.016, 0.687, 0.926` |
| `#AA5500` | CGA brown | `1014` | `93` | `170, 85, 0` | `0.667, 0.334, 0.000` |
| `#AA00AA` | Magenta | `1015` | `55` | `170, 0, 170` | `0.667, 0.000, 0.667` |
| `#FF66CC` | Pink | `1016` | `53` | `255, 102, 204` | `1.000, 0.400, 0.800` |
| `#FFAF00` | Deep orange | `1017` |  | `255, 175, 0` | `1.000, 0.687, 0.000` |
| `#12EED4` | Teal | `1018` | `9` | `18, 238, 212` | `0.071, 0.934, 0.832` |
| `#00FFFF` | Toothpaste | `1019` | `18` | `0, 255, 255` | `0.000, 1.000, 1.000` |
| `#00FF00` | Lime green | `1020` | `27` | `0, 255, 0` | `0.000, 1.000, 0.000` |
| `#3A7D15` | Camo | `1021` | `15` | `58, 125, 21` | `0.228, 0.491, 0.083` |
| `#7F8E64` | Grime | `1022` | `26` | `127, 142, 100` | `0.499, 0.557, 0.393` |
| `#8C5B9F` | Lavender | `1023` | `31` | `140, 91, 159` | `0.550, 0.357, 0.624` |
| `#AFDDFF` | Pastel light blue | `1024` | `38` | `175, 221, 255` | `0.687, 0.867, 1.000` |
| `#FFC9C9` | Pastel orange | `1025` | `89` | `255, 201, 201` | `1.000, 0.789, 0.789` |
| `#B1A7FF` | Pastel violet | `1026` | `52` | `177, 167, 255` | `0.695, 0.655, 1.000` |
| `#9FF3E9` | Pastel blue-green | `1027` | `28` | `159, 243, 233` | `0.624, 0.953, 0.914` |
| `#CCFFCC` | Pastel green | `1028` | `61` | `204, 255, 204` | `0.800, 1.000, 0.800` |
| `#FFFFCC` | Pastel yellow | `1029` | `74` | `255, 255, 204` | `1.000, 1.000, 0.800` |
| `#FFCC99` | Pastel brown | `1030` | `99` | `255, 204, 153` | `1.000, 0.800, 0.600` |
| `#6225D1` | Royal purple | `1031` | `32` | `98, 37, 209` | `0.385, 0.146, 0.820` |
| `#FF00BF` | Hot pink | `1032` | `54` | `255, 0, 191` | `1.000, 0.000, 0.750` |

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#new\|new()]] | `val` | Constructs a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] from its numerical index. |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#new\|new()]] | `r`, `g`, `b` | Constructs the closest [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] that can be matched to the specified RGB components. |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#new\|new()]] | `name` | Constructs a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] from its name. |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#new\|new()]] | `color` | Constructs the closest [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] that can be matched to the specified [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#palette\|palette()]] | `paletteValue` | Constructs a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] from its palette index. |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#random\|random()]] |  | Returns a random [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#White\|White()]] |  | Returns the "White" [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#Gray\|Gray()]] |  | Returns the "Medium stone grey" [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#DarkGray\|DarkGray()]] |  | Returns the "Dark stone grey" [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#Black\|Black()]] |  | Returns the "Black" [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#Red\|Red()]] |  | Returns the "Bright red" [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#Yellow\|Yellow()]] |  | Returns the "Bright yellow" [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#Green\|Green()]] |  | Returns the "Dark green" [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#Blue\|Blue()]] |  | Returns the "Bright blue" [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#Number\|Number]] | number | The unique number that identifies the [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#r\|r]] | number | The red component of the [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] (between 0 and 1). |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#g\|g]] | number | The green component of the [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] (between 0 and 1). |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#b\|b]] | number | The blue component of the [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] (between 0 and 1). |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#Name\|Name]] | string | The name associated with the [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | The [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] associated with the [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |

## Constructors

### new

```lua
BrickColor.new(val: number): BrickColor
```

Constructs a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] from its numerical index (**Number** in color reference table). If the provided number does not correspond to a valid [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]], the constructor returns the default "Medium stone grey".

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `val` | number |  | The unique numerical index that identifies a brick color. |

### new

```lua
BrickColor.new(r: number, g: number, b: number): BrickColor
```

Constructs the closest [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] that can be matched to the specified RGB components, each between `0` and `1`. The match is determined by finding the [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] whose color has the smallest total distance (sum of absolute differences per channel) from the given values across all known brick colors.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `r` | number |  | The red component of the desired color, between `0` and `1`. |
| `g` | number |  | The green component of the desired color, between `0` and `1`. |
| `b` | number |  | The blue component of the desired color, between `0` and `1`. |

### new

```lua
BrickColor.new(name: string): BrickColor
```

Constructs a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] from its name, for example `"Pastel Blue"`. The name must match one of the entries in the color table exactly. If the name does not match a known [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]], the constructor returns the default "Medium stone grey".

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The exact name of the brick color as listed in the color table. |

### new

```lua
BrickColor.new(color: Color3): BrickColor
```

Constructs the closest [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] that can be matched to the specified [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]. The match uses the same closest-color algorithm as `Datatype.BrickColor.new(r, g, b)`, comparing the [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] against every known brick color and returning the one with the smallest total channel distance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `color` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] to match against all known brick colors. |

### palette

```lua
BrickColor.palette(paletteValue: number): BrickColor
```

Constructs a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] from its zero-based 128-color palette index (**Palette Index** in color reference table). This is the same palette shown in the Studio color picker. An error is thrown if the index is out of bounds.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `paletteValue` | number |  | A zero-based index into the 128-color palette (`0` through `127`). |

### random

```lua
BrickColor.random(): BrickColor
```

Returns a random [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] selected from the 128-color palette. Each call may return a different color.

### White

```lua
BrickColor.White(): BrickColor
```

Returns the "White" [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

### Gray

```lua
BrickColor.Gray(): BrickColor
```

Returns the "Medium stone grey" [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]. This is the same color used as the default when a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] cannot be resolved.

### DarkGray

```lua
BrickColor.DarkGray(): BrickColor
```

Returns the "Dark stone grey" [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

### Black

```lua
BrickColor.Black(): BrickColor
```

Returns the "Black" [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

### Red

```lua
BrickColor.Red(): BrickColor
```

Returns the "Bright red" [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

### Yellow

```lua
BrickColor.Yellow(): BrickColor
```

Returns the "Bright yellow" [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

### Green

```lua
BrickColor.Green(): BrickColor
```

Returns the "Dark green" [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

### Blue

```lua
BrickColor.Blue(): BrickColor
```

Returns the "Bright blue" [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

## Properties

### Number

**Type:** number

The unique number that identifies the [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]. This is the same integer used by [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#new|BrickColor.new()]] to construct the color and corresponds to the **Number** column in the color table above. Read-only.

### r

**Type:** number

The red component of the [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] (between `0` and `1`). This is equivalent to `BrickColor.Color.R`. Read-only.

### g

**Type:** number

The green component of the [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] (between `0` and `1`). This is equivalent to `BrickColor.Color.G`. Read-only.

### b

**Type:** number

The blue component of the [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] (between `0` and `1`). This is equivalent to `BrickColor.Color.B`. Read-only.

### Name

**Type:** string

The name associated with the [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]], for example `"Pastel Blue"`. This is the same string accepted by [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor#new|BrickColor.new()]]. Read-only.

### Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

The [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] associated with the [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]. The individual components of this value are the same as `BrickColor.r`, `BrickColor.g`, and `BrickColor.b`. Read-only.

---
*Source: [BrickColor](https://create.roblox.com/docs/reference/engine/datatypes/BrickColor) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
