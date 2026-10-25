---
title: "ModerationService"
description: "Server-side service for submitting player captures to content moderation review and receiving the results asynchronously."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ModerationService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Server-side service for submitting player captures to content moderation review and receiving the results asynchronously.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`ModerationService` lets server-side experience code submit user-generated captures (screenshots taken with [[30 Official Roblox Docs/API Reference/Classes/CaptureService#CaptureScreenshot|CaptureService:CaptureScreenshot()]] and videos recorded with [[30 Official Roblox Docs/API Reference/Classes/CaptureService#StartVideoCaptureAsync|CaptureService:StartVideoCaptureAsync()]]) to Roblox's content moderation pipeline and receive the review results asynchronously.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ModerationService#BindReviewableContentEventProcessor\|BindReviewableContentEventProcessor()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | Registers a server-side processor, ordered by `priority`, that is invoked for each moderation review event on reviewable content. |
| [[30 Official Roblox Docs/API Reference/Classes/ModerationService#CreateReviewableContentAsync\|CreateReviewableContentAsync()]] | string | Registers user-generated captures for moderation review and triggers the owning clients to upload them, returning the reviewable-content ID. |
| [[30 Official Roblox Docs/API Reference/Classes/ModerationService#CreateReviewableContentKey\|CreateReviewableContentKey()]] | string | Returns an opaque key that identifies a screenshot or video capture for use with [[30 Official Roblox Docs/API Reference/Classes/ModerationService#CreateReviewableContentAsync\|CreateReviewableContentAsync()]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### BindReviewableContentEventProcessor

```lua
ModerationService:BindReviewableContentEventProcessor(priority: int, callback: Function): RBXScriptConnection
```

**Thread safety:** Unsafe · **Capabilities:** Consequences

Binds a callback that the server invokes for each moderation review event produced for content registered through [[30 Official Roblox Docs/API Reference/Classes/ModerationService#CreateReviewableContentAsync|CreateReviewableContentAsync()]].

Once at least one processor is bound, review events are delivered to the bound processors in `priority` order. The `callback` function receives a single table with the following fields:

- `Id` — The reviewable-content ID the event refers to.
- `State` — The review state (`ReviewableContentState`).
- `Ref` — The optional caller-supplied reference string passed to [[30 Official Roblox Docs/API Reference/Classes/ModerationService#CreateReviewableContentAsync|CreateReviewableContentAsync()]], present only when one was supplied.
- `ModerationResult` — Present when a moderation result is available, a table with a `Category` (`ModerationResultCategory`) and, when a violation is detected, a `Labels` array of `ModerationResultLabel` values.

Processors run as a chain: if a processor returns `true`, the event is acknowledged, deleted from the backend, and removed from the pending set, and no further processors run for that event. If it returns `false` (or does not return a boolean), the next processor runs; if no processor returns `true`, the event is left unacknowledged and redelivered on a later poll.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `priority` | int |  | Determines the order in which this processor is invoked relative to other bound processors. |
| `callback` | Function |  | The function invoked for each reviewable-content event. It receives a table describing the event and should return `true` to acknowledge the event or `false` to leave it for redelivery. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | A connection that can be disconnected to unregister the processor. |

### CreateReviewableContentAsync

```lua
ModerationService:CreateReviewableContentAsync(config: Dictionary): string
```

**Thread safety:** Unsafe · **Capabilities:** Consequences · **Tags:** `Yields`

Registers one or more captures as a single unit of reviewable content and starts its moderation review. This is a yielding function that must be called on the server and is restricted to allow-listed universes; calling it from a universe that is not permitted to use this API raises an error.

The `config` table accepts:

- `Id` — An optional caller-chosen ID for the reviewable content. Supplying an ID that already exists raises an error.
- `Ref` — An optional reference string echoed back on the events delivered to processors bound with [[30 Official Roblox Docs/API Reference/Classes/ModerationService#BindReviewableContentEventProcessor|BindReviewableContentEventProcessor()]].
- `Content` — A list of items (currently limited to one), each containing either an `Image` or a `Video` table with a `UserId` (the owning player) and a `ContentKey` obtained from [[30 Official Roblox Docs/API Reference/Classes/ModerationService#CreateReviewableContentKey|CreateReviewableContentKey()]].

The method registers the content with the backend and returns the reviewable content ID. Review results are later delivered to bound processors as the moderation review completes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | Dictionary |  | A table of parameters describing the content to review, including an optional `Id`, an optional `Ref`, and a `Content` list of image or video items. |

**Returns**

| Type | Description |
| --- | --- |
| string | The ID of the created reviewable content. |

### CreateReviewableContentKey

```lua
ModerationService:CreateReviewableContentKey(content: Content): string
```

**Thread safety:** Unsafe · **Capabilities:** Consequences

Produces an opaque key that describes a single capture so it can be submitted to [[30 Official Roblox Docs/API Reference/Classes/ModerationService#CreateReviewableContentAsync|CreateReviewableContentAsync()]].

The `content` must reference a supported capture (a temporary content URI produced by [[30 Official Roblox Docs/API Reference/Classes/CaptureService#CaptureScreenshot|CaptureService:CaptureScreenshot()]], a [[30 Official Roblox Docs/API Reference/Classes/ScreenshotCapture|ScreenshotCapture]] object, or a [[30 Official Roblox Docs/API Reference/Classes/VideoCapture|VideoCapture]] object). Any other content raises an error.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `content` | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] |  | A [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] referring to a screenshot or video capture (a temporary URI from [[30 Official Roblox Docs/API Reference/Classes/CaptureService#CaptureScreenshot\|CaptureService:CaptureScreenshot()]], a [[30 Official Roblox Docs/API Reference/Classes/ScreenshotCapture\|ScreenshotCapture]], or a [[30 Official Roblox Docs/API Reference/Classes/VideoCapture\|VideoCapture]]). |

**Returns**

| Type | Description |
| --- | --- |
| string | An opaque content key identifying the capture. |

---
*Source: [ModerationService](https://create.roblox.com/docs/reference/engine/classes/ModerationService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
