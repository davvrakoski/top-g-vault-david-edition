---
title: "In-game HTTP requests"
description: "Use HttpService to send HTTP requests to third-party web services and Open Cloud."
area: "30 Official Roblox Docs"
cluster: "Cloud Services"
source: "https://create.roblox.com/docs/cloud-services/http-service"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use HttpService to send HTTP requests to third-party web services and Open Cloud.*

You can use [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]] to send generic HTTP requests to third-party web services for use cases like analytics, data storage, or error logging. [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]] also supports certain Open Cloud endpoints.

## Enable HTTP requests

The [[30 Official Roblox Docs/API Reference/Classes/HttpService#GetAsync|HttpService:GetAsync()]], [[30 Official Roblox Docs/API Reference/Classes/HttpService#PostAsync|HttpService:PostAsync()]], and [[30 Official Roblox Docs/API Reference/Classes/HttpService#RequestAsync|HttpService:RequestAsync()]] methods aren't enabled by default. To send requests, you must **Allow HTTP Requests** under **File** ⟩ **Experience Settings** ⟩ **Security** in Studio.

## Use in plugins

You can use [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]] in Studio plugins to check for updates, download content, or other business logic. The first time a plugin attempts to use the service, the user might be prompted to give the plugin permission to communicate with the particular web address. Users can accept, deny, and revoke these permissions at any time through the **Plugin Management** window.

Plugins can also communicate with other software running on the same computer through the `localhost` and `127.0.0.1` hosts. By running programs compatible with such plugins, you can extend the functionality of your plugin beyond the normal capabilities of Studio, such as interacting with your computer's file system. Beware that such software must be distributed separately from the plugin itself and can pose security risks.

## Use with Open Cloud

[[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]] can currently call a subset of the Open Cloud endpoints. You can call these endpoints the same way that you'd call any other endpoint via `HttpService`. The only difference is that you must include an Open Cloud API key in the request:

1. [[30 Official Roblox Docs/Cloud/Auth/Manage API keys#Create API keys|Create an Open Cloud API key]].
2. [[30 Official Roblox Docs/Cloud Services/Secrets stores#Add secrets|Save the API key to your secrets store]].
3. Make the request.

The following code sample demonstrates how to update a user's group membership from within a game:

```lua
local HttpService = game:GetService("HttpService")

local groupId = "your_group_id"
local membershipId = "your_membership_id"
local roleId = "your_role_id"

local function request()
	local response = HttpService:RequestAsync({
		Url = `https://apis.roblox.com/cloud/v2/groups/{groupId}/memberships/{membershipId}`,
		Method = "PATCH",
		Headers = {
			["Content-Type"] = "application/json", -- When sending JSON, set this!
			["x-api-key"] = HttpService:GetSecret("APIKey"), -- Set in Creator Hub
		},
		Body = HttpService:JSONEncode({ role = `groups/{groupId}/roles/{roleId}` }),
	})

	if response.Success then
		print("The response was successful:", response.StatusCode, response.StatusMessage)
	else
		print("The response returned an error:", response.StatusCode, response.StatusMessage)
	end
	print("Response body:\n", response.Body)
	print("Response headers:\n", HttpService:JSONEncode(response.Headers))
end

-- Wrap the function in pcall() for safety
local success, errorMessage = pcall(request)
if not success then
	print("The HTTP request failed to send:", errorMessage)
end
```

### Supported Open Cloud endpoints

The following endpoints are supported. Due to current limitations on [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]], the `..` string is not allowed in URL path parameters to Roblox domains. This means, for example, that data stores and entries containing this string are currently inaccessible from [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]].

#### Assets

- [GetAsset](https://create.roblox.com/docs/cloud/features/assets#/default/Assets_GetAsset)
- [ListAssetVersions](https://create.roblox.com/docs/cloud/features/assets#/default/listAssetVersions)
- [GetAssetVersion](https://create.roblox.com/docs/cloud/features/assets#/default/Assets_GetAssetVersion)

#### Bans and blocks

- [ListUserRestrictions (Place)](https://create.roblox.com/docs/cloud/features/bans-and-blocks#/UserRestriction/Cloud_ListUserRestrictions__Using_Universes)
- [GetUserRestriction (Place)](https://create.roblox.com/docs/cloud/features/bans-and-blocks#/UserRestriction/Cloud_GetUserRestriction__Using_Universes_Places)
- [UpdateUserRestriction (Place)](https://create.roblox.com/docs/cloud/features/bans-and-blocks#/UserRestriction/Cloud_UpdateUserRestriction__Using_Universes_Places)
- [ListUserRestrictions (Universe)](https://create.roblox.com/docs/cloud/features/bans-and-blocks#/UserRestriction/Cloud_ListUserRestrictions)
- [GetUserRestriction (Universe)](https://create.roblox.com/docs/cloud/features/bans-and-blocks#/UserRestriction/Cloud_GetUserRestriction__Using_Universes)
- [UpdateUserRestriction (Universe)](https://create.roblox.com/docs/cloud/features/bans-and-blocks#/UserRestriction/Cloud_UpdateUserRestriction__Using_Universes)
- [ListUserRestrictionLogs (Universe)](https://create.roblox.com/docs/cloud/features/bans-and-blocks#/UserRestriction/Cloud_ListUserRestrictionLogs)

#### Configs

- [GetConfigRepositoryValues](https://create.roblox.com/docs/cloud/reference/features/configs#CreatorConfigsPublicApi_GetConfigRepositoryValues)
- [GetConfigRepositoryDraft](https://create.roblox.com/docs/cloud/reference/features/configs#CreatorConfigsPublicApi_GetConfigRepositoryDraft)
- [UpdateDraft](https://create.roblox.com/docs/cloud/reference/features/configs#CreatorConfigsPublicApi_UpdateDraft)
- [DeleteDraft](https://create.roblox.com/docs/cloud/reference/features/configs#CreatorConfigsPublicApi_DeleteDraft)
- [OverwriteDraft](https://create.roblox.com/docs/cloud/reference/features/configs#CreatorConfigsPublicApi_OverwriteDraft)
- [GetConfigRepositoryFull](https://create.roblox.com/docs/cloud/reference/features/configs#CreatorConfigsPublicApi_GetConfigRepositoryFull)
- [PublishDraft](https://create.roblox.com/docs/cloud/reference/features/configs#CreatorConfigsPublicApi_PublishDraft)
- [ListRevisions](https://create.roblox.com/docs/cloud/reference/features/configs#CreatorConfigsPublicApi_ListRevisions)
- [RestoreRevision](https://create.roblox.com/docs/cloud/reference/features/configs#CreatorConfigsPublicApi_RestoreRevision)

#### Creator Store

- [CreateCreatorStoreProduct](https://create.roblox.com/docs/cloud/features/creator-store#/CreatorStoreProduct/Cloud_CreateCreatorStoreProduct)
- [GetCreatorStoreProduct](https://create.roblox.com/docs/cloud/features/creator-store#/CreatorStoreProduct/Cloud_GetCreatorStoreProduct)
- [UpdateCreatorStoreProduct](https://create.roblox.com/docs/cloud/features/creator-store#/CreatorStoreProduct/Cloud_UpdateCreatorStoreProduct)
- [CreatorStoreAssetsSearch](https://create.roblox.com/docs/cloud/features/creator-store#toolbox-service)

#### Developer products

- [CreateDeveloperProduct](https://create.roblox.com/docs/cloud/reference/features/developer-products#DeveloperProducts_CreateDeveloperProductV2)
- [UpdateDeveloperProduct](https://create.roblox.com/docs/cloud/reference/features/developer-products#DeveloperProducts_UpdateDeveloperProductV2)
- [GetDeveloperProductConfig](https://create.roblox.com/docs/cloud/reference/features/developer-products#DeveloperProducts_GetDeveloperProductConfigV2)
- [ListDeveloperProductConfigsByUniverse](https://create.roblox.com/docs/cloud/reference/features/developer-products#DeveloperProducts_ListDeveloperProductConfigsByUniverseV2)

#### Game passes

- [CreateGamePass](https://create.roblox.com/docs/cloud/reference/features/game-passes#GamePasses_CreateGamePass)
- [UpdateGamePass](https://create.roblox.com/docs/cloud/reference/features/game-passes#GamePasses_UpdateGamePass)
- [GetGamePassConfig](https://create.roblox.com/docs/cloud/reference/features/game-passes#GamePasses_GetGamePassConfig)
- [ListGamePassConfigsByUniverse](https://create.roblox.com/docs/cloud/reference/features/game-passes#GamePasses_ListGamePassConfigsByUniverse)

#### Data and memory stores

Data stores:

- [ListDataStores](https://create.roblox.com/docs/cloud/reference/DataStore#Cloud_ListDataStores)
- [SnapshotDataStores](https://create.roblox.com/docs/cloud/features/storage#/DataStore/Cloud_SnapshotDataStores)
- [ListDataStoreEntries](https://create.roblox.com/docs/cloud/reference/DataStoreEntry#Cloud_ListDataStoreEntries__Using_Universes)
- [CreateDataStoreEntry](https://create.roblox.com/docs/cloud/reference/DataStoreEntry#Cloud_CreateDataStoreEntry__Using_Universes)
- [GetDataStoreEntry](https://create.roblox.com/docs/cloud/reference/DataStoreEntry#Cloud_GetDataStoreEntry__Using_Universes_DataStores)
- [DeleteDataStoreEntry](https://create.roblox.com/docs/cloud/reference/DataStoreEntry#Cloud_DeleteDataStoreEntry__Using_Universes_DataStores)
- [UpdateDataStoreEntry](https://create.roblox.com/docs/cloud/reference/DataStoreEntry#Cloud_UpdateDataStoreEntry__Using_Universes_DataStores)
- [IncrementDataStoreEntry](https://create.roblox.com/docs/cloud/reference/DataStoreEntry#Cloud_IncrementDataStoreEntry__Using_Universes_DataStores)
- [ListDataStoreEntryRevisions](https://create.roblox.com/docs/cloud/features/storage#/DataStoreEntry/Cloud_ListDataStoreEntryRevisions__Using_Universes_DataStores)
- [ListDataStoreEntries (With Scope)](https://create.roblox.com/docs/cloud/features/storage#/DataStoreEntry/Cloud_ListDataStoreEntries__Using_Universes_DataStores)
- [CreateDataStoreEntry (With Scope)](https://create.roblox.com/docs/cloud/features/storage#/DataStoreEntry/Cloud_CreateDataStoreEntry__Using_Universes_DataStores)
- [GetDataStoreEntry (With Scope)](https://create.roblox.com/docs/cloud/features/storage#/DataStoreEntry/Cloud_GetDataStoreEntry__Using_Universes_DataStores_Scopes)
- [DeleteDataStoreEntry (With Scope)](https://create.roblox.com/docs/cloud/features/storage#/DataStoreEntry/Cloud_DeleteDataStoreEntry__Using_Universes_DataStores_Scopes)
- [UpdateDataStoreEntry (With Scope)](https://create.roblox.com/docs/cloud/features/storage#/DataStoreEntry/Cloud_UpdateDataStoreEntry__Using_Universes_DataStores_Scopes)
- [IncrementDataStoreEntry (With Scope)](https://create.roblox.com/docs/cloud/features/storage#/DataStoreEntry/Cloud_IncrementDataStoreEntry__Using_Universes_DataStores_Scopes)
- [ListDataStoreEntryRevisions (With Scope)](https://create.roblox.com/docs/cloud/features/storage#/DataStoreEntry/Cloud_ListDataStoreEntryRevisions__Using_Universes_DataStores_Scopes)

Memory stores:

- [CreateMemoryStoreQueueItem](https://create.roblox.com/docs/cloud/features/storage#/MemoryStoreQueueItem/Cloud_CreateMemoryStoreQueueItem)
- [DiscardMemoryStoreQueueItems](https://create.roblox.com/docs/cloud/features/storage#/MemoryStoreQueueItem/Cloud_DiscardMemoryStoreQueueItems)
- [ReadMemoryStoreQueueItems](https://create.roblox.com/docs/cloud/features/storage#/MemoryStoreQueueItem/Cloud_ReadMemoryStoreQueueItems)
- [ListMemoryStoreSortedMapItems](https://create.roblox.com/docs/cloud/features/storage#/MemoryStoreSortedMapItem/Cloud_ListMemoryStoreSortedMapItems)
- [CreateMemoryStoreSortedMapItem](https://create.roblox.com/docs/cloud/features/storage#/MemoryStoreSortedMapItem/Cloud_CreateMemoryStoreSortedMapItem)
- [GetMemoryStoreSortedMapItem](https://create.roblox.com/docs/cloud/features/storage#/MemoryStoreSortedMapItem/Cloud_GetMemoryStoreSortedMapItem)
- [DeleteMemoryStoreSortedMapItem](https://create.roblox.com/docs/cloud/features/storage#/MemoryStoreSortedMapItem/Cloud_DeleteMemoryStoreSortedMapItem)
- [UpdateMemoryStoreSortedMapItem](https://create.roblox.com/docs/cloud/features/storage#/MemoryStoreSortedMapItem/Cloud_UpdateMemoryStoreSortedMapItem)
- [FlushMemoryStore](https://create.roblox.com/docs/cloud/features/storage#/MemoryStore/Cloud_FlushMemoryStore)

Ordered data stores:

- [ListOrderedDataStoreEntries](https://create.roblox.com/docs/cloud/features/storage#/OrderedDataStoreEntry/Cloud_ListOrderedDataStoreEntries)
- [CreateOrderedDataStoreEntry](https://create.roblox.com/docs/cloud/features/storage#/OrderedDataStoreEntry/Cloud_CreateOrderedDataStoreEntry)
- [GetOrderedDataStoreEntry](https://create.roblox.com/docs/cloud/features/storage#/OrderedDataStoreEntry/Cloud_GetOrderedDataStoreEntry)
- [DeleteOrderedDataStoreEntry](https://create.roblox.com/docs/cloud/features/storage#/OrderedDataStoreEntry/Cloud_DeleteOrderedDataStoreEntry)
- [UpdateOrderedDataStoreEntry](https://create.roblox.com/docs/cloud/features/storage#/OrderedDataStoreEntry/Cloud_UpdateOrderedDataStoreEntry)
- [IncrementOrderedDataStoreEntry](https://create.roblox.com/docs/cloud/features/storage#/OrderedDataStoreEntry/Cloud_IncrementOrderedDataStoreEntry)

#### Groups

- [GetGroup](https://create.roblox.com/docs/cloud/reference/Group#Cloud_GetGroup)
- [ListGroupJoinRequests](https://create.roblox.com/docs/cloud/reference/GroupJoinRequest#Cloud_ListGroupJoinRequests)
- [AcceptGroupJoinRequest](https://create.roblox.com/docs/cloud/reference/GroupJoinRequest#Cloud_AcceptGroupJoinRequest)
- [DeclineGroupJoinRequest](https://create.roblox.com/docs/cloud/reference/GroupJoinRequest#Cloud_DeclineGroupJoinRequest)
- [ListGroupMemberships](https://create.roblox.com/docs/cloud/reference/GroupMembership#Cloud_ListGroupMemberships)
- [UpdateGroupMembership](https://create.roblox.com/docs/cloud/reference/GroupMembership#Cloud_UpdateGroupMembership)
- [ListGroupRoles](https://create.roblox.com/docs/cloud/reference/GroupRole#Cloud_ListGroupRoles)
- [GetGroupRole](https://create.roblox.com/docs/cloud/reference/GroupRole#Cloud_GetGroupRole)
- [GetGroupShout](https://create.roblox.com/docs/cloud/reference/GroupShout#Cloud_GetGroupShout)

#### Inventories

- [ListInventoryItems](https://create.roblox.com/docs/cloud/reference/InventoryItem#Cloud_ListInventoryItems)

#### Luau execution

- [CreateLuauExecutionSessionTaskBinaryInput](https://create.roblox.com/docs/cloud/features/luau-execution#/LuauExecutionSessionTaskBinaryInput/Cloud_CreateLuauExecutionSessionTaskBinaryInput)
- [CreateLuauExecutionSessionTask](https://create.roblox.com/docs/cloud/features/luau-execution#/LuauExecutionSessionTask/Cloud_CreateLuauExecutionSessionTask__Using_Universes)
- [CreateLuauExecutionSessionTask (with version)](https://create.roblox.com/docs/cloud/features/luau-execution#/LuauExecutionSessionTask/Cloud_CreateLuauExecutionSessionTask__Using_Universes_Places)
- [GetLuauExecutionSessionTask](https://create.roblox.com/docs/cloud/features/luau-execution#/LuauExecutionSessionTask/Cloud_GetLuauExecutionSessionTask)
- [ListLuauExecutionSessionTaskLogs](https://create.roblox.com/docs/cloud/features/luau-execution#/LuauExecutionSessionTaskLog/Cloud_ListLuauExecutionSessionTaskLogs)

#### Notifications

- [CreateUserNotification](https://create.roblox.com/docs/cloud/features/notifications#/UserNotification/Cloud_CreateUserNotification)

#### Places

- [GetPlace](https://create.roblox.com/docs/cloud/features/places#/Place/Cloud_GetPlace)
- [UpdatePlace](https://create.roblox.com/docs/cloud/features/places#/Place/Cloud_UpdatePlace)
- [GetInstance](https://create.roblox.com/docs/cloud/features/places#/Instance/Cloud_GetInstance)
- [UpdateInstance](https://create.roblox.com/docs/cloud/features/places#/Instance/Cloud_UpdateInstance)

#### Universes

- [UpdateUniverse](https://create.roblox.com/docs/cloud/features/universes#/Universe/Cloud_UpdateUniverse)
- [GetUniverse](https://create.roblox.com/docs/cloud/features/universes#/Universe/Cloud_GetUniverse)
- [PublishUniverseMessage](https://create.roblox.com/docs/cloud/features/universes#/Universe/Cloud_PublishUniverseMessage)
- [RestartUniverseServers](https://create.roblox.com/docs/cloud/features/universes#/Universe/Cloud_RestartUniverseServers)

#### Users

- [GetUser](https://create.roblox.com/docs/cloud/features/users#/User/Cloud_GetUser)
- [GenerateUserThumbnail](https://create.roblox.com/docs/cloud/features/users#/User/Cloud_GenerateUserThumbnail)

## Limitations

- Only the `x-api-key` and `content-type` headers are allowed.
- The `x-api-key` header must be a [[30 Official Roblox Docs/API Reference/Datatypes/Secret|Secret]]. See [[30 Official Roblox Docs/Cloud Services/Secrets stores|Secrets stores]].
- The `".."` string is not allowed in URL path parameters.
- Only the HTTPS protocol is supported.
- You cannot use port `1194` or any port below `1024`, except `80` and `443`. If you try to use a blocked port, you receive either a `403 Forbidden` or `ERR_ACCESS_DENIED` error.

## Rate limits

For each Roblox game server, there is a limit of 2500 Open Cloud requests per minute. Exceeding this can cause request-sending methods to stall for around 30 seconds. Your [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]] may also fail with a message of `Number of Open Cloud requests exceeded limit`.

- Open Cloud requests **do not** consume the same overall limit of 500 HTTP requests per minute enforced on all other requests.
- Each endpoint has its own limit per API key owner (can be a user or a group) that is enforced no matter where the calls come from ([[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]], the web, etc.).

For detailed information about Open Cloud rate limits, authentication-based rate limiting, and best practices, see [[30 Official Roblox Docs/Cloud/Reference/Rate limits|Rate Limits]].

## Best practices

To optimize your [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]] usage and avoid exceeding the limits, apply the following best practices:

- **Handle errors gracefully**. Web requests can fail for many reasons. Use [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]] and have a plan for when requests fail. Furthermore, strictly validate and sanitize all received data from external APIs, ensuring correct data where you can.

- Use [exponential backoff](https://en.wikipedia.org/wiki/Exponential_backoff) to stay below limits.

  If a request returns a recoverable error, instead of immediately retrying, wait for two seconds, then four, eights, etc. between attempts. This helps limit congestion and improves the chance of a successful request by giving the endpoint time to "cool off."

- Aggregate and send data in bulk.

  When possible, it's recommended to let your server collect all necessary data in order to send one HTTP request, rather than multiple small requests. For example, if you are sending an HTTP request for every player in your server, check if the API has a bulk/batch endpoint and, if so, collect the information from all players and send it all in one request.

  In some cases you may have to use [[30 Official Roblox Docs/API Reference/Classes/HttpService#RequestAsync|HttpService:RequestAsync()]] to include data in the body of the request.

- **Use HTTP/2 endpoints**. HTTP/2 provides significant performance benefits through features such as header compression and request/response multiplexing over a single connection. [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]] automatically uses HTTP/2 when available. Note that the HTTP/2 specification requires all header names to be sent in lowercase.

## Observability

The **Observability Dashboard** provides insights and analytics for monitoring and troubleshooting your [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]] usage. The dashboard features two primary charts: **Request Count** which tracks the volume of [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]] requests from your game, and **Response Time** which measures the latency for endpoints to respond.

The available dimensions for filtering and breakdown are defined as follows:

### Request Type

- `GET`
- `POST`
- `PUT`
- `PATCH`
- `DELETE`
- `Other` (for non-specified request types)

### Status

- Success (HTTP 1xx and 2xx status codes)
- Redirect (HTTP 3xx status codes)
- 400 (Bad Request)
- 401 (Unauthorized)
- 403 (Forbidden)
- 404 (Not Found)
- 429 (Too Many Requests)
- 500 (Internal Server Error)
- 503 (Service Unavailable)
- ExternalError (any other non-specified error codes returned from the external service)
- InternalError (an issue returned from [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]] within Roblox)

The **Response Time** chart is not correlated with status data. If you select "Status" as a breakdown or filter, this chart will not display data.

## Additional considerations

- Requests should provide a secure form of authentication, such as a pre-shared secret key, so that bad actors cannot pose as one of your Roblox servers.
- Be aware of the general capacity and rate-limiting policies of the web servers to which requests are being sent.

---
*Source: [In-game HTTP requests](https://create.roblox.com/docs/cloud-services/http-service) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
