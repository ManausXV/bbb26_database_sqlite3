-- Turning on foreign key constraints
PRAGMA foreign_keys = ON;

-- Table 1: Contestants
CREATE TABLE "contestants" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "birth_year" NUMERIC NOT NULL,
    "group" TEXT NOT NULL CHECK("group" IN ('Civilian','Celebrity','Veteran')),
    "final_status" TEXT NOT NULL CHECK("final_status" IN ('Winner', 'Runner-Up', 'Third', 'Evicted', 'Walked', 'Ejected')),
    "placement" INTEGER NOT NULL,
    "notes" TEXT,
    PRIMARY KEY("id")
);

-- Table 2: Weeks
CREATE TABLE "weeks" (
    "id" INTEGER,
    "week_number" INTEGER NOT NULL,
    "start_day" NUMERIC,
    "end_day" NUMERIC,
    PRIMARY KEY("id")
);

-- Table 3: Competitions
CREATE TABLE "competitions" (
    "id" INTEGER,
    "week_id" INTEGER NOT NULL,
    "round_number" INTEGER NOT NULL,
    "type" TEXT NOT NULL CHECK("type" IN ('Leader Competition','Veto Competition')),
    "winner_id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("week_id") REFERENCES "weeks"("id"),
    FOREIGN KEY("winner_id") REFERENCES "contestants"("id")
);

-- Table 4 & Table 5: Paredoes (Nomination Walls)
CREATE TABLE "paredoes" (
    "id" INTEGER,
    "week_id" INTEGER NOT NULL,
    "round_number" INTEGER NOT NULL,
    "notes" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("week_id") REFERENCES "weeks"("id")
);

-- Remaining Tables: Statistics and results
CREATE TABLE "paredao_results" (
    "id" INTEGER,
    "paredao_id" INTEGER NOT NULL,
    "contestant_id" INTEGER NOT NULL,
    "nomination_type" TEXT NOT NULL CHECK("nomination_type" IN ('Leader Choice','Twist Nominee', 'House Vote')),
    "vote_percentage" REAL,
    "outcome" TEXT NOT NULL CHECK("outcome" IN ('Saved', 'Evicted', 'Winner', 'Runner-Up', 'Third Place')),
    PRIMARY KEY("id"),
    FOREIGN KEY("paredao_id") REFERENCES "paredoes"("id"),
    FOREIGN KEY("contestant_id") REFERENCES "contestants"("id")
);

CREATE TABLE "weekly_eliminations" (
    "id" INTEGER,
    "week_id" INTEGER NOT NULL,
    "round_number" INTEGER NOT NULL,
    "hoh_id" INTEGER,
    "immune_id" INTEGER,
    "nominee1_id" INTEGER,
    "nominee2_id" INTEGER,
    "nominee3_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("week_id") REFERENCES "weeks"("id"),
    FOREIGN KEY("hoh_id") REFERENCES "contestants"("id"),
    FOREIGN KEY("immune_id") REFERENCES "contestants"("id"),
    FOREIGN KEY("nominee1_id") REFERENCES "contestants"("id"),
    FOREIGN KEY("nominee2_id") REFERENCES "contestants"("id"),
    FOREIGN KEY("nominee3_id") REFERENCES "contestants"("id")
);

CREATE TABLE "weekly_roles" (
    "id" INTEGER,
    "week_id" INTEGER NOT NULL,
    "round_number" INTEGER NOT NULL,
    "contestant_id" INTEGER NOT NULL,
    "role" TEXT NOT NULL CHECK("role" IN ('Entered','Special Power Holder', 'Immune', 'Safe', 'Exited Early')),
    PRIMARY KEY("id"),
    FOREIGN KEY("week_id") REFERENCES "weeks"("id"),
    FOREIGN KEY("contestant_id") REFERENCES "contestants"("id")
);

CREATE TABLE "season_twists" (
    "id" INTEGER,
    "week_id" INTEGER NOT NULL,
    "twist" TEXT NOT NULL CHECK("twist" IN ('Big Phone', 'Surprise Boxes', 'Block Party', 'Power Machine', 'Reward')),
    "description" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("week_id") REFERENCES "weeks"("id")
);

CREATE TABLE "event_winners" (
    "id" INTEGER,
    "event_id" INTEGER NOT NULL,
    "contestant_id" INTEGER NOT NULL,
    "effect" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("event_id") REFERENCES "season_twists"("id"),
    FOREIGN KEY("contestant_id") REFERENCES "contestants"("id")
);

CREATE TABLE "nominations" (
    "id" INTEGER,
    "week_id" INTEGER NOT NULL,
    "round_number" INTEGER NOT NULL DEFAULT 1,
    "nominator_id" INTEGER NOT NULL,
    "nominee_id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("week_id") REFERENCES "weeks"("id"),
    FOREIGN KEY("nominator_id") REFERENCES "contestants"("id"),
    FOREIGN KEY("nominee_id") REFERENCES "contestants"("id"),
    CHECK("nominator_id" != "nominee_id")
);

-- Indexes: Some useful indexes dedicated for the most common queries for this project

CREATE INDEX "index_paredao_results_contestant" ON "paredao_results"("contestant_id");
CREATE INDEX "index_nominations_nominee" ON "nominations"("nominee_id");
CREATE INDEX "index_nominations_nominator" ON "nominations"("nominator_id");
CREATE INDEX "index_competitions_winner" ON "competitions"("winner_id");

-- Views
-- View Type #1 - joining ids with text
-- View #1: Who won which competition which week
CREATE VIEW "competition_winners" AS
SELECT "competitions"."week_id" AS "week", "contestants"."name" AS "winner", "competitions"."round_number", "competitions"."type"
FROM "competitions"
JOIN "contestants" ON "competitions"."winner_id" = "contestants"."id"
ORDER BY "competitions"."week_id";

-- View #2: Results of the paredoes with corresponding names, weeks and rounds
CREATE VIEW "paredao_stats" AS
SELECT "paredoes"."week_id" AS "week", "paredoes"."round_number", "contestants"."name",
"paredao_results"."nomination_type", "paredao_results"."vote_percentage", "paredao_results"."outcome"
FROM "paredao_results"
JOIN "contestants" ON "paredao_results"."contestant_id" = "contestants"."id"
JOIN "paredoes" ON "paredao_results"."paredao_id" = "paredoes"."id"
ORDER BY "paredoes"."week_id", "paredoes"."round_number", "paredao_results"."vote_percentage" ASC;

-- View #3 "weekly_eliminations" visualized with actual text data on top of the ids
-- My objective: use subqueries in order to get the data I need, since 5 columns require "contestants"."name"
CREATE VIEW "weekly_eliminations_visual" AS
SELECT "weekly_eliminations"."week_id" AS "week", "weekly_eliminations"."round_number",
(SELECT "name" FROM "contestants" WHERE "id" = "weekly_eliminations"."hoh_id") AS "hoh_name",
(SELECT "name" FROM "contestants" WHERE "id" = "weekly_eliminations"."immune_id") AS "immune_name",
(SELECT "name" FROM "contestants" WHERE "id" = "weekly_eliminations"."nominee1_id") AS "nominee1_name",
(SELECT "name" FROM "contestants" WHERE "id" = "weekly_eliminations"."nominee2_id") AS "nominee2_name",
(SELECT "name" FROM "contestants" WHERE "id" = "weekly_eliminations"."nominee3_id") AS "nominee3_name"
FROM "weekly_eliminations"
ORDER BY "weekly_eliminations"."week_id", "weekly_eliminations"."round_number";

-- View #4
CREATE VIEW "weekly_roles_visual" AS
SELECT "weekly_roles"."week_id" AS "week", "weekly_roles"."round_number", "contestants"."name", "weekly_roles"."role"
FROM "weekly_roles"
JOIN "contestants" ON "weekly_roles"."contestant_id" = "contestants"."id";

-- View #5
CREATE VIEW "event_winners_visual" AS
SELECT (SELECT "twist" FROM "season_twists" WHERE "id" = "event_winners"."event_id") AS "twist",
"contestants"."name", "event_winners"."effect"
FROM "event_winners"
JOIN "contestants" ON "event_winners"."contestant_id" = "contestants"."id";

-- View #6
CREATE VIEW "nominations_visual" AS
SELECT "nominations"."week_id" AS "week", "nominations"."round_number",
(SELECT "name" FROM "contestants" WHERE "id" = "nominations"."nominator_id") AS "nominator_name",
(SELECT "name" FROM "contestants" WHERE "id" = "nominations"."nominee_id") AS "nominee_name"
FROM "nominations"
ORDER BY "nominations"."week_id", "nominations"."round_number";

-- Views Type #2: Statistical Views
-- Here are a few views that answer a specific statistical question
-- Although these could also be querier, I decided to make the most common questions into a view
-- Strategy: Since I already created the needed views earlier, I can just use them
-- in the views below, to make reading easier and showcase building on top of my own views

-- Statistical view #1: Who won the most competitions?
CREATE VIEW "competition_wins_leaderboard" AS
SELECT "winner", COUNT(*) AS "competition_wins"
FROM "competition_winners"
GROUP BY "winner"
ORDER BY "competition_wins" DESC;

-- Statistical view #2: Who was a nominee on the paredao the most?
CREATE VIEW "paredao_nominations_leaderboard" AS
SELECT "name", COUNT(*) AS "nominations"
FROM "paredao_stats"
WHERE "outcome" NOT IN ('Winner','Runner-Up','Third Place')
GROUP BY "name"
ORDER BY "nominations" DESC;

-- Statistical view #3: Who received the most peer nominations?
CREATE VIEW "peer_nomination_votes_leaderboard" AS
SELECT "nominee_name", COUNT(*) AS "nominations_count"
FROM "nominations_visual"
GROUP BY "nominee_name"
ORDER BY "nominations_count" DESC;

-- Statistical view #4: Which nomination method leads to eviction most often?
CREATE VIEW "nomination_types_evictions_leaderboard" AS
SELECT "nomination_type", COUNT(*) AS "total_evictions"
FROM "paredao_stats"
WHERE "outcome" = 'Evicted'
GROUP BY "nomination_type"
ORDER BY "total_evictions" DESC;
