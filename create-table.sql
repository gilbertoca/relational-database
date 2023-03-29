--DROP TABLE games;
--DROP TABLE teams;

CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    name character varying(20) NOT NULL UNIQUE
);

CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    year integer NOT NULL,
    round character varying(20) NOT NULL,
    winner_id integer NOT NULL REFERENCES teams(team_id),
    opponent_id integer NOT NULL REFERENCES teams(team_id),
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);
