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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_million_years integer,
    diameter_in_kiloparsec integer,
    distance_from_earth_in_light_years numeric,
    description text,
    is_dwarf boolean,
    is_elliptical boolean
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
    name character varying(40) NOT NULL,
    age_in_million_years integer,
    diameter_in_km integer,
    distance_from_earth_in_million_km numeric,
    description text,
    inside_solar_system boolean,
    has_water boolean,
    planet_id integer NOT NULL
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
    name character varying(40) NOT NULL,
    age_in_million_years integer,
    diameter_in_km integer,
    distance_from_earth_in_million_km numeric,
    description text,
    is_exoplanet boolean,
    has_life boolean,
    star_id integer NOT NULL
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(40) NOT NULL,
    launch_mass_in_kg integer,
    development_time_in_years integer,
    cost_in_million_usd numeric,
    description text,
    is_passive boolean,
    is_communication_satellite boolean,
    type_of_orbit character varying(30)
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_million_years integer,
    distance_from_earth_in_light_years numeric,
    description text,
    is_variable_star boolean,
    type character(1),
    is_dwarf boolean,
    galaxy_id integer NOT NULL,
    secchi_class integer
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13160, 27, 26670, 'The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy''s appearance from Earth', true, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 61, 2480000, 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now', true, false);
INSERT INTO public.galaxy VALUES (3, 'Condor', 5003, 220, 212000000, 'The largest known spiral galaxy. It is tidally disturbed by the smaller lenticular galaxy IC 4970', true, false);
INSERT INTO public.galaxy VALUES (4, 'Cosmos Redshift 7', 800, 3, 12900, 'Galaxy Cosmos Redshift 7 is reported to be the brightest of distant galaxies and to contain some of the earliest first stars', false, false);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 1500, 14, 163000, 'The Large Magellanic Cloud is a satellite galaxy of the Milky Way. It is one of the nearest galaxies to the Milky Way and is visible in the southern hemisphere. ', true, false);
INSERT INTO public.galaxy VALUES (6, 'Bode''s Galaxy', 12500, 28, 11800000, ' Bode''s Galaxy is a grand design spiral galaxy located in the constellation Ursa Major. It is one of the brightest galaxies in the Messier catalog. ', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (18, 'Moon', 4500, 3474, 0, 'Earth''s natural satellite, the Moon, is the fifth largest moon in the Solar System. It lacks a significant atmosphere and is heavily cratered.', true, true, 3);
INSERT INTO public.moon VALUES (19, 'Titan', 4500, 5150, 1200, 'Titan is Saturn''s largest moon and the second largest moon in the Solar System. It has a thick atmosphere primarily composed of nitrogen and is known for its hydrocarbon lakes and rivers.', true, true, 3);
INSERT INTO public.moon VALUES (20, 'Ganymede', 4500, 5268, 628, 'Ganymede is Jupiter''s largest moon and the largest moon in the Solar System. It has a subsurface ocean beneath its icy crust and is geologically diverse.', true, true, 3);
INSERT INTO public.moon VALUES (21, 'Callisto', 4500, 4821, 628, 'Callisto is one of Jupiter''s Galilean moons. It has a heavily cratered surface and is believed to have a subsurface ocean.', true, true, 3);
INSERT INTO public.moon VALUES (22, 'Io', 4500, 3643, 628, 'Io is one of Jupiter''s Galilean moons and is the most volcanically active body in the Solar System due to tidal heating from Jupiter.', true, false, 3);
INSERT INTO public.moon VALUES (23, 'Europa', 4500, 3121, 628, 'Europa is one of Jupiter''s Galilean moons and is believed to have a subsurface ocean beneath its icy crust, making it a potential target for astrobiology.', true, true, 3);
INSERT INTO public.moon VALUES (24, 'Enceladus', 4500, 504, 1500, 'Enceladus is a moon of Saturn known for its geysers of water vapor and icy particles erupting from its south polar region.', true, true, 3);
INSERT INTO public.moon VALUES (25, 'Tethys', 4500, 1060, 1300, 'Tethys is a moon of Saturn and is heavily cratered. It has a large impact crater named Odysseus.', true, true, 3);
INSERT INTO public.moon VALUES (26, 'Dione', 4500, 1123, 1300, 'Dione is a moon of Saturn with a heavily cratered surface and bright, wispy streaks known as linea.', true, true, 3);
INSERT INTO public.moon VALUES (27, 'Rhea', 4500, 1528, 1300, 'Rhea is Saturn''s second-largest moon and has a heavily cratered surface with bright, icy terrain.', true, true, 3);
INSERT INTO public.moon VALUES (28, 'Iapetus', 4500, 1470, 1400, 'Iapetus is a moon of Saturn known for its stark contrast in brightness between its leading and trailing hemispheres.', true, true, 3);
INSERT INTO public.moon VALUES (29, 'Charon', 4500, 1212, 5900, 'Charon is the largest moon of Pluto and is tidally locked with Pluto, always presenting the same face towards it.', true, true, 3);
INSERT INTO public.moon VALUES (30, 'Ariel', 4500, 1157, 2800, 'Ariel is one of Uranus''s major moons and has a relatively young surface with few impact craters.', true, true, 3);
INSERT INTO public.moon VALUES (31, 'Umbriel', 4500, 1169, 2800, 'Umbriel is another major moon of Uranus and has a heavily cratered surface with a dark appearance.', true, true, 3);
INSERT INTO public.moon VALUES (32, 'Miranda', 4500, 471, 2800, 'Miranda is one of Uranus''s five major moons and has a complex surface with varied terrain, including large cliffs and valleys.', true, true, 3);
INSERT INTO public.moon VALUES (33, 'Triton', 4500, 2706, 4300, 'Triton is Neptune''s largest moon and is believed to be a captured Kuiper Belt object. It has a thin atmosphere and unique surface features.', true, true, 3);
INSERT INTO public.moon VALUES (34, 'Proteus', 4500, 420, 4700, 'Proteus is one of Neptune''s larger moons and is irregularly shaped. It is heavily cratered and has a dark, heavily cratered surface.', true, true, 3);
INSERT INTO public.moon VALUES (35, 'Nereid', 4500, 340, 4700, 'Nereid is one of Neptune''s smaller moons and has an irregular, elongated shape. It is believed to be a captured object from the Kuiper Belt.', true, true, 3);
INSERT INTO public.moon VALUES (36, 'Phobos', 4500, 22, 58, 'Phobos is the larger and closer of Mars''s two moons. It has a heavily cratered surface and is believed to be a captured asteroid.', true, false, 3);
INSERT INTO public.moon VALUES (37, 'Hyperion', 4500, 270, 1400, 'Hyperion is one of Saturn''s irregularly shaped moons known for its spongy appearance and chaotic rotation. It has a highly porous surface with numerous impact craters.', true, false, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4500, 4880, 77, 'Mercury is the smallest and innermost planet in the Solar System. It has a heavily cratered surface and no atmosphere to retain heat, leading to extreme temperature variations.', false, false, 13);
INSERT INTO public.planet VALUES (2, 'Venus', 4500, 12104, 38, 'Venus is often called Earth''s sister planet due to its similar size and composition, but it has a thick, toxic atmosphere composed mainly of carbon dioxide. Surface temperatures are hot enough to melt lead.', false, false, 13);
INSERT INTO public.planet VALUES (3, 'Earth', 4500, 12742, 147, 'Earth is the only known planet to support life. It has a diverse environment with oceans, continents, and a breathable atmosphere.', false, true, 13);
INSERT INTO public.planet VALUES (4, 'Mars', 4500, 6779, 54, 'Mars is known as the Red Planet due to its reddish appearance caused by iron oxide on its surface. It has a thin atmosphere and features such as valleys, deserts, and polar ice caps.', false, false, 13);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4500, 139820, 588, 'Jupiter is the largest planet in the Solar System and is composed mainly of hydrogen and helium. It has a turbulent atmosphere with distinct cloud bands and a large, swirling storm known as the Great Red Spot.', false, false, 13);
INSERT INTO public.planet VALUES (6, 'Saturn', 4500, 116460, 1200, 'Saturn is known for its prominent ring system, composed mainly of ice particles and rocky debris. It is the second-largest planet and has a complex atmosphere with high-speed winds.', false, false, 13);
INSERT INTO public.planet VALUES (7, 'Uranus', 4500, 50724, 2600, 'Uranus is an ice giant planet with a unique feature - it rotates on its side. It has a bluish appearance due to the presence of methane in its atmosphere.', false, false, 13);
INSERT INTO public.planet VALUES (8, 'Neptune', 4500, 49244, 4300, 'Neptune is the outermost planet in the Solar System and is composed mainly of hydrogen, helium, and methane. It has a dynamic atmosphere with fast-moving clouds and the strongest winds in the Solar System.', false, false, 13);
INSERT INTO public.planet VALUES (9, 'Pluto', 4500, 2377, 4280, 'Pluto is a dwarf planet located in the Kuiper Belt. It was considered the ninth planet until reclassification in 2006. Pluto has a thin atmosphere and a complex surface with icy plains, mountains, and valleys.', false, false, 13);
INSERT INTO public.planet VALUES (10, 'Eris', 4500, 2326, 9000, 'Eris is a dwarf planet located in the scattered disc region of the Solar System. It is similar in size to Pluto and has a highly elliptical orbit.', false, false, 13);
INSERT INTO public.planet VALUES (11, 'Haumea', 4500, 1960, 5200, 'Haumea is a dwarf planet located in the Kuiper Belt. It is elongated in shape due to its rapid rotation and is surrounded by two small moons.', false, false, 13);
INSERT INTO public.planet VALUES (12, 'Makemake', 4500, 1430, 6800, 'Makemake is a dwarf planet located in the Kuiper Belt. It is similar in size to Haumea and Pluto and has a reddish surface possibly due to the presence of organic materials.', false, false, 13);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble Space Telescope', 11100, 10, 4700, 'The Hubble Space Telescope is a space telescope that was launched into low Earth orbit in 1990. It has provided astronomers with incredible views of the universe, helping to answer numerous scientific questions.', false, false, 'LEO');
INSERT INTO public.satellite VALUES (2, 'GPS Satellite', 1000, 10, 1000, 'GPS satellites are part of a constellation of satellites operated by the United States government to provide global positioning system (GPS) services for navigation and timing. They transmit signals that allow GPS receivers to determine their precise location and time.', false, false, 'MEO');
INSERT INTO public.satellite VALUES (3, 'ISS (International Space Station)', 420000, 10, 150000, 'The ISS is a large space station in low Earth orbit that serves as a microgravity laboratory for scientific research in space. It is a collaborative project involving multiple space agencies, including NASA, Roscosmos, ESA, JAXA, and CSA.', false, false, 'LEO');
INSERT INTO public.satellite VALUES (4, 'IRIDIUM Satellite', 689, 10, 3000, 'IRIDIUM satellites are part of a satellite constellation operated by Iridium Communications Inc. They provide satellite phone and data services worldwide, facilitating global communication.', false, true, 'Polar Orbit');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Sirius', 230, 0, 'Sirius is the brightest star in the night sky and is part of the constellation Canis Major. It is a binary star system consisting of a main-sequence star, Sirius A, and a white dwarf companion, Sirius B.', false, 'A', false, 1, 1);
INSERT INTO public.star VALUES (8, 'Alpha Centauri A', 6000, 4, 'Alpha Centauri A is the primary star in the Alpha Centauri star system, which is the closest star system to the Solar System.', false, 'G', false, 1, 5);
INSERT INTO public.star VALUES (9, 'Betelgeuse', 8, 643, 'Betelgeuse is a red supergiant star located in the constellation Orion. It is one of the largest and most luminous stars known, with a highly variable brightness.', true, 'M', false, 1, 3);
INSERT INTO public.star VALUES (10, 'M31 V1', 10000, 2, 'M31 V1 is a variable star located in the Andromeda Galaxy (M31). It is classified as a Cepheid variable star and is used as a standard candle to measure cosmic distances.', true, 'F', true, 2, 4);
INSERT INTO public.star VALUES (11, 'Andromeda II-A1', 9800, 2, 'Andromeda II-A1 is a red giant star located in the Andromeda II dwarf spheroidal galaxy, a satellite galaxy of the Andromeda Galaxy (M31).', false, 'K', true, 2, 8);
INSERT INTO public.star VALUES (12, 'Andromeda III-B1', 9700, 2, 'Andromeda III-B1 is a blue giant star located in the Andromeda III dwarf spheroidal galaxy, another satellite galaxy of the Andromeda Galaxy', false, 'O', true, 2, 2);
INSERT INTO public.star VALUES (13, 'Sun', 4600, 0, ' The Sun is a G-type main-sequence star, commonly referred to as a yellow dwarf. The Sun''s energy is generated through nuclear fusion reactions in its core, primarily converting hydrogen into helium.', false, 'G', true, 1, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 37, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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

