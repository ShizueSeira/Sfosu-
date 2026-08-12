# SFosu!

![SFosu! home screen](Sfosu_Home_Screen.png)

A self-project app built for learning, experimenting, and documenting the process of creating something real from scratch.

This repository is my personal project space where I share my progress, mistakes, lessons, and small wins while building SFosu!. I am not claiming perfection here — I expect bugs, rough edges, and features that may not work exactly as intended. The goal is to learn, improve, and document what is happening along the way.

## Table of Contents

- [Why I built this](#why-i-built-this)
- [Project vision](#project-vision)
- [AI model experience](#ai-model-experience)
- [Documentation](#documentation)
- [Implemented code](#implemented-code)
  - [Apex classes](#apex-classes)
  - [Lightning Web Components](#lightning-web-components)
- [App overview](#app-overview)
  - [Home screen](#home-screen)
  - [Global chat screen](#global-chat-screen)
  - [Artist screen](#artist-screen)
  - [Beatmap screen](#beatmap-screen)
  - [Score submissions screen](#score-submissions-screen)
  - [Accounts screen](#accounts-screen)
  - [Contacts screen](#contacts-screen)
  - [Dashboard screen](#dashboard-screen)
  - [Reports screen](#reports-screen)
  - [Chatter screen](#chatter-screen)
  - [Chat messages screen](#chat-messages-screen)
- [Custom objects and standard object model](#custom-objects-and-standard-object-model)
  - [Custom objects overview](#custom-objects-overview)
  - [Artist custom object](#artist-custom-object)
  - [Beatmap custom object](#beatmap-custom-object)
  - [Standard object: accounts](#standard-object-accounts)
  - [Standard object: contacts](#standard-object-contacts)
- [Flows created](#flows-created)
  - [1. Chat Moderation Filter Flow](#1-chat-moderation-filter-flow)
  - [2. Get Notifications Developers Flow](#2-get-notifications-developers-flow)
  - [3. Beatmap - Qualify Map Flow](#3-beatmap---qualify-map-flow)
  - [4. Update Beatmap Status Flow](#4-update-beatmap-status-flow)
- [SOQL used in the chat message logic](#soql-used-in-the-chat-message-logic)
- [Apex testing](#apex-testing)
  - [ChatController Apex test](#chatcontroller-apex-test)
  - [RecentChatFeedController Apex test](#recentchatfeedcontroller-apex-test)
- [VS Code setup](#vs-code-setup)
- [How I built it from scratch](#how-i-built-it-from-scratch)
- [Current status](#current-status)
- [What I want to achieve](#what-i-want-to-achieve)
- [Top 3 Learning Priorities](#top-3-learning-priorities)
- [Development approach](#development-approach)
- [Project structure](#project-structure)
- [Getting started](#getting-started)
- [Stack and tools](#stack-and-tools)
- [Learning goals](#learning-goals)
- [Vlog / project journey notes](#vlog--project-journey-notes)
- [A note about the process](#a-note-about-the-process)
- [Final note](#final-note)

## Why I built this

I wanted to challenge myself by creating an app that pushes me to apply the things I have learned in development: design, coding, debugging, problem solving, UI/UX decisions, and project planning.

This is not just about shipping a perfect app. It is about building something meaningful, learning from the process, and sharing my journey honestly.

## Project vision

SFosu! is a personal app project meant to explore ideas, test concepts, and build something that reflects my current learning and creativity.

It may evolve over time, change direction, or go through several iterations. That is part of the process.

## AI model experience

This project was built with the help of AI coding assistants. Here is my experience so far:

- **GitHub Copilot (initial stages):** This was my first real experience using an AI model inside an editor. It felt more convenient than my traditional approach of using websites for AI help. The setup made it easy to work on the long README file and manage tons of screenshots directly in the environment.

![GitHub Environment](Github_Environment.png)

This screenshot shows the GitHub environment where I first started using Copilot. It was my initial setup before moving to the local VS Code environment with the Continue plugin.

- **Credit limit hurdle:** On my second day using GitHub Copilot, I hit the 50% capacity notice, and it quickly reached 75%. This pushed me to look for alternatives.
- **VS Code environment:** I switched to running VS Code locally so I could work on the repository directly instead of inside GitHub. I was able to clone and retrieve the source repo into my local VS Code setup.

![VS Code environment](VSCode_Environment.png)

This screenshot shows my local VS Code environment where I set up the repository. Using the Continue plugin inside VS Code allowed me to work with AI models directly in the editor, which made managing the long README file and screenshots much more convenient.

![Continue Open Router](Continue_Open_Router.png)

This screenshot shows the Continue plugin configured with OpenRouter as the provider. OpenRouter gave me access to multiple models through a single API key, which was useful for switching between options when credit limits were hit.

![Continue Open Router Website](Continue_Open_Router_Website.png)

This screenshot shows the OpenRouter website where I managed my API keys and tracked usage. It helped me monitor which models were consuming credits and when limits were approaching.

![Continue Poolside Laguna Use](Continue_Poolside_Laguna_Use.png)

This screenshot shows the Continue plugin using the Poolside: Laguna S 2.1 (Free) model via OpenRouter. This is the model I am currently using and hoping things go well here.

- **Gemini 3.x:** The free monthly credit limit was hit fast — within an hour.
- **Gemini 2.x:** After just one change, it already reached the limit.
- **Claude:** It immediately required a billing subscription. I could not use it at all without subscribing.
- **NVIDIA/Nemotron-3-Ultra (free, via OpenRouter):** It was extremely slow, so I switched models quickly.
- **Current model:** I am now using **Poolside: Laguna S 2.1 (Free, via OpenRouter)** and hoping things go well here.

## Documentation

The detailed notes for each topic are organized into separate files in the docs folder so this README stays as a concise project landing page.

- [docs/architecture.md](docs/architecture.md) — custom objects, standard objects, field design, and data model
- [docs/permissions.md](docs/permissions.md) — profiles, permissions, CRUD access, and privilege issues
- [docs/chat.md](docs/chat.md) — global chat flow, censoring, and visibility problems
- [docs/dashboard.md](docs/dashboard.md) — dashboard, reports, and chart-vs-table decisions
- [docs/ux.md](docs/ux.md) — navigation order, recent messages, list-view actions, and UX tweaks

## Implemented code

These are the main Salesforce files added for the chat feature and project setup.

### Apex classes

- [classes/ChatController.cls](classes/ChatController.cls) — retrieves recent chat messages and inserts new ones
- [classes/RecentChatFeedController.cls](classes/RecentChatFeedController.cls) — returns the latest chat feed summary
- [classes/ChatControllerTest.cls](classes/ChatControllerTest.cls) — test coverage for chat retrieval behavior
- [classes/RecentChatFeedControllerTest.cls](classes/RecentChatFeedControllerTest.cls) — test coverage for recent feed behavior

### Lightning Web Components

- [lwc/publicChatRoom/publicChatRoom.js](lwc/publicChatRoom/publicChatRoom.js) — live chat room logic using EmpApi and Apex calls
- [lwc/publicChatRoom/publicChatRoom.html](lwc/publicChatRoom/publicChatRoom.html) — public chat room UI
- [lwc/chatFeed/chatFeed.js](lwc/chatFeed/chatFeed.js) — recent message feed wiring
- [lwc/chatFeed/chatFeed.html](lwc/chatFeed/chatFeed.html) — recent message feed markup

## App overview

These screens represent the first thing a viewer sees when opening each main tab in the app. They give a quick idea of the purpose and feel of the experience before diving deeper into the features.

### Home screen

![SFosu! home screen](Sfosu_Home_Screen.png)

The Home screen is the landing view and the clearest introduction to the app. It presents the main entry point, helping users understand the app’s identity and giving them a quick sense of flow, focus, and navigation.

The recent messages section on the home screen is intentionally limited to the 5 most recent messages so the page stays concise, readable, and focused without overwhelming the user with older chat activity.

I also adjusted the visible fields across the object list views so that both the Recently Viewed and All Records tabs only show the most relevant columns for osu! users. The goal is to surface the details users actually need at a glance, without cluttering the screen with extra Salesforce-style fields that are not useful for this app. This reduces the number of clicks needed to understand a record and keeps each tab focused on the information that matters most.

One of the design ideas for the home screen is the osu! dashboard, which acts like a central overview page for the app. It can contain the four main reports that are also visible in the Reports section, giving users a quick summary of the overall platform without making them dive directly into the detailed reporting views. In a practical sense, the dashboard is the high-level summary page, while the Reports section is where the more detailed evidence and filters live.

This also influenced how I think about the visualizations. Some charts are not automatically the best choice for every dataset. For example, for the "Most Gained Scores" view, a bar chart may be misleading if the difference between the top scorer and the next ranks is very large. In that case, a table-based ranking may be clearer and more honest because it makes the value gaps easier to inspect and compare without distorting the significance of the leaderboard.

### Global chat screen

![SFosu! global chat screen](Sfosu_Global_Chat_Screen.png)

The Global Chat screen opens the experience to a broader community. It communicates that the app supports shared discussion and public interaction, making the environment feel active and connected beyond one-to-one communication.

The Global Chat area also revealed a permission problem during testing. The admin profile was able to send and test censored messages using a filter flow, where bad words such as "shit," "fuck," and "idiot" were replaced with "*Censored*". That flow worked in the admin context, but I struggled to get the standard player profile to see the admin’s messages or access the same chat behavior correctly. This suggests the issue was not only with the filter itself but also with visibility settings, sharing rules, or page-level permissions for the standard player profile.

At the moment, I am also unable to properly test role hierarchy permissions in the project, which means I still need to work out how to structure user roles and record-level visibility correctly. This is an important gap because role hierarchy affects how data is shared across users and can easily explain why a normal player cannot see admin chat content when they should be able to.

### Artist screen

![SFosu! artist screen](Sfosu_Artist_Screen.png)

The Artist screen focuses on the creative side of the app and presents the person or entity behind the music or content. It helps viewers connect the interface to the people creating the experiences they are interacting with.

#### Artist related tab

![SFosu! artist related tab](Sfosu_Artist_Related_Tab.png)

The Related tab expands the artist view by showing content connected to that artist. It helps users continue exploring the same artist through related music, entries, and associated material without leaving the record context.

#### Artist details tab

![SFosu! artist details tab](Sfosu_Artist_Details_Tab.png)

When a specific artist record is selected, the Details tab shows the core profile information first. This view is meant to give a quick understanding of who the artist is and what information is most relevant at a glance.

### Artist list view button layout

![Artist list view button layout](Artist_List_View_Button_Layout.png)

![Artist list view button layout settings](Artist_List_View_Button_Layout_settings.png)

These screenshots show the list view action layout for Artist records. I intentionally kept the visible actions focused and minimal so that the user only sees the most relevant action for creating a new artist entry. The Add New Artist action is the priority. Delete, archive, or edit actions are not part of the current implementation and are better suited for future versions when the project has a clearer admin workflow and permission model.

The main goal is to reduce clutter and make the list view feel cleaner and more purpose-built for the osu! user journey. That keeps the interaction simple while still leaving room for additional administrative actions when they are actually needed.

#### Add new artist record

![Add new artist record](New_Artist_Record.png)

The Artist creation screen keeps the record form streamlined around the identity data needed for a creator or performer. This makes it easy to add a new artist without dragging in irrelevant information.

### Beatmap screen

![SFosu! beatmap screen](Sfosu_Beatmap_screen.png)

The Beatmap screen is where content detail becomes more specific and tangible. It introduces the actual playable or browsable content, giving users a first look at the maps, tracks, or music-based material that drives the experience.

#### Beatmap related tab

![SFosu! beatmap related tab](Sfosu_Beatmaps_Related_Tab.png)

The Related tab keeps the exploration going by surfacing linked or similar beatmaps and associated content. It helps the user discover more relevant entries instead of stopping at the initial record.

#### Beatmap details tab

![SFosu! beatmap details tab](Sfosu_Beatmaps_Details_Tab.png)

When a specific beatmap is opened, the Details tab gives the essential information for that map. This is the first place a user looks to understand the content, difficulty, and overall purpose of the record.

#### Beatmap record type and create layout

![Beatmap record type selection](New_Beatmap_Record_Type.png)

The Beatmap object has a Record Type field, and this is an important distinction in the app. The create flow is not a single one-size-fits-all layout: it changes depending on whether the beatmap is for osu!standard or osu!mania.

![Beatmap standard record layout](New_Beatmap_osustd_Record_Type.png)

For osu!standard beatmaps, the create page uses the standard layout and keeps the fields focused on the normal map metadata. This includes the usual beatmap details without the mania-only values.

![Beatmap mania record layout](New_Beatmap_osumania_Record_Type.png)

For osu!mania beatmaps, the layout is different because mania maps require additional fields that are not relevant to standard maps. In particular, the Key Count field is available here and should be set to the appropriate value, such as 1K to 8K, depending on the map.

![Beatmap Record Types Default and Mania Layout](Beatmap_Record_Types_Default_And_Mania_Layout.png)

This distinction matters because the app is modeling different gameplay modes, and each mode has different field requirements. A standard beatmap should not carry mania-specific values, while a mania beatmap should not be created without the extra key information that makes the map meaningful in that mode.


### Score submissions screen

![SFosu! score submissions screen](Sfosu_Score_Submissions_Screen.png)

The Score Submissions screen introduces the competitive or performance-tracking side of the app. It tells the viewer that results and achievements are tracked, reviewed, and presented as part of the overall experience.

#### Add new score submission record

![Add new score submission record](New_Score_Submission_Record.png)

This submission form is focused on the actual performance entry. It keeps the input around the score-related details instead of mixing in unrelated artist or beatmap data.

#### Score submissions details tab

![SFosu! score submissions details tab](Sfosu_Score_Submissions_Details_Tab.png)

The Details tab is the main view for score submissions and is the only tab in this area. It highlights the specific submission information, making it the most important place for reviewing results and understanding the relevant performance data.

### Accounts screen

![SFosu! accounts screen](Sfosu_Accounts_Screen.png)

The Accounts screen is where the user’s personal identity and profile context are made visible. This tab is important because it gives a sense of ownership, personal details, and the account-level structure that supports the rest of the app.

#### Accounts related tab

![SFosu! accounts related tab](Sfosu_Accounts_Related_Tab.png)

The Related tab for Accounts expands the profile context by showing connected or associated content linked to that account. It helps the user continue exploring the account through related entries without losing the main identity context.

#### Accounts details tab

![SFosu! accounts details tab](Sfosu_Accounts_Details_Tab.png)

The Details tab provides the key account information in a structured and readable way. It is the place where the app presents the most relevant personal or account-level information in a concise, focused view.

#### Add new clan record

![Add new clan record](New_Clan_Record.png)

The clan record follows the same pattern: it keeps the account-level context clear and focused, which fits the idea of representing an osu! clan or group as a dedicated account record.

### Contacts screen

![SFosu! contacts screen](Sfosu_Contacts_Screen.png)

The Contacts screen is designed around connection and relationships. It is the place where a user sees who they can reach, who is relevant, and how the app supports communication between people or groups.

#### Contacts related tab

![SFosu! contacts related tab](Sfosu_Contacts_Related_Tab.png)

The Related tab for Contacts broadens the social context by surfacing connected people, groups, or relevant entries tied to that contact. It helps the user keep exploring relationships without leaving the contact view.

#### Contacts details tab

![SFosu! contacts details tab](Sfosu_Contacts_Details_Tab.png)

The Details tab focuses on the essential information for a selected contact. It gives the clearest view of who that person is and what information is most relevant for communication or follow-up.

#### Add new contact record / osu! profile

![Add new contact record](New_Contact_Record.png)

The profile/contact form is built around the person-level identity and relevant osu! profile context, making it clear that this is the user-facing identity layer rather than the group-level account record.

### Dashboard screen

![SFosu! dashboard screen](Sfosu_Dashboard_screen.png)

The Dashboard is the overview tab where the most important information is surfaced first. It is designed to make a user feel oriented by showing a high-level summary of activity, progress, and key areas of the platform at a glance.

### Reports screen

![SFosu! reports screen](Sfosu_Reports_Screen.png)

The Reports screen represents the operational and oversight side of the app. It is the place where data, issues, and summaries are reviewed, signaling that the platform is structured enough to monitor activity and maintain quality.

#### Artist details report outline

![Artist details report outline](Report_Artist_and_established_beatmaps_details.png)

This report shows the artist-focused summary and established beatmap detail view first, making it easy to see the overall information structure before narrowing into filters or deeper results.

#### Artist details report filters

![Artist details report filters](Report_Artist_and_established_beatmaps_details.png)

The filters for the artist details report let the user narrow the data by the relevant selection criteria, making the report more focused and easier to interpret.

#### Top 10 scores report outline

![Top 10 scores report outline](Report_Top_10_Most_Gained_scores_outline.png)

The Top 10 Scores report outline highlights the ranking structure and the scoring view first, presenting the core information in a clear and immediately readable format.

#### Top 10 scores report filters

![Top 10 scores report filters](Report_Top_10_Most_Gained_scores_filters.png)

The filters for the Top 10 Scores report refine the report by adjusting the scoring criteria, letting the user focus on the ranking view they want to inspect.

#### Top 10 PP plays standard outline

![Top 10 PP plays standard outline](Report_Top_10_highest_PP_plays_standard_outline.png)

The Top 10 PP Plays Standard report outline presents the standard performance ranking view first, focusing on the most relevant results and how they are framed for comparison.

#### Top 10 PP plays standard filters

![Top 10 PP plays standard filters](Report_Top_10_highest_PP_plays_standard_Filters.png)

The filters for the Standard PP report narrow the data by the relevant performance criteria so the ranking is easier to compare and interpret.

#### Top 5 PP plays mania outline

![Top 5 PP plays mania outline](Report_Top_10_highest_PP_plays_mania_outline.png)

The Top 5 PP Plays Mania outline focuses on the mania-specific leaderboard structure, giving the user a clear view of how the highest-performing entries are framed and ranked.

#### Top 5 PP plays mania filters

![Top 5 PP plays mania filters](Report_Top_10_highest_PP_plays_mania_Filters.png)

The filters for the Mania PP report refine the view by adjusting the relevant criteria, helping the user isolate the exact performance data they want to review.

### Chatter screen

![SFosu! chatter screen](Sfosu_Chatter_Screen.png)

The Chatter screen is the tab for direct social interaction in the app. It gives the first impression that the platform is not just content-based but also community-driven, encouraging conversation and personal connection.

### Chat messages screen

![SFosu! chat messages screen](Sfosu_Chat_Messages_Screen.png)

The Chat Messages screen is where the app feels more alive and immediate. This tab shows the value of ongoing communication, making the first impression one of responsiveness, conversation, and direct interaction.

#### Chat messages related tab

![SFosu! chat messages related tab](Sfosu_Chat_Message_Related_Tab.png)

The Related tab for Chat Messages expands the conversation context by surfacing connected content and relevant follow-ups. It helps the user continue exploring the discussion beyond the immediate message.

#### Chat messages details tab

![SFosu! chat messages details tab](Sfosu_Chat_Message_Details_Tab.png)

The Details tab focuses on the specific conversation content, making it the place where the user can inspect the full message context and the most important information tied to that exchange.

## Custom objects and standard object model

These objects define the app’s data structure and show how the custom models fit alongside the built-in account and contact objects that support the user and relationship layers of the platform.

### Custom objects overview

![Custom objects overview](Sfosu_Custom_Objects.png)

This view shows the custom object model used in the app. It gives a clear picture of the additional domain-specific entities created to support the app beyond the standard built-in objects, helping to explain how the system is structured around its own content and relationship logic.

The object set now clearly includes the key custom records for the app’s content model:

- Artist: a custom object for artist identity and related metadata
- Beatmap: a custom object for beatmap content, details, and game-related record structure
- Score Submission: a custom object tracking submitted play results and performance data
- Chat Message: a custom object representing communication and conversation records

I also explored a few interesting field/data-type patterns in these screenshots. The most useful ones for this app are the relationship-focused types, such as lookup/reference-style fields that connect records to their broader context, along with text and metadata fields for names, descriptions, and entity details. These are the kinds of fields that make the custom objects feel more like a real domain model instead of just isolated tables.

### Artist custom object

![Artist fields](Artist_Fields.png)

The Artist custom object is one of the most important additions because it gives the app a dedicated place for creative identity data. This lets the project model the people or creators behind the content in a structured way, instead of treating them as simple strings or ad hoc labels.

In this design, an Artist can be the creator or performer associated with a specific song or map, which makes sense for a domain where the artist is conceptually the owner of the music being represented.

![Artist number of beatmaps rollup](Artist_Number_Of_Beatmaps_Rollup.png)

The Number of Beatmaps rollup on the Artist object is essentially a record count of all Beatmap records related to that artist. In other words, it is the number of beatmaps whose Artist field refers to that artist’s name or record. This is a simple summary field that helps show how much content belongs to that artist without needing to manually count related records each time.

### Beatmap custom object

![Beatmap fields](Beatmap_Fields.png)

The Beatmap custom object adds the content layer of the project. It represents the actual playable or browsable map information and gives the system a dedicated place to store the details that matter for discovery, comparison, and performance tracking.

![Beatmap artist master-detail](Beatmap_Artist_Master_Detail.png)

This is also where the Artist relationship fits naturally. If each beatmap is tied to one primary artist, then a master-detail or lookup field on Beatmap pointing to Artist is a sensible design because the beatmap is the child record and the artist is the parent record. In other words, the beatmap belongs to that specific artist for the song represented by that map.

This is a reasonable pattern when the song is clearly attributed to one artist. If a beatmap can legitimately include multiple artists, then a separate junction relationship or a different model would be better. But for the app’s initial structure, using Artist on the Beatmap object is a logical and practical choice.

![Beatmap status picklist](Beatmap_Status_Picklist.png)

The Beatmap status field is a picklist and it makes sense to reflect the main osu! lifecycle states, such as Ranked, Qualified, Loved, and Graveyard. Those are the core statuses that capture the map’s current state in a clear and familiar way.

The Beatmap object also uses Record Type to differentiate between gameplay modes. This matters because the new-record layout for an osu!standard beatmap is different from the layout used for an osu!mania beatmap. Standard records keep the normal beatmap metadata fields, while mania records include the extra mode-specific configuration that applies only to mania maps.

![Beatmap key count picklist](Beatmap_Key_Count_Picklist.png)

The Key Count field is also a meaningful beatmap attribute. In the osu! mania context, this should represent the number of keys used by the map, typically from 1K up to 8K, while remaining blank for non-mania beatmaps. That matches the idea that mania maps are keyed differently from standard maps, so the count should only be relevant in that specific mode.

This is likely the kind of field that should be constrained with validation and visibility rules. For example, the Key Count field should only be visible or editable when the beatmap is a mania map, and it should either be blank or prevented from being set for non-mania modes. That keeps the model clean and avoids meaningless values being stored on the wrong record type.

The available fields during beatmap creation therefore need to reflect that difference. The osu!standard layout should not include Key Count, while the osu!mania layout should expose it as an available field because the key count is central to defining how the map is played in that mode.

![Beatmap key count field visibility](Beatmap_Key_Count_Field_Visibility.png)

The Key Count field visibility is controlled so that it only becomes visible when the mapper's primary mode is osu! mania. In other words, the field is conditionally shown based on whether the contact (the osu player) is a mania player. This means a standard player should never see the Key Count field at all, while a mania player will see it on mania beatmap records. I just made the mapper due to early configurations I haven't made yet, so this visibility rule is still being set up and refined as the permission model and contact profile fields are finalized.

![Beatmap play time formula](Beatmap_Play_Time_Formula.png)

The Play Time formula is a display formula for the beatmap duration. It takes the raw duration in seconds and formats it into a readable mm:ss value, where mm represents the number of minutes and ss represents the remaining seconds. This makes the data easier to read in the UI without exposing the raw numeric duration as the primary display value.

### Standard object: accounts

![Standard object account clans](Sfosu_Standard_Object_Account_Clans.png)

I am using the Accounts standard object to represent osu! clans. In this model, the account is the group or organization layer, which fits the idea of a clan as a broader identity or container for related community members and group-level context.

This setup is useful because it gives the app a natural place for clan-level information, while keeping the actual personal profile details separate from the group record.

### Standard object: contacts

![Standard object contact osu!PlayProfile](Sfosu_Standard_Object_Contact_osuPlayProfile.png)

I am using the Contacts standard object to represent the osu! profile. This is the person-level layer: the profile information, personal details, and the identity that belongs to an individual user rather than a group or organization.

This is a good fit for the app because the profile is conceptually closer to an individual record than a company-style account. It also reflects how I am thinking about the data model: keep the clan in Accounts, keep the profile in Contacts, and only include the fields that are actually useful for this app.

A lot of the Salesforce standard columns may be present, but some of them are irrelevant for this project and may not be used initially. The goal is not to mirror every available Salesforce field exactly; it is to start with the relevant parts of the model and add more only when they are needed for the app’s actual functionality.

## Flows created

I created four Salesforce flows in total for the SFosu! project.

### 1. Chat Moderation Filter Flow

- Trigger: record created
- Object: Chat_Message__c
- Entry conditions: none
- Flow type: Fast Field Update
- Behavior: checks each new message for banned or inappropriate words
- Result: if bad words are detected, the message is updated to *Censored*; clean messages remain unchanged

![Chat Moderation Filter Configure Start](Flows_Chat_Moderation_Filter_Configure_Start.png)

This configuration screen shows the flow start settings for the moderation automation. It confirms that the trigger is a newly created Chat Message record and that the flow is designed to run automatically as soon as a message is submitted.

![Chat Moderation Filter Decision](Flows_Chat_Moderation_Filter_Decision.png)

This decision element is the heart of the moderation logic. It checks whether the incoming message contains a banned or inappropriate word before deciding whether the content should be blocked or left alone.

![Chat Moderation Filter Update Records](Flows_Chat_Moderation_Filter_Update_Records.png)

This update step is where the actual action happens. If the decision detects prohibited content, the flow updates the message and replaces the text with *Censored* so the chat stays safe and consistent.

![Chat Moderation Filter Flow Diagram](Flows_Chat_Moderation_Filter_FIgure.png)

This full flow diagram shows the end-to-end structure of the automation: a new chat record enters the flow, the decision checks the content, and the record is updated only when a forbidden word is found.

![Flow list](Flows_List.png)

This screenshot shows the list of all automation flows created for the app. It confirms that the moderation flow is part of a broader set of process automations supporting the project.

#### Test case: Flag Inappropriate Content

I created a test case to verify the Chat Moderation Filter Flow works correctly. The test passed at the end, confirming the flow properly flags and censors inappropriate content.

![Test Setup](Test_Flag_Inappropriate_Content_Chat_Moderation_Filter_Test_Setup.png)

This screenshot shows the test setup configuration. It defines the test conditions and the initial data needed to trigger the moderation flow during the test run.

![Initial Triggering Record](Test_Flag_Inappropriate_Content_Chat_Moderation_Filter_Test_Initial_Triggering_Record.png)

This screenshot shows the initial triggering record used in the test. It contains the message with inappropriate content that should be caught by the moderation flow.

![Test Assertions](Test_Flag_Inappropriate_Content_Chat_Moderation_Filter_Test_Assertions.png)

This screenshot shows the test assertions. It verifies that the flow correctly identified the inappropriate content and applied the expected *Censored* replacement to the message.

![Test Details](Test_Flag_Inappropriate_Content_Chat_Moderation_Filter_Test_Details.png)

This screenshot shows the test execution details. It displays the step-by-step progress of the test as the flow processes the triggering record and applies the moderation logic.

![Test Results](Test_Flag_Inappropriate_Content_Chat_Moderation_Filter_Test_Results.png)

This screenshot shows the final test results. The test passed, confirming that the Chat Moderation Filter Flow correctly flags and censors inappropriate content as expected.

### 2. Get Notifications Developers Flow

- Trigger: event-driven or record-created entry when notification settings are ready
- Object: Notification or related custom object for chat alerts
- Entry conditions: configured to run once the notification type and recipient are available
- Flow type: record-triggered or scheduled flow for sending alerts
- Behavior: loads the notification type, assigns the recipient, and sends chat bell alert notifications
- Result: the relevant user receives a bell alert notification, rather than a generic developer mention

![Get Notifications Developers Configure Start](Flows_Get_Notifications_Developers_Configure_Start.png)

This start screen displays the flow configuration for the notification automation. It confirms that the flow is set up to begin automatically when the notification source triggers it.

![Get Notifications Developers Get Records](Flows_Get_Notifications_Developers_Get_Records.png)

This step retrieves the notification type record needed to determine the correct alert behavior. It ensures the flow has the right notification template or settings before proceeding.

![Get Notifications Developers Assignment](Flows_Get_Notifications_Developers_Assignment.png)

This assignment step selects the recipient for the notification. It is the key part of the flow that ensures the alert goes to the appropriate user rather than a broad developer group.

![Get Notifications Developers Action One](Flows_Get_Notifications_Developers_Action_One.png)

This action sends the first chat bell alert notification once the recipient and notification type are ready.

![Get Notifications Developers Action Two](Flows_Get_Notifications_Developers_Action_Two.png)

This action completes the notification flow by sending the second chat bell alert, demonstrating the final delivery step of the alert automation.

#### Test case: Chat Bell Notification

I created a test case to verify the Get Notifications Developers Flow works correctly. The test confirms that chat bell notifications are sent to the appropriate recipient.

![Test Setup](Test_Chat_Bell_Notification_Test_Setup.png)

This screenshot shows the test setup configuration. It defines the test conditions and the initial data needed to trigger the notification flow during the test run.

![Initial Triggering Record](Test_Chat_Bell_Notification_Initial_Triggering_Record.png)

This screenshot shows the initial triggering record used in the test. It contains the notification data that should trigger the chat bell alert.

![Set Assertions](Test_Chat_Bell_Notification_Set_Assertions.png)

This screenshot shows the test assertions. It verifies that the flow correctly identified the notification type and assigned the recipient before sending the alert.

![Set Test Details Trigger Path](Test_Chat_Bell_Notification_Set_Test_Details_Trigger_Path.png)

This screenshot shows the test execution details and trigger path. It displays the step-by-step progress of the test as the flow processes the triggering record and sends the chat bell notification.

![Test Results](Test_Chat_Bell_Notification_Results.png)

This screenshot shows the final test results. The test confirms that the Get Notifications Developers Flow correctly sends chat bell notifications to the appropriate recipient.

### 3. Beatmap - Qualify Map Flow

- Trigger: screen flow launched from a button/action on a specific Beatmap record
- Object: Beatmap__c
- Entry conditions: none (launched manually via action/button)
- Flow type: Screen Flow
- Behavior: updates the Beatmap record's Status field to "Qualified" (e.g., Ranked → Qualified)
- Result: the beatmap status changes to Qualified when the action is invoked
- Current state: was working previously but is now broken; root cause not yet identified

![Beatmap Qualify Map Update Records](Flows_Beatmap_Qualify_Map_Update_records.png)

This screenshot shows the Update Records element that sets the Beatmap status to Qualified. The flow is designed to be triggered from a button on the Beatmap record page, making it easy to users to qualify a map directly from the record.

### 4. Update Beatmap Status Flow

- Trigger: screen flow launched from a button/action on a specific Beatmap record
- Object: Beatmap__c
- Entry conditions: none (launched manually via action/button)
- Flow type: Screen Flow
- Behavior: presents a screen to select or confirm the new status, then updates the Beatmap record's Status field
- Result: the beatmap status is updated to the selected value when the action is invoked

![Update Beatmap Status Screen](Flows_Update_Beatmap_Status_Screen.png)

This screenshot shows the screen element of the flow where the user selects the new status for the beatmap. It provides a simple interface for choosing the desired status value before the update is applied.

![Update Beatmap Status Get Records](Flows_Update_Beatmap_Status_pcs_BeatmapStatis_resource.png)

This screenshot shows the Get Records element that retrieves the current Beatmap record data. It ensures the flow has the latest record information before applying the status update.

![Update Beatmap Status Update Records](Flows_Update_Beatmap_Status_Update_Records.png)

This screenshot shows the Update Records element that applies the new status to the Beatmap record. This is the final step where the selected status value is written back to the record.

## SOQL used in the chat message logic

Salesforce Object Query Language (SOQL) is the query language I used to pull chat records from the Chat Message object in Apex. In the chat controller, the app needs to retrieve recent conversation history so the LWC can display the message feed and keep the UI updated.

The main query used in the chat message Apex logic is from the original source file [classes/ChatController.cls](classes/ChatController.cls):

```apex
SELECT Id, Message__c, Sender_Name__c, CreatedDate
FROM Chat_Message__c
ORDER BY CreatedDate ASC
LIMIT 50
```

This query does a few important things:

- Selects the message text, sender name, and timestamp needed for the chat UI
- Reads from the Chat_Message__c custom object
- Orders the messages by CreatedDate in ascending order so the feed displays in a natural conversation sequence
- Limits the result to 50 records to keep the response efficient and manageable

This is useful because the chat room does not need to load every message ever sent; it only needs the most recent conversation history in a lightweight and readable format. I also used a similar pattern in the recent feed controller, but with a descending order and a smaller limit to show the newest messages in a compact summary view.

### Recent chat feed SOQL example

The second query is used for the smaller summary panel that shows the newest chat activity at a glance, and it is implemented in [classes/RecentChatFeedController.cls](classes/RecentChatFeedController.cls):

```apex
SELECT Id, CreatedBy.Name, Message__c, CreatedDate
FROM Chat_Message__c
ORDER BY CreatedDate DESC
LIMIT 5
```

This version is slightly different because it is optimized for a recent-feed widget instead of the full chat history. It still reads from the same object, but it retrieves only the latest five records and sorts them in descending order so the newest posts appear first. This is useful when the app wants to highlight recent activity without loading the whole conversation thread.

## Apex testing

Apex tests are important because they verify that the server-side logic behaves correctly before the code is considered reliable. In this project, I used unit tests to validate the chat query methods and confirm that the returned data matches expectations.

### ChatController Apex test

The first test file is [classes/ChatControllerTest.cls](classes/ChatControllerTest.cls). It validates the main chat retrieval logic in [classes/ChatController.cls](classes/ChatController.cls).

```apex
@isTest
private class ChatControllerTest {
    @isTest
    static void testGetRecentMessagesWithData() {
        List<Chat_Message__c> testMessages = new List<Chat_Message__c>();
        for (Integer i = 0; i < 5; i++) {
            testMessages.add(new Chat_Message__c(
                Message__c = 'Test Message ' + i
            ));
        }
        insert testMessages;

        Test.startTest();
        List<Chat_Message__c> result = ChatController.getRecentMessages();
        Test.stopTest();

        System.assertNotEquals(null, result, 'Result list should not be null');
        System.assertEquals(5, result.size(), 'Should return all 5 inserted test messages');
        System.assertNotEquals(null, result[0].CreatedBy.Name, 'CreatedBy relation should be populated');
    }
}
```

This test covers the case where chat records already exist. It verifies that the method returns the records correctly, that the result is not null, and that the expected number of records appears in the response. It also checks that the `CreatedBy.Name` relationship is populated correctly.

The second test in the same file checks the empty-state scenario:

```apex
@isTest
static void testGetRecentMessagesEmpty() {
    Test.startTest();
    List<Chat_Message__c> result = ChatController.getRecentMessages();
    Test.stopTest();

    System.assertNotEquals(null, result, 'Result list should not be null');
    System.assertEquals(0, result.size(), 'Should return an empty list when no records exist');
}
```

This ensures the method behaves safely when no Chat Message records exist, returning an empty list instead of throwing an error or failing unexpectedly.

### RecentChatFeedController Apex test

The second test file is [classes/RecentChatFeedControllerTest.cls](classes/RecentChatFeedControllerTest.cls), and it validates the summary query in [classes/RecentChatFeedController.cls](classes/RecentChatFeedController.cls).

```apex
@isTest
private class RecentChatFeedControllerTest {
    @isTest
    static void testGetRecentMessages() {
        Chat_Message__c msg = new Chat_Message__c(Message__c = 'Test Message');
        insert msg;

        Test.startTest();
        List<Chat_Message__c> results = RecentChatFeedController.getRecentMessages();
        Test.stopTest();

        System.assertEquals(1, results.size(), 'Should return 1 message');
        System.assertEquals('Test Message', results[0].Message__c, 'Message text should match');
    }
}
```

This test confirms that the recent feed method returns the newest chat message and that the text matches the expected content. In other words, the test checks that the summary controller behaves correctly when retrieving a simple, recent message list.

## VS Code setup

The project was developed and validated in VS Code with an authorized Salesforce org connection.

![VS Code environment](VSCode_Environment.png)

This screenshot shows the coding environment used to build the app. It captures the workspace where the project files were created, edited, and managed as the Salesforce development work progressed.

![Authorized org in VS Code](VSCode_Authorized_Org.png)

This image confirms that the Salesforce org is successfully connected to VS Code. It is an important setup step because it allows Apex classes, metadata, and Lightning Web Components to be synced and managed directly from the editor.

![Apex classes in VS Code](VSCode_Apex_Classes.png)

This screenshot highlights the Apex logic within the project. It shows the backend classes used to process chat actions and related logic, making the server-side behavior easy to inspect and maintain in the IDE.

![LWC files in VS Code](VSCode_LWC.png)

This final screenshot shows the Lightning Web Components used in the app. It demonstrates the front-end UI pieces that connect to the Apex logic and give the project its interactive chat and user-facing experience.

## How I built it from scratch

These images show the early app-manager workflow I used to build the project from the ground up. They document the step-by-step structure I created when designing the app foundation before moving into the full interface and feature work.

### App manager app overview

![App Manager App](App_Manager_App.png)

This is the starting point of the app manager, where the overall app structure and basic foundation were defined. It shows how the project began as a clean, organized system rather than a fully finished interface.

### App manager navigation items

![App Manager Navigation Items](App_Manager_Navigation_Items.png)

This screen shows the navigation system that was set up early in the process. It highlights the app’s initial structure and how the main sections were planned to guide users through the experience.

The sequence of tabs was intentionally designed to feel logical and progressive. The most important content-driven areas are placed earlier in the flow, with the app prioritizing the core user experience first: Home, then Global Chat, followed by Artist, Beatmaps, and Score-related sections. This keeps the app centered around browsing, exploring, and engaging with the music content before moving into more analytical or secondary views such as Reports and Dashboard.

The idea is that the user should first understand the app’s purpose and explore the music ecosystem, then move into monitoring and higher-level summaries later. In other words, the ordering is meant to support a natural journey: discover content, interact, then review data and analytics.

### App manager user profiles

![App Manager User Profiles](App_Manager_User_Profiles.png)

This part of the app manager focuses on user identity and profile setup. It captures how the app was organized around accounts, user information, and the personal context needed for the rest of the experience.

The System Administrator profile represents the app admin or platform owner, similar to osu! admins who need broad control over data, configuration, and system access. In contrast, the Sfosu!player profile represents a normal osu! player user, which is more restricted and should behave like a regular end-user profile instead of an admin-level one.

The main challenge here is setting the correct permissions, profile settings, and roles so the user can access the right objects and CRUD actions without giving them too much power. The normal player profile should be able to view and update only the records and fields that are relevant to their gameplay and personal profile, while admin users should have the full platform control needed to manage the app.

I also ran into a frustrating issue while testing the standard osu player profile: the app would sometimes switch to the classic Salesforce experience and show a message like "insufficient privilege." That was a sign that the profile still lacked the required object or field access, or that a page/action was trying to load something the user was not allowed to see. This reminds me that profile setup is not just about making a user record exist — it also requires careful attention to the actual permissions behind the scenes.

A random learning I picked up while testing this is that switching the display density from Comfy to Compact and vice versa can help refresh the UI experience on desktop, especially when the screen feels a bit delayed or sluggish. It is not a true fix for permission issues, but it is a practical way to force the page to update visually and give the interface a quick reset when it feels stuck or laggy.

### App manager app details and branding

![App Manager App Details and Branding](App_Manager_App_Details_And_Branding.png)

This screen covers the app details and branding layer, which is where the project starts to feel more complete. It reflects the step where the identity, branding, and key app metadata were defined alongside the functionality.

## Current status

This project is currently in a learning and experimentation phase.

- Some features may be incomplete
- Some parts may not work as expected
- Bugs are expected
- Improvements are ongoing
- The project is meant to grow through trial and error

> Disclaimer: I may have a lot of bugs, broken logic, or unpolished features. I still try my best to apply what I have learned, fix issues when I can, and explain what is happening in the process.

## What I want to achieve

- Learn by building
- Improve my coding and problem-solving skills
- Practice real-world app development
- Keep a record of progress and mistakes
- Share the journey with others who are also learning

## Top 3 Learning Priorities

As I continue to develop SFosu!, I have identified three core areas where I want to focus my growth:

1. **Permissions, Profiles, and Sharing Rules:** I need to master the Salesforce security model. Currently, the standard "Sfosu!player" profile is experienceing "insufficient privilege" errors and UI glitches that don't occur for the System Admin. I want to learn how to properly configure CRUD access and record-level security so the app works seamlessly for all user types.
2. **Advanced LWC and Apex Development:** I want to push my technical limits with Lightning Web Components and Apex. This includes learning better debugging patterns for complex code, optimizing performance, and handling more sophisticated asynchronous operations.
3. **Agentforce and AI Integration:** I want to explore how to include AI to make business processes more efficient. Learning how to leverage Agentforce will allow me to automate smarter interactions and bring modern AI capabilities into the SFosu! ecosystem.

## Development approach


This project is a hands-on learning experience. I am focusing on:

- understanding the problem
- trying solutions
- debugging what fails
- testing ideas
- improving step by step
- documenting what I discover

There is no pressure to make everything perfect right away. The important part is learning, adapting, and moving forward.

## Project structure

This repository is currently a starting point for the project and may evolve as development continues.

```text
Sfosu-/
├── README.md
├── assets/
├── src/
├── docs/
├── tests/
└── ...
```

## Getting started

This section will be updated as the project grows.

For now, this is meant as a personal project repository and learning log.

```bash
git clone https://github.com/YourUsername/Sfosu-.git
cd Sfosu-
# Install dependencies here when the project setup is ready
# Run the app here when the project structure is ready
```

## Stack and tools

The actual tech stack will be added as the project is developed.

This project may include technologies such as:

- frontend or mobile framework
- backend or local data handling
- APIs or services
- state management
- testing tools
- UI design and asset work

## Learning goals

I want to keep improving in these areas:

- app architecture
- UI/UX design
- debugging and troubleshooting
- writing maintainable code
- learning from mistakes
- documenting my process clearly

## Vlog / project journey notes

This project is also part of my self-documentation journey. I plan to discuss:

- what I am trying to build
- what I learned from it
- what failed and why
- how I fixed issues
- what I still need to improve
- how the project changes over time

The goal is not to hide the messy parts. The goal is to show honest progress.

## A note about the process

Not everything will be polished.
Not every feature will work perfectly.
Not every idea will succeed on the first try.

But that is part of real development, and I am learning through it.

## Final note

SFosu! is a personal project, a learning journey, and a place to document growth.

I may not have everything figured out yet, but I am trying my best to apply what I have learned and share the process honestly.

Thank you for following along.

---

Built with patience, curiosity, and a lot of trial and error.
