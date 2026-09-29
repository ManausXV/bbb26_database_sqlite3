-- Jump to line 450 to browse the queries
-- 1. Filling the tables with data
INSERT INTO "contestants" ("id", "name", "birth_year", "group", "final_status", "placement", "notes")
VALUES
(1, 'Ana Paula Renault', 1981, 'Veteran', 'Winner', 1, 'Returnee from BBB16'),
(2, 'Milena Moreira', 1999, 'Civilian', 'Runner-Up', 2, 'Selected via Glass House - Region 4 Southeast'),
(3, 'Juliano Floss', 2004, 'Celebrity', 'Third', 3, NULL),
(4, 'Leandro Rocha', 1983, 'Civilian', 'Evicted', 4, NULL),
(5, 'Jordana Morais', 1997, 'Civilian', 'Evicted', 5, 'Selected via Glass House - Region 3 Central-West'),
(6, 'Gabriela Saporito', 2004, 'Civilian', 'Evicted', 6, NULL),
(7, 'Marciele Albuquerque', 1994, 'Civilian', 'Evicted', 7, 'Selected via Glass House - Region 1 North'),
(8, 'Samira Sagr', 2001, 'Civilian', 'Evicted', 8, 'Selected via Glass House - Region 5 South'),
(9, 'Chaiany Andrade', 2001, 'Civilian', 'Evicted', 9, NULL),
(10, 'Solange Couto', 1956, 'Celebrity', 'Evicted', 10, NULL),
(11, 'Alberto Pimentel', 1976, 'Veteran', 'Evicted', 11, NULL),
(12, 'Jonas Sulzbach', 1986, 'Veteran', 'Evicted', 12, NULL),
(13, 'Breno Cora', 1993, 'Civilian', 'Evicted', 13, 'Fake-evicted Week 7 (Secret Room twist); really evicted Week 9'),
(14, 'Babu Santana', 1979, 'Veteran', 'Evicted', 14, NULL),
(15, 'Maxiane Rodrigues', 1994, 'Civilian', 'Evicted', 15, 'Selected via Glass House - Region 2 Northeast'),
(16, 'Marcelo Alves', 1995, 'Civilian', 'Evicted', 16, 'Selected via Glass House - Region 2 Northeast'),
(17, 'Edilson Capetinha', 1970, 'Celebrity', 'Ejected', 17, 'Ejected Week 5 - not a public vote outcome'),
(18, 'Sol Vega', 1978, 'Veteran', 'Ejected', 18, 'Ejected Week 5 - not a public vote outcome'),
(19, 'Sarah Andrade', 1991, 'Veteran', 'Evicted', 19, NULL),
(20, 'Brigido Neto', 1992, 'Civilian', 'Evicted', 20, 'Selected via Glass House - Region 1 North'),
(21, 'Paulo Carvalhaes', 2005, 'Civilian', 'Ejected', 21, 'Selected via Glass House - Region 3 Central-West; Ejected Week 3'),
(22, 'Matheus Moreira', 2001, 'Civilian', 'Evicted', 22, NULL),
(23, 'Aline Campos', 1987, 'Celebrity', 'Evicted', 23, 'First contestant evicted (Week 1)'),
(24, 'Pedro Espindola', 2004, 'Civilian', 'Walked', 24, 'Selected via Glass House - Region 5 South; Walked Week 1'),
(25, 'Henri Castelli', 1978, 'Celebrity', 'Walked', 25, 'Walked Week 1');

-- Note: In-game weeks are a loose definition, they may not be strictly 7 days
INSERT INTO "weeks" ("id", "week_number", "start_day", "end_day")
VALUES
(1, 1, '2026-01-12', '2026-01-20'),
(2, 2, '2026-01-21', '2026-01-27'),
(3, 3, '2026-01-28', '2026-02-03'),
(4, 4, '2026-02-04', '2026-02-10'),
(5, 5, '2026-02-11', '2026-02-17'),
(6, 6, '2026-02-18', '2026-02-24'),
(7, 7, '2026-02-25', '2026-03-03'),
(8, 8, '2026-03-04', '2026-03-10'),
(9, 9, '2026-03-11', '2026-03-17'),
(10, 10, '2026-03-18', '2026-03-24'),
(11, 11, '2026-03-25', '2026-03-30'),
(12, 12, '2026-04-01', '2026-04-07'),
(13, 13, '2026-04-08', '2026-04-14'),
(14, 14, '2026-04-15', '2026-04-21');

INSERT INTO "competitions" ("id", "week_id", "round_number", "type", "winner_id")
VALUES
(1, 1, 1, 'Leader Competition', 11),
(2, 2, 1, 'Leader Competition', 14),
(3, 3, 1, 'Leader Competition', 15),
(4, 4, 1, 'Leader Competition', 12),
(5, 5, 1, 'Leader Competition', 12),
(6, 6, 1, 'Leader Competition', 12),
(7, 7, 1, 'Leader Competition', 8),
(8, 8, 1, 'Leader Competition', 11),
(9, 8, 1, 'Leader Competition', 12),
(10, 9, 1, 'Leader Competition', 11),
(11, 9, 1, 'Veto Competition', 5),
(12, 10, 1, 'Leader Competition', 11),
(13, 11, 1, 'Leader Competition', 1),
(14, 11, 2, 'Leader Competition', 1),
(15, 12, 1, 'Leader Competition', 8),
(16, 12, 2, 'Leader Competition', 3),
(17, 13, 1, 'Leader Competition', 3),
(18, 13, 2, 'Leader Competition', 5),
(19, 14, 1, 'Leader Competition', 4);

INSERT INTO "paredoes" ("id", "week_id", "round_number", "notes")
VALUES
(1, 1, 1, NULL),
(2, 2, 1, NULL),
(3, 3, 1, NULL),
(4, 4, 1, NULL),
(5, 5, 1, NULL),
(6, 6, 1, NULL),
(7, 7, 1, 'Fake eviction twist - Breno moved to Quarto Secreto'),
(8, 8, 1, NULL),
(9, 9, 1, NULL),
(10, 10, 1, NULL),
(11, 11, 1, NULL),
(12, 11, 2, NULL),
(13, 12, 1, NULL),
(14, 12, 2, NULL),
(15, 13, 1, NULL),
(16, 13, 2, NULL),
(17, 14, 1, NULL),
(18, 14, 2, NULL),
(19, 14, 3, 'Final winner vote among top 3 - outcome values here are Winner/Runner-Up/Third Place');

INSERT INTO "paredao_results" ("id", "paredao_id", "contestant_id", "nomination_type", "vote_percentage", "outcome")
VALUES
(1, 1, 21, 'House Vote', NULL, 'Saved'), -- Paulo Carvalhaes
(2, 1, 1, 'Twist Nominee', 5.86, 'Saved'), -- Ana Paula Renault
(3, 1, 2, 'Leader Choice', 32.50, 'Saved'), -- Milena Moreira
(4, 1, 23, 'Twist Nominee', 61.64, 'Evicted'), -- Aline Campos
(5, 2, 20, 'House Vote', 4.97, 'Saved'), -- Brigido Neto
(6, 2, 4, 'Twist Nominee', 15.55, 'Saved'), -- Leandro Rocha
(7, 2, 22, 'Leader Choice', 79.48, 'Evicted'), -- Matheus Moreira
(8, 3, 12, 'Twist Nominee', NULL, 'Saved'), -- Jonas Sulzbach
(9, 3, 1, 'Leader Choice', 10.08, 'Saved'), -- Ana Paula Renault
(10, 3, 4, 'House Vote', 12.04, 'Saved'), -- Leandro Rocha
(11, 3, 20, 'House Vote', 77.88, 'Evicted'), -- Brigido Neto
(12, 4, 8, 'Twist Nominee', NULL, 'Saved'), -- Samira Sagr
(13, 4, 18, 'House Vote', 2.38, 'Saved'), -- Sol Vega
(14, 4, 14, 'Leader Choice', 28.49, 'Saved'), -- Babu Santana
(15, 4, 19, 'Twist Nominee', 69.13, 'Evicted'), -- Sarah Andrade
(16, 5, 5, 'House Vote', NULL, 'Saved'), -- Jordana Morais
(17, 5, 11, 'Twist Nominee', NULL, 'Saved'), -- Alberto Pimentel
(18, 5, 13, 'Twist Nominee', NULL, 'Saved'), -- Breno Cora
(19, 5, 10, 'Twist Nominee', 15.19, 'Saved'), -- Solange Couto
(20, 5, 8, 'House Vote', 16.25, 'Saved'), -- Samira Sagr
(21, 5, 16, 'Leader Choice', 68.56, 'Evicted'), -- Marcelo Alves
(22, 6, 11, 'House Vote', NULL, 'Saved'), -- Alberto Pimentel
(23, 6, 9, 'Twist Nominee', 0.68, 'Saved'), -- Chaiany Andrade
(24, 6, 2, 'Leader Choice', 36.11, 'Saved'), -- Milena Moreira
(25, 6, 15, 'Twist Nominee', 63.21, 'Evicted'), -- Maxiane Rodrigues
(26, 7, 7, 'House Vote', NULL, 'Saved'), -- Marciele Albuquerque
(27, 7, 5, 'Leader Choice', 2.22, 'Saved'), -- Jordana Morais
(28, 7, 11, 'Twist Nominee', 43.12, 'Saved'), -- Alberto Pimentel
(29, 7, 13, 'Twist Nominee', 54.66, 'Evicted'), -- Breno Cora
(30, 8, 5, 'House Vote', NULL, 'Saved'), -- Jordana Morais
(31, 8, 9, 'Twist Nominee', 0.47, 'Saved'), -- Chaiany Andrade
(32, 8, 2, 'Leader Choice', 30.91, 'Saved'), -- Milena Moreira
(33, 8, 14, 'Twist Nominee', 68.62, 'Evicted'), -- Babu Santana
(34, 9, 12, 'Twist Nominee', NULL, 'Saved'), -- Jonas Sulzbach
(35, 9, 10, 'House Vote', NULL, 'Saved'), -- Solange Couto
(36, 9, 4, 'Twist Nominee', 15.87, 'Saved'), -- Leandro Rocha
(37, 9, 1, 'Twist Nominee', 25.17, 'Saved'), -- Ana Paula Renault
(38, 9, 13, 'Leader Choice', 58.96, 'Evicted'), -- Breno Cora
(39, 10, 5, 'Twist Nominee', NULL, 'Saved'), -- Jordana Morais
(40, 10, 6, 'Twist Nominee', 3.03, 'Saved'), -- Gabriela Saporito
(41, 10, 3, 'Leader Choice', 43.49, 'Saved'), -- Juliano Floss
(42, 10, 12, 'House Vote', 53.48, 'Evicted'), -- Jonas Sulzbach
(43, 11, 5, 'House Vote', 3.31, 'Saved'), -- Jordana Morais
(44, 11, 4, 'House Vote', 28.74, 'Saved'), -- Leandro Rocha
(45, 11, 11, 'Leader Choice', 67.95, 'Evicted'), -- Alberto Pimentel
(46, 12, 7, 'Twist Nominee', 2.29, 'Saved'), -- Marciele Albuquerque
(47, 12, 5, 'House Vote', 3.54, 'Saved'), -- Jordana Morais
(48, 12, 10, 'Leader Choice', 94.17, 'Evicted'), -- Solange Couto
(49, 13, 3, 'House Vote', 18.56, 'Saved'), -- Juliano Floss
(50, 13, 7, 'Leader Choice', 20.37, 'Saved'), -- Marciele Albuquerque
(51, 13, 9, 'House Vote', 61.07, 'Evicted'), -- Chaiany Andrade
(52, 14, 7, 'House Vote', 1.09, 'Saved'), -- Marciele Albuquerque
(53, 14, 5, 'Leader Choice', 47.67, 'Saved'), -- Jordana Morais
(54, 14, 8, 'Twist Nominee', 51.24, 'Evicted'), -- Samira Sagr
(55, 15, 6, 'Leader Choice', 3.04, 'Saved'), -- Gabriela Saporito
(56, 15, 4, 'Twist Nominee', 37.62, 'Saved'), -- Leandro Rocha
(57, 15, 7, 'House Vote', 59.34, 'Evicted'), -- Marciele Albuquerque
(58, 16, 1, 'Leader Choice', 6.64, 'Saved'), -- Ana Paula Renault
(59, 16, 3, 'Twist Nominee', 29.24, 'Saved'), -- Juliano Floss
(60, 16, 6, 'House Vote', 64.12, 'Evicted'), -- Gabriela Saporito
(61, 17, 1, 'House Vote', 2.06, 'Saved'), -- Ana Paula Renault
(62, 17, 3, 'Twist Nominee', 26.14, 'Saved'), -- Juliano Floss
(63, 17, 5, 'Leader Choice', 71.80, 'Evicted'), -- Jordana Morais
(64, 18, 1, 'House Vote', 4.51, 'Saved'), -- Ana Paula Renault
(65, 18, 2, 'House Vote', 43.30, 'Saved'), -- Milena Moreira
(66, 18, 4, 'House Vote', 52.19, 'Evicted'), -- Leandro Rocha
(67, 19, 1, 'House Vote', 75.94, 'Winner'), -- Ana Paula Renault
(68, 19, 2, 'House Vote', 17.29, 'Runner-Up'), -- Milena Moreira
(69, 19, 3, 'House Vote', 6.77, 'Third Place'); -- Juliano Floss

-- Info for the next table:
-- nominee1: the nominee with the highest rejection percentage (evicted)
-- nominee2: the nominee with the middle rejection percentage
-- nominee3: the nominee with the lowest rejection percentage
-- Week 14, round 3 is excluded, because it's the finale round, therefore no elimination.
INSERT INTO "weekly_eliminations" ("id", "week_id", "round_number", "hoh_id", "immune_id", "nominee1_id", "nominee2_id", "nominee3_id")
VALUES
(1, 1, 1, 11, 12, 23, 2, 1),
(2, 2, 1, 14, 12, 22, 4, 20),
(3, 3, 1, 15, 19, 20, 4, 1),
(4, 4, 1, 12, 17, 19, 14, 18),
(5, 5, 1, 12, 9, 16, 8, 10),
(6, 6, 1, 12, 6, 15, 2, 9),
(7, 7, 1, 8, 12, 13, 11, 5),
(8, 8, 1, 11, 1, 14, 2, 9),
(9, 9, 1, 11, 8, 13, 1, 4),
(10, 10, 1, 11, 10, 12, 3, 6),
(11, 11, 1, 1, 10, 11, 4, 5),
(12, 11, 2, 1, NULL, 10, 5, 7),
(13, 12, 1, 8, 5, 9, 7, 3),
(14, 12, 2, 3, NULL, 8, 5, 7),
(15, 13, 1, 3, 2, 7, 4, 6),
(16, 13, 2, 5, NULL, 6, 3, 1),
(17, 14, 1, 4, NULL, 5, 3, 1),
(18, 14, 2, NULL, NULL, 4, 2, 1);

INSERT INTO "weekly_roles" ("id", "week_id", "round_number", "contestant_id", "role")
VALUES
(1, 1, 1, 9, 'Entered'), -- Chaiany Andrade
(2, 1, 1, 6, 'Entered'), -- Gabriela Saporito
(3, 1, 1, 4, 'Entered'), -- Leandro Rocha
(4, 1, 1, 22, 'Entered'), -- Matheus Moreira
(5, 1, 1, 16, 'Special Power Holder'), -- Marcelo Alves
(6, 1, 1, 12, 'Immune'), -- Jonas Sulzbach
(7, 1, 1, 19, 'Safe'), -- Sarah Andrade
(8, 1, 1, 24, 'Exited Early'), -- Pedro Espindola
(9, 1, 1, 25, 'Exited Early'), -- Henri Castelli
(10, 2, 1, 12, 'Immune'), -- Jonas Sulzbach
(11, 3, 1, 14, 'Special Power Holder'), -- Babu Santana
(12, 3, 1, 16, 'Special Power Holder'), -- Marcelo Alves
(13, 3, 1, 3, 'Special Power Holder'), -- Juliano Floss
(14, 3, 1, 19, 'Immune'), -- Sarah Andrade
(15, 3, 1, 18, 'Safe'), -- Sol Vega
(16, 3, 1, 21, 'Exited Early'), -- Paulo Carvalhaes
(17, 4, 1, 11, 'Immune'), -- Alberto Pimentel
(18, 4, 1, 17, 'Safe'), -- Edilson Capetinha
(19, 5, 1, 6, 'Immune'), -- Gabriela Saporito
(20, 5, 1, 9, 'Safe'), -- Chaiany Andrade
(21, 5, 1, 17, 'Exited Early'), -- Edilson Capetinha
(22, 5, 1, 18, 'Exited Early'), -- Sol Vega
(23, 6, 1, 6, 'Safe'), -- Gabriela Saporito
(24, 7, 1, 12, 'Safe'), -- Jonas Sulzbach
(25, 8, 1, 1, 'Safe'), -- Ana Paula Renault
(26, 9, 1, 8, 'Safe'), -- Samira Sagr
(27, 10, 1, 4, 'Immune'), -- Leandro Rocha
(28, 10, 1, 10, 'Safe'), -- Solange Couto
(29, 11, 1, 10, 'Immune'), -- Solange Couto
(30, 11, 2, 2, 'Special Power Holder'), -- Milena Moreira
(31, 12, 1, 5, 'Immune'), -- Jordana Morais
(32, 13, 1, 2, 'Immune'); -- Milena Moreira

INSERT INTO "season_twists" ("id", "week_id", "twist", "description")
VALUES
(1, 1, 'Big Phone', 'Marcelo: Immunity and instant nomination'),
(2, 3, 'Big Phone', 'Breno: Block one housemate from comps'),
(3, 3, 'Big Phone', 'Babu, Marcelo, Juliano: Collective nomination or self-nomination'),
(4, 6, 'Big Phone', 'Chaiany: Pick opponent for 1-on-1 nomination'),
(5, 11, 'Big Phone', 'Milena: Instant nomination'),
(6, 2, 'Surprise Boxes', 'Sarah: Block housemate from voting'),
(7, 2, 'Surprise Boxes', 'Jonas: Lost vote'),
(8, 2, 'Surprise Boxes', 'Ana Paula: Extra vote'),
(9, 2, 'Surprise Boxes', 'Alberto, Brigido: Collective nomination or self-nomination'),
(10, 5, 'Block Party', 'Leandro: Block housemate from voting'),
(11, 5, 'Block Party', 'Babu, Juliano: Immunize one housemate'),
(12, 5, 'Block Party', 'Samira: Swap Have/Have-Not status'),
(13, 5, 'Block Party', 'Alberto, Breno, Solange: Collective nomination or self-nomination'),
(14, 6, 'Power Machine', 'Alberto: Block housemate from Back-and-Forth comp'),
(15, 9, 'Power Machine', 'Jordana: Veto one RPS nominee'),
(16, 12, 'Reward', 'Jordana, Chaiany: Won 2026 Football tickets');

INSERT INTO "event_winners" ("id", "event_id", "contestant_id", "effect")
VALUES
(1, 1, 16, 'Immunity + instant nomination power'),
(2, 2, 13, 'Blocked one housemate from Week 3 competitions'),
(3, 3, 14, 'Collective nomination power'),
(4, 3, 16, 'Collective nomination power'),
(5, 3, 3, 'Collective nomination power'),
(6, 4, 9, 'Chose opponent for Nomination Competition'),
(7, 5, 2, 'Instant nomination power'),
(8, 6, 19, 'Blocked one housemate from nominating'),
(9, 7, 12, 'Lost vote in upcoming nomination'),
(10, 8, 1, 'Extra vote in upcoming nomination'),
(11, 9, 11, 'Collective nomination power'),
(12, 9, 20, 'Collective nomination power'),
(13, 10, 4, 'Blocked one housemate from nominating'),
(14, 11, 14, 'Immunized one housemate from eviction'),
(15, 11, 3, 'Immunized one housemate from eviction'),
(16, 12, 8, 'Swapped one Have and one Have-Not status'),
(17, 13, 11, 'Collective nomination power'),
(18, 13, 13, 'Collective nomination power'),
(19, 13, 10, 'Collective nomination power'),
(20, 14, 11, 'Blocked one housemate from Back-and-Forth competition'),
(21, 15, 5, 'Vetoed one Rock-Paper-Scissors nominee'),
(22, 16, 5, 'Won football championship tickets'),
(23, 16, 9, 'Won football championship tickets');

INSERT INTO "nominations" ("id", "week_id", "round_number", "nominator_id", "nominee_id")
VALUES
(1, 1, 1, 11, 2),
(2, 1, 1, 10, 21),
(3, 1, 1, 1, 21),
(4, 1, 1, 13, 21),
(5, 1, 1, 23, 21),
(6, 1, 1, 12, 21),
(7, 1, 1, 15, 21),
(8, 1, 1, 20, 18),
(9, 1, 1, 19, 21),
(10, 1, 1, 17, 18),
(11, 1, 1, 5, 17),
(12, 1, 1, 16, 21),
(13, 1, 1, 7, 3),
(14, 1, 1, 3, 18),
(15, 1, 1, 8, 21),
(16, 1, 1, 14, 18),
(17, 1, 1, 2, 21),
(18, 1, 1, 21, 18),
(19, 1, 1, 18, 3),
(20, 1, 1, 22, 15),
(21, 1, 1, 6, 21),
(22, 1, 1, 4, 12),
(23, 1, 1, 9, 20),
(24, 2, 1, 14, 22),
(25, 2, 1, 4, 20),
(26, 2, 1, 3, 20),
(27, 2, 1, 9, 20),
(28, 2, 1, 11, 9),
(29, 2, 1, 8, 6),
(30, 2, 1, 13, 20),
(31, 2, 1, 5, 18),
(32, 2, 1, 20, 9),
(33, 2, 1, 15, 6),
(34, 2, 1, 7, 6),
(35, 2, 1, 16, 20),
(36, 2, 1, 18, 9),
(37, 2, 1, 22, 1),
(38, 2, 1, 6, 3),
(39, 2, 1, 17, 18),
(40, 2, 1, 22, 20),
(41, 2, 1, 10, 2),
(42, 2, 1, 19, 9),
(43, 2, 1, 11, 4),
(44, 2, 1, 20, 4),
(45, 3, 1, 15, 1),
(46, 3, 1, 12, 4),
(47, 3, 1, 2, 20),
(48, 3, 1, 8, 4),
(49, 3, 1, 20, 4),
(50, 3, 1, 11, 4),
(51, 3, 1, 1, 20),
(52, 3, 1, 13, 20),
(53, 3, 1, 10, 6),
(54, 3, 1, 3, 20),
(55, 3, 1, 7, 4),
(56, 3, 1, 13, 20),
(57, 3, 1, 16, 20),
(58, 3, 1, 6, 4),
(59, 3, 1, 17, 4),
(60, 3, 1, 4, 20),
(61, 3, 1, 18, 4),
(62, 3, 1, 5, 4),
(63, 3, 1, 14, 20),
(64, 3, 1, 19, 4),
(65, 3, 1, 9, 20),
(66, 3, 1, 14, 12),
(67, 3, 1, 16, 12),
(68, 3, 1, 3, 12),
(69, 4, 1, 12, 14),
(70, 4, 1, 10, 18),
(71, 4, 1, 11, 10),
(72, 4, 1, 19, 10),
(73, 4, 1, 18, 10),
(74, 4, 1, 1, 18),
(75, 4, 1, 17, 10),
(76, 4, 1, 6, 10),
(77, 4, 1, 5, 10),
(78, 4, 1, 14, 18),
(79, 4, 1, 2, 18),
(80, 4, 1, 3, 18),
(81, 4, 1, 7, 10),
(82, 4, 1, 4, 18),
(83, 4, 1, 9, 18),
(84, 4, 1, 15, 10),
(85, 4, 1, 16, 18),
(86, 4, 1, 8, 18),
(87, 4, 1, 13, 18),
(88, 4, 1, 3, 8),
(89, 4, 1, 18, 8),
(90, 4, 1, 14, 19),
(91, 5, 1, 1, 5),
(92, 5, 1, 2, 5),
(93, 5, 1, 3, 5),
(94, 5, 1, 4, 5),
(95, 5, 1, 5, 8),
(96, 5, 1, 6, 14),
(97, 5, 1, 7, 8),
(98, 5, 1, 9, 5),
(99, 5, 1, 10, 5),
(100, 5, 1, 12, 16),
(101, 5, 1, 13, 5),
(102, 5, 1, 14, 5),
(103, 5, 1, 15, 8),
(104, 5, 1, 16, 5),
(105, 5, 1, 17, 10),
(106, 5, 1, 18, 4),
(107, 5, 1, 19, 10),
(108, 6, 1, 1, 11),
(109, 6, 1, 2, 11),
(110, 6, 1, 3, 11),
(111, 6, 1, 4, 11),
(112, 6, 1, 5, 3),
(113, 6, 1, 6, 3),
(114, 6, 1, 7, 3),
(115, 6, 1, 8, 11),
(116, 6, 1, 9, 7),
(117, 6, 1, 10, 11),
(118, 6, 1, 12, 2),
(119, 6, 1, 13, 7),
(120, 6, 1, 14, 7),
(121, 6, 1, 15, 8),
(122, 6, 1, 16, 5),
(123, 7, 1, 1, 14),
(124, 7, 1, 2, 14),
(125, 7, 1, 3, 7),
(126, 7, 1, 4, 7),
(127, 7, 1, 6, 3),
(128, 7, 1, 7, 13),
(129, 7, 1, 8, 7),
(130, 7, 1, 9, 7),
(131, 7, 1, 10, 5),
(132, 7, 1, 11, 7),
(133, 7, 1, 14, 7),
(134, 7, 1, 15, 3),
(135, 7, 1, 16, 5),
(136, 11, 1, 1, 11),
(137, 11, 1, 2, 5),
(138, 11, 1, 3, 5),
(139, 11, 1, 4, 5),
(140, 11, 1, 5, 3),
(141, 11, 1, 6, 5),
(142, 11, 1, 7, 5),
(143, 11, 1, 8, 5),
(144, 11, 1, 9, 5),
(145, 11, 1, 10, 12),
(146, 11, 2, 1, 10),
(147, 11, 2, 2, 7),
(148, 11, 2, 3, 5),
(149, 11, 2, 4, 5),
(150, 11, 2, 5, 3),
(151, 11, 2, 6, 5),
(152, 11, 2, 7, 5),
(153, 11, 2, 8, 5),
(154, 12, 2, 1, 7),
(155, 12, 2, 2, 7),
(156, 12, 2, 3, 6),
(157, 12, 2, 5, 8),
(158, 12, 2, 6, 8),
(159, 12, 2, 7, 9),
(160, 12, 2, 8, 7),
(161, 13, 1, 1, 7),
(162, 13, 1, 2, 7),
(163, 13, 1, 3, 6),
(164, 13, 1, 4, 7),
(165, 13, 1, 5, 4),
(166, 13, 1, 6, 7),
(167, 13, 1, 7, 4),
(168, 13, 2, 1, 6),
(169, 13, 2, 2, 6),
(170, 13, 2, 3, 6),
(171, 13, 2, 4, 3),
(172, 13, 2, 5, 6),
(173, 13, 2, 6, 3),
(174, 14, 1, 1, 2),
(175, 14, 1, 2, 3),
(176, 14, 1, 3, 1),
(177, 14, 1, 4, 5),
(178, 14, 1, 5, 1),
(179, 8, 1, 1, 7),
(180, 8, 1, 2, 5),
(181, 8, 1, 3, 7),
(182, 8, 1, 4, 7),
(183, 8, 1, 5, 13),
(184, 8, 1, 6, 13),
(185, 8, 1, 7, 3),
(186, 8, 1, 8, 7),
(187, 8, 1, 9, 5),
(188, 8, 1, 10, 5),
(189, 8, 1, 11, 2),
(190, 8, 1, 12, 2),
(191, 8, 1, 13, 5),
(192, 8, 1, 14, 5),
(193, 9, 1, 1, 12),
(194, 9, 1, 1, 10),
(195, 9, 1, 2, 12),
(196, 9, 1, 2, 7),
(197, 9, 1, 3, 12),
(198, 9, 1, 3, 7),
(199, 9, 1, 4, 1),
(200, 9, 1, 4, 6),
(201, 9, 1, 5, 4),
(202, 9, 1, 5, 10),
(203, 9, 1, 6, 4),
(204, 9, 1, 6, 10),
(205, 9, 1, 7, 4),
(206, 9, 1, 7, 10),
(207, 9, 1, 8, 12),
(208, 9, 1, 8, 10),
(209, 9, 1, 9, 1),
(210, 9, 1, 9, 5),
(211, 9, 1, 10, 1),
(212, 9, 1, 10, 6),
(213, 9, 1, 11, 13),
(214, 9, 1, 12, 4),
(215, 9, 1, 12, 10),
(216, 9, 1, 13, 1),
(217, 9, 1, 13, 7),
(218, 10, 1, 1, 12),
(219, 10, 1, 2, 12),
(220, 10, 1, 3, 12),
(221, 10, 1, 4, 12),
(222, 10, 1, 5, 4),
(223, 10, 1, 6, 12),
(224, 10, 1, 7, 4),
(225, 10, 1, 8, 12),
(226, 10, 1, 9, 12),
(227, 10, 1, 10, 12),
(228, 10, 1, 11, 3),
(229, 10, 1, 13, 3),
(230, 10, 1, 14, 4),
(231, 12, 1, 1, 9),
(232, 12, 1, 2, 9),
(233, 12, 1, 3, 6),
(234, 12, 1, 4, 6),
(235, 12, 1, 5, 3),
(236, 12, 1, 6, 3),
(237, 12, 1, 7, 3),
(238, 12, 1, 8, 7),
(239, 12, 1, 8, 9),
(240, 12, 1, 9, 5),
(241, 12, 1, 10, 2),
(242, 12, 1, 11, 4);

-- End of filling tables with data

-- 2. Queries
-- The purpose of the following queries is aimed towards answering curious statistical questions

-- Query #1: Top 5 contestants who survived eviction by the narrowest margins
SELECT "name", "week", "vote_percentage"
FROM "paredao_stats"
WHERE "outcome" = 'Saved' AND "vote_percentage" IS NOT NULL
ORDER BY "vote_percentage" DESC
LIMIT 5;

-- Query #2: What twists (and their effects) did Jordana win?
SELECT "name", "twist", "effect"
FROM "event_winners_visual"
WHERE "name" LIKE 'Jordana Morais';

-- Query #3: Top 10 most targeted housemates
SELECT "nominee_name", "nominations_count"
FROM "peer_nomination_votes_leaderboard"
LIMIT 10;

-- Query #4: Average placement for each group (Civilian, Veteran, Celebrity)
SELECT "group", ROUND(AVG("placement"), 2) AS "average_placement"
FROM "contestants"
GROUP BY "group"
ORDER BY "average_placement" ASC;

-- Query #5: Contestants who repeadetly targeted the same person
SELECT "nominator_name", "nominee_name", COUNT(*) AS "times_nominated"
FROM "nominations_visual"
GROUP BY "nominator_name", "nominee_name"
HAVING COUNT(*) > 1
ORDER BY "times_nominated" DESC;

-- Query #6: Which weeks were the most chaotic? (most individual house votes cast)
SELECT "week", COUNT(*) AS "total_votes"
FROM "nominations_visual"
GROUP BY "week"
ORDER BY "total_votes" DESC;

-- Query #7 What percentage of the total house votes did each contestant receive?
SELECT "nominee_name", COUNT(*) AS "votes_received",
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM "nominations"), 2) AS "percentage_of_all_votes"
FROM "nominations_visual"
GROUP BY "nominee_name"
ORDER BY "percentage_of_all_votes" DESC
LIMIT 10;

-- Query #8 Mutual nominations
-- Note: This query uses a trick I found while browsing the internet, and it's outside the scope of CS50 Sql
SELECT "nominator_name", "nominee_name"
FROM "nominations_visual"
WHERE ("nominator_name", "nominee_name") IN
(SELECT "nominator_name", "nominee_name" FROM "nominations_visual");

-- Query #9 Who never won a single competition
SELECT "name" FROM "contestants"
WHERE "name" NOT IN (SELECT "winner" FROM "competition_winners");
