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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km numeric(9,3),
    amount integer,
    year integer,
    revolution boolean NOT NULL,
    xist boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km numeric(9,3),
    amount integer,
    year integer,
    revolution boolean NOT NULL,
    xist boolean,
    planet_id integer,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km numeric(9,3),
    amount integer,
    year integer,
    revolution boolean NOT NULL,
    xist boolean,
    star_id integer,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon (
    id integer NOT NULL,
    planet_moon_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.planet_moon OWNER TO freecodecamp;

--
-- Name: planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moon_id_seq OWNED BY public.planet_moon.id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km numeric(9,3),
    amount integer,
    year integer,
    revolution boolean NOT NULL,
    xist boolean,
    galaxy_id integer,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_moon id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon ALTER COLUMN id SET DEFAULT nextval('public.planet_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy1', 1.100, 1, 2000, true, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'galaxy1', 1.100, 1, 2000, true, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'galaxy1', 1.100, 1, 2000, true, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'galaxy1', 1.100, 1, 2000, true, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'galaxy1', 1.100, 1, 2000, true, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'galaxy1', 1.100, 1, 2000, true, true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'moon1', 1.100, 1, 2000, true, true, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet1', 1.100, 1, 2000, true, true, 1, NULL);
INSERT INTO public.planet VALUES (2, 'planet1', 1.100, 1, 2000, true, true, 2, NULL);
INSERT INTO public.planet VALUES (3, 'planet1', 1.100, 1, 2000, true, true, 3, NULL);
INSERT INTO public.planet VALUES (4, 'planet1', 1.100, 1, 2000, true, true, 4, NULL);
INSERT INTO public.planet VALUES (5, 'planet1', 1.100, 1, 2000, true, true, 5, NULL);
INSERT INTO public.planet VALUES (6, 'planet1', 1.100, 1, 2000, true, true, 6, NULL);
INSERT INTO public.planet VALUES (7, 'planet1', 1.100, 1, 2000, true, true, 7, NULL);
INSERT INTO public.planet VALUES (8, 'planet1', 1.100, 1, 2000, true, true, 8, NULL);
INSERT INTO public.planet VALUES (9, 'planet1', 1.100, 1, 2000, true, true, 9, NULL);
INSERT INTO public.planet VALUES (10, 'planet1', 1.100, 1, 2000, true, true, 10, NULL);
INSERT INTO public.planet VALUES (11, 'planet1', 1.100, 1, 2000, true, true, 11, NULL);
INSERT INTO public.planet VALUES (12, 'planet1', 1.100, 1, 2000, true, true, 12, NULL);


--
-- Data for Name: planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon VALUES (1, 1, 1, 'z');
INSERT INTO public.planet_moon VALUES (2, 2, 3, 'z');
INSERT INTO public.planet_moon VALUES (3, 3, 4, 'z');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star1', 1.100, 1, 2000, true, true, 1, NULL);
INSERT INTO public.star VALUES (2, 'star1', 1.100, 1, 2000, true, true, 2, NULL);
INSERT INTO public.star VALUES (3, 'star1', 1.100, 1, 2000, true, true, 3, NULL);
INSERT INTO public.star VALUES (4, 'star1', 1.100, 1, 2000, true, true, 4, NULL);
INSERT INTO public.star VALUES (5, 'star1', 1.100, 1, 2000, true, true, 5, NULL);
INSERT INTO public.star VALUES (6, 'star1', 1.100, 1, 2000, true, true, 6, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moon_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_moon planet_id_primary; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_id_primary PRIMARY KEY (planet_moon_id);


--
-- Name: planet_moon planet_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_id_key UNIQUE (id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy uniq_col; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uniq_col UNIQUE (galaxy_id);


--
-- Name: moon uniq_col_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uniq_col_moon UNIQUE (moon_id);


--
-- Name: planet uniq_col_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uniq_col_planet UNIQUE (planet_id);


--
-- Name: star uniq_col_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uniq_col_star UNIQUE (star_id);


--
-- Name: moon moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

