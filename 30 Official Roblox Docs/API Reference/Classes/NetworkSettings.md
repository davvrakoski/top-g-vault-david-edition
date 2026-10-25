---
title: "NetworkSettings"
description: "Settings related to networked engine behaviors."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/NetworkSettings"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Settings related to networked engine behaviors.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`, `NotBrowsable`

## Description

`NetworkSettings` is a class that allows you to debug several features with Roblox's server/client networking. It can be found in Roblox Studio's settings under the **Network** tab.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#EmulatedTotalMemoryInMB\|EmulatedTotalMemoryInMB]] | int | The total device memory, in MiB, that the client emulates when testing under a simulated device. |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#FreeMemoryMBytes\|FreeMemoryMBytes]] | float | Describes how much free memory is available, in MiBs. |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#HttpProxyEnabled\|HttpProxyEnabled]] | boolean | Whether the client routes HTTP traffic through the proxy configured by [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#HttpProxyURL\|NetworkSettings.HttpProxyURL]]. |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#HttpProxyURL\|HttpProxyURL]] | string | The address of the proxy server used when [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#HttpProxyEnabled\|NetworkSettings.HttpProxyEnabled]] is `true`. |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#InboundNetworkJitterMs\|InboundNetworkJitterMs]] | float | Adds jitter to playtest connections in the server-to-client direction. |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#InboundNetworkLossPercent\|InboundNetworkLossPercent]] | float | Sets the probability that packets on playtest connections from server to client are dropped. |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#InboundNetworkMinDelayMs\|InboundNetworkMinDelayMs]] | float | Adds latency to playtest connections in the server-to-client direction. |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#IncomingReplicationLag\|IncomingReplicationLag]] | double | Simulates additional network latency in the network receiving path. |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#OutboundNetworkJitterMs\|OutboundNetworkJitterMs]] | float | Adds jitter to playtest connections in the client-to-server direction. |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#OutboundNetworkLossPercent\|OutboundNetworkLossPercent]] | float | Sets the probability that packets on playtest connections from client to server are dropped. |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#OutboundNetworkMinDelayMs\|OutboundNetworkMinDelayMs]] | float | Adds latency to playtest connections in the client-to-server direction. |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#PrintJoinSizeBreakdown\|PrintJoinSizeBreakdown]] | boolean | Prints diagnostic information about data sent on connect. |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#PrintPhysicsErrors\|PrintPhysicsErrors]] | boolean | Whether debug messages will be printed to the output pertaining to physics replication errors. |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#PrintStreamInstanceQuota\|PrintStreamInstanceQuota]] | boolean | Whether debug information is printed to the output regarding the replication of instances when [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled\|Workspace.StreamingEnabled]] is set to `true`. |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#RandomizeJoinInstanceOrder\|RandomizeJoinInstanceOrder]] | boolean | Special facility to help catch bugs related to how your experience loads. |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#RenderStreamedRegions\|RenderStreamedRegions]] | boolean | Whether regions of space that are being streamed to the client will be outlined in red. |
| [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#ShowActiveAnimationAsset\|ShowActiveAnimationAsset]] | boolean | Whether a label will be shown above each player character's head, showing the current animation being played. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### EmulatedTotalMemoryInMB

**Type:** int

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Network · **Tags:** `Hidden`, `NotReplicated`

Sets the total amount of memory, in MiB, that the client pretends the device has when testing under a simulated device. Studio's device emulator writes this property when you select a device to emulate. Values are clamped to a minimum of `0`, and the property defaults to the machine's actual total physical memory.

### FreeMemoryMBytes

**Type:** float

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Network · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`

`FreeMemoryMBytes` is a read-only property that describes how much free memory is available, in MiBs.

### HttpProxyEnabled

**Type:** boolean

**Security:** read None / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Proxy Settings · **Loaded/Saved:** true/true · **Capabilities:** Network

When `true`, the client routes its HTTP traffic through the proxy server specified by [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#HttpProxyURL|HttpProxyURL]]. This property defaults to `false`.

### HttpProxyURL

**Type:** string

**Security:** read None / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Proxy Settings · **Loaded/Saved:** true/true · **Capabilities:** Network

Specifies the address of the proxy server through which the client routes its HTTP traffic when [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#HttpProxyEnabled|HttpProxyEnabled]] is `true`. This property defaults to an empty string.

### InboundNetworkJitterMs

**Type:** float

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Network · **Tags:** `NotReplicated`

On [[30 Official Roblox Docs/Studio/Studio testing modes#Playtesting|playtest]] connections, this property adds variability (jitter) in milliseconds to the latency added to packets sent from server to client. This variable latency is in addition to any latency introduced by [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#InboundNetworkMinDelayMs|InboundNetworkMinDelayMs]]. Per-packet delay sampled from delay and jitter is rounded to 1 millisecond. See [[30 Official Roblox Docs/Studio/Studio testing modes#Network simulation|network simulation]] for additional details.

### InboundNetworkLossPercent

**Type:** float

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Network · **Tags:** `NotReplicated`

On [[30 Official Roblox Docs/Studio/Studio testing modes#Playtesting|playtest]] connections, this property sets a percent probability that packets sent from server to client are dropped. To maintain a stable test environment, the value is capped at 0.5%. See [[30 Official Roblox Docs/Studio/Studio testing modes#Network simulation|network simulation]] for additional details.

### InboundNetworkMinDelayMs

**Type:** float

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Network · **Tags:** `NotReplicated`

On [[30 Official Roblox Docs/Studio/Studio testing modes#Playtesting|playtest]] connections, this property adds a minimum latency in milliseconds for packets sent from server to client. Per-packet delay sampled from delay and jitter is rounded to 1 millisecond. See [[30 Official Roblox Docs/Studio/Studio testing modes#Network simulation|network simulation]] for additional details.

### IncomingReplicationLag

**Type:** double

**Thread safety:** ReadSafe · **Category:** Diagnostics · **Loaded/Saved:** true/true · **Capabilities:** Network

This property instructs the engine to simulate additional replication lag by delaying all incoming messages. Units are seconds.

### OutboundNetworkJitterMs

**Type:** float

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Network · **Tags:** `NotReplicated`

On [[30 Official Roblox Docs/Studio/Studio testing modes#Playtesting|playtest]] connections, this property adds variability (jitter) in milliseconds to the latency added to packets sent from client to server. This variable latency is in addition to any latency introduced by [[30 Official Roblox Docs/API Reference/Classes/NetworkSettings#OutboundNetworkMinDelayMs|OutboundNetworkMinDelayMs]]. Per-packet delay sampled from delay and jitter is rounded to 1 millisecond. See [[30 Official Roblox Docs/Studio/Studio testing modes#Network simulation|network simulation]] for additional details.

### OutboundNetworkLossPercent

**Type:** float

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Network · **Tags:** `NotReplicated`

On [[30 Official Roblox Docs/Studio/Studio testing modes#Playtesting|playtest]] connections, this property sets a percent probability that packets sent from client to server are dropped. To maintain a stable test environment, the value is capped at 0.5%. See [[30 Official Roblox Docs/Studio/Studio testing modes#Network simulation|network simulation]] for additional details.

### OutboundNetworkMinDelayMs

**Type:** float

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Network · **Tags:** `NotReplicated`

On [[30 Official Roblox Docs/Studio/Studio testing modes#Playtesting|playtest]] connections, this property adds a minimum latency in milliseconds for packets sent from client to server. Per-packet delay sampled from delay and jitter is rounded to 1 millisecond. See [[30 Official Roblox Docs/Studio/Studio testing modes#Network simulation|network simulation]] for additional details.

### PrintJoinSizeBreakdown

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Diagnostics · **Loaded/Saved:** true/true · **Capabilities:** Network

Prints diagnostic information to the **Output** window after connecting. The data will indicate the largest individual [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] sent, as well as aggregate data about data sent by [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] type. The data sent for initial loading is compressed so the contributions are approximate.

### PrintPhysicsErrors

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Diagnostics · **Loaded/Saved:** true/true · **Capabilities:** Network

When set to `true`, debug messages will be printed to the **Output** window pertaining to physics replication errors. The following are debug outputs that are made available:

- `Physics-in old packet` prints for a part that has been updated ahead of the packet's submission time. This happens if the packet is received late, and a newer packet has already been processed.

- `Physics-in of unidentified {GUID}` prints for an unfound part that is trying to be updated because the provided [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] identifier was invalid, where `{GUID}` is the unknown [[30 Official Roblox Docs/API Reference/Classes/Instance#GetDebugId|Instance:GetDebugId()]] identifier that is supposed to be targeting the part. This typically happens if a part is removed before the physics update packet is received.

- `Physics-in of part not in workspace {GUID}` prints for a request to update the physics of a part that is not a descendant of the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], where `{GUID}` is the [[30 Official Roblox Docs/API Reference/Classes/Instance#GetDebugId|Instance:GetDebugId()]] identifier of the target part. This happens if the part was just moved out of the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], and was previously being simulated.

### PrintStreamInstanceQuota

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Diagnostics · **Loaded/Saved:** true/true · **Capabilities:** Network

When set to `true`, debug information is printed to the **Output** window regarding the replication of instances when [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled|Workspace.StreamingEnabled]] is set to `true`.

### RandomizeJoinInstanceOrder

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Advanced · **Loaded/Saved:** true/true · **Capabilities:** Network

Emulates the behavior of a server that has been online a long time by randomizing the order that instances initially arrive on clients. It is recommended to keep this setting enabled to help discover potential bugs while testing in Studio.

### RenderStreamedRegions

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Network

When set to `true`, regions of space that are being streamed to the client will be outlined in red. This will only be shown if [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled|Workspace.StreamingEnabled]] is set to `true`.

### ShowActiveAnimationAsset

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Network, Animation

When set to `true`, a label will be shown above each player character's head, showing the current animation (if any) being played by the character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

---
*Source: [NetworkSettings](https://create.roblox.com/docs/reference/engine/classes/NetworkSettings) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
