---
title: "HttpService"
description: "Allows sending HTTP requests and provides various web-related and JSON methods."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/HttpService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Allows sending HTTP requests and provides various web-related and JSON methods.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

`HttpService` allows HTTP requests to be sent from experience servers using [[30 Official Roblox Docs/API Reference/Classes/HttpService#RequestAsync|RequestAsync]], [[30 Official Roblox Docs/API Reference/Classes/HttpService#GetAsync|GetAsync]] and [[30 Official Roblox Docs/API Reference/Classes/HttpService#PostAsync|PostAsync]]. This service allows experiences to be integrated with third-party web services such as analytics, data storage, remote server configuration, error reporting, advanced calculations, or real-time communication. Additionally, it can call a subset of the Open Cloud APIs.

For more information about these use cases, see [[30 Official Roblox Docs/Cloud Services/In-game HTTP requests|In-experience HTTP requests]].

`HttpService` also houses the [[30 Official Roblox Docs/API Reference/Classes/HttpService#JSONEncode|JSONEncode]] and [[30 Official Roblox Docs/API Reference/Classes/HttpService#JSONDecode|JSONDecode]] methods, which are useful for communicating with services that use the [JSON](https://json.org) format. In addition, the [[30 Official Roblox Docs/API Reference/Classes/HttpService#GenerateGUID|GenerateGUID]] method provides random 128‑bit labels which can be treated as probabilistically unique in a variety of scenarios.

Within Studio, use [[30 Official Roblox Docs/API Reference/Classes/HttpService#CreateWebStreamClient|CreateWebStreamClient()]] to process data in real time from servers that support streaming protocols such as [SSE](https://en.wikipedia.org/wiki/Server-sent_events), [chunked transfer encoding](https://en.wikipedia.org/wiki/Chunked_transfer_encoding), and [WebSockets](https://en.wikipedia.org/wiki/WebSocket). You can connect callback functions to stream events, allowing you to process data immediately as it arrives instead of waiting for the entire response to complete.

Only send HTTP requests to trusted third-party platforms to avoid introducing unnecessary security risks to your experience.

*Code samples for this API (`Astronauts-in-Space`, `International-Space-Station`, `HttpService-Pastebin`, `OpenCloud-via-HttpService`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/HttpService); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HttpService#HttpEnabled\|HttpEnabled]] | boolean | Indicates whether HTTP requests can be sent to external websites. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HttpService#CreateWebStreamClient\|CreateWebStreamClient()]] | [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient\|WebStreamClient]] | Creates a client that opens a persistent connection to stream data. |
| [[30 Official Roblox Docs/API Reference/Classes/HttpService#GenerateGUID\|GenerateGUID()]] | string | Generates a UUID/GUID random string, optionally with curly braces. |
| [[30 Official Roblox Docs/API Reference/Classes/HttpService#GetAsync\|GetAsync()]] | string | Sends an HTTP `GET` request. |
| [[30 Official Roblox Docs/API Reference/Classes/HttpService#GetSecret\|GetSecret()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Secret\|Secret]] | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/Secret\|Secret]] from the secrets store. |
| [[30 Official Roblox Docs/API Reference/Classes/HttpService#JSONDecode\|JSONDecode()]] | Variant | Decodes a JSON string into a Luau table. |
| [[30 Official Roblox Docs/API Reference/Classes/HttpService#JSONEncode\|JSONEncode()]] | string | Generate a JSON string from a Luau table. |
| [[30 Official Roblox Docs/API Reference/Classes/HttpService#PostAsync\|PostAsync()]] | string | Sends an HTTP `POST` request. |
| [[30 Official Roblox Docs/API Reference/Classes/HttpService#RequestAsync\|RequestAsync()]] | Dictionary | Sends an HTTP request using any HTTP method given a dictionary of information. |
| [[30 Official Roblox Docs/API Reference/Classes/HttpService#UrlEncode\|UrlEncode()]] | string | Replaces URL-unsafe characters with '%' and two hexadecimal characters. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### HttpEnabled

**Type:** boolean

**Security:** read None / write LocalUserSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Network

When set to `true`, allows scripts to send requests to websites using [[30 Official Roblox Docs/API Reference/Classes/HttpService#GetAsync|HttpService:GetAsync()]], [[30 Official Roblox Docs/API Reference/Classes/HttpService#PostAsync|HttpService:PostAsync()]], and [[30 Official Roblox Docs/API Reference/Classes/HttpService#RequestAsync|HttpService:RequestAsync()]].

This property must be toggled on for **unpublished** experiences by setting this property to `true` using the [Command Bar](https://create.roblox.com/docs/studio/ui-overview#command-bar):

`game:GetService("HttpService").HttpEnabled = true`

## Methods

### CreateWebStreamClient

```lua
HttpService:CreateWebStreamClient(streamClientType: WebStreamClientType, requestOptions: Dictionary): WebStreamClient
```

**Thread safety:** Unsafe · **Capabilities:** Network

This method creates a client that establishes a long-lived connection to servers utilizing various streaming technologies, such as [Server-Sent Events (SSE)](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events). After the connection is established, the client fires signals that you can connect callback functions to with [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection|RBXScriptConnection]]. Use these callbacks to process messages as soon as they arrive, as well as respond to open, close, and error events.

There is a limit of four total clients allowed at one time. Close streams that you no longer need with [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient#Close|WebStreamClient:Close()]]. When the stream is no longer needed, you should disconnect any associated [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection|RBXScriptConnections]] to avoid memory leaks.

This method is available in Studio only. If you use it inside scripts, make sure to remove any references before publishing the experience. We encourage you to create plugins with this feature for reusability and ease of use.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `streamClientType` | [[30 Official Roblox Docs/API Reference/Enums/WebStreamClientType\|WebStreamClientType]] |  | The type of streaming connection to intiialize the client with. |
| `requestOptions` | Dictionary |  | A dictionary containing information to be requested from the server. It is identical to `requestOptions` in [[30 Official Roblox Docs/API Reference/Classes/HttpService#RequestAsync\|HttpService:RequestAsync()]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient\|WebStreamClient]] | A stateful client that emits events in the stream lifecycle. |

*Code samples for this member (`HttpService-CreateSSEWebStreamClient`, `HttpService-CreateRawStreamWebStreamClient`) are published on the source page; their code is not part of the open-source repo.*

### GenerateGUID

```lua
HttpService:GenerateGUID(wrapInCurlyBraces: boolean = True): string
```

**Thread safety:** Safe

This method generates a **random universally unique identifier** ([UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier)) string. The sixteen octets of a UUID are represented as 32 hexadecimal (base 16) digits, displayed in five groups separated by hyphens in the form `8-4-4-4-12` for a total of 36 characters, for example `123e4567-e89b-12d3-a456-426655440000`.

The UUID specification used is [Version 4 (random)](https://en.wikipedia.org/wiki/Universally_unique_identifier#Version_4_(random)), variant 1 (DCE 1.1, ISO/IEC 11578:1996). UUIDs of this version are the most commonly used due to their simplicity, as they are entirely randomly generated. Note that this version does not have certain features that other UUID versions have, such as encoded timestamps, MAC addresses, or time-based sorting like [UUIDv7](https://uuid7.com/) or [ULID](https://github.com/ulid/spec).

There are over 5.3×10<sup>36</sup> unique v4 UUIDs, in which the probability of finding a duplicate within 103 trillion UUIDs is one in a billion.

The `wrapInCurlyBraces` argument determines whether the returned string is wrapped in curly braces (`{}`). For instance:

- `true`: `{94b717b2-d54f-4340-a504-bd809ef5bf5c}`
- `false`: `db454790-7563-44ed-ab4b-397ff5df737b`

This method can be used regardless of whether HTTP requests are enabled.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `wrapInCurlyBraces` | boolean | `True` | Whether the returned string should be wrapped in curly braces (`{}`). |

**Returns**

| Type | Description |
| --- | --- |
| string | The randomly generated UUID. |

*Code samples for this member (`HttpService-GenerateGUID`) are published on the source page; their code is not part of the open-source repo.*

### GetAsync

```lua
HttpService:GetAsync(url: Variant, nocache: boolean = False, headers: Variant): string
```

**Thread safety:** Unsafe · **Capabilities:** Network · **Tags:** `Yields`

This method sends an HTTP `GET` request. It functions similarly to [[30 Official Roblox Docs/API Reference/Classes/HttpService#RequestAsync|RequestAsync()]] except that it accepts HTTP request parameters as method parameters instead of a single dictionary and returns only the body of the HTTP response. Generally, this method is useful only as a shorthand and [[30 Official Roblox Docs/API Reference/Classes/HttpService#RequestAsync|RequestAsync()]] should be used in most cases.

When `true`, the `nocache` parameter prevents this method from caching results from previous calls with the same `url`.

The `url` parameter also accepts a [[30 Official Roblox Docs/API Reference/Datatypes/Secret|Secret]] value; use [[30 Official Roblox Docs/API Reference/Classes/HttpService#GetSecret|GetSecret]] combined with [[30 Official Roblox Docs/API Reference/Datatypes/Secret#AddPrefix|AddPrefix]] and [[30 Official Roblox Docs/API Reference/Datatypes/Secret#AddSuffix|AddSuffix]] to safely embed secret credentials (such as API keys) directly in the URL without exposing their values.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `url` | Variant |  | The web address you are requesting data from. |
| `nocache` | boolean | `False` | Whether the request stores (caches) the response. |
| `headers` | Variant |  | Used to specify some HTTP request headers. |

**Returns**

| Type | Description |
| --- | --- |
| string | The GET request's response body. |

*Code samples for this member (`Astronauts-in-Space`, `International-Space-Station`) are published on the source page; their code is not part of the open-source repo.*

### GetSecret

```lua
HttpService:GetSecret(key: string): Secret
```

**Thread safety:** Safe · **Capabilities:** Network

This method returns a value previously added to the secrets store for the experience. The secret content is not printable and not available when the experience runs locally.

The returned [[30 Official Roblox Docs/API Reference/Datatypes/Secret|Secret]] can be transformed using built-in methods such as [[30 Official Roblox Docs/API Reference/Datatypes/Secret#AddPrefix|Secret:AddPrefix()]]. It is expected to be sent as a part of an HTTP request.

For more information, see the [[30 Official Roblox Docs/Cloud Services/Secrets stores|usage guide]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The name of the secret to fetch, matching the identifier under which it was added to the experience's secrets store. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Secret\|Secret]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Secret\|Secret]] wrapping the stored value associated with `key`. |

### JSONDecode

```lua
HttpService:JSONDecode(input: string): Variant
```

**Thread safety:** Safe · **Tags:** `CustomLuaState`

This method transforms a JSON object or array into a Luau [[30 Official Roblox Docs/Luau/Tables|table]] with the following characteristics:

- Keys of the table are strings or numbers but not both. If a JSON object contains both, string keys are ignored.
- An empty JSON object generates an empty Luau table (`{}`).
- If the `input` string is not a valid JSON object, this method will throw an error.

To encode a Luau table into a JSON object, use the [[30 Official Roblox Docs/API Reference/Classes/HttpService#JSONEncode|HttpService:JSONEncode()]] method.

This method can be used regardless of whether HTTP requests are enabled.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | string |  | The JSON object being decoded. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | The decoded JSON object as a Luau table. |

*Code samples for this member (`HttpService-JSONDecode`) are published on the source page; their code is not part of the open-source repo.*

### JSONEncode

```lua
HttpService:JSONEncode(input: Variant): string
```

**Thread safety:** Safe · **Tags:** `CustomLuaState`

This method transforms a Luau [[30 Official Roblox Docs/Luau/Tables|table]] into a JSON object or array based on the following guidelines:

- Keys of the table must be either strings or numbers. If a table contains both, an array takes priority (string keys are ignored).
- An empty Luau table (`{}`) generates an empty JSON array (e.g. `[]`).
- Whether passing a dictionary table or a numerically indexed table, avoid `nil` values for any index.
- Cyclic table references cause an error.

This method allows values such as `inf` and `nan` which are not valid JSON. This may cause problems if you want to use the outputted JSON elsewhere.

This method also accepts [[30 Official Roblox Docs/API Reference/Libraries/buffer|buffers]] up to 50 MiB, which it encodes to base64 (and often compresses) before converting to a JSON object.

To reverse the encoding process and decode a JSON object, use the [[30 Official Roblox Docs/API Reference/Classes/HttpService#JSONDecode|HttpService:JSONDecode()]] method.

This method can be used regardless of whether HTTP requests are enabled.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | Variant |  | The input Luau table. |

**Returns**

| Type | Description |
| --- | --- |
| string | The returned JSON string. |

*Code samples for this member (`HttpService-JSONEncode`) are published on the source page; their code is not part of the open-source repo.*

### PostAsync

```lua
HttpService:PostAsync(url: Variant, data: string, content_type: HttpContentType = ApplicationJson, compress: boolean = False, headers: Variant): string
```

**Thread safety:** Unsafe · **Capabilities:** Network · **Tags:** `Yields`

This method sends an HTTP `POST` request. It functions similarly to [[30 Official Roblox Docs/API Reference/Classes/HttpService#RequestAsync|RequestAsync()]] except that it accepts HTTP request parameters as method parameters instead of a single dictionary and returns only the body of the HTTP response. Generally, this method is useful only as a shorthand and [[30 Official Roblox Docs/API Reference/Classes/HttpService#RequestAsync|RequestAsync()]] should be used in most cases.

When `true`, the `compress` parameter controls whether a large request body is compressed using **gzip**.

The `url` parameter also accepts a [[30 Official Roblox Docs/API Reference/Datatypes/Secret|Secret]] value — use [[30 Official Roblox Docs/API Reference/Classes/HttpService#GetSecret|GetSecret]] combined with [[30 Official Roblox Docs/API Reference/Datatypes/Secret#AddPrefix|AddPrefix]] and [[30 Official Roblox Docs/API Reference/Datatypes/Secret#AddSuffix|AddSuffix]]to safely embed secret credentials (such as API keys) directly in the URL without exposing their values.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `url` | Variant |  | The destination address for the data. |
| `data` | string |  | The data being sent. |
| `content_type` | [[30 Official Roblox Docs/API Reference/Enums/HttpContentType\|HttpContentType]] | `ApplicationJson` | Modifies the value in the `Content-Type` header sent with the request. |
| `compress` | boolean | `False` | Determines whether the data is compressed (**gzipped**) when sent. |
| `headers` | Variant |  | Used to specify some HTTP request headers. |

**Returns**

| Type | Description |
| --- | --- |
| string | The HTTP response sent back indicating the request result. |

*Code samples for this member (`HttpService-Pastebin`) are published on the source page; their code is not part of the open-source repo.*

### RequestAsync

```lua
HttpService:RequestAsync(requestOptions: Dictionary): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Network · **Tags:** `Yields`

This method sends an HTTP request using a dictionary to specify the request data, such as the target URL, method, headers, and request body data. It returns a dictionary that describes the response data received. Optionally, the request can be compressed using [[30 Official Roblox Docs/API Reference/Enums/HttpCompression|Enum.HttpCompression]].

##### Request dictionary fields

| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `Url` | String | yes | The target URL for this request. Must use `http` or `https` protocols. |
| `Method` | String | no | The HTTP method being used by this request, most often `GET` or `POST`. |
| `Headers` | Dictionary | no | A dictionary of headers to be used with this request. Most HTTP headers are accepted here, but not all. |
| `Body` | String | no | The request body. Can be any string, including binary data. Must be excluded when using the `GET` or `HEAD` HTTP methods. It might be necessary to specify the `Content-Type` header when sending JSON or other formats. |
| `Compress` | [[30 Official Roblox Docs/API Reference/Enums/HttpCompression\|Enum.HttpCompression]] | no | An optional compression field that will compress the data in the request. The value can either be [[30 Official Roblox Docs/API Reference/Enums/HttpCompression\|Enum.HttpCompression.None]] or [[30 Official Roblox Docs/API Reference/Enums/HttpCompression\|Enum.HttpCompression.Gzip]]. |
| `Timeout` | Integer | no | An optional timeout value in seconds to make requests time out more quickly. Values must be greater than zero and no greater than the default request timeout. This can be useful when debugging hanging requests. |

##### Supported HTTP methods

The HTTP request methods specify the purpose of the request being made and what is expected if the request is successful. For instance, the `GET` request method tells the server at the requested address that a resource is being requested and, if it succeeds, the resource at that address will be returned. Similarly, the `HEAD` request method does the same except the server knows to return a response without a `Body` element.

| Method | Description | Safe |
| --- | --- | --- |
| `GET`  [ⓘ](https://developer.mozilla.org/docs/Web/HTTP/Methods/GET) | The `GET` method requests the resource at the specified address. Does not support use of the `Body` parameter. | Yes |
| `HEAD`  [ⓘ](https://developer.mozilla.org/docs/Web/HTTP/Methods/HEAD) | The `HEAD` method requests a response identical to a `GET` request, but with no response body. Does not support use of the `Body` parameter. | Yes |
| `POST`  [ⓘ](https://developer.mozilla.org/docs/Web/HTTP/Methods/POST) | The `POST` method submits the supplied `Body` data to the requested address. | No |
| `PUT`  [ⓘ](https://developer.mozilla.org/docs/Web/HTTP/Methods/PUT) | The `PUT` method replaces all current iterations of the resource specified within the supplied `Body` data. | No |
| `DELETE`  [ⓘ](https://developer.mozilla.org/docs/Web/HTTP/Methods/DELETE) | The `DELETE` method deletes the resource specified in the supplied `Body` data at the requested address. | No |
| `OPTIONS`  [ⓘ](https://developer.mozilla.org/docs/Web/HTTP/Methods/OPTIONS) | The `OPTIONS` method requests the permitted communication options for the supplied address. | Yes |
| `TRACE`  [ⓘ](https://developer.mozilla.org/docs/Web/HTTP/Methods/TRACE) | The `TRACE` method performs a message loop-back test along the path to the resource specified in the supplied `Body` data. | Yes |
| `PATCH`  [ⓘ](https://developer.mozilla.org/docs/Web/HTTP/Methods/PATCH) | The `PATCH` method applies partial changes to the resource specified in the supplied `Body` data at the requested address. | No |

##### HTTP headers

In the request dictionary, you can specify custom HTTP headers to use in the request. However, some headers cannot be specified. For example, `Content-Length` is determined from the request body. `User-Agent` and `Roblox-Id` are locked by Roblox. Other headers like `Accept` or `Cache-Control` use default values but can be overridden. More commonly, some REST APIs may require API keys or other service authentication to be specified in request headers.

The `RequestAsync()` method does not detect the format of body content. Many web servers require the `Content-Type` header be set appropriately when sending certain formats. Other methods of [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]] use the [[30 Official Roblox Docs/API Reference/Enums/HttpContentType|Enum.HttpContentType]] enum; for this method set the `Content-Type` header appropriately: `text/plain`, `text/xml`, `application/xml`, `application/json` or `application/x-www-form-urlencoded` are replacement `Content-Type` header values for the respective enum values.

##### Response dictionary fields

`RequestAsync()` returns a dictionary containing the following fields:

| Name | Type | Description |
| --- | --- | --- |
| `Success` | Boolean | The success status of the request. This is true if and only if the `StatusCode` lies within the range `200`-`299`. |
| `StatusCode` | Integer | The HTTP response code identifying the status of the response. |
| `StatusMessage` | String | The status message that was sent back. |
| `Headers` | Dictionary | A dictionary of headers that were set in this response. |
| `Body` |  | The request body (content) received in the response. |

##### Error Cases

`RequestAsync()` raises an error if the response times out or if the target server rejects the request. If a web service goes down for some reason, it can cause scripts that use this method to stop functioning altogether. It is often a good idea to wrap calls to this method in [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]] and gracefully handle failure cases if the required information isn't available.

##### Limitations

The current limitation for sending and receiving **external** HTTP requests is 500 requests per minute. There is also a separate limit of 2500 requests per minute for [[30 Official Roblox Docs/Cloud Services/In-game HTTP requests#Use with Open Cloud|Open Cloud requests]]. Requests over these thresholds will fail.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `requestOptions` | Dictionary |  | A dictionary containing information to be requested from the server specified. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary containing response information from the server specified. |

*Code samples for this member (`sending-an-http-request`, `OpenCloud-via-HttpService`) are published on the source page; their code is not part of the open-source repo.*

### UrlEncode

```lua
HttpService:UrlEncode(input: string): string
```

**Thread safety:** Safe · **Capabilities:** Network

This method [percent-encodes](https://en.wikipedia.org/wiki/Percent-encoding) a given string so that reserved characters properly encoded with `%` and two hexadecimal characters.

This is useful when formatting URLs for use with [[30 Official Roblox Docs/API Reference/Classes/HttpService#GetAsync|HttpService:GetAsync()]]/[[30 Official Roblox Docs/API Reference/Classes/HttpService#PostAsync|HttpService:PostAsync()]], or `POST` data of the media type `application/x-www-form-urlencoded` ([[30 Official Roblox Docs/API Reference/Enums/HttpContentType|Enum.HttpContentType.ApplicationUrlEncoded]]).

For instance, when you encode the URL `https://www.roblox.com/discover#/`, this method returns `https%3A%2F%2Fwww%2Eroblox%2Ecom%2Fdiscover%23%2F`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | string |  | The string (URL) to encode. |

**Returns**

| Type | Description |
| --- | --- |
| string | The encoded string. |

*Code samples for this member (`HttpService-UrlEncode`, `HttpService-Pastebin`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [HttpService](https://create.roblox.com/docs/reference/engine/classes/HttpService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
