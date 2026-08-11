# Global chat and messaging

## Core idea

The Global Chat screen is meant to feel social and active. It is not just a content catalog; it is a place where community interaction happens.

## Censoring flow

I created four Salesforce flows in total for the SFosu! chat experience. The first flow is the Chat Moderation Filter Flow, and it is the one that handles the profanity check.

### Flow 1: Chat Moderation Filter Flow

- Trigger: record created
- Object: Chat_Message__c
- Entry conditions: none
- Flow type: Fast Field Update

The flow starts when a new chat message record is created. It does not require entry conditions because the goal is to evaluate every new message as soon as it is inserted.

From there, a Decision node checks whether the incoming message contains a censored or bad word. If the text includes a banned word, the flow follows the “has bad words” path. If the message is clean, it follows the normal path and no change is made to the content.

On the bad-word path, an Update Records element changes the message text to *Censored*. This means the message is not displayed in its original offensive form; it is replaced with the moderated value instead.

### Flow screenshots

![Configure Start](../Flows_Chat_Moderation_Filter_Configure_Start.png)

![Decision node](../Flows_Chat_Moderation_Filter_Decision.png)

![Update Records](../Flows_Chat_Moderation_Filter_Update_Records.png)

![Flow overview](../Flows_Chat_Moderation_Filter_FIgure.png)

### Full flow list

1. Chat Moderation Filter Flow
2. Flow 2
3. Flow 3
4. Flow 4

I have already documented the first flow in detail. The remaining three flow names and screenshots will be added once they are uploaded and finalized.

## Example moderation behavior

I tested examples like:

- shit
- fuck
- idiot

These were replaced with *Censored* when the admin profile triggered the flow.

## Current issue

I still need to resolve the visibility problem for the standard player profile. The admin profile can test and send censored content successfully, but the standard player profile is not reliably seeing the message stream. This points to a permission or sharing issue rather than just a logic problem in the filter itself.

## What this means for the project

The model is conceptually correct, but the access layer still needs to be fixed. This includes checking:

- object permissions
- record visibility
- page visibility
- sharing rules
- role hierarchy and user assignment

![Flow list](../Flows_List.png)

Related docs:
- [permissions.md](permissions.md)
- [ux.md](ux.md)
