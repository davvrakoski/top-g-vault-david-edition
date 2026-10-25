---
area: "01 Start Here"
cluster: "Start Here"
title: "Learning Resources - Official Courses and DevForum Categories"
tags: [roblox, community-knowledge, start-here, learning, resources, devforum]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/tutorials/curriculums/curriculum-overview
  - https://create.roblox.com/docs/tutorials/curriculums/core
  - https://create.roblox.com/docs/get-started/resources
  - https://create.roblox.com/roadmap
  - https://devforum.roblox.com/categories
  - https://devforum.roblox.com/c/help-and-feedback/54
  - https://devforum.roblox.com/t/about-the-scripting-support-category/45863/1
  - https://devforum.roblox.com/t/starting-with-scripting/3660990
  - https://luau.org/
  - https://www.lua.org/pil/
---
# Learning Resources - Official Courses and DevForum Categories

There is more free Roblox learning material than anyone can finish, and much of it is outdated (old `wait()`, deprecated APIs, pre-2023 Studio UI). The trick is a short, ordered list of trustworthy sources, plus knowing where to ask when you are stuck. This note is that list, with the DevForum category map and the post template that gets answers.

## Official, in this order

| Step | Resource | What you get |
| --- | --- | --- |
| 1 | **Studio lesson** (install and explore UI) | Comfortable in Studio |
| 2 | **Create your first game** + **Luau basics / Coding fundamentals** | First playable, variables, functions, events, loops, tables, modules |
| 3 | **Core curriculum** (3 chapters, each with a place file) | A complete coin-collecting jump platformer: greybox with terrain, scripted gameplay, polish |
| 4 | **Advanced curriculum paths** | Environmental art (plan, construct, optimise), Gameplay scripting (a laser-tag game with teams, blasters, hit detection, rounds), UI design (wireframe, style, implement) |
| 5 | **Use case tutorials** | Focused recipes: data stores, leaderboards, tools, proximity prompts, VFX, lighting, audio |
| 6 | **Reference projects** (Plant, Beyond the Dark, Mystery of Duvall Drive) | How large official projects organise code and art |

All of these live under the Creator Hub docs, and copies of the docs are in this vault under [[30 Official Roblox Docs/Official Roblox Docs - Hub|Official Roblox Docs - Hub]].

Also bookmark:
- **API reference** (classes, datatypes, enums): check every method before trusting a tutorial; deprecated members are labelled.
- **Creator Roadmap** (create.roblox.com/roadmap): what Roblox plans to ship.
- **luau.org**: the language site (syntax, type checking, performance).
- **Programming in Lua** (lua.org/pil): recommended in DevForum beginner threads for core Lua ideas; Luau is based on Lua 5.1 and adds things like type annotations, `continue`, compound operators and string interpolation, so newer Lua features in later book editions may not apply.

## The DevForum map

Top-level categories: **Updates** (staff announcements), **Help and Feedback**, **Bug Reports**, **Feature Requests**, **Resources** (community and staff tutorials and modules), **Collaboration** (hiring, portfolios), **Forum Help**, **Bulletin Board** (locked, shared content; not for discussion).

Help and Feedback subcategories:

| Subcategory | Ask about |
| --- | --- |
| Scripting Support | Any code problem, beginner to advanced |
| Building Support | Building, physics, modelling in Studio |
| Art Design Support | UI design, animation, rigging, meshes, sound |
| Game Design Support | Mechanics, level design, UX, monetisation |
| Code Review | Improving code that already works |
| Creations Feedback | Showing your game or art for opinions |
| Platform Usage Support | How to do things on the Roblox site or Studio |
| Education Support | Teaching with Roblox |
| Cloud Apps | Open Cloud and third-party apps |

Note: posting rights on the DevForum depend on trust level; new accounts may need to read and participate before they can create topics (check the Forum Help category for current rules, unverified for 2026).

## How to ask so people answer

The Scripting Support guidelines ask every topic to answer three questions:
1. **What do you want to achieve?**
2. **What is the issue?** (include screenshots or video, and the exact Output error)
3. **What solutions have you tried so far?** (including searching the forum and Creator Hub docs)

Rules worth knowing: search before posting; paste code in code blocks, not screenshots; do not ask people to write whole scripts or systems for you; showcases go to Creations Feedback, not Support.

## Community learning advice (DevForum consensus)

- Learn by building small unrelated systems in Studio, not by only watching videos.
- Master one concept before moving on; do not jump to advanced tutorials early.
- Search first, ask second, and expect mistakes.

More on breaking out of endless tutorials: [[Learning Luau - Escaping Tutorial Hell]].

## Red flags in a tutorial

- Uses `wait()`, `spawn()`, `delay()` instead of the `task` library.
- Uses `Velocity`, `BodyVelocity`, `BodyGyro` (legacy; modern equivalents are `AssemblyLinearVelocity` and mover constraints).
- Puts coins or damage in LocalScripts.
- Says "just insert this free model".
- Calls deprecated methods like `GetProductInfo` (now `GetProductInfoAsync`) or `AwardBadge` (now `AwardBadgeAsync`).

## Related
[[00 START HERE - Top G Vault]] · [[Open-source and Learning Resources]] · [[12-Week Roblox Developer Curriculum]] · [[Beginner to Shipping Roadmap]] · [[30 Official Roblox Docs/Tutorials/Curriculums/Advanced curriculum paths|Advanced curriculum paths (official)]]
