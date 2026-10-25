---
title: "Passes"
description: "Passes let you charge users a one-time Robux fee to access privileges inside your game."
area: "30 Official Roblox Docs"
cluster: "Production"
source: "https://create.roblox.com/docs/production/monetization/passes"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Passes let you charge users a one-time Robux fee to access privileges inside your game.*

**Passes** let you charge users a one-time Robux fee to access special privileges inside your game, such as entry to a restricted area, an in-game avatar item, or a permanent power-up.

> [!info]
> For items that a player might purchase multiple times, such as potions, temporary power-ups, or in-game currency, see [[30 Official Roblox Docs/Production/Monetization/Developer Products|Developer products]].

## Create a pass

> [!warning]
> Before creating a pass, make sure your game has been [[30 Official Roblox Docs/Production/Publishing/Create and publish games and places|published]] and is accessible on Roblox.

To create a pass:

1. Go to [Creations](https://create.roblox.com/dashboard/creations) and select a game.
2. Go to **Monetization** ⟩ **Passes**.
3. Click **Create pass**.
4. Upload an image to display as the pass icon. Make sure the image doesn't exceed 512x512 pixels, doesn't include important details outside of its circular boundaries, and is in `.jpg`, `.png`, or `.bmp` format.
5. Enter a name and a description for the pass.
6. Select a category for the pass. The category is used to organize items in your in-game Shop.
7. Click **Create pass**.

*(image in the full Top G Vault)*

*Includes relevant content*

*(image in the full Top G Vault)*

*Crops important content*

> [!info]
> If you want to use the pass as a randomized reward, review the [[30 Official Roblox Docs/Production/Monetization/Paid random items policy guidelines|Randomized Virtual Item Policy]].

## Get the pass ID

To use scripting, you need a pass ID. To get the pass ID:

1. Go to **Monetization** ⟩ **Passes**.
1. Hover over a pass' thumbnail, click the **⋯** button, and select **Copy Asset ID** from the context menu.

   *(image in the full Top G Vault)*

## Sell a pass

> [!warning]
> Starting May 30, 2026, cross-game pass sales will be disabled. If your game relies on cross-game sales mechanics, we recommend integrating [[30 Official Roblox Docs/Production/Monetization/Robux transfers|Robux transfers]] before this date to avoid service interruptions.

> [!info]
> If you're using [[30 Official Roblox Docs/Production/Monetization/Price optimization|price optimization]], make sure the script runs on the client so that users see personalized pass prices.

You can sell passes in two ways:

- [[30 Official Roblox Docs/Production/Monetization/Passes#Inside your game|Inside your game]]
- [[30 Official Roblox Docs/Production/Monetization/Passes#Outside your game|Outside your game]]

### Inside your game

To implement and sell a pass inside a game, call [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService|MarketplaceService]] functions.

Use [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetProductInfo|GetProductInfo()]] to retrieve information about a pass, like name and price, and then to display that pass to users. You can sell the pass inside your game's marketplace, for example. For passes, the second parameter must be [[30 Official Roblox Docs/API Reference/Enums/InfoType|Enum.InfoType.GamePass]].

```lua
local MarketplaceService = game:GetService("MarketplaceService")

-- Replace the placeholder ID with your pass ID
local productId = 000000

local success, productInfo = pcall(function()
	return MarketplaceService:GetProductInfo(productId, Enum.InfoType.GamePass)
end)


if success and productInfo then
	-- Check if product is for sale
	if productInfo.IsForSale then
	-- Display product information
	-- Replace the print statements with UI code to display the pass
  	print("Pass Name: " .. productInfo.Name)
  	print("Price in Robux: " .. productInfo.PriceInRobux)
  	print("Description: " .. productInfo.Description)
	else
		print("This product isn't for sale")
	end
end
```

Use [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptGamePassPurchase|PromptGamePassPurchase()]] to prompt a pass purchase if the user doesn't already have the pass in their inventory. You can call this function when a user performs actions like pressing a button or talking to a vendor NPC.

```lua
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

-- Replace the placeholder ID with your pass ID
local passID = 0000000

-- Prompt pass purchase
local function promptPurchase()
	local player = Players.LocalPlayer
	local hasPass = false

	local success, message = pcall(function()
		hasPass = MarketplaceService:UserOwnsGamePassAsync(player.UserId, passID)
	end)

	if not success then
		warn("Error while checking if player has pass: " .. tostring(message))
		return
	end

	if hasPass then
		-- Show a message telling user they already own the pass
	else
		-- Prompt pass purchase
		MarketplaceService:PromptGamePassPurchase(player, passID)
	end
end
```

Use [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptGamePassPurchaseFinished|PromptGamePassPurchaseFinished]] to handle a completed pass prompt and purchase and assign the user the privileges associated with the pass.

Place the script inside the [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] so that the server handles the user's pass privileges.

```lua
local MarketplaceService = game:GetService("MarketplaceService")

-- Replace the placeholder ID with your pass ID
local passID = 0000000  -- Change this to your Pass ID

-- Handle a completed prompt and purchase
local function onPromptPurchaseFinished(player, purchasedPassID, purchaseSuccess)
	if purchaseSuccess and purchasedPassID == passID then
		print(player.Name .. " purchased the Pass with ID " .. passID)
		-- Assign the user the ability or bonus related to the pass
	end
end

-- Connect PromptGamePassPurchaseFinished events to the function
MarketplaceService.PromptGamePassPurchaseFinished:Connect(onPromptPurchaseFinished)
```

> [!warning]
> Although Roblox itself does **not** record the purchase history of passes by specific users, you can request to [[30 Official Roblox Docs/Production/Analytics/Analytics dashboard#Sales data|download sales data]]. If you want to track user-specific purchase history, it's your responsibility to [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|store the data]].

### Outside your game

Roblox surfaces your **Listed** passes outside your game, including on the Roblox homepage, in search results, and on the post-purchase page after a player buys Robux. A player can buy your pass and then join your game with it already granted.

To make a pass eligible for external sales:

1. In the **Creator Hub**, go to **Monetization** ⟩ **Shop**.
2. Mark the pass **Listed**.

Passes don't require a [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#ProcessReceipt|ProcessReceipt]] fix, but they must be **Listed** to appear outside your game. We recommend adding a custom icon to each pass so players can recognize it on external surfaces; if you don't add one, Roblox shows a default icon.

## Assign pass privileges

You must manually assign pass privileges to users that purchase your passes. To do this, use [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerAdded|PlayerAdded]] when a user joins your game to check if they already own the pass and to assign them the pass privileges.

Place the script inside the [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] so that the server handles the user's pass privileges.

```lua
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

-- Replace the placeholder ID with your pass ID
local passID = 0000000

local function onPlayerAdded(player)
	local hasPass = false

	-- Check if user already owns the pass
	local success, message = pcall(function()
		hasPass = MarketplaceService:UserOwnsGamePassAsync(player.UserId, passID)
	end)

	if not success then
		-- Issue a warning and exit the function
		warn("Error while checking if player has pass: " .. tostring(message))
		return
	end

	if hasPass then
		-- Assign user the ability or bonus related to the pass
		print(player.Name .. " owns the Pass with ID " .. passID)
	end
end

-- Connect PlayerAdded events to the function
Players.PlayerAdded:Connect(onPlayerAdded)
```

## Personalize your in-game store

You can use product intelligence APIs to sort and recommend passes to users. Personalizing your in-game store helps surface the most relevant items to each user, boosting engagement and revenue. By tailoring passes to user preferences, you can improve their discovery, increase conversion rates, and unlock new monetization opportunities.

### Rank passes for sale

[[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#RankProductsAsync|RankProductsAsync]] takes in a list of product IDs and returns a personalized ordered list of those products. You can use this method to provide your users with personalized item recommendations in your in-game store.

> [!warning]
> Because `RankProductsAsync` has a strict rate limit, you should load recommendations once at game join instead of calling it repeatedly.

*Example: Three "Power" items ranked for the user*

*(image in the full Top G Vault)*

```lua
local MarketplaceService = game:GetService("MarketplaceService")

-- Create the array of products you want to rank
local productIdentifiers = {
    {InfoType = Enum.InfoType.GamePass, Id = 123},
    {InfoType = Enum.InfoType.Product, Id = 456},
    {InfoType = Enum.InfoType.Product, Id = 789}
}

-- Optional: Wrap the call in an async task so that if the request is slow,
-- it doesn’t freeze the UI / game
task.spawn(function()
    -- Use a pcall to handle errors gracefully
    local success, result = pcall(function()
        return MarketplaceService:RankProductsAsync(productIdentifiers)
    end)

    if not success then
        -- If failed, 'result' is the error message.
        warn("Failed to rank products:", result)
    end

    -- Load the returned items into the store.
    for i, rankedItem in ipairs(rankedProducts) do
        local productIdentifier = rankedItem.ProductIdentifier
        local productInfo = rankedItem.ProductInfo
        -- ...
        -- Logic to add productInfo into store
    end
end)
```

### Display your top passes

> [!warning]
> If your game has had no item sales in the past 28 days, `RecommendTopProductsAsync` returns an empty list. At least one purchase within the last 28 days is required for this API to generate recommendations.

[[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#RecommendTopProductsAsync|RecommendTopProductsAsync]] takes an array of [[30 Official Roblox Docs/API Reference/Enums/InfoType|InfoType]] values and returns up to 50 items a user is most likely to engage with and purchase. You can use this method to create a "Top Picks" section in your in-game store.

If no recommendations can be determined, `RecommendTopProductsAsync` returns 0 items. Any passes that the user already owns are also not returned.

In rare cases, calls to the ranking model can be slow. To help prevent added lately for users, we recommend using `task.spawn` to make the call to `RecommendTopProducts` non-blocking.

*Example: A "Top Picks" tab in an in-game store*

*(image in the full Top G Vault)*

```lua
local MarketplaceService = game:GetService("MarketplaceService")

-- Create an array of product types to include. In this case both game passes and developer products
local productTypes = {Enum.InfoType.GamePass, Enum.InfoType.Product}

-- Optional: Wrap the call in an async task so that if the request is slow,
-- it doesn’t freeze the UI / game
task.spawn(function()
    -- Use a pcall to handle errors gracefully
    local success, result = pcall(function()
        return MarketplaceService:RecommendTopProductsAsync(productTypes)
    end)

    if not success then
        -- If failed, 'result' is the error message.
        warn("Failed to rank products:", result)
    end

    -- Load the returned items into the store. Make sure to filter out any
    -- ineligible items from topRankedItems such as developer products the
    -- user can no longer purchase
    for i, rankedItem in ipairs(rankedProducts) do
        local productIdentifier = rankedItem.ProductIdentifier
        local productInfo = rankedItem.ProductInfo
        -- ...
        -- Logic to add productInfo into store
    end
end)
```

## Promote a pass

> [!info]
> Promoted passes are given to users for free.

To help more users discover your game, you can opt-in to have your passes featured on Roblox's [Buy Robux](https://www.roblox.com/upgrades/robux) page. Opting-in to promote your passes can help increase the time and Robux users spend in your game. There is no limit to the number of passes you can promote.

Users are shown passes that are relevant to their play history and engagement on the platform. They are not shown passes that they already own.

*(image in the full Top G Vault)*

When users purchase an eligible Robux package, they receive the promoted pass and are prompted to claim their pass by joining your game.

*(image in the full Top G Vault)*

> [!info]
> For best results, we recommend that you create a unique pass specifically for the **Buy Robux** page.

To opt-in to promote one of your passes:

1. Go to **Monetization** ⟩ **Passes**.
2. Select the pass you want to promote.
3. Select **Promotions**.
4. Enable **Include this item in the bonus pool**.
5. Click **Save Changes**. The pass is shown to relevant users in the **Buy Robux** page.

The promoted pass:

- Can be off-sale or on-sale. If they're on-sale, their Robux value must be greater than 49 Robux and less than 801 Robux.
- Must include a thumbnail.
- Cannot grant [[30 Official Roblox Docs/Production/Monetization/Paid random items policy guidelines|paid random items]].
- Must comply with the [Community Standards](https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards).

## Pass analytics

Use pass analytics to analyze the success of individual passes, identify trends, and forecast potential future earnings.

With analytics, you can:

- View your top passes over a selected time period.
- Showcase up to eight top-selling items on a time-series graph to analyze overall sales and net revenue.
- Monitor your catalog and sort items by sales and net revenue.
- View how many passes were acquired by users through promotion on the **Buy Robux** page.
- View how many users joined your game after acquiring the pass through the **Buy Robux** page.

To access pass analytics:

1. Go to [Creations](https://create.roblox.com/dashboard/creations) and select a game.
2. Go to **Monetization** ⟩ **Passes**.
3. Select the **Analytics** tab.

*(image in the full Top G Vault)*

---
*Source: [Passes](https://create.roblox.com/docs/production/monetization/passes) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
