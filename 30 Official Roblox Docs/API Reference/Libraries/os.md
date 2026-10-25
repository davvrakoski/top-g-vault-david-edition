---
title: "os"
description: "This library provides functions related to time and date."
api_type: library
aliases: ["os"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/libraries/os"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/library]
cssclasses: [tg-a30]
---

*This library provides functions related to time and date.*

## Description

This library currently serves the purpose of providing information about the system time under the UTC format. It has been heavily sandboxed from the standard Lua [[30 Official Roblox Docs/API Reference/Libraries/os|os]] library and does not allow you to perform any system-altering operations.

## Summary

### Functions

| Function | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Libraries/os#clock\|clock()]] | double | Returns elapsed time in seconds since an arbitrary baseline with sub-microsecond precision. |
| [[30 Official Roblox Docs/API Reference/Libraries/os#date\|date()]] | Dictionary | Formats the given string with date/time information based on the given time. |
| [[30 Official Roblox Docs/API Reference/Libraries/os#difftime\|difftime()]] | int | Returns the number of seconds from one time to another. |
| [[30 Official Roblox Docs/API Reference/Libraries/os#time\|time()]] | int | Returns how many seconds have passed since the Unix epoch (1 January 1970, 00:00:00) under current UTC time. |

## Functions

### clock

```lua
os.clock(): double
```

Returns elapsed time in seconds since an arbitrary baseline with sub-microsecond precision. This function is useful for comparing durations between two events that occur on the same computer, and is the best option for benchmarking.

Unlike with functions such as [[30 Official Roblox Docs/API Reference/Libraries/os#time|os.time()]] or [[30 Official Roblox Docs/API Reference/Datatypes/DateTime#now|DateTime.now()]], adjustments to the system clock (such as by the user or [NTP](https://en.wikipedia.org/wiki/Network_Time_Protocol)) do not cause time to jump forwards or backwards.

```lua
-- Record the initial time:
local startTime = os.clock()
-- Do something you want to measure the performance of:
local a, b = 0, 1
for _ = 1, 5000000 do
    a, b = b, a
end
-- Measure amount of time this took:
local deltaTime = os.clock() - startTime
print("Elapsed time: " .. deltaTime)
-->  Elapsed time: 0.044425600033719 (actual number may vary)
```

**Returns**

| Type | Description |
| --- | --- |
| double |  |

### date

```lua
os.date(formatString: string, time: int): Dictionary
```

Formats the given `formatString` with date/time information based on the given time, or if not provided, the value returned by [[30 Official Roblox Docs/API Reference/Libraries/os#time|os.time()]].

This function should be avoided in new work. Instead, use the [[30 Official Roblox Docs/API Reference/Datatypes/DateTime|DateTime]] API, which supports localized formatting.

The following specifiers (based on the C function strftime) are supported:

| Specifier | Meaning | Example<sup>†</sup> |
| --- | --- | --- |
| `%a` | Abbreviated weekday name * | Mon |
| `%A` | Full weekday name * | Monday |
| `%b` | Abbreviated month name * | Feb |
| `%B` | Full month name * | February |
| `%c` | Date and time * | Mon Feb 12 14:14:35 2024 |
| `%d` | Day of the month | 12 |
| `%H` | Hour, using 24-hour clock | 14 |
| `%I` | Hour, using 12-hour clock | 02 |
| `%j` | Day of year | 043 |
| `%m` | Month | 02 |
| `%M` | Minute | 14 |
| `%p` | Either "AM" or "PM" | PM |
| `%S` | Second | 35 |
| `%U` | Week number (first Sunday as the first day of week one) | 06 |
| `%w` | Weekday | 1 |
| `%W` | Week number (first Monday as the first day of week one) | 07 |
| `%x` | Date * | 02/12/24 |
| `%X` | Time * | 14:14:35 |
| `%y` | Two-digit year | 24 |
| `%Y` | Full year | 2024 |
| `%z` | ISO 8601 offset from UTC in timezone (1 minute = 1, 1 hour = 100) | -0800 |
| `%Z` | Timezone name or abbreviation * | PST |
| `%%` | The % character | % |

\* This value can vary depending on the current locale.

† The example provided is for February 12th, 2024 (Monday) at 2:14:35 PM (14:14:35), run using locale "en-us" in Pacific Standard Time (PST).

If the provided `formatString` is exactly `"*t"` (local time) or `"!*t"` (UTC time), this function instead returns a dictionary containing the following components, which are normally available in the specifiers above.

| Field | Type | Description |
| --- | --- | --- |
| year | int | An integer that describes the current year of the Current Era (ex. 2017) |
| month | int | An integer between 1 and 12 (starting from January) that describes the current month. |
| wday | int | An integer between 1 and 7 (starting from Sunday) that describes the current week day. |
| yday | int | An integer between 1 and 366 describing how many days we are into the year.<br>There can be 366 days if it is a leap year. |
| day | int | An integer between 1 and 31 describing the current day of the month. |
| hour | int | An integer between 1 and 24 describing the current hour of the day. |
| min | int | An integer between 0 and 59 describing the current minute of the hour. |
| sec | int | An integer between 0 and 60 describing the current second of the hour.<br>(60 because the function is described to indicate leap seconds, but in practice it probably doesn't). |
| isdst | bool | A boolean describing if daylight savings time is currently active. |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `formatString` | string |  | Must be either `"*t"` or `"!*t"`. |
| `time` | int |  | The time value to format. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary |  |

### difftime

```lua
os.difftime(t2: int, t1: int): int
```

Returns the number of seconds from `t1` to `t2`. The difference is computed assuming that `t1` and `t2` are correctly casted to the [time_t](http://en.cppreference.com/w/cpp/chrono/c/time_t) format.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `t2` | int |  | The later time value, as returned by [[30 Official Roblox Docs/API Reference/Libraries/os#time\|os.time()]]. |
| `t1` | int |  | The earlier time value, as returned by [[30 Official Roblox Docs/API Reference/Libraries/os#time\|os.time()]]. |

**Returns**

| Type | Description |
| --- | --- |
| int |  |

### time

```lua
os.time(time: table = UTC time): int
```

Returns how many seconds have passed since the Unix epoch (1 January 1970, 00:00:00), under current UTC time. If provided a table formatted similarly to that returned by [[30 Official Roblox Docs/API Reference/Libraries/os#date|os.date()]], it returns the number of seconds from the Unix epoch to that time instead.

Note that the returned time uses the device's local clock. Most operating systems automatically sync their local time against online time servers, so this should be within a few hundred milliseconds. However, users can easily disable sync behavior and set the system time to anything they want; for synchronized time between client and server, use [[30 Official Roblox Docs/API Reference/Classes/Workspace#GetServerTimeNow|Workspace:GetServerTimeNow()]] instead.

This function should be avoided in new work. Instead, use the [[30 Official Roblox Docs/API Reference/Datatypes/DateTime|DateTime]] API, which supports localized formatting.

When you need to precisely measure the time elapsed between two points in time, like when testing performance, use [[30 Official Roblox Docs/API Reference/Libraries/os#clock|os.clock()]] instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | table | `UTC time` | A dictionary table describing a specific time, similar to that returned by [[30 Official Roblox Docs/API Reference/Libraries/os#date\|os.date()]]. If not provided, uses the current UTC time. |

**Returns**

| Type | Description |
| --- | --- |
| int |  |

---
*Source: [os](https://create.roblox.com/docs/reference/engine/libraries/os) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
