---
title: "Work with translators"
description: "Explains the benefit of working with a native speaker to assist with localization efforts."
area: "30 Official Roblox Docs"
cluster: "Production"
source: "https://create.roblox.com/docs/production/localization/work-with-translators"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains the benefit of working with a native speaker to assist with localization efforts.*

When translating content in your game to a language that you are not familiar with, it's beneficial to work with a native speaker of that language to add or review any translations. Use the following tools to manage translators for your game:

- [[30 Official Roblox Docs/Production/Localization/Work with translators#Add translators|Add other Roblox users or groups]] to help you translate your game,
- [[30 Official Roblox Docs/Production/Localization/Work with translators#Translation analytics|Access localization reports]] to track the contributions and translation coverage of your Roblox translators.
- Share the `.csv` file of your localization table with a [[30 Official Roblox Docs/Production/Localization/Work with translators#Work with non-Roblox translators|Non-Roblox translator]].

> [!warning]
> Before working with any translators, make sure you set your [[30 Official Roblox Docs/Production/Localization/Localization#Set source language|source]] and [[30 Official Roblox Docs/Production/Localization/Localization#Set supported languages|supported languages]] in the game's localization settings.

## Add translators

You can add Roblox users or groups as translators in your game's [[30 Official Roblox Docs/Production/Localization/Localization#Localization settings|localization page]]. Adding Roblox users as translators allows you to leverage all the benefits of Roblox's translation tools such as managing group-level permissions and viewing translation analytics.

Game owners and translators can manage, edit, and review translations and translators. Translators can see your string entries and edit translations for any of your supported languages. Translators can not configure any localization settings, add or delete any localization table entries, or grant translator permissions to any users or groups.

To add a Roblox user or group as a translator:

1. Navigate to your game's **Localization Page**.
2. Navigate to the **Translators** tab.

   *(image in the full Top G Vault)*

3. Click the **Invite Translators** button.
4. If adding an individual, select either by **Username** or by **User ID** under the options and select the correct user from the dropdown.

   *(image in the full Top G Vault)*

5. If adding a group, input the **group ID** and select the right group from the dropdown and the selected roles.
6. Click **Confirm** once you have selected the users or groups you want to add.

## Access the Translator Portal

All translators that you add to your game can access the **Translator Portal**, a translator specific page that provides access to your game's localization table.

In the Translator Portal, translators can edit translations for all supported languages, and see translation history, including the time the translation was added and the translation contributor.

To share a direct link to your game's Translator Portal:

1. Navigate to the **Translators** tab.
2. Copy the link by clicking the **Share Link** button.
3. Send the link to any Roblox user with translator permissions so they can access the Translator Portal directly.

To access a game's Translator Portal from the Creator Dashboard:

1. Navigate to the [Creator Dashboard](https://create.roblox.com).
2. Navigate to the Translator Portal via the left navigation.
3. Select the game you want to translate, or search for it via the search bar.
   *(image in the full Top G Vault)*

## Translation analytics

As translators add translations, Roblox compiles translation reports every two weeks that give you visibility into what your translation coverage looks like for each supported language and which translators have been contributing.

To download a translation report:

1. In your game's localization page, click **Reports**.
2. Select a date range for the report in the dropdown.
3. Click **Download**.

   *(image in the full Top G Vault)*

## Work with non-Roblox translators

You can work with translators who do not have Roblox accounts by downloading your game's localization table as a `.csv` and having your translators add directly to the spreadsheet file. Once your translators have added their contributions, you can re-upload the `.csv` file through Studio. When adding translations through this workflow, translation analytics does not capture translator contributions and detailed history.

See [[30 Official Roblox Docs/Production/Localization/Manual translations|Add translations with file upload]] for more information on downloading your game's localization spreadsheet.

---
*Source: [Work with translators](https://create.roblox.com/docs/production/localization/work-with-translators) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
