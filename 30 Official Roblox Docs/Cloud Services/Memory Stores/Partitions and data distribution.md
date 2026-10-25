---
title: "Partitions and data distribution"
description: "Explains the concept of a partition and how memory stores distribute data."
area: "30 Official Roblox Docs"
cluster: "Cloud Services"
source: "https://create.roblox.com/docs/cloud-services/memory-stores/per-partition-limits"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains the concept of a partition and how memory stores distribute data.*

The MemoryStores API stores data on partitions so it can scale throughput across data structures. Sorted maps and queues each reside on one partition, while hash maps automatically spread items across many partitions. This page explains how that assignment works.

## Partitions

The MemoryStores API stores data on _partitions_, which are just subdivisions of storage. Whenever you write an item to a memory store, that item is stored on exactly one partition. Partitions are fully managed by the MemoryStores API; you do not need to manage them yourself.

## Partition assignment

Partition storage is different according to the data structure an item is being stored on. For sorted maps and queues, each data structure is assigned a single partition.

For example, consider a carnival game with a sorted map called `PlayerScores` and a queue called `PlayerLine` of players waiting to play the game:

*(image in the full Top G Vault)*

Unlike sorted maps and queues, hash maps are allotted multiple partitions, and data is automatically distributed across these partitions. If you were to add a hash map called `Prizes`, the partitions might look like this:

*(image in the full Top G Vault)*

Note how the hash map exists on all partitions, and each partition has some subset of items.

For the request limits that apply to each partition and to individual hash map keys, see [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory stores#Per-partition limits|Per-partition limits]]. For guidance on spreading load across keys and data structures, see [[30 Official Roblox Docs/Cloud Services/Memory Stores/Best practices for memory stores|best practices]].

---
*Source: [Partitions and data distribution](https://create.roblox.com/docs/cloud-services/memory-stores/per-partition-limits) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
