--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    orbital_period_years numeric(8,1) NOT NULL,
    is_periodic boolean NOT NULL,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_type character varying(40) NOT NULL,
    distance_from_earth numeric(10,3),
    age_in_millions_of_years integer,
    has_life boolean DEFAULT false NOT NULL,
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
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km integer,
    is_spherical boolean NOT NULL,
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
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(40),
    number_of_moons integer,
    distance_from_star numeric(10,4),
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL
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
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(20),
    age_in_millions_of_years integer,
    mass_in_solar_masses numeric(8,3),
    is_spherical boolean DEFAULT true NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 76.0, true, 'Volta a cada ~76 anos; próxima passagem em 2061.');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2533.0, true, 'Grande cometa de 1997, visível a olho nu por meses.');
INSERT INTO public.comet VALUES (3, 'Encke', 3.3, true, 'Período orbital mais curto entre os cometas conhecidos.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral', 0.000, 13600, true, 'Nossa galáxia natal.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2.537, 10000, false, 'Galáxia grande mais próxima; deve colidir com a Via Láctea.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2.730, 10000, false, 'Terceira maior do Grupo Local.');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 0.163, 13000, false, 'Satélite da Via Láctea visível no hemisfério sul.');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Dwarf irregular', 0.200, 13000, false, 'Galáxia anã companheira da Grande Nuvem.');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 53.500, 13000, false, 'Abriga o primeiro buraco negro fotografado.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, true, 'Único satélite natural da Terra.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, false, 'A maior e mais próxima lua de Marte.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, false, 'Pequena lua externa de Marte.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, true, 'Corpo vulcanicamente mais ativo do Sistema Solar.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, true, 'Possível oceano sob a crosta de gelo.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, true, 'Maior lua do Sistema Solar.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, true, 'Superfície extremamente craterada.');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 167, false, 'Lua irregular e avermelhada de Júpiter.');
INSERT INTO public.moon VALUES (9, 'Titan', 6, 5150, true, 'Tem atmosfera densa e lagos de metano.');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 504, true, 'Lança jatos de água pelo polo sul.');
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 396, true, 'Conhecida pela enorme cratera Herschel.');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 1528, true, 'Segunda maior lua de Saturno.');
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, 1469, true, 'Um hemisfério claro e outro escuro.');
INSERT INTO public.moon VALUES (14, 'Dione', 6, 1123, true, 'Lua gelada com falésias brilhantes.');
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 472, true, 'Relevo caótico com cânions enormes.');
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 1158, true, 'Superfície relativamente jovem.');
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 1169, true, 'A mais escura das grandes luas de Urano.');
INSERT INTO public.moon VALUES (18, 'Titania', 7, 1577, true, 'Maior lua de Urano.');
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 1523, true, 'Lua mais externa entre as grandes de Urano.');
INSERT INTO public.moon VALUES (20, 'Triton', 8, 2707, true, 'Órbita retrógrada; provável objeto capturado.');
INSERT INTO public.moon VALUES (21, 'Nereid', 8, 357, false, 'Órbita muito excêntrica.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 0, 0.3900, false, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 0, 0.7200, false, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 1, 1.0000, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 2, 1.5200, false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas giant', 95, 5.2000, false, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas giant', 146, 9.5400, false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant', 28, 19.1900, false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice giant', 16, 30.0700, false, true);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 'Terrestrial', 0, 0.0485, false, true);
INSERT INTO public.planet VALUES (10, 'Proxima d', 2, 'Terrestrial', 0, 0.0290, false, true);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 3, 'Terrestrial', 0, 0.0290, false, true);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1f', 3, 'Terrestrial', 0, 0.0380, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 4600, 1.000, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'M5.5Ve', 4850, 0.122, true);
INSERT INTO public.star VALUES (3, 'TRAPPIST-1', 1, 'M8V', 7600, 0.089, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'M1-2Ia', 10, 16.500, false);
INSERT INTO public.star VALUES (5, 'R136a1', 4, 'WN5h', 1, 196.000, true);
INSERT INTO public.star VALUES (6, 'AE Andromedae', 2, 'LBV', 5, 60.000, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

