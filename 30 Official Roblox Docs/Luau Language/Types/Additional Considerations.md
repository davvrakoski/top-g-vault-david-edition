---
title: "Additional Considerations"
area: "30 Official Roblox Docs"
cluster: "Luau Language"
source: "https://luau.org/types/considerations"
license: "MIT (Roblox Corporation; Lua.org, PUC-Rio)"
tags: [official-docs, luau]
cssclasses: [tg-a30]
---

## Module interactions

Let's say that we have two modules, `Foo` and `Bar`. Luau will try to resolve the paths if it can find any `require` in any scripts. In this case, when you say `./bar`, Luau will resolve it as: relative to this script, go to my sibling script named Bar.

```luau
--!file foo.luau
local Bar = require("./bar")

local baz1: Bar.Baz = 1     -- not ok
local baz2: Bar.Baz = "foo" -- ok

print(Bar.Quux)         -- ok
print(Bar.FakeProperty) -- not ok

Bar.NewProperty = true -- not ok

--!file bar.luau
export type Baz = string

local module = {}

module.Quux = "Hello, world!"

return module
```

There are some caveats here though. For instance, the require path must be resolvable statically, otherwise Luau cannot accurately type check it.

### Cyclic module dependencies

Cyclic module dependencies can cause problems for the type checker.  In order to break a module dependency cycle a typecast of the module to `any` may be used:
```luau
--!hidden mode=nocheck
local myModule = require(MyModule) :: any
```

---
*Source: [Additional Considerations](https://luau.org/types/considerations) (Luau documentation, github.com/luau-lang/site). Copyright (c) 2019-2026 Roblox Corporation, Copyright (c) 1994-2019 Lua.org, PUC-Rio; MIT License. Converted for Obsidian; changes: formatting only.*
