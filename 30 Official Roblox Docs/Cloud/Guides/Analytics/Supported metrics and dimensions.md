---
title: "Supported metrics and dimensions"
description: "Lists supported metrics and dimensions for the Open Cloud Analytics API."
area: "30 Official Roblox Docs"
cluster: "Cloud"
source: "https://create.roblox.com/docs/cloud/guides/analytics/metrics"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Lists supported metrics and dimensions for the Open Cloud Analytics API.*

The Analytics Query API supports numerous metrics and dimensions. Refer to the following tables for the comprehensive list. All values are case-sensitive.

## Supported metrics

### Retention

See [[30 Official Roblox Docs/Production/Analytics/Retention|Retention]].

| Name | Metric | Supported dimensions |
| --- | --- | --- |
| Day 1 retention | `ForwardD1Retention`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AcquisitionSource`
- `AgeGroupV2`
- `Country`
- `Gender`
- `Locale`
- `OperatingSystem`
- `Platform`
- `UserO18Eligibility`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Day 7 retention | `ForwardD7Retention`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AcquisitionSource`
- `AgeGroupV2`
- `Country`
- `Gender`
- `Locale`
- `OperatingSystem`
- `Platform`
- `UserO18Eligibility`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Day 30 retention | `ForwardD30Retention`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AcquisitionSource`
- `AgeGroupV2`
- `Country`
- `Gender`
- `Locale`
- `OperatingSystem`
- `Platform`
- `UserO18Eligibility`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Daily cohort retention | `DailyCohortRetention`<br><br>**Granularities:** None, OneDay<br>**Data retention:** 1468 days |

- `AcquisitionSource`
- `AgeGroupV2`
- `CohortDay`
- `Country`
- `Gender`
- `Locale`
- `OperatingSystem`
- `Platform`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Weekly cohort retention | `WeeklyCohortRetention`<br><br>**Granularities:** None, OneWeek<br>**Data retention:** 1468 days |

- `AcquisitionSource`
- `AgeGroupV2`
- `CohortWeek`
- `Country`
- `Gender`
- `Locale`
- `OperatingSystem`
- `Platform`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Stickiness (DAU/MAU) | `DauMauStickiness`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Country`
- `Gender`
- `Locale`
- `OperatingSystem`
- `Platform`
- `UserO18Eligibility`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |

### Engagement

See [[30 Official Roblox Docs/Production/Analytics/Engagement|Engagement]].

| Name | Metric | Supported dimensions |
| --- | --- | --- |
| Average playtime | `AveragePlayTimeMinutesPerDAU`<br><br>**Granularities:** OneDay, OneWeek, OneMonth, None<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Country`
- `Gender`
- `IsNewUser`
- `Locale`
- `OperatingSystem`
- `Platform`
- `UserO18Eligibility`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Average session time | `AverageSessionLengthMinutes`<br><br>**Granularities:** OneDay, OneWeek, OneMonth, None<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Country`
- `Gender`
- `IsNewUser`
- `Locale`
- `OperatingSystem`
- `Platform`
- `UserO18Eligibility`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Daily active users | `DailyActiveUsers`<br><br>**Granularities:** OneDay, OneWeek, OneMonth, None<br>**Data retention:** 1468 days |

- `AcquisitionSource`
- `AgeGroupV2`
- `Country`
- `Gender`
- `IsNewUser`
- `Locale`
- `OperatingSystem`
- `Platform`
- `UserO18Eligibility`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Monthly active users | `MonthlyActiveUsers`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Country`
- `Gender`
- `IsNewUser`
- `Locale`
- `OperatingSystem`
- `Platform`
- `UserO18Eligibility`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Playtime | `TotalPlayTimeHours`<br><br>**Granularities:** OneDay, OneWeek, OneMonth, None<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Country`
- `Gender`
- `IsNewUser`
- `Locale`
- `OperatingSystem`
- `Platform`
- `UserO18Eligibility`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| New user first session retention | `TotalSessionsEndedInBucket`<br><br>**Granularities:** OneDay, OneWeek, OneMonth, None<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`
- `OperatingSystem`
- `Platform`
- `SessionTimeBucket`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Sessions | `Visits`<br><br>**Granularities:** OneDay, OneWeek, OneMonth, None<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Country`
- `Gender`
- `IsNewUser`
- `Locale`
- `OperatingSystem`
- `Platform`
- `UserO18Eligibility`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |

### Monetization

See [[30 Official Roblox Docs/Production/Analytics/Monetization|Monetization]].

| Name | Metric | Supported dimensions |
| --- | --- | --- |
| Average revenue per paying user (ARPPU) | `AverageRevenuePerPayingUser`<br><br>**Granularities:** OneDay, OneWeek, OneMonth, None<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Country`
- `Gender`
- `Locale`
- `OperatingSystem`
- `Platform`
- `UserO18Eligibility`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Average revenue per DAU (ARPDAU) | `AverageRevenuePerUser`<br><br>**Granularities:** OneDay, OneWeek, OneMonth, None<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Country`
- `Gender`
- `Locale`
- `OperatingSystem`
- `Platform`
- `UserO18Eligibility`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Revenue | `DailyRevenue`<br><br>**Granularities:** OneDay, OneWeek, OneMonth, None<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `BalanceType`
- `Country`
- `Gender`
- `Locale`
- `OperatingSystem`
- `Platform`
- `RevenueSource`
- `UserO18Eligibility`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Robux Spent (Realtime) | `ItemMonetizationRevenue`<br><br>**Granularities:** OneHour, OneDay, None<br>**Data retention:** 1468 days |

- `CollectibleItemTargetType`
- `CollectibleItemTargetTypeId`
- `CollectibleItemType`
- `ProductKey`
- `ProductType`
- `SalesLocation`

 |
| Paying users | `PayingUsers`<br><br>**Granularities:** OneDay, OneWeek, OneMonth, None<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Country`
- `Gender`
- `Locale`
- `OperatingSystem`
- `Platform`
- `UserO18Eligibility`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Payer conversion rate | `PayingUsersCVR`<br><br>**Granularities:** OneDay, OneWeek, OneMonth, None<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Country`
- `Gender`
- `Locale`
- `OperatingSystem`
- `Platform`
- `UserO18Eligibility`
- `UserSegmentationAccountAge`
- `UserSegmentationActivationStatus`
- `UserSegmentationEngagementLevel`
- `UserSegmentationPayerStatus`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |

### Acquisition

See [[30 Official Roblox Docs/Production/Analytics/Acquisition|Acquisition]].

| Name | Metric | Supported dimensions |
| --- | --- | --- |
| Users detail page CTR | `ClickCVR`<br><br>**Granularities:** OneDay, None<br>**Data retention:** 1468 days |

- `AcquisitionSource`
- `AgeGroupV2`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `Platform`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Play rate per unique user | `EndToEndCVR`<br><br>**Granularities:** OneDay, None<br>**Data retention:** 1468 days |

- `AcquisitionSource`
- `AgeGroupV2`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `Platform`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Users impression CTR | `ImpressionCVR`<br><br>**Granularities:** OneDay, None<br>**Data retention:** 1468 days |

- `AcquisitionSource`
- `AgeGroupV2`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `Platform`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Qualified play through rate per user | `QualifiedEndToEndCVR`<br><br>**Granularities:** OneDay, None<br>**Data retention:** 1468 days |

- `AcquisitionSource`
- `AgeGroupV2`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `Platform`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Unique users with qualified plays | `QualifiedUniqueUsersWithPlaySessions`<br><br>**Granularities:** OneDay, None, OneWeek<br>**Data retention:** 1468 days |

- `AcquisitionSource`
- `AgeGroupV2`
- `FunnelSource`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `Platform`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Users with detail page visits | `UniqueUsersWithClicks`<br><br>**Granularities:** OneDay, None<br>**Data retention:** 1468 days |

- `AcquisitionSource`
- `AgeGroupV2`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `Platform`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Unique users with impressions | `UniqueUsersWithImpressions`<br><br>**Granularities:** OneDay, None<br>**Data retention:** 1468 days |

- `AcquisitionSource`
- `AgeGroupV2`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `Platform`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |
| Unique users with plays | `UniqueUsersWithPlaySessions`<br><br>**Granularities:** OneDay, None, OneWeek<br>**Data retention:** 1468 days |

- `AcquisitionSource`
- `AgeGroupV2`
- `FunnelSource`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `Platform`
- `UserSegmentationPlatformActivationStatus`
- `UserSegmentationPlatformSpenderStatus`

 |

### Home recommendation signals

See [[30 Official Roblox Docs/General/Discovery#Understand your metrics in Creator Analytics|Discovery]].

| Name | Metric | Supported dimensions |
| --- | --- | --- |
| Play through rate | `RFYPlayThroughRate`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| First play bounce rate (0-60s) | `RFYDuration0To60`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| First play bounce rate (61-180s) | `RFYDuration61To180`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| Play days per user (days 2-7) | `RFYD2To7PlayDays`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| Play days per user (days 8-28) | `RFYD8To28PlayDays`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| Playtime per user (day 1) | `RFYD1Playtime`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| Playtime per user (days 2-7) | `RFYD2To7Playtime`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| Playtime per user (days 8-28) | `RFYD8To28Playtime`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| Intentional co-play days per user (day 1) | `RFYD1CoplayDays`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| Intentional co-play days per user (days 2-7) | `RFYD2To7CoplayDays`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| Intentional co-play days per user (days 8-28) | `RFYD8To28CoplayDays`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| Qualified play sessions per user (day 1) | `RFYD1QualifiedPlaySessions`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| Qualified play sessions per user (days 2-7) | `RFYD2To7QualifiedPlaySessions`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| Qualified play sessions per user (days 8-28) | `RFYD8To28QualifiedPlaySessions`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| Spend days per user (day 1) | `RFYD1SpendDay`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| Spend days per user (days 2-7) | `RFYD2To7SpendDays`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| Spend days per user (days 8-28) | `RFYD8To28SpendDays`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| Robux spent per user (day 1) | `RFYD1RobuxSpend`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| Robux spent per user (days 2-7) | `RFYD2To7RobuxSpend`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |
| Robux spent per user (days 8-28) | `RFYD8To28RobuxSpend`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroupV2`
- `Gender`

 |

### Performance & Stability

See [[30 Official Roblox Docs/Production/Analytics/Performance|Performance]].

| Name | Metric | Supported dimensions |
| --- | --- | --- |
| Client CPU time | `ClientCpuTimeAvg`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `ClientCpuTimeCategory`
- `ClientCpuTimeSubCategory`
- `MemoryGroup`
- `OperatingSystem`
- `Place`
- `PlaceVersion`
- `Platform`

 |
| Client crash count | `ClientCrashCount`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `MemoryGroup`
- `OperatingSystem`
- `Place`
- `PlaceVersion`
- `Platform`

 |
| Client crash rate | `ClientCrashRate15m`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `MemoryGroup`
- `OperatingSystem`
- `Place`
- `PlaceVersion`
- `Platform`

 |
| Client frame rate | `ClientFpsAvg`<br>`ClientFpsP10`<br>`ClientFpsP50`<br>`ClientFpsP90`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `MemoryGroup`
- `OperatingSystem`
- `Place`
- `PlaceVersion`
- `Platform`

 |
| Client memory usage | `ClientMemoryUsageAvg`<br>`ClientMemoryUsageP10`<br>`ClientMemoryUsageP50`<br>`ClientMemoryUsageP90`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `MemoryGroup`
- `OperatingSystem`
- `Place`
- `PlaceVersion`
- `Platform`

 |
| Client memory usage percentage | `ClientMemoryUsagePercentageAvg`<br>`ClientMemoryUsagePercentageP10`<br>`ClientMemoryUsagePercentageP50`<br>`ClientMemoryUsagePercentageP90`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `MemoryGroup`
- `OperatingSystem`
- `Place`
- `PlaceVersion`
- `Platform`

 |
| CPU core utilization | `CpuCoreUtilization`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `Place`

 |
| Unexpected out of memory exits | `OomUnexpectedExits`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `MemoryGroup`
- `OperatingSystem`
- `Place`
- `PlaceVersion`
- `Platform`

 |
| Peak concurrent players | `PeakConcurrentPlayers`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `MemoryGroup`
- `OperatingSystem`
- `Place`
- `PlaceVersion`
- `Platform`

 |
| Client API calls in first 60s after join | `RotraceTotalCalls`<br><br>**Granularities:** OneDay, OneHour, None<br>**Data retention:** 365 days |

- `SimplifiedUrl`

 |
| Server CPU time | `CpuTimeAvg`<br>`CpuTimeP10`<br>`CpuTimeP50`<br>`CpuTimeP90`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `CpuTimeCategory`
- `CpuTimeSubCategory`
- `Place`

 |
| Server crashes | `ServerCrashCount`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `CrashType`
- `Place`

 |
| Server frame rate | `ServerFrameRateAvg`<br>`ServerFrameRateP10`<br>`ServerFrameRateP50`<br>`ServerFrameRateP90`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `Place`

 |
| Server memory usage by age | `MemoryUsageAvg`<br>`MemoryUsageP10`<br>`MemoryUsageP50`<br>`MemoryUsageP90`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay, None<br>**Data retention:** 28 days |

- `MemoryUsageCategory`
- `MemoryUsageSubCategory`
- `Place`
- `ServerAgeBucket`

 |
| Server memory usage | `MemoryUsageAvg`<br>`MemoryUsageP10`<br>`MemoryUsageP50`<br>`MemoryUsageP90`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay, None<br>**Data retention:** 28 days |

- `MemoryUsageCategory`
- `MemoryUsageSubCategory`
- `Place`
- `ServerAgeBucket`

 |
| Session time | `SessionDurationSecondsAvg`<br>`SessionDurationSecondsP10`<br>`SessionDurationSecondsP50`<br>`SessionDurationSecondsP90`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `MemoryGroup`
- `OperatingSystem`
- `Place`
- `PlaceVersion`
- `Platform`

 |

### Economy

See [[30 Official Roblox Docs/Production/Analytics/Economy events|Economy]].

| Name | Metric | Supported dimensions |
| --- | --- | --- |
| Average wallet balance | `EconomyAverageWalletBalance`<br><br>**Granularities:** OneDay, OneHour, OneWeek, OneMonth, None<br>**Data retention:** 1468 days |

- `AgeGroup`
- `CurrencyType`
- `CustomField1`
- `CustomField2`
- `CustomField3`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `PayerStatus`
- `Platform`

 |
| Transaction amount | `EconomyTransactionAmount`<br><br>**Granularities:** OneDay, OneHour, OneWeek, OneMonth, None<br>**Data retention:** 1468 days |

- `AgeGroup`
- `CurrencyType`
- `CustomField1`
- `CustomField2`
- `CustomField3`
- `FlowType`
- `Gender`
- `IsNewUser`
- `ItemSku`
- `OperatingSystem`
- `PayerStatus`
- `Platform`
- `TransactionType`

 |
| Transactions | `EconomyTransactionCount`<br><br>**Granularities:** OneDay, OneHour, OneWeek, OneMonth, None<br>**Data retention:** 1468 days |

- `AgeGroup`
- `CurrencyType`
- `CustomField1`
- `CustomField2`
- `CustomField3`
- `FlowType`
- `Gender`
- `IsNewUser`
- `ItemSku`
- `OperatingSystem`
- `PayerStatus`
- `Platform`
- `TransactionType`

 |

### Funnels

See [[30 Official Roblox Docs/Production/Analytics/Funnel events|Funnels]].

| Name | Metric | Supported dimensions |
| --- | --- | --- |
| Cohort completion rate | `FunnelCohortCompletionRate`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroup`
- `CustomField1`
- `CustomField2`
- `CustomField3`
- `FunnelName`
- `FunnelStep`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `PayerStatus`
- `Platform`

 |
| Session cohort completion rate | `FunnelCohortSessionCompletionRate`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AgeGroup`
- `CustomField1`
- `CustomField2`
- `CustomField3`
- `FunnelName`
- `FunnelStep`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `PayerStatus`
- `Platform`

 |
| Churn | `FunnelStepChurnRate`<br><br>**Granularities:** None<br>**Data retention:** 1468 days |

- `AgeGroup`
- `CustomField1`
- `CustomField2`
- `CustomField3`
- `FunnelName`
- `FunnelStep`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `PayerStatus`
- `Platform`

 |
| Step completion | `FunnelStepCompletionRate`<br><br>**Granularities:** None<br>**Data retention:** 1468 days |

- `AgeGroup`
- `CustomField1`
- `CustomField2`
- `CustomField3`
- `FunnelName`
- `FunnelStep`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `PayerStatus`
- `Platform`

 |
| Total conversion | `FunnelStepOverallCompletionRate`<br><br>**Granularities:** None<br>**Data retention:** 1468 days |

- `AgeGroup`
- `CustomField1`
- `CustomField2`
- `CustomField3`
- `FunnelName`
- `FunnelStep`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `PayerStatus`
- `Platform`

 |
| Total Sessions | `FunnelStepTotalCount`<br><br>**Granularities:** None<br>**Data retention:** 1468 days |

- `AgeGroup`
- `CustomField1`
- `CustomField2`
- `CustomField3`
- `FunnelName`
- `FunnelStep`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `PayerStatus`
- `Platform`

 |
| Churn | `FunnelUserChurnRate`<br><br>**Granularities:** None<br>**Data retention:** 1468 days |

- `AgeGroup`
- `CustomField1`
- `CustomField2`
- `CustomField3`
- `FunnelName`
- `FunnelStep`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `PayerStatus`
- `Platform`

 |
| Total conversion | `FunnelUserOverallCompletionRate`<br><br>**Granularities:** None<br>**Data retention:** 1468 days |

- `AgeGroup`
- `CustomField1`
- `CustomField2`
- `CustomField3`
- `FunnelName`
- `FunnelStep`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `PayerStatus`
- `Platform`

 |
| Step completion | `FunnelUserStepCompletionRate`<br><br>**Granularities:** None<br>**Data retention:** 1468 days |

- `AgeGroup`
- `CustomField1`
- `CustomField2`
- `CustomField3`
- `FunnelName`
- `FunnelStep`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `PayerStatus`
- `Platform`

 |
| Total users | `FunnelUserTotalCount`<br><br>**Granularities:** None<br>**Data retention:** 1468 days |

- `AgeGroup`
- `CustomField1`
- `CustomField2`
- `CustomField3`
- `FunnelName`
- `FunnelStep`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `PayerStatus`
- `Platform`

 |

### Custom Events

See [[30 Official Roblox Docs/Production/Analytics/Custom events|Custom Events]].

| Name | Metric | Supported dimensions |
| --- | --- | --- |
| Custom events | `CustomEventAvgPerUserValue`<br>`CustomEventAvgValue`<br>`CustomEventCount`<br>`CustomEventCountUser`<br>`CustomEventMaxValue`<br>`CustomEventMinValue`<br>`CustomEventSumValue`<br><br>**Granularities:** OneDay, OneHour, OneWeek, OneMonth, None<br>**Data retention:** 1468 days |

- `AgeGroup`
- `CustomEventName`
- `CustomField1`
- `CustomField2`
- `CustomField3`
- `Gender`
- `IsNewUser`
- `OperatingSystem`
- `PayerStatus`
- `Platform`

 |

### Thumbnails

See [[30 Official Roblox Docs/Production/Publishing/Thumbnails|Thumbnails]].

| Name | Metric | Supported dimensions |
| --- | --- | --- |
| Average session length by thumbnail | `ThumbnailAverageSessionLengthMinutes`<br><br>**Granularities:** OneDay, OneHour, None<br>**Data retention:** 30 days |

- `ThumbnailAsset`
- `ThumbnailList`

 |
| Impressions by thumbnail | `ThumbnailImpressions`<br><br>**Granularities:** OneDay, OneHour, None<br>**Data retention:** 30 days |

- `ThumbnailAsset`
- `ThumbnailList`

 |
| 7D Qualified Play Through Rate by Thumbnail (Cumulative) | `ThumbnailL7QualifiedPTR`<br><br>**Granularities:** OneDay, OneHour, None<br>**Data retention:** 30 days |

- `ThumbnailAsset`
- `ThumbnailList`

 |
| Qualified play through rate by thumbnail | `ThumbnailQualifiedPTR`<br><br>**Granularities:** OneDay, OneHour, None<br>**Data retention:** 30 days |

- `ThumbnailAsset`
- `ThumbnailList`

 |
| Qualified plays by thumbnail | `ThumbnailQualifiedPlays`<br><br>**Granularities:** OneDay, OneHour, None<br>**Data retention:** 30 days |

- `ThumbnailAsset`
- `ThumbnailList`

 |
| Winning segments by thumbnail | `ThumbnailWinningSegments`<br><br>**Granularities:** OneDay, OneHour, None<br>**Data retention:** 30 days |

- `ThumbnailAsset`
- `ThumbnailList`

 |

### Speech-to-Text

See [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Audio/Add speech-to-text|Speech-to-Text]].

| Name | Metric | Supported dimensions |
| --- | --- | --- |
| Audio transcription API responses by status | `SpeechToTextTranscriptionStatuses`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `SpeechToTextTranscriptionStatus`

 |
| Audio transcription API usage | `SpeechToTextTranscriptionUsage`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `SpeechToTextTranscriptionStatus`

 |

### Text-to-Speech

See [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Audio/Add text-to-speech|Text-to-Speech]].

| Name | Metric | Supported dimensions |
| --- | --- | --- |
| Audio generation API asset generation successes | `TextToSpeechAssetSuccesses`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days | |
| Audio generation API responses by status | `TextToSpeechRawAudioErrors`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `TextToSpeechRawAudioStatus`

 |
| Audio generation API usage | `TextToSpeechRawAudioSuccesses`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `TextToSpeechRawAudioStatus`

 |

### Matchmaking

See [[30 Official Roblox Docs/Matchmaking/Matchmaking analytics|Matchmaking]].

| Name | Metric | Supported dimensions |
| --- | --- | --- |
| Categorical custom signal similarity ratio | `MatchmakingCategoricalCustomSignalsSimilarityRatioAvg`<br>`MatchmakingCategoricalCustomSignalsSimilarityRatioP10`<br>`MatchmakingCategoricalCustomSignalsSimilarityRatioP50`<br>`MatchmakingCategoricalCustomSignalsSimilarityRatioP90`<br><br>**Granularities:** OneHour, OneDay, None<br>**Data retention:** 90 days |

- `AgeGroup`
- `Locale`
- `MatchmakingCategoricalCustomSignal`
- `Place`
- `Platform`

 |
| Numerical custom signal difference | `MatchmakingNumericCustomSignalsDifferenceAvg`<br>`MatchmakingNumericCustomSignalsDifferenceP10`<br>`MatchmakingNumericCustomSignalsDifferenceP50`<br>`MatchmakingNumericCustomSignalsDifferenceP90`<br><br>**Granularities:** OneHour, OneDay, None<br>**Data retention:** 90 days |

- `AgeGroup`
- `Locale`
- `MatchmakingNumericCustomSignal`
- `Place`
- `Platform`

 |
| Age difference | `MatchmakingSignalsAgeDifferenceAvg`<br>`MatchmakingSignalsAgeDifferenceP10`<br>`MatchmakingSignalsAgeDifferenceP50`<br>`MatchmakingSignalsAgeDifferenceP90`<br><br>**Granularities:** OneHour, OneDay<br>**Data retention:** 90 days |

- `AgeGroup`
- `Country`
- `Locale`
- `Place`
- `Platform`

 |
| Common text chat ratio | `MatchmakingSignalsCommonChatGroupRatioAvg`<br>`MatchmakingSignalsCommonChatGroupRatioP10`<br>`MatchmakingSignalsCommonChatGroupRatioP50`<br>`MatchmakingSignalsCommonChatGroupRatioP90`<br><br>**Granularities:** OneHour, OneDay<br>**Data retention:** 90 days |

- `AgeGroup`
- `Country`
- `Locale`
- `Place`
- `Platform`

 |
| Common device ratio | `MatchmakingSignalsCommonDeviceTypeRatioAvg`<br>`MatchmakingSignalsCommonDeviceTypeRatioP10`<br>`MatchmakingSignalsCommonDeviceTypeRatioP50`<br>`MatchmakingSignalsCommonDeviceTypeRatioP90`<br><br>**Granularities:** OneHour, OneDay<br>**Data retention:** 90 days |

- `AgeGroup`
- `Country`
- `Locale`
- `Place`
- `Platform`

 |
| Common language ratio | `MatchmakingSignalsCommonLanguageRatioAvg`<br>`MatchmakingSignalsCommonLanguageRatioP10`<br>`MatchmakingSignalsCommonLanguageRatioP50`<br>`MatchmakingSignalsCommonLanguageRatioP90`<br><br>**Granularities:** OneHour, OneDay<br>**Data retention:** 90 days |

- `AgeGroup`
- `Country`
- `Locale`
- `Place`
- `Platform`

 |
| Estimated ping | `MatchmakingSignalsEstimatePingAvg`<br>`MatchmakingSignalsEstimatePingP10`<br>`MatchmakingSignalsEstimatePingP50`<br>`MatchmakingSignalsEstimatePingP90`<br><br>**Granularities:** OneHour, OneDay<br>**Data retention:** 90 days |

- `AgeGroup`
- `Country`
- `Locale`
- `Place`
- `Platform`

 |
| Occupancy ratio | `MatchmakingSignalsOccupancyRatioAvg`<br>`MatchmakingSignalsOccupancyRatioP10`<br>`MatchmakingSignalsOccupancyRatioP50`<br>`MatchmakingSignalsOccupancyRatioP90`<br><br>**Granularities:** OneHour, OneDay<br>**Data retention:** 90 days |

- `AgeGroup`
- `Country`
- `Locale`
- `Place`
- `Platform`

 |
| Play history difference | `MatchmakingSignalsPlayHistoryDifferenceAvg`<br>`MatchmakingSignalsPlayHistoryDifferenceP10`<br>`MatchmakingSignalsPlayHistoryDifferenceP50`<br>`MatchmakingSignalsPlayHistoryDifferenceP90`<br><br>**Granularities:** OneHour, OneDay<br>**Data retention:** 90 days |

- `AgeGroup`
- `Country`
- `Locale`
- `Place`
- `Platform`

 |
| Average friends match ratio | `MatchmakingSignalsPreferredPlayerMatchRatioAvg`<br><br>**Granularities:** OneHour, OneDay<br>**Data retention:** 90 days |

- `AgeGroup`
- `Country`
- `Locale`
- `Place`
- `Platform`

 |
| Voice chat ratio | `MatchmakingSignalsVoiceChatRatioAvg`<br>`MatchmakingSignalsVoiceChatRatioP10`<br>`MatchmakingSignalsVoiceChatRatioP50`<br>`MatchmakingSignalsVoiceChatRatioP90`<br><br>**Granularities:** OneHour, OneDay<br>**Data retention:** 90 days |

- `AgeGroup`
- `Country`
- `Locale`
- `Place`
- `Platform`

 |

### Data Store

See [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store observability|Data Store]].

| Name | Metric | Supported dimensions |
| --- | --- | --- |
| List request quota consumption | `DataStoreConsumedListRequests`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `DataStoreRequestSource`
- `DataStoreTypeV2`

 |
| Read request quota consumption | `DataStoreConsumedReadRequests`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `DataStoreRequestSource`
- `DataStoreTypeV2`

 |
| Remove request quota consumption | `DataStoreConsumedRemoveRequests`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `DataStoreRequestSource`
- `DataStoreTypeV2`

 |
| Write request quota consumption | `DataStoreConsumedWriteRequests`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `DataStoreRequestSource`
- `DataStoreTypeV2`

 |
| List quota usage | `DataStoreListRequests`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `DataStoreTypeV2`

 |
| List quota usage | `DataStoreListRequestsByEndpoint`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `DataStoreOperation`
- `DataStoreTypeV2`

 |
| Read quota usage | `DataStoreReadRequests`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `DataStoreTypeV2`

 |
| Read quota usage | `DataStoreReadRequestsByEndpoint`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `DataStoreOperation`
- `DataStoreTypeV2`

 |
| Remove quota usage | `DataStoreRemoveRequests`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `DataStoreTypeV2`

 |
| Remove quota usage | `DataStoreRemoveRequestsByEndpoint`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `DataStoreOperation`
- `DataStoreTypeV2`

 |
| Request count by API and status | `DataStoreRequests`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `DataStoreOperation`
- `DataStoreStatus`
- `DataStoreTypeV2`

 |
| Request count by API | `DataStoreRequestsByEndpoint`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `DataStoreOperation`
- `DataStoreTypeV2`

 |
| Request count by status | `DataStoreRequestsByStatus`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `DataStoreStatus`
- `DataStoreTypeV2`

 |
| Storage usage | `DataStoreStorageUsageBytes`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days | |
| Write quota usage | `DataStoreWriteRequests`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `DataStoreTypeV2`

 |
| Write quota usage | `DataStoreWriteRequestsByEndpoint`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `DataStoreOperation`
- `DataStoreTypeV2`

 |

### Memory Stores

See [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory store observability|Memory Stores]].

| Name | Metric | Supported dimensions |
| --- | --- | --- |
| Memory usage | `MemoryStoreMemoryUsageBytes`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days | |
| API request units | `MemoryStoreRequestUnitsByEndpoint`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `MemoryStoreOperation`

 |
| Request count by API and status | `MemoryStoreRequests`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `MemoryStoreOperation`
- `MemoryStoreStatus`

 |
| Request count by API | `MemoryStoreRequestsByEndpoint`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `MemoryStoreOperation`

 |
| Request count by status | `MemoryStoreRequestsByStatus`<br><br>**Granularities:** OneMinute, HalfHour, OneHour, OneDay<br>**Data retention:** 28 days |

- `MemoryStoreStatus`

 |

### Safety

See [[30 Official Roblox Docs/General/How you can help us make Roblox safer#Understand your safety analytics|Safety]].

| Name | Metric | Supported dimensions |
| --- | --- | --- |
| Total abuse reports | `TotalAbuseReports`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AbuseCategory`
- `AbuseChannel`

 |
| Abuse report submitters per 1000 playtime hours | `UniqueAbuseReportSubmittersPer1000PlaytimeHours`<br><br>**Granularities:** OneDay<br>**Data retention:** 1468 days |

- `AbuseCategory`
- `AbuseChannel`

 |

### Advertising

See [[30 Official Roblox Docs/Production/Promotion/Rewarded video ads#Analytics|Rewarded Video Ads]].

| Name | Metric | Supported dimensions |
| --- | --- | --- |
| Impressions | `AdsPublisherReportingTotalImpressions`<br><br>**Granularities:** OneDay, OneHour, None<br>**Data retention:** 1468 days |

- `AdFormat`
- `AdInstanceName`
- `AdPlacementId`
- `AdsPublisherReportingDataVersion`
- `Country`
- `Gender`
- `OperatingSystem`
- `Platform`

 |
| Total revenue | `AdsPublisherReportingTotalRevenueRobux`<br><br>**Granularities:** OneDay, OneHour, None<br>**Data retention:** 1468 days |

- `AdFormat`
- `AdInstanceName`
- `AdPlacementId`
- `AdsPublisherReportingDataVersion`
- `Country`
- `Gender`
- `OperatingSystem`
- `Platform`

 |
| Rewarded video daily unique viewers | `AdsPublisherReportingVideo2DDailyUniqueViewer`<br><br>**Granularities:** OneDay, None<br>**Data retention:** 1468 days |

- `AdFormat`
- `AdInstanceName`
- `AdPlacementId`
- `AdsPublisherReportingDataVersion`
- `Country`
- `Gender`
- `OperatingSystem`
- `PlacementType`
- `Platform`

 |
| Rewarded video earnings per mille (EPM) | `AdsPublisherReportingVideo2DEpmNoUnvalidatedPc`<br><br>**Granularities:** OneDay, OneHour, None<br>**Data retention:** 1468 days |

- `AdFormat`
- `AdInstanceName`
- `AdPlacementId`
- `AdRewardId`
- `AdsPublisherReportingDataVersion`
- `Country`
- `Gender`
- `OperatingSystem`
- `PlacementType`
- `Platform`

 |
| Rewarded video impressions | `AdsPublisherReportingVideo2DImpressions`<br><br>**Granularities:** OneDay, OneHour, None<br>**Data retention:** 1468 days |

- `AdFormat`
- `AdInstanceName`
- `AdPlacementId`
- `AdRewardId`
- `AdsPublisherReportingDataVersion`
- `Country`
- `Gender`
- `OperatingSystem`
- `PlacementType`
- `Platform`

 |
| Rewarded video earnings | `AdsPublisherReportingVideo2DRevenueRobux`<br><br>**Granularities:** OneDay, OneHour, None<br>**Data retention:** 1468 days |

- `AdFormat`
- `AdInstanceName`
- `AdPlacementId`
- `AdRewardId`
- `AdsPublisherReportingDataVersion`
- `Country`
- `Gender`
- `OperatingSystem`
- `PlacementType`
- `Platform`

 |

---
*Source: [Supported metrics and dimensions](https://create.roblox.com/docs/cloud/guides/analytics/metrics) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
