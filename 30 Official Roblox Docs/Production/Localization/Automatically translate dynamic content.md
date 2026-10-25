---
title: "Automatically translate dynamic content"
description: "Explain how to generate translations in real time for dynamic content."
area: "30 Official Roblox Docs"
cluster: "Production"
source: "https://create.roblox.com/docs/production/localization/auto-translate-dynamic-content"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explain how to generate translations in real time for dynamic content.*

> [!warning]
> The following feature is currently in early development and is subject to change. For the latest updates and changes, see the [announcement](https://devforum.roblox.com/t/introducing-the-real-time-translation-api/3550206).

The standard translation workflow detects strings in your game based on how frequently they're viewed by players and adds them to your localization table for translation. It might miss uncommon strings and/or strings generated during gameplay, such as dynamically generated text or text created by players. You can use the translate text API to generate translations for these strings in real time, ensuring that your game is fully localized.

## Translate text into a player's language

To translate text into a player's language, pass their [[30 Official Roblox Docs/API Reference/Classes/Player#LocaleId|Player.LocaleId]] as the target language code. Below is an example of how you can get the player's locale ID in a client script and then pass it to a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] in [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] to make the translation request.

- The translation API is an [[30 Official Roblox Docs/Cloud/Cloud API reference|Open Cloud API]], meaning you need a [[30 Official Roblox Docs/Cloud/Reference/Patterns|path]] to make a request. In this case, you need the universe ID, which can be found in the overflow menu of the game tile on the [Creator Hub](https://create.roblox.com/dashboard/creations).
- You must also include the [[30 Official Roblox Docs/Production/Promotion/Experience notifications#Include the package|Open Cloud client package]] in your game; the server script requires it.

```lua title="Client script"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local httpRequestFunction = ReplicatedStorage:WaitForChild("TranslateTextFunction")

-- Text to translate
local textToTranslate = "This is the example text to translate"

-- Get the player's locale
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- get the locale ID for the local player's locale or set to any supported locale string
local locale = player.LocaleId

local translatedText = httpRequestFunction:InvokeServer(textToTranslate, locale)

print("Translated text: ", translatedText)
```

```lua title="Server script in ServerScriptService"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local oc = require(ServerScriptService.OpenCloud.V2)

-- Find at https://create.roblox.com/dashboard/creations in the overflow menu of a game tile
local universeID = <your_universe_id>

-- Create RemoteFunction
local remoteFunction = Instance.new("RemoteFunction")
remoteFunction.Name = "TranslateTextFunction"
remoteFunction.Parent = ReplicatedStorage

remoteFunction.OnServerInvoke = function(player, text, locale, uni)

    print(player.Name .. " requested translation for text: " .. text .. " to locale: " .. locale)

    -- Prepare the translation request

    local request : oc.TranslateTextRequest = {
        path = oc:UniversePath(universeID),
        text = text,
	      -- target language codes supports a list of multiple locales to translate to.
	      -- Here we are passing just one language:
        --The player locale retrieved in the local script
        target_language_codes = {locale}
    }

    local result = oc:TranslateText(request)

    if result.Error == nil then
        return result.Response.translations[locale] -- Assuming translations[locale] contains the translated text
    else
        return "Error: " .. result.Error.message
    end
end
```

## Testing

The real-time translation API currently only supports RCC authentication. As a result, you must deploy your code to a test instance in order to test the API from Studio. Use [[30 Official Roblox Docs/Studio/Studio testing modes#Collaborative testing|collaborative testing]] to deploy the script to a test instance and test your changes.

## Translation API reference

### API request parameters

| Parameter Name | Type | Description |
| --- | --- | --- |
| path | string | The path of the universe. Required. |
| text | string | The text to be translated. Required. |
| source_language_code | string | The IETF BCP-47 language code representing the language of the input text. If not provided, the system will automatically detect the source language. |
| target_language_codes | `Array<string>` | A list of target language codes in IETF BCP-47 format for translation. |

### API response fields

| Field Name | Type | Description |
| --- | --- | --- |
| source_language_code | string | The IETF BCP-47 language code representing the detected or user-specified language of the source text. |
| translations | `Dictionary<string, string>` | A map containing the requested translations. The key is the IETF BCP-47 language code, and the value is the translated text for that language. The map will contain all requested translations. If the source text was filtered, this map will be empty. |

## Limits

Roblox uses the following formula to throttle requests for this API based on the number of players in your game:

`max requests per minute per game = 600 + (1.5 * number_of_concurrent_users)`

There is also a combined limit of 150 requests per minute, per game server for all Open Cloud APIs.

## Supported languages

The real-time translation API currently supports the following languages, which differ slightly from [[30 Official Roblox Docs/Production/Localization/Automatic translation#Supported languages|supported languages for automatic translation]].

| Language | Language Code |
| --- | --- |
| Chinese (Simplified) | zh-cn |
| Chinese (Traditional) | zh-tw |
| English | en-us |
| French | fr-fr |
| German | de-de |
| Indonesian | id-id |
| Italian | it-it |
| Japanese | ja-jp |
| Korean | ko-kr |
| Polish | pl-pl |
| Portuguese | pt-br |
| Russian | ru-ru |
| Spanish | es-es |
| Thai | th-th |
| Turkish | tr-tr |
| Vietnamese | vi-vn |

---
*Source: [Automatically translate dynamic content](https://create.roblox.com/docs/production/localization/auto-translate-dynamic-content) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
