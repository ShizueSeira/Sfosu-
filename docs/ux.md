# UX and navigation notes

## Navigation order

The tab order is intentionally designed to feel progressive and logical:

1. Home
2. Global Chat
3. Artist
4. Beatmaps
5. Score-related views
6. Reports
7. Dashboard

This keeps the app focused on discovery, interaction, and content browsing before moving into analysis and summary views.

## Recent messages on home

The home screen is limited to the 5 most recent messages so the UI stays concise and useful without overwhelming the user with older chat activity.

## List view field visibility

I adjusted the visible fields for the object list views so that both Recently Viewed and All Records display only the relevant columns. The purpose is to reduce unnecessary clicks and keep the most important osu! details in one screen.

## List view actions

The current Artist list view keeps the action set intentionally minimal. The focus is on Add New Artist. Delete, archive, and edit are not part of the current implementation and are better reserved for future versions after the permission model is clearer.

## Display density

A useful UI trick during testing is switching display density between Comfy and Compact. This can refresh the desktop experience and reduce the feeling of lag or stale layout when a screen feels delayed.

Related docs:
- [dashboard.md](dashboard.md)
- [chat.md](chat.md)
- [architecture.md](architecture.md)
