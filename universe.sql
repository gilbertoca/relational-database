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
    name character varying(50) NOT NULL,
    magnitude numeric,
    distance numeric,
    constellation character varying(50),
    notes text
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
    name character varying(50) NOT NULL,
    planet_id integer,
    mean_radius numeric,
    orbital_period_days numeric,
    discover_year integer,
    discovered_by text
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
    star_id integer,
    name character varying(50) NOT NULL,
    mass numeric,
    orbital_period_years numeric,
    confirmed_moons integer,
    has_rings boolean,
    atmosphere character varying(50)
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
    galaxy_id integer,
    name character varying(50) NOT NULL,
    temperature_in_k numeric,
    distance_light_yeas numeric,
    color character varying(20),
    star_type_id integer
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_enabled boolean
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way                       ', -6.5, 0, 'Sagittarius (centre)   ', 'This is the galaxy containing the Sun and its Solar System, and therefore Earth. Most things visible to the naked eye in the sky are part of it, including the Milky Way composing the Zone of Avoidance.                           ');
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud          ', 0.9, 160, 'Dorado/Mensa           ', 'Visible only from the southern hemisphere. It is also the brightest patch of nebulosity in the sky.                                                                                                                                 ');
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud (NGC 292)', 2.7, 200, 'Tucana                 ', 'Visible only from the southern hemisphere.                                                                                                                                                                                          ');
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy (M31, NGC 224) ', 3.4, 2.5, 'Andromeda              ', 'Once called the Great Andromeda Nebula, it is situated in the Andromeda constellation.                                                                                                                                              ');
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy (M33, NGC 598)', 5.7, 2.9, 'Triangulum             ', 'Being a diffuse object, its visibility is strongly affected by even small amounts of light pollution, ranging from easily visible in direct vision in truly dark skies to a difficult averted vision object in rural/suburban skies.');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A (NGC 5128)          ', 6.84, 13.7, 'Centaurus              ', 'Centaurus A has been spotted with the naked eye by Stephen James O''Meara.                                                                                                                                                           ');
INSERT INTO public.galaxy VALUES (7, 'Bode''s Galaxy (M81, NGC 3031)   ', 6.94, 12, 'Ursa Major             ', 'Highly experienced amateur astronomers may be able to see Messier 81 under exceptional observing conditions.                                                                                                                        ');
INSERT INTO public.galaxy VALUES (8, 'Sculptor Galaxy (NGC 253)       ', 7.2, 12, 'Sculptor               ', 'NGC 253 has been observed with the naked eye by Timo Karhula.                                                                                                                                                                       ');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon            ', 3, 1.738, 27.321582, NULL, '—                                                                              ');
INSERT INTO public.moon VALUES (2, 'Phobos          ', 4, 11267, 319, 1877, 'Hall                                                                           ');
INSERT INTO public.moon VALUES (3, 'Deimos          ', 4, 6.2, 1262, 1877, 'Hall                                                                           ');
INSERT INTO public.moon VALUES (4, 'Io              ', 5, 1821.6, 1769, 1610, 'Galileo                                                                        ');
INSERT INTO public.moon VALUES (5, 'Europa          ', 5, 1560.8, 3551, 1610, 'Galileo                                                                        ');
INSERT INTO public.moon VALUES (6, 'Ganymede        ', 5, 2634.1, 7155, 1610, 'Galileo                                                                        ');
INSERT INTO public.moon VALUES (7, 'Callisto        ', 5, 2410.3, 16.69, 1610, 'Galileo                                                                        ');
INSERT INTO public.moon VALUES (8, 'Amalthea        ', 5, 83.5, 498, 1892, 'Barnard                                                                        ');
INSERT INTO public.moon VALUES (9, 'Himalia         ', 5, 69.8, 250.56, 1904, 'Perrine                                                                        ');
INSERT INTO public.moon VALUES (10, 'Elara           ', 5, 43, 259.64, 1905, 'Perrine                                                                        ');
INSERT INTO public.moon VALUES (11, 'Pasiphae        ', 5, 30, 743.63, 1908, 'Melotte                                                                        ');
INSERT INTO public.moon VALUES (12, 'Sinope          ', 5, 19, 758.90, 1914, 'Nicholson                                                                      ');
INSERT INTO public.moon VALUES (13, 'Lysithea        ', 5, 18, 259.20, 1938, 'Nicholson                                                                      ');
INSERT INTO public.moon VALUES (14, 'Carme           ', 5, 23, 734.17, 1938, 'Nicholson                                                                      ');
INSERT INTO public.moon VALUES (15, 'Ananke          ', 5, 14, 629.77, 1951, 'Nicholson                                                                      ');
INSERT INTO public.moon VALUES (16, 'Leda            ', 5, 10, 240.92, 1974, 'Kowal                                                                          ');
INSERT INTO public.moon VALUES (17, 'Thebe           ', 5, 49.3, 675, 1979, 'Synnott (Voyager 1)                                                            ');
INSERT INTO public.moon VALUES (18, 'Adrastea        ', 5, 8.2, 298, 1979, 'Jewitt, Danielson (Voyager 1)                                                  ');
INSERT INTO public.moon VALUES (19, 'Metis           ', 5, 21.5, 295, 1979, 'Synnott (Voyager 1)                                                            ');
INSERT INTO public.moon VALUES (20, 'Callirrhoe      ', 5, 4.5, 758.77, 2000, 'Scotti, Spahr, McMillan, Larsen, Montani, Gleason, Gehrels                     ');
INSERT INTO public.moon VALUES (21, 'Themisto        ', 5, 4, 130.02, 1975, 'Kowal and Roemer (original); Sheppard, Jewitt, Fernández, Magnier (rediscovery)');
INSERT INTO public.moon VALUES (22, 'Megaclite       ', 5, 2.7, 752.86, 2000, 'Sheppard, Jewitt, Fernández, Magnier, Dahm, Evans                              ');
INSERT INTO public.moon VALUES (23, 'Taygete         ', 5, 2.5, 732.41, 2000, 'Sheppard, Jewitt, Fernández, Magnier, Dahm, Evans                              ');
INSERT INTO public.moon VALUES (24, 'Chaldene        ', 5, 1.9, 723.72, 2000, 'Sheppard, Jewitt, Fernández, Magnier, Dahm, Evans                              ');
INSERT INTO public.moon VALUES (25, 'Harpalyke       ', 5, 2.2, 623.32, 2000, 'Sheppard, Jewitt, Fernández, Magnier, Dahm, Evans                              ');
INSERT INTO public.moon VALUES (26, 'Kalyke          ', 5, 2.6, 742.06, 2000, 'Sheppard, Jewitt, Fernández, Magnier, Dahm, Evans                              ');
INSERT INTO public.moon VALUES (27, 'Iocaste         ', 5, 2.6, 631.60, 2000, 'Sheppard, Jewitt, Fernández, Magnier, Dahm, Evans                              ');
INSERT INTO public.moon VALUES (28, 'Erinome         ', 5, 1.6, 728.46, 2000, 'Sheppard, Jewitt, Fernández, Magnier, Dahm, Evans                              ');
INSERT INTO public.moon VALUES (29, 'Isonoe          ', 5, 2, 726.23, 2000, 'Sheppard, Jewitt, Fernández, Magnier, Dahm, Evans                              ');
INSERT INTO public.moon VALUES (30, 'Praxidike       ', 5, 3.5, 625.39, 2000, 'Sheppard, Jewitt, Fernández, Magnier, Dahm, Evans                              ');
INSERT INTO public.moon VALUES (31, 'Autonoe         ', 5, 2, 760.95, 2001, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (32, 'Thyone          ', 5, 2, 627.21, 2001, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (33, 'Hermippe        ', 5, 2, 633.9, 2001, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (34, 'Aitne           ', 5, 1.5, 730.18, 2001, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (35, 'Eurydome        ', 5, 1.5, 717.33, 2001, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (36, 'Euanthe         ', 5, 1.5, 620.49, 2001, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (37, 'Euporie         ', 5, 1, 550.74, 2001, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (38, 'Orthosie        ', 5, 1, 622.56, 2001, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (39, 'Sponde          ', 5, 1, 748.34, 2001, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (40, 'Kale            ', 5, 1, 729.47, 2001, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (41, 'Pasithee        ', 5, 1, 719.44, 2001, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (42, 'Hegemone        ', 5, 1.5, 739.88, 2003, 'Sheppard, Jewitt, Kleyna, Fernández                                            ');
INSERT INTO public.moon VALUES (43, 'Mneme           ', 5, 1, 620.04, 2003, 'Gladman, Allen                                                                 ');
INSERT INTO public.moon VALUES (44, 'Aoede           ', 5, 2, 761.50, 2003, 'Sheppard, Jewitt, Kleyna, Fernández, Hsieh                                     ');
INSERT INTO public.moon VALUES (45, 'Thelxinoe       ', 5, 1, 628.09, 2003, 'Sheppard, Jewitt, Kleyna, Gladman, Kavelaars, Petit, Allen                     ');
INSERT INTO public.moon VALUES (46, 'Arche           ', 5, 1.5, 731.95, 2002, 'Sheppard, Meech, Hsieh, Tholen, Tonry                                          ');
INSERT INTO public.moon VALUES (47, 'Kallichore      ', 5, 1, 728.73, 2003, 'Sheppard, Jewitt, Kleyna, Fernández                                            ');
INSERT INTO public.moon VALUES (48, 'Helike          ', 5, 2, 626.32, 2003, 'Sheppard, Jewitt, Kleyna, Fernández, Hsieh                                     ');
INSERT INTO public.moon VALUES (49, 'Carpo           ', 5, 1.5, 456.30, 2003, 'Sheppard, Gladman, Kavelaars, Petit, Allen, Jewitt, Kleyna                     ');
INSERT INTO public.moon VALUES (50, 'Eukelade        ', 5, 2, 730.47, 2003, 'Sheppard, Jewitt, Kleyna, Fernández, Hsieh                                     ');
INSERT INTO public.moon VALUES (51, 'Cyllene         ', 5, 1, 752, 2003, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (52, 'Kore            ', 5, 1, 779.17, 2003, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (53, 'Herse           ', 5, 1, 714.51, 2003, 'Gladman, Sheppard, Jewitt, Kleyna, Kavelaars, Petit, Allen                     ');
INSERT INTO public.moon VALUES (54, 'S/2010 J 1      ', 5, 1, 723.2, 2010, 'Jacobson, Brozović, Gladman, Alexandersen                                      ');
INSERT INTO public.moon VALUES (55, 'S/2010 J 2      ', 5, 0.5, 588.1, 2010, 'Veillet                                                                        ');
INSERT INTO public.moon VALUES (56, 'Dia             ', 5, 2, 287.0, 2000, 'Sheppard, Jewitt, Kleyna, Fernández, Hsieh                                     ');
INSERT INTO public.moon VALUES (57, 'S/2016 J 1      ', 5, 1, 602.7, 2016, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (58, 'S/2003 J 18     ', 5, 1, 588.0, 2003, 'Gladman, Sheppard, Jewitt, Kleyna, Kavelaars, Petit, Allen                     ');
INSERT INTO public.moon VALUES (59, 'S/2011 J 2      ', 5, 0.5, 726.8, 2011, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (60, 'Eirene          ', 5, 2, 759.7, 2003, 'Sheppard, Jewitt, Kleyna, Fernández, Hsieh                                     ');
INSERT INTO public.moon VALUES (61, 'Philophrosyne   ', 5, 1, 701.3, 2003, 'Sheppard, Jewitt, Kleyna, Fernández                                            ');
INSERT INTO public.moon VALUES (62, 'S/2017 J 1      ', 5, 2, 734.2, 2017, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (63, 'Eupheme         ', 5, 1, 627.8, 2003, 'Sheppard, Jewitt, Kleyna, Fernández, Hsieh                                     ');
INSERT INTO public.moon VALUES (64, 'S/2003 J 19     ', 5, 1, 697.6, 2003, 'Gladman, Sheppard, Jewitt, Kleyna, Kavelaars, Petit, Allen                     ');
INSERT INTO public.moon VALUES (65, 'Valetudo        ', 5, 0.5, 532.0, 2016, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (66, 'S/2017 J 2      ', 5, 1, 723.8, 2017, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (67, 'S/2017 J 3      ', 5, 1, 605.8, 2017, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (68, 'Pandia          ', 5, 1.5, 251.8, 2017, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (69, 'S/2017 J 5      ', 5, 1, 720.5, 2017, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (70, 'S/2017 J 6      ', 5, 1, 684.7, 2017, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (71, 'S/2017 J 7      ', 5, 1, 602.8, 2017, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (72, 'S/2017 J 8      ', 5, 0.5, 720.7, 2017, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (73, 'S/2017 J 9      ', 5, 1, 640.9, 2017, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (74, 'Ersa            ', 5, 1.5, 250.4, 2018, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (75, 'S/2011 J 1      ', 5, 0.5, 580.7, 2011, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (76, 'S/2003 J 2      ', 5, 1, 602.02, 2003, 'Sheppard, Jewitt, Kleyna, Fernández, Hsieh                                     ');
INSERT INTO public.moon VALUES (77, 'S/2003 J 4      ', 5, 1, 668.85, 2003, 'Sheppard, Jewitt, Kleyna, Fernández, Hsieh                                     ');
INSERT INTO public.moon VALUES (78, 'S/2003 J 9      ', 5, 0.5, 767.6, 2003, 'Sheppard, Jewitt, Kleyna, Fernández                                            ');
INSERT INTO public.moon VALUES (79, 'S/2003 J 10     ', 5, 1, 707.78, 2003, 'Sheppard, Jewitt, Kleyna, Fernández                                            ');
INSERT INTO public.moon VALUES (80, 'S/2003 J 12     ', 5, 0.5, 646.64, 2003, 'Sheppard, Jewitt, Kleyna, Fernández                                            ');
INSERT INTO public.moon VALUES (81, 'S/2003 J 16     ', 5, 1, 600.18, 2003, 'Gladman, Sheppard, Jewitt, Kleyna, Kavelaars, Petit, Allen                     ');
INSERT INTO public.moon VALUES (82, 'S/2003 J 23     ', 5, 1, 792.00, 2003, 'Sheppard, Jewitt, Kleyna, Fernández                                            ');
INSERT INTO public.moon VALUES (83, 'S/2003 J 24     ', 5, 1.5, 715.4, 2003, 'Sheppard, Jewitt, Kleyna, Gladman, Veillet                                     ');
INSERT INTO public.moon VALUES (84, 'S/2011 J 3      ', 5, 1.5, 261.77, 2011, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (85, 'S/2016 J 3      ', 5, 1, 676.37, 2016, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (86, 'S/2018 J 2      ', 5, 1.5, 250.88, 2018, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (87, 'S/2021 J 1      ', 5, 0.5, 606.99, 2021, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (88, 'Mimas           ', 6, 198.2, 942, 1789, 'Herschel                                                                       ');
INSERT INTO public.moon VALUES (89, 'Enceladus       ', 6, 252.1, 1370, 1789, 'Herschel                                                                       ');
INSERT INTO public.moon VALUES (90, 'Tethys          ', 6, 533.1, 1888, 1684, 'Cassini                                                                        ');
INSERT INTO public.moon VALUES (91, 'Dione           ', 6, 561.4, 2737, 1684, 'Cassini                                                                        ');
INSERT INTO public.moon VALUES (92, 'Rhea            ', 6, 763.8, 4518, 1672, 'Cassini                                                                        ');
INSERT INTO public.moon VALUES (93, 'Titan           ', 6, 2574.73, 15.95, 1655, 'Huygens                                                                        ');
INSERT INTO public.moon VALUES (94, 'Hyperion        ', 6, 135, 21.28, 1848, 'W.Bond, G. Bond, and Lassell                                                   ');
INSERT INTO public.moon VALUES (95, 'Iapetus         ', 6, 735.6, 79.33, 1671, 'Cassini                                                                        ');
INSERT INTO public.moon VALUES (96, 'Phoebe          ', 6, 106.5, 550.31, 1899, 'Pickering                                                                      ');
INSERT INTO public.moon VALUES (97, 'Janus           ', 6, 89.5, 695, 1966, 'Dollfus; Voyager 1 (confirmed)                                                 ');
INSERT INTO public.moon VALUES (98, 'Epimetheus      ', 6, 58.1, 694, 1966, 'Walker; Voyager 1 (confirmed)                                                  ');
INSERT INTO public.moon VALUES (99, 'Helene          ', 6, 17.6, 2737, 1980, 'Laques, Lecacheux                                                              ');
INSERT INTO public.moon VALUES (100, 'Telesto         ', 6, 12.4, 1888, 1980, 'Smith, Reitsema, Larson, Fountain (Voyager 1)                                  ');
INSERT INTO public.moon VALUES (101, 'Calypso         ', 6, 10.7, 1888, 1980, 'Pascu, Seidelmann, Baum, Currie                                                ');
INSERT INTO public.moon VALUES (102, 'Atlas           ', 6, 15.1, 602, 1980, 'Terrile (Voyager 1)                                                            ');
INSERT INTO public.moon VALUES (103, 'Prometheus      ', 6, 43.1, 613, 1980, 'Collins (Voyager 1)                                                            ');
INSERT INTO public.moon VALUES (104, 'Pandora         ', 6, 40.7, 629, 1980, 'Collins (Voyager 1)                                                            ');
INSERT INTO public.moon VALUES (105, 'Pan             ', 6, 14.1, 575, 1990, 'Showalter (Voyager 2)                                                          ');
INSERT INTO public.moon VALUES (106, 'Ymir            ', 6, 9, 1315.58, 2000, 'Gladman                                                                        ');
INSERT INTO public.moon VALUES (107, 'Paaliaq         ', 6, 11, 686.95, 2000, 'Gladman                                                                        ');
INSERT INTO public.moon VALUES (108, 'Tarvos          ', 6, 7.5, 926.23, 2000, 'Gladman, Kavelaars                                                             ');
INSERT INTO public.moon VALUES (109, 'Ijiraq          ', 6, 6, 451.42, 2000, 'Gladman, Kavelaars                                                             ');
INSERT INTO public.moon VALUES (110, 'Suttungr        ', 6, 3.5, 1016.67, 2000, 'Gladman, Kavelaars                                                             ');
INSERT INTO public.moon VALUES (111, 'Kiviuq          ', 6, 8, 449.22, 2000, 'Gladman                                                                        ');
INSERT INTO public.moon VALUES (112, 'Mundilfari      ', 6, 3.5, 952.77, 2000, 'Gladman, Kavelaars                                                             ');
INSERT INTO public.moon VALUES (113, 'Albiorix        ', 6, 16, 783.45, 2000, 'Holman, Spahr                                                                  ');
INSERT INTO public.moon VALUES (114, 'Skathi          ', 6, 4, 728.20, 2000, 'Gladman, Kavelaars                                                             ');
INSERT INTO public.moon VALUES (115, 'Erriapus        ', 6, 5, 871.19, 2000, 'Gladman, Kavelaars                                                             ');
INSERT INTO public.moon VALUES (116, 'Siarnaq         ', 6, 20, 896.44, 2000, 'Gladman, Kavelaars                                                             ');
INSERT INTO public.moon VALUES (117, 'Thrymr          ', 6, 3.5, 1094.11, 2000, 'Gladman, Kavelaars                                                             ');
INSERT INTO public.moon VALUES (118, 'Narvi           ', 6, 3.5, 1003.86, 2003, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (119, 'Methone         ', 6, 1.45, 1010, 2004, 'Porco, Charnoz, Brahic, Dones (Cassini–Huygens)                                ');
INSERT INTO public.moon VALUES (120, 'Pallene         ', 6, 2.22, 1154, 2004, 'Gordon, Murray, Beurle, et al. (Cassini–Huygens)                               ');
INSERT INTO public.moon VALUES (121, 'Polydeuces      ', 6, 1.3, 2737, 2004, 'Porco et al. (Cassini–Huygens)                                                 ');
INSERT INTO public.moon VALUES (122, 'Daphnis         ', 6, 3.8, 594, 2005, 'Porco et al. (Cassini–Huygens)                                                 ');
INSERT INTO public.moon VALUES (123, 'Aegir           ', 6, 3, 1117.52, 2004, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (124, 'Bebhionn        ', 6, 3, 834.84, 2004, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (125, 'Bergelmir       ', 6, 3, 1005.74, 2004, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (126, 'Bestla          ', 6, 3.5, 1088.72, 2004, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (127, 'Farbauti        ', 6, 2.5, 1085.55, 2004, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (128, 'Fenrir          ', 6, 2, 1260.35, 2004, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (129, 'Fornjot         ', 6, 3, 1494.2, 2004, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (130, 'Hati            ', 6, 3, 1038.61, 2004, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (131, 'Hyrrokkin       ', 6, 4, 931.86, 2004, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (132, 'Kari            ', 6, 3.5, 1230.97, 2006, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (133, 'Loge            ', 6, 3, 1311.36, 2006, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (134, 'Skoll           ', 6, 3, 878.29, 2006, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (135, 'Surtur          ', 6, 3, 1297.36, 2006, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (136, 'Anthe           ', 6, 0.9, 1.0365, 2007, 'Porco et al. (Cassini–Huygens)                                                 ');
INSERT INTO public.moon VALUES (137, 'Jarnsaxa        ', 6, 3, 964.74, 2006, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (138, 'Greip           ', 6, 3, 921.19, 2006, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (139, 'Tarqeq          ', 6, 3.5, 887.48, 2007, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (140, 'Aegaeon         ', 6, 0.33, 808, 2008, 'Cassini Imaging Science Team Cassini–Huygens                                   ');
INSERT INTO public.moon VALUES (141, 'Gridr           ', 6, 3, 1010.55, 2019, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (142, 'Angrboda        ', 6, 3, 1107.13, 2019, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (143, 'Skrymir         ', 6, 4, 1149.82, 2019, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (144, 'Gerd            ', 6, 4, 1150.69, 2019, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (145, 'S/2004 S 26     ', 6, 4, 1627.18, 2019, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (146, 'Eggther         ', 6, 6, 1054.45, 2019, 'Sheppard, Jewitt, Kleyna, Marsden, Jacobson                                    ');
INSERT INTO public.moon VALUES (147, 'S/2004 S 29     ', 6, 4, 826.44, 2019, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (148, 'Beli            ', 6, 3, 1087.84, 2019, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (149, 'Gunnlod         ', 6, 4, 1153.96, 2019, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (150, 'Thiazzi         ', 6, 4, 1403.18, 2019, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (151, 'S/2004 S 34     ', 6, 3, 1414.59, 2019, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (152, 'Alvaldi         ', 6, 6, 1253.08, 2019, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (153, 'Geirrod         ', 6, 4, 1211.02, 2019, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (154, 'S/2004 S 7      ', 6, 3, 1140.24, 2004, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (155, 'S/2004 S 12     ', 6, 2.5, 1046.19, 2004, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (156, 'S/2004 S 13     ', 6, 3, 933.48, 2004, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (157, 'S/2004 S 17     ', 6, 2, 1014.70, 2004, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (158, 'S/2004 S 21     ', 6, 3, 1272.61, 2019, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (159, 'S/2004 S 24     ', 6, 3, 1294.25, 2019, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (160, 'S/2004 S 28     ', 6, 4, 1220.31, 2019, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (161, 'S/2004 S 31     ', 6, 4, 869.65, 2019, 'Sheppard, Jewitt, Kleyna, Marsden                                              ');
INSERT INTO public.moon VALUES (162, 'S/2004 S 36     ', 6, 3, 1319.07, 2019, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (163, 'S/2004 S 37     ', 6, 4, 748.18, 2019, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (164, 'S/2004 S 39     ', 6, 3, 1351.83, 2019, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (165, 'S/2006 S 1      ', 6, 3, 963.37, 2006, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (166, 'S/2006 S 3      ', 6, 3, 1227.21, 2006, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (167, 'S/2007 S 2      ', 6, 3, 808.08, 2007, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (168, 'S/2007 S 3      ', 6, 3, 977.8, 2007, 'Sheppard, Jewitt, Kleyna                                                       ');
INSERT INTO public.moon VALUES (169, 'S/2009 S 1      ', 6, 0.15, 471, 2009, 'Cassini Imaging Science Team Cassini–Huygens                                   ');
INSERT INTO public.moon VALUES (170, 'S/2019 S 1      ', 6, 3, 443.8, 2021, 'Ashton, Gladman, Petit, Alexandersen                                           ');
INSERT INTO public.moon VALUES (171, 'Ariel           ', 7, 578.9, 2520, 1851, 'Lassell                                                                        ');
INSERT INTO public.moon VALUES (172, 'Umbriel         ', 7, 584.7, 4144, 1851, 'Lassell                                                                        ');
INSERT INTO public.moon VALUES (173, 'Titania         ', 7, 788.9, 8706, 1787, 'Herschel                                                                       ');
INSERT INTO public.moon VALUES (174, 'Oberon          ', 7, 761.4, 13.46, 1787, 'Herschel                                                                       ');
INSERT INTO public.moon VALUES (175, 'Miranda         ', 7, 235.8, 1413, 1948, 'Kuiper                                                                         ');
INSERT INTO public.moon VALUES (176, 'Cordelia        ', 7, 20.1, 335, 1986, 'Terrile (Voyager 2)                                                            ');
INSERT INTO public.moon VALUES (177, 'Ophelia         ', 7, 21.4, 376, 1986, 'Terrile (Voyager 2)                                                            ');
INSERT INTO public.moon VALUES (178, 'Bianca          ', 7, 25.7, 435, 1986, 'Smith (Voyager 2)                                                              ');
INSERT INTO public.moon VALUES (179, 'Cressida        ', 7, 39.8, 464, 1986, 'Synnott (Voyager 2)                                                            ');
INSERT INTO public.moon VALUES (180, 'Desdemona       ', 7, 32, 474, 1986, 'Synnott (Voyager 2)                                                            ');
INSERT INTO public.moon VALUES (181, 'Juliet          ', 7, 46.8, 493, 1986, 'Synnott (Voyager 2)                                                            ');
INSERT INTO public.moon VALUES (182, 'Portia          ', 7, 67.6, 513, 1986, 'Synnott (Voyager 2)                                                            ');
INSERT INTO public.moon VALUES (183, 'Rosalind        ', 7, 36, 558, 1986, 'Synnott (Voyager 2)                                                            ');
INSERT INTO public.moon VALUES (184, 'Belinda         ', 7, 40.3, 624, 1986, 'Synnott (Voyager 2)                                                            ');
INSERT INTO public.moon VALUES (185, 'Puck            ', 7, 81, 762, 1985, 'Synnott (Voyager 2)                                                            ');
INSERT INTO public.moon VALUES (186, 'Caliban         ', 7, 36.4, 579.73, 1997, 'Gladman, Nicholson, Burns, Kavelaars                                           ');
INSERT INTO public.moon VALUES (187, 'Sycorax         ', 7, 93, 1288.38, 1997, 'Gladman, Nicholson, Burns, Kavelaars                                           ');
INSERT INTO public.moon VALUES (188, 'Prospero        ', 7, 25, 1978.29, 1999, 'Gladman, Holman, Kavelaars, Petit, Scholl                                      ');
INSERT INTO public.moon VALUES (189, 'Setebos         ', 7, 24, 2225.21, 1999, 'Gladman, Holman, Kavelaars, Petit, Scholl                                      ');
INSERT INTO public.moon VALUES (190, 'Stephano        ', 7, 16, 677.36, 1999, 'Gladman, Holman, Kavelaars, Petit, Scholl                                      ');
INSERT INTO public.moon VALUES (191, 'Trinculo        ', 7, 9.5, 749.24, 2001, 'Holman, Kavelaars, Milisavljevic                                               ');
INSERT INTO public.moon VALUES (192, 'Francisco       ', 7, 11, 266.56, 2001, 'Holman, Kavelaars, Milisavljevic, Gladman                                      ');
INSERT INTO public.moon VALUES (193, 'Margaret        ', 7, 10, 1687.01, 2003, 'Sheppard, Jewitt                                                               ');
INSERT INTO public.moon VALUES (194, 'Ferdinand       ', 7, 10, 2887.21, 2001, 'Holman, Kavelaars, Milisavljevic, et al.                                       ');
INSERT INTO public.moon VALUES (195, 'Perdita         ', 7, 15, 638, 1999, 'Karkoschka (Voyager 2)                                                         ');
INSERT INTO public.moon VALUES (196, 'Mab             ', 7, 12, 923, 2003, 'Showalter, Lissauer                                                            ');
INSERT INTO public.moon VALUES (197, 'Cupid           ', 7, 9, 613, 2003, 'Showalter, Lissauer                                                            ');
INSERT INTO public.moon VALUES (198, 'Triton          ', 8, 1353.4, 5877, 1846, 'Lassell                                                                        ');
INSERT INTO public.moon VALUES (199, 'Nereid          ', 8, 170, 360.14, 1949, 'Kuiper                                                                         ');
INSERT INTO public.moon VALUES (200, 'Naiad           ', 8, 33, 294, 1989, 'Terrile (Voyager 2)                                                            ');
INSERT INTO public.moon VALUES (201, 'Thalassa        ', 8, 41, 311, 1989, 'Terrile (Voyager 2)                                                            ');
INSERT INTO public.moon VALUES (202, 'Despina         ', 8, 78, 335, 1989, 'Synnott (Voyager 2)                                                            ');
INSERT INTO public.moon VALUES (203, 'Galatea         ', 8, 88, 429, 1989, 'Synnott (Voyager 2)                                                            ');
INSERT INTO public.moon VALUES (204, 'Larissa         ', 8, 97, 555, 1981, 'Reitsema, Hubbard, Lebofsky, Tholen (Voyager 2)                                ');
INSERT INTO public.moon VALUES (205, 'Proteus         ', 8, 210, 1122, 1989, 'Synnott (Voyager 2)                                                            ');
INSERT INTO public.moon VALUES (206, 'Halimede        ', 8, 31, 1879.71, 2002, 'Holman, Kavelaars, Grav, Fraser, Milisavljevic                                 ');
INSERT INTO public.moon VALUES (207, 'Psamathe        ', 8, 20, 9115.91, 2003, 'Jewitt, Kleyna, Sheppard, Holman, Kavelaars                                    ');
INSERT INTO public.moon VALUES (208, 'Sao             ', 8, 22, 2914.07, 2002, 'Holman, Kavelaars, Grav, Fraser, Milisavljevic                                 ');
INSERT INTO public.moon VALUES (209, 'Laomedeia       ', 8, 21, 3167.85, 2002, 'Holman, Kavelaars, Grav, Fraser, Milisavljevic                                 ');
INSERT INTO public.moon VALUES (210, 'Neso            ', 8, 30, 9373.99, 2002, 'Holman, Kavelaars, Grav, Fraser, Milisavljevic                                 ');
INSERT INTO public.moon VALUES (211, 'Hippocamp       ', 8, 17.4, 0.9362, 2013, 'Showalter et al.                                                               ');
INSERT INTO public.moon VALUES (212, 'Vanth           ', 10, 221, 9539, 2005, 'Brown & Suer                                                                   ');
INSERT INTO public.moon VALUES (213, '(unnamed)1       ', 21, 72, NULL, 2005, 'Brown & Suer                                                                   ');
INSERT INTO public.moon VALUES (214, 'Charon          ', 11, 606, 6387, 1978, 'Christy                                                                        ');
INSERT INTO public.moon VALUES (215, 'Nix             ', 11, 22.5, 24.85, 2005, 'Weaver, Stern, Buie, et al.                                                    ');
INSERT INTO public.moon VALUES (216, 'Hydra           ', 11, 27.5, 38.20, 2005, 'Weaver, Stern, Buie, et al.                                                    ');
INSERT INTO public.moon VALUES (217, 'Kerberos        ', 11, 7, 32.17, 2011, 'Showalter (Hubble)                                                             ');
INSERT INTO public.moon VALUES (218, 'Styx            ', 11, 5.5, 20.16, 2012, 'Showalter (Hubble)                                                             ');
INSERT INTO public.moon VALUES (219, 'Actaea          ', 18, 142, 5494, 2006, 'Noll et al.                                                                    ');
INSERT INTO public.moon VALUES (220, 'Hiʻiaka         ', 12, 160, 49.12, 2005, 'Brown et al.                                                                   ');
INSERT INTO public.moon VALUES (221, 'Namaka          ', 12, 85, 18.2783, 2005, 'Brown et al.                                                                   ');
INSERT INTO public.moon VALUES (222, 'Weywot          ', 13, 37, 12438, 2007, 'Brown                                                                          ');
INSERT INTO public.moon VALUES (223, 'S/2015 (136472) ', 14, 87.5, 12.4, 2016, 'Parker et al.                                                                  ');
INSERT INTO public.moon VALUES (224, 'Ilmarë          ', 19, 163, 5751, 2009, 'Noll et al.                                                                    ');
INSERT INTO public.moon VALUES (225, '(unnamed)2       ', 20, 95, NULL, 2018, 'Sheppard                                                                       ');
INSERT INTO public.moon VALUES (226, 'Xiangliu        ', 15, 83.5, 25221, 2010, 'Marton, Kiss & Müller                                                          ');
INSERT INTO public.moon VALUES (227, 'Dysnomia        ', 16, 350, 15786, 2005, 'Brown, Rabinowitz, Trujillo et al.                                             ');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury  ', 0.06, 0.24, 0, false, 'minimal     ');
INSERT INTO public.planet VALUES (2, 1, 'Venus    ', 0.81, 0.62, 0, false, 'CO2, N2     ');
INSERT INTO public.planet VALUES (3, 1, 'Earth    ', 1.00, 1.00, 1, false, 'N2, O2, Ar  ');
INSERT INTO public.planet VALUES (4, 1, 'Mars     ', 0.11, 1.88, 2, false, 'CO2, N2, Ar ');
INSERT INTO public.planet VALUES (5, 1, 'Jupiter  ', 317.83, 11.86, 84, true, 'H2, He      ');
INSERT INTO public.planet VALUES (6, 1, 'Saturn   ', 95.16, 29.45, 83, true, 'H2, He      ');
INSERT INTO public.planet VALUES (7, 1, 'Uranus   ', 14.54, 84.02, 27, true, 'H2, He, CH4 ');
INSERT INTO public.planet VALUES (8, 1, 'Neptune  ', 17.15, 164.79, 14, true, 'H2, He, CH4 ');
INSERT INTO public.planet VALUES (9, 1, 'Ceres    ', 0.00016, 4.60, 0, false, 'minimal     ');
INSERT INTO public.planet VALUES (10, 1, 'Orcus    ', 0.0001, 247.5, 1, NULL, '?           ');
INSERT INTO public.planet VALUES (11, 1, 'Pluto    ', 0.0022, 247.9, 5, false, 'N2, CH4, CO ');
INSERT INTO public.planet VALUES (12, 1, 'Haumea   ', 0.0007, 283.8, 2, true, '?           ');
INSERT INTO public.planet VALUES (13, 1, 'Quaoar   ', 0.0003, 288.0, 1, NULL, '?           ');
INSERT INTO public.planet VALUES (14, 1, 'Makemake ', 0.0005, 306.2, 1, NULL, 'minimal     ');
INSERT INTO public.planet VALUES (15, 1, 'Gonggong ', 0.0003, 552.5, 1, NULL, '?           ');
INSERT INTO public.planet VALUES (16, 1, 'Eris     ', 0.0028, 559, 1, NULL, '?           ');
INSERT INTO public.planet VALUES (17, 1, 'Sedna    ', NULL, 12059, 0, NULL, '?           ');
INSERT INTO public.planet VALUES (18, 1, 'Salacia  ', NULL, 0, 0, NULL, '?           ');
INSERT INTO public.planet VALUES (19, 1, 'Varda     ', NULL, 0, 0, NULL, '?           ');
INSERT INTO public.planet VALUES (20, 1, '2013 FY27 ', NULL, 0, 0, NULL, '?           ');
INSERT INTO public.planet VALUES (21, 1, '2003 AZ84 ', NULL, 0, 0, NULL, '?           ');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'SUN            ', 6373, 0, 'color', 1);
INSERT INTO public.star VALUES (2, 1, 'Sirius A       ', 10.973, 0, 'color', 1);
INSERT INTO public.star VALUES (3, 1, 'Canopus        ', 7.973, 0, 'color', 1);
INSERT INTO public.star VALUES (4, 1, 'Alpha Centauri ', 6773, 0, 'color', 1);
INSERT INTO public.star VALUES (5, 1, 'Arcturus       ', 5073, 0, 'color', 1);
INSERT INTO public.star VALUES (6, 1, 'Rigel          ', 12.373, 0, 'color', 1);
INSERT INTO public.star VALUES (7, 1, 'Betelgeuse     ', 3773, 0, 'color', 1);
INSERT INTO public.star VALUES (8, 1, 'Beta Centauri  ', 21.573, 0, 'color', 1);
INSERT INTO public.star VALUES (9, 1, 'Alpha Crucis   ', 21.573, 0, 'color', 1);
INSERT INTO public.star VALUES (10, 1, 'Antares       ', 4000, 0, 'color', 1);
INSERT INTO public.star VALUES (11, 1, 'Beta Crucis   ', 22.573, 0, 'color', 1);
INSERT INTO public.star VALUES (12, 1, 'Procyon B     ', 7073, 0, 'color', 1);
INSERT INTO public.star VALUES (13, 1, 'Deneb         ', 10.573, 0, 'color', 1);
INSERT INTO public.star VALUES (14, 1, 'Vega          ', 10.673, 0, 'color', 1);
INSERT INTO public.star VALUES (15, 1, 'Capella       ', 5.873, 0, 'color', 1);
INSERT INTO public.star VALUES (16, 1, 'Altair        ', 7973, 0, 'color', 1);
INSERT INTO public.star VALUES (17, 1, 'Spica         ', 21.273, 0, 'color', 1);
INSERT INTO public.star VALUES (18, 1, 'Epsilon Indi  ', 4173, 0, 'color', 1);
INSERT INTO public.star VALUES (19, 1, 'Tau Ceti      ', 53000, 0, 'color', 1);
INSERT INTO public.star VALUES (20, 1, 'Sigma 2398    ', 3100, 0, 'color', 1);
INSERT INTO public.star VALUES (21, 1, 'Wolf 359      ', 3100, 0, 'color', 1);
INSERT INTO public.star VALUES (22, 1, 'Sirius B      ', 10.000, 0, 'color', 1);
INSERT INTO public.star VALUES (23, 1, 'Gleise 229A   ', 37000, 0, 'color', 1);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'Super Giants', NULL);
INSERT INTO public.star_type VALUES (2, 'Giants', NULL);
INSERT INTO public.star_type VALUES (3, 'Dwarf', NULL);
INSERT INTO public.star_type VALUES (4, 'Nova', NULL);
INSERT INTO public.star_type VALUES (5, 'Main Sequence', NULL);
INSERT INTO public.star_type VALUES (6, 'Pulsating', NULL);
INSERT INTO public.star_type VALUES (7, 'Red Giants', NULL);
INSERT INTO public.star_type VALUES (8, 'Black Hole', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: star_type star_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_name_key UNIQUE (name);


--
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


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
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--
