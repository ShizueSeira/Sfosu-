# Architecture and data model

## Overview

This project is structured around a small set of custom records plus standard Salesforce objects used as the base identity and relationship layer.

## Custom objects

![Custom objects overview](../Sfosu_Custom_Objects.png)

The app currently centers on these custom objects:

- Artist
- Beatmap
- Score Submission
- Chat Message

These domain objects represent the core osu!-inspired content and user interaction model rather than generic CRM records.

## Artist object

![Artist fields](../Artist_Fields.png)

The Artist object is the creator or performer layer. It gives the app a dedicated place for creative identity data instead of storing artist names as ad hoc strings.

![Artist number of beatmaps rollup](../Artist_Number_Of_Beatmaps_Rollup.png)

The Number of Beatmaps rollup is a simple summary count of all Beatmap records related to that artist. This is useful as a quick view of how much content belongs to each artist.

## Beatmap object

![Beatmap fields](../Beatmap_Fields.png)

The Beatmap object stores the actual map content and metadata. It is the primary content record around which the rest of the app is built.

![Beatmap artist master-detail](../Beatmap_Artist_Master_Detail.png)

The Artist relationship on Beatmap makes sense as a parent-child style link when each beatmap belongs primarily to one artist. In the current model, a beatmap can point to its related artist record, and the artist record can roll up how many beatmaps belong to it.

![Beatmap status picklist](../Beatmap_Status_Picklist.png)

The status picklist should cover the relevant osu! states such as Ranked, Qualified, Loved, and Graveyard.

![Beatmap key count picklist](../Beatmap_Key_Count_Picklist.png)

The Key Count field should be relevant for mania maps only. Values should normally run from 1K to 8K, while non-mania maps keep it blank. This should be controlled by visibility and validation rules.

![Beatmap play time formula](../Beatmap_Play_Time_Formula.png)

The Play Time formula formats the raw duration in seconds into a readable mm:ss display, where mm is minutes and ss is seconds.

## Standard objects

### Accounts

![Standard object account clans](../Sfosu_Standard_Object_Account_Clans.png)

The Accounts object is being used to represent osu! clans. This keeps group-level data separate from an individual user profile.

### Contacts

![Standard object contact osu!PlayProfile](../Sfosu_Standard_Object_Contact_osuPlayProfile.png)

The Contacts object is being used to represent the osu! profile for individual players. This is the personal identity layer, separate from the clan or group layer.

## Notes

The project intentionally avoids exposing every Salesforce-standard field. Only the fields that are relevant to the app’s real purpose are kept visible and active for now.

Related docs:
- [permissions.md](permissions.md)
- [chat.md](chat.md)
- [dashboard.md](dashboard.md)
- [ux.md](ux.md)
