---
title: "FilterErrorType"
description: "Identifies the category of a parse or validation error produced by the Studio Explorer filter expression engine."
api_type: enum
aliases: ["Enum.FilterErrorType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/FilterErrorType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Identifies the category of a parse or validation error produced by the Studio Explorer filter expression engine.*

## Description

[[30 Official Roblox Docs/API Reference/Enums/FilterErrorType|Enum.FilterErrorType]] classifies each `FilterError` returned when the Studio Explorer filter bar cannot parse or validate a filter expression. A `FilterError` carries the type alongside the source range and human-readable message so tooling can distinguish failure categories programmatically.

Values fall into three groups:

- **Lexer errors** — the raw character stream cannot be tokenized.
- **Parser errors** — a valid token stream forms an invalid expression tree.
- **Bespoke-filter and property errors** — the expression is syntactically valid but semantically incorrect (unknown property, unsupported type, bad operator, and similar).

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `BackslashNotEscapingAnything` | 0 | A backslash at the end of a quoted string has nothing after it to escape. |
| `BadBespokeFilter` | 1 | A recognized bespoke filter keyword (such as `classname:`) is missing its required value, or a `query:` expression contains an invalid query string. |
| `BadName` | 2 | An unexpected token was encountered where a name or identifier was expected. |
| `IncompleteOr` | 3 | Reserved error code for an incomplete `or` expression; currently not emitted by the filter engine. |
| `IncompleteParenthesis` | 4 | An opening parenthesis `(` in the filter expression has no matching closing parenthesis `)`. |
| `InvalidDoubleStar` | 5 | A `**` wildcard token directly follows a `*` wildcard in a dotted name path (for example, `A.*.**.X`), which is not allowed. |
| `InvalidTilde` | 6 | A lone `~` character was found that is not part of the `~=` not-equal operator. |
| `PropertyBadOperator` | 7 | A comparison operator other than `=` or `~=` was used with a property type that only supports equality comparisons. |
| `PropertyDoesNotExist` | 8 | The named property does not exist on any reflected class known to the filter engine. |
| `PropertyInvalidField` | 9 | A sub-field index (such as `.W`) was used with a vector or color property that does not have a field by that name. |
| `PropertyInvalidValue` | 10 | The value string provided for a property comparison cannot be parsed into the expected type for that property (for example, `Locked=notabool`). |
| `PropertyUnsupportedFields` | 11 | A sub-field index was used with a property type that does not support field access (for example, `Locked.X=true`). |
| `PropertyUnsupportedProperty` | 12 | The named property exists but its type is not supported by the filter engine (for example, complex datatypes such as `CFrame` or `TweenInfo`). |
| `UnexpectedNameIndex` | 13 | A `.` in a dotted name path is not followed by a valid name, number, or wildcard token. |
| `UnexpectedToken` | 14 | A token that cannot be a value (such as an operator) appears where a value is expected after a comparison operator. |
| `UnfinishedBinaryOperator` | 15 | An `and` or `or` binary operator appears with no right-hand operand. |
| `UnfinishedQuote` | 16 | A quoted string was opened but not closed before the end of the filter input. |
| `UnknownBespokeFilter` | 17 | A `name:value` token uses a keyword that is not a recognized bespoke filter type (for example, `foo:Bar`). |
| `WildcardInProperty` | 18 | A wildcard (`*` or `**`) appears in the property portion of a dotted expression where a concrete property name is required. |

---
*Source: [FilterErrorType](https://create.roblox.com/docs/reference/engine/enums/FilterErrorType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
