--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer DEFAULT 0 NOT NULL,
    opponent_goals integer DEFAULT 0 NOT NULL,
    game_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: game_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_game_id_seq OWNER TO freecodecamp;

--
-- Name: game_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.game_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (2018, 'Final', 50, 51, 4, 2, 1);
INSERT INTO public.games VALUES (2018, 'Third Place', 52, 53, 2, 0, 2);
INSERT INTO public.games VALUES (2018, 'Semi-Final', 51, 53, 2, 1, 3);
INSERT INTO public.games VALUES (2018, 'Semi-Final', 50, 52, 1, 0, 4);
INSERT INTO public.games VALUES (2018, 'Quarter-Final', 51, 54, 3, 2, 5);
INSERT INTO public.games VALUES (2018, 'Quarter-Final', 53, 55, 2, 0, 6);
INSERT INTO public.games VALUES (2018, 'Quarter-Final', 52, 56, 2, 1, 7);
INSERT INTO public.games VALUES (2018, 'Quarter-Final', 50, 57, 2, 0, 8);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 53, 58, 2, 1, 9);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 55, 59, 1, 0, 10);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 52, 60, 3, 2, 11);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 56, 61, 2, 0, 12);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 51, 62, 2, 1, 13);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 54, 63, 2, 1, 14);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 57, 64, 2, 1, 15);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 50, 65, 4, 3, 16);
INSERT INTO public.games VALUES (2014, 'Final', 66, 65, 1, 0, 17);
INSERT INTO public.games VALUES (2014, 'Third Place', 67, 56, 3, 0, 18);
INSERT INTO public.games VALUES (2014, 'Semi-Final', 65, 67, 1, 0, 19);
INSERT INTO public.games VALUES (2014, 'Semi-Final', 66, 56, 7, 1, 20);
INSERT INTO public.games VALUES (2014, 'Quarter-Final', 67, 68, 1, 0, 21);
INSERT INTO public.games VALUES (2014, 'Quarter-Final', 65, 52, 1, 0, 22);
INSERT INTO public.games VALUES (2014, 'Quarter-Final', 56, 58, 2, 1, 23);
INSERT INTO public.games VALUES (2014, 'Quarter-Final', 66, 50, 1, 0, 24);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 56, 69, 2, 1, 25);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 58, 57, 2, 0, 26);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 50, 70, 2, 0, 27);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 66, 71, 2, 1, 28);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 67, 61, 2, 1, 29);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 68, 72, 2, 1, 30);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 65, 59, 1, 0, 31);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 52, 73, 2, 1, 32);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (50, 'France');
INSERT INTO public.teams VALUES (51, 'Croatia');
INSERT INTO public.teams VALUES (52, 'Belgium');
INSERT INTO public.teams VALUES (53, 'England');
INSERT INTO public.teams VALUES (54, 'Russia');
INSERT INTO public.teams VALUES (55, 'Sweden');
INSERT INTO public.teams VALUES (56, 'Brazil');
INSERT INTO public.teams VALUES (57, 'Uruguay');
INSERT INTO public.teams VALUES (58, 'Colombia');
INSERT INTO public.teams VALUES (59, 'Switzerland');
INSERT INTO public.teams VALUES (60, 'Japan');
INSERT INTO public.teams VALUES (61, 'Mexico');
INSERT INTO public.teams VALUES (62, 'Denmark');
INSERT INTO public.teams VALUES (63, 'Spain');
INSERT INTO public.teams VALUES (64, 'Portugal');
INSERT INTO public.teams VALUES (65, 'Argentina');
INSERT INTO public.teams VALUES (66, 'Germany');
INSERT INTO public.teams VALUES (67, 'Netherlands');
INSERT INTO public.teams VALUES (68, 'Costa Rica');
INSERT INTO public.teams VALUES (69, 'Chile');
INSERT INTO public.teams VALUES (70, 'Nigeria');
INSERT INTO public.teams VALUES (71, 'Algeria');
INSERT INTO public.teams VALUES (72, 'Greece');
INSERT INTO public.teams VALUES (73, 'United States');


--
-- Name: game_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 73, true);


--
-- Name: games game_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT game_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games fk_opponent; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_opponent FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games fk_winner; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_winner FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

