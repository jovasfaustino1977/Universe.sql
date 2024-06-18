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
    name character varying(60) NOT NULL,
    galaxy_types character varying(60),
    description text,
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    is_spherical boolean,
    has_life boolean
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
-- Name: materials; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.materials (
    materials_id integer NOT NULL,
    name character varying(60) NOT NULL,
    materials_types character varying(60),
    description text,
    age_in_millions_of_years numeric,
    quantity_of_material integer,
    is_present_on_the_planet boolean,
    is_present_in_the_star boolean,
    is_present_on_the_moon boolean,
    star_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.materials OWNER TO freecodecamp;

--
-- Name: materials_materials_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.materials_materials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_materials_id_seq OWNER TO freecodecamp;

--
-- Name: materials_materials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.materials_materials_id_seq OWNED BY public.materials.materials_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    moon_types character varying(60),
    description text,
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    is_spherical boolean,
    has_life boolean,
    moon_fk_planet integer,
    planet_id integer
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
    planet_types character varying(60),
    description text,
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    is_spherical boolean,
    has_life boolean,
    planet_fk_star integer,
    star_id integer
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
    star_types character varying(60),
    description text,
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    is_spherical boolean,
    has_life boolean,
    star_fk_galaxy integer,
    galaxy_id integer
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
-- Name: materials materials_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.materials ALTER COLUMN materials_id SET DEFAULT nextval('public.materials_materials_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Via Láctea', 'Espiral', 'A Via Láctea é a galáxia onde se encontra o Sistema Solar e é composta por matéria escura, gases, poeira e corpos celestes como estrelas, planetas, planetas anões, asteroides e meteoritos.', 13.5, 26, false, false);
INSERT INTO public.galaxy VALUES (2, 'Grande Nuvem de Magalhães', 'Formato Inrregular', 'A Grande Nuvem de Magalhães (LMC, do inglês Large Magellanic Cloud) é uma galáxia anã satélite da Via Láctea. É a segunda galáxia mais próxima da nossa galáxia', 7.0, 165, false, false);
INSERT INTO public.galaxy VALUES (3, 'Pequena Nuvem de Magalhães', 'Formato Inrregular', 'A Pequena Nuvem de Magalhães (NGC 292) é uma galáxia anã irregular que orbita a Via Láctea.', 7.0, 200, false, false);
INSERT INTO public.galaxy VALUES (4, 'Galáxia de Andrômeda', 'Espiral', 'É a galáxia mais próxima da Via Láctea e o objeto visível mais distante desta,', 2.5, 3, false, false);
INSERT INTO public.galaxy VALUES (5, 'Galáxia do Triângulo', 'Espiral', 'Galáxia do Triângulo: conhecida também como Messier 33, é uma galáxia em espiral que faz parte do Grupo Local.', 40.0, 3, false, false);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elíptica', 'Centaurus A, também conhecida como NGC 5128 [1], é uma galáxia elíptica peculiar de grande massa com um buraco negro supermassivo no seu centro.', 15.62, 4, false, false);


--
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.materials VALUES (1, 'ferro', 'ferroso', 'O ferro é um elemento químico metálico com o símbolo Fe, número atómico 26 e massa atómica 55,845.', NULL, 0, true, true, false, 1, 3, 1);
INSERT INTO public.materials VALUES (2, 'helio', 'gasos', 'O gás hélio (He) é um gás nobre, incolor, inodoro, não inflamável e não tóxico. É o primeiro gás nobre da Tabela Periódica, com o número atómico 2 e uma massa atómica de 4 u', NULL, 0, true, false, true, 1, 3, 1);
INSERT INTO public.materials VALUES (3, 'hidrogenio', 'gasos', 'O hidrogénio (H) é um gás incolor, inodoro, inflamável e não metálico que é sempre encontrado no estado gasoso à temperatura ambiente.', NULL, 1, true, false, false, 1, 3, 1);
INSERT INTO public.materials VALUES (4, 'oxigenio', 'gasos', 'O oxigénio (O2) é um gás incolor, inodoro e insípido que constitui cerca de 21% da atmosfera terrestre e é essencial para a vida na Terra.', NULL, 0, true, false, false, 1, 3, 1);
INSERT INTO public.materials VALUES (5, 'gas carbonico', 'gasos', 'O gás carbônico, também conhecido como dióxido de carbono (CO2), é um gás incolor, inodoro e mais pesado que o ar.', NULL, 0, true, false, false, 1, 3, 2);
INSERT INTO public.materials VALUES (6, 'rocha', 'rochosso', 'As rochas são agregados sólidos compostos por um ou mais minerais que formam a parte essencial da litosfera.', NULL, NULL, true, true, true, 1, 3, 2);
INSERT INTO public.materials VALUES (7, 'agua', 'liquido', 'A água é uma substância química incolor, insípida e inodora, composta por dois átomos de hidrogénio e um átomo de oxigénio (H2O).', NULL, 1, true, false, false, 1, 3, 4);
INSERT INTO public.materials VALUES (8, 'nitrogenio', 'liquido-gasoso', 'O nitrogénio (N) é um elemento químico com o número atómico 7 e a massa atómica 14,01.', NULL, 1, true, false, false, 1, 3, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lua', 'oval', 'A Lua é o único satélite natural da Terra[nota 1] e o quinto maior do Sistema Solar.', 4.46, 384, true, false, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Fobos', 'oval', 'Fobos ou Phobos é um dos dois satélites naturais de Marte.[1] É o maior e mais próximo satélite natural de Marte.', NULL, 78, true, false, NULL, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'oval', 'Deimos (em grego: terror),[1] é o menor e mais afastado dos dois satélites naturais de Marte. É, também, uma das menores luas do Sistema Solar.', NULL, 78, true, false, NULL, 4);
INSERT INTO public.moon VALUES (4, 'Lo', 'oval', 'Io é uma das quatro grandes luas[2] de Júpiter conhecidas por Luas de Galileu, em honra ao seu descobridor Galileu Galilei.[3].', NULL, 628, true, false, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'oval', 'Europa é uma das 79 luas do planeta gasoso Júpiter. Está entre as quatro maiores, com um diâmetro de 3121,6 km, sendo um pouco menor que a Lua terrestre.[7].', 180, 628, true, false, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Mimas', 'oval', 'Mimas, também designado Saturno I, é um satélite natural de Saturno, que possui uma das maiores crateras das luas do Sistema Solar, chamada Herschel.', 25, NULL, true, false, NULL, 6);
INSERT INTO public.moon VALUES (7, 'Encélado', 'oval', 'Encélado ou Enceladus[1][2][3] é o sexto maior satélite natural de Saturno.[4] Foi descoberto em 1789 por William Herschel.[5].', 100, 1, true, false, NULL, 6);
INSERT INTO public.moon VALUES (8, 'Tétis', 'oval', 'Tétis é um satélite natural de Saturno, também conhecido como Saturno III. Foi descoberto por Giovanni Cassini em 1684 e foi nomeado e tem o nome do titã Tétis da mitologia grega.[2].', NULL, 1, true, false, NULL, 6);
INSERT INTO public.moon VALUES (9, 'Ariel', 'oval', 'Ariel é um dos cinco satélites naturais (lua) do planeta Urano descoberto em 24 de outubro de 1851 por William Lassell. Ariel foi descoberto juntamente com uma outra lua de Urano, Umbriel.', NULL, NULL, true, false, NULL, 7);
INSERT INTO public.moon VALUES (10, 'Umbriel', 'oval', 'Umbriel é um dos cinco grandes satélites de Urano, com um diâmetro de 1 170 km. Foi descoberto junto com Ariel em 24 de outubro de 1851, por William Lassell, e recebeu o nome de um personagem do poema de Alexander Pope The Rape of the Lock.', NULL, NULL, true, false, NULL, 7);
INSERT INTO public.moon VALUES (11, 'Titânia', 'oval', 'Titânia é o maior satélite de Urano e o oitavo maior do Sistema Solar, com um diâmetro de 1 578 km. Foi descoberto por William Herschel em 1787 e recebeu o nome da rainha das fadas da obra de Shakespeare Sonho de uma Noite de Verão.', NULL, 3, true, false, NULL, 7);
INSERT INTO public.moon VALUES (12, 'Tritão', 'oval', 'Tritão é o maior satélite natural de Neptuno. Descoberto pelo astrônomo inglês William Lassell em 1846, deve seu nome ao deus Tritão da mitologia grega', NULL, 4, false, false, NULL, 8);
INSERT INTO public.moon VALUES (14, 'Naiade', 'oval', 'Náiade é um pequeno satélite natural do planeta Neptuno cujo diâmetro irregular é de 96×60×52 km. Foi descoberto pela sonda Voyager 2 em setembro de 1989.', NULL, NULL, true, false, NULL, 8);
INSERT INTO public.moon VALUES (15, 'Caronte', 'oval', 'Caronte forma junto com Plutão um sistema de astros duplos (rotação síncrona), descoberto por James Walter Christy em 22 de junho de 1978. É mais conhecido como um satélite natural de Plutão.', NULL, NULL, true, false, NULL, 9);
INSERT INTO public.moon VALUES (16, 'Nix', 'oval', 'Nix é um satélite natural de Plutão. Ele foi descoberto junto com Hidra em junho de 2005 e foi visitada pela sonda espacial New Horizons em julho de 2015, após uma viagem de 9 anos pelo sistema solar.', NULL, NULL, true, false, NULL, 9);
INSERT INTO public.moon VALUES (17, 'Hidra', 'oval', 'Hidra é um satélite natural de Plutão. Ela foi descoberta juntamente com Nix em junho de 2005, pela Equipe de Busca de Plutão do telescópio espacial Hubble, composta por Hal A. Weaver, S. Alan Stern, Max J. Mutchler, Andrew J. Steffl, Marc W. Buie, William J. Merline, John R. Spencer, Eliot F. Young e Leslie A. Young.[3].', NULL, NULL, true, false, NULL, 9);
INSERT INTO public.moon VALUES (18, 'Cérbero', 'oval', 'Cérbero, antigamente, S/2011 (134340) 1 (ainda chamado de S/2011 P 1 e P4) é um satélite natural de Plutão.[1] Foi descoberto pelo Telescópio Espacial Hubble em 28 de junho de 2011 e anunciado em 20 de julho de 2011.[2]', NULL, NULL, true, false, NULL, 9);
INSERT INTO public.moon VALUES (19, 'Hiiaka', 'oval', 'Hiʻiaka, também conhecido como Haumea I, é a maior lua do planeta-anão e plutoide Haumea (há duas luas de Haumea: Hiʻiaka e Namaka). Sua designação provisional foi S/2005 (2003 EL61) 1.', NULL, 6, false, false, NULL, 10);
INSERT INTO public.moon VALUES (20, 'Namaka', 'oval', 'Namaka, ou Haumea II, é o menor satélite natural do planeta-anão Haumea (há duas luas em Haumea: Namaka e Hiʻiaka). Sua designação provisória foi S/2005 (2003 EL61) 2. Ele foi nomeado de Namaka, uma das filhas de Haumea, uma divindade havaiana.', NULL, NULL, false, false, NULL, 10);
INSERT INTO public.moon VALUES (21, 'Disnomia', 'oval', 'Disnomia é o único satélite natural de Éris e o segundo maior que orbita um planeta anão, só atrás de Caronte, a maior lua de Plutão.[5] O nome Disnomia se refere a filha de Éris na mitologia um espírito que personificava a ilegalidade.', NULL, NULL, false, false, NULL, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercúrio', 'Rochoso', 'Mercúrio é o planeta mais próximo do Sol. Mercúrio é um planeta que não possui uma inclinação semelhante à da Terra. Sem essa inclinação e com uma translação curta, não há existência de estações do ano.', 4.0, 77, true, false, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Vênus', 'Rochoso', 'O planeta Vênus é o segundo do nosso sistema solar a partir do Sol e o mais próximo da Terra, a apenas 61 milhões de quilômetros de distância.', 4.503, 261, true, false, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Terra', 'Rochoso', 'O planeta Terra é o planeta habitado por nós, seres vivos. Conhecido também como planeta água, é o maior dentre os quatro planetas rochosos que fazem parte do Sistema Solar.', 4.543, NULL, true, true, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Marte', 'Rochoso', 'Marte é o quarto planeta do Sistema Solar, ficando entre a Terra e Júpiter. A 227 milhões de km do Sol, é um planeta formado por superfície rochosa e atmosfera rica em CO2.', 4.603, 401, true, false, NULL, 2);
INSERT INTO public.planet VALUES (5, 'Júpter', 'Gasoso', 'Júpiter é um gigante gasoso e o maior planeta do Sistema Solar. Júpiter é o quinto planeta do Sistema Solar a partir do Sol.', 4.603, 965, true, false, NULL, 3);
INSERT INTO public.planet VALUES (6, 'Saturno', 'Gasoso', 'Saturno é o segundo maior planeta do Sistema Solar, com 9 vezes o tamanho da Terra. Está relativamente distante do Sol.', 4.503, 2, true, false, NULL, 4);
INSERT INTO public.planet VALUES (7, 'Urano', 'Gasoso', 'Urano é o terceiro maior planeta do Sistema Solar, localizado entre Saturno e Netuno e a sétima planeta a partir do Sol. É um planeta gasoso, composto principalmente por hidrogénio e hélio, e tem uma coloração azul-esverdeada devido à fusão dos gases da sua atmosfera.', 4.503, 3, true, false, NULL, 5);
INSERT INTO public.planet VALUES (8, 'Netuno', 'Gasoso', 'Netuno é o oitavo planeta do Sistema Solar a partir do Sol e o mais distante deste. Dispõe de coloração azulada e é formado essencialmente por gases, como o metano.', 4.5, 5, true, false, NULL, 6);
INSERT INTO public.planet VALUES (9, 'Plutão', 'Anão', 'Plutão é um planeta anão do sistema solar, sendo um dos astros mais distantes do sol e um dos menos influenciados por ele, com uma distância equivalente a cerca de 6 bilhões de anos dessa estrela.', 4, 6, true, false, NULL, 7);
INSERT INTO public.planet VALUES (10, 'Haumea', 'Anão', 'Haumea é o terceiro planeta anão mais próximo do Sol (após Ceres e Plutão). Ele é o objeto que possui a rotação mais rápida do nosso Sistema Solar, completando uma volta ao redor de si em apenas quatro horas.', NULL, 43, true, false, NULL, 8);
INSERT INTO public.planet VALUES (11, 'Makemake', 'Anão', 'Makemake é o planeta anão seguinte e também está localizado no cinturão de Kuiper. Ele é o segundo objeto mais brilhante do cinturão.', 5.7, 6, true, false, NULL, 9);
INSERT INTO public.planet VALUES (12, 'Éris', 'Anão', 'Eris é um planeta-anão descoberto em 2003. Massa: 1,6x1022 kg. Raio: 1.163 km. Distância do Sol: 10.125.000.000 km.', NULL, 15, true, false, NULL, 10);
INSERT INTO public.planet VALUES (13, 'Sedna', 'Anão', 'Planeta ou planetóide, como Brown e seus colegas preferem chamar esses objetos, Sedna é um mundo interessante. Segundo os astrônomos, é o objeto mais avermelhado já encontrado no Sistema Solar, depois de Marte.', NULL, 150, true, false, NULL, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'anã amarela', 'O Sol (do latim sol, solis[12]) é a estrela central do Sistema Solar. Todos os outros corpos do Sistema Solar, como planetas, planetas anões, asteroides, cometas e poeira, bem como todos os satélites associados a estes corpos, giram ao seu redor.', 5, 8, true, false, NULL, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'tipo A', 'Sírio, também chamada de Sirius, α CMa, α Canis Majoris ou alpha Canis Majoris (latim: Alfa do Cão Maior) é a estrela mais brilhante do céu noturno visível a olho nu, com uma magnitude aparente de −1,46. Localizada na constelação do Cão Maior, pode ser vista a partir de qualquer ponto na Terra.', 23, 9, true, false, NULL, 1);
INSERT INTO public.star VALUES (3, 'Canopus', 'supergigante vermelha', 'Canopus[5] (pronunciação (PE) no AFI: /kɐnopu/) ou Canopeia[6] (FO 1943: Canopéia) (Canopus, α Car, α Carinae, Alpha Carinae) é a estrela mais brilhante da constelação de Carina e a segunda estrela mais brilhante no céu, com a magnitude aparente de −0,72.', 40, 310, false, false, NULL, 2);
INSERT INTO public.star VALUES (4, 'Alpha Centauri ', 'anã amarela', NULL, 6.8, 310, false, false, NULL, 2);
INSERT INTO public.star VALUES (5, 'Arcturus', 'primeira grandeza', 'Arcturo (α Boo, α Boötis, Alpha Boötis), também conhecida como Arturo ou Arcturus,[6] é a estrela mais brilhante da constelação do Boieiro. É a quarta estrela mais brilhante no céu nocturno.[7]', 7.1, 37, true, false, NULL, 3);
INSERT INTO public.star VALUES (6, 'Vega', 'tipo A', 'Vega (α Lyr, α Lyrae, Alpha Lyrae), é a estrela mais brilhante da constelação de Lira e a quinta estrela mais brilhante do céu noturno. Ela está separada do nosso sistema solar por 25 anos-luz, o que a torna uma das estrelas mais próximas do nosso Sol.[3] Vega forma com Altair e Deneb o chamado Triângulo de Verão.[4]', 13, 25, true, false, NULL, 6);
INSERT INTO public.star VALUES (7, 'Capella', 'Auriga ou O Cocheiro', NULL, 650, 43, false, false, NULL, 5);
INSERT INTO public.star VALUES (8, 'Rigel', 'supergigante azul', 'Rígel (Rigel, β Ori, β Orionis, Beta Orionis) é a estrela mais brilhante da constelação de Orion, e a sétima mais brilhante do céu,[3] com magnitude aparente 0,12. Apesar de ter a designação de Bayer "beta", ela quase sempre é mais brilhante que Betelgeuse (Alpha Orionis).', 10, 864, false, false, NULL, 4);
INSERT INTO public.star VALUES (9, 'Procyon', 'classe F', NULL, 11.44, 11, true, false, NULL, 3);
INSERT INTO public.star VALUES (10, 'Achernar', 'branco azulada', NULL, 9.46, 140, true, true, NULL, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: materials_materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.materials_materials_id_seq', 1, false);


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
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: materials materials_materials_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_materials_id_key UNIQUE (materials_id);


--
-- Name: materials materials_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (materials_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: materials materials_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: materials materials_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: materials materials_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

