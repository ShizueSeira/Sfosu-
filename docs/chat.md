# Global chat and messaging

## Core idea

The Global Chat screen is meant to feel social and active. It is not just a content catalog; it is a place where community interaction happens.

## Censoring flow

The profanity filter is intended to catch bad language and replace it with a censored version. I tested examples like:

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

Related docs:
- [permissions.md](permissions.md)
- [ux.md](ux.md)
