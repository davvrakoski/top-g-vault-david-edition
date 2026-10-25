---
title: "Localization"
description: "An overview of localization tools you can use to make sure all users can understand and enjoy content within games."
area: "30 Official Roblox Docs"
cluster: "Production"
source: "https://create.roblox.com/docs/production/localization"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*An overview of localization tools you can use to make sure all users can understand and enjoy content within games.*

Roblox users come from a variety of cultures around the world and speak
different languages. Using **localization** tools effectively makes sure all
users can understand and enjoy your game as intended. Any game can immediately take advantage of Roblox's automatic localization tools to instantly expand your potential audience. As your game grows, use Roblox's various localization API tools, manual translator portals, and analytics, to ensure that users from around the world can fully participate and socialize in your game.

*(image in the full Top G Vault)*

## User-facing setting

Every user has an **Automatic Translations** setting in their [Account Settings](https://www.roblox.com/my/account#!/info) page that allows them to turn on automatic translation for game content. If a player has this setting turned on, all game names, game descriptions, and in-game text will be translated for them, even if you have not explicitly enabled translation for your game.

If you add any [[30 Official Roblox Docs/Production/Localization/Localization#Manual translations|manual translations]] to your game, **they will always be shown to players**. Roblox only automatically generates translations if they are missing. To preview and manage translations, follow the steps below to enable localization settings for your game.

There may be text in your game that should never be translated (for example, NPC names or street signs). To ensure translations are not generated for them, you can disable the [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AutoLocalize|AutoLocalize]] property for those objects in Studio.

## Localization settings

Your game's localization settings is the starting place for enabling
translations and accessing your localization tools. You'll need to set your
[[30 Official Roblox Docs/Production/Localization/Localization#Set source language|source]] and [[30 Official Roblox Docs/Production/Localization/Localization#Set supported languages|supported]]
languages before starting any localization to a new language.

The localization page also includes tools to start translating your games, add translation collaborators and download translation analytics.

You can access your game's localization settings through the Creator Dashboard main page:

1. Navigate to the [Creator Dashboard](https://create.roblox.com).
2. Hover over your game and click **Manage Experience**.
3. In the left navigation, navigate to **Audience** → **Localization**.

You can also access your game's localization settings in the on your [Creations](https://create.roblox.com/dashboard/creations) page:

1. Navigate to your [Creator Dashboard](https://create.roblox.com/dashboard/creations).
2. In the **Experiences** tab, find your game and select the **⋯** button.
3. Select **Configure Localization**.

   *(image in the full Top G Vault)*

### Set source language

Before you can start any localization, Roblox needs to know which language you
are translating from and which languages you are translating to.

The **source language** is the primary language that the
game has been written in. Roblox currently only supports one source
language at a time. The default is set to your [Roblox account language](https://www.roblox.com/my/account#!/info).

To set the **source** language:

1. In the localization settings, navigate to **Languages** and select the **Source Language** dropdown.

   *(image in the full Top G Vault)*

2. Select a language from the list.
3. Click **Confirm** to add the language.

### Set supported languages

The **supported languages** are the languages you intend to provide translations
for. You can have multiple supported languages for your game. See
[[30 Official Roblox Docs/Production/Localization/Language codes|language codes]] for a list of all languages Roblox supports.
To set the **supported** languages:

1. In the localization settings, navigate to
   **Languages** and select the **Source Language**.
2. In the **Supported Languages** section, click **Add Language** to add the
   languages you intend to localize to.

   *(image in the full Top G Vault)*

3. Click the input box and type in the language you would like to add, or select
   from the list of languages.

   *(image in the full Top G Vault)*

4. Click **Confirm** to add the language.

## Automatic translations

Roblox's automatic translation tool is available on any game and allows you to immediately begin localizing the strings in your game and broadening your potential audience. In many cases, you can start making significant progress on your localization journey using automatic translations before adding [[30 Official Roblox Docs/Production/Localization/Localization#Manual translations|manual translations]] or working with [[30 Official Roblox Docs/Production/Localization/Localization#Work with translators|translators]].

For more information on enabling automatic translations in your game, see [[30 Official Roblox Docs/Production/Localization/Automatic translation|Automatic translations]].

## Manual translations

Apply various customizations to your translations to improve and expand your game's localization. You, or any assigned translator, can manually add and modify translations to your game's translation table. You can also access this table programmatically, allowing you to create contextual translations, switch out images or assets based on language, or even manually display translations from a different language.

For more information on custom translation use-cases, see [[30 Official Roblox Docs/Production/Localization/Manual translations|Translate in-game content]].

## Work with translators

Add Roblox users as translators for your game to help you review and polish automatic translations or provide and edit manual translations.

You can download monthly analytics to track your translation coverage and the contribution of your translators. For more information on working with localization contributors, see [[30 Official Roblox Docs/Production/Localization/Work with translators|Work with translators]].

---
*Source: [Localization](https://create.roblox.com/docs/production/localization) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
