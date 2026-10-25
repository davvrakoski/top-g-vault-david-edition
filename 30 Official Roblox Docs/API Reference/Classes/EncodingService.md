---
title: "EncodingService"
description: "Service providing common encoding, hashing, and compression methods."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/EncodingService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Service providing common encoding, hashing, and compression methods.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

Service providing common encoding, hashing, and compression methods.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/EncodingService#Base64Decode\|Base64Decode()]] | buffer | Decodes a Base64-encoded buffer into a new buffer containing the original binary data. |
| [[30 Official Roblox Docs/API Reference/Classes/EncodingService#Base64Encode\|Base64Encode()]] | buffer | Encodes binary data from a buffer into Base64 format, returning the result as a new buffer. |
| [[30 Official Roblox Docs/API Reference/Classes/EncodingService#CompressBuffer\|CompressBuffer()]] | buffer | Compresses binary buffer data using the specified algorithm and compression level. |
| [[30 Official Roblox Docs/API Reference/Classes/EncodingService#ComputeBufferHash\|ComputeBufferHash()]] | buffer | Computes a cryptographic hash of a buffer's binary data using the specified algorithm. |
| [[30 Official Roblox Docs/API Reference/Classes/EncodingService#ComputeStringHash\|ComputeStringHash()]] | string | Computes a cryptographic hash of a string using the specified algorithm. |
| [[30 Official Roblox Docs/API Reference/Classes/EncodingService#DecompressBuffer\|DecompressBuffer()]] | buffer | Decompresses binary buffer data that was compressed with the specified algorithm. |
| [[30 Official Roblox Docs/API Reference/Classes/EncodingService#GetDecompressedBufferSize\|GetDecompressedBufferSize()]] | int? | Returns the expected decompressed size of a compressed buffer, or nil if the size is unknown or invalid. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### Base64Decode

```lua
EncodingService:Base64Decode(input: buffer): buffer
```

**Thread safety:** Safe

Method takes a [[30 Official Roblox Docs/API Reference/Libraries/buffer|buffer]] with data encoded in Base64 format and decodes it into a new [[30 Official Roblox Docs/API Reference/Libraries/buffer|buffer]].

If the input is not valid Base64 data, this method throws an error.

Base64 data is most often used for binary data encoding, so these functions are designed to work on [[30 Official Roblox Docs/API Reference/Libraries/buffer|buffer]] values.

If the data is stored in a string, [[30 Official Roblox Docs/API Reference/Libraries/buffer#fromstring|buffer.fromstring]] can be used to quickly convert it into a buffer.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | buffer |  | [[30 Official Roblox Docs/API Reference/Libraries/buffer\|buffer]] containing Base64 data to decode |

**Returns**

| Type | Description |
| --- | --- |
| buffer | [[30 Official Roblox Docs/API Reference/Libraries/buffer\|buffer]] with the decoded result |

### Base64Encode

```lua
EncodingService:Base64Encode(input: buffer): buffer
```

**Thread safety:** Safe

Method takes a [[30 Official Roblox Docs/API Reference/Libraries/buffer|buffer]] with binary data and encodes it using Base64.

Encoded result is returned as a new [[30 Official Roblox Docs/API Reference/Libraries/buffer|buffer]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | buffer |  | [[30 Official Roblox Docs/API Reference/Libraries/buffer\|buffer]] containing binary data to encode |

**Returns**

| Type | Description |
| --- | --- |
| buffer | [[30 Official Roblox Docs/API Reference/Libraries/buffer\|buffer]] with the encoded result |

### CompressBuffer

```lua
EncodingService:CompressBuffer(input: buffer, algorithm: CompressionAlgorithm, compressionLevel: int = 1): buffer
```

**Thread safety:** Safe

Compresses the binary data stored in a [[30 Official Roblox Docs/API Reference/Libraries/buffer|buffer]] using the specified compression algorithm and compression level. The higher the compression level, the longer it takes to compress, but the resulting compression ratio might increase.

For [[30 Official Roblox Docs/API Reference/Enums/CompressionAlgorithm|Enum.CompressionAlgorithm.Zstd]], the allowed compression values are from -7 to 22 inclusive.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | buffer |  | [[30 Official Roblox Docs/API Reference/Libraries/buffer\|buffer]] with binary data to compress |
| `algorithm` | [[30 Official Roblox Docs/API Reference/Enums/CompressionAlgorithm\|CompressionAlgorithm]] |  | [[30 Official Roblox Docs/API Reference/Enums/CompressionAlgorithm\|Enum.CompressionAlgorithm]] to use for compression |
| `compressionLevel` | int | `1` | optional integer compression level to use |

**Returns**

| Type | Description |
| --- | --- |
| buffer | [[30 Official Roblox Docs/API Reference/Libraries/buffer\|buffer]] with compressed binary data |

### ComputeBufferHash

```lua
EncodingService:ComputeBufferHash(input: buffer, algorithm: HashAlgorithm): buffer
```

**Thread safety:** Safe

Uses a [cryptographic hash function](https://en.wikipedia.org/wiki/Cryptographic_hash_function) to compute a hash of the input [[30 Official Roblox Docs/API Reference/Libraries/buffer|buffer]]. Returns a new [[30 Official Roblox Docs/API Reference/Libraries/buffer|buffer]] with the binary data.

See descriptions of [[30 Official Roblox Docs/API Reference/Enums/HashAlgorithm|Enum.HashAlgorithm]] to learn of the supported digest size for each hash.

#### Do not use this for passwords

None of these hashes are password hashing algorithms. They were designed to be fast to execute, whereas password hashing should never be fast. You shouldn't use this function for computing password hashes that will be stored, or for deriving keys from passwords.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | buffer |  | [[30 Official Roblox Docs/API Reference/Libraries/buffer\|buffer]] with binary data to compute hash for |
| `algorithm` | [[30 Official Roblox Docs/API Reference/Enums/HashAlgorithm\|HashAlgorithm]] |  | [[30 Official Roblox Docs/API Reference/Enums/HashAlgorithm\|Enum.HashAlgorithm]] cryptographic hash function |

**Returns**

| Type | Description |
| --- | --- |
| buffer | [[30 Official Roblox Docs/API Reference/Libraries/buffer\|buffer]] with the binary data of the hash |

### ComputeStringHash

```lua
EncodingService:ComputeStringHash(input: string, algorithm: HashAlgorithm): string
```

**Thread safety:** Safe

Uses a [cryptographic hash function](https://en.wikipedia.org/wiki/Cryptographic_hash_function) to compute a hash of the input string. Returns a new string with the binary data.

See descriptions of [[30 Official Roblox Docs/API Reference/Enums/HashAlgorithm|Enum.HashAlgorithm]] to learn of the supported digest size for each hash.

#### Do not use this for passwords

None of these hashes are password hashing algorithms. They were designed to be fast to execute, whereas password hashing should never be fast. You shouldn't use this function for computing password hashes that will be stored, or for deriving keys from passwords.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | string |  | string to compute the hash for |
| `algorithm` | [[30 Official Roblox Docs/API Reference/Enums/HashAlgorithm\|HashAlgorithm]] |  | [[30 Official Roblox Docs/API Reference/Enums/HashAlgorithm\|Enum.HashAlgorithm]] cryptographic hash function |

**Returns**

| Type | Description |
| --- | --- |
| string | String with the binary data of the hash |

### DecompressBuffer

```lua
EncodingService:DecompressBuffer(input: buffer, algorithm: CompressionAlgorithm): buffer
```

**Thread safety:** Safe

Decompresses the binary data stored in a [[30 Official Roblox Docs/API Reference/Libraries/buffer|buffer]] using the specified compression algorithm.

Decompression might throw an error if the compressed data doesn't contain expected decompressed size, if it is larger than 1GB or if it is invalid.

It is recommended to use [[30 Official Roblox Docs/API Reference/Classes/EncodingService#GetDecompressedBufferSize|EncodingService.GetDecompressedBufferSize]] to find out the decompressed data size before attempting to decompress. This is very important if the input buffer contents are outside of your control (for example, from a client [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]])

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | buffer |  | [[30 Official Roblox Docs/API Reference/Libraries/buffer\|buffer]] with compressed binary data |
| `algorithm` | [[30 Official Roblox Docs/API Reference/Enums/CompressionAlgorithm\|CompressionAlgorithm]] |  | [[30 Official Roblox Docs/API Reference/Enums/CompressionAlgorithm\|Enum.CompressionAlgorithm]] to use for decompression |

**Returns**

| Type | Description |
| --- | --- |
| buffer | [[30 Official Roblox Docs/API Reference/Libraries/buffer\|buffer]] with the decompressed binary data |

### GetDecompressedBufferSize

```lua
EncodingService:GetDecompressedBufferSize(input: buffer, algorithm: CompressionAlgorithm): int?
```

**Thread safety:** Safe

Reports the size of the decompressed data stored in a compressed [[30 Official Roblox Docs/API Reference/Libraries/buffer|buffer]]. If the compressed data doesn't have a size or the size is corrupted or invalid (larger than 1GB), function returns `nil`. When a `nil` is returned, attempting to use [[30 Official Roblox Docs/API Reference/Classes/EncodingService#DecompressBuffer|EncodingService.DecompressBuffer]] on this [[30 Official Roblox Docs/API Reference/Libraries/buffer|buffer]] will throw an error.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | buffer |  | [[30 Official Roblox Docs/API Reference/Libraries/buffer\|buffer]] with compressed binary data |
| `algorithm` | [[30 Official Roblox Docs/API Reference/Enums/CompressionAlgorithm\|CompressionAlgorithm]] |  | [[30 Official Roblox Docs/API Reference/Enums/CompressionAlgorithm\|Enum.CompressionAlgorithm]] used to compress it |

**Returns**

| Type | Description |
| --- | --- |
| int? | Integer size of the decompressed data or 'nil' |

---
*Source: [EncodingService](https://create.roblox.com/docs/reference/engine/classes/EncodingService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
