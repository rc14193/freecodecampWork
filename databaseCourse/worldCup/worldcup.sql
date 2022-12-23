--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
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

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2018, 'Final', 120, 121, 4, 2);
INSERT INTO public.games VALUES (2, 2018, 'Third Place', 122, 123, 2, 0);
INSERT INTO public.games VALUES (3, 2018, 'Semi-Final', 121, 123, 2, 1);
INSERT INTO public.games VALUES (4, 2018, 'Semi-Final', 120, 122, 1, 0);
INSERT INTO public.games VALUES (5, 2018, 'Quarter-Final', 121, 124, 3, 2);
INSERT INTO public.games VALUES (6, 2018, 'Quarter-Final', 123, 125, 2, 0);
INSERT INTO public.games VALUES (7, 2018, 'Quarter-Final', 122, 126, 2, 1);
INSERT INTO public.games VALUES (8, 2018, 'Quarter-Final', 120, 127, 2, 0);
INSERT INTO public.games VALUES (9, 2018, 'Eighth-Final', 123, 128, 2, 1);
INSERT INTO public.games VALUES (10, 2018, 'Eighth-Final', 125, 129, 1, 0);
INSERT INTO public.games VALUES (11, 2018, 'Eighth-Final', 122, 130, 3, 2);
INSERT INTO public.games VALUES (12, 2018, 'Eighth-Final', 126, 131, 2, 0);
INSERT INTO public.games VALUES (13, 2018, 'Eighth-Final', 121, 132, 2, 1);
INSERT INTO public.games VALUES (14, 2018, 'Eighth-Final', 124, 133, 2, 1);
INSERT INTO public.games VALUES (15, 2018, 'Eighth-Final', 127, 134, 2, 1);
INSERT INTO public.games VALUES (16, 2018, 'Eighth-Final', 120, 135, 4, 3);
INSERT INTO public.games VALUES (17, 2014, 'Final', 136, 135, 1, 0);
INSERT INTO public.games VALUES (18, 2014, 'Third Place', 137, 126, 3, 0);
INSERT INTO public.games VALUES (19, 2014, 'Semi-Final', 135, 137, 1, 0);
INSERT INTO public.games VALUES (20, 2014, 'Semi-Final', 136, 126, 7, 1);
INSERT INTO public.games VALUES (21, 2014, 'Quarter-Final', 137, 138, 1, 0);
INSERT INTO public.games VALUES (22, 2014, 'Quarter-Final', 135, 122, 1, 0);
INSERT INTO public.games VALUES (23, 2014, 'Quarter-Final', 126, 128, 2, 1);
INSERT INTO public.games VALUES (24, 2014, 'Quarter-Final', 136, 120, 1, 0);
INSERT INTO public.games VALUES (25, 2014, 'Eighth-Final', 126, 139, 2, 1);
INSERT INTO public.games VALUES (26, 2014, 'Eighth-Final', 128, 127, 2, 0);
INSERT INTO public.games VALUES (27, 2014, 'Eighth-Final', 120, 140, 2, 0);
INSERT INTO public.games VALUES (28, 2014, 'Eighth-Final', 136, 141, 2, 1);
INSERT INTO public.games VALUES (29, 2014, 'Eighth-Final', 137, 131, 2, 1);
INSERT INTO public.games VALUES (30, 2014, 'Eighth-Final', 138, 142, 2, 1);
INSERT INTO public.games VALUES (31, 2014, 'Eighth-Final', 135, 129, 1, 0);
INSERT INTO public.games VALUES (32, 2014, 'Eighth-Final', 122, 143, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (120, 'France');
INSERT INTO public.teams VALUES (121, 'Croatia');
INSERT INTO public.teams VALUES (122, 'Belgium');
INSERT INTO public.teams VALUES (123, 'England');
INSERT INTO public.teams VALUES (124, 'Russia');
INSERT INTO public.teams VALUES (125, 'Sweden');
INSERT INTO public.teams VALUES (126, 'Brazil');
INSERT INTO public.teams VALUES (127, 'Uruguay');
INSERT INTO public.teams VALUES (128, 'Colombia');
INSERT INTO public.teams VALUES (129, 'Switzerland');
INSERT INTO public.teams VALUES (130, 'Japan');
INSERT INTO public.teams VALUES (131, 'Mexico');
INSERT INTO public.teams VALUES (132, 'Denmark');
INSERT INTO public.teams VALUES (133, 'Spain');
INSERT INTO public.teams VALUES (134, 'Portugal');
INSERT INTO public.teams VALUES (135, 'Argentina');
INSERT INTO public.teams VALUES (136, 'Germany');
INSERT INTO public.teams VALUES (137, 'Netherlands');
INSERT INTO public.teams VALUES (138, 'Costa Rica');
INSERT INTO public.teams VALUES (139, 'Chile');
INSERT INTO public.teams VALUES (140, 'Nigeria');
INSERT INTO public.teams VALUES (141, 'Algeria');
INSERT INTO public.teams VALUES (142, 'Greece');
INSERT INTO public.teams VALUES (143, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 143, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


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
-- Name: games opponent_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT opponent_id FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games winner_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT winner_id FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

 
