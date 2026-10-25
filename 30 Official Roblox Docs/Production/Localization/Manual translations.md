---
title: "Manual translations"
description: "Learn how to manually add, edit, and remove entries to your game's cloud localization table."
area: "30 Official Roblox Docs"
cluster: "Production"
source: "https://create.roblox.com/docs/production/localization/manual-translations"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Learn how to manually add, edit, and remove entries to your game's cloud localization table.*

When localizing your content, you might need to manually modify your localization table to improve translation quality, add context for when a translation should be used, or even remove unused translation entries.

Whether you have translation entries automatically captured or manually added, all the translation entries are saved to the [[30 Official Roblox Docs/Production/Localization/Manual translations#Cloud localization table|cloud localization table]]. To modify the localization table, you can perform the following actions:

- [[30 Official Roblox Docs/Production/Localization/Add source content|Add source content]] to the table, either manually or automatically.
- [[30 Official Roblox Docs/Production/Localization/Remove content|Remove content]] from the table, such as usernames or other strings that shouldn't be translated.
- [[30 Official Roblox Docs/Production/Localization/Add translations|Add translations]] to entries in the table for any supported languages set in your game.

Before making any changes to your table, it's important to understand each field in the [[30 Official Roblox Docs/Production/Localization/Manual translations#Cloud localization table|cloud localization table]] to prevent issues or conflicts.

> [!info]
> Users with Automatic Translations enabled in their Roblox account settings will still see all manually added translations in your game. See [[30 Official Roblox Docs/Production/Localization/Localization#User-facing setting|User-facing setting]] for more information.

## Cloud localization table

The localization table is the reference for all translations within your game. It's important to understand each field of the localization table to effectively add or modify entries.

When populated, the table contains all user-facing content within your game that requires translation along with any available translations for specific languages. You can [[30 Official Roblox Docs/Production/Localization/Add source content|add source content]] and [[30 Official Roblox Docs/Production/Localization/Add translations|add translations]] to the Cloud Localization Table or [[30 Official Roblox Docs/Production/Localization/Add translations#With file upload|download and upload a .csv version of your table]]. Only users who have edit permission for a game can access a game's localization table.

The localization table has the following columns:

| Column | Description |
| --- | --- |
| Source | A required field containing the in-game source text strings gathered by automatic text capture or manual entry. This is the source text that you intend to translate to other languages. Source text is required before you can add a translation and multiple entries can share the same Source, as long as they have unique **Context** fields. <br> <br>If you are translating dynamic content, such as partial strings, the Source field must follow one of the supported parameter formats described in [[30 Official Roblox Docs/Production/Localization/Translate dynamic content\|Translate dynamic content]]. |
| Context | An optional field containing a reference to the in-game object containing the source text. You can use the Context field to specify which translation Roblox displays on an object. See [[30 Official Roblox Docs/Production/Localization/Localize with scripting#Use context overrides\|Using Context Overrides]] for more details. <br> <br> The Automatic Text Capture system does not auto-fill the Context field and instead populates the **Location** field with similar information. |
| Example | An optional field containing any additional information about an entry you may want to include as notes for translators. You can use this field to show manual translators where and when your game uses a specific translation. |
| Key | An optional field for implementing [[30 Official Roblox Docs/API Reference/Classes/Translator#FormatByKey\|key-based lookup]] when using localization APIs. You can leave this field empty if you are not using [[30 Official Roblox Docs/Production/Localization/Localize with scripting\|localization APIs]] for specific tasks, such as localizing images and sounds. |
| Location | A field that is auto-filled by the [[30 Official Roblox Docs/Production/Localization/Manual translations\|Automatic Text Capture]] system. It contains a reference to the in-game object containing the source text which can help you or a translator identify where the string is being encountered in your game. This field is either blank or populated by the Automatic Text Capture System. To manually add your own object reference, use the **Context** field. |

> [!warning]
> Some fields in the localization table must be unique to avoid unexpected behavior. Keep in mind the following:
>
> - For all entries, the **Source** field must not be empty.
> - No two entries can share the same **Source and Context** values.
> - No two entries can share the same **Key**.

---
*Source: [Manual translations](https://create.roblox.com/docs/production/localization/manual-translations) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
