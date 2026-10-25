--!strict
-- Bootstrap: the only server Script. Requires every service in dependency order, then
-- calls Start() in the same order. A service that fails to start stops the boot loudly
-- (a half-started server that loses saves or purchases is worse than an obvious error).

local Services = script.Parent.Services

type Service = { Start: () -> () }

local ORDER: { ModuleScript } = {
	Services.Analytics, -- no dependencies
	Services.PlayerData, -- data + session locks + BindToClose flush
	Services.Currency, -- needs PlayerData, Analytics
	Services.Shop, -- needs Currency
	Services.Monetization, -- needs Currency; sets ProcessReceipt
	Services.Rewards, -- needs Currency, Monetization
	Services.Settings, -- needs PlayerData
}

local started = os.clock()
for _, module in ORDER do
	local service = (require :: any)(module) :: Service
	if type(service) == "table" and type(service.Start) == "function" then
		local t0 = os.clock()
		service.Start()
		print(("[Bootstrap] %s started in %.1f ms"):format(module.Name, (os.clock() - t0) * 1000))
	end
end
print(("[Bootstrap] server ready in %.1f ms"):format((os.clock() - started) * 1000))
