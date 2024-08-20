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
-- Name: game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.game OWNER TO freecodecamp;

--
-- Name: game_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_user_id_seq OWNER TO freecodecamp;

--
-- Name: game_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_user_id_seq OWNED BY public.game.user_id;


--
-- Name: game user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game ALTER COLUMN user_id SET DEFAULT nextval('public.game_user_id_seq'::regclass);


--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game VALUES (22, 'user_1724121120718', 1, NULL);
INSERT INTO public.game VALUES (23, 'user_1724121120717', 1, NULL);
INSERT INTO public.game VALUES (24, 'user_1724121213234', 0, NULL);
INSERT INTO public.game VALUES (25, 'user_1724121213233', 0, NULL);
INSERT INTO public.game VALUES (27, 'user_1724121286220', 0, NULL);
INSERT INTO public.game VALUES (28, 'user_1724121286219', 0, NULL);
INSERT INTO public.game VALUES (29, 'teste', 1, 1);
INSERT INTO public.game VALUES (26, 'juscelino', 2, 1);
INSERT INTO public.game VALUES (31, 'user_1724121732384', 1, 136);
INSERT INTO public.game VALUES (30, 'user_1724121732385', 4, 94);
INSERT INTO public.game VALUES (33, 'user_1724121761358', 2, 154);
INSERT INTO public.game VALUES (32, 'user_1724121761360', 2, 231);


--
-- Name: game_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_user_id_seq', 33, true);


--
-- Name: game game_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--
