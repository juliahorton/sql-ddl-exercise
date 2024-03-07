DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league;

CREATE TABLE coaches (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT,
    location TEXT,
    coach_id INTEGER REFERENCES coaches(id),
    rank INTEGER UNIQUE
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams(id),
    first_name TEXT,
    last_name TEXT,
    jersey_number INTEGER
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    season_id INTEGER REFERENCES seasons(id),
    ref_id INTEGER REFERENCES referees(id),
    team_1 INTEGER REFERENCES teams(id),
    team_2 INTEGER REFERENCES teams(id),
    date DATE
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players(id),
    match_id INTEGER REFERENCES matches(id)
);

INSERT INTO coaches (first_name, last_name) VALUES
('Dakota','Johnson'),
('Benjamin','Romero'),
('Amanda','Jameson');

INSERT INTO teams (name, location, coach_id, rank) VALUES 
('Flaming Tornados','Wichita',1,3),
('Cheeto Puffs','Maryland',2,2),
('HelloFresh','Anchorage',3,1);

INSERT INTO players (team_id, first_name, last_name, jersey_number) VALUES
(1,'Chad','Flenderson',17),
(2,'Timothy','Doberman',41),
(3,'Megan','Thee Stallion',57);

INSERT INTO referees (first_name, last_name) VALUES 
('Benjamin','Moore'),
('Marie','Whittaker'),
('Chet','Foreman');

INSERT INTO seasons (start_date,end_date) VALUES
('1999-10-23','2000-03-14'),
('2000-10-18','2001-03-11');

INSERT INTO matches (season_id, ref_id, team_1, team_2, date) VALUES 
(1,1,1,3,'1999-11-06'),
(1,2,2,3,'1999-12-12'),
(2,2,2,1,'2000-02-10'),
(2,3,3,1,'2000-10-30');

INSERT INTO goals (player_id, match_id) VALUES 
(1,3),
(1,3),
(1,3),
(2,2),
(2,3),
(2,2),
(2,3),
(1,3),
(1,3),
(1,4),
(3,4),
(1,4),
(3,4);