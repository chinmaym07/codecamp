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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
    user_id integer NOT NULL,
    number_of_guesses integer NOT NULL,
    game_id integer NOT NULL,
    secret_number integer DEFAULT 0 NOT NULL
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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_user_id_seq OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_user_id_seq OWNED BY public.players.user_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN user_id SET DEFAULT nextval('public.players_user_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (4, 594, 12, 593);
INSERT INTO public.games VALUES (4, 414, 13, 413);
INSERT INTO public.games VALUES (5, 904, 14, 903);
INSERT INTO public.games VALUES (5, 924, 15, 923);
INSERT INTO public.games VALUES (4, 511, 16, 508);
INSERT INTO public.games VALUES (4, 183, 17, 181);
INSERT INTO public.games VALUES (4, 686, 18, 685);
INSERT INTO public.games VALUES (3, 8, 19, 158);
INSERT INTO public.games VALUES (7, 659, 20, 658);
INSERT INTO public.games VALUES (7, 499, 21, 498);
INSERT INTO public.games VALUES (8, 952, 22, 951);
INSERT INTO public.games VALUES (8, 623, 23, 622);
INSERT INTO public.games VALUES (7, 441, 24, 438);
INSERT INTO public.games VALUES (7, 335, 25, 333);
INSERT INTO public.games VALUES (7, 213, 26, 212);
INSERT INTO public.games VALUES (9, 267, 27, 266);
INSERT INTO public.games VALUES (9, 83, 28, 82);
INSERT INTO public.games VALUES (10, 449, 29, 448);
INSERT INTO public.games VALUES (10, 705, 30, 704);
INSERT INTO public.games VALUES (9, 381, 31, 378);
INSERT INTO public.games VALUES (9, 750, 32, 748);
INSERT INTO public.games VALUES (9, 953, 33, 952);
INSERT INTO public.games VALUES (11, 144, 34, 143);
INSERT INTO public.games VALUES (11, 229, 35, 228);
INSERT INTO public.games VALUES (12, 113, 36, 112);
INSERT INTO public.games VALUES (12, 86, 37, 85);
INSERT INTO public.games VALUES (11, 900, 38, 897);
INSERT INTO public.games VALUES (11, 115, 39, 113);
INSERT INTO public.games VALUES (11, 656, 40, 655);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'user_1692474934262');
INSERT INTO public.players VALUES (2, 'user_1692474934261');
INSERT INTO public.players VALUES (3, 'chin');
INSERT INTO public.players VALUES (4, 'user_1692475580263');
INSERT INTO public.players VALUES (5, 'user_1692475580262');
INSERT INTO public.players VALUES (6, 'chin1');
INSERT INTO public.players VALUES (7, 'user_1692475642755');
INSERT INTO public.players VALUES (8, 'user_1692475642754');
INSERT INTO public.players VALUES (9, 'user_1692475722896');
INSERT INTO public.players VALUES (10, 'user_1692475722895');
INSERT INTO public.players VALUES (11, 'user_1692475821260');
INSERT INTO public.players VALUES (12, 'user_1692475821259');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 40, true);


--
-- Name: players_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_user_id_seq', 12, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 15, true);


--
-- Name: players unq_ply; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT unq_ply UNIQUE (user_id);


--
-- Name: users unq_userid; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unq_userid UNIQUE (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.players(user_id);


--
-- PostgreSQL database dump complete
--

