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
    number_of_suns integer,
    number_of_planets_in_millions numeric(18,0),
    light_years_away integer
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
    planet_id integer,
    cycles_around_sun integer,
    stars_encountered integer
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
    dwarf_planet boolean NOT NULL,
    description text,
    star_id integer,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    planets_encountered integer,
    galaxy_id integer,
    impact_imminent boolean
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
-- Name: stars_x_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stars_x_planets (
    name character varying(30),
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    stars_x_planets_id integer NOT NULL
);


ALTER TABLE public.stars_x_planets OWNER TO freecodecamp;

--
-- Name: stars_x_planets_stars_x_planets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_x_planets_stars_x_planets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_x_planets_stars_x_planets_id_seq OWNER TO freecodecamp;

--
-- Name: stars_x_planets_stars_x_planets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_x_planets_stars_x_planets_id_seq OWNED BY public.stars_x_planets.stars_x_planets_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: stars_x_planets stars_x_planets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stars_x_planets ALTER COLUMN stars_x_planets_id SET DEFAULT nextval('public.stars_x_planets_stars_x_planets_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 1, 873, 60);
INSERT INTO public.galaxy VALUES (2, 'Butterfly', 2, 478, 500);
INSERT INTO public.galaxy VALUES (3, 'Cigar', 1, 439, 100);
INSERT INTO public.galaxy VALUES (4, 'Hoags', 1, 211, 200);
INSERT INTO public.galaxy VALUES (5, 'Mayalls', 1, 343, 300);
INSERT INTO public.galaxy VALUES (6, 'Needle', 1, 140, 600);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Deimos', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Aitne', 3, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Arche', 4, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Aoede', 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Autonoe', 6, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Cliene', 7, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Elara', 8, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Erinome', 9, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Euathe', 10, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Helike', 11, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Hermippe', 12, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Locaste', 11, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Kore', 10, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Orthosie', 10, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Pasiphae', 10, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Sinope', 5, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Sponde', 5, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Thebe', 2, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Thyone', 2, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'PSR B1620', false, NULL, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Epsilon Eiridani', false, NULL, 2, NULL);
INSERT INTO public.planet VALUES (3, '91 Aquarii b', false, NULL, 3, NULL);
INSERT INTO public.planet VALUES (4, '55 Cancri', false, NULL, 4, NULL);
INSERT INTO public.planet VALUES (5, 'HD 209458 b', false, NULL, 5, NULL);
INSERT INTO public.planet VALUES (6, 'Gliese 876 b', false, NULL, 6, NULL);
INSERT INTO public.planet VALUES (7, 'V391 Pegasi b', false, NULL, 6, NULL);
INSERT INTO public.planet VALUES (8, 'Arae c', false, NULL, 5, NULL);
INSERT INTO public.planet VALUES (9, 'Gliese 436 b', true, NULL, 4, NULL);
INSERT INTO public.planet VALUES (10, 'Corot-7b', false, NULL, 3, NULL);
INSERT INTO public.planet VALUES (11, 'Fomalhaut b', true, NULL, 2, NULL);
INSERT INTO public.planet VALUES (12, 'Gj 758', true, NULL, 1, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 8, 1, false);
INSERT INTO public.star VALUES (2, 'Canopus', 4, 2, false);
INSERT INTO public.star VALUES (3, 'Arcturus', 83, 3, false);
INSERT INTO public.star VALUES (4, 'Vega', 48, 4, false);
INSERT INTO public.star VALUES (5, 'Procyon', 487, 5, false);
INSERT INTO public.star VALUES (6, 'Spica', 2107, 6, false);


--
-- Data for Name: stars_x_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stars_x_planets VALUES (NULL, 1, 1, 1);
INSERT INTO public.stars_x_planets VALUES (NULL, 1, 12, 2);
INSERT INTO public.stars_x_planets VALUES (NULL, 2, 2, 3);
INSERT INTO public.stars_x_planets VALUES (NULL, 2, 11, 4);
INSERT INTO public.stars_x_planets VALUES (NULL, 3, 3, 5);
INSERT INTO public.stars_x_planets VALUES (NULL, 3, 10, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: stars_x_planets_stars_x_planets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_x_planets_stars_x_planets_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: stars_x_planets stars_x_planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stars_x_planets
    ADD CONSTRAINT stars_x_planets_name_key UNIQUE (name);


--
-- Name: stars_x_planets stars_x_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stars_x_planets
    ADD CONSTRAINT stars_x_planets_pkey PRIMARY KEY (stars_x_planets_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

