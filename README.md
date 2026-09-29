# BBB26 Database

A SQLite database modeling every contestant, week, competition and elimination of Big Brother Brasil season 26 — built as my CS50 SQL final project.

## What it does

Turns a reality show's messy, ongoing events into structured, queryable data: 25 contestants, 10 tables, and 10 views layered for readability and statistics. Questions that would normally take hours of manual digging through episode recaps — *who nominated whom, who won the most competitions, which elimination method most often led to a real eviction* — become a 3-line query.

## Schema

10 tables, with `contestants` and `weeks` as the two hubs everything else connects to:

- **contestants** — id, name, birth year, group, final status, placement
- **competitions** — Leader and Veto winners per week
- **paredoes** — each elimination round (some weeks have more than one)
- **paredao_results** / **nominations** — the two many-to-many relationships, each its own junction table
- **weekly_eliminations** — a wide summary table for quick reads
- **weekly_roles** — statuses like Immune, Safe, or Special Power Holder
- **season_twists** / **event_winners** — twist mechanics and their winners

10 views split into two layers: 6 join raw foreign keys into human-readable text, and 4 statistical views are built **on top of those 6** — not directly on the base tables — specifically to show views can compose on top of each other.

4 indexes, added deliberately based on the query patterns the database is actually used for.

## Example queries

See [`queries.sql`](./queries.sql) for the full set. A few examples of what it answers:
- Which contestant received the most individual nomination votes
- Which nomination mechanism most often resulted in an actual eviction
- Who won the most competitions

## Design rationale

The reasoning behind every schema decision — what's in scope, what was deliberately left out (alliances, the Glass House candidates, have/have-not status), and known data limitations — is in [`DESIGN.md`](./DESIGN.md).

## Files

- `schema.sql` — table and view definitions
- `queries.sql` — example queries
- `bbb26.db` — the built database
- `DESIGN.md` — full design document

## Data source

Assembled from a fan-maintained wiki and Brazilian media coverage, since no single authoritative dataset covers the full season.

