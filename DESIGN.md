# Design Document

By Mert Ali

Video overview: <[BBB26 Video Overview](https://www.youtube.com/watch?v=HqLfqC8agTY)>

## Scope
This database is based on the twenty-sixth season of Big    Brother Brasil (BBB26) - a reality tv show where 25 contestants compete for the prize of 5 million R$ while nomination one another for eviction and facing a public vote every week. The specifics of the competition make it a great candidate for its own database - it contains an abundance of statistics due to the nature of the game. This database has the purpose of analyzing the statistics of BBB26 in a way where it's easy to answer questions by queries (for example: who won which competition, who nominated whom, etc.). This work is a personal analytical project rather than an industry focused one like a production system tracking an ongoing season. This results to the fact that this database is fixed - there is no need to add new data because the season is finalized and concluded.

In the scope of this project is every relevant record of this season, which includes: All of the 25 contestants and relevant information (such as group, birth year, placement), every week's duration and occurring events, competition results and winners, every weekly paredao (nomination wall) with every nominated contestant - how they got nominated and everyone's individual outcome, a junction table containing 6 foreign keys in order to connect every table that has weekly based events to the corresponding week, weekly roles of every contestant along with twists with their winners and twist details, and last but not least - a table that records every individual house nomination, which results to a table with 250+ rows, but very useful data for future queries.

Information that is explicitly out of scope: The roughly 30 potential housemates, considered during the season's Glass House twist, which serves as ground for casting, where only the most upvoted contestants make it into the game. The said potential housemates have no in-game data as they were never selected and had no impact on the season whatsoever, so they are not represented here deliberately. Alliances and friendships are also not recorded for various reasons - an alliance/friendship is a subjective term in a game of betrayal and deceit, the information about them is also inconsistent and finally this would add further complexity on the database schema without having any significant value. A table for the weekly have/have-not status for each contestant was considered, but it was scrapped, because it is just unneccessary information just adding weight to the schema. Detailed personal information about individuals is also inconsistent, which is why this database is limited only to the birth years of the contestants.

## Functional Requirements
This database is intended for people like me - someone who uses this database to answer questions devired from curiousity, like which contestant got the most house nominees, which contestant nominated each other, which contestant targeted the same person more than once and so on. Typically, to answer these questions I would need to do digging and track down every single row, but with a database, all i need is a 3 line query to get an answer to my question. This serves commercial purpose to me as well, as i actually plan to produce BBB26 statistics on youtube, so this actually saves me (the user) so many hours that I would otherwise have to spend on research.

The social and strategic reasoning behind every statistic is what's out of scope for this project. This database is only intented to record the game mechanism, but not the social dynamics or motives.

## Representation

### Entities
The database contains 10 tables representing different entities and events. Contestant is the main entity, it contains id, name, birth_year, group (Civilian, Celebrity, Veteran), final_status (Winner, Runner-up, Third, Evicted, Walked, Ejected), placement and notes (free text). Group and final_status contain a CHECK because the data for both is fixed. Placement is NOT NULL, and assigned to every contestant, as there are multiple ways an individual puts an end to their game - Winner, Eliminated, Ejected, Walked, etc.

Competitions records each Leader and Veto winner, again by using a CHECK constraint on type for the same reason as contestants. Paredoes is a thin table that repesents a just one elimination round with a round_number to support weeks that contain multiple rounds. weekly_eliminations is a wide summary table intended as an easy way to read the standart information contained in a week. weekly_roles is a junction table covering statuses not tied to any nomination outcome such as Entered, Exited Early, Immune, Safe, or Special Power Holder.

### Relationships
![Entity Relationship Diagram](image.png)
"Contestants" sits at the center of the schema, because it is referenced by nearly every other table. "Weeks" is also a core table, due to the fact that every game mechanic occurs in the within the context of a specific week. Paredoes is referenced by paredao_results, and season_twists is referenced by event_winners. The two many-to-many relatinships in the schema (paredao_results and nominations) are implemented as their own junction table.

## Optimizations
This database contains 4 indexes, which are justified by the reccuring query pattern the users would use, so they have been added deliberately.

This database contains 10 views divided into 2 types. The first 6 views are intended for better readibility that join human-readable text into the corresponding foreign-key via joins and subqueries. The other 4 are statistical views layered on top of the previous 6 views and each of them answering a specific reccuring question (who won the most competitions, hwo landed on the block the most, who received the most individual nomination votes, which nomination mechanism most often actually resulted in an eviction). Building the statistical views on top of the readibility views rather than the raw tables directly was a deliberate choice to demonstrate that views can compose on top of one another, not just sit directly on base tables.

## Limitations
The database has several known limitations. Biographic detail for most contestants is limited to birth year, since the information about every contenstant is very inconsistent. The vocabulary around tables is also simplified - Portuguese terms were replaced to the closest alternative in English, although it is not perfectly precise. Weekly have/have-not information is also left out.

The nominations table has one specific gap - the season's final pre-finale elimination round (week 14, round 2) is decided by a public vote rather than by peer nomination, therefore no data exists for this round as a result. And finally, the data was assembled from a fan-maintained wiki and Brazillian media outlets, due to the lack of a single authoritative dataset that documents the entire course of the season. This introduces a risk of potential innacuracy amond the data.
