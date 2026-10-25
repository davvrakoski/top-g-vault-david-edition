---
area: "01 Start Here"
cluster: "Start Here"
title: "First Bug Hunt - A Worked Example from Symptom to Fix"
tags: [roblox, community-knowledge, start-here, debugging, bugs, workflow]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/studio/debugging
  - https://create.roblox.com/docs/studio/output
  - https://create.roblox.com/docs/studio/testing-modes
---
# First Bug Hunt - A Worked Example from Symptom to Fix

[[Debugging Basics - Output, print, warn and Breakpoints]] shows the tools. This note shows the **method**, by walking through one realistic beginner bug from "it doesn't work" to a fix you can trust. The bug is invented but typical: *"My coin shop works for me in Studio, but my friend says buying a sword takes his coins and gives him nothing."* The same six steps work for almost every bug you will meet.

## Step 1: write the bug down precisely

"The shop is broken" cannot be tested. Rewrite it as **steps, expected, actual**:

- **Steps:** join with 100 coins, open shop, click Buy on Sword (price 50).
- **Expected:** coins drop to 50, a Sword appears in the backpack.
- **Actual (friend):** coins drop to 50, no Sword. **Actual (me):** works.

The difference between "me" and "friend" is the first clue. It points at something that changes between players or between Studio and a live server.

## Step 2: reproduce it yourself

You cannot fix what you cannot see. Ideas to make "my friend's" bug happen for you:

- Use **Server & Clients** mode with 2 players (see [[Studio Testing Modes for Beginners - Test, Run and Server and Clients]]). Many bugs only appear for the second player.
- Test after **dying once**, after **rejoining**, and in a **live server** (publish, then join from the website).
- Use the friend's exact steps, in order.

In our example, it happens for **Player2** in a 2-player test. Reproduced.

## Step 3: read every red and orange line

Open **Output** (and in a live game the **Developer Console**, F9, both Client and Server tabs). In our test, the server shows:

```
ServerScriptService.Shop:18: attempt to index nil with 'Backpack'
```

That line tells you **which script** (`Shop`), **which line** (18) and **what** happened: something was `nil` when the code tried to read `.Backpack` from it. Click the line to jump there.

## Step 4: form one hypothesis and test it

Line 18 is:

```lua
local backpack = buyer.Backpack
```

and further up:

```lua
local buyer = Players:FindFirstChild(requestName)
```

**Hypothesis:** `requestName` is not what we think for Player2, so `FindFirstChild` returns nil. Test it with a print just before:

```lua
print("buy request:", requestName, "found:", buyer)
```

Output: `buy request: Player2 found: nil`... but Player2 is in the game. Look closer at how the client sends it:

```lua
-- LocalScript
BuyRemote:FireServer(player.DisplayName, "Sword")
```

The client sends the **display name**, but the server looks up the **username**. In Studio test, `Player1` display name and name happen to match; for your friend, they do not. Hypothesis confirmed by evidence, not by guessing.

## Step 5: fix the cause, not the symptom

A symptom fix would be "search by display name instead". The real cause is worse: the server is **trusting a name from the client** at all. `OnServerEvent` already gives you the player who fired:

```lua
BuyRemote.OnServerEvent:Connect(function(player, itemName)
	local item = SHOP[itemName]
	if not item then return end
	local coins = player.leaderstats.Coins
	if coins.Value < item.Price then return end
	local backpack = player:FindFirstChild("Backpack")
	if not backpack then return end -- check BEFORE taking money
	coins.Value -= item.Price
	ServerStorage.Tools[itemName]:Clone().Parent = backpack
end)
```

Two more problems fixed on the way: the money was taken **before** checking the item could be given, and any client could have bought items for other players by sending their name.

## Step 6: prove it and stop it coming back

- Re-run the exact repro steps with 2 players: both get swords.
- Try the edge cases the bug suggested: not enough coins, dying right before buying, an item name that does not exist.
- Remove the debug `print`s (or turn them into `warn`s for real failures).
- Write one line in your bug log or patch notes: what broke, why, how it was fixed. Next time a "works for me" bug appears, you will check names and client trust first.

## The six steps as a checklist

- [ ] Steps, expected, actual written down
- [ ] Reproduced myself (2-player test, respawn, live server)
- [ ] Read the full error: script, line, message
- [ ] One hypothesis, tested with print or a breakpoint
- [ ] Fixed the cause, including any trust or order problems nearby
- [ ] Re-tested the repro and the edge cases

## Habits that shorten every hunt

- **Change one thing at a time**, then test. Changing five things means you do not know which one fixed it, or which one broke something else.
- **Undo to the last working version** if you are lost; Version History or a saved copy beats an hour of guessing.
- **Explain the bug out loud** (to a friend, a rubber duck, or in a DevForum draft). Half the time you find it while explaining.

## Related
[[00 START HERE - Top G Vault]] · [[Debugging Basics - Output, print, warn and Breakpoints]] · [[Studio Testing Modes for Beginners - Test, Run and Server and Clients]] · [[Bug Report Template]] · [[Common Beginner Mistakes and Their Fixes]]
