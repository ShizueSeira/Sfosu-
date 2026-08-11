# Permissions, profiles, and access

## User profiles

The app is currently thinking in terms of two main profiles:

- System Administrator: admin-level, like osu! admins
- Sfosu!player: regular osu! player profile

The admin profile has broad data and system access. The player profile is intended to be more restricted and only expose the records and fields relevant to that user.

## Current challenge

The main problem I am dealing with is permission design and CRUD access. The normal player profile should be able to see and edit only what matters for a player, but without exposing admin functions or data that should remain restricted.

I also hit a classic Salesforce issue where the app would switch to the classic interface and display an "insufficient privilege" message. That usually means the profile does not have access to the object, field, or action being requested.

## Role hierarchy and visibility

Role hierarchy is still something I have not fully tested yet in the project. This is important because it affects record visibility, sharing, and whether users can see messages or content created by admins or other players.

## Important learning

Profile setup is not just about creating a user. It also requires matching the correct object permissions, field-level security, page visibility, and sharing model for the relevant experience.

Related docs:
- [architecture.md](architecture.md)
- [chat.md](chat.md)
- [ux.md](ux.md)
