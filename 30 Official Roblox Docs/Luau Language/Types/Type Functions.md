---
title: "Type Functions"
area: "30 Official Roblox Docs"
cluster: "Luau Language"
source: "https://luau.org/types/type-functions"
license: "MIT (Roblox Corporation; Lua.org, PUC-Rio)"
tags: [official-docs, luau]
cssclasses: [tg-a30]
---

Type functions are functions that run during analysis time and operate on types, instead of runtime values. They can use the [[30 Official Roblox Docs/Luau Language/Reference/Type Function Library|types]] library to transform existing types or create new ones.

Here's a simplified implementation of the builtin type function `keyof`. It takes a table type and returns its property names as a [[30 Official Roblox Docs/Luau Language/Types/Union and Intersection Types#Union types|union]] of [[30 Official Roblox Docs/Luau Language/Types/Primitives and Simple Types#Singleton types (aka literal types)|singletons]].

```luau
type function simple_keyof(ty)
    -- Ignoring unions or intersections of tables for simplicity.
    if not ty:is("table") then
        error("Can only call keyof on tables.")
    end

    local union = nil

    for property in ty:properties() do
        union = if union then types.unionof(union, property) else property
    end

    return if union then union else types.singleton(nil)
end

type person = {
    name: string,
    age: number,
}
--- keys = "age" | "name"
type keys = simple_keyof<person>
```

### Type function environment

In addition to the [[30 Official Roblox Docs/Luau Language/Reference/Type Function Library|types]] library, type functions have access to:

* `assert`, `error`, `print`
* `next`, `ipairs`, `pairs`
* `select`, `unpack`
* `getmetatable`, `setmetatable`
* `rawget`, `rawset`, `rawlen`, `raweq`
* `tonumber`, `tostring`
* `type`, `typeof`
* `math` library
* `table` library
* `string` library
* `bit32` library
* `utf8` library
* `buffer` library

---
*Source: [Type Functions](https://luau.org/types/type-functions) (Luau documentation, github.com/luau-lang/site). Copyright (c) 2019-2026 Roblox Corporation, Copyright (c) 1994-2019 Lua.org, PUC-Rio; MIT License. Converted for Obsidian; changes: formatting only.*
