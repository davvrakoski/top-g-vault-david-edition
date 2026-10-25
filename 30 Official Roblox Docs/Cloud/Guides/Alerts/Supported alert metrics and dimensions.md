---
title: "Supported alert metrics and dimensions"
description: "Lists supported metrics and dimensions for analytics alerts."
area: "30 Official Roblox Docs"
cluster: "Cloud"
source: "https://create.roblox.com/docs/cloud/guides/alerts/metrics"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Lists supported metrics and dimensions for analytics alerts.*

Analytics alerts support the following metrics and dimensions. All values are case-sensitive. These same supported metrics and dimensions apply whether you use the [[30 Official Roblox Docs/Production/Analytics/Alerts|Alerts]] dashboard or the [[30 Official Roblox Docs/Cloud/Guides/Alerts/Analytics alerts|API]].

## Supported metrics

### Alert

| Name                                          | Metric                                                                                                                                                                                                                                                                                       | Supported dimensions                                                                                                                                                                                                                            |
| --------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Client CPU time                               | `ClientCpuTimeAvg`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                                                                                               |

- `ClientCpuTimeCategory`
- `ClientCpuTimeSubCategory`
- `MemoryGroup`
- `OperatingSystem`
- `Place` (filter only)
- `Platform`

 |
| Client crash count                            | `ClientCrashCount`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                                                                                               |

- `MemoryGroup`
- `OperatingSystem`
- `Place` (filter only)
- `Platform`

                                                                                          |
| Client crash rate                             | `ClientCrashRate15m`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                                                                                             |

- `MemoryGroup`
- `OperatingSystem`
- `Place` (filter only)
- `Platform`

                                                                                          |
| Client frame rate                             | `ClientFpsAvg`<br>`ClientFpsP10`<br>`ClientFpsP50`<br>`ClientFpsP90`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                         |

- `MemoryGroup`
- `OperatingSystem`
- `Place` (filter only)
- `Platform`

                                                                                          |
| Client memory usage                           | `ClientMemoryUsageAvg`<br>`ClientMemoryUsageP10`<br>`ClientMemoryUsageP50`<br>`ClientMemoryUsageP90`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                         |

- `MemoryGroup`
- `OperatingSystem`
- `Place` (filter only)
- `Platform`

                                                                                          |
| Client memory usage percentage                | `ClientMemoryUsagePercentageAvg`<br>`ClientMemoryUsagePercentageP10`<br>`ClientMemoryUsagePercentageP50`<br>`ClientMemoryUsagePercentageP90`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `MemoryGroup`
- `OperatingSystem`
- `Place` (filter only)
- `Platform`

                                                                                          |
| Cross-server messaging fanout ratio           | `CsmFanoutRatio`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                                                                                                 |                                                                                                                                                                                                                                                 |
| Cross-server messaging connected game servers | `CsmGameServersConnectedCount`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                                                                                   |                                                                                                                                                                                                                                                 |
| Cross-server messaging message size           | `CsmMessageSizeBytes`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                                                                                            |                                                                                                                                                                                                                                                 |
| Cross-server messaging published messages     | `CsmPublishedMessagesCount`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                                                                                      |                                                                                                                                                                                                                                                 |
| Cross-server messaging received messages      | `CsmReceivedMessagesCount`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                                                                                       |                                                                                                                                                                                                                                                 |
| List request quota consumption                | `DataStoreConsumedListRequests`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                                                                                  |

- `DataStoreRequestSource`
- `DataStoreTypeV2`

                                                                                                                                                      |
| Read request quota consumption                | `DataStoreConsumedReadRequests`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                                                                                  |

- `DataStoreRequestSource`
- `DataStoreTypeV2`

                                                                                                                                                      |
| Remove request quota consumption              | `DataStoreConsumedRemoveRequests`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                                                                                |

- `DataStoreRequestSource`
- `DataStoreTypeV2`

                                                                                                                                                      |
| Write request quota consumption               | `DataStoreConsumedWriteRequests`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                                                                                 |

- `DataStoreRequestSource`
- `DataStoreTypeV2`

                                                                                                                                                      |
| Request count by API and status               | `DataStoreRequests`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                                                                                              |

- `DataStoreOperation`
- `DataStoreStatus`
- `DataStoreTypeV2`

                                                                                                                     |
| HTTP service request count                    | `HttpServiceRequestsCount`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                                                                                       |

- `HttpServiceDomains` (filter only)
- `HttpServiceMethod`
- `HttpServiceStatus`
- `Place` (filter only)

                                                          |
| HTTP service response time                    | `HttpServiceResponseTimeAvg`<br>`HttpServiceResponseTimeP10`<br>`HttpServiceResponseTimeP50`<br>`HttpServiceResponseTimeP90`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                 |

- `HttpServiceDomains` (filter only)
- `HttpServiceMethod`
- `Place` (filter only)

                                                                                                 |
| Memory Store request count by API and status  | `MemoryStoreRequests`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                                                                                            |

- `MemoryStoreOperation`
- `MemoryStoreStatus`

                                                                                                                                                      |
| Unexpected out of memory exits                | `OomUnexpectedExits`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                                                                                             |

- `MemoryGroup`
- `OperatingSystem`
- `Place` (filter only)
- `Platform`

                                                                                          |
| Peak concurrent players                       | `PeakConcurrentPlayers`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                                                                                          |

- `MemoryGroup`
- `OperatingSystem`
- `Place` (filter only)
- `Platform`

                                                                                          |
| Server CPU time                               | `CpuTimeAvg`<br>`CpuTimeP10`<br>`CpuTimeP50`<br>`CpuTimeP90`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                                                 |

- `CpuTimeCategory`
- `CpuTimeSubCategory`
- `Place` (filter only)

                                                                                                                 |
| Server frame rate                             | `ServerFrameRateAvg`<br>`ServerFrameRateP10`<br>`ServerFrameRateP50`<br>`ServerFrameRateP90`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                                                 |

- `Place` (filter only)

                                                                                                                                                                                              |
| Server memory usage by age                    | `MemoryUsageAvg`<br>`MemoryUsageP10`<br>`MemoryUsageP50`<br>`MemoryUsageP90`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay, None<br>**Data retention:** 28 days                                                           |

- `MemoryUsageCategory`
- `MemoryUsageSubCategory`
- `Place` (filter only)

                                                                                                         |
| Server memory usage                           | `MemoryUsageAvg`<br>`MemoryUsageP10`<br>`MemoryUsageP50`<br>`MemoryUsageP90`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay, None<br>**Data retention:** 28 days                                                           |

- `MemoryUsageCategory`
- `MemoryUsageSubCategory`
- `Place` (filter only)

                                                                                                         |
| Session time                                  | `SessionDurationSecondsAvg`<br>`SessionDurationSecondsP10`<br>`SessionDurationSecondsP50`<br>`SessionDurationSecondsP90`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days                     |

- `MemoryGroup`
- `OperatingSystem`
- `Place` (filter only)
- `Platform`

                                                                                          |

---
*Source: [Supported alert metrics and dimensions](https://create.roblox.com/docs/cloud/guides/alerts/metrics) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
