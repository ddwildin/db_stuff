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
    diameter_lightyears numeric(2,2),
    distance_lightyears numeric(2,2) NOT NULL,
    type character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_key_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_key_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_key_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: life; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.life (
    life_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.life OWNER TO freecodecamp;

--
-- Name: life_life_key_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.life_life_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_life_key_seq OWNER TO freecodecamp;

--
-- Name: life_life_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.life_life_key_seq OWNED BY public.life.life_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    planet_id integer NOT NULL,
    diameter_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_key_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_key_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_key_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    interesting_fact text,
    gravity numeric(2,1),
    habitable boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_key_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_key_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_key_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_km integer,
    galaxy_id integer NOT NULL,
    type character varying(20)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_key_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_key_seq OWNER TO freecodecamp;

--
-- Name: star_star_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_key_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_key_seq'::regclass);


--
-- Name: life life_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life ALTER COLUMN life_id SET DEFAULT nextval('public.life_life_key_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_key_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_key_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_key_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.00, 0.00, 'Barred Spiral Galaxy');
INSERT INTO public.galaxy VALUES (2, 'Canis Mayor', 0.20, 0.30, 'LMR');
INSERT INTO public.galaxy VALUES (3, 'Ursus Minor', 0.10, 0.30, 'FMR');
INSERT INTO public.galaxy VALUES (4, 'Partus Falar', 0.50, 0.20, 'FFF');
INSERT INTO public.galaxy VALUES (5, 'Andromeda', 0.50, 0.50, 'FOR');
INSERT INTO public.galaxy VALUES (6, 'Marcanus', 0.50, 0.70, 'RRR');


--
-- Data for Name: life; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.life VALUES (1, 'humans', 3);
INSERT INTO public.life VALUES (2, 'martians', 4);
INSERT INTO public.life VALUES (3, 'kddk', 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'dlsdlk', true, 3, 333);
INSERT INTO public.moon VALUES (2, 'ldslkds', false, 1, 3333);
INSERT INTO public.moon VALUES (3, 'lkdldskl', true, 2, 333);
INSERT INTO public.moon VALUES (4, 'kdkdkdkdk', true, 4, 323);
INSERT INTO public.moon VALUES (5, 'dl34sdlk', true, 3, 333);
INSERT INTO public.moon VALUES (6, 'lds4lkds', false, 1, 3333);
INSERT INTO public.moon VALUES (7, '3lkdldskl', true, 2, 333);
INSERT INTO public.moon VALUES (8, 'kdkdddkdkdk', true, 4, 323);
INSERT INTO public.moon VALUES (9, 'dl34s44dlk', true, 3, 333);
INSERT INTO public.moon VALUES (10, '444lds4lkds', false, 1, 3333);
INSERT INTO public.moon VALUES (11, '3lk33dldskl', true, 2, 333);
INSERT INTO public.moon VALUES (12, 'kdkdddkdk11dk', true, 4, 323);
INSERT INTO public.moon VALUES (13, 'dl34s44dalk', true, 3, 333);
INSERT INTO public.moon VALUES (14, '444ldsa4lkds', false, 1, 3333);
INSERT INTO public.moon VALUES (15, '3lk33dldskfl', true, 2, 333);
INSERT INTO public.moon VALUES (16, 'kdkdddkdk1a1dk', true, 4, 323);
INSERT INTO public.moon VALUES (17, 'dl3alk', true, 3, 333);
INSERT INTO public.moon VALUES (18, '444ldss', false, 1, 3333);
INSERT INTO public.moon VALUES (19, '3lkkfl', true, 2, 333);
INSERT INTO public.moon VALUES (20, 'kdkdddkdkd', true, 4, 323);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'kddk', 'lkdakladsladkls', 0.5, false, 2);
INSERT INTO public.planet VALUES (2, 'lslsls', 'adfsklafdsjkadsflk', 0.7, false, 1);
INSERT INTO public.planet VALUES (3, 'kdslkdslk', 'kladfskl adslk flaksdk adfs', 0.6, false, 3);
INSERT INTO public.planet VALUES (4, 'kdkdk', 'klfds sldkdslk dslkdsl', 0.5, true, 4);
INSERT INTO public.planet VALUES (5, '22kddk', 'lkdakladsladkls', 0.5, false, 2);
INSERT INTO public.planet VALUES (6, 'ls22lsls', 'adfsklafdsjkadsflk', 0.7, false, 1);
INSERT INTO public.planet VALUES (7, 'kdslkdsl2k', 'kladfskl adslk flaksdk adfs', 0.6, false, 3);
INSERT INTO public.planet VALUES (8, 'kdkd3k', 'klfds sldkdslk dslkdsl', 0.5, true, 4);
INSERT INTO public.planet VALUES (9, '22kd1dk', 'lkdakladsladkls', 0.5, false, 2);
INSERT INTO public.planet VALUES (10, 'ls212lsls', 'adfsklafdsjkadsflk', 0.7, false, 1);
INSERT INTO public.planet VALUES (11, 'kdslkd1sl2k', 'kladfskl adslk flaksdk adfs', 0.6, false, 3);
INSERT INTO public.planet VALUES (12, 'kdkd31k', 'klfds sldkdslk dslkdsl', 0.5, true, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'r4d', 3333, 2, 'ram');
INSERT INTO public.star VALUES (2, 'r5kdk', 342, 4, 'kdkd');
INSERT INTO public.star VALUES (3, 'sala', 3424, 4, 'kdk');
INSERT INTO public.star VALUES (4, 'dk5', 323, 3, 'dkd');
INSERT INTO public.star VALUES (5, 'dkkd', 3242, 1, 'dkdk');
INSERT INTO public.star VALUES (6, 'k3k', 2222, 4, 'kdk');


--
-- Name: galaxy_galaxy_key_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_key_seq', 6, true);


--
-- Name: life_life_key_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.life_life_key_seq', 3, true);


--
-- Name: moon_moon_key_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_key_seq', 20, true);


--
-- Name: planet_planet_key_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_key_seq', 12, true);


--
-- Name: star_star_key_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_key_seq', 6, true);


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
-- Name: life life_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_name_key UNIQUE (name);


--
-- Name: life life_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_pkey PRIMARY KEY (life_id);


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
-- Name: life life_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
