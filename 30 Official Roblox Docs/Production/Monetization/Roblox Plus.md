---
title: "Roblox Plus"
description: "Roblox Plus gives you additional ways to earn from your games by rewarding engagement and purchases from Plus subscribers."
area: "30 Official Roblox Docs"
cluster: "Production"
source: "https://create.roblox.com/docs/production/monetization/roblox-plus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Roblox Plus gives you additional ways to earn from your games by rewarding engagement and purchases from Plus subscribers.*

**Roblox Plus** gives you additional ways to earn from your games by rewarding engagement and purchases from Plus subscribers.

Users who subscribe to Plus get a range of benefits to enhance their purchasing power, access, and overall game on the platform:

- **Discounted purchases**: Subscribers get 10% off eligible purchases, including in-game items, avatar items, and more. The discount increases to 20% starting in the third month. Roblox covers this discount for you.
- **Free paid private servers**: Subscribers get access to paid private servers at no cost. You're still compensated when they spend time in your paid private servers.
- **Free Robux transfers**: Subscribers can transfer Robux at no cost to sender or recipient. Transfers are subject to age restrictions and parental consent. Robux received through transfers are not eligible for the DevEx program.
- [[30 Official Roblox Docs/Marketplace/Marketplace policy#Creator requirements|Marketplace access]]: Subscribers can trade and resell limited items, and publish and sell avatar items. Premium subscribers have the same Marketplace access.

For more information about the benefits of Roblox Plus to end-users, see the [help center](https://en.help.roblox.com/hc/en-us/articles/47967913158164-Roblox-Plus).

As a creator, you can earn from Roblox Plus subscribers through:

- [[30 Official Roblox Docs/Production/Monetization/Roblox Plus#Earn from in-game purchases|In-game Robux purchases]]: Subscribers receive a 10–20% discount on purchases, which is covered by Roblox so that your earnings per purchase are not reduced. Lower prices can encourage more frequent purchases, helping increase your overall revenue.
- [[30 Official Roblox Docs/Production/Monetization/Roblox Plus#Earn from in-game Plus subscriptions|Driving Plus sign-ups]]: Encourage engaged users to subscribe to Roblox Plus directly from your game using [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptRobloxSubscriptionPurchase|PromptRobloxSubscriptionPurchase]]. You can earn up to 750 Robux for each new subscriber you bring in, with earnings starting once the subscription becomes paid (free trial periods are not included).
- [[30 Official Roblox Docs/Production/Monetization/Roblox Plus#Earn from paid private server time|Time spent in paid private servers]]: Earn up to 100 Robux per subscriber when they spend at least 60 minutes in your paid private servers each month.
- [[30 Official Roblox Docs/Production/Monetization/Roblox Plus#Earn from Robux transfers|In-game Robux transfers]]: Earn 10% every time a Plus subscriber sends Robux to another user within your game using [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptRobuxTransferAsync|PromptRobuxTransferAsync]]. This amount is eligible for the DevEx program.

## Earn from in-game purchases

With Roblox Plus, users receive a 10–20% discount on eligible Robux purchases. Because Roblox subsidizes these discounts, you earn the same amount per purchase as you would from non-subscribers. At the same time, lower prices for Plus subscribers can encourage more frequent purchases and increase your overall revenue.

Subscribers receive a 10% discount for their first two months, which increases to 20% starting in the third month. If a user cancels their Plus subscription and later resubscribes, their discount resets to 10% and increases again after two months.

Eligible Robux purchases include:

- Developer products
- Game passes
- Developer subscriptions
- Paid access games
- Avatar items

Discounts do not apply to:

- Items priced above 1,000,000 Robux
- Marketplace publishing fees
- Ad credits
- Group fees

The following table shows how Roblox Plus discounts are subsidized by Roblox.

| **User type** | **Item price in Robux** | **User spend** | **Roblox subsidy** | **Creator earnings** | **Effective revenue share** |
| --- | --- | --- | --- | --- | --- |
| Non-subscriber | 100 | 100 | — | 70 | 70% |
| Plus subscriber (10% discount) | 100 | 90 | 10 | 70 | 78% |
| Plus subscriber (20% discount) | 100 | 80 | 20 | 70 | 88% |

> [!warning]
> **If you hard-code prices, your in-game UI might display incorrect pricing to Plus subscribers.** While subscribers are still charged the discounted price, your game might show them the full price instead. This mismatch can cause confusion.
>
> To display accurate, real-time pricing (including Plus discounts), you should use [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService|MarketplaceService]] functions like [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetProductInfoAsync|GetProductInfoAsync]] and [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#GetDeveloperProductsAsync|GetDeveloperProductsAsync]].
>
> For implementation details, see [[30 Official Roblox Docs/Production/Monetization/Passes#Sell a pass|Sell a pass]] and [[30 Official Roblox Docs/Production/Monetization/Developer Products#Sell a developer product|Sell a developer product]].

## Earn from in-game Plus subscriptions

You can encourage users to subscribe to Roblox Plus directly from your game with [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptRobloxSubscriptionPurchase|PromptRobloxSubscriptionPurchase]]. For each user who becomes a subscriber through your game, you earn **250 Robux per month for their first three consecutive months**, with up to **750 Robux for every newly acquired subscriber**.

Any earnings are subject to a 60-day holding period.

*(image in the full Top G Vault)*

> [!info]
> Roblox Plus subscription prompts might appear in other places like paid private server pages or purchase modals, but you only earn a Robux payout when a user subscribes through your game using `PromptRobloxSubscriptionPurchase`.

To offer Plus subscriptions within your game and grant rewards to users:

1. Detect when the user reaches the point in your game where you want to offer the Plus subscription.
2. Check whether the user already has an active Plus subscription with [[30 Official Roblox Docs/API Reference/Classes/Player#HasRobloxSubscription|HasRobloxSubscription]].
3. If the user is already a subscriber:
    1. Grant them the reward immediately.
4. If the user isn't a subscriber:
    1. Prompt them to purchase Roblox Plus with [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptRobloxSubscriptionPurchase|PromptRobloxSubscriptionPurchase]].
    2. Listen to [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptRobloxSubscriptionPurchaseFinished|PromptRobloxSubscriptionPurchaseFinished]] to detect when the purchase prompt UI has closed.
    3. Confirm the Plus subscription on the server with [[30 Official Roblox Docs/API Reference/Classes/Player#HasRobloxSubscription|HasRobloxSubscription]] through the [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|GetPropertyChangedSignal]] before granting any rewards. This event verifies that the user's Plus subscription status has actually changed.

### Examples

The following examples show how to work with Roblox Plus in your game, including retrieving discount information, checking subscription status, prompting users to subscribe, and handling the purchase flow.

##### Example 1

Print Roblox Plus discount information for a game pass.

```lua
local MarketplaceService = game:GetService("MarketplaceService")

local PASS_ID = 12345678

local DiscountTypeDisplay = {
	RobloxPlusSubscription = "Roblox Plus Discount",
}

local productInfo = MarketplaceService:GetProductInfoAsync(PASS_ID, Enum.InfoType.GamePass)
print(string.format("Original Price: %d", productInfo.UserBasePriceInRobux))

for _, discount in ipairs(productInfo.PriceDiscountDetails) do
	local displayName = DiscountTypeDisplay[discount.Type] or "Other Discount"
	print(string.format("%s (%d%%): -%d", displayName, discount.Percent, discount.AmountInRobux))
end

print(string.format("You Pay: %d", productInfo.PriceInRobux))
```

##### Example 2

Check whether a user has an active Roblox Plus subscription and perform actions based on their subscription status.

```lua
local MarketplaceService = game:GetService("MarketplaceService")
local player = game.Players.LocalPlayer

local success, details = pcall(function()
    return MarketplaceService:GetRobloxSubscriptionDetailsAsync(player)
end)

if success and details.IsSubscribed then
    -- Check the length of the user's Plus subscription
    local threeMonths = 90 * 24 * 60 * 60
    if details.StartTime and (os.time() - details.StartTime.UnixTimestamp) > threeMonths then
        print("Awarding the '3-Month Subscription Veteran' skin!")
    end

    -- Check if user subscribed through the game
    if details.IsOriginExperience then
        print("Attribution confirmed: User subscribed via this game.")
    else
        print("User subscribed elsewhere: Website or another game.")
    end
end
```

##### Example 3

Prompt users to subscribe to Plus and handle the purchase flow in your game.

```lua
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local teleporter = script.Parent
local showModal = true

local EXCLUSIVE_AREA_POSITION = Vector3.new(1200, 200, 60)

-- Grant the reward and teleport the subscribing user to the exclusive area
local function grantRewardAndTeleport(player)
	player:RequestStreamAroundAsync(EXCLUSIVE_AREA_POSITION)

	local character = player.Character
	if character and character.Parent then
		local currentPivot = character:GetPivot()
		character:PivotTo(currentPivot * CFrame.new(EXCLUSIVE_AREA_POSITION))
	end
end

-- Detect when the character touches the teleporter
teleporter.Touched:Connect(function(otherPart)
	local player = Players:GetPlayerFromCharacter(otherPart.Parent)
	if not player then
		return
	end

	if not player:GetAttribute("CharacterPartsTouching") then
		player:SetAttribute("CharacterPartsTouching", 0)
	end
	player:SetAttribute("CharacterPartsTouching", player:GetAttribute("CharacterPartsTouching") + 1)

	if player.HasRobloxSubscription then
		-- User already has Roblox Plus; grant the reward immediately
		grantRewardAndTeleport(player)
	else
		-- Prompt Roblox Plus subscription
		if not showModal then
			return
		end
		showModal = false
		task.delay(5, function()
			showModal = true
		end)
		MarketplaceService:PromptRobloxSubscriptionPurchase(player)
	end
end)

-- Detect when the character exits the teleporter
teleporter.TouchEnded:Connect(function(otherPart)
	local player = Players:GetPlayerFromCharacter(otherPart.Parent)
	if player and player:GetAttribute("CharacterPartsTouching") then
		player:SetAttribute("CharacterPartsTouching", player:GetAttribute("CharacterPartsTouching") - 1)
	end
end)

-- Grant the reward when the server confirms a membership change
-- Connect HasRobloxSubscription change for each player
Players.PlayerAdded:Connect(function(player)
	player:GetPropertyChangedSignal("HasRobloxSubscription"):Connect(function()
		if player.HasRobloxSubscription
			and player:GetAttribute("CharacterPartsTouching")
			and player:GetAttribute("CharacterPartsTouching") > 0
		then
			grantRewardAndTeleport(player)
		end
	end)
end)
```

##### Example 4

Detect when the user closes the purchase prompt UI.

```lua
local MarketplaceService = game:GetService("MarketplaceService")

local function onPromptRobloxSubscriptionPurchaseFinished(player, didTryPurchasing)
	if didTryPurchasing then
		-- User attempted to subscribe; wait for HasRobloxSubscription change to confirm
		print(player.Name, "attempted to subscribe to Roblox Plus")
	else
		print(player.Name, "closed the Roblox Plus subscription prompt without purchasing")
	end
end

MarketplaceService.PromptRobloxSubscriptionPurchaseFinished:Connect(onPromptRobloxSubscriptionPurchaseFinished)
```

## Earn from paid private server time

Roblox Plus subscribers can create a paid [[30 Official Roblox Docs/Production/Monetization/Private servers|private server]] for free in your game. To make sure that you can still earn from this server, Roblox compensates you based on the time Plus subscribers spend in the paid private server they create within your game.

**Payouts are based on the time a Plus subscriber spends in the paid private server they create themselves.** This means that if a Plus subscriber invites another Plus subscriber to their paid private server, only the server owner's time counts toward your earnings. Time spent by the invited subscriber does not count.

On the Plus subscription renewal day, Roblox evaluates paid private server usage over the previous 30 days for that subscriber. This evaluation occurs even if the subscriber cancels Plus instead of renewing. Roblox then determines the subscriber's **top five paid private servers across Roblox**, based on the amount of time they spent in each server during that period. The paid private server in your game qualifies if it's among those five and if the subscriber has spent a minimum of 60 cumulative minutes in it.

If a Plus subscriber, including a subscriber on a Free Plus Trial, spends **at least 60 cumulative minutes over the last 30 days** in the paid private server they created within your game, you can earn up to **100 Robux for that subscriber** based on the server price.

In the following example, Private Servers A, B, and C qualify because the Plus subscriber spent at least 60 minutes in each server during the last 30 days. Private Servers D and E don't qualify because they don't meet the 60-minute threshold. These represent the subscriber's top five paid private servers across Roblox. Across the qualifying servers, the creator earns a combined 205 Robux from this Plus subscriber.

| **Game's paid private server** | **Server price** | **Cumulative time (30 days prior to renewal)** | **Creator earnings** |
| --- | --- | --- | --- |
| Private Server A | 100 Robux | 120 minutes | 70 Robux (70% revenue share on a 100 Robux server price) |
| Private Server B | 200 Robux | 80 minutes | 100 Robux (70% revenue share on a 200 Robux server price, capped at 100 Robux) |
| Private Server C | 50 Robux | 70 minutes | 35 Robux (70% revenue share on a 50 Robux server price) |
| Private Server D | 60 Robux | 15 minutes | Not eligible (less than 60 minutes) |
| Private Server E | 70 Robux | 10 minutes | Not eligible (less than 60 minutes) |

## Earn from Robux transfers

Robux transfers allow Plus subscribers to send Robux directly to other users. You can implement the Transfers API to prompt these transfers within your game and earn a share of each transfer.

When a Plus subscriber initiates a transfer prompted by [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptRobuxTransferAsync|PromptRobuxTransferAsync]] inside your game, you receive **10% of the transfer amount**. For example, if a subscriber transfers 100 Robux to another user, the recipient receives 90 Robux (90%) and your game receives 10 Robux (10%).

Robux your game earns from transfers is **eligible for the DevEx program**. Roblox does not take a fee from these transfers.

> [!info]
> When setting up transfers in your game, the amount must be between 10 and 500 Robux per transaction.

*(image in the full Top G Vault)*

For more information about implementing Robux transfers within your game, see [[30 Official Roblox Docs/Production/Monetization/Robux transfers|Robux transfers]].

## Track your Plus earnings

You can track your earnings from users who subscribe to Roblox Plus through your in-game prompts, Robux transfers using the Transfers API, and time spent by Plus subscribers in your paid private servers, whether they join from within your game or outside of it.

To see a detailed breakdown of your Plus subscription incentives:

1. In Creator Hub, go to **Creations** and select a game.
2. Go to **Monetization** ⟩ **Roblox Plus**.

*(image in the full Top G Vault)*

---
*Source: [Roblox Plus](https://create.roblox.com/docs/production/monetization/roblox-plus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
