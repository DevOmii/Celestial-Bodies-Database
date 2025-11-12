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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    galaxy_type character varying(30) NOT NULL,
    age_in_billions_of_years numeric
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
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_tidally_locked boolean NOT NULL,
    diameter_km integer,
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
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    orbital_period_days integer,
    distance_from_star_au numeric
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    mass_solar_units integer NOT NULL,
    is_spherical boolean,
    temperature_in_kelvin integer
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 'Nuestra galaxia hogar.', 'Espiral barrada', 13.6);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Galaxia espiral masiva vecina.', 'Espiral', 10.0);
INSERT INTO public.galaxy VALUES (3, 'Triangulo', 'Tercer miembro más grande del Grupo Local.', 'Espiral', 12.0);
INSERT INTO public.galaxy VALUES (4, 'Cigarro', 'Famosa galaxia de explosión estelar.', 'Irregular', 13.0);
INSERT INTO public.galaxy VALUES (5, 'Remolino', 'Galaxia espiral clásica.', 'Espiral', 11.5);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Parece un sombrero mexicano.', 'Espiral Sa', 13.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Luna', true, 3474, 'El único satélite natural de la Tierra.');
INSERT INTO public.moon VALUES (2, 4, 'Fobos', true, 22, 'Luna interior y más grande de Marte.');
INSERT INTO public.moon VALUES (3, 4, 'Deimos', true, 12, 'Luna exterior y más pequeña de Marte.');
INSERT INTO public.moon VALUES (4, 5, 'Io', true, 3643, 'La luna volcánicamente más activa.');
INSERT INTO public.moon VALUES (5, 5, 'Europa', true, 3121, 'Posiblemente tiene un océano subsuperficial.');
INSERT INTO public.moon VALUES (6, 5, 'Ganimedes', true, 5268, 'La luna más grande del sistema solar.');
INSERT INTO public.moon VALUES (7, 5, 'Calisto', true, 4821, 'Luna muy antigua y helada.');
INSERT INTO public.moon VALUES (8, 5, 'Amaltea', true, 167, 'Una de las lunas interiores de Jupiter.');
INSERT INTO public.moon VALUES (9, 5, 'Himalia', false, 170, 'Una luna irregular de Jupiter.');
INSERT INTO public.moon VALUES (10, 5, 'Elara', false, 79, 'Miembro del grupo Elara de lunas.');
INSERT INTO public.moon VALUES (11, 6, 'Titan', true, 5149, 'La única luna conocida con atmósfera densa.');
INSERT INTO public.moon VALUES (12, 6, 'Rea', true, 1528, 'Segunda luna más grande de Saturno.');
INSERT INTO public.moon VALUES (13, 6, 'Iapeto', false, 1471, 'Tiene dos colores distintos.');
INSERT INTO public.moon VALUES (14, 6, 'Dione', true, 1123, 'Tiene un tenue anillo de polvo.');
INSERT INTO public.moon VALUES (15, 6, 'Tetis', true, 1066, 'Tiene un gran cañón llamado Ithaca Chasma.');
INSERT INTO public.moon VALUES (16, 6, 'Encelado', true, 504, 'Famoso por sus géiseres.');
INSERT INTO public.moon VALUES (17, 6, 'Mimas', true, 396, 'Tiene un cráter gigante, parece la Estrella de la Muerte.');
INSERT INTO public.moon VALUES (18, 6, 'Hyperion', false, 270, 'Esponjosa e irregular.');
INSERT INTO public.moon VALUES (19, 6, 'Phoebe', false, 213, 'Se cree que es un asteroide capturado.');
INSERT INTO public.moon VALUES (20, 6, 'Jano', true, 179, 'Comparte órbita con Epimeteo.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercurio', false, 88, 0.4);
INSERT INTO public.planet VALUES (2, 1, 'Venus', false, 225, 0.7);
INSERT INTO public.planet VALUES (3, 1, 'Tierra', true, 365, 1.0);
INSERT INTO public.planet VALUES (4, 1, 'Marte', false, 687, 1.5);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', false, 4333, 5.2);
INSERT INTO public.planet VALUES (6, 1, 'Saturno', false, 10759, 9.5);
INSERT INTO public.planet VALUES (7, 2, 'Proxima b', false, 11, 0.05);
INSERT INTO public.planet VALUES (8, 3, 'Andro-1', false, 400, 1.2);
INSERT INTO public.planet VALUES (9, 3, 'Andro-2', false, 750, 2.5);
INSERT INTO public.planet VALUES (10, 4, 'Tri-1', false, 50, 0.6);
INSERT INTO public.planet VALUES (11, 5, 'Whirl-A', false, 900, 3.0);
INSERT INTO public.planet VALUES (12, 6, 'Sombrero Z', false, 1500, 5.0);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Gigante Gaseoso', 'Planeta grande compuesto principalmente de hidrógeno y helio.');
INSERT INTO public.planet_type VALUES (2, 'Terrestre', 'Planeta rocoso similar a la Tierra o Marte.');
INSERT INTO public.planet_type VALUES (3, 'Enano Helado', 'Planeta pequeño y helado que orbita lejos de su estrella.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 1, true, 5778);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 0, true, 3042);
INSERT INTO public.star VALUES (3, 2, 'Andromeda A', 2, true, 6500);
INSERT INTO public.star VALUES (4, 3, 'Triangulum Alpha', 1, true, 5500);
INSERT INTO public.star VALUES (5, 4, 'Cigar B', 5, true, 20000);
INSERT INTO public.star VALUES (6, 5, 'Whirlpool C', 1, true, 5000);


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
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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

