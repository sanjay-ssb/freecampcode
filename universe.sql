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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    type character varying,
    diameter numeric,
    is_hazardous boolean NOT NULL,
    composition text,
    orbit_period integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    size integer NOT NULL,
    age integer,
    is_active boolean NOT NULL,
    num_stars integer
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
    name character varying NOT NULL,
    planet_id integer,
    type character varying,
    diameter numeric,
    is_inhabited boolean NOT NULL,
    temperature integer,
    atmosphere text
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
    name character varying NOT NULL,
    star_id integer,
    type character varying,
    radius numeric NOT NULL,
    is_habitable boolean NOT NULL,
    atmosphere text,
    moons_count integer
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
    name character varying NOT NULL,
    galaxy_id integer,
    type character varying,
    mass numeric,
    is_visible boolean NOT NULL,
    age integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 5, 'Dwarf Planet', 946, false, 'Water, Silicates', 1679);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 5, 'Asteroid', 525, false, 'Basalt, Olivine', 1325);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 5, 'Asteroid', 512, false, 'Carbonaceous, Nickel-iron', 1686);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 5, 'Asteroid', 431, false, 'Silicates, Nickel-iron', 2033);
INSERT INTO public.asteroid VALUES (5, 'Bennu', 5, 'Asteroid', 492, true, 'Carbonaceous', 436);
INSERT INTO public.asteroid VALUES (6, 'Ryugu', 5, 'Asteroid', 900, true, 'Carbonaceous', 475);
INSERT INTO public.asteroid VALUES (7, 'Itokawa', 5, 'Asteroid', 535, false, 'Basaltic', 546);
INSERT INTO public.asteroid VALUES (8, 'Apophis', 5, 'Asteroid', 370, true, 'Silicates, Nickel-iron', 323);
INSERT INTO public.asteroid VALUES (9, 'Eros', 5, 'Asteroid', 16.8, false, 'Silicates, Nickel-iron', 642);
INSERT INTO public.asteroid VALUES (10, 'Mathilde', 5, 'Asteroid', 50, false, 'Carbonaceous', 4174);
INSERT INTO public.asteroid VALUES (11, 'Gaspra', 5, 'Asteroid', 10, false, 'Basaltic', 1190);
INSERT INTO public.asteroid VALUES (12, 'Ida', 5, 'Asteroid', 15, false, 'Carbonaceous', 1193);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 13000, true, 200);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, 14000, true, 250);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 150000, 16000, false, 180);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 80000, 11000, true, 180);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 90000, 12000, true, 150);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 95000, 12500, true, 170);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 'Terrestrial', 3474.8, false, -23, 'None');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'Irregular', 22.2, false, -4, 'None');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'Irregular', 12.4, false, -15, 'None');
INSERT INTO public.moon VALUES (4, 'Io', 4, 'Regular', 3643.2, false, -143, 'Sulfur dioxide');
INSERT INTO public.moon VALUES (5, 'Europa', 4, 'Regular', 3121.6, false, -160, 'Oxygen, Carbon dioxide');
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, 'Regular', 5262.4, false, -163, 'Oxygen, Carbon dioxide');
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 'Regular', 4800, false, -148, 'Oxygen, Carbon dioxide');
INSERT INTO public.moon VALUES (8, 'Titan', 5, 'Regular', 5150, false, -179, 'Nitrogen, Methane');
INSERT INTO public.moon VALUES (9, 'Rhea', 5, 'Regular', 1527.6, false, -202, 'Oxygen, Carbon dioxide');
INSERT INTO public.moon VALUES (10, 'Iapetus', 5, 'Regular', 1468.6, false, -143, 'Carbon dioxide, Oxygen');
INSERT INTO public.moon VALUES (11, 'Triton', 6, 'Regular', 2707.2, false, -235, 'Nitrogen');
INSERT INTO public.moon VALUES (12, 'Charon', 7, 'Regular', 1208, false, -220, 'Nitrogen, Methane');
INSERT INTO public.moon VALUES (13, 'Miranda', 7, 'Regular', 235.8, false, -187, 'Water, Carbon dioxide');
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 'Regular', 1157.8, false, -213, 'Nitrogen, Methane');
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 'Regular', 1169.4, false, -213, 'Nitrogen, Methane');
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 'Regular', 1522.8, false, -203, 'Nitrogen, Methane');
INSERT INTO public.moon VALUES (17, 'Titania', 7, 'Regular', 1577.8, false, -213, 'Nitrogen, Methane');
INSERT INTO public.moon VALUES (18, 'Proteus', 8, 'Regular', 440, false, -200, 'None');
INSERT INTO public.moon VALUES (19, 'Nereid', 8, 'Regular', 340, false, -220, 'None');
INSERT INTO public.moon VALUES (42, 'Charot', 9, 'Regular', 1208, false, -220, 'Nitrogen, Methane');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 6371, true, 'Nitrogen, Oxygen', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 3389.5, false, 'Carbon dioxide', 2);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'Terrestrial', 6051.8, false, 'Carbon dioxide, Nitrogen', 0);
INSERT INTO public.planet VALUES (4, 'Jupiter', 4, 'Gas Giant', 69911, false, 'Hydrogen, Helium', 79);
INSERT INTO public.planet VALUES (5, 'Saturn', 4, 'Gas Giant', 58232, false, 'Hydrogen, Helium', 82);
INSERT INTO public.planet VALUES (6, 'Neptune', 5, 'Ice Giant', 24622, false, 'Hydrogen, Helium', 14);
INSERT INTO public.planet VALUES (7, 'Uranus', 5, 'Ice Giant', 25362, false, 'Hydrogen, Helium', 27);
INSERT INTO public.planet VALUES (8, 'Mercury', 1, 'Terrestrial', 2439.7, false, 'Oxygen, Sodium', 0);
INSERT INTO public.planet VALUES (9, 'Pluto', 6, 'Dwarf Planet', 1188.3, false, 'Nitrogen, Methane', 5);
INSERT INTO public.planet VALUES (10, 'Eris', 6, 'Dwarf Planet', 1163, false, 'Nitrogen, Methane', 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 6, 'Dwarf Planet', 620, false, 'Nitrogen, Methane', 2);
INSERT INTO public.planet VALUES (12, 'Makemake', 6, 'Dwarf Planet', 715, false, 'Methane, Ethane', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 1989000000000000000000000000000, true, 45000000);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 'G-type', 2190000000000000000000000000000, true, 60000000);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 1, 'K-type', 1200000000000000000000000000000, true, 60000000);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 'A-type', 2063000000000000000000000000000, true, 2250000);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 2, 'M-type', 11600000000000000000000000000000, true, 80000);
INSERT INTO public.star VALUES (6, 'Antares', 2, 'M-type', 12400000000000000000000000000000, true, 120000);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 12, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 42, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_radius; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_radius UNIQUE (radius);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (mass);


--
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

