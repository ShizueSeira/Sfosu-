# Dashboard and reports

## Home dashboard

The home page is intended to act as a summary dashboard for the app. It should show a quick snapshot of the most important activity without forcing the user to open the detailed reports immediately.

## Report structure

The project includes four main reports that are also reflected in the dashboard:

- Artist details report
- Top 10 most gained scores
- Top 5 PP plays standard
- Top 5 PP plays mania

These reports are meant to give both a summary and a detailed view of the data. They capture the key performance and content-overview areas the app cares about most without overwhelming the user with too many ranking views.

## Chart vs table decision

Some charts may not be the best choice for certain data. For example, the Most Gained Scores report may have a very large difference between the top player and the next player, which makes a bar chart less readable. In that case, a table is clearer because it shows the ranking gap directly and avoids misleading visual scaling.

## Design approach

The dashboard is meant to be the top-level overview, while the Reports section is the more detailed analysis area. This keeps the app more natural to explore and lets users move from overview to drill-down without confusion.

Related docs:
- [ux.md](ux.md)
- [architecture.md](architecture.md)
