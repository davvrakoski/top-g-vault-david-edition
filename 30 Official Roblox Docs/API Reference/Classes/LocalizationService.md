---
title: "LocalizationService"
description: "Handles automated translation."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/LocalizationService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Handles automated translation.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

LocalizationService is the service responsible for handling automated translation.

It is used as a storage for [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] objects used by automatic text replacement.

LocalizationService will only use its child LocalizationTables for automatic text replacement unless [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#RootLocalizationTable|GuiBase2d.RootLocalizationTable]] is specified on a GUI object or its ancestors.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#RobloxLocaleId\|RobloxLocaleId]] | string | The locale ID used for localizing core and internal features. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#SystemLocaleId\|SystemLocaleId]] | string | The locale ID that the local player has set for their operating system. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#GetCorescriptLocalizations\|GetCorescriptLocalizations()]] | Instances | Returns a list of [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable\|LocalizationTable]] objects used for localizing core scripts. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#GetCountryRegionForPlayerAsync\|GetCountryRegionForPlayerAsync()]] | string | Returns country/region code string according to player's client IP geolocation. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#GetTableEntries\|GetTableEntries()]] | Array | Gets all entries used for automated localization. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#GetTranslatorForLocaleAsync\|GetTranslatorForLocaleAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Yields until the cloud [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable\|LocalizationTable]] for the argument locale has been loaded - if available. Returns a [[30 Official Roblox Docs/API Reference/Classes/Translator\|Translator]] instance to be used for translations for the provided locale. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#GetTranslatorForPlayer\|GetTranslatorForPlayer()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.** Returns a [[30 Official Roblox Docs/API Reference/Classes/Translator\|Translator]] to be used for translations using the locale data loaded. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#GetTranslatorForPlayerAsync\|GetTranslatorForPlayerAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Yields until the cloud [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable\|LocalizationTable]] for the player's locale has been loaded - if available. Returns a [[30 Official Roblox Docs/API Reference/Classes/Translator\|Translator]] instance to be used for translations for the provided locale. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### RobloxLocaleId

**Type:** string

**Thread safety:** ReadSafe · **Category:** Localization · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

This property shows the locale ID used for the localization of core and internal features such as [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]]. Returns a string with the two letter code (for example, `en-us`) for the locale.

### SystemLocaleId

**Type:** string

**Thread safety:** ReadSafe · **Category:** Localization · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

This property shows the locale ID that the local player has set for their operating system.

This will return a string with the two letter code (for example, "en-us") for the locale.

See also [[30 Official Roblox Docs/API Reference/Classes/Player#LocaleId|Player.LocaleId]], the locale ID that a user has set for their Roblox account which is used for localizing in-experience content. This will be a different value when that player's account locale isn't supported for localizing Roblox UI content.

## Methods

### GetCorescriptLocalizations

```lua
LocalizationService:GetCorescriptLocalizations(): Instances
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns a list of [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] objects used for localizing core scripts.

**Returns**

| Type | Description |
| --- | --- |
| Instances | A list of [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable\|LocalizationTable]] objects used for localizing CoreScripts. |

### GetCountryRegionForPlayerAsync

```lua
LocalizationService:GetCountryRegionForPlayerAsync(player: Instance): string
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

Returns a country/region code string according to player's client IP geolocation. The supported country/region codes are as follows:

| Code | Country/Region |
| --- | --- |
| XX | Unknown Country |
| US | United States |
| GB | United Kingdom |
| CA | Canada |
| AF | Afghanistan |
| AX | Aland Islands |
| AL | Albania |
| DZ | Algeria |
| AS | American Samoa |
| AD | Andorra |
| AO | Angola |
| AI | Anguilla |
| AQ | Antarctica |
| AG | Antigua and Barbuda |
| AR | Argentina |
| AM | Armenia |
| AW | Aruba |
| AU | Australia |
| AT | Austria |
| AZ | Azerbaijan |
| BS | Bahamas |
| BH | Bahrain |
| BD | Bangladesh |
| BB | Barbados |
| BY | Belarus |
| BE | Belgium |
| BZ | Belize |
| BJ | Benin |
| BM | Bermuda |
| BT | Bhutan |
| BO | Bolivia |
| BQ | Bonaire, Saint Eustatius and Saba |
| BA | Bosnia and Herzegovina |
| BW | Botswana |
| BV | Bouvet Island |
| BR | Brazil |
| IO | British Indian Ocean Territory |
| BN | Brunei Darussalam |
| BG | Bulgaria |
| BF | Burkina Faso |
| BI | Burundi |
| KH | Cambodia |
| CM | Cameroon |
| CV | Cape Verde |
| KY | Cayman Islands |
| CF | Central African Republic |
| TD | Chad |
| CL | Chile |
| CN | China |
| CX | Christmas Island |
| CC | Cocos Islands |
| CO | Colombia |
| KM | Comoros |
| CG | Congo |
| CD | Congo (DRC) |
| CK | Cook Islands |
| CR | Costa Rica |
| CI | Ivory Coast |
| HR | Croatia |
| CW | Curaçao |
| CY | Cyprus |
| CZ | Czech Republic |
| DK | Denmark |
| DJ | Djibouti |
| DM | Dominica |
| DO | Dominican Republic |
| EC | Ecuador |
| EG | Egypt |
| SV | El Salvador |
| GQ | Equatorial Guinea |
| ER | Eritrea |
| EE | Estonia |
| ET | Ethiopia |
| FK | Falkland Islands (Malvinas) |
| FO | Faroe Islands |
| FJ | Fiji |
| FI | Finland |
| FR | France |
| GF | French Guiana |
| PF | French Polynesia |
| TF | French Southern Territories |
| GA | Gabon |
| GM | Gambia |
| GE | Georgia |
| DE | Germany |

| Code | Country/Region |
| --- | --- |
| GH | Ghana |
| GI | Gibraltar |
| GR | Greece |
| GL | Greenland |
| GD | Grenada |
| GP | Guadeloupe |
| GU | Guam |
| GT | Guatemala |
| GG | Guernsey |
| GN | Guinea |
| GW | Guinea-Bissau |
| GY | Guyana |
| HT | Haiti |
| HM | Heard Island and the McDonald Islands |
| VA | Holy See |
| HN | Honduras |
| HK | Hong Kong |
| HU | Hungary |
| IS | Iceland |
| IN | India |
| ID | Indonesia |
| IQ | Iraq |
| IE | Ireland |
| IM | Isle of Man |
| IL | Israel |
| IT | Italy |
| JM | Jamaica |
| JP | Japan |
| JE | Jersey |
| JO | Jordan |
| KZ | Kazakhstan |
| KE | Kenya |
| KI | Kiribati |
| KR | Korea |
| KW | Kuwait |
| KG | Kyrgyzstan |
| LA | Laos |
| LV | Latvia |
| LB | Lebanon |
| LS | Lesotho |
| LR | Liberia |
| LY | Libya |
| LI | Liechtenstein |
| LT | Lithuania |
| LU | Luxembourg |
| MO | Macao |
| MK | Macedonia |
| MG | Madagascar |
| MW | Malawi |
| MY | Malaysia |
| MV | Maldives |
| ML | Mali |
| MT | Malta |
| MH | Marshall Islands |
| MQ | Martinique |
| MR | Mauritania |
| MU | Mauritius |
| YT | Mayotte |
| MX | Mexico |
| FM | Micronesia |
| MD | Moldova |
| MC | Monaco |
| MN | Mongolia |
| ME | Montenegro |
| MS | Montserrat |
| MA | Morocco |
| MZ | Mozambique |
| MM | Myanmar |
| NA | Namibia |
| NR | Nauru |
| NP | Nepal |
| NL | Netherlands |
| AN | Netherlands Antilles |
| NC | New Caledonia |
| NZ | New Zealand |
| NI | Nicaragua |
| NE | Niger |
| NG | Nigeria |
| NU | Niue |
| NF | Norfolk Island |
| MP | Northern Mariana Islands |
| NO | Norway |
| OM | Oman |

| Code | Country/Region |
| --- | --- |
| PK | Pakistan |
| PW | Palau |
| PS | Palestine |
| PA | Panama |
| PG | Papua New Guinea |
| PY | Paraguay |
| PE | Peru |
| PH | Philippines |
| PN | Pitcairn Islands |
| PL | Poland |
| PT | Portugal |
| PR | Puerto Rico |
| QA | Qatar |
| RE | Reunion |
| RO | Romania |
| RU | Russian Federation |
| RW | Rwanda |
| BL | Saint Barthelemy |
| SH | Saint Helena, Ascension and Tristan da Cunha |
| KN | Saint Kitts and Nevis |
| LC | Saint Lucia |
| MF | Saint Martin |
| PM | Saint Pierre and Miquelon |
| VC | Saint Vincent and the Grenadines |
| WS | Samoa |
| SM | San Marino |
| ST | Sao Tome and Principe |
| SA | Saudi Arabia |
| SN | Senegal |
| RS | Serbia |
| SC | Seychelles |
| SL | Sierra Leone |
| SG | Singapore |
| SX | Sint Maarten |
| SK | Slovakia |
| SI | Slovenia |
| SB | Solomon Islands |
| SO | Somalia |
| ZA | South Africa |
| GS | South Georgia and the South Sandwich Islands |
| SS | South Sudan |
| ES | Spain |
| LK | Sri Lanka |
| SR | Suriname |
| SJ | Svalbard and Jan Mayen |
| SZ | Swaziland |
| SE | Sweden |
| CH | Switzerland |
| TW | Taiwan |
| TJ | Tajikistan |
| TZ | Tanzania |
| TH | Thailand |
| TL | Timor-Leste |
| TG | Togo |
| TK | Tokelau |
| TO | Tonga |
| TT | Trinidad and Tobago |
| TN | Tunisia |
| TR | Türkiye (Turkey) |
| TM | Turkmenistan |
| TC | Turks and Caicos Islands |
| TV | Tuvalu |
| UG | Uganda |
| UA | Ukraine |
| AE | United Arab Emirates |
| UM | United States Minor Outlying Islands |
| UY | Uruguay |
| UZ | Uzbekistan |
| VU | Vanuatu |
| VE | Venezuela |
| VN | Vietnam |
| VG | Virgin Islands (British) |
| VI | Virgin Islands (US) |
| WF | Wallis and Futuna |
| EH | Western Sahara |
| YE | Yemen |
| ZM | Zambia |
| ZW | Zimbabwe |
| CU | Cuba |
| IR | Iran |
| SY | Syria |
| KP | North Korea |

See also:

- [[30 Official Roblox Docs/API Reference/Classes/PolicyService#GetPolicyInfoForPlayerAsync|PolicyService:GetPolicyInfoForPlayerAsync()]], returns policy information about a player which is based on geolocation, age group and platform

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The player that you are getting country/region information for. |

**Returns**

| Type | Description |
| --- | --- |
| string | A string indicating the country/region code of a player. |

*Code samples for this member (`getting-country-region-code-for-a-player`) are published on the source page; their code is not part of the open-source repo.*

### GetTableEntries

```lua
LocalizationService:GetTableEntries(instance: Instance = nil): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns an `Array`, where each element of the returned `Array` is itself an `Array` of entries in the same format as described in [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#GetEntries|LocalizationTable:GetEntries()]]. The order of the elements in the returned `Array` is the same order that the [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTables]] will be searched through to attempt automated localization for the provided [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]. The entry elements within a particular [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] are returned in an unspecified order.

This function returns entries regardless of whether the object is a [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] with [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AutoLocalize|GuiBase2d.AutoLocalize]] enabled. An object that is a [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] will not actually be automatically localized unless [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AutoLocalize|GuiBase2d.AutoLocalize]] is enabled.

The ordering of the tables is as follows:

- First, it looks for the earliest [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] ancestor of the object (including the provided object) that has a [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#RootLocalizationTable|GuiBase2d.RootLocalizationTable]]. Tables then append in the same order as described in [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#RootLocalizationTable|GuiBase2d.RootLocalizationTable]] by going up through the [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] ancestors of that [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#RootLocalizationTable|GuiBase2d.RootLocalizationTable]]. If no such [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#RootLocalizationTable|GuiBase2d.RootLocalizationTable]] is found, no tables append in this step. If `instance` is `nil`, no tables append in this step.
- Next, tables from the [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] hierarchy under [[30 Official Roblox Docs/API Reference/Classes/LocalizationService|LocalizationService]] append. For each child [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] of [[30 Official Roblox Docs/API Reference/Classes/LocalizationService|LocalizationService]], it appends tables going up from the lowest descendant [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] of the tables parented to the service, all the way up to the children of the service. If there are no children of [[30 Official Roblox Docs/API Reference/Classes/LocalizationService|LocalizationService]] that are [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTables]], then no tables append in this step.
- Finally, the cloud [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] appends to the array. If there is no cloud [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]], or the cloud [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] has not yet loaded, then no table appends in this step.

This function does not yield. It will not wait until the cloud [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] has loaded.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] for which to retrieve the ordered localization table entries. If nil, only entries from the [[30 Official Roblox Docs/API Reference/Classes/LocalizationService\|LocalizationService]] hierarchy and the cloud [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable\|LocalizationTable]] are returned. |

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of arrays, where each array is in the same format as described in [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#GetEntries\|LocalizationTable:GetEntries()]]. |

### GetTranslatorForLocaleAsync

```lua
LocalizationService:GetTranslatorForLocaleAsync(locale: string): Instance
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

This function takes a locale code as an argument and yields until the cloud [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] for that locale has been loaded, if available. It then returns a [[30 Official Roblox Docs/API Reference/Classes/Translator|Translator]] object which can be used to perform translations for that locale if any are available. The entries used for localization are the entries provided by the [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] hierarchy under [[30 Official Roblox Docs/API Reference/Classes/LocalizationService|LocalizationService]] as well as the cloud table (if available). This will be the same set of entries returned by `Class.LocalizationService:GetTableEntries(nil)`.

This function can error and thus should be wrapped in a `pcall()`.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#GetTranslatorForPlayer|LocalizationService:GetTranslatorForPlayer()]] gets the translator corresponding to the locale of the provided player. This function is deprecated and should not be used in new work.
- [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#GetTranslatorForPlayerAsync|LocalizationService:GetTranslatorForPlayerAsync()]] yields until the cloud [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] for the locale of the provided player has loaded and then gets the translator corresponding to the locale of the provided player.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `locale` | string |  | A Roblox supported language or locale code. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/Translator\|Translator]] instance for the specified locale. |

*Code samples for this member (`getting-and-using-a-translator-for-a-locale`) are published on the source page; their code is not part of the open-source repo.*

### GetTranslatorForPlayer

> [!warning] Deprecated
> This function has been deprecated by
> `Class.LocalizationService:GetTranslatorForPlayerAsync()`, which functions
> similarly except that it yields until the cloud table has loaded. Please
> use it in new work instead.

```lua
LocalizationService:GetTranslatorForPlayer(player: Instance): Instance
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

This function takes a player as an argument and returns a [[30 Official Roblox Docs/API Reference/Classes/Translator|Translator]] instance which can be used to perform translations for that locale if any are available. The entries used for localization are the entries provided by the [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] hierarchy under [[30 Official Roblox Docs/API Reference/Classes/LocalizationService|LocalizationService]] as well as the cloud [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]], if it is available and already loaded. This will be the same set of entries returned by `Class.LocalizationService:GetTableEntries(nil)`.

This function does not yield. It will not wait until the cloud [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] has loaded.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#GetTranslatorForPlayerAsync|LocalizationService:GetTranslatorForPlayerAsync()]] has the same functionality as this function, except that it yields until the cloud [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] has been loaded.
- [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#GetTranslatorForLocaleAsync|LocalizationService:GetTranslatorForLocaleAsync()]], returns a Translator to be used for translations using the provided locale.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] that you are getting the [[30 Official Roblox Docs/API Reference/Classes/Translator\|Translator]] for. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/Translator\|Translator]] instance for the specified locale. |

*Code samples for this member (`getting-and-using-a-translator-for-a-player`) are published on the source page; their code is not part of the open-source repo.*

### GetTranslatorForPlayerAsync

```lua
LocalizationService:GetTranslatorForPlayerAsync(player: Instance): Instance
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

This function takes a player as an argument and yields until the cloud [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] for that player's locale has been loaded, if available. It then returns a [[30 Official Roblox Docs/API Reference/Classes/Translator|Translator]] object which can be used to perform translations for that locale if any are available. The entries used for localization are the entries provided by the [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] hierarchy under [[30 Official Roblox Docs/API Reference/Classes/LocalizationService|LocalizationService]] as well as the cloud table (if available). This will be the same set of entries returned by `Class.LocalizationService:GetTableEntries(nil)`.

This function can error and thus should be wrapped in a `pcall()`.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#GetTranslatorForPlayer|LocalizationService:GetTranslatorForPlayer()]], same functionality as this function except that it does not yield and does not wait until the cloud [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] for the player's locale has been loaded. This function is deprecated and should not be used in new work.
- [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#GetTranslatorForLocaleAsync|LocalizationService:GetTranslatorForLocaleAsync()]], returns a Translator to be used for translations using the provided locale.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] that you are getting the [[30 Official Roblox Docs/API Reference/Classes/Translator\|Translator]] for. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/Translator\|Translator]] instance for the specified locale. |

*Code samples for this member (`getting-and-using-a-translator-for-a-player`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [LocalizationService](https://create.roblox.com/docs/reference/engine/classes/LocalizationService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
