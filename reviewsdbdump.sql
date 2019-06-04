--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 11.3

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

SET default_with_oids = false;

--
-- Name: hosts; Type: TABLE; Schema: public; Owner: cj
--

CREATE TABLE public.hosts (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    "hostUrl" text,
    "dateJoined" date,
    language character varying(255),
    "responseRate" character varying(255),
    "responseTime" character varying(255)
);


ALTER TABLE public.hosts OWNER TO cj;

--
-- Name: hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: cj
--

CREATE SEQUENCE public.hosts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hosts_id_seq OWNER TO cj;

--
-- Name: hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cj
--

ALTER SEQUENCE public.hosts_id_seq OWNED BY public.hosts.id;


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: cj
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.knex_migrations OWNER TO cj;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: cj
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_id_seq OWNER TO cj;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cj
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: cj
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


ALTER TABLE public.knex_migrations_lock OWNER TO cj;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: cj
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_lock_index_seq OWNER TO cj;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cj
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- Name: listings; Type: TABLE; Schema: public; Owner: cj
--

CREATE TABLE public.listings (
    id integer NOT NULL,
    title character varying(255),
    description character varying(255),
    city character varying(255),
    state character varying(255),
    country character varying(255),
    cost numeric(8,2),
    capacity integer,
    type character varying(255),
    bedrooms integer,
    beds integer,
    baths integer,
    "photoUrl" text,
    host_id integer
);


ALTER TABLE public.listings OWNER TO cj;

--
-- Name: listings_id_seq; Type: SEQUENCE; Schema: public; Owner: cj
--

CREATE SEQUENCE public.listings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.listings_id_seq OWNER TO cj;

--
-- Name: listings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cj
--

ALTER SEQUENCE public.listings_id_seq OWNED BY public.listings.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: cj
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    text text,
    date date,
    user_id integer,
    listing_id integer
);


ALTER TABLE public.reviews OWNER TO cj;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: cj
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO cj;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cj
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: cj
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255),
    "photoUrl" text
);


ALTER TABLE public.users OWNER TO cj;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: cj
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO cj;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cj
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: hosts id; Type: DEFAULT; Schema: public; Owner: cj
--

ALTER TABLE ONLY public.hosts ALTER COLUMN id SET DEFAULT nextval('public.hosts_id_seq'::regclass);


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: cj
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: cj
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- Name: listings id; Type: DEFAULT; Schema: public; Owner: cj
--

ALTER TABLE ONLY public.listings ALTER COLUMN id SET DEFAULT nextval('public.listings_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: cj
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: cj
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: hosts; Type: TABLE DATA; Schema: public; Owner: cj
--

COPY public.hosts (id, name, description, "hostUrl", "dateJoined", language, "responseRate", "responseTime") FROM stdin;
1	Linwood Padberg	I moved to the city to pursue a career in opera and other creative endevors. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Y6N_w94x8ik.jpeg	2018-10-15	\N	39%	1 hours
2	April Wolff	I am a professional Dancer. I am addicted to travel and fine dinning. Please don't hesitate to reach out with any questions regarding the property.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_v6771a4avV4.jpeg	2019-01-13	\N	53%	7 hours
3	Alivia Bruen	I work as a lawyer for a small, private firm. I love traveling and meeting people from all over the world. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg	2018-06-10	\N	37%	17 hours
4	Stefan Wilkinson	I work as a lawyer for a small, private firm. I am passionate about design and architecture. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg	2018-06-08	\N	93%	39 hours
5	Abigayle Runte	I am a professional Dancer. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg	2018-11-30	\N	67%	41 hours
6	Floy Kuvalis	I am a recent university graduate working in Web Development. I am passionate about design and architecture. Please don't hesitate to reach out with any questions regarding the property.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg	2019-04-08	\N	64%	15 hours
7	Dixie Smith	I am a professional Dancer. I love traveling and meeting people from all over the world. Please don't hesitate to reach out with any questions regarding the property.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225__t_EMqrNzi0.jpeg	2018-10-09	\N	38%	26 hours
8	Elian Nader	I am originally from Canada, but went to university in the UK. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg	2018-06-02	\N	61%	1 hours
9	Margret Runolfsson	I work as a lawyer for a small, private firm. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg	2019-01-10	\N	26%	1 hours
10	Furman Considine	I am a professional Dancer. I love traveling and meeting people from all over the world. Looking foward to meeting new people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg	2018-09-24	\N	50%	24 hours
11	Sonia Upton	I work in advertising and marketing for an international firm. I am addicted to travel and fine dinning.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_ufWjkFmTNXo.jpeg	2019-01-11	\N	92%	17 hours
12	Manley Terry	I work in advertising and marketing for an international firm. I am addicted to travel and fine dinning.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Y6N_w94x8ik.jpeg	2018-10-04	\N	66%	42 hours
13	Jamie Lubowitz	I am a recent university graduate working in Web Development. My passion is putting together beautiful living spaces.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg	2018-09-20	\N	51%	26 hours
14	Stephen Gutmann	I work in advertising and marketing for an international firm. My passion is putting together beautiful living spaces.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg	2018-06-14	\N	29%	47 hours
15	Everett O'Keefe	I am a recent university graduate working in Web Development. My passion is putting together beautiful living spaces. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg	2018-06-12	\N	84%	11 hours
16	Bradly Grimes	I am a professional Dancer. I love traveling and meeting people from all over the world. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_v6771a4avV4.jpeg	2019-03-06	\N	95%	38 hours
17	Haven Windler	I work as a lawyer for a small, private firm. I am passionate about design and architecture.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg	2018-08-02	\N	56%	30 hours
18	Myrtice Hermiston	I am a recent university graduate working in Web Development. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg	2018-07-05	\N	71%	9 hours
19	Tressie Dickens	I work as a lawyer for a small, private firm. I am addicted to travel and fine dinning. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_gtpm-tiTr9U.jpeg	2018-06-27	\N	67%	45 hours
20	Oral Rogahn	I am a professional Dancer. My passion is putting together beautiful living spaces.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_bVPtaf-8jI8.jpeg	2018-11-30	\N	28%	46 hours
21	Jerrod Daniel	I work as a lawyer for a small, private firm. I love traveling and meeting people from all over the world. Looking foward to meeting new people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg	2018-11-16	\N	86%	6 hours
22	Jamison Brekke	I am a recent university graduate working in Web Development. I am passionate about design and architecture.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_j7Z-XUHHN40.jpeg	2019-02-26	\N	36%	46 hours
23	Jamel Ondricka	I work as a lawyer for a small, private firm. I am addicted to travel and fine dinning.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_koE9TOrYrgo.jpeg	2018-10-01	\N	59%	2 hours
24	Lucius Anderson	I am a professional Dancer. I am addicted to travel and fine dinning.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_myggK4JQdLI.jpeg	2018-07-26	\N	52%	47 hours
25	Herman O'Conner	I work as a lawyer for a small, private firm. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_bVPtaf-8jI8.jpeg	2018-11-17	\N	85%	23 hours
26	Therese Lang	I work in advertising and marketing for an international firm. I am passionate about design and architecture. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_qDs5alqjJAk.jpeg	2019-03-07	\N	35%	13 hours
27	Berniece Ledner	I work as a lawyer for a small, private firm. My passion is putting together beautiful living spaces.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg	2018-08-07	\N	80%	42 hours
28	Eric Thiel	I moved to the city to pursue a career in opera and other creative endevors. I love traveling and meeting people from all over the world. Please don't hesitate to reach out with any questions regarding the property.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_koE9TOrYrgo.jpeg	2018-12-10	\N	58%	37 hours
29	Ceasar Windler	I work as a lawyer for a small, private firm. My passion is putting together beautiful living spaces.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_yki80w96VZ0.jpeg	2019-05-24	\N	77%	32 hours
31	Ernestina Stoltenberg	I am a professional Dancer. I am addicted to travel and fine dinning.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg	2018-06-27	\N	41%	19 hours
30	Janae Nienow	I moved to the city to pursue a career in opera and other creative endevors. I am passionate about design and architecture. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg	2019-01-24	\N	42%	1 hours
41	Oceane Runolfsson	I am a recent university graduate working in Web Development. I am addicted to travel and fine dinning. Please don't hesitate to reach out with any questions regarding the property.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg	2019-03-28	\N	71%	2 hours
51	Aron Kautzer	I moved to the city to pursue a career in opera and other creative endevors. My passion is putting together beautiful living spaces. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg	2018-08-02	\N	62%	29 hours
61	Rebeca Jaskolski	I am a recent university graduate working in Web Development. I am addicted to travel and fine dinning.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_v6771a4avV4.jpeg	2018-08-20	\N	32%	46 hours
71	Allan Rau	I am a recent university graduate working in Web Development. I am passionate about design and architecture.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg	2018-11-29	\N	72%	11 hours
81	Cora Smitham	I am a professional Dancer. I am passionate about design and architecture.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg	2018-10-04	\N	40%	13 hours
91	Reuben Larson	I am a professional Dancer. I am addicted to travel and fine dinning. Looking foward to meeting new people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg	2018-08-22	\N	58%	26 hours
32	Martina O'Hara	I am a professional Dancer. I am addicted to travel and fine dinning. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_koE9TOrYrgo.jpeg	2019-05-22	\N	51%	18 hours
42	Naomi Haag	I am originally from Canada, but went to university in the UK. I am passionate about design and architecture. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225__t_EMqrNzi0.jpeg	2019-05-03	\N	41%	29 hours
52	Adrienne Smith	I moved to the city to pursue a career in opera and other creative endevors. I am addicted to travel and fine dinning. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg	2019-05-27	\N	68%	21 hours
62	Perry Hammes	I work in advertising and marketing for an international firm. My passion is putting together beautiful living spaces. Please don't hesitate to reach out with any questions regarding the property.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_m663zRzRe40.jpeg	2019-02-20	\N	56%	36 hours
72	Alexane O'Connell	I am a recent university graduate working in Web Development. My passion is putting together beautiful living spaces. Looking foward to meeting new people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg	2018-07-19	\N	37%	18 hours
82	Candelario O'Keefe	I am a recent university graduate working in Web Development. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg	2019-04-16	\N	48%	19 hours
92	Melissa Durgan	I work in advertising and marketing for an international firm. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_v6771a4avV4.jpeg	2019-01-13	\N	63%	19 hours
33	Jacquelyn Towne	I am originally from Canada, but went to university in the UK. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg	2018-07-29	\N	51%	39 hours
43	Robyn Bergnaum	I work in advertising and marketing for an international firm. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg	2018-08-23	\N	71%	42 hours
53	Nadia Dibbert	I am a recent university graduate working in Web Development. I am passionate about design and architecture. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_gtpm-tiTr9U.jpeg	2018-12-19	\N	39%	36 hours
63	Emmet Ullrich	I work in advertising and marketing for an international firm. I am passionate about design and architecture.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_ZxG76-UM6w0.jpeg	2019-01-20	\N	48%	14 hours
73	Whitney D'Amore	I am a professional Dancer. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_ufWjkFmTNXo.jpeg	2018-12-24	\N	45%	35 hours
83	Emil Hudson	I moved to the city to pursue a career in opera and other creative endevors. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_aLT-JhaNqIU.jpeg	2019-04-16	\N	94%	19 hours
93	Shanny Parker	I moved to the city to pursue a career in opera and other creative endevors. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg	2018-11-14	\N	51%	11 hours
34	Duane Schmeler	I am a professional Dancer. My passion is putting together beautiful living spaces. Looking foward to meeting new people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_j7Z-XUHHN40.jpeg	2018-10-11	\N	44%	25 hours
44	Esther Smitham	I am a professional Dancer. I love traveling and meeting people from all over the world. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_myggK4JQdLI.jpeg	2018-06-17	\N	27%	19 hours
54	Ramon Dickens	I am a professional Dancer. I am addicted to travel and fine dinning. Looking foward to meeting new people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_yki80w96VZ0.jpeg	2018-06-08	\N	26%	46 hours
64	Jeffery Crona	I moved to the city to pursue a career in opera and other creative endevors. My passion is putting together beautiful living spaces. Please don't hesitate to reach out with any questions regarding the property.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_qDs5alqjJAk.jpeg	2018-07-01	\N	91%	8 hours
74	Marta Fadel	I am a recent university graduate working in Web Development. My passion is putting together beautiful living spaces.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg	2019-05-09	\N	97%	22 hours
84	Antonio Hamill	I moved to the city to pursue a career in opera and other creative endevors. I am addicted to travel and fine dinning.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_v6771a4avV4.jpeg	2019-05-09	\N	28%	26 hours
94	Shaun Borer	I moved to the city to pursue a career in opera and other creative endevors. My passion is putting together beautiful living spaces. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg	2018-12-05	\N	50%	39 hours
35	Rico Blick	I moved to the city to pursue a career in opera and other creative endevors. I love traveling and meeting people from all over the world. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg	2018-07-15	\N	78%	33 hours
45	Shanelle Wintheiser	I moved to the city to pursue a career in opera and other creative endevors. My passion is putting together beautiful living spaces. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_v6771a4avV4.jpeg	2019-05-22	\N	59%	36 hours
55	Samara Grady	I work in advertising and marketing for an international firm. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_myggK4JQdLI.jpeg	2018-08-06	\N	78%	17 hours
65	Randi Kshlerin	I work in advertising and marketing for an international firm. I am passionate about design and architecture.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg	2019-03-22	\N	53%	33 hours
75	Aletha Hane	I am originally from Canada, but went to university in the UK. I love traveling and meeting people from all over the world. Please don't hesitate to reach out with any questions regarding the property.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_myggK4JQdLI.jpeg	2018-10-15	\N	79%	25 hours
85	Wellington Haley	I am a professional Dancer. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_aLT-JhaNqIU.jpeg	2019-02-23	\N	62%	27 hours
95	Aurelio O'Connell	I am originally from Canada, but went to university in the UK. I am addicted to travel and fine dinning.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg	2018-09-06	\N	34%	5 hours
36	Jared Durgan	I am originally from Canada, but went to university in the UK. My passion is putting together beautiful living spaces. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg	2019-01-22	\N	91%	20 hours
46	Samara Lang	I am a professional Dancer. I love traveling and meeting people from all over the world. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg	2019-03-18	\N	81%	34 hours
56	Larue Cronin	I work as a lawyer for a small, private firm. I am addicted to travel and fine dinning. Looking foward to meeting new people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg	2018-10-04	\N	87%	29 hours
66	Chanelle Koch	I am originally from Canada, but went to university in the UK. I am passionate about design and architecture. Looking foward to meeting new people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_bVPtaf-8jI8.jpeg	2018-09-07	\N	80%	7 hours
76	Garth Nikolaus	I moved to the city to pursue a career in opera and other creative endevors. I am passionate about design and architecture. Please don't hesitate to reach out with any questions regarding the property.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225__t_EMqrNzi0.jpeg	2019-05-10	\N	83%	18 hours
86	Hailee Buckridge	I am a professional Dancer. My passion is putting together beautiful living spaces.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_gtpm-tiTr9U.jpeg	2018-08-07	\N	26%	44 hours
96	Lexie Gulgowski	I work in advertising and marketing for an international firm. I am addicted to travel and fine dinning. Looking foward to meeting new people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_m663zRzRe40.jpeg	2018-07-04	\N	38%	48 hours
37	Ruby Marvin	I work as a lawyer for a small, private firm. My passion is putting together beautiful living spaces.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg	2019-05-23	\N	64%	32 hours
47	Velva Gaylord	I am a professional Dancer. I love traveling and meeting people from all over the world. Looking foward to meeting new people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_j7Z-XUHHN40.jpeg	2019-02-23	\N	80%	25 hours
57	Anya Gutmann	I work as a lawyer for a small, private firm. I am passionate about design and architecture.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_r3pqFjVmrQU.jpeg	2019-05-25	\N	48%	7 hours
67	Anissa Gorczany	I work in advertising and marketing for an international firm. I am passionate about design and architecture.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg	2018-10-20	\N	45%	1 hours
77	Jon Sawayn	I moved to the city to pursue a career in opera and other creative endevors. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225__t_EMqrNzi0.jpeg	2018-11-09	\N	97%	20 hours
87	Ola Witting	I am a professional Dancer. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_j7Z-XUHHN40.jpeg	2018-11-04	\N	82%	12 hours
97	Rozella Schmitt	I am originally from Canada, but went to university in the UK. I am passionate about design and architecture. Looking foward to meeting new people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg	2018-06-15	\N	83%	12 hours
38	Halle Maggio	I am originally from Canada, but went to university in the UK. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg	2019-02-08	\N	66%	8 hours
48	Tamia Lubowitz	I work as a lawyer for a small, private firm. I am addicted to travel and fine dinning.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg	2019-04-18	\N	32%	12 hours
58	Alison Bahringer	I am a recent university graduate working in Web Development. I am passionate about design and architecture.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Y6N_w94x8ik.jpeg	2019-01-17	\N	49%	39 hours
68	Dolores Corwin	I am a recent university graduate working in Web Development. My passion is putting together beautiful living spaces.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg	2019-05-07	\N	57%	9 hours
78	Deangelo Lowe	I work in advertising and marketing for an international firm. I am passionate about design and architecture. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_bVPtaf-8jI8.jpeg	2019-01-30	\N	28%	48 hours
88	Destiney Rodriguez	I am originally from Canada, but went to university in the UK. My passion is putting together beautiful living spaces.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_r3pqFjVmrQU.jpeg	2019-05-30	\N	92%	45 hours
98	Stacey Franecki	I am originally from Canada, but went to university in the UK. I am addicted to travel and fine dinning. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_v6771a4avV4.jpeg	2018-12-22	\N	26%	15 hours
39	Wilfrid Dibbert	I work in advertising and marketing for an international firm. I am addicted to travel and fine dinning. Looking foward to meeting new people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_yki80w96VZ0.jpeg	2019-01-23	\N	52%	44 hours
49	Eveline Bednar	I am a recent university graduate working in Web Development. I am addicted to travel and fine dinning.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_koE9TOrYrgo.jpeg	2019-03-07	\N	87%	13 hours
59	Harmony Jerde	I work as a lawyer for a small, private firm. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_qDs5alqjJAk.jpeg	2018-06-22	\N	57%	10 hours
69	Coleman Hayes	I am a recent university graduate working in Web Development. I am passionate about design and architecture. Please don't hesitate to reach out with any questions regarding the property.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_myggK4JQdLI.jpeg	2018-12-01	\N	94%	7 hours
79	Alexandria Pfannerstill	I am originally from Canada, but went to university in the UK. I am addicted to travel and fine dinning.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg	2018-11-16	\N	50%	3 hours
89	Jaunita Sipes	I moved to the city to pursue a career in opera and other creative endevors. I am passionate about design and architecture. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_m663zRzRe40.jpeg	2018-11-03	\N	72%	46 hours
99	Julie Crist	I work as a lawyer for a small, private firm. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg	2019-02-08	\N	36%	11 hours
40	Craig Lockman	I moved to the city to pursue a career in opera and other creative endevors. I love traveling and meeting people from all over the world.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg	2019-04-21	\N	34%	30 hours
50	Lamont Blanda	I am a recent university graduate working in Web Development. My passion is putting together beautiful living spaces.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg	2018-11-15	\N	92%	41 hours
60	Ramona Goyette	I am a professional Dancer. My passion is putting together beautiful living spaces. Please don't hesitate to reach out with any questions regarding the property.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg	2018-09-19	\N	87%	5 hours
70	Mable Smitham	I work as a lawyer for a small, private firm. My passion is putting together beautiful living spaces.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_r3pqFjVmrQU.jpeg	2018-10-06	\N	100%	38 hours
80	Freddie Gibson	I moved to the city to pursue a career in opera and other creative endevors. I am passionate about design and architecture.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_gtpm-tiTr9U.jpeg	2018-09-12	\N	49%	1 hours
90	Violette Koepp	I am a professional Dancer. I am passionate about design and architecture. I am excited to make you love this place as much as I do.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_yki80w96VZ0.jpeg	2018-10-31	\N	98%	4 hours
100	Brian Feil	I am a recent university graduate working in Web Development. I am addicted to travel and fine dinning.	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225__t_EMqrNzi0.jpeg	2019-04-11	\N	91%	11 hours
\.


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: cj
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
8	20190516195106_airbnb_clone.js	1	2019-05-31 10:41:46.1-06
\.


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: cj
--

COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- Data for Name: listings; Type: TABLE DATA; Schema: public; Owner: cj
--

COPY public.listings (id, title, description, city, state, country, cost, capacity, type, bedrooms, beds, baths, "photoUrl", host_id) FROM stdin;
1	Let yourself be enlightened with this Penthouse with breathtaking views of the mountains	A lovely place to stay in the middle of the woods.	New Elinorville	Connecticut	Uganda	204.00	1	apartment	3	5	8	https://s3.amazonaws.com/airbnbcloneinteriorphotos/GmEUEyISvd8.jpg	1
2	Unwind in a Stylish Loft in Chic neighborhood	A delightful place to stay a short walk from the beach.	Lake Ernestland	Florida	China	189.00	1	villa	2	1	2	https://s3.amazonaws.com/airbnbcloneinteriorphotos/C_dRtsnBOQA.jpg	2
3	Bright Artist's studio	A scenic place to stay in the middle of the woods.	East Jedediah	Montana	Slovakia (Slovak Republic)	495.00	1	house	11	7	4	https://s3.amazonaws.com/airbnbcloneinteriorphotos/dJrIcUp4kcA.jpg	3
4	Let yourself be enlightened with this Penthouse with breathtaking views of the mountains	A beautiful place to stay in the heart of downtown.	Schustertown	South Carolina	Trinidad and Tobago	457.00	1	villa	9	4	6	https://s3.amazonaws.com/airbnbcloneinteriorphotos/6viJObrmnBw.jpg	4
5	Stunning Artist's studio	A delightful place to stay in the heart of downtown.	Kshlerinmouth	Michigan	Georgia	121.00	1	apartment	4	12	3	https://s3.amazonaws.com/airbnbcloneinteriorphotos/YFQGWKW33Ck.jpg	5
6	Charming Artist's studio	A delightful place to stay in the heart of downtown.	Miafurt	Arkansas	Georgia	147.00	1	house	11	9	5	https://s3.amazonaws.com/airbnbcloneinteriorphotos/Wv65tpVIdDg.jpg	6
7	Stunning Townhouse with terrace	A beautiful place to stay at a seculeded location.	Crookshaven	Kansas	Guadeloupe	342.00	1	house	4	8	3	https://s3.amazonaws.com/airbnbcloneinteriorphotos/hAh4Unn50gk.jpg	7
8	Bright Artist's studio	A delightful place to stay in the middle of the woods.	Kuvalisview	Minnesota	Montserrat	380.00	1	townhouse	10	7	5	https://s3.amazonaws.com/airbnbcloneinteriorphotos/I4ecJKp3eFw.jpg	8
9	Immaculate Architect's Mediterranean style apartment near the beach	A lovely place to stay a short walk from the beach.	West Sylvestermouth	Maine	Fiji	469.00	1	house	2	9	2	https://s3.amazonaws.com/airbnbcloneinteriorphotos/QGehbt2b6iQ.jpg	9
10	Admire Stunning Ocean Views from a Stylish Loft in Chic neighborhood	A delightful place to stay at a seculeded location.	Ryleechester	Louisiana	Germany	480.00	1	townhouse	9	3	7	https://s3.amazonaws.com/airbnbcloneinteriorphotos/6viJObrmnBw.jpg	10
11	Stunning Stylish Loft in Chic neighborhood	A lovely place to stay in the heart of downtown.	Jessefort	Utah	Yemen	297.00	1	loft	10	1	10	https://s3.amazonaws.com/airbnbcloneinteriorphotos/nK0d-oyOyhc.jpg	11
12	Bright Stylish Loft in Chic neighborhood	A delightful place to stay in the middle of the woods.	Port Sofia	North Dakota	Faroe Islands	94.00	1	villa	9	8	8	https://s3.amazonaws.com/airbnbcloneinteriorphotos/b37mDyPzdJM.jpg	12
13	Unwind in a Mediterranean style apartment near the beach	A beautiful place to stay at a seculeded location.	Keenanbury	North Carolina	Malaysia	182.00	1	apartment	10	4	2	https://s3.amazonaws.com/airbnbcloneinteriorphotos/UXFJ-6Zj27M.jpg	13
14	Unwind in a Stylish Loft in Chic neighborhood	A beautiful place to stay in the heart of downtown.	Kihnport	Hawaii	Bahrain	360.00	1	house	10	11	9	https://s3.amazonaws.com/airbnbcloneinteriorphotos/QGehbt2b6iQ.jpg	14
15	Modern Mediterranean style apartment near the beach	A beautiful place to stay at a seculeded location.	Phoebeland	New Hampshire	Australia	336.00	1	villa	8	2	2	https://s3.amazonaws.com/airbnbcloneinteriorphotos/zfgVn46-xJw.jpg	15
16	Stunning Stylish Loft in Chic neighborhood	A scenic place to stay at a seculeded location.	Port Alyson	Pennsylvania	Liechtenstein	441.00	1	apartment	5	1	10	https://s3.amazonaws.com/airbnbcloneinteriorphotos/nK0d-oyOyhc.jpg	16
17	Vintage Artist's studio	A scenic place to stay in the heart of downtown.	Tellyville	Wisconsin	Ecuador	393.00	1	apartment	1	1	8	https://s3.amazonaws.com/airbnbcloneinteriorphotos/zfgVn46-xJw.jpg	17
18	Modern Penthouse with breathtaking views of the mountains	A delightful place to stay a short walk from the beach.	Oberbrunnerfort	Georgia	Armenia	327.00	1	loft	2	10	4	https://s3.amazonaws.com/airbnbcloneinteriorphotos/YFQGWKW33Ck.jpg	18
19	Take a magic stroll through the city from this Penthouse with breathtaking views of the mountains	A scenic place to stay a short walk from the beach.	Timothyhaven	Idaho	Antigua and Barbuda	177.00	1	house	9	12	3	https://s3.amazonaws.com/airbnbcloneinteriorphotos/I4ecJKp3eFw.jpg	19
20	Admire Stunning Ocean Views from a Studio apartment minutes from downtown	A beautiful place to stay a short walk from the beach.	Jordonville	Maryland	Barbados	398.00	1	villa	9	8	5	https://s3.amazonaws.com/airbnbcloneinteriorphotos/F68K6buOR2s.jpg	20
21	Bright Townhouse with terrace	A beautiful place to stay in the heart of downtown.	Janiyaland	Indiana	Macao	346.00	1	apartment	1	1	6	https://s3.amazonaws.com/airbnbcloneinteriorphotos/hAh4Unn50gk.jpg	21
22	Immaculate Architect's Stylish Loft in Chic neighborhood	A lovely place to stay in the heart of downtown.	Port Alyciachester	New Jersey	Guatemala	190.00	1	townhouse	3	4	5	https://s3.amazonaws.com/airbnbcloneinteriorphotos/dAAk8Aqd_-I.jpg	22
23	Stunning Townhouse with terrace	A lovely place to stay at a seculeded location.	Myronchester	Georgia	United Kingdom	493.00	1	loft	11	2	5	https://s3.amazonaws.com/airbnbcloneinteriorphotos/FqqiAvJejto.jpg	23
24	Modern Mediterranean style apartment near the beach	A lovely place to stay in the heart of downtown.	Traceyhaven	West Virginia	Mozambique	331.00	1	house	6	2	5	https://s3.amazonaws.com/airbnbcloneinteriorphotos/QGehbt2b6iQ.jpg	24
25	Take a magic stroll through the city from this Townhouse with terrace	A lovely place to stay a short walk from the beach.	South Verna	Kansas	American Samoa	90.00	1	townhouse	3	5	4	https://s3.amazonaws.com/airbnbcloneinteriorphotos/Rwb3barsoH8.jpg	25
26	Take a magic stroll through the city from this Penthouse with breathtaking views of the mountains	A delightful place to stay in the middle of the woods.	Lueilwitzmouth	New Jersey	Qatar	380.00	1	apartment	2	1	1	https://s3.amazonaws.com/airbnbcloneinteriorphotos/HmREZuu4XuY.jpg	26
27	Modern Stylish Loft in Chic neighborhood	A lovely place to stay at a seculeded location.	East Reannaburgh	Wisconsin	Andorra	414.00	1	apartment	7	4	10	https://s3.amazonaws.com/airbnbcloneinteriorphotos/GdCIsUD2-yA.jpg	27
28	Let yourself be enlightened with this Stylish Loft in Chic neighborhood	A beautiful place to stay in the middle of the woods.	Rutheland	Arkansas	Sudan	279.00	1	house	4	12	4	https://s3.amazonaws.com/airbnbcloneinteriorphotos/C_dRtsnBOQA.jpg	28
29	Charming Parisian studio in the heart of city	A delightful place to stay a short walk from the beach.	Marquardtton	Virginia	Bahrain	215.00	1	loft	12	8	10	https://s3.amazonaws.com/airbnbcloneinteriorphotos/Rwb3barsoH8.jpg	29
30	Bright Parisian studio in the heart of city	A delightful place to stay at a seculeded location.	Purdyshire	New York	Nepal	488.00	1	villa	1	3	10	https://s3.amazonaws.com/airbnbcloneinteriorphotos/FqqiAvJejto.jpg	31
40	Admire Stunning Ocean Views from a Townhouse with terrace	A delightful place to stay in the middle of the woods.	Fayville	Florida	Kyrgyz Republic	442.00	1	house	12	11	8	https://s3.amazonaws.com/airbnbcloneinteriorphotos/kVBzVaVa7Q0.jpg	40
50	Vintage Parisian studio in the heart of city	A beautiful place to stay in the heart of downtown.	Elliottville	Michigan	Malawi	303.00	1	townhouse	12	3	10	https://s3.amazonaws.com/airbnbcloneinteriorphotos/kOYh8C_xLUQ.jpg	50
60	Stunning Penthouse with breathtaking views of the mountains	A lovely place to stay a short walk from the beach.	Hartmannhaven	Nebraska	United Kingdom	143.00	1	house	9	4	9	https://s3.amazonaws.com/airbnbcloneinteriorphotos/zFGBEikZoRg.jpg	60
70	Charming Stylish Loft in Chic neighborhood	A lovely place to stay in the middle of the woods.	West Maudieville	Wisconsin	Estonia	357.00	1	apartment	1	6	2	https://s3.amazonaws.com/airbnbcloneinteriorphotos/I4ecJKp3eFw.jpg	70
80	Bright Stylish Loft in Chic neighborhood	A beautiful place to stay in the middle of the woods.	Toyhaven	Alaska	Antigua and Barbuda	490.00	1	house	10	12	6	https://s3.amazonaws.com/airbnbcloneinteriorphotos/kOYh8C_xLUQ.jpg	80
90	Take a magic stroll through the city from this Stylish Loft in Chic neighborhood	A lovely place to stay in the middle of the woods.	West Luis	Alaska	Vietnam	281.00	1	apartment	1	1	6	https://s3.amazonaws.com/airbnbcloneinteriorphotos/AQl-J19ocWE.jpg	90
100	Vintage Penthouse with breathtaking views of the mountains	A lovely place to stay in the middle of the woods.	Loweview	Wisconsin	Pitcairn Islands	311.00	1	house	11	5	4	https://s3.amazonaws.com/airbnbcloneinteriorphotos/dAAk8Aqd_-I.jpg	100
32	Unwind in a Studio apartment minutes from downtown	A beautiful place to stay in the middle of the woods.	Hudsonville	Wyoming	Kyrgyz Republic	169.00	1	apartment	6	2	10	https://s3.amazonaws.com/airbnbcloneinteriorphotos/nK0d-oyOyhc.jpg	32
33	Take a magic stroll through the city from this Townhouse with terrace	A delightful place to stay a short walk from the beach.	Port Garfield	Illinois	Dominican Republic	200.00	1	villa	11	5	4	https://s3.amazonaws.com/airbnbcloneinteriorphotos/TD2DKbVP284.jpg	33
41	Unwind in a Mediterranean style apartment near the beach	A beautiful place to stay a short walk from the beach.	Port Adell	Georgia	Greenland	338.00	1	loft	1	8	10	https://s3.amazonaws.com/airbnbcloneinteriorphotos/HmREZuu4XuY.jpg	41
43	Take a magic stroll through the city from this Penthouse with breathtaking views of the mountains	A delightful place to stay in the heart of downtown.	Lake Romanland	Oregon	Macao	494.00	1	townhouse	7	6	3	https://s3.amazonaws.com/airbnbcloneinteriorphotos/zfgVn46-xJw.jpg	43
51	Vintage Stylish Loft in Chic neighborhood	A beautiful place to stay a short walk from the beach.	Seanview	Alabama	Latvia	198.00	1	apartment	6	5	8	https://s3.amazonaws.com/airbnbcloneinteriorphotos/zFGBEikZoRg.jpg	51
53	Unwind in a Mediterranean style apartment near the beach	A delightful place to stay a short walk from the beach.	East Gillian	Washington	Benin	134.00	1	apartment	12	2	9	https://s3.amazonaws.com/airbnbcloneinteriorphotos/kOYh8C_xLUQ.jpg	53
61	Modern Artist's studio	A delightful place to stay a short walk from the beach.	South Mosesfurt	Indiana	Palau	275.00	1	townhouse	3	3	8	https://s3.amazonaws.com/airbnbcloneinteriorphotos/nK0d-oyOyhc.jpg	61
63	Modern Stylish Loft in Chic neighborhood	A scenic place to stay a short walk from the beach.	Christinechester	Nevada	Vietnam	452.00	1	loft	10	6	3	https://s3.amazonaws.com/airbnbcloneinteriorphotos/kOYh8C_xLUQ.jpg	63
71	Charming Penthouse with breathtaking views of the mountains	A beautiful place to stay at a seculeded location.	Durganmouth	Arkansas	Liechtenstein	237.00	1	house	8	7	7	https://s3.amazonaws.com/airbnbcloneinteriorphotos/GmEUEyISvd8.jpg	71
73	Take a magic stroll through the city from this Penthouse with breathtaking views of the mountains	A beautiful place to stay in the heart of downtown.	West Glenna	Michigan	Montserrat	124.00	1	loft	4	8	9	https://s3.amazonaws.com/airbnbcloneinteriorphotos/Rwb3barsoH8.jpg	73
81	Bright Stylish Loft in Chic neighborhood	A beautiful place to stay in the heart of downtown.	South Annettaville	Nebraska	Peru	165.00	1	apartment	6	4	6	https://s3.amazonaws.com/airbnbcloneinteriorphotos/kOYh8C_xLUQ.jpg	81
83	Modern Penthouse with breathtaking views of the mountains	A lovely place to stay in the heart of downtown.	South Zachariahside	Mississippi	Bulgaria	179.00	1	apartment	11	7	5	https://s3.amazonaws.com/airbnbcloneinteriorphotos/b37mDyPzdJM.jpg	83
91	Take a magic stroll through the city from this Stylish Loft in Chic neighborhood	A lovely place to stay in the middle of the woods.	West Ahmedshire	Indiana	Haiti	273.00	1	apartment	8	10	5	https://s3.amazonaws.com/airbnbcloneinteriorphotos/AhiUnolb7cg.jpg	91
93	Charming Stylish Loft in Chic neighborhood	A delightful place to stay at a seculeded location.	West Coltchester	Alabama	Guernsey	467.00	1	apartment	8	9	2	https://s3.amazonaws.com/airbnbcloneinteriorphotos/Rwb3barsoH8.jpg	93
34	Charming Mediterranean style apartment near the beach	A delightful place to stay in the middle of the woods.	Port Cassidyfurt	Maryland	Malta	314.00	1	apartment	4	3	10	https://s3.amazonaws.com/airbnbcloneinteriorphotos/dAAk8Aqd_-I.jpg	34
44	Stunning Studio apartment minutes from downtown	A beautiful place to stay a short walk from the beach.	Westonport	Florida	Cayman Islands	394.00	1	townhouse	7	12	2	https://s3.amazonaws.com/airbnbcloneinteriorphotos/GmEUEyISvd8.jpg	44
54	Stunning Artist's studio	A lovely place to stay in the middle of the woods.	Port Michale	New York	Virgin Islands, British	89.00	1	house	3	12	10	https://s3.amazonaws.com/airbnbcloneinteriorphotos/_AK42TQRyCw.jpg	54
64	Charming Mediterranean style apartment near the beach	A delightful place to stay a short walk from the beach.	Lake Sierrafurt	Mississippi	Nepal	256.00	1	apartment	12	9	9	https://s3.amazonaws.com/airbnbcloneinteriorphotos/_AK42TQRyCw.jpg	64
74	Unwind in a Stylish Loft in Chic neighborhood	A scenic place to stay in the middle of the woods.	West Nyasia	Wisconsin	Singapore	432.00	1	house	6	8	6	https://s3.amazonaws.com/airbnbcloneinteriorphotos/zfgVn46-xJw.jpg	74
84	Let yourself be enlightened with this Townhouse with terrace	A scenic place to stay in the heart of downtown.	East Carmelmouth	Mississippi	Belgium	198.00	1	house	6	2	9	https://s3.amazonaws.com/airbnbcloneinteriorphotos/dJrIcUp4kcA.jpg	84
94	Bright Penthouse with breathtaking views of the mountains	A beautiful place to stay at a seculeded location.	Daremouth	Virginia	Marshall Islands	179.00	1	apartment	11	8	3	https://s3.amazonaws.com/airbnbcloneinteriorphotos/UXFJ-6Zj27M.jpg	94
35	Unwind in a Parisian studio in the heart of city	A lovely place to stay at a seculeded location.	Port Sethchester	South Carolina	Cook Islands	269.00	1	apartment	11	11	6	https://s3.amazonaws.com/airbnbcloneinteriorphotos/dAAk8Aqd_-I.jpg	35
45	Modern Stylish Loft in Chic neighborhood	A delightful place to stay in the heart of downtown.	Osinskibury	Florida	Bermuda	192.00	1	apartment	10	6	2	https://s3.amazonaws.com/airbnbcloneinteriorphotos/I4ecJKp3eFw.jpg	45
55	Take a magic stroll through the city from this Stylish Loft in Chic neighborhood	A lovely place to stay a short walk from the beach.	North Toy	Arizona	Mayotte	325.00	1	house	12	10	9	https://s3.amazonaws.com/airbnbcloneinteriorphotos/kOYh8C_xLUQ.jpg	55
65	Let yourself be enlightened with this Artist's studio	A delightful place to stay a short walk from the beach.	Casandrashire	Hawaii	Kazakhstan	399.00	1	apartment	8	6	7	https://s3.amazonaws.com/airbnbcloneinteriorphotos/nK0d-oyOyhc.jpg	65
75	Admire Stunning Ocean Views from a Studio apartment minutes from downtown	A scenic place to stay a short walk from the beach.	Smithammouth	New Jersey	Mauritania	494.00	1	house	8	2	7	https://s3.amazonaws.com/airbnbcloneinteriorphotos/L0BaowhFe4c.jpg	75
85	Charming Studio apartment minutes from downtown	A scenic place to stay in the middle of the woods.	Prohaskaview	Mississippi	Christmas Island	280.00	1	loft	7	9	8	https://s3.amazonaws.com/airbnbcloneinteriorphotos/AQl-J19ocWE.jpg	85
95	Let yourself be enlightened with this Studio apartment minutes from downtown	A beautiful place to stay in the middle of the woods.	Lake Ayana	New York	Syrian Arab Republic	228.00	1	apartment	3	9	3	https://s3.amazonaws.com/airbnbcloneinteriorphotos/Rwb3barsoH8.jpg	95
36	Vintage Parisian studio in the heart of city	A lovely place to stay at a seculeded location.	Pfefferville	Nebraska	Algeria	194.00	1	apartment	8	4	10	https://s3.amazonaws.com/airbnbcloneinteriorphotos/Rwb3barsoH8.jpg	36
46	Stunning Studio apartment minutes from downtown	A scenic place to stay in the heart of downtown.	Jarrellfurt	South Carolina	Ukraine	221.00	1	townhouse	10	9	8	https://s3.amazonaws.com/airbnbcloneinteriorphotos/zfgVn46-xJw.jpg	46
56	Modern Artist's studio	A delightful place to stay at a seculeded location.	Yasmineport	North Carolina	Greece	271.00	1	villa	9	6	7	https://s3.amazonaws.com/airbnbcloneinteriorphotos/Rwb3barsoH8.jpg	56
66	Modern Townhouse with terrace	A beautiful place to stay a short walk from the beach.	West Natalie	Washington	Greenland	438.00	1	house	11	5	5	https://s3.amazonaws.com/airbnbcloneinteriorphotos/r5pPYI6lEpA.jpg	66
76	Take a magic stroll through the city from this Studio apartment minutes from downtown	A delightful place to stay in the heart of downtown.	Houstonview	Colorado	Taiwan	370.00	1	villa	6	12	1	https://s3.amazonaws.com/airbnbcloneinteriorphotos/6viJObrmnBw.jpg	76
86	Immaculate Architect's Stylish Loft in Chic neighborhood	A delightful place to stay in the heart of downtown.	Alannaside	Maine	Burkina Faso	354.00	1	apartment	2	12	1	https://s3.amazonaws.com/airbnbcloneinteriorphotos/Rwb3barsoH8.jpg	86
96	Let yourself be enlightened with this Parisian studio in the heart of city	A scenic place to stay in the heart of downtown.	Corwinland	New Jersey	Grenada	304.00	1	townhouse	12	6	8	https://s3.amazonaws.com/airbnbcloneinteriorphotos/GmEUEyISvd8.jpg	96
37	Bright Stylish Loft in Chic neighborhood	A scenic place to stay a short walk from the beach.	West Tomasaview	Maryland	Moldova	103.00	1	townhouse	3	3	4	https://s3.amazonaws.com/airbnbcloneinteriorphotos/TD2DKbVP284.jpg	37
47	Let yourself be enlightened with this Parisian studio in the heart of city	A delightful place to stay in the middle of the woods.	Lake Antonia	Ohio	Fiji	267.00	1	villa	10	10	6	https://s3.amazonaws.com/airbnbcloneinteriorphotos/AhiUnolb7cg.jpg	47
57	Admire Stunning Ocean Views from a Studio apartment minutes from downtown	A lovely place to stay in the middle of the woods.	South Jordynhaven	Alaska	Saint Martin	418.00	1	townhouse	11	6	10	https://s3.amazonaws.com/airbnbcloneinteriorphotos/AX-hGV70sd0.jpg	57
67	Charming Townhouse with terrace	A delightful place to stay at a seculeded location.	North Kendraton	Oregon	Guernsey	402.00	1	apartment	4	3	9	https://s3.amazonaws.com/airbnbcloneinteriorphotos/kOYh8C_xLUQ.jpg	67
77	Take a magic stroll through the city from this Penthouse with breathtaking views of the mountains	A beautiful place to stay in the heart of downtown.	South Noemie	Iowa	Honduras	317.00	1	house	4	5	10	https://s3.amazonaws.com/airbnbcloneinteriorphotos/GdCIsUD2-yA.jpg	77
87	Take a magic stroll through the city from this Penthouse with breathtaking views of the mountains	A beautiful place to stay in the heart of downtown.	North Arely	South Dakota	Slovakia (Slovak Republic)	301.00	1	house	8	3	3	https://s3.amazonaws.com/airbnbcloneinteriorphotos/dAAk8Aqd_-I.jpg	87
97	Let yourself be enlightened with this Parisian studio in the heart of city	A scenic place to stay in the middle of the woods.	Abigailchester	Alabama	Guyana	372.00	1	house	5	3	2	https://s3.amazonaws.com/airbnbcloneinteriorphotos/L0BaowhFe4c.jpg	97
38	Admire Stunning Ocean Views from a Artist's studio	A delightful place to stay at a seculeded location.	Lulaside	Michigan	New Caledonia	111.00	1	apartment	4	8	9	https://s3.amazonaws.com/airbnbcloneinteriorphotos/C_dRtsnBOQA.jpg	38
48	Modern Studio apartment minutes from downtown	A delightful place to stay in the middle of the woods.	West Lizzie	Rhode Island	Heard Island and McDonald Islands	242.00	1	house	8	9	3	https://s3.amazonaws.com/airbnbcloneinteriorphotos/C_dRtsnBOQA.jpg	48
58	Unwind in a Parisian studio in the heart of city	A beautiful place to stay at a seculeded location.	East Mauriceport	Virginia	Liechtenstein	174.00	1	townhouse	8	9	9	https://s3.amazonaws.com/airbnbcloneinteriorphotos/I4ecJKp3eFw.jpg	58
68	Charming Studio apartment minutes from downtown	A scenic place to stay at a seculeded location.	North Ryann	Mississippi	Ecuador	115.00	1	apartment	4	2	2	https://s3.amazonaws.com/airbnbcloneinteriorphotos/kVBzVaVa7Q0.jpg	68
78	Modern Penthouse with breathtaking views of the mountains	A scenic place to stay at a seculeded location.	Maehaven	Alaska	Saint Vincent and the Grenadines	263.00	1	house	4	5	5	https://s3.amazonaws.com/airbnbcloneinteriorphotos/I4ecJKp3eFw.jpg	78
88	Charming Townhouse with terrace	A lovely place to stay in the heart of downtown.	Simeonview	Texas	Northern Mariana Islands	382.00	1	house	6	12	2	https://s3.amazonaws.com/airbnbcloneinteriorphotos/hAh4Unn50gk.jpg	88
98	Charming Townhouse with terrace	A lovely place to stay at a seculeded location.	Zboncakville	Rhode Island	Turkey	492.00	1	villa	6	7	10	https://s3.amazonaws.com/airbnbcloneinteriorphotos/GmEUEyISvd8.jpg	98
39	Let yourself be enlightened with this Stylish Loft in Chic neighborhood	A scenic place to stay a short walk from the beach.	Evanton	Texas	Tuvalu	301.00	1	house	2	4	3	https://s3.amazonaws.com/airbnbcloneinteriorphotos/hAh4Unn50gk.jpg	39
49	Bright Studio apartment minutes from downtown	A scenic place to stay in the heart of downtown.	West Kay	Minnesota	Puerto Rico	449.00	1	townhouse	11	10	1	https://s3.amazonaws.com/airbnbcloneinteriorphotos/YFQGWKW33Ck.jpg	49
59	Modern Mediterranean style apartment near the beach	A scenic place to stay a short walk from the beach.	Loyceside	Rhode Island	Bolivia	98.00	1	house	1	10	7	https://s3.amazonaws.com/airbnbcloneinteriorphotos/TD2DKbVP284.jpg	59
69	Bright Stylish Loft in Chic neighborhood	A scenic place to stay in the middle of the woods.	Chaimborough	Michigan	Bolivia	243.00	1	villa	1	2	2	https://s3.amazonaws.com/airbnbcloneinteriorphotos/I4ecJKp3eFw.jpg	69
79	Take a magic stroll through the city from this Penthouse with breathtaking views of the mountains	A beautiful place to stay at a seculeded location.	South Stephany	Alaska	Japan	154.00	1	house	10	2	8	https://s3.amazonaws.com/airbnbcloneinteriorphotos/YFQGWKW33Ck.jpg	79
89	Charming Studio apartment minutes from downtown	A lovely place to stay at a seculeded location.	D'Amoreview	Kansas	Ukraine	409.00	1	house	6	1	3	https://s3.amazonaws.com/airbnbcloneinteriorphotos/AhiUnolb7cg.jpg	89
99	Vintage Penthouse with breathtaking views of the mountains	A delightful place to stay in the heart of downtown.	Connfurt	California	Nigeria	410.00	1	apartment	3	9	10	https://s3.amazonaws.com/airbnbcloneinteriorphotos/FqqiAvJejto.jpg	99
31	Charming Penthouse with breathtaking views of the mountains	A lovely place to stay at a seculeded location.	West Jedediahmouth	Connecticut	Dominica	216.00	1	apartment	4	6	3	https://s3.amazonaws.com/airbnbcloneinteriorphotos/kOYh8C_xLUQ.jpg	30
42	Unwind in a Studio apartment minutes from downtown	A lovely place to stay in the heart of downtown.	North Juwanmouth	Montana	Saint Barthelemy	473.00	1	townhouse	2	4	4	https://s3.amazonaws.com/airbnbcloneinteriorphotos/TD2DKbVP284.jpg	42
52	Unwind in a Townhouse with terrace	A beautiful place to stay in the middle of the woods.	Bessiebury	Rhode Island	Kyrgyz Republic	176.00	1	loft	4	12	10	https://s3.amazonaws.com/airbnbcloneinteriorphotos/dAAk8Aqd_-I.jpg	52
62	Modern Townhouse with terrace	A beautiful place to stay a short walk from the beach.	West Eldred	Arkansas	Belize	319.00	1	house	2	2	7	https://s3.amazonaws.com/airbnbcloneinteriorphotos/QGehbt2b6iQ.jpg	62
72	Modern Studio apartment minutes from downtown	A scenic place to stay at a seculeded location.	West Malachimouth	Hawaii	Jordan	139.00	1	loft	7	4	9	https://s3.amazonaws.com/airbnbcloneinteriorphotos/UXFJ-6Zj27M.jpg	72
82	Stunning Parisian studio in the heart of city	A delightful place to stay a short walk from the beach.	East Gilbertoshire	Arizona	China	123.00	1	loft	11	2	10	https://s3.amazonaws.com/airbnbcloneinteriorphotos/AQl-J19ocWE.jpg	82
92	Unwind in a Artist's studio	A delightful place to stay a short walk from the beach.	Mooreburgh	New Mexico	Pakistan	148.00	1	loft	5	11	2	https://s3.amazonaws.com/airbnbcloneinteriorphotos/QGehbt2b6iQ.jpg	92
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: cj
--

COPY public.reviews (id, text, date, user_id, listing_id) FROM stdin;
1	Very clean and beautiful decore! The host was friendly and the villa was just what the doctor ordered.\n  The three days I spent there were interesting to say the least. I absolutely loved my time there.	2018-08-04	1	2
2	The host was warm and friendly and the townhouse was lovely.\n  The three days I spent there were well worth the price. I we had a wonderful stay.	2019-02-20	2	2
3	OMG! The host was charming and the house was lovely.\n  The three days I spent there were quite pleasent. In conclusion I hated it.	2019-05-27	3	2
4	From the moment I saw the place I knew it would be a trainwreck. The host was friendly and the apartment was breath taking.\n  The two days I spent there were fun and relaxing. I would say things went very well.	2019-05-23	4	2
6	Great space. The host was warm and friendly and the apartment was breath taking.\n  The five days I spent there were quite pleasent. I had a great time.	2019-05-24	6	2
5	What a blast! The host was very helpful and pleasant and the home was just what the doctor ordered.\n  The three days I spent there were quite pleasent. I hated it.	2019-04-29	5	2
7	My wife and I really enjoyed the location. The host was kinda a jerk and the apartment was breath taking.\n  The five days I spent there were fun and relaxing. I would never go back.	2018-08-29	7	2
8	The host was kinda a jerk and the apartment was lovely.\n  The two days I spent there were well worth the price. I had a great time.	2018-12-21	8	2
9	My wife and I really enjoyed the location. The host was kinda a jerk and the townhouse was lovely.\n  The three days I spent there were interesting to say the least. I we had a wonderful stay.	2018-12-09	9	2
10	The host was nice but couldn't stop talking about her cats and the home was lovely.\n  The two days I spent there were well worth the price. It was great.	2018-10-23	10	2
11	OMG! The host was very helpful and pleasant and the apartment was breath taking.\n  The three days I spent there were interesting to say the least. It was great.	2018-08-22	11	2
12	The host was friendly and the apartment was lovely.\n  The four days I spent there were interesting to say the least. In conclusion It was great.	2018-11-13	12	2
13	It was nice. The host was kinda a jerk and the apartment was just as advertised.\n  The three days I spent there were interesting to say the least. It was great.	2019-04-08	13	2
14	It was nice. The host was kinda a jerk and the apartment was just what the doctor ordered.\n  The two days I spent there were well worth the price. I absolutely loved my time there.	2019-01-04	14	2
15	The host was nice but couldn't stop talking about her cats and the townhouse was just as advertised.\n  The four days I spent there were quite pleasent. I we had a wonderful stay.	2018-11-09	15	1
16	It was nice. The host was friendly and the home was just what the doctor ordered.\n  The five days I spent there were well worth the price. In conclusion I would never go back.	2018-08-26	16	1
17	What a blast! The host was friendly and the villa was lovely.\n  The five days I spent there were quite pleasent. In conclusion I hated it.	2018-08-22	17	1
18	OMG! The host was kinda a jerk and the apartment was lovely.\n  The two days I spent there were quite pleasent. It was great.	2018-11-15	18	1
19	Very clean and beautiful decore! The host was friendly and the apartment was just as advertised.\n  The four days I spent there were interesting to say the least. all in all I had a great time.	2018-06-29	19	3
20	It was nice. The host was charming and the townhouse was just as advertised.\n  The three days I spent there were interesting to say the least. It was great.	2018-10-17	20	3
21	Great space. The host was charming and the townhouse was cute and cozy.\n  The four days I spent there were interesting to say the least. I hated it.	2019-01-23	21	3
22	JUST. WOW. The host was nice but couldn't stop talking about her cats and the house was just as advertised.\n  The four days I spent there were quite pleasent. I hated it.	2018-06-16	22	3
23	Unfuhgetable! The host was nice but couldn't stop talking about her cats and the townhouse was just what the doctor ordered.\n  The four days I spent there were well worth the price. all in all I had a great time.	2019-01-25	23	3
24	Unfuhgetable! The host was very helpful and pleasant and the house was lovely.\n  The two days I spent there were fun and relaxing. I would never go back.	2018-06-04	24	3
25	Unfuhgetable! The host was very helpful and pleasant and the townhouse was just as advertised.\n  The four days I spent there were well worth the price. I hated it.	2018-10-18	25	3
26	It was meh. The host was warm and friendly and the apartment was lovely.\n  The two days I spent there were well worth the price. I hated it.	2018-09-15	26	3
27	Good news everyone! The host was charming and the apartment was cute and cozy.\n  The three days I spent there were interesting to say the least. all in all I would never go back.	2018-09-12	27	3
28	What a blast! The host was kinda a jerk and the house was lovely.\n  The four days I spent there were quite pleasent. I would never go back.	2019-02-13	28	3
29	It was nice. The host was warm and friendly and the home was just as advertised.\n  The three days I spent there were quite pleasent. I would say things went very well.	2018-08-31	29	3
30	OMG! The host was warm and friendly and the apartment was breath taking.\n  The four days I spent there were well worth the price. I absolutely loved my time there.	2019-03-01	30	3
31	It was nice. The host was friendly and the townhouse was just as advertised.\n  The four days I spent there were fun and relaxing. I absolutely loved my time there.	2019-01-16	31	3
32	The host was nice but couldn't stop talking about her cats and the house was lovely.\n  The five days I spent there were interesting to say the least. In conclusion I absolutely loved my time there.	2019-02-27	32	3
33	The host was nice but couldn't stop talking about her cats and the apartment was cute and cozy.\n  The four days I spent there were interesting to say the least. I would say things went very well.	2019-05-16	33	3
34	The host was kinda a jerk and the townhouse was just as advertised.\n  The three days I spent there were interesting to say the least. It was great.	2019-01-30	34	3
35	It was meh. The host was very helpful and pleasant and the apartment was lovely.\n  The two days I spent there were fun and relaxing. all in all I would never go back.	2019-05-24	35	3
36	What a blast! The host was kinda a jerk and the townhouse was breath taking.\n  The five days I spent there were well worth the price. all in all It was great.	2019-01-25	36	4
37	My wife and I really enjoyed the location. The host was very helpful and pleasant and the apartment was lovely.\n  The three days I spent there were interesting to say the least. I absolutely loved my time there.	2018-12-29	37	4
38	Unfuhgetable! The host was very helpful and pleasant and the townhouse was lovely.\n  The two days I spent there were interesting to say the least. In conclusion I had a great time.	2019-04-03	38	4
48	It was nice. The host was charming and the house was just what the doctor ordered.\n  The four days I spent there were well worth the price. It was great.	2018-06-01	48	4
58	OMG! The host was very helpful and pleasant and the villa was lovely.\n  The five days I spent there were interesting to say the least. I would say things went very well.	2018-08-11	58	6
68	Great space. The host was charming and the house was cute and cozy.\n  The four days I spent there were fun and relaxing. all in all It was great.	2019-03-30	68	7
78	It was meh. The host was charming and the apartment was just what the doctor ordered.\n  The two days I spent there were fun and relaxing. I would say things went very well.	2019-05-16	78	9
88	From the moment I saw the place I knew it would be a trainwreck. The host was friendly and the house was cute and cozy.\n  The four days I spent there were well worth the price. It was great.	2019-04-09	88	11
98	It was meh. The host was friendly and the house was breath taking.\n  The two days I spent there were quite pleasent. It was great.	2019-04-08	98	11
108	It was nice. The host was very helpful and pleasant and the house was just as advertised.\n  The two days I spent there were well worth the price. In conclusion It was great.	2018-11-10	108	13
116	WARNING: not as advertised. The host was friendly and the villa was lovely.\n  The five days I spent there were quite pleasent. I would never go back.	2018-10-11	116	14
125	From the moment I saw the place I knew it would be a trainwreck. The host was charming and the villa was just what the doctor ordered.\n  The four days I spent there were quite pleasent. I had a great time.	2018-07-05	125	14
135	It was meh. The host was warm and friendly and the townhouse was cute and cozy.\n  The five days I spent there were quite pleasent. all in all I hated it.	2019-04-22	135	15
145	WARNING: not as advertised. The host was nice but couldn't stop talking about her cats and the apartment was just as advertised.\n  The three days I spent there were interesting to say the least. I absolutely loved my time there.	2019-02-07	145	15
155	What a blast! The host was charming and the house was just what the doctor ordered.\n  The two days I spent there were well worth the price. I absolutely loved my time there.	2018-12-06	155	16
165	What a blast! The host was kinda a jerk and the house was just as advertised.\n  The two days I spent there were quite pleasent. In conclusion It was great.	2018-12-14	165	17
175	The host was friendly and the house was breath taking.\n  The five days I spent there were interesting to say the least. In conclusion I we had a wonderful stay.	2019-03-16	175	18
182	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the apartment was lovely.\n  The two days I spent there were well worth the price. all in all It was great.	2018-08-01	182	18
192	What a blast! The host was friendly and the home was lovely.\n  The four days I spent there were fun and relaxing. It was great.	2019-05-10	192	19
202	OMG! The host was very helpful and pleasant and the apartment was just as advertised.\n  The five days I spent there were quite pleasent. I had a great time.	2018-10-23	202	20
213	My wife and I really enjoyed the location. The host was charming and the house was just as advertised.\n  The four days I spent there were interesting to say the least. In conclusion I we had a wonderful stay.	2019-05-17	213	22
223	Great space. The host was kinda a jerk and the house was just as advertised.\n  The two days I spent there were interesting to say the least. It was great.	2019-02-12	223	23
233	OMG! The host was friendly and the villa was just as advertised.\n  The four days I spent there were fun and relaxing. I hated it.	2019-03-07	233	24
243	What a blast! The host was friendly and the house was breath taking.\n  The three days I spent there were quite pleasent. all in all I hated it.	2018-10-13	243	25
253	My wife and I really enjoyed the location. The host was kinda a jerk and the home was lovely.\n  The two days I spent there were quite pleasent. I would say things went very well.	2019-02-07	253	25
263	The host was nice but couldn't stop talking about her cats and the apartment was cute and cozy.\n  The four days I spent there were fun and relaxing. I absolutely loved my time there.	2019-05-06	263	27
273	WARNING: not as advertised. The host was charming and the home was breath taking.\n  The four days I spent there were quite pleasent. I would say things went very well.	2018-09-02	273	28
283	The host was friendly and the house was breath taking.\n  The two days I spent there were quite pleasent. I we had a wonderful stay.	2018-09-15	283	30
293	Good news everyone! The host was charming and the home was cute and cozy.\n  The five days I spent there were interesting to say the least. all in all It was great.	2019-01-31	293	32
303	JUST. WOW. The host was friendly and the house was lovely.\n  The two days I spent there were fun and relaxing. I absolutely loved my time there.	2018-10-28	303	31
313	From the moment I saw the place I knew it would be a trainwreck. The host was very helpful and pleasant and the apartment was breath taking.\n  The two days I spent there were fun and relaxing. I would never go back.	2018-09-18	313	33
323	It was nice. The host was friendly and the apartment was just what the doctor ordered.\n  The two days I spent there were well worth the price. all in all I hated it.	2018-08-31	323	34
333	From the moment I saw the place I knew it would be a trainwreck. The host was friendly and the apartment was cute and cozy.\n  The two days I spent there were fun and relaxing. In conclusion I absolutely loved my time there.	2018-11-01	333	34
343	OMG! The host was kinda a jerk and the house was just what the doctor ordered.\n  The three days I spent there were well worth the price. I absolutely loved my time there.	2018-08-31	343	36
353	WARNING: not as advertised. The host was charming and the villa was breath taking.\n  The five days I spent there were well worth the price. I absolutely loved my time there.	2019-04-04	353	37
363	Very clean and beautiful decore! The host was kinda a jerk and the apartment was breath taking.\n  The three days I spent there were interesting to say the least. It was great.	2018-09-22	363	38
373	It was meh. The host was friendly and the townhouse was just as advertised.\n  The five days I spent there were fun and relaxing. In conclusion I would never go back.	2019-03-26	373	39
383	Good news everyone! The host was charming and the villa was lovely.\n  The four days I spent there were fun and relaxing. I had a great time.	2019-05-14	383	39
393	What a blast! The host was kinda a jerk and the home was cute and cozy.\n  The three days I spent there were fun and relaxing. I we had a wonderful stay.	2019-02-12	393	40
40	It was meh. The host was very helpful and pleasant and the townhouse was just what the doctor ordered.\n  The two days I spent there were well worth the price. I would say things went very well.	2018-05-31	40	4
43	The host was charming and the apartment was breath taking.\n  The three days I spent there were quite pleasent. all in all I hated it.	2018-07-24	43	4
49	Great space. The host was warm and friendly and the apartment was cute and cozy.\n  The two days I spent there were interesting to say the least. I had a great time.	2018-12-06	49	4
51	Good news everyone! The host was kinda a jerk and the apartment was just what the doctor ordered.\n  The three days I spent there were quite pleasent. I hated it.	2018-07-06	51	4
59	WARNING: not as advertised. The host was warm and friendly and the townhouse was just as advertised.\n  The three days I spent there were fun and relaxing. I hated it.	2019-03-14	59	6
61	Unfuhgetable! The host was friendly and the house was just what the doctor ordered.\n  The five days I spent there were fun and relaxing. In conclusion I we had a wonderful stay.	2018-06-06	61	6
69	The host was very helpful and pleasant and the apartment was lovely.\n  The four days I spent there were fun and relaxing. It was great.	2019-05-22	69	7
71	Very clean and beautiful decore! The host was nice but couldn't stop talking about her cats and the house was cute and cozy.\n  The three days I spent there were quite pleasent. I we had a wonderful stay.	2019-05-14	71	8
79	Good news everyone! The host was warm and friendly and the apartment was lovely.\n  The four days I spent there were well worth the price. I would never go back.	2018-09-19	79	10
81	Great space. The host was nice but couldn't stop talking about her cats and the house was just as advertised.\n  The two days I spent there were interesting to say the least. I absolutely loved my time there.	2018-10-05	81	10
89	Very clean and beautiful decore! The host was friendly and the home was just as advertised.\n  The three days I spent there were quite pleasent. I hated it.	2018-06-23	89	11
91	It was nice. The host was friendly and the apartment was just what the doctor ordered.\n  The five days I spent there were interesting to say the least. I would say things went very well.	2018-07-11	91	11
99	The host was warm and friendly and the house was breath taking.\n  The four days I spent there were quite pleasent. I would say things went very well.	2018-08-25	99	12
101	My wife and I really enjoyed the location. The host was kinda a jerk and the apartment was lovely.\n  The four days I spent there were quite pleasent. all in all I had a great time.	2019-05-16	101	12
109	From the moment I saw the place I knew it would be a trainwreck. The host was charming and the home was cute and cozy.\n  The four days I spent there were interesting to say the least. I we had a wonderful stay.	2019-01-18	109	13
111	My wife and I really enjoyed the location. The host was kinda a jerk and the home was cute and cozy.\n  The two days I spent there were interesting to say the least. I would say things went very well.	2018-06-14	111	13
118	The host was kinda a jerk and the apartment was just as advertised.\n  The two days I spent there were interesting to say the least. I hated it.	2018-07-26	118	14
120	Unfuhgetable! The host was very helpful and pleasant and the apartment was just as advertised.\n  The four days I spent there were interesting to say the least. In conclusion I absolutely loved my time there.	2018-10-31	120	14
128	From the moment I saw the place I knew it would be a trainwreck. The host was very helpful and pleasant and the villa was lovely.\n  The two days I spent there were well worth the price. all in all It was great.	2019-03-29	128	14
130	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the townhouse was lovely.\n  The two days I spent there were fun and relaxing. It was great.	2018-09-16	130	14
138	The host was very helpful and pleasant and the villa was just what the doctor ordered.\n  The five days I spent there were interesting to say the least. I would never go back.	2018-09-01	138	15
140	OMG! The host was kinda a jerk and the house was just as advertised.\n  The four days I spent there were fun and relaxing. I would never go back.	2019-01-03	140	15
148	Great space. The host was very helpful and pleasant and the villa was cute and cozy.\n  The five days I spent there were quite pleasent. all in all I had a great time.	2018-07-09	148	15
150	The host was friendly and the house was just as advertised.\n  The three days I spent there were fun and relaxing. I had a great time.	2018-07-20	150	16
158	It was nice. The host was nice but couldn't stop talking about her cats and the apartment was just what the doctor ordered.\n  The five days I spent there were interesting to say the least. In conclusion I absolutely loved my time there.	2018-08-20	158	17
160	What a blast! The host was friendly and the villa was cute and cozy.\n  The five days I spent there were interesting to say the least. In conclusion I would say things went very well.	2019-03-14	160	17
168	Great space. The host was friendly and the home was just as advertised.\n  The two days I spent there were well worth the price. In conclusion I would say things went very well.	2018-11-14	168	17
170	JUST. WOW. The host was very helpful and pleasant and the villa was lovely.\n  The two days I spent there were well worth the price. It was great.	2018-07-11	170	17
179	The host was nice but couldn't stop talking about her cats and the house was just what the doctor ordered.\n  The four days I spent there were quite pleasent. I would never go back.	2018-09-23	179	18
180	OMG! The host was nice but couldn't stop talking about her cats and the apartment was lovely.\n  The four days I spent there were fun and relaxing. I would say things went very well.	2018-08-02	180	18
189	Very clean and beautiful decore! The host was very helpful and pleasant and the home was breath taking.\n  The three days I spent there were fun and relaxing. I hated it.	2019-04-07	189	19
190	From the moment I saw the place I knew it would be a trainwreck. The host was kinda a jerk and the townhouse was breath taking.\n  The three days I spent there were fun and relaxing. In conclusion I would never go back.	2019-04-28	190	19
199	The host was charming and the townhouse was cute and cozy.\n  The two days I spent there were well worth the price. I we had a wonderful stay.	2019-03-10	199	20
200	What a blast! The host was kinda a jerk and the townhouse was breath taking.\n  The two days I spent there were quite pleasent. I hated it.	2019-01-08	200	20
209	The host was warm and friendly and the house was cute and cozy.\n  The four days I spent there were fun and relaxing. all in all It was great.	2019-05-27	209	22
210	From the moment I saw the place I knew it would be a trainwreck. The host was warm and friendly and the apartment was breath taking.\n  The two days I spent there were well worth the price. I absolutely loved my time there.	2018-07-13	210	22
41	JUST. WOW. The host was charming and the house was just as advertised.\n  The two days I spent there were well worth the price. I would never go back.	2018-08-23	41	4
44	Great space. The host was nice but couldn't stop talking about her cats and the apartment was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. all in all I would never go back.	2019-04-06	44	4
50	What a blast! The host was charming and the home was cute and cozy.\n  The two days I spent there were quite pleasent. I had a great time.	2018-07-04	50	4
52	What a blast! The host was very helpful and pleasant and the house was breath taking.\n  The four days I spent there were well worth the price. I would never go back.	2019-03-15	52	4
60	OMG! The host was warm and friendly and the house was cute and cozy.\n  The four days I spent there were fun and relaxing. I hated it.	2019-04-16	60	6
62	OMG! The host was nice but couldn't stop talking about her cats and the house was just as advertised.\n  The two days I spent there were fun and relaxing. I would never go back.	2018-08-07	62	6
70	OMG! The host was very helpful and pleasant and the house was breath taking.\n  The three days I spent there were interesting to say the least. I would say things went very well.	2018-12-06	70	8
72	The host was very helpful and pleasant and the villa was lovely.\n  The two days I spent there were well worth the price. I would never go back.	2018-10-25	72	8
80	The host was kinda a jerk and the house was just as advertised.\n  The five days I spent there were interesting to say the least. I would never go back.	2019-05-10	80	10
82	It was meh. The host was very helpful and pleasant and the house was breath taking.\n  The five days I spent there were interesting to say the least. I had a great time.	2019-03-20	82	10
90	From the moment I saw the place I knew it would be a trainwreck. The host was kinda a jerk and the house was lovely.\n  The five days I spent there were quite pleasent. In conclusion I we had a wonderful stay.	2018-12-01	90	11
92	What a blast! The host was kinda a jerk and the house was breath taking.\n  The three days I spent there were quite pleasent. all in all I absolutely loved my time there.	2019-03-29	92	11
100	From the moment I saw the place I knew it would be a trainwreck. The host was very helpful and pleasant and the apartment was breath taking.\n  The two days I spent there were interesting to say the least. I we had a wonderful stay.	2018-09-19	100	12
102	It was nice. The host was charming and the home was cute and cozy.\n  The four days I spent there were fun and relaxing. all in all I would say things went very well.	2019-01-04	102	12
110	OMG! The host was nice but couldn't stop talking about her cats and the house was breath taking.\n  The five days I spent there were well worth the price. It was great.	2019-01-07	110	13
112	Very clean and beautiful decore! The host was warm and friendly and the townhouse was just as advertised.\n  The five days I spent there were fun and relaxing. I we had a wonderful stay.	2018-10-11	112	13
119	It was meh. The host was kinda a jerk and the villa was lovely.\n  The two days I spent there were fun and relaxing. I absolutely loved my time there.	2019-03-13	119	14
121	Great space. The host was friendly and the apartment was lovely.\n  The five days I spent there were well worth the price. I had a great time.	2018-06-20	121	14
129	My wife and I really enjoyed the location. The host was kinda a jerk and the house was cute and cozy.\n  The four days I spent there were fun and relaxing. It was great.	2019-05-02	129	14
131	Great space. The host was friendly and the apartment was cute and cozy.\n  The four days I spent there were interesting to say the least. all in all I had a great time.	2018-06-19	131	15
139	JUST. WOW. The host was very helpful and pleasant and the townhouse was lovely.\n  The two days I spent there were fun and relaxing. I hated it.	2019-05-06	139	15
141	The host was very helpful and pleasant and the apartment was breath taking.\n  The two days I spent there were quite pleasent. I absolutely loved my time there.	2019-04-06	141	15
149	The host was very helpful and pleasant and the house was lovely.\n  The four days I spent there were fun and relaxing. I we had a wonderful stay.	2019-04-03	149	15
151	Very clean and beautiful decore! The host was charming and the villa was cute and cozy.\n  The five days I spent there were interesting to say the least. I hated it.	2019-05-20	151	16
159	The host was nice but couldn't stop talking about her cats and the apartment was just what the doctor ordered.\n  The five days I spent there were fun and relaxing. In conclusion It was great.	2019-03-01	159	17
161	The host was friendly and the townhouse was just what the doctor ordered.\n  The five days I spent there were quite pleasent. I we had a wonderful stay.	2018-07-24	161	17
169	Great space. The host was kinda a jerk and the house was just as advertised.\n  The three days I spent there were interesting to say the least. all in all I would never go back.	2018-10-07	169	17
171	JUST. WOW. The host was kinda a jerk and the house was just what the doctor ordered.\n  The three days I spent there were fun and relaxing. I we had a wonderful stay.	2019-04-01	171	17
178	It was nice. The host was kinda a jerk and the home was breath taking.\n  The two days I spent there were well worth the price. In conclusion I absolutely loved my time there.	2018-08-30	178	18
184	OMG! The host was nice but couldn't stop talking about her cats and the villa was breath taking.\n  The three days I spent there were quite pleasent. I had a great time.	2019-04-19	184	19
188	The host was kinda a jerk and the house was just what the doctor ordered.\n  The three days I spent there were interesting to say the least. I hated it.	2018-11-03	188	19
194	Unfuhgetable! The host was friendly and the apartment was lovely.\n  The four days I spent there were interesting to say the least. I would never go back.	2019-05-19	194	19
198	Unfuhgetable! The host was warm and friendly and the house was lovely.\n  The three days I spent there were quite pleasent. I hated it.	2019-02-20	198	20
204	Good news everyone! The host was nice but couldn't stop talking about her cats and the house was breath taking.\n  The three days I spent there were fun and relaxing. In conclusion I would say things went very well.	2018-10-30	204	22
208	The host was charming and the villa was breath taking.\n  The five days I spent there were well worth the price. It was great.	2019-02-02	208	22
214	JUST. WOW. The host was friendly and the house was breath taking.\n  The three days I spent there were fun and relaxing. I hated it.	2019-03-31	214	22
218	Unfuhgetable! The host was kinda a jerk and the house was just what the doctor ordered.\n  The three days I spent there were well worth the price. I hated it.	2018-07-02	218	23
42	The host was friendly and the townhouse was breath taking.\n  The five days I spent there were quite pleasent. all in all I hated it.	2018-10-07	42	4
45	From the moment I saw the place I knew it would be a trainwreck. The host was charming and the apartment was just as advertised.\n  The two days I spent there were well worth the price. In conclusion I absolutely loved my time there.	2018-09-18	45	4
53	The host was charming and the townhouse was lovely.\n  The two days I spent there were quite pleasent. It was great.	2018-05-31	53	4
55	It was nice. The host was friendly and the apartment was just what the doctor ordered.\n  The five days I spent there were well worth the price. all in all I absolutely loved my time there.	2018-10-26	55	5
63	My wife and I really enjoyed the location. The host was nice but couldn't stop talking about her cats and the villa was breath taking.\n  The two days I spent there were well worth the price. It was great.	2018-08-19	63	6
65	It was meh. The host was warm and friendly and the apartment was cute and cozy.\n  The three days I spent there were well worth the price. I would never go back.	2018-12-18	65	7
73	JUST. WOW. The host was warm and friendly and the house was just what the doctor ordered.\n  The two days I spent there were quite pleasent. In conclusion I we had a wonderful stay.	2019-05-10	73	8
75	WARNING: not as advertised. The host was very helpful and pleasant and the house was breath taking.\n  The four days I spent there were interesting to say the least. I would say things went very well.	2019-03-11	75	8
83	It was meh. The host was warm and friendly and the house was breath taking.\n  The three days I spent there were interesting to say the least. I hated it.	2019-04-26	83	10
85	Very clean and beautiful decore! The host was very helpful and pleasant and the house was just as advertised.\n  The five days I spent there were well worth the price. I would say things went very well.	2018-06-08	85	10
93	The host was warm and friendly and the house was lovely.\n  The four days I spent there were fun and relaxing. all in all I hated it.	2018-12-20	93	11
95	OMG! The host was friendly and the townhouse was cute and cozy.\n  The three days I spent there were fun and relaxing. all in all It was great.	2019-03-07	95	11
103	Very clean and beautiful decore! The host was kinda a jerk and the house was just what the doctor ordered.\n  The two days I spent there were quite pleasent. In conclusion It was great.	2019-04-03	103	12
105	The host was kinda a jerk and the house was just as advertised.\n  The four days I spent there were quite pleasent. It was great.	2018-07-11	105	12
113	It was nice. The host was kinda a jerk and the villa was just as advertised.\n  The three days I spent there were fun and relaxing. I had a great time.	2019-01-25	113	13
114	WARNING: not as advertised. The host was warm and friendly and the house was just as advertised.\n  The four days I spent there were interesting to say the least. I would say things went very well.	2018-06-16	114	13
122	The host was nice but couldn't stop talking about her cats and the apartment was just what the doctor ordered.\n  The two days I spent there were fun and relaxing. I would say things went very well.	2018-07-25	122	14
123	My wife and I really enjoyed the location. The host was kinda a jerk and the villa was just what the doctor ordered.\n  The five days I spent there were fun and relaxing. I would never go back.	2018-12-28	123	14
132	The host was nice but couldn't stop talking about her cats and the house was just what the doctor ordered.\n  The two days I spent there were well worth the price. In conclusion I would say things went very well.	2018-09-22	132	15
133	WARNING: not as advertised. The host was charming and the house was breath taking.\n  The three days I spent there were interesting to say the least. In conclusion I absolutely loved my time there.	2019-03-08	133	15
142	My wife and I really enjoyed the location. The host was very helpful and pleasant and the home was just what the doctor ordered.\n  The two days I spent there were fun and relaxing. It was great.	2018-07-15	142	15
143	Unfuhgetable! The host was kinda a jerk and the house was breath taking.\n  The three days I spent there were fun and relaxing. In conclusion I absolutely loved my time there.	2019-05-07	143	15
152	Good news everyone! The host was charming and the apartment was lovely.\n  The three days I spent there were fun and relaxing. It was great.	2019-04-29	152	16
153	From the moment I saw the place I knew it would be a trainwreck. The host was warm and friendly and the apartment was breath taking.\n  The four days I spent there were fun and relaxing. all in all I would never go back.	2018-06-14	153	16
162	Great space. The host was very helpful and pleasant and the apartment was just what the doctor ordered.\n  The four days I spent there were interesting to say the least. I hated it.	2019-03-31	162	17
163	Great space. The host was charming and the house was just what the doctor ordered.\n  The three days I spent there were well worth the price. all in all I absolutely loved my time there.	2019-05-24	163	17
172	The host was very helpful and pleasant and the apartment was cute and cozy.\n  The five days I spent there were quite pleasent. It was great.	2019-04-04	172	18
173	The host was friendly and the townhouse was lovely.\n  The five days I spent there were quite pleasent. It was great.	2018-10-29	173	18
183	Good news everyone! The host was nice but couldn't stop talking about her cats and the house was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. all in all I would say things went very well.	2018-07-26	183	19
185	Very clean and beautiful decore! The host was friendly and the villa was breath taking.\n  The four days I spent there were well worth the price. I would never go back.	2018-11-28	185	19
193	It was meh. The host was warm and friendly and the house was lovely.\n  The two days I spent there were quite pleasent. I absolutely loved my time there.	2019-03-02	193	19
195	It was meh. The host was warm and friendly and the apartment was lovely.\n  The three days I spent there were quite pleasent. I absolutely loved my time there.	2018-09-05	195	19
203	JUST. WOW. The host was kinda a jerk and the home was just what the doctor ordered.\n  The four days I spent there were interesting to say the least. I absolutely loved my time there.	2019-02-12	203	21
205	Great space. The host was nice but couldn't stop talking about her cats and the house was just what the doctor ordered.\n  The two days I spent there were quite pleasent. In conclusion I absolutely loved my time there.	2019-01-30	205	22
212	Unfuhgetable! The host was nice but couldn't stop talking about her cats and the apartment was just what the doctor ordered.\n  The five days I spent there were interesting to say the least. all in all I hated it.	2018-07-07	212	22
215	The host was friendly and the apartment was cute and cozy.\n  The four days I spent there were quite pleasent. I would say things went very well.	2018-10-31	215	23
46	It was meh. The host was charming and the house was lovely.\n  The three days I spent there were fun and relaxing. I we had a wonderful stay.	2019-01-12	46	4
56	My wife and I really enjoyed the location. The host was warm and friendly and the house was just as advertised.\n  The two days I spent there were interesting to say the least. I absolutely loved my time there.	2018-11-15	56	6
66	Very clean and beautiful decore! The host was warm and friendly and the townhouse was lovely.\n  The three days I spent there were interesting to say the least. I would say things went very well.	2019-01-20	66	7
76	Very clean and beautiful decore! The host was friendly and the apartment was just as advertised.\n  The three days I spent there were interesting to say the least. all in all I absolutely loved my time there.	2018-08-20	76	8
86	OMG! The host was warm and friendly and the villa was lovely.\n  The two days I spent there were quite pleasent. I we had a wonderful stay.	2018-06-29	86	10
96	Very clean and beautiful decore! The host was nice but couldn't stop talking about her cats and the townhouse was lovely.\n  The three days I spent there were well worth the price. It was great.	2019-03-01	96	11
106	It was nice. The host was warm and friendly and the apartment was cute and cozy.\n  The five days I spent there were well worth the price. It was great.	2019-02-08	106	12
126	Very clean and beautiful decore! The host was charming and the home was lovely.\n  The four days I spent there were fun and relaxing. In conclusion I absolutely loved my time there.	2019-05-29	126	14
136	The host was charming and the house was just what the doctor ordered.\n  The three days I spent there were well worth the price. I would never go back.	2019-05-04	136	15
146	WARNING: not as advertised. The host was friendly and the house was just as advertised.\n  The five days I spent there were quite pleasent. I hated it.	2018-10-16	146	15
156	The host was charming and the home was lovely.\n  The two days I spent there were interesting to say the least. I absolutely loved my time there.	2018-08-30	156	17
166	The host was warm and friendly and the house was just what the doctor ordered.\n  The five days I spent there were fun and relaxing. I had a great time.	2018-12-20	166	17
176	From the moment I saw the place I knew it would be a trainwreck. The host was very helpful and pleasant and the house was just what the doctor ordered.\n  The three days I spent there were well worth the price. I would say things went very well.	2018-06-06	176	18
186	Very clean and beautiful decore! The host was friendly and the apartment was just as advertised.\n  The two days I spent there were fun and relaxing. In conclusion I would say things went very well.	2018-12-30	186	19
196	My wife and I really enjoyed the location. The host was charming and the house was cute and cozy.\n  The five days I spent there were interesting to say the least. I absolutely loved my time there.	2019-01-11	196	20
206	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the apartment was just as advertised.\n  The three days I spent there were quite pleasent. I had a great time.	2018-09-04	206	22
216	Good news everyone! The host was charming and the house was just as advertised.\n  The three days I spent there were quite pleasent. I absolutely loved my time there.	2019-03-12	216	23
226	Unfuhgetable! The host was warm and friendly and the house was cute and cozy.\n  The four days I spent there were quite pleasent. In conclusion I would say things went very well.	2018-12-12	226	23
236	JUST. WOW. The host was very helpful and pleasant and the house was just what the doctor ordered.\n  The four days I spent there were well worth the price. In conclusion I absolutely loved my time there.	2018-12-22	236	24
244	It was nice. The host was very helpful and pleasant and the apartment was just what the doctor ordered.\n  The four days I spent there were fun and relaxing. all in all I had a great time.	2019-04-06	244	25
254	The host was kinda a jerk and the house was breath taking.\n  The three days I spent there were fun and relaxing. I absolutely loved my time there.	2018-12-18	254	25
264	OMG! The host was warm and friendly and the house was cute and cozy.\n  The two days I spent there were well worth the price. I absolutely loved my time there.	2019-03-29	264	27
274	The host was very helpful and pleasant and the house was just what the doctor ordered.\n  The two days I spent there were well worth the price. I had a great time.	2019-03-20	274	28
284	The host was warm and friendly and the house was lovely.\n  The four days I spent there were fun and relaxing. all in all I had a great time.	2019-03-05	284	30
294	It was nice. The host was friendly and the home was lovely.\n  The four days I spent there were well worth the price. all in all It was great.	2019-03-12	294	32
304	What a blast! The host was very helpful and pleasant and the villa was lovely.\n  The two days I spent there were quite pleasent. all in all I would say things went very well.	2019-03-23	304	31
314	It was nice. The host was friendly and the townhouse was just as advertised.\n  The five days I spent there were quite pleasent. all in all I hated it.	2018-11-30	314	33
324	From the moment I saw the place I knew it would be a trainwreck. The host was very helpful and pleasant and the home was cute and cozy.\n  The four days I spent there were fun and relaxing. I hated it.	2018-06-27	324	34
334	Unfuhgetable! The host was warm and friendly and the villa was just as advertised.\n  The five days I spent there were quite pleasent. I we had a wonderful stay.	2019-04-10	334	35
344	WARNING: not as advertised. The host was charming and the apartment was lovely.\n  The three days I spent there were fun and relaxing. I we had a wonderful stay.	2019-05-24	344	36
354	Good news everyone! The host was kinda a jerk and the home was breath taking.\n  The three days I spent there were interesting to say the least. all in all I hated it.	2018-07-15	354	37
364	JUST. WOW. The host was friendly and the apartment was just as advertised.\n  The two days I spent there were interesting to say the least. I we had a wonderful stay.	2018-11-05	364	38
374	It was meh. The host was nice but couldn't stop talking about her cats and the apartment was breath taking.\n  The two days I spent there were quite pleasent. I we had a wonderful stay.	2018-10-28	374	39
384	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the house was lovely.\n  The five days I spent there were fun and relaxing. In conclusion I would never go back.	2019-04-08	384	39
394	WARNING: not as advertised. The host was warm and friendly and the house was breath taking.\n  The four days I spent there were well worth the price. I absolutely loved my time there.	2019-01-13	394	40
404	Great space. The host was charming and the house was lovely.\n  The four days I spent there were well worth the price. I had a great time.	2018-08-12	404	41
47	Unfuhgetable! The host was kinda a jerk and the house was lovely.\n  The three days I spent there were quite pleasent. In conclusion I absolutely loved my time there.	2018-10-10	47	4
57	Good news everyone! The host was charming and the apartment was just what the doctor ordered.\n  The five days I spent there were interesting to say the least. all in all I would say things went very well.	2019-04-13	57	6
67	The host was nice but couldn't stop talking about her cats and the home was lovely.\n  The three days I spent there were interesting to say the least. It was great.	2019-01-05	67	7
77	The host was warm and friendly and the townhouse was just as advertised.\n  The five days I spent there were quite pleasent. all in all I would never go back.	2018-12-22	77	9
87	Unfuhgetable! The host was friendly and the home was just what the doctor ordered.\n  The three days I spent there were fun and relaxing. I hated it.	2018-11-02	87	10
97	Great space. The host was kinda a jerk and the villa was just what the doctor ordered.\n  The five days I spent there were fun and relaxing. all in all I hated it.	2018-07-22	97	11
107	Unfuhgetable! The host was charming and the house was cute and cozy.\n  The two days I spent there were quite pleasent. all in all I we had a wonderful stay.	2019-02-22	107	12
115	The host was warm and friendly and the house was just what the doctor ordered.\n  The five days I spent there were well worth the price. In conclusion I absolutely loved my time there.	2018-11-19	115	13
124	What a blast! The host was very helpful and pleasant and the villa was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. I would say things went very well.	2018-10-04	124	14
134	WARNING: not as advertised. The host was warm and friendly and the townhouse was lovely.\n  The four days I spent there were quite pleasent. It was great.	2018-10-02	134	15
144	The host was nice but couldn't stop talking about her cats and the townhouse was cute and cozy.\n  The three days I spent there were interesting to say the least. I would never go back.	2018-11-10	144	15
154	OMG! The host was nice but couldn't stop talking about her cats and the apartment was just as advertised.\n  The four days I spent there were well worth the price. I we had a wonderful stay.	2018-06-23	154	16
164	Unfuhgetable! The host was nice but couldn't stop talking about her cats and the house was breath taking.\n  The five days I spent there were interesting to say the least. In conclusion I absolutely loved my time there.	2018-11-19	164	17
174	JUST. WOW. The host was warm and friendly and the apartment was lovely.\n  The four days I spent there were quite pleasent. I would never go back.	2018-06-22	174	18
181	Very clean and beautiful decore! The host was nice but couldn't stop talking about her cats and the apartment was lovely.\n  The four days I spent there were well worth the price. I would never go back.	2018-06-30	181	18
191	WARNING: not as advertised. The host was very helpful and pleasant and the apartment was just what the doctor ordered.\n  The two days I spent there were quite pleasent. I had a great time.	2018-10-16	191	19
201	The host was very helpful and pleasant and the home was lovely.\n  The five days I spent there were quite pleasent. I hated it.	2018-11-02	201	20
211	Great space. The host was charming and the house was just what the doctor ordered.\n  The four days I spent there were fun and relaxing. I would never go back.	2018-09-18	211	22
221	JUST. WOW. The host was charming and the apartment was breath taking.\n  The three days I spent there were interesting to say the least. I we had a wonderful stay.	2018-11-14	221	23
231	From the moment I saw the place I knew it would be a trainwreck. The host was charming and the townhouse was lovely.\n  The two days I spent there were quite pleasent. I had a great time.	2019-03-05	231	24
241	Very clean and beautiful decore! The host was charming and the house was just what the doctor ordered.\n  The four days I spent there were fun and relaxing. I would say things went very well.	2019-04-12	241	24
252	From the moment I saw the place I knew it would be a trainwreck. The host was warm and friendly and the apartment was cute and cozy.\n  The three days I spent there were interesting to say the least. In conclusion I would never go back.	2018-11-28	252	25
262	Very clean and beautiful decore! The host was nice but couldn't stop talking about her cats and the home was just as advertised.\n  The five days I spent there were well worth the price. I absolutely loved my time there.	2018-12-29	262	27
272	From the moment I saw the place I knew it would be a trainwreck. The host was kinda a jerk and the villa was lovely.\n  The two days I spent there were well worth the price. It was great.	2019-03-25	272	28
282	WARNING: not as advertised. The host was charming and the apartment was cute and cozy.\n  The three days I spent there were well worth the price. It was great.	2019-05-07	282	30
292	The host was charming and the apartment was breath taking.\n  The two days I spent there were interesting to say the least. all in all I would say things went very well.	2019-05-13	292	32
302	JUST. WOW. The host was friendly and the townhouse was just what the doctor ordered.\n  The two days I spent there were fun and relaxing. I we had a wonderful stay.	2019-03-19	302	31
312	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the villa was breath taking.\n  The five days I spent there were fun and relaxing. I would never go back.	2018-09-06	312	33
322	Good news everyone! The host was very helpful and pleasant and the apartment was lovely.\n  The four days I spent there were quite pleasent. I absolutely loved my time there.	2019-04-09	322	34
332	The host was warm and friendly and the house was just as advertised.\n  The five days I spent there were interesting to say the least. all in all It was great.	2018-08-23	332	34
342	Good news everyone! The host was charming and the villa was lovely.\n  The two days I spent there were quite pleasent. In conclusion It was great.	2019-05-08	342	36
352	OMG! The host was kinda a jerk and the townhouse was breath taking.\n  The four days I spent there were interesting to say the least. I we had a wonderful stay.	2018-10-26	352	37
362	The host was charming and the house was breath taking.\n  The four days I spent there were well worth the price. I hated it.	2018-08-02	362	38
372	WARNING: not as advertised. The host was very helpful and pleasant and the apartment was just what the doctor ordered.\n  The three days I spent there were interesting to say the least. In conclusion I had a great time.	2019-02-12	372	38
382	Great space. The host was very helpful and pleasant and the villa was just as advertised.\n  The four days I spent there were quite pleasent. I would never go back.	2018-10-25	382	39
392	The host was nice but couldn't stop talking about her cats and the townhouse was breath taking.\n  The five days I spent there were fun and relaxing. I hated it.	2018-10-01	392	39
219	Good news everyone! The host was friendly and the house was cute and cozy.\n  The five days I spent there were well worth the price. all in all I had a great time.	2018-12-12	219	23
229	It was nice. The host was warm and friendly and the house was lovely.\n  The four days I spent there were fun and relaxing. In conclusion It was great.	2019-05-13	229	24
239	My wife and I really enjoyed the location. The host was warm and friendly and the house was just what the doctor ordered.\n  The three days I spent there were well worth the price. I would never go back.	2019-03-30	239	24
249	Very clean and beautiful decore! The host was kinda a jerk and the house was just as advertised.\n  The two days I spent there were quite pleasent. It was great.	2018-10-09	249	25
259	The host was friendly and the apartment was lovely.\n  The three days I spent there were interesting to say the least. all in all I had a great time.	2018-10-16	259	27
269	Unfuhgetable! The host was charming and the house was just what the doctor ordered.\n  The five days I spent there were fun and relaxing. I would say things went very well.	2019-01-13	269	27
279	What a blast! The host was very helpful and pleasant and the townhouse was breath taking.\n  The five days I spent there were fun and relaxing. I had a great time.	2019-04-20	279	30
289	WARNING: not as advertised. The host was charming and the apartment was just what the doctor ordered.\n  The three days I spent there were quite pleasent. I hated it.	2019-04-04	289	30
299	The host was very helpful and pleasant and the house was cute and cozy.\n  The two days I spent there were well worth the price. I we had a wonderful stay.	2019-02-23	299	31
309	WARNING: not as advertised. The host was friendly and the villa was just what the doctor ordered.\n  The five days I spent there were interesting to say the least. It was great.	2019-02-26	309	33
319	It was nice. The host was kinda a jerk and the house was just as advertised.\n  The four days I spent there were interesting to say the least. I would say things went very well.	2019-04-03	319	34
329	JUST. WOW. The host was nice but couldn't stop talking about her cats and the house was lovely.\n  The four days I spent there were well worth the price. I had a great time.	2018-11-26	329	34
338	OMG! The host was nice but couldn't stop talking about her cats and the townhouse was just what the doctor ordered.\n  The three days I spent there were fun and relaxing. I would never go back.	2019-03-08	338	36
348	From the moment I saw the place I knew it would be a trainwreck. The host was kinda a jerk and the villa was lovely.\n  The three days I spent there were fun and relaxing. I we had a wonderful stay.	2019-02-05	348	37
358	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the home was breath taking.\n  The three days I spent there were quite pleasent. I hated it.	2019-02-25	358	37
368	What a blast! The host was nice but couldn't stop talking about her cats and the apartment was just as advertised.\n  The five days I spent there were fun and relaxing. In conclusion I we had a wonderful stay.	2018-09-17	368	38
378	WARNING: not as advertised. The host was charming and the apartment was just as advertised.\n  The three days I spent there were quite pleasent. I absolutely loved my time there.	2018-07-24	378	39
388	The host was warm and friendly and the apartment was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. I absolutely loved my time there.	2018-10-11	388	39
398	JUST. WOW. The host was charming and the apartment was breath taking.\n  The three days I spent there were well worth the price. I absolutely loved my time there.	2018-10-20	398	41
408	The host was nice but couldn't stop talking about her cats and the house was cute and cozy.\n  The three days I spent there were interesting to say the least. all in all I absolutely loved my time there.	2018-06-09	408	41
418	It was meh. The host was nice but couldn't stop talking about her cats and the apartment was just as advertised.\n  The five days I spent there were quite pleasent. In conclusion I hated it.	2019-02-09	418	43
428	The host was charming and the apartment was just what the doctor ordered.\n  The two days I spent there were quite pleasent. all in all I absolutely loved my time there.	2018-11-12	428	43
438	It was nice. The host was warm and friendly and the house was just what the doctor ordered.\n  The three days I spent there were quite pleasent. all in all I would never go back.	2018-09-04	438	45
448	Unfuhgetable! The host was kinda a jerk and the house was lovely.\n  The four days I spent there were fun and relaxing. all in all I hated it.	2019-03-22	448	45
458	It was nice. The host was warm and friendly and the townhouse was cute and cozy.\n  The two days I spent there were fun and relaxing. all in all I would say things went very well.	2019-03-29	458	46
468	It was meh. The host was friendly and the apartment was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. In conclusion I hated it.	2019-02-02	468	46
478	Good news everyone! The host was very helpful and pleasant and the villa was cute and cozy.\n  The five days I spent there were interesting to say the least. It was great.	2018-12-16	478	47
488	My wife and I really enjoyed the location. The host was friendly and the home was lovely.\n  The three days I spent there were interesting to say the least. all in all I had a great time.	2019-02-04	488	48
498	The host was warm and friendly and the house was lovely.\n  The two days I spent there were interesting to say the least. In conclusion I would say things went very well.	2018-08-08	498	49
508	My wife and I really enjoyed the location. The host was charming and the villa was cute and cozy.\n  The four days I spent there were interesting to say the least. I had a great time.	2018-06-27	508	49
516	It was nice. The host was kinda a jerk and the townhouse was cute and cozy.\n  The four days I spent there were interesting to say the least. I would never go back.	2019-02-16	516	51
526	It was nice. The host was nice but couldn't stop talking about her cats and the apartment was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. I would say things went very well.	2018-10-21	526	52
536	It was nice. The host was charming and the house was cute and cozy.\n  The five days I spent there were fun and relaxing. I would never go back.	2019-04-26	536	53
546	WARNING: not as advertised. The host was nice but couldn't stop talking about her cats and the house was just what the doctor ordered.\n  The five days I spent there were fun and relaxing. It was great.	2019-04-06	546	54
556	JUST. WOW. The host was nice but couldn't stop talking about her cats and the apartment was lovely.\n  The two days I spent there were interesting to say the least. In conclusion I had a great time.	2018-08-20	556	55
220	OMG! The host was very helpful and pleasant and the villa was just as advertised.\n  The three days I spent there were interesting to say the least. In conclusion I absolutely loved my time there.	2018-09-27	220	23
230	From the moment I saw the place I knew it would be a trainwreck. The host was kinda a jerk and the villa was just as advertised.\n  The three days I spent there were fun and relaxing. It was great.	2018-11-14	230	24
240	My wife and I really enjoyed the location. The host was nice but couldn't stop talking about her cats and the apartment was lovely.\n  The five days I spent there were quite pleasent. I absolutely loved my time there.	2018-08-05	240	24
250	Great space. The host was very helpful and pleasant and the townhouse was just as advertised.\n  The two days I spent there were fun and relaxing. I hated it.	2018-09-29	250	25
260	WARNING: not as advertised. The host was kinda a jerk and the apartment was just what the doctor ordered.\n  The two days I spent there were quite pleasent. all in all I would never go back.	2019-03-24	260	27
270	Great space. The host was warm and friendly and the townhouse was breath taking.\n  The four days I spent there were fun and relaxing. In conclusion I hated it.	2018-06-01	270	27
280	OMG! The host was friendly and the apartment was just what the doctor ordered.\n  The two days I spent there were fun and relaxing. I would never go back.	2018-08-09	280	30
290	WARNING: not as advertised. The host was friendly and the home was just as advertised.\n  The two days I spent there were fun and relaxing. I would never go back.	2018-07-07	290	30
300	My wife and I really enjoyed the location. The host was kinda a jerk and the villa was breath taking.\n  The two days I spent there were interesting to say the least. In conclusion I would say things went very well.	2019-05-09	300	31
310	From the moment I saw the place I knew it would be a trainwreck. The host was friendly and the apartment was lovely.\n  The two days I spent there were well worth the price. It was great.	2018-12-05	310	33
320	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the apartment was breath taking.\n  The three days I spent there were fun and relaxing. In conclusion I hated it.	2018-10-14	320	34
330	My wife and I really enjoyed the location. The host was charming and the apartment was cute and cozy.\n  The five days I spent there were fun and relaxing. all in all I would say things went very well.	2018-06-24	330	34
340	JUST. WOW. The host was nice but couldn't stop talking about her cats and the apartment was breath taking.\n  The four days I spent there were fun and relaxing. all in all I we had a wonderful stay.	2019-05-26	340	36
350	Very clean and beautiful decore! The host was kinda a jerk and the house was just as advertised.\n  The five days I spent there were quite pleasent. In conclusion I we had a wonderful stay.	2018-07-23	350	37
360	It was meh. The host was friendly and the townhouse was cute and cozy.\n  The four days I spent there were interesting to say the least. all in all It was great.	2018-09-09	360	38
370	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the apartment was lovely.\n  The two days I spent there were fun and relaxing. In conclusion I had a great time.	2019-05-01	370	38
380	It was nice. The host was friendly and the house was lovely.\n  The three days I spent there were interesting to say the least. I absolutely loved my time there.	2019-03-02	380	39
390	JUST. WOW. The host was kinda a jerk and the villa was lovely.\n  The four days I spent there were fun and relaxing. I would say things went very well.	2018-07-02	390	39
400	The host was warm and friendly and the townhouse was just what the doctor ordered.\n  The five days I spent there were interesting to say the least. It was great.	2018-06-08	400	41
410	The host was nice but couldn't stop talking about her cats and the apartment was breath taking.\n  The two days I spent there were quite pleasent. I would say things went very well.	2018-06-29	410	41
420	Unfuhgetable! The host was charming and the apartment was breath taking.\n  The three days I spent there were fun and relaxing. It was great.	2018-12-10	420	43
430	From the moment I saw the place I knew it would be a trainwreck. The host was very helpful and pleasant and the apartment was cute and cozy.\n  The two days I spent there were quite pleasent. It was great.	2019-02-11	430	43
440	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the home was cute and cozy.\n  The five days I spent there were fun and relaxing. It was great.	2018-07-02	440	45
450	OMG! The host was charming and the apartment was lovely.\n  The four days I spent there were interesting to say the least. I we had a wonderful stay.	2019-03-15	450	45
460	The host was nice but couldn't stop talking about her cats and the apartment was just what the doctor ordered.\n  The four days I spent there were fun and relaxing. In conclusion It was great.	2018-09-22	460	46
470	From the moment I saw the place I knew it would be a trainwreck. The host was charming and the house was just as advertised.\n  The five days I spent there were fun and relaxing. In conclusion I would say things went very well.	2018-07-14	470	46
480	OMG! The host was charming and the apartment was cute and cozy.\n  The two days I spent there were fun and relaxing. I absolutely loved my time there.	2019-05-08	480	47
490	The host was very helpful and pleasant and the house was breath taking.\n  The four days I spent there were fun and relaxing. In conclusion I had a great time.	2018-09-05	490	48
500	Good news everyone! The host was friendly and the townhouse was just as advertised.\n  The four days I spent there were fun and relaxing. I would never go back.	2018-07-30	500	49
513	Good news everyone! The host was friendly and the villa was just as advertised.\n  The two days I spent there were interesting to say the least. In conclusion I we had a wonderful stay.	2019-02-28	513	50
523	From the moment I saw the place I knew it would be a trainwreck. The host was very helpful and pleasant and the apartment was cute and cozy.\n  The two days I spent there were quite pleasent. I hated it.	2018-10-26	523	52
533	Great space. The host was very helpful and pleasant and the apartment was lovely.\n  The five days I spent there were fun and relaxing. In conclusion I absolutely loved my time there.	2018-11-03	533	53
543	The host was warm and friendly and the house was just as advertised.\n  The three days I spent there were quite pleasent. all in all It was great.	2019-03-19	543	54
553	My wife and I really enjoyed the location. The host was charming and the home was lovely.\n  The five days I spent there were fun and relaxing. In conclusion I we had a wonderful stay.	2019-03-29	553	55
563	What a blast! The host was friendly and the apartment was just as advertised.\n  The two days I spent there were fun and relaxing. all in all It was great.	2018-10-13	563	56
222	It was meh. The host was very helpful and pleasant and the apartment was just as advertised.\n  The four days I spent there were well worth the price. I would never go back.	2018-12-18	222	23
232	Great space. The host was nice but couldn't stop talking about her cats and the house was just as advertised.\n  The three days I spent there were fun and relaxing. It was great.	2018-11-16	232	24
242	From the moment I saw the place I knew it would be a trainwreck. The host was warm and friendly and the home was cute and cozy.\n  The three days I spent there were quite pleasent. I had a great time.	2018-07-24	242	25
251	The host was nice but couldn't stop talking about her cats and the house was cute and cozy.\n  The four days I spent there were well worth the price. I we had a wonderful stay.	2018-10-05	251	25
261	Unfuhgetable! The host was warm and friendly and the house was breath taking.\n  The two days I spent there were fun and relaxing. all in all I would never go back.	2018-10-18	261	27
271	The host was very helpful and pleasant and the home was cute and cozy.\n  The two days I spent there were interesting to say the least. I would say things went very well.	2018-09-12	271	27
281	WARNING: not as advertised. The host was very helpful and pleasant and the apartment was just what the doctor ordered.\n  The five days I spent there were interesting to say the least. It was great.	2018-12-12	281	30
291	It was meh. The host was warm and friendly and the apartment was cute and cozy.\n  The three days I spent there were quite pleasent. all in all I would say things went very well.	2019-02-13	291	32
301	WARNING: not as advertised. The host was kinda a jerk and the house was just as advertised.\n  The two days I spent there were interesting to say the least. In conclusion I had a great time.	2019-01-20	301	31
311	My wife and I really enjoyed the location. The host was charming and the apartment was just what the doctor ordered.\n  The five days I spent there were quite pleasent. I would say things went very well.	2018-10-11	311	33
321	Good news everyone! The host was nice but couldn't stop talking about her cats and the house was cute and cozy.\n  The five days I spent there were quite pleasent. all in all I would say things went very well.	2019-03-22	321	34
331	From the moment I saw the place I knew it would be a trainwreck. The host was warm and friendly and the villa was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. It was great.	2019-02-24	331	34
341	Great space. The host was friendly and the apartment was cute and cozy.\n  The four days I spent there were quite pleasent. I would say things went very well.	2019-02-03	341	36
351	OMG! The host was friendly and the apartment was just what the doctor ordered.\n  The three days I spent there were fun and relaxing. I absolutely loved my time there.	2019-05-20	351	37
361	The host was very helpful and pleasant and the home was breath taking.\n  The two days I spent there were quite pleasent. In conclusion I would say things went very well.	2018-06-19	361	38
371	JUST. WOW. The host was kinda a jerk and the house was just what the doctor ordered.\n  The four days I spent there were interesting to say the least. I hated it.	2018-08-16	371	38
381	The host was nice but couldn't stop talking about her cats and the apartment was cute and cozy.\n  The two days I spent there were well worth the price. I had a great time.	2018-06-01	381	39
391	Good news everyone! The host was nice but couldn't stop talking about her cats and the house was breath taking.\n  The four days I spent there were quite pleasent. I we had a wonderful stay.	2018-09-11	391	39
401	The host was friendly and the house was just what the doctor ordered.\n  The two days I spent there were fun and relaxing. I would say things went very well.	2018-07-16	401	41
411	It was meh. The host was nice but couldn't stop talking about her cats and the villa was just as advertised.\n  The four days I spent there were well worth the price. all in all I had a great time.	2019-03-01	411	41
421	From the moment I saw the place I knew it would be a trainwreck. The host was charming and the home was just what the doctor ordered.\n  The five days I spent there were fun and relaxing. In conclusion I we had a wonderful stay.	2018-07-21	421	43
431	The host was charming and the apartment was breath taking.\n  The three days I spent there were quite pleasent. all in all I had a great time.	2019-05-27	431	43
441	What a blast! The host was charming and the house was just what the doctor ordered.\n  The five days I spent there were fun and relaxing. I absolutely loved my time there.	2019-01-09	441	45
451	JUST. WOW. The host was nice but couldn't stop talking about her cats and the apartment was lovely.\n  The four days I spent there were quite pleasent. I absolutely loved my time there.	2019-05-17	451	45
461	It was meh. The host was friendly and the apartment was breath taking.\n  The five days I spent there were interesting to say the least. I would never go back.	2019-05-08	461	46
471	The host was kinda a jerk and the home was lovely.\n  The four days I spent there were fun and relaxing. In conclusion I would never go back.	2019-01-26	471	46
481	The host was very helpful and pleasant and the apartment was just what the doctor ordered.\n  The three days I spent there were quite pleasent. all in all I absolutely loved my time there.	2019-05-24	481	47
491	Great space. The host was nice but couldn't stop talking about her cats and the house was just what the doctor ordered.\n  The four days I spent there were quite pleasent. all in all I had a great time.	2019-02-25	491	48
501	The host was charming and the villa was just what the doctor ordered.\n  The four days I spent there were interesting to say the least. I had a great time.	2018-08-04	501	49
512	Very clean and beautiful decore! The host was friendly and the apartment was just what the doctor ordered.\n  The four days I spent there were well worth the price. It was great.	2018-06-21	512	49
522	The host was warm and friendly and the villa was just as advertised.\n  The four days I spent there were fun and relaxing. all in all I would say things went very well.	2019-02-17	522	52
532	WARNING: not as advertised. The host was friendly and the townhouse was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. I we had a wonderful stay.	2018-12-25	532	53
542	OMG! The host was warm and friendly and the house was just as advertised.\n  The three days I spent there were quite pleasent. I absolutely loved my time there.	2019-01-28	542	54
552	The host was kinda a jerk and the apartment was just what the doctor ordered.\n  The five days I spent there were fun and relaxing. I hated it.	2018-08-03	552	55
562	JUST. WOW. The host was nice but couldn't stop talking about her cats and the house was breath taking.\n  The five days I spent there were interesting to say the least. It was great.	2019-03-25	562	56
224	WARNING: not as advertised. The host was friendly and the home was lovely.\n  The three days I spent there were well worth the price. In conclusion It was great.	2019-04-12	224	23
234	Good news everyone! The host was kinda a jerk and the townhouse was cute and cozy.\n  The two days I spent there were interesting to say the least. all in all I we had a wonderful stay.	2018-06-20	234	24
247	What a blast! The host was charming and the apartment was just as advertised.\n  The two days I spent there were well worth the price. all in all I would say things went very well.	2019-03-26	247	25
257	It was nice. The host was charming and the home was breath taking.\n  The two days I spent there were fun and relaxing. all in all I would never go back.	2019-01-24	257	27
267	Good news everyone! The host was very helpful and pleasant and the apartment was just what the doctor ordered.\n  The three days I spent there were fun and relaxing. I we had a wonderful stay.	2019-03-29	267	27
277	OMG! The host was friendly and the house was just as advertised.\n  The three days I spent there were well worth the price. It was great.	2019-01-10	277	29
287	Very clean and beautiful decore! The host was friendly and the house was just as advertised.\n  The four days I spent there were well worth the price. I would say things went very well.	2018-06-12	287	30
297	OMG! The host was warm and friendly and the apartment was just as advertised.\n  The three days I spent there were interesting to say the least. It was great.	2018-11-17	297	31
307	The host was charming and the villa was just what the doctor ordered.\n  The two days I spent there were quite pleasent. I would never go back.	2018-12-04	307	33
317	Good news everyone! The host was charming and the townhouse was just as advertised.\n  The two days I spent there were fun and relaxing. In conclusion I would never go back.	2018-08-07	317	33
327	It was meh. The host was kinda a jerk and the house was just as advertised.\n  The five days I spent there were fun and relaxing. I absolutely loved my time there.	2019-01-11	327	34
337	My wife and I really enjoyed the location. The host was very helpful and pleasant and the apartment was breath taking.\n  The two days I spent there were interesting to say the least. all in all I would say things went very well.	2018-07-25	337	36
347	The host was charming and the villa was cute and cozy.\n  The three days I spent there were quite pleasent. In conclusion I absolutely loved my time there.	2018-10-09	347	37
357	The host was kinda a jerk and the villa was just what the doctor ordered.\n  The three days I spent there were fun and relaxing. I absolutely loved my time there.	2019-02-26	357	37
367	The host was very helpful and pleasant and the home was lovely.\n  The two days I spent there were quite pleasent. all in all It was great.	2018-06-14	367	38
377	Great space. The host was very helpful and pleasant and the apartment was breath taking.\n  The four days I spent there were fun and relaxing. I absolutely loved my time there.	2018-12-14	377	39
387	It was meh. The host was nice but couldn't stop talking about her cats and the house was just as advertised.\n  The four days I spent there were interesting to say the least. I would never go back.	2018-10-03	387	39
397	The host was friendly and the house was just as advertised.\n  The four days I spent there were fun and relaxing. I would never go back.	2018-08-14	397	41
407	From the moment I saw the place I knew it would be a trainwreck. The host was friendly and the home was lovely.\n  The four days I spent there were quite pleasent. It was great.	2019-01-30	407	41
417	Good news everyone! The host was very helpful and pleasant and the home was just as advertised.\n  The five days I spent there were quite pleasent. I absolutely loved my time there.	2018-09-12	417	43
427	Unfuhgetable! The host was kinda a jerk and the house was just what the doctor ordered.\n  The two days I spent there were quite pleasent. I hated it.	2018-11-15	427	43
437	Good news everyone! The host was kinda a jerk and the apartment was breath taking.\n  The four days I spent there were fun and relaxing. I hated it.	2019-02-11	437	44
447	It was nice. The host was very helpful and pleasant and the house was lovely.\n  The four days I spent there were well worth the price. all in all I would say things went very well.	2018-12-07	447	45
457	The host was charming and the apartment was just as advertised.\n  The five days I spent there were well worth the price. I had a great time.	2018-06-24	457	46
467	My wife and I really enjoyed the location. The host was friendly and the apartment was cute and cozy.\n  The three days I spent there were well worth the price. I had a great time.	2018-09-02	467	46
477	Good news everyone! The host was kinda a jerk and the apartment was lovely.\n  The three days I spent there were quite pleasent. It was great.	2019-01-30	477	47
487	JUST. WOW. The host was nice but couldn't stop talking about her cats and the villa was just as advertised.\n  The three days I spent there were quite pleasent. In conclusion It was great.	2018-12-30	487	47
497	It was meh. The host was kinda a jerk and the apartment was cute and cozy.\n  The four days I spent there were fun and relaxing. all in all It was great.	2018-11-06	497	49
507	Great space. The host was warm and friendly and the apartment was just what the doctor ordered.\n  The five days I spent there were quite pleasent. I absolutely loved my time there.	2018-12-09	507	49
515	It was nice. The host was very helpful and pleasant and the house was just as advertised.\n  The two days I spent there were well worth the price. I absolutely loved my time there.	2018-12-26	515	50
525	My wife and I really enjoyed the location. The host was friendly and the house was breath taking.\n  The two days I spent there were interesting to say the least. I would never go back.	2019-05-19	525	52
535	My wife and I really enjoyed the location. The host was kinda a jerk and the apartment was lovely.\n  The five days I spent there were fun and relaxing. I hated it.	2018-08-12	535	53
545	It was nice. The host was very helpful and pleasant and the villa was cute and cozy.\n  The five days I spent there were fun and relaxing. I would say things went very well.	2018-06-07	545	54
555	Great space. The host was nice but couldn't stop talking about her cats and the townhouse was cute and cozy.\n  The four days I spent there were quite pleasent. all in all I we had a wonderful stay.	2019-05-19	555	55
565	My wife and I really enjoyed the location. The host was kinda a jerk and the townhouse was breath taking.\n  The four days I spent there were well worth the price. I absolutely loved my time there.	2019-04-20	565	57
575	The host was nice but couldn't stop talking about her cats and the apartment was cute and cozy.\n  The three days I spent there were quite pleasent. I had a great time.	2018-08-03	575	59
585	Very clean and beautiful decore! The host was charming and the townhouse was just as advertised.\n  The four days I spent there were well worth the price. I we had a wonderful stay.	2019-04-18	585	59
225	Great space. The host was very helpful and pleasant and the apartment was just as advertised.\n  The three days I spent there were quite pleasent. I would say things went very well.	2019-04-15	225	23
235	Good news everyone! The host was kinda a jerk and the apartment was just as advertised.\n  The two days I spent there were fun and relaxing. I we had a wonderful stay.	2018-06-04	235	24
246	It was meh. The host was friendly and the house was just what the doctor ordered.\n  The four days I spent there were quite pleasent. I had a great time.	2019-03-23	246	25
256	WARNING: not as advertised. The host was very helpful and pleasant and the apartment was just what the doctor ordered.\n  The five days I spent there were quite pleasent. It was great.	2019-01-09	256	26
266	WARNING: not as advertised. The host was nice but couldn't stop talking about her cats and the house was breath taking.\n  The five days I spent there were interesting to say the least. I hated it.	2018-06-12	266	27
276	It was nice. The host was charming and the house was cute and cozy.\n  The two days I spent there were interesting to say the least. I we had a wonderful stay.	2019-03-07	276	29
286	JUST. WOW. The host was kinda a jerk and the villa was just as advertised.\n  The three days I spent there were well worth the price. I had a great time.	2019-05-07	286	30
296	What a blast! The host was kinda a jerk and the apartment was just as advertised.\n  The four days I spent there were fun and relaxing. I absolutely loved my time there.	2018-07-07	296	31
306	JUST. WOW. The host was very helpful and pleasant and the house was just what the doctor ordered.\n  The five days I spent there were well worth the price. It was great.	2018-07-18	306	33
316	The host was kinda a jerk and the villa was lovely.\n  The four days I spent there were fun and relaxing. I hated it.	2019-01-20	316	33
326	JUST. WOW. The host was nice but couldn't stop talking about her cats and the house was cute and cozy.\n  The five days I spent there were interesting to say the least. all in all I hated it.	2018-09-12	326	34
336	It was nice. The host was warm and friendly and the apartment was breath taking.\n  The three days I spent there were fun and relaxing. I we had a wonderful stay.	2019-02-20	336	36
346	OMG! The host was nice but couldn't stop talking about her cats and the apartment was just as advertised.\n  The two days I spent there were fun and relaxing. I would never go back.	2018-11-08	346	37
356	OMG! The host was charming and the apartment was breath taking.\n  The four days I spent there were interesting to say the least. all in all I had a great time.	2018-12-01	356	37
366	Great space. The host was charming and the house was breath taking.\n  The five days I spent there were fun and relaxing. It was great.	2019-03-10	366	38
376	It was meh. The host was nice but couldn't stop talking about her cats and the townhouse was lovely.\n  The three days I spent there were well worth the price. I we had a wonderful stay.	2018-07-26	376	39
386	The host was warm and friendly and the home was just what the doctor ordered.\n  The five days I spent there were well worth the price. all in all I absolutely loved my time there.	2019-01-18	386	39
396	Unfuhgetable! The host was warm and friendly and the apartment was cute and cozy.\n  The five days I spent there were fun and relaxing. I had a great time.	2018-09-08	396	41
406	The host was friendly and the house was lovely.\n  The three days I spent there were well worth the price. all in all I absolutely loved my time there.	2019-02-06	406	41
416	JUST. WOW. The host was charming and the townhouse was lovely.\n  The two days I spent there were fun and relaxing. I we had a wonderful stay.	2019-03-26	416	42
426	My wife and I really enjoyed the location. The host was warm and friendly and the villa was lovely.\n  The two days I spent there were fun and relaxing. In conclusion It was great.	2019-04-11	426	43
436	The host was kinda a jerk and the house was breath taking.\n  The two days I spent there were fun and relaxing. I absolutely loved my time there.	2019-03-22	436	44
446	The host was very helpful and pleasant and the house was just as advertised.\n  The five days I spent there were interesting to say the least. all in all I would say things went very well.	2018-06-16	446	45
456	The host was friendly and the apartment was breath taking.\n  The five days I spent there were fun and relaxing. all in all I absolutely loved my time there.	2018-07-18	456	45
466	Unfuhgetable! The host was warm and friendly and the townhouse was just as advertised.\n  The two days I spent there were quite pleasent. I would say things went very well.	2019-05-26	466	46
476	WARNING: not as advertised. The host was very helpful and pleasant and the home was just what the doctor ordered.\n  The two days I spent there were well worth the price. I had a great time.	2018-07-07	476	46
486	WARNING: not as advertised. The host was charming and the apartment was just as advertised.\n  The five days I spent there were well worth the price. I absolutely loved my time there.	2019-05-21	486	47
496	WARNING: not as advertised. The host was charming and the home was breath taking.\n  The five days I spent there were interesting to say the least. I hated it.	2018-08-03	496	49
506	The host was very helpful and pleasant and the house was cute and cozy.\n  The three days I spent there were well worth the price. I hated it.	2019-02-04	506	49
517	My wife and I really enjoyed the location. The host was friendly and the villa was just as advertised.\n  The three days I spent there were well worth the price. I would never go back.	2018-11-24	517	51
527	JUST. WOW. The host was nice but couldn't stop talking about her cats and the house was just as advertised.\n  The four days I spent there were interesting to say the least. I would never go back.	2019-02-11	527	53
537	JUST. WOW. The host was friendly and the townhouse was cute and cozy.\n  The two days I spent there were fun and relaxing. I would say things went very well.	2019-03-21	537	53
547	The host was nice but couldn't stop talking about her cats and the house was breath taking.\n  The three days I spent there were well worth the price. I we had a wonderful stay.	2018-09-18	547	54
557	WARNING: not as advertised. The host was friendly and the townhouse was just as advertised.\n  The two days I spent there were interesting to say the least. all in all I hated it.	2019-02-26	557	55
567	Very clean and beautiful decore! The host was kinda a jerk and the house was lovely.\n  The three days I spent there were well worth the price. In conclusion I would say things went very well.	2019-02-02	567	57
577	From the moment I saw the place I knew it would be a trainwreck. The host was very helpful and pleasant and the house was breath taking.\n  The four days I spent there were well worth the price. It was great.	2018-09-30	577	59
587	Good news everyone! The host was nice but couldn't stop talking about her cats and the villa was lovely.\n  The three days I spent there were well worth the price. I had a great time.	2018-06-10	587	59
228	My wife and I really enjoyed the location. The host was warm and friendly and the house was just what the doctor ordered.\n  The four days I spent there were fun and relaxing. In conclusion I had a great time.	2019-04-30	228	23
238	My wife and I really enjoyed the location. The host was kinda a jerk and the home was just what the doctor ordered.\n  The four days I spent there were fun and relaxing. I absolutely loved my time there.	2019-01-23	238	24
248	My wife and I really enjoyed the location. The host was nice but couldn't stop talking about her cats and the apartment was just as advertised.\n  The three days I spent there were fun and relaxing. I hated it.	2019-01-06	248	25
258	What a blast! The host was nice but couldn't stop talking about her cats and the apartment was breath taking.\n  The five days I spent there were fun and relaxing. I would never go back.	2019-04-14	258	27
268	What a blast! The host was very helpful and pleasant and the apartment was lovely.\n  The three days I spent there were well worth the price. I would never go back.	2018-08-28	268	27
278	OMG! The host was charming and the house was cute and cozy.\n  The two days I spent there were interesting to say the least. I would say things went very well.	2019-04-12	278	30
288	It was nice. The host was nice but couldn't stop talking about her cats and the apartment was breath taking.\n  The four days I spent there were well worth the price. It was great.	2019-03-15	288	30
298	WARNING: not as advertised. The host was very helpful and pleasant and the apartment was just what the doctor ordered.\n  The five days I spent there were well worth the price. I would say things went very well.	2018-09-08	298	31
308	The host was charming and the villa was just what the doctor ordered.\n  The five days I spent there were well worth the price. I absolutely loved my time there.	2018-10-30	308	33
318	Very clean and beautiful decore! The host was kinda a jerk and the townhouse was just as advertised.\n  The two days I spent there were quite pleasent. I hated it.	2019-05-19	318	33
328	Good news everyone! The host was friendly and the apartment was breath taking.\n  The five days I spent there were interesting to say the least. I would say things went very well.	2018-11-16	328	34
339	Great space. The host was nice but couldn't stop talking about her cats and the house was just what the doctor ordered.\n  The three days I spent there were well worth the price. In conclusion I had a great time.	2018-07-19	339	36
349	The host was friendly and the house was just what the doctor ordered.\n  The three days I spent there were interesting to say the least. It was great.	2019-01-08	349	37
359	Good news everyone! The host was charming and the apartment was breath taking.\n  The four days I spent there were interesting to say the least. I absolutely loved my time there.	2019-03-15	359	37
369	Unfuhgetable! The host was kinda a jerk and the house was just what the doctor ordered.\n  The four days I spent there were well worth the price. I would never go back.	2018-10-01	369	38
379	JUST. WOW. The host was kinda a jerk and the house was cute and cozy.\n  The three days I spent there were quite pleasent. I hated it.	2019-04-27	379	39
389	Good news everyone! The host was friendly and the apartment was just what the doctor ordered.\n  The three days I spent there were fun and relaxing. In conclusion I would say things went very well.	2019-05-13	389	39
399	My wife and I really enjoyed the location. The host was very helpful and pleasant and the house was just what the doctor ordered.\n  The three days I spent there were well worth the price. I had a great time.	2019-04-06	399	41
409	Unfuhgetable! The host was charming and the house was just as advertised.\n  The three days I spent there were quite pleasent. I absolutely loved my time there.	2018-11-19	409	41
419	It was nice. The host was kinda a jerk and the house was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. I would never go back.	2018-10-08	419	43
429	Unfuhgetable! The host was warm and friendly and the house was cute and cozy.\n  The two days I spent there were fun and relaxing. It was great.	2018-06-29	429	43
439	JUST. WOW. The host was very helpful and pleasant and the apartment was just as advertised.\n  The two days I spent there were well worth the price. I had a great time.	2018-11-09	439	45
449	Unfuhgetable! The host was warm and friendly and the house was cute and cozy.\n  The three days I spent there were interesting to say the least. I hated it.	2018-10-15	449	45
459	Great space. The host was kinda a jerk and the home was just as advertised.\n  The three days I spent there were well worth the price. I had a great time.	2019-03-25	459	46
469	WARNING: not as advertised. The host was warm and friendly and the apartment was lovely.\n  The two days I spent there were interesting to say the least. In conclusion I would say things went very well.	2018-10-05	469	46
479	Great space. The host was kinda a jerk and the townhouse was just what the doctor ordered.\n  The two days I spent there were quite pleasent. I hated it.	2019-02-11	479	47
489	What a blast! The host was very helpful and pleasant and the apartment was lovely.\n  The three days I spent there were fun and relaxing. all in all I would never go back.	2018-08-28	489	48
499	Great space. The host was friendly and the apartment was breath taking.\n  The four days I spent there were well worth the price. I would never go back.	2018-10-19	499	49
509	The host was nice but couldn't stop talking about her cats and the house was lovely.\n  The five days I spent there were quite pleasent. all in all I absolutely loved my time there.	2018-07-30	509	49
519	The host was kinda a jerk and the townhouse was breath taking.\n  The five days I spent there were interesting to say the least. I would never go back.	2018-08-10	519	51
529	JUST. WOW. The host was friendly and the townhouse was just what the doctor ordered.\n  The four days I spent there were interesting to say the least. I would say things went very well.	2019-02-08	529	53
539	JUST. WOW. The host was charming and the home was just as advertised.\n  The three days I spent there were interesting to say the least. In conclusion I we had a wonderful stay.	2018-10-24	539	53
549	The host was charming and the apartment was just what the doctor ordered.\n  The four days I spent there were fun and relaxing. In conclusion I hated it.	2019-04-24	549	54
559	WARNING: not as advertised. The host was charming and the apartment was lovely.\n  The five days I spent there were interesting to say the least. In conclusion I hated it.	2019-05-24	559	56
569	My wife and I really enjoyed the location. The host was warm and friendly and the apartment was breath taking.\n  The two days I spent there were interesting to say the least. all in all I absolutely loved my time there.	2018-09-20	569	57
579	The host was kinda a jerk and the apartment was breath taking.\n  The three days I spent there were interesting to say the least. I we had a wonderful stay.	2019-01-13	579	59
402	The host was friendly and the home was breath taking.\n  The three days I spent there were interesting to say the least. In conclusion I had a great time.	2019-02-21	402	41
412	OMG! The host was charming and the apartment was just what the doctor ordered.\n  The three days I spent there were well worth the price. I would never go back.	2018-06-15	412	42
422	From the moment I saw the place I knew it would be a trainwreck. The host was warm and friendly and the villa was lovely.\n  The four days I spent there were fun and relaxing. all in all I would never go back.	2018-10-16	422	43
432	What a blast! The host was nice but couldn't stop talking about her cats and the apartment was just what the doctor ordered.\n  The five days I spent there were fun and relaxing. In conclusion I would say things went very well.	2019-04-11	432	43
442	It was meh. The host was charming and the townhouse was just as advertised.\n  The four days I spent there were fun and relaxing. I would say things went very well.	2019-04-02	442	45
452	Very clean and beautiful decore! The host was very helpful and pleasant and the home was cute and cozy.\n  The three days I spent there were interesting to say the least. I hated it.	2018-07-11	452	45
462	From the moment I saw the place I knew it would be a trainwreck. The host was friendly and the townhouse was just as advertised.\n  The five days I spent there were quite pleasent. all in all It was great.	2019-05-15	462	46
472	From the moment I saw the place I knew it would be a trainwreck. The host was charming and the villa was breath taking.\n  The three days I spent there were quite pleasent. I would never go back.	2018-07-19	472	46
482	The host was nice but couldn't stop talking about her cats and the home was breath taking.\n  The four days I spent there were interesting to say the least. It was great.	2019-03-29	482	47
492	The host was kinda a jerk and the villa was lovely.\n  The two days I spent there were fun and relaxing. I we had a wonderful stay.	2019-05-03	492	48
502	OMG! The host was warm and friendly and the apartment was just as advertised.\n  The four days I spent there were well worth the price. I had a great time.	2018-09-07	502	49
510	It was nice. The host was friendly and the apartment was just what the doctor ordered.\n  The five days I spent there were well worth the price. all in all I had a great time.	2019-04-08	510	49
520	Good news everyone! The host was friendly and the apartment was cute and cozy.\n  The two days I spent there were quite pleasent. I would never go back.	2018-10-06	520	51
530	JUST. WOW. The host was nice but couldn't stop talking about her cats and the villa was cute and cozy.\n  The four days I spent there were quite pleasent. I we had a wonderful stay.	2019-02-26	530	53
540	It was meh. The host was warm and friendly and the house was cute and cozy.\n  The five days I spent there were interesting to say the least. I had a great time.	2018-06-03	540	54
550	The host was warm and friendly and the villa was breath taking.\n  The two days I spent there were fun and relaxing. I absolutely loved my time there.	2019-04-21	550	54
560	The host was friendly and the house was just as advertised.\n  The five days I spent there were interesting to say the least. I would say things went very well.	2018-10-31	560	56
570	Unfuhgetable! The host was very helpful and pleasant and the apartment was cute and cozy.\n  The five days I spent there were well worth the price. I would never go back.	2018-11-04	570	57
580	WARNING: not as advertised. The host was very helpful and pleasant and the apartment was cute and cozy.\n  The four days I spent there were interesting to say the least. all in all I we had a wonderful stay.	2019-03-29	580	59
590	The host was charming and the house was just as advertised.\n  The three days I spent there were well worth the price. I hated it.	2019-01-15	590	60
597	The host was charming and the apartment was just what the doctor ordered.\n  The two days I spent there were fun and relaxing. I had a great time.	2018-11-11	597	60
600	The host was nice but couldn't stop talking about her cats and the house was cute and cozy.\n  The four days I spent there were well worth the price. all in all I we had a wonderful stay.	2018-07-17	600	60
607	WARNING: not as advertised. The host was kinda a jerk and the apartment was lovely.\n  The three days I spent there were fun and relaxing. I would say things went very well.	2018-07-29	607	61
610	My wife and I really enjoyed the location. The host was friendly and the home was cute and cozy.\n  The five days I spent there were well worth the price. all in all I we had a wonderful stay.	2018-07-11	610	61
617	OMG! The host was friendly and the home was just what the doctor ordered.\n  The two days I spent there were quite pleasent. It was great.	2019-05-25	617	61
620	WARNING: not as advertised. The host was friendly and the house was cute and cozy.\n  The two days I spent there were quite pleasent. I had a great time.	2019-05-02	620	61
627	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the townhouse was lovely.\n  The four days I spent there were fun and relaxing. I would say things went very well.	2019-01-31	627	62
630	The host was very helpful and pleasant and the house was just as advertised.\n  The three days I spent there were fun and relaxing. In conclusion I absolutely loved my time there.	2018-09-23	630	62
637	Very clean and beautiful decore! The host was friendly and the villa was just as advertised.\n  The five days I spent there were well worth the price. I had a great time.	2018-07-09	637	63
640	JUST. WOW. The host was nice but couldn't stop talking about her cats and the townhouse was just what the doctor ordered.\n  The five days I spent there were quite pleasent. I would say things went very well.	2019-02-23	640	63
647	The host was very helpful and pleasant and the townhouse was breath taking.\n  The four days I spent there were well worth the price. I absolutely loved my time there.	2018-11-01	647	63
650	My wife and I really enjoyed the location. The host was warm and friendly and the apartment was lovely.\n  The three days I spent there were fun and relaxing. In conclusion I hated it.	2018-11-04	650	63
657	Good news everyone! The host was charming and the apartment was cute and cozy.\n  The two days I spent there were interesting to say the least. all in all I hated it.	2018-10-16	657	64
660	OMG! The host was charming and the house was lovely.\n  The two days I spent there were interesting to say the least. In conclusion It was great.	2019-03-23	660	64
667	What a blast! The host was friendly and the house was cute and cozy.\n  The four days I spent there were fun and relaxing. all in all I absolutely loved my time there.	2019-03-23	667	64
670	Very clean and beautiful decore! The host was warm and friendly and the apartment was just what the doctor ordered.\n  The five days I spent there were quite pleasent. I would never go back.	2019-03-15	670	65
403	Unfuhgetable! The host was charming and the apartment was just what the doctor ordered.\n  The three days I spent there were well worth the price. I would never go back.	2018-06-03	403	41
413	Very clean and beautiful decore! The host was charming and the apartment was breath taking.\n  The five days I spent there were interesting to say the least. I we had a wonderful stay.	2018-12-19	413	42
423	My wife and I really enjoyed the location. The host was nice but couldn't stop talking about her cats and the apartment was lovely.\n  The four days I spent there were interesting to say the least. I we had a wonderful stay.	2018-07-07	423	43
433	It was meh. The host was warm and friendly and the apartment was lovely.\n  The five days I spent there were fun and relaxing. I had a great time.	2018-06-07	433	43
443	The host was nice but couldn't stop talking about her cats and the townhouse was breath taking.\n  The five days I spent there were quite pleasent. all in all I hated it.	2018-11-15	443	45
453	From the moment I saw the place I knew it would be a trainwreck. The host was friendly and the apartment was lovely.\n  The two days I spent there were fun and relaxing. I absolutely loved my time there.	2018-07-24	453	45
463	The host was charming and the apartment was just as advertised.\n  The three days I spent there were quite pleasent. I hated it.	2018-09-19	463	46
473	What a blast! The host was charming and the apartment was cute and cozy.\n  The two days I spent there were well worth the price. all in all I would never go back.	2018-10-21	473	46
483	JUST. WOW. The host was warm and friendly and the apartment was just what the doctor ordered.\n  The three days I spent there were well worth the price. I hated it.	2019-01-17	483	47
493	My wife and I really enjoyed the location. The host was very helpful and pleasant and the house was cute and cozy.\n  The two days I spent there were interesting to say the least. I had a great time.	2019-01-12	493	48
503	Unfuhgetable! The host was kinda a jerk and the house was breath taking.\n  The two days I spent there were well worth the price. It was great.	2019-01-25	503	49
511	Very clean and beautiful decore! The host was friendly and the house was cute and cozy.\n  The two days I spent there were interesting to say the least. In conclusion I would say things went very well.	2018-10-17	511	49
521	My wife and I really enjoyed the location. The host was nice but couldn't stop talking about her cats and the house was just as advertised.\n  The two days I spent there were interesting to say the least. It was great.	2019-05-02	521	51
531	Unfuhgetable! The host was charming and the house was just what the doctor ordered.\n  The two days I spent there were well worth the price. It was great.	2019-04-10	531	53
541	From the moment I saw the place I knew it would be a trainwreck. The host was charming and the house was just what the doctor ordered.\n  The four days I spent there were quite pleasent. It was great.	2018-09-20	541	54
551	The host was kinda a jerk and the home was cute and cozy.\n  The two days I spent there were interesting to say the least. It was great.	2018-06-04	551	54
561	It was nice. The host was nice but couldn't stop talking about her cats and the townhouse was just as advertised.\n  The four days I spent there were interesting to say the least. all in all I had a great time.	2018-08-22	561	56
571	Great space. The host was kinda a jerk and the townhouse was breath taking.\n  The three days I spent there were fun and relaxing. I would never go back.	2018-11-24	571	57
581	WARNING: not as advertised. The host was very helpful and pleasant and the house was breath taking.\n  The five days I spent there were well worth the price. I hated it.	2019-02-27	581	59
591	The host was warm and friendly and the townhouse was breath taking.\n  The five days I spent there were fun and relaxing. I absolutely loved my time there.	2019-02-13	591	60
601	My wife and I really enjoyed the location. The host was nice but couldn't stop talking about her cats and the apartment was lovely.\n  The five days I spent there were quite pleasent. I would never go back.	2018-11-13	601	60
611	Unfuhgetable! The host was friendly and the apartment was just as advertised.\n  The five days I spent there were quite pleasent. I we had a wonderful stay.	2018-06-05	611	61
621	The host was charming and the house was lovely.\n  The three days I spent there were quite pleasent. all in all I would never go back.	2019-02-27	621	61
631	OMG! The host was kinda a jerk and the villa was cute and cozy.\n  The three days I spent there were interesting to say the least. In conclusion I would never go back.	2019-03-22	631	62
641	It was meh. The host was kinda a jerk and the home was breath taking.\n  The three days I spent there were interesting to say the least. In conclusion I we had a wonderful stay.	2018-11-03	641	63
651	The host was charming and the house was just what the doctor ordered.\n  The three days I spent there were well worth the price. It was great.	2019-04-19	651	64
661	What a blast! The host was friendly and the apartment was just what the doctor ordered.\n  The four days I spent there were well worth the price. I would say things went very well.	2018-11-18	661	64
671	The host was charming and the apartment was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. I absolutely loved my time there.	2018-06-28	671	65
677	OMG! The host was very helpful and pleasant and the apartment was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. I had a great time.	2018-10-25	677	66
681	It was meh. The host was kinda a jerk and the house was just what the doctor ordered.\n  The four days I spent there were well worth the price. It was great.	2019-05-26	681	66
687	It was nice. The host was very helpful and pleasant and the home was breath taking.\n  The four days I spent there were well worth the price. I we had a wonderful stay.	2018-07-22	687	67
691	WARNING: not as advertised. The host was kinda a jerk and the house was just what the doctor ordered.\n  The three days I spent there were well worth the price. I would say things went very well.	2019-03-19	691	68
697	What a blast! The host was friendly and the house was just what the doctor ordered.\n  The five days I spent there were quite pleasent. I we had a wonderful stay.	2019-05-14	697	68
701	The host was very helpful and pleasant and the apartment was cute and cozy.\n  The four days I spent there were interesting to say the least. I had a great time.	2018-12-17	701	68
708	What a blast! The host was kinda a jerk and the house was lovely.\n  The two days I spent there were fun and relaxing. It was great.	2019-02-26	708	69
711	From the moment I saw the place I knew it would be a trainwreck. The host was kinda a jerk and the house was just what the doctor ordered.\n  The two days I spent there were quite pleasent. In conclusion I absolutely loved my time there.	2018-06-02	711	69
414	OMG! The host was nice but couldn't stop talking about her cats and the apartment was lovely.\n  The five days I spent there were well worth the price. all in all I we had a wonderful stay.	2018-06-17	414	42
424	Very clean and beautiful decore! The host was kinda a jerk and the townhouse was cute and cozy.\n  The five days I spent there were well worth the price. all in all I had a great time.	2018-08-25	424	43
434	WARNING: not as advertised. The host was friendly and the apartment was just as advertised.\n  The three days I spent there were interesting to say the least. In conclusion I we had a wonderful stay.	2019-04-27	434	44
444	The host was charming and the apartment was cute and cozy.\n  The three days I spent there were well worth the price. I absolutely loved my time there.	2019-03-02	444	45
454	WARNING: not as advertised. The host was friendly and the apartment was lovely.\n  The two days I spent there were interesting to say the least. I hated it.	2018-07-12	454	45
464	The host was charming and the apartment was just as advertised.\n  The two days I spent there were quite pleasent. I would never go back.	2019-02-19	464	46
474	The host was friendly and the house was cute and cozy.\n  The four days I spent there were quite pleasent. all in all I would never go back.	2018-07-31	474	46
484	Unfuhgetable! The host was warm and friendly and the townhouse was just what the doctor ordered.\n  The five days I spent there were interesting to say the least. I we had a wonderful stay.	2018-10-21	484	47
494	Very clean and beautiful decore! The host was warm and friendly and the house was breath taking.\n  The five days I spent there were well worth the price. I we had a wonderful stay.	2019-03-03	494	48
504	Unfuhgetable! The host was charming and the townhouse was lovely.\n  The two days I spent there were quite pleasent. all in all I would never go back.	2018-12-02	504	49
514	Good news everyone! The host was nice but couldn't stop talking about her cats and the house was just what the doctor ordered.\n  The two days I spent there were quite pleasent. I had a great time.	2019-04-02	514	50
524	The host was warm and friendly and the apartment was just as advertised.\n  The two days I spent there were interesting to say the least. I had a great time.	2018-07-01	524	52
534	What a blast! The host was very helpful and pleasant and the house was just as advertised.\n  The three days I spent there were well worth the price. I would say things went very well.	2018-12-30	534	53
544	From the moment I saw the place I knew it would be a trainwreck. The host was charming and the townhouse was cute and cozy.\n  The two days I spent there were quite pleasent. I absolutely loved my time there.	2019-03-19	544	54
554	It was nice. The host was very helpful and pleasant and the house was lovely.\n  The two days I spent there were quite pleasent. I would never go back.	2019-02-03	554	55
564	It was meh. The host was friendly and the townhouse was just as advertised.\n  The five days I spent there were interesting to say the least. In conclusion I had a great time.	2018-11-23	564	56
574	Great space. The host was very helpful and pleasant and the townhouse was just as advertised.\n  The four days I spent there were well worth the price. I would say things went very well.	2018-12-04	574	58
584	My wife and I really enjoyed the location. The host was friendly and the house was cute and cozy.\n  The four days I spent there were fun and relaxing. I we had a wonderful stay.	2018-09-24	584	59
594	OMG! The host was kinda a jerk and the house was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. In conclusion It was great.	2018-08-26	594	60
604	It was meh. The host was nice but couldn't stop talking about her cats and the house was lovely.\n  The three days I spent there were quite pleasent. It was great.	2018-12-27	604	61
614	It was nice. The host was warm and friendly and the apartment was cute and cozy.\n  The three days I spent there were interesting to say the least. I hated it.	2019-03-18	614	61
624	It was meh. The host was nice but couldn't stop talking about her cats and the apartment was cute and cozy.\n  The two days I spent there were interesting to say the least. I would never go back.	2019-01-19	624	62
634	The host was friendly and the home was just as advertised.\n  The four days I spent there were interesting to say the least. all in all It was great.	2019-01-31	634	62
644	The host was warm and friendly and the apartment was just what the doctor ordered.\n  The five days I spent there were interesting to say the least. I hated it.	2018-08-19	644	63
654	From the moment I saw the place I knew it would be a trainwreck. The host was friendly and the house was just as advertised.\n  The two days I spent there were interesting to say the least. I would say things went very well.	2018-12-22	654	64
664	Very clean and beautiful decore! The host was very helpful and pleasant and the apartment was just what the doctor ordered.\n  The three days I spent there were quite pleasent. In conclusion I would never go back.	2019-04-20	664	64
674	It was meh. The host was kinda a jerk and the villa was just what the doctor ordered.\n  The five days I spent there were fun and relaxing. In conclusion I would never go back.	2019-03-23	674	65
680	Very clean and beautiful decore! The host was kinda a jerk and the house was breath taking.\n  The three days I spent there were interesting to say the least. I would say things went very well.	2019-03-27	680	66
684	It was meh. The host was friendly and the house was lovely.\n  The two days I spent there were fun and relaxing. I absolutely loved my time there.	2019-03-15	684	66
690	My wife and I really enjoyed the location. The host was charming and the home was just what the doctor ordered.\n  The five days I spent there were quite pleasent. I we had a wonderful stay.	2018-10-20	690	68
694	It was nice. The host was charming and the house was lovely.\n  The three days I spent there were interesting to say the least. I absolutely loved my time there.	2019-03-11	694	68
700	The host was charming and the apartment was lovely.\n  The three days I spent there were quite pleasent. all in all I would never go back.	2019-03-29	700	68
704	It was meh. The host was very helpful and pleasant and the house was lovely.\n  The three days I spent there were fun and relaxing. I had a great time.	2018-07-12	704	68
710	The host was kinda a jerk and the house was cute and cozy.\n  The five days I spent there were well worth the price. I we had a wonderful stay.	2018-09-16	710	69
714	My wife and I really enjoyed the location. The host was kinda a jerk and the apartment was lovely.\n  The five days I spent there were well worth the price. It was great.	2018-11-20	714	69
720	Good news everyone! The host was charming and the house was just as advertised.\n  The three days I spent there were quite pleasent. I hated it.	2019-03-12	720	70
415	Good news everyone! The host was warm and friendly and the house was breath taking.\n  The five days I spent there were interesting to say the least. I would say things went very well.	2019-01-21	415	42
425	WARNING: not as advertised. The host was kinda a jerk and the house was just what the doctor ordered.\n  The four days I spent there were fun and relaxing. I would never go back.	2019-01-15	425	43
435	Good news everyone! The host was kinda a jerk and the townhouse was cute and cozy.\n  The four days I spent there were interesting to say the least. all in all I we had a wonderful stay.	2019-01-03	435	44
445	The host was nice but couldn't stop talking about her cats and the villa was breath taking.\n  The three days I spent there were quite pleasent. In conclusion It was great.	2018-06-30	445	45
455	The host was kinda a jerk and the house was cute and cozy.\n  The four days I spent there were interesting to say the least. I had a great time.	2019-04-03	455	45
465	OMG! The host was kinda a jerk and the townhouse was just what the doctor ordered.\n  The four days I spent there were interesting to say the least. I we had a wonderful stay.	2018-07-21	465	46
475	WARNING: not as advertised. The host was very helpful and pleasant and the villa was breath taking.\n  The three days I spent there were fun and relaxing. I would say things went very well.	2019-02-12	475	46
485	WARNING: not as advertised. The host was charming and the house was just as advertised.\n  The two days I spent there were quite pleasent. It was great.	2018-07-15	485	47
495	OMG! The host was very helpful and pleasant and the apartment was cute and cozy.\n  The two days I spent there were quite pleasent. In conclusion I would say things went very well.	2019-03-20	495	49
505	My wife and I really enjoyed the location. The host was kinda a jerk and the house was lovely.\n  The two days I spent there were fun and relaxing. all in all I absolutely loved my time there.	2019-03-16	505	49
518	Very clean and beautiful decore! The host was warm and friendly and the apartment was cute and cozy.\n  The four days I spent there were interesting to say the least. I would say things went very well.	2018-10-19	518	51
528	Good news everyone! The host was warm and friendly and the apartment was breath taking.\n  The four days I spent there were interesting to say the least. I we had a wonderful stay.	2018-07-08	528	53
538	What a blast! The host was very helpful and pleasant and the house was lovely.\n  The five days I spent there were quite pleasent. I we had a wonderful stay.	2018-06-24	538	53
548	It was meh. The host was friendly and the apartment was breath taking.\n  The two days I spent there were fun and relaxing. I would say things went very well.	2019-03-24	548	54
558	What a blast! The host was kinda a jerk and the townhouse was lovely.\n  The three days I spent there were well worth the price. I hated it.	2019-03-14	558	56
568	Great space. The host was warm and friendly and the house was just as advertised.\n  The four days I spent there were interesting to say the least. I would say things went very well.	2018-08-10	568	57
578	WARNING: not as advertised. The host was nice but couldn't stop talking about her cats and the house was just as advertised.\n  The three days I spent there were well worth the price. I had a great time.	2018-08-11	578	59
588	It was meh. The host was charming and the apartment was lovely.\n  The three days I spent there were quite pleasent. all in all I would say things went very well.	2018-09-27	588	59
598	Great space. The host was warm and friendly and the villa was breath taking.\n  The four days I spent there were fun and relaxing. all in all It was great.	2018-08-14	598	60
608	JUST. WOW. The host was friendly and the apartment was breath taking.\n  The five days I spent there were well worth the price. I would say things went very well.	2018-09-01	608	61
618	The host was charming and the villa was just as advertised.\n  The two days I spent there were fun and relaxing. In conclusion I would say things went very well.	2018-12-30	618	61
628	OMG! The host was charming and the villa was cute and cozy.\n  The five days I spent there were interesting to say the least. I hated it.	2018-12-20	628	62
638	It was nice. The host was warm and friendly and the apartment was just as advertised.\n  The five days I spent there were quite pleasent. I we had a wonderful stay.	2018-09-01	638	63
648	It was meh. The host was nice but couldn't stop talking about her cats and the apartment was lovely.\n  The five days I spent there were well worth the price. I we had a wonderful stay.	2019-03-05	648	63
658	The host was friendly and the home was breath taking.\n  The three days I spent there were well worth the price. I hated it.	2018-11-29	658	64
668	My wife and I really enjoyed the location. The host was very helpful and pleasant and the apartment was cute and cozy.\n  The two days I spent there were fun and relaxing. all in all I would never go back.	2019-05-01	668	64
678	Very clean and beautiful decore! The host was warm and friendly and the villa was lovely.\n  The four days I spent there were fun and relaxing. I would say things went very well.	2018-07-22	678	66
688	OMG! The host was very helpful and pleasant and the apartment was cute and cozy.\n  The five days I spent there were fun and relaxing. I would never go back.	2018-11-26	688	68
698	Unfuhgetable! The host was charming and the apartment was just as advertised.\n  The five days I spent there were interesting to say the least. all in all I would say things went very well.	2019-04-11	698	68
707	The host was friendly and the apartment was breath taking.\n  The two days I spent there were quite pleasent. I would never go back.	2019-02-28	707	69
717	WARNING: not as advertised. The host was kinda a jerk and the home was just what the doctor ordered.\n  The four days I spent there were fun and relaxing. In conclusion I would say things went very well.	2019-04-23	717	69
718	The host was nice but couldn't stop talking about her cats and the house was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. It was great.	2019-02-23	718	69
727	The host was nice but couldn't stop talking about her cats and the apartment was just as advertised.\n  The two days I spent there were interesting to say the least. It was great.	2018-08-16	727	71
728	My wife and I really enjoyed the location. The host was warm and friendly and the townhouse was just as advertised.\n  The five days I spent there were interesting to say the least. In conclusion I had a great time.	2018-07-07	728	71
737	It was meh. The host was nice but couldn't stop talking about her cats and the house was breath taking.\n  The two days I spent there were well worth the price. I had a great time.	2018-10-02	737	72
738	From the moment I saw the place I knew it would be a trainwreck. The host was warm and friendly and the house was breath taking.\n  The two days I spent there were quite pleasent. I would never go back.	2019-04-18	738	72
566	WARNING: not as advertised. The host was very helpful and pleasant and the villa was breath taking.\n  The three days I spent there were fun and relaxing. I would say things went very well.	2019-02-12	566	57
576	OMG! The host was very helpful and pleasant and the townhouse was breath taking.\n  The five days I spent there were fun and relaxing. I would never go back.	2018-09-07	576	59
586	It was nice. The host was nice but couldn't stop talking about her cats and the house was cute and cozy.\n  The two days I spent there were interesting to say the least. In conclusion I would say things went very well.	2018-12-15	586	59
596	The host was nice but couldn't stop talking about her cats and the apartment was just as advertised.\n  The three days I spent there were fun and relaxing. I absolutely loved my time there.	2018-06-05	596	60
606	My wife and I really enjoyed the location. The host was nice but couldn't stop talking about her cats and the villa was cute and cozy.\n  The four days I spent there were fun and relaxing. I we had a wonderful stay.	2018-12-20	606	61
616	The host was friendly and the villa was breath taking.\n  The two days I spent there were interesting to say the least. all in all I hated it.	2019-05-21	616	61
626	JUST. WOW. The host was very helpful and pleasant and the villa was lovely.\n  The two days I spent there were quite pleasent. I we had a wonderful stay.	2018-06-09	626	62
636	Great space. The host was nice but couldn't stop talking about her cats and the house was lovely.\n  The three days I spent there were fun and relaxing. I hated it.	2018-10-11	636	62
646	WARNING: not as advertised. The host was very helpful and pleasant and the house was lovely.\n  The four days I spent there were interesting to say the least. I had a great time.	2018-12-07	646	63
656	The host was warm and friendly and the apartment was lovely.\n  The two days I spent there were interesting to say the least. It was great.	2018-12-20	656	64
666	JUST. WOW. The host was charming and the house was just as advertised.\n  The five days I spent there were interesting to say the least. I hated it.	2018-10-02	666	64
676	Good news everyone! The host was nice but couldn't stop talking about her cats and the house was lovely.\n  The five days I spent there were quite pleasent. I had a great time.	2018-07-01	676	66
686	It was nice. The host was warm and friendly and the apartment was just what the doctor ordered.\n  The five days I spent there were well worth the price. all in all I would say things went very well.	2018-07-25	686	66
696	My wife and I really enjoyed the location. The host was very helpful and pleasant and the villa was just as advertised.\n  The four days I spent there were interesting to say the least. In conclusion It was great.	2018-09-28	696	68
706	JUST. WOW. The host was kinda a jerk and the apartment was just what the doctor ordered.\n  The four days I spent there were quite pleasent. In conclusion I would never go back.	2019-02-27	706	68
716	It was nice. The host was very helpful and pleasant and the house was just as advertised.\n  The four days I spent there were quite pleasent. all in all I we had a wonderful stay.	2019-04-12	716	69
721	From the moment I saw the place I knew it would be a trainwreck. The host was kinda a jerk and the villa was lovely.\n  The four days I spent there were quite pleasent. all in all I would say things went very well.	2018-06-03	721	70
726	Unfuhgetable! The host was nice but couldn't stop talking about her cats and the apartment was breath taking.\n  The five days I spent there were fun and relaxing. I had a great time.	2018-10-05	726	71
731	My wife and I really enjoyed the location. The host was very helpful and pleasant and the apartment was cute and cozy.\n  The five days I spent there were fun and relaxing. I would say things went very well.	2018-08-04	731	71
736	The host was friendly and the house was lovely.\n  The three days I spent there were quite pleasent. I we had a wonderful stay.	2019-03-17	736	71
741	My wife and I really enjoyed the location. The host was kinda a jerk and the apartment was lovely.\n  The four days I spent there were fun and relaxing. I would say things went very well.	2019-03-26	741	72
746	From the moment I saw the place I knew it would be a trainwreck. The host was very helpful and pleasant and the villa was just as advertised.\n  The two days I spent there were well worth the price. It was great.	2019-02-28	746	73
751	Great space. The host was charming and the house was lovely.\n  The five days I spent there were interesting to say the least. all in all I we had a wonderful stay.	2018-11-21	751	74
756	From the moment I saw the place I knew it would be a trainwreck. The host was charming and the house was cute and cozy.\n  The five days I spent there were quite pleasent. I absolutely loved my time there.	2019-03-07	756	76
761	Good news everyone! The host was warm and friendly and the house was just as advertised.\n  The five days I spent there were well worth the price. In conclusion It was great.	2019-05-26	761	76
766	Very clean and beautiful decore! The host was friendly and the townhouse was lovely.\n  The four days I spent there were fun and relaxing. all in all I absolutely loved my time there.	2019-05-29	766	76
771	The host was warm and friendly and the villa was breath taking.\n  The four days I spent there were quite pleasent. It was great.	2018-10-12	771	78
776	The host was friendly and the apartment was breath taking.\n  The two days I spent there were well worth the price. In conclusion I we had a wonderful stay.	2019-04-06	776	78
781	My wife and I really enjoyed the location. The host was friendly and the apartment was just as advertised.\n  The three days I spent there were interesting to say the least. In conclusion I hated it.	2019-02-26	781	78
786	WARNING: not as advertised. The host was warm and friendly and the house was just what the doctor ordered.\n  The two days I spent there were fun and relaxing. It was great.	2019-01-31	786	78
790	Unfuhgetable! The host was very helpful and pleasant and the townhouse was just what the doctor ordered.\n  The five days I spent there were quite pleasent. all in all I hated it.	2019-01-02	790	79
796	My wife and I really enjoyed the location. The host was friendly and the villa was just what the doctor ordered.\n  The five days I spent there were interesting to say the least. In conclusion I absolutely loved my time there.	2019-02-18	796	79
800	From the moment I saw the place I knew it would be a trainwreck. The host was friendly and the townhouse was just as advertised.\n  The two days I spent there were well worth the price. In conclusion I had a great time.	2019-01-04	800	79
806	Very clean and beautiful decore! The host was friendly and the apartment was lovely.\n  The three days I spent there were fun and relaxing. I would say things went very well.	2018-12-13	806	80
810	My wife and I really enjoyed the location. The host was charming and the villa was lovely.\n  The four days I spent there were quite pleasent. I would say things went very well.	2018-07-05	810	80
572	The host was warm and friendly and the house was breath taking.\n  The three days I spent there were fun and relaxing. I absolutely loved my time there.	2019-02-13	572	57
582	JUST. WOW. The host was friendly and the townhouse was just as advertised.\n  The four days I spent there were interesting to say the least. I would say things went very well.	2019-01-13	582	59
592	The host was charming and the house was just what the doctor ordered.\n  The four days I spent there were interesting to say the least. I would never go back.	2018-12-08	592	60
602	What a blast! The host was friendly and the home was cute and cozy.\n  The two days I spent there were fun and relaxing. I absolutely loved my time there.	2018-11-15	602	60
612	The host was friendly and the apartment was just as advertised.\n  The three days I spent there were interesting to say the least. all in all I absolutely loved my time there.	2018-09-25	612	61
622	Unfuhgetable! The host was friendly and the house was breath taking.\n  The three days I spent there were well worth the price. all in all I had a great time.	2019-05-21	622	61
632	From the moment I saw the place I knew it would be a trainwreck. The host was charming and the villa was breath taking.\n  The four days I spent there were interesting to say the least. I would never go back.	2018-09-13	632	62
642	The host was very helpful and pleasant and the townhouse was breath taking.\n  The three days I spent there were fun and relaxing. all in all I we had a wonderful stay.	2018-09-25	642	63
652	The host was kinda a jerk and the townhouse was just as advertised.\n  The three days I spent there were quite pleasent. I would never go back.	2018-09-26	652	64
662	It was meh. The host was charming and the home was breath taking.\n  The three days I spent there were quite pleasent. I we had a wonderful stay.	2018-07-06	662	64
672	It was nice. The host was warm and friendly and the townhouse was cute and cozy.\n  The five days I spent there were interesting to say the least. I hated it.	2018-08-16	672	65
682	The host was very helpful and pleasant and the villa was just as advertised.\n  The two days I spent there were interesting to say the least. all in all I would never go back.	2018-09-21	682	66
692	Great space. The host was very helpful and pleasant and the apartment was lovely.\n  The five days I spent there were interesting to say the least. I we had a wonderful stay.	2018-09-16	692	68
702	Good news everyone! The host was warm and friendly and the villa was cute and cozy.\n  The five days I spent there were well worth the price. It was great.	2019-05-03	702	68
712	Good news everyone! The host was warm and friendly and the villa was cute and cozy.\n  The three days I spent there were well worth the price. all in all I would say things went very well.	2019-02-19	712	69
722	What a blast! The host was kinda a jerk and the home was cute and cozy.\n  The two days I spent there were quite pleasent. I absolutely loved my time there.	2019-05-29	722	70
724	Good news everyone! The host was very helpful and pleasant and the home was just what the doctor ordered.\n  The two days I spent there were quite pleasent. In conclusion I would never go back.	2019-03-15	724	70
732	From the moment I saw the place I knew it would be a trainwreck. The host was friendly and the apartment was breath taking.\n  The two days I spent there were fun and relaxing. I would never go back.	2018-10-26	732	71
734	It was meh. The host was charming and the apartment was just what the doctor ordered.\n  The three days I spent there were well worth the price. I absolutely loved my time there.	2018-06-17	734	71
742	The host was charming and the home was just as advertised.\n  The three days I spent there were quite pleasent. I had a great time.	2018-09-22	742	72
744	OMG! The host was very helpful and pleasant and the apartment was just as advertised.\n  The three days I spent there were fun and relaxing. In conclusion I hated it.	2018-11-15	744	73
752	Unfuhgetable! The host was kinda a jerk and the villa was just as advertised.\n  The four days I spent there were well worth the price. In conclusion I had a great time.	2018-08-21	752	74
754	OMG! The host was kinda a jerk and the apartment was breath taking.\n  The four days I spent there were quite pleasent. I would never go back.	2019-04-07	754	75
762	OMG! The host was nice but couldn't stop talking about her cats and the townhouse was just as advertised.\n  The three days I spent there were quite pleasent. all in all I would say things went very well.	2019-04-19	762	76
764	The host was charming and the house was lovely.\n  The five days I spent there were interesting to say the least. all in all I hated it.	2018-10-25	764	76
772	The host was charming and the house was just what the doctor ordered.\n  The two days I spent there were quite pleasent. I had a great time.	2018-11-10	772	78
774	Good news everyone! The host was warm and friendly and the home was just as advertised.\n  The three days I spent there were interesting to say the least. I hated it.	2019-02-11	774	78
782	Unfuhgetable! The host was charming and the house was just as advertised.\n  The four days I spent there were well worth the price. I would never go back.	2019-03-11	782	78
784	Unfuhgetable! The host was warm and friendly and the apartment was lovely.\n  The five days I spent there were well worth the price. all in all I hated it.	2018-07-08	784	78
792	Very clean and beautiful decore! The host was kinda a jerk and the home was just what the doctor ordered.\n  The five days I spent there were fun and relaxing. I would say things went very well.	2018-06-11	792	79
794	Good news everyone! The host was nice but couldn't stop talking about her cats and the apartment was breath taking.\n  The two days I spent there were interesting to say the least. In conclusion I had a great time.	2018-08-31	794	79
802	JUST. WOW. The host was charming and the apartment was lovely.\n  The three days I spent there were fun and relaxing. In conclusion I had a great time.	2018-07-22	802	80
804	OMG! The host was warm and friendly and the apartment was just what the doctor ordered.\n  The three days I spent there were fun and relaxing. all in all I had a great time.	2018-09-11	804	80
812	It was nice. The host was warm and friendly and the house was just what the doctor ordered.\n  The two days I spent there were well worth the price. I hated it.	2018-11-14	812	81
814	The host was kinda a jerk and the apartment was cute and cozy.\n  The three days I spent there were interesting to say the least. In conclusion It was great.	2019-02-05	814	81
816	Good news everyone! The host was warm and friendly and the apartment was cute and cozy.\n  The two days I spent there were interesting to say the least. I we had a wonderful stay.	2018-08-03	816	81
822	The host was very helpful and pleasant and the house was just as advertised.\n  The two days I spent there were interesting to say the least. I would say things went very well.	2018-11-23	822	81
573	WARNING: not as advertised. The host was friendly and the townhouse was just as advertised.\n  The five days I spent there were interesting to say the least. I absolutely loved my time there.	2018-12-21	573	57
583	WARNING: not as advertised. The host was nice but couldn't stop talking about her cats and the house was lovely.\n  The five days I spent there were well worth the price. I would say things went very well.	2019-05-24	583	59
593	WARNING: not as advertised. The host was friendly and the house was lovely.\n  The five days I spent there were fun and relaxing. In conclusion I would never go back.	2019-04-23	593	60
603	WARNING: not as advertised. The host was very helpful and pleasant and the apartment was cute and cozy.\n  The five days I spent there were fun and relaxing. I hated it.	2018-10-21	603	60
613	It was nice. The host was warm and friendly and the apartment was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. I had a great time.	2018-11-27	613	61
623	My wife and I really enjoyed the location. The host was warm and friendly and the house was cute and cozy.\n  The five days I spent there were quite pleasent. In conclusion I would never go back.	2019-04-26	623	61
633	It was meh. The host was charming and the apartment was lovely.\n  The four days I spent there were fun and relaxing. I had a great time.	2018-08-14	633	62
643	The host was warm and friendly and the villa was just as advertised.\n  The three days I spent there were interesting to say the least. I would never go back.	2018-12-17	643	63
653	WARNING: not as advertised. The host was friendly and the house was lovely.\n  The two days I spent there were quite pleasent. I hated it.	2018-11-17	653	64
663	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the villa was just as advertised.\n  The three days I spent there were quite pleasent. I we had a wonderful stay.	2018-08-07	663	64
673	The host was very helpful and pleasant and the house was lovely.\n  The five days I spent there were interesting to say the least. I would say things went very well.	2018-08-14	673	65
683	It was meh. The host was very helpful and pleasant and the house was breath taking.\n  The three days I spent there were fun and relaxing. In conclusion I would never go back.	2018-08-16	683	66
693	WARNING: not as advertised. The host was friendly and the house was lovely.\n  The two days I spent there were quite pleasent. It was great.	2018-12-27	693	68
703	What a blast! The host was nice but couldn't stop talking about her cats and the apartment was cute and cozy.\n  The three days I spent there were well worth the price. I we had a wonderful stay.	2018-08-22	703	68
713	Very clean and beautiful decore! The host was very helpful and pleasant and the house was just as advertised.\n  The three days I spent there were interesting to say the least. I we had a wonderful stay.	2018-11-22	713	69
723	It was nice. The host was friendly and the house was just as advertised.\n  The four days I spent there were fun and relaxing. I absolutely loved my time there.	2019-01-16	723	70
730	It was meh. The host was friendly and the villa was cute and cozy.\n  The four days I spent there were interesting to say the least. all in all I had a great time.	2018-07-30	730	71
733	JUST. WOW. The host was very helpful and pleasant and the home was cute and cozy.\n  The three days I spent there were fun and relaxing. all in all I we had a wonderful stay.	2018-10-18	733	71
740	The host was kinda a jerk and the home was just what the doctor ordered.\n  The five days I spent there were interesting to say the least. It was great.	2019-03-29	740	72
743	Unfuhgetable! The host was friendly and the apartment was just as advertised.\n  The four days I spent there were well worth the price. all in all I would say things went very well.	2018-09-05	743	72
750	The host was charming and the house was lovely.\n  The four days I spent there were interesting to say the least. I absolutely loved my time there.	2018-10-11	750	74
753	Very clean and beautiful decore! The host was very helpful and pleasant and the house was just what the doctor ordered.\n  The four days I spent there were well worth the price. In conclusion I we had a wonderful stay.	2019-01-28	753	74
760	JUST. WOW. The host was nice but couldn't stop talking about her cats and the apartment was lovely.\n  The two days I spent there were interesting to say the least. I we had a wonderful stay.	2019-05-17	760	76
763	My wife and I really enjoyed the location. The host was kinda a jerk and the house was lovely.\n  The four days I spent there were well worth the price. I we had a wonderful stay.	2018-09-12	763	76
770	WARNING: not as advertised. The host was nice but couldn't stop talking about her cats and the apartment was cute and cozy.\n  The five days I spent there were fun and relaxing. I absolutely loved my time there.	2019-01-12	770	78
773	The host was kinda a jerk and the apartment was cute and cozy.\n  The five days I spent there were fun and relaxing. It was great.	2018-10-12	773	78
780	The host was nice but couldn't stop talking about her cats and the home was breath taking.\n  The two days I spent there were interesting to say the least. In conclusion I we had a wonderful stay.	2019-03-21	780	78
783	What a blast! The host was warm and friendly and the home was just what the doctor ordered.\n  The three days I spent there were well worth the price. I hated it.	2019-01-08	783	78
791	It was meh. The host was kinda a jerk and the apartment was lovely.\n  The four days I spent there were well worth the price. I would never go back.	2019-03-06	791	79
793	The host was friendly and the home was just as advertised.\n  The three days I spent there were interesting to say the least. I would say things went very well.	2018-09-30	793	79
801	My wife and I really enjoyed the location. The host was very helpful and pleasant and the apartment was just as advertised.\n  The five days I spent there were well worth the price. I would never go back.	2018-07-24	801	79
803	Unfuhgetable! The host was friendly and the house was just as advertised.\n  The four days I spent there were interesting to say the least. I absolutely loved my time there.	2018-11-05	803	80
811	My wife and I really enjoyed the location. The host was charming and the townhouse was lovely.\n  The four days I spent there were quite pleasent. I would say things went very well.	2018-06-24	811	80
813	JUST. WOW. The host was warm and friendly and the villa was breath taking.\n  The three days I spent there were well worth the price. all in all I hated it.	2019-02-13	813	81
820	What a blast! The host was very helpful and pleasant and the apartment was just as advertised.\n  The three days I spent there were well worth the price. I we had a wonderful stay.	2019-03-03	820	81
821	Good news everyone! The host was warm and friendly and the townhouse was cute and cozy.\n  The three days I spent there were well worth the price. I hated it.	2019-04-27	821	81
589	The host was warm and friendly and the apartment was breath taking.\n  The five days I spent there were well worth the price. In conclusion I would say things went very well.	2019-04-03	589	59
599	Great space. The host was very helpful and pleasant and the villa was lovely.\n  The two days I spent there were interesting to say the least. all in all It was great.	2018-09-23	599	60
609	From the moment I saw the place I knew it would be a trainwreck. The host was kinda a jerk and the townhouse was just as advertised.\n  The four days I spent there were fun and relaxing. In conclusion I hated it.	2018-11-17	609	61
619	Very clean and beautiful decore! The host was warm and friendly and the house was just as advertised.\n  The two days I spent there were quite pleasent. all in all I had a great time.	2018-07-04	619	61
629	It was nice. The host was kinda a jerk and the house was lovely.\n  The three days I spent there were interesting to say the least. In conclusion I absolutely loved my time there.	2018-10-20	629	62
639	Very clean and beautiful decore! The host was kinda a jerk and the apartment was lovely.\n  The two days I spent there were fun and relaxing. I we had a wonderful stay.	2018-10-07	639	63
649	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the apartment was lovely.\n  The two days I spent there were fun and relaxing. all in all It was great.	2019-02-15	649	63
659	What a blast! The host was charming and the apartment was breath taking.\n  The four days I spent there were quite pleasent. I would never go back.	2018-09-30	659	64
669	It was nice. The host was nice but couldn't stop talking about her cats and the apartment was breath taking.\n  The three days I spent there were well worth the price. I we had a wonderful stay.	2018-09-08	669	64
679	Great space. The host was very helpful and pleasant and the house was breath taking.\n  The three days I spent there were interesting to say the least. I would say things went very well.	2018-09-01	679	66
689	Great space. The host was nice but couldn't stop talking about her cats and the home was just what the doctor ordered.\n  The four days I spent there were quite pleasent. all in all I would never go back.	2019-05-18	689	68
699	Great space. The host was nice but couldn't stop talking about her cats and the villa was breath taking.\n  The four days I spent there were fun and relaxing. I would say things went very well.	2019-02-11	699	68
709	Good news everyone! The host was kinda a jerk and the house was just what the doctor ordered.\n  The four days I spent there were well worth the price. In conclusion I absolutely loved my time there.	2018-09-01	709	69
719	It was meh. The host was warm and friendly and the house was breath taking.\n  The two days I spent there were well worth the price. In conclusion I would say things went very well.	2018-09-08	719	70
729	The host was kinda a jerk and the apartment was breath taking.\n  The two days I spent there were interesting to say the least. I we had a wonderful stay.	2018-09-01	729	71
739	It was nice. The host was charming and the home was just what the doctor ordered.\n  The three days I spent there were quite pleasent. It was great.	2019-02-19	739	72
747	It was meh. The host was charming and the villa was just what the doctor ordered.\n  The four days I spent there were interesting to say the least. I would never go back.	2018-08-06	747	73
749	My wife and I really enjoyed the location. The host was friendly and the apartment was lovely.\n  The five days I spent there were interesting to say the least. I had a great time.	2019-01-28	749	74
757	It was nice. The host was friendly and the apartment was just as advertised.\n  The four days I spent there were interesting to say the least. I absolutely loved my time there.	2019-05-27	757	76
759	The host was charming and the house was breath taking.\n  The four days I spent there were quite pleasent. It was great.	2018-12-17	759	76
767	Great space. The host was friendly and the apartment was cute and cozy.\n  The three days I spent there were interesting to say the least. all in all I hated it.	2018-08-27	767	76
769	The host was kinda a jerk and the villa was breath taking.\n  The two days I spent there were well worth the price. I we had a wonderful stay.	2018-08-14	769	77
777	From the moment I saw the place I knew it would be a trainwreck. The host was charming and the apartment was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. I had a great time.	2018-08-04	777	78
779	My wife and I really enjoyed the location. The host was kinda a jerk and the townhouse was lovely.\n  The two days I spent there were fun and relaxing. I hated it.	2018-07-31	779	78
787	Good news everyone! The host was friendly and the house was cute and cozy.\n  The four days I spent there were quite pleasent. I had a great time.	2019-04-23	787	78
789	WARNING: not as advertised. The host was warm and friendly and the townhouse was cute and cozy.\n  The four days I spent there were quite pleasent. I would say things went very well.	2019-02-10	789	79
797	From the moment I saw the place I knew it would be a trainwreck. The host was warm and friendly and the apartment was cute and cozy.\n  The two days I spent there were quite pleasent. It was great.	2018-09-27	797	79
799	From the moment I saw the place I knew it would be a trainwreck. The host was friendly and the home was just as advertised.\n  The four days I spent there were well worth the price. I would never go back.	2019-04-30	799	79
807	It was meh. The host was warm and friendly and the home was just what the doctor ordered.\n  The five days I spent there were quite pleasent. I hated it.	2018-11-10	807	80
809	Good news everyone! The host was warm and friendly and the apartment was just as advertised.\n  The five days I spent there were fun and relaxing. I absolutely loved my time there.	2019-05-30	809	80
817	From the moment I saw the place I knew it would be a trainwreck. The host was kinda a jerk and the townhouse was just what the doctor ordered.\n  The four days I spent there were interesting to say the least. I would say things went very well.	2018-06-04	817	81
819	Great space. The host was very helpful and pleasant and the home was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. I we had a wonderful stay.	2019-05-25	819	81
823	The host was very helpful and pleasant and the townhouse was just what the doctor ordered.\n  The three days I spent there were quite pleasent. I hated it.	2018-09-26	823	81
826	Unfuhgetable! The host was kinda a jerk and the apartment was just what the doctor ordered.\n  The three days I spent there were fun and relaxing. all in all I hated it.	2019-03-11	826	81
827	OMG! The host was kinda a jerk and the apartment was cute and cozy.\n  The five days I spent there were quite pleasent. I would never go back.	2018-07-01	827	81
595	From the moment I saw the place I knew it would be a trainwreck. The host was friendly and the townhouse was lovely.\n  The three days I spent there were interesting to say the least. I would never go back.	2018-09-08	595	60
605	The host was friendly and the house was breath taking.\n  The five days I spent there were quite pleasent. I we had a wonderful stay.	2018-09-21	605	61
615	It was meh. The host was friendly and the townhouse was lovely.\n  The two days I spent there were fun and relaxing. I would say things went very well.	2018-11-15	615	61
625	OMG! The host was warm and friendly and the villa was just what the doctor ordered.\n  The two days I spent there were well worth the price. I hated it.	2018-07-28	625	62
635	Unfuhgetable! The host was friendly and the townhouse was cute and cozy.\n  The four days I spent there were fun and relaxing. all in all I absolutely loved my time there.	2018-08-19	635	62
645	My wife and I really enjoyed the location. The host was nice but couldn't stop talking about her cats and the apartment was cute and cozy.\n  The five days I spent there were fun and relaxing. I hated it.	2018-09-27	645	63
655	JUST. WOW. The host was warm and friendly and the townhouse was lovely.\n  The four days I spent there were well worth the price. I hated it.	2018-08-13	655	64
665	It was nice. The host was friendly and the villa was just what the doctor ordered.\n  The two days I spent there were quite pleasent. I hated it.	2018-11-09	665	64
675	The host was nice but couldn't stop talking about her cats and the villa was breath taking.\n  The two days I spent there were interesting to say the least. In conclusion I absolutely loved my time there.	2018-08-28	675	65
685	Good news everyone! The host was warm and friendly and the home was just what the doctor ordered.\n  The two days I spent there were well worth the price. It was great.	2018-11-20	685	66
695	It was nice. The host was very helpful and pleasant and the house was cute and cozy.\n  The five days I spent there were well worth the price. I we had a wonderful stay.	2019-05-13	695	68
705	It was meh. The host was very helpful and pleasant and the apartment was breath taking.\n  The two days I spent there were well worth the price. all in all It was great.	2019-02-02	705	68
715	OMG! The host was nice but couldn't stop talking about her cats and the house was lovely.\n  The five days I spent there were quite pleasent. I we had a wonderful stay.	2018-08-14	715	69
725	It was nice. The host was friendly and the townhouse was lovely.\n  The two days I spent there were quite pleasent. I absolutely loved my time there.	2019-01-25	725	70
735	Great space. The host was warm and friendly and the villa was just as advertised.\n  The four days I spent there were fun and relaxing. I had a great time.	2018-09-22	735	71
745	It was nice. The host was nice but couldn't stop talking about her cats and the apartment was lovely.\n  The three days I spent there were well worth the price. I hated it.	2018-11-21	745	73
748	OMG! The host was kinda a jerk and the townhouse was cute and cozy.\n  The four days I spent there were fun and relaxing. In conclusion I absolutely loved my time there.	2018-07-11	748	74
755	Very clean and beautiful decore! The host was very helpful and pleasant and the house was cute and cozy.\n  The two days I spent there were fun and relaxing. In conclusion I we had a wonderful stay.	2018-10-03	755	76
758	What a blast! The host was nice but couldn't stop talking about her cats and the apartment was breath taking.\n  The three days I spent there were well worth the price. In conclusion I would never go back.	2018-06-03	758	76
765	It was meh. The host was kinda a jerk and the house was just as advertised.\n  The five days I spent there were quite pleasent. I we had a wonderful stay.	2018-09-10	765	76
768	Great space. The host was kinda a jerk and the home was breath taking.\n  The four days I spent there were fun and relaxing. I hated it.	2018-10-06	768	76
775	Very clean and beautiful decore! The host was warm and friendly and the apartment was just what the doctor ordered.\n  The five days I spent there were quite pleasent. In conclusion I would say things went very well.	2019-05-23	775	78
778	Great space. The host was nice but couldn't stop talking about her cats and the townhouse was just as advertised.\n  The four days I spent there were well worth the price. I hated it.	2019-05-08	778	78
785	What a blast! The host was nice but couldn't stop talking about her cats and the villa was just what the doctor ordered.\n  The three days I spent there were well worth the price. all in all I had a great time.	2018-07-07	785	78
788	From the moment I saw the place I knew it would be a trainwreck. The host was warm and friendly and the townhouse was breath taking.\n  The four days I spent there were quite pleasent. I would say things went very well.	2019-03-05	788	78
795	The host was charming and the home was breath taking.\n  The four days I spent there were quite pleasent. I would say things went very well.	2018-08-10	795	79
798	JUST. WOW. The host was kinda a jerk and the house was just as advertised.\n  The three days I spent there were well worth the price. I would never go back.	2018-06-02	798	79
805	It was nice. The host was kinda a jerk and the villa was breath taking.\n  The three days I spent there were fun and relaxing. I had a great time.	2018-12-01	805	80
808	The host was nice but couldn't stop talking about her cats and the house was just what the doctor ordered.\n  The five days I spent there were interesting to say the least. I had a great time.	2018-12-25	808	80
815	JUST. WOW. The host was charming and the home was lovely.\n  The four days I spent there were fun and relaxing. I we had a wonderful stay.	2018-06-20	815	81
818	Great space. The host was kinda a jerk and the house was lovely.\n  The four days I spent there were well worth the price. In conclusion I had a great time.	2019-05-04	818	81
824	The host was kinda a jerk and the house was cute and cozy.\n  The three days I spent there were quite pleasent. I would say things went very well.	2019-04-07	824	81
825	It was meh. The host was friendly and the apartment was breath taking.\n  The three days I spent there were quite pleasent. I absolutely loved my time there.	2018-11-14	825	81
828	Great space. The host was warm and friendly and the house was cute and cozy.\n  The two days I spent there were well worth the price. I would never go back.	2018-09-06	828	82
829	JUST. WOW. The host was friendly and the apartment was cute and cozy.\n  The three days I spent there were fun and relaxing. all in all I hated it.	2018-06-19	829	82
830	My wife and I really enjoyed the location. The host was charming and the house was cute and cozy.\n  The five days I spent there were well worth the price. I hated it.	2018-08-29	830	82
831	Very clean and beautiful decore! The host was very helpful and pleasant and the home was just as advertised.\n  The two days I spent there were interesting to say the least. I would say things went very well.	2018-06-04	831	83
39	The host was nice but couldn't stop talking about her cats and the apartment was lovely.\n  The four days I spent there were interesting to say the least. I absolutely loved my time there.	2019-01-04	39	4
54	The host was friendly and the townhouse was cute and cozy.\n  The three days I spent there were fun and relaxing. In conclusion I hated it.	2018-06-26	54	5
64	What a blast! The host was charming and the apartment was cute and cozy.\n  The two days I spent there were fun and relaxing. all in all I hated it.	2019-05-16	64	7
74	It was nice. The host was charming and the house was lovely.\n  The five days I spent there were interesting to say the least. I would never go back.	2018-07-30	74	8
84	Unfuhgetable! The host was very helpful and pleasant and the home was breath taking.\n  The five days I spent there were well worth the price. In conclusion It was great.	2019-05-20	84	10
94	OMG! The host was kinda a jerk and the villa was cute and cozy.\n  The five days I spent there were interesting to say the least. It was great.	2019-04-16	94	11
104	It was nice. The host was very helpful and pleasant and the apartment was lovely.\n  The two days I spent there were quite pleasent. I had a great time.	2018-11-15	104	12
117	The host was kinda a jerk and the townhouse was lovely.\n  The five days I spent there were well worth the price. It was great.	2018-06-16	117	14
127	My wife and I really enjoyed the location. The host was friendly and the apartment was lovely.\n  The three days I spent there were quite pleasent. I hated it.	2018-12-31	127	14
137	It was meh. The host was warm and friendly and the apartment was lovely.\n  The five days I spent there were well worth the price. I we had a wonderful stay.	2019-04-20	137	15
147	The host was charming and the house was lovely.\n  The two days I spent there were interesting to say the least. I hated it.	2019-03-15	147	15
157	It was meh. The host was charming and the home was breath taking.\n  The four days I spent there were quite pleasent. all in all I would say things went very well.	2018-08-19	157	17
167	It was meh. The host was warm and friendly and the villa was just what the doctor ordered.\n  The five days I spent there were fun and relaxing. I absolutely loved my time there.	2018-10-21	167	17
177	WARNING: not as advertised. The host was kinda a jerk and the house was breath taking.\n  The five days I spent there were quite pleasent. I would say things went very well.	2018-11-26	177	18
187	Good news everyone! The host was kinda a jerk and the house was lovely.\n  The three days I spent there were interesting to say the least. I absolutely loved my time there.	2018-11-06	187	19
197	It was meh. The host was warm and friendly and the villa was just what the doctor ordered.\n  The three days I spent there were well worth the price. I had a great time.	2019-04-21	197	20
207	It was nice. The host was very helpful and pleasant and the house was cute and cozy.\n  The two days I spent there were quite pleasent. In conclusion It was great.	2018-07-24	207	22
217	It was meh. The host was nice but couldn't stop talking about her cats and the house was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. I we had a wonderful stay.	2019-02-14	217	23
227	My wife and I really enjoyed the location. The host was charming and the townhouse was breath taking.\n  The two days I spent there were quite pleasent. I would say things went very well.	2018-06-15	227	23
237	From the moment I saw the place I knew it would be a trainwreck. The host was warm and friendly and the home was just as advertised.\n  The two days I spent there were well worth the price. In conclusion I absolutely loved my time there.	2018-12-22	237	24
245	Unfuhgetable! The host was nice but couldn't stop talking about her cats and the house was just what the doctor ordered.\n  The five days I spent there were interesting to say the least. In conclusion I absolutely loved my time there.	2019-04-12	245	25
255	JUST. WOW. The host was charming and the apartment was just what the doctor ordered.\n  The two days I spent there were fun and relaxing. It was great.	2018-09-03	255	26
265	What a blast! The host was friendly and the house was lovely.\n  The five days I spent there were fun and relaxing. I would say things went very well.	2018-09-06	265	27
275	It was nice. The host was kinda a jerk and the home was just as advertised.\n  The three days I spent there were fun and relaxing. I had a great time.	2018-10-16	275	29
285	WARNING: not as advertised. The host was kinda a jerk and the house was breath taking.\n  The four days I spent there were fun and relaxing. I hated it.	2019-03-22	285	30
295	The host was charming and the house was lovely.\n  The two days I spent there were well worth the price. I absolutely loved my time there.	2018-07-08	295	32
305	The host was very helpful and pleasant and the apartment was lovely.\n  The four days I spent there were fun and relaxing. I absolutely loved my time there.	2019-05-19	305	33
315	What a blast! The host was charming and the house was cute and cozy.\n  The three days I spent there were quite pleasent. It was great.	2019-03-23	315	33
325	It was meh. The host was warm and friendly and the villa was just as advertised.\n  The five days I spent there were interesting to say the least. I would never go back.	2018-12-17	325	34
335	It was meh. The host was nice but couldn't stop talking about her cats and the villa was lovely.\n  The two days I spent there were interesting to say the least. In conclusion I had a great time.	2018-10-07	335	35
345	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the townhouse was breath taking.\n  The three days I spent there were quite pleasent. I we had a wonderful stay.	2019-01-05	345	36
355	Good news everyone! The host was nice but couldn't stop talking about her cats and the apartment was cute and cozy.\n  The three days I spent there were quite pleasent. I hated it.	2019-04-09	355	37
365	What a blast! The host was charming and the apartment was just as advertised.\n  The five days I spent there were interesting to say the least. I we had a wonderful stay.	2018-09-04	365	38
375	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the home was just as advertised.\n  The five days I spent there were quite pleasent. In conclusion I absolutely loved my time there.	2018-12-18	375	39
385	The host was very helpful and pleasant and the villa was cute and cozy.\n  The two days I spent there were well worth the price. I we had a wonderful stay.	2019-04-25	385	39
395	The host was friendly and the townhouse was lovely.\n  The five days I spent there were well worth the price. I hated it.	2018-06-30	395	41
405	Unfuhgetable! The host was nice but couldn't stop talking about her cats and the house was just what the doctor ordered.\n  The four days I spent there were well worth the price. all in all I would never go back.	2019-04-15	405	41
832	The host was nice but couldn't stop talking about her cats and the apartment was breath taking.\n  The five days I spent there were fun and relaxing. all in all It was great.	2018-09-14	832	83
842	OMG! The host was very helpful and pleasant and the home was just as advertised.\n  The five days I spent there were fun and relaxing. I we had a wonderful stay.	2018-12-22	842	84
852	The host was friendly and the apartment was just what the doctor ordered.\n  The five days I spent there were fun and relaxing. It was great.	2018-11-26	852	85
862	My wife and I really enjoyed the location. The host was nice but couldn't stop talking about her cats and the house was cute and cozy.\n  The three days I spent there were quite pleasent. I hated it.	2019-04-28	862	85
872	It was nice. The host was nice but couldn't stop talking about her cats and the townhouse was just what the doctor ordered.\n  The five days I spent there were quite pleasent. I absolutely loved my time there.	2018-09-26	872	87
882	Good news everyone! The host was charming and the apartment was breath taking.\n  The three days I spent there were quite pleasent. all in all I would say things went very well.	2018-08-17	882	87
892	WARNING: not as advertised. The host was warm and friendly and the apartment was cute and cozy.\n  The three days I spent there were well worth the price. I had a great time.	2018-07-13	892	88
902	It was meh. The host was charming and the house was just what the doctor ordered.\n  The five days I spent there were quite pleasent. I had a great time.	2018-11-03	902	89
912	The host was warm and friendly and the house was lovely.\n  The two days I spent there were well worth the price. I hated it.	2018-12-11	912	90
922	The host was charming and the apartment was just as advertised.\n  The three days I spent there were quite pleasent. I had a great time.	2018-06-16	922	90
932	OMG! The host was warm and friendly and the apartment was breath taking.\n  The five days I spent there were well worth the price. all in all I would say things went very well.	2018-08-26	932	91
942	OMG! The host was very helpful and pleasant and the apartment was cute and cozy.\n  The four days I spent there were interesting to say the least. I would never go back.	2018-08-21	942	91
952	Great space. The host was very helpful and pleasant and the townhouse was just what the doctor ordered.\n  The three days I spent there were interesting to say the least. I would never go back.	2019-04-29	952	92
962	What a blast! The host was friendly and the apartment was just as advertised.\n  The five days I spent there were fun and relaxing. It was great.	2018-09-02	962	93
969	It was meh. The host was kinda a jerk and the home was lovely.\n  The two days I spent there were fun and relaxing. In conclusion I would never go back.	2019-05-08	969	93
981	Very clean and beautiful decore! The host was kinda a jerk and the home was breath taking.\n  The two days I spent there were well worth the price. It was great.	2018-08-20	981	94
989	It was nice. The host was friendly and the apartment was cute and cozy.\n  The two days I spent there were well worth the price. all in all I hated it.	2019-01-25	989	95
1000	Unfuhgetable! The host was nice but couldn't stop talking about her cats and the townhouse was breath taking.\n  The two days I spent there were quite pleasent. In conclusion I would say things went very well.	2018-06-08	1000	95
1007	It was meh. The host was charming and the apartment was just what the doctor ordered.\n  The three days I spent there were quite pleasent. I had a great time.	2019-01-02	1007	96
1020	Great space. The host was charming and the villa was just what the doctor ordered.\n  The five days I spent there were interesting to say the least. all in all I we had a wonderful stay.	2018-09-03	1020	97
1031	The host was friendly and the townhouse was lovely.\n  The four days I spent there were quite pleasent. I hated it.	2018-10-17	1031	98
1038	The host was very helpful and pleasant and the apartment was breath taking.\n  The three days I spent there were fun and relaxing. I absolutely loved my time there.	2018-08-29	1038	98
1048	Unfuhgetable! The host was friendly and the house was cute and cozy.\n  The five days I spent there were fun and relaxing. I had a great time.	2018-08-02	1048	100
833	From the moment I saw the place I knew it would be a trainwreck. The host was charming and the apartment was just as advertised.\n  The five days I spent there were fun and relaxing. I would say things went very well.	2018-09-30	833	83
843	From the moment I saw the place I knew it would be a trainwreck. The host was charming and the villa was just as advertised.\n  The four days I spent there were fun and relaxing. I absolutely loved my time there.	2018-11-25	843	84
853	My wife and I really enjoyed the location. The host was charming and the house was just as advertised.\n  The two days I spent there were well worth the price. I had a great time.	2019-03-06	853	85
863	It was meh. The host was warm and friendly and the apartment was cute and cozy.\n  The five days I spent there were well worth the price. I absolutely loved my time there.	2018-11-07	863	85
873	OMG! The host was very helpful and pleasant and the apartment was just as advertised.\n  The three days I spent there were interesting to say the least. I had a great time.	2019-04-20	873	87
883	Very clean and beautiful decore! The host was friendly and the home was lovely.\n  The three days I spent there were well worth the price. I hated it.	2018-09-22	883	87
893	It was meh. The host was very helpful and pleasant and the home was lovely.\n  The four days I spent there were interesting to say the least. In conclusion I would never go back.	2018-08-24	893	88
903	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the house was lovely.\n  The three days I spent there were fun and relaxing. I would never go back.	2019-04-04	903	89
913	Good news everyone! The host was warm and friendly and the apartment was just what the doctor ordered.\n  The four days I spent there were well worth the price. I we had a wonderful stay.	2018-12-24	913	90
923	The host was warm and friendly and the house was just what the doctor ordered.\n  The five days I spent there were quite pleasent. I would never go back.	2019-05-02	923	90
933	What a blast! The host was kinda a jerk and the townhouse was breath taking.\n  The two days I spent there were fun and relaxing. I would never go back.	2018-11-12	933	91
943	Unfuhgetable! The host was very helpful and pleasant and the apartment was just as advertised.\n  The five days I spent there were fun and relaxing. It was great.	2018-11-19	943	91
953	Good news everyone! The host was warm and friendly and the house was cute and cozy.\n  The five days I spent there were fun and relaxing. I would never go back.	2019-04-05	953	92
963	It was nice. The host was very helpful and pleasant and the townhouse was breath taking.\n  The four days I spent there were interesting to say the least. I had a great time.	2018-10-19	963	93
973	The host was charming and the apartment was lovely.\n  The three days I spent there were interesting to say the least. I would never go back.	2019-04-16	973	94
983	Great space. The host was nice but couldn't stop talking about her cats and the apartment was just as advertised.\n  The five days I spent there were interesting to say the least. I hated it.	2018-07-02	983	94
996	JUST. WOW. The host was very helpful and pleasant and the apartment was cute and cozy.\n  The three days I spent there were interesting to say the least. I hated it.	2018-09-05	996	95
1005	JUST. WOW. The host was very helpful and pleasant and the house was cute and cozy.\n  The two days I spent there were fun and relaxing. I would say things went very well.	2019-01-23	1005	96
1014	Very clean and beautiful decore! The host was warm and friendly and the apartment was cute and cozy.\n  The three days I spent there were interesting to say the least. It was great.	2019-04-20	1014	97
1025	What a blast! The host was warm and friendly and the townhouse was breath taking.\n  The three days I spent there were fun and relaxing. I would say things went very well.	2019-04-19	1025	98
1034	Good news everyone! The host was warm and friendly and the apartment was cute and cozy.\n  The five days I spent there were interesting to say the least. In conclusion I would say things went very well.	2018-06-15	1034	98
1046	Great space. The host was friendly and the house was breath taking.\n  The four days I spent there were well worth the price. I absolutely loved my time there.	2019-04-06	1046	100
1056	The host was nice but couldn't stop talking about her cats and the apartment was breath taking.\n  The five days I spent there were interesting to say the least. In conclusion I absolutely loved my time there.	2019-04-13	1056	100
834	It was nice. The host was charming and the house was breath taking.\n  The three days I spent there were quite pleasent. It was great.	2019-05-10	834	83
844	My wife and I really enjoyed the location. The host was very helpful and pleasant and the apartment was breath taking.\n  The two days I spent there were well worth the price. I had a great time.	2018-07-09	844	84
854	My wife and I really enjoyed the location. The host was warm and friendly and the apartment was breath taking.\n  The four days I spent there were interesting to say the least. I hated it.	2019-01-13	854	85
864	OMG! The host was kinda a jerk and the house was lovely.\n  The two days I spent there were well worth the price. I had a great time.	2018-09-03	864	85
874	My wife and I really enjoyed the location. The host was friendly and the villa was lovely.\n  The five days I spent there were well worth the price. I would never go back.	2019-05-28	874	87
884	The host was warm and friendly and the apartment was lovely.\n  The five days I spent there were fun and relaxing. I hated it.	2019-02-15	884	87
894	OMG! The host was warm and friendly and the house was cute and cozy.\n  The five days I spent there were fun and relaxing. all in all I we had a wonderful stay.	2019-05-30	894	88
904	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the house was breath taking.\n  The five days I spent there were quite pleasent. In conclusion I would never go back.	2019-04-03	904	89
914	It was nice. The host was nice but couldn't stop talking about her cats and the apartment was just as advertised.\n  The five days I spent there were quite pleasent. I had a great time.	2019-05-13	914	90
924	It was nice. The host was warm and friendly and the home was just as advertised.\n  The three days I spent there were well worth the price. In conclusion I would say things went very well.	2018-10-04	924	90
934	JUST. WOW. The host was very helpful and pleasant and the villa was just what the doctor ordered.\n  The four days I spent there were fun and relaxing. I absolutely loved my time there.	2019-05-15	934	91
944	WARNING: not as advertised. The host was kinda a jerk and the apartment was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. I would never go back.	2018-08-06	944	91
954	It was nice. The host was nice but couldn't stop talking about her cats and the apartment was cute and cozy.\n  The three days I spent there were quite pleasent. all in all I we had a wonderful stay.	2019-01-28	954	92
964	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the apartment was breath taking.\n  The five days I spent there were fun and relaxing. I absolutely loved my time there.	2019-03-03	964	93
976	My wife and I really enjoyed the location. The host was warm and friendly and the apartment was just as advertised.\n  The two days I spent there were quite pleasent. I would never go back.	2018-09-30	976	94
986	WARNING: not as advertised. The host was kinda a jerk and the house was just as advertised.\n  The four days I spent there were quite pleasent. all in all I would never go back.	2018-07-29	986	94
995	It was meh. The host was nice but couldn't stop talking about her cats and the villa was cute and cozy.\n  The five days I spent there were quite pleasent. all in all I would say things went very well.	2018-09-09	995	95
1004	Good news everyone! The host was kinda a jerk and the villa was just as advertised.\n  The three days I spent there were quite pleasent. I we had a wonderful stay.	2018-08-23	1004	95
1013	Very clean and beautiful decore! The host was friendly and the home was just what the doctor ordered.\n  The four days I spent there were fun and relaxing. I would never go back.	2018-06-18	1013	96
1023	The host was warm and friendly and the house was lovely.\n  The four days I spent there were interesting to say the least. In conclusion I hated it.	2018-10-25	1023	97
1033	The host was friendly and the house was just as advertised.\n  The two days I spent there were fun and relaxing. It was great.	2019-02-26	1033	98
1043	JUST. WOW. The host was warm and friendly and the house was just what the doctor ordered.\n  The four days I spent there were well worth the price. I absolutely loved my time there.	2019-01-25	1043	100
1053	It was meh. The host was charming and the apartment was just as advertised.\n  The three days I spent there were interesting to say the least. I hated it.	2018-11-09	1053	100
835	The host was warm and friendly and the apartment was just what the doctor ordered.\n  The two days I spent there were well worth the price. It was great.	2018-09-20	835	83
845	From the moment I saw the place I knew it would be a trainwreck. The host was nice but couldn't stop talking about her cats and the house was just as advertised.\n  The five days I spent there were fun and relaxing. I hated it.	2019-04-25	845	84
855	My wife and I really enjoyed the location. The host was friendly and the apartment was breath taking.\n  The five days I spent there were quite pleasent. all in all I would never go back.	2018-11-28	855	85
865	Great space. The host was nice but couldn't stop talking about her cats and the apartment was just what the doctor ordered.\n  The five days I spent there were quite pleasent. I we had a wonderful stay.	2018-08-14	865	85
875	My wife and I really enjoyed the location. The host was very helpful and pleasant and the house was just what the doctor ordered.\n  The two days I spent there were well worth the price. I had a great time.	2018-12-07	875	87
885	The host was friendly and the house was breath taking.\n  The three days I spent there were well worth the price. In conclusion I would never go back.	2019-03-04	885	87
895	The host was warm and friendly and the townhouse was cute and cozy.\n  The two days I spent there were interesting to say the least. all in all It was great.	2019-04-14	895	88
905	It was nice. The host was nice but couldn't stop talking about her cats and the house was breath taking.\n  The two days I spent there were interesting to say the least. In conclusion I hated it.	2018-08-25	905	89
915	Unfuhgetable! The host was nice but couldn't stop talking about her cats and the apartment was just as advertised.\n  The five days I spent there were interesting to say the least. I hated it.	2018-12-05	915	90
925	From the moment I saw the place I knew it would be a trainwreck. The host was friendly and the house was breath taking.\n  The four days I spent there were quite pleasent. all in all I hated it.	2018-08-06	925	90
935	What a blast! The host was friendly and the villa was cute and cozy.\n  The four days I spent there were fun and relaxing. I would never go back.	2019-01-05	935	91
945	WARNING: not as advertised. The host was nice but couldn't stop talking about her cats and the townhouse was cute and cozy.\n  The four days I spent there were fun and relaxing. I absolutely loved my time there.	2019-05-06	945	91
955	Great space. The host was charming and the house was just as advertised.\n  The three days I spent there were fun and relaxing. I had a great time.	2018-07-26	955	92
965	My wife and I really enjoyed the location. The host was friendly and the villa was cute and cozy.\n  The three days I spent there were fun and relaxing. I hated it.	2019-01-18	965	93
974	What a blast! The host was very helpful and pleasant and the townhouse was cute and cozy.\n  The five days I spent there were interesting to say the least. I would never go back.	2018-08-06	974	94
984	JUST. WOW. The host was charming and the house was just what the doctor ordered.\n  The four days I spent there were well worth the price. In conclusion I absolutely loved my time there.	2018-12-30	984	94
993	JUST. WOW. The host was friendly and the apartment was just what the doctor ordered.\n  The three days I spent there were well worth the price. I absolutely loved my time there.	2018-10-12	993	95
1006	Good news everyone! The host was warm and friendly and the apartment was just what the doctor ordered.\n  The four days I spent there were well worth the price. I we had a wonderful stay.	2018-07-29	1006	96
1015	The host was warm and friendly and the home was just as advertised.\n  The three days I spent there were interesting to say the least. It was great.	2018-07-26	1015	97
1026	The host was friendly and the townhouse was cute and cozy.\n  The four days I spent there were quite pleasent. all in all I would say things went very well.	2018-08-16	1026	98
1035	The host was kinda a jerk and the house was breath taking.\n  The two days I spent there were fun and relaxing. all in all I absolutely loved my time there.	2018-12-16	1035	98
1044	My wife and I really enjoyed the location. The host was kinda a jerk and the apartment was lovely.\n  The five days I spent there were fun and relaxing. It was great.	2019-04-03	1044	100
1054	OMG! The host was charming and the house was breath taking.\n  The four days I spent there were quite pleasent. I had a great time.	2018-11-19	1054	100
836	The host was very helpful and pleasant and the apartment was cute and cozy.\n  The five days I spent there were fun and relaxing. I would say things went very well.	2019-03-27	836	83
846	WARNING: not as advertised. The host was kinda a jerk and the house was breath taking.\n  The three days I spent there were fun and relaxing. I absolutely loved my time there.	2019-04-11	846	84
856	Unfuhgetable! The host was warm and friendly and the apartment was just as advertised.\n  The three days I spent there were interesting to say the least. I we had a wonderful stay.	2018-09-19	856	85
866	The host was kinda a jerk and the townhouse was just as advertised.\n  The three days I spent there were interesting to say the least. I absolutely loved my time there.	2018-06-19	866	86
876	Great space. The host was charming and the house was cute and cozy.\n  The five days I spent there were interesting to say the least. all in all I absolutely loved my time there.	2018-12-28	876	87
886	Good news everyone! The host was very helpful and pleasant and the house was just as advertised.\n  The two days I spent there were quite pleasent. I would say things went very well.	2018-07-13	886	87
896	From the moment I saw the place I knew it would be a trainwreck. The host was warm and friendly and the house was just what the doctor ordered.\n  The four days I spent there were quite pleasent. I absolutely loved my time there.	2018-12-29	896	88
906	From the moment I saw the place I knew it would be a trainwreck. The host was kinda a jerk and the home was breath taking.\n  The three days I spent there were well worth the price. In conclusion It was great.	2018-10-29	906	89
916	Unfuhgetable! The host was friendly and the house was just what the doctor ordered.\n  The three days I spent there were fun and relaxing. I absolutely loved my time there.	2019-05-24	916	90
926	Unfuhgetable! The host was warm and friendly and the house was cute and cozy.\n  The three days I spent there were interesting to say the least. I would say things went very well.	2019-04-14	926	90
936	The host was kinda a jerk and the house was just what the doctor ordered.\n  The four days I spent there were quite pleasent. In conclusion It was great.	2019-04-30	936	91
946	Unfuhgetable! The host was kinda a jerk and the house was lovely.\n  The five days I spent there were quite pleasent. I we had a wonderful stay.	2018-08-04	946	91
956	The host was friendly and the house was lovely.\n  The three days I spent there were quite pleasent. In conclusion I had a great time.	2018-11-09	956	92
966	Good news everyone! The host was friendly and the apartment was just as advertised.\n  The three days I spent there were quite pleasent. In conclusion It was great.	2018-09-12	966	93
975	JUST. WOW. The host was friendly and the house was just as advertised.\n  The four days I spent there were quite pleasent. I hated it.	2018-12-16	975	94
985	The host was nice but couldn't stop talking about her cats and the apartment was breath taking.\n  The three days I spent there were quite pleasent. I would never go back.	2018-12-10	985	94
994	Very clean and beautiful decore! The host was charming and the house was lovely.\n  The five days I spent there were fun and relaxing. I hated it.	2018-08-18	994	95
1003	It was meh. The host was nice but couldn't stop talking about her cats and the house was just as advertised.\n  The two days I spent there were well worth the price. I would never go back.	2018-06-20	1003	95
1016	What a blast! The host was nice but couldn't stop talking about her cats and the home was lovely.\n  The two days I spent there were quite pleasent. all in all I hated it.	2018-08-03	1016	97
1024	WARNING: not as advertised. The host was kinda a jerk and the home was breath taking.\n  The four days I spent there were quite pleasent. I would never go back.	2018-11-14	1024	97
1036	Good news everyone! The host was kinda a jerk and the townhouse was cute and cozy.\n  The three days I spent there were fun and relaxing. I hated it.	2019-04-08	1036	98
1045	Unfuhgetable! The host was nice but couldn't stop talking about her cats and the apartment was cute and cozy.\n  The three days I spent there were well worth the price. It was great.	2018-12-09	1045	100
1055	The host was friendly and the home was cute and cozy.\n  The two days I spent there were fun and relaxing. I we had a wonderful stay.	2018-10-22	1055	100
837	It was nice. The host was warm and friendly and the apartment was cute and cozy.\n  The three days I spent there were fun and relaxing. I we had a wonderful stay.	2018-12-05	837	84
847	Great space. The host was nice but couldn't stop talking about her cats and the house was cute and cozy.\n  The three days I spent there were interesting to say the least. all in all I had a great time.	2018-11-28	847	84
857	OMG! The host was nice but couldn't stop talking about her cats and the home was just as advertised.\n  The four days I spent there were well worth the price. all in all I absolutely loved my time there.	2019-02-25	857	85
867	The host was kinda a jerk and the apartment was cute and cozy.\n  The five days I spent there were fun and relaxing. I we had a wonderful stay.	2019-04-14	867	86
877	JUST. WOW. The host was charming and the house was breath taking.\n  The two days I spent there were well worth the price. I absolutely loved my time there.	2019-05-25	877	87
887	The host was warm and friendly and the house was cute and cozy.\n  The five days I spent there were quite pleasent. I absolutely loved my time there.	2019-04-27	887	87
897	Very clean and beautiful decore! The host was nice but couldn't stop talking about her cats and the townhouse was just as advertised.\n  The two days I spent there were fun and relaxing. all in all It was great.	2018-12-28	897	89
907	Great space. The host was warm and friendly and the apartment was lovely.\n  The four days I spent there were fun and relaxing. I hated it.	2018-06-07	907	89
917	It was nice. The host was kinda a jerk and the house was just as advertised.\n  The four days I spent there were interesting to say the least. all in all I would never go back.	2018-12-25	917	90
927	From the moment I saw the place I knew it would be a trainwreck. The host was friendly and the home was just what the doctor ordered.\n  The two days I spent there were quite pleasent. all in all I would say things went very well.	2018-09-10	927	90
937	It was meh. The host was charming and the house was lovely.\n  The five days I spent there were well worth the price. I had a great time.	2019-02-08	937	91
947	WARNING: not as advertised. The host was very helpful and pleasant and the villa was cute and cozy.\n  The five days I spent there were quite pleasent. I absolutely loved my time there.	2019-02-20	947	91
957	From the moment I saw the place I knew it would be a trainwreck. The host was very helpful and pleasant and the home was breath taking.\n  The five days I spent there were quite pleasent. It was great.	2018-12-09	957	92
967	Very clean and beautiful decore! The host was warm and friendly and the villa was lovely.\n  The two days I spent there were quite pleasent. I we had a wonderful stay.	2018-06-16	967	93
977	JUST. WOW. The host was very helpful and pleasant and the house was breath taking.\n  The two days I spent there were quite pleasent. I hated it.	2018-06-01	977	94
987	The host was nice but couldn't stop talking about her cats and the apartment was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. I hated it.	2018-09-27	987	94
999	From the moment I saw the place I knew it would be a trainwreck. The host was kinda a jerk and the house was lovely.\n  The four days I spent there were quite pleasent. I we had a wonderful stay.	2019-03-05	999	95
1011	Very clean and beautiful decore! The host was charming and the townhouse was lovely.\n  The two days I spent there were quite pleasent. I had a great time.	2018-12-24	1011	96
1018	It was meh. The host was friendly and the villa was just as advertised.\n  The three days I spent there were fun and relaxing. all in all I would say things went very well.	2018-12-22	1018	97
1032	Good news everyone! The host was nice but couldn't stop talking about her cats and the house was cute and cozy.\n  The three days I spent there were quite pleasent. It was great.	2018-11-07	1032	98
1039	The host was very helpful and pleasant and the villa was cute and cozy.\n  The three days I spent there were quite pleasent. I would never go back.	2019-03-24	1039	98
1049	My wife and I really enjoyed the location. The host was very helpful and pleasant and the villa was cute and cozy.\n  The five days I spent there were quite pleasent. all in all I we had a wonderful stay.	2019-05-23	1049	100
838	The host was friendly and the villa was just what the doctor ordered.\n  The three days I spent there were quite pleasent. In conclusion I hated it.	2018-11-14	838	84
848	What a blast! The host was very helpful and pleasant and the townhouse was just what the doctor ordered.\n  The four days I spent there were well worth the price. I would never go back.	2018-06-06	848	85
858	WARNING: not as advertised. The host was friendly and the house was cute and cozy.\n  The four days I spent there were interesting to say the least. all in all I would never go back.	2019-05-04	858	85
868	The host was kinda a jerk and the townhouse was just as advertised.\n  The two days I spent there were quite pleasent. I we had a wonderful stay.	2019-02-14	868	86
878	Very clean and beautiful decore! The host was nice but couldn't stop talking about her cats and the apartment was cute and cozy.\n  The four days I spent there were quite pleasent. I absolutely loved my time there.	2018-10-09	878	87
888	Unfuhgetable! The host was warm and friendly and the apartment was just as advertised.\n  The three days I spent there were fun and relaxing. all in all I had a great time.	2019-05-19	888	87
898	From the moment I saw the place I knew it would be a trainwreck. The host was warm and friendly and the house was lovely.\n  The five days I spent there were quite pleasent. I we had a wonderful stay.	2018-08-23	898	89
908	From the moment I saw the place I knew it would be a trainwreck. The host was charming and the apartment was just as advertised.\n  The three days I spent there were well worth the price. I absolutely loved my time there.	2018-12-12	908	89
918	It was meh. The host was warm and friendly and the apartment was just as advertised.\n  The two days I spent there were interesting to say the least. I absolutely loved my time there.	2018-07-21	918	90
928	The host was kinda a jerk and the villa was breath taking.\n  The three days I spent there were fun and relaxing. I absolutely loved my time there.	2018-08-01	928	90
938	Very clean and beautiful decore! The host was nice but couldn't stop talking about her cats and the villa was lovely.\n  The two days I spent there were fun and relaxing. In conclusion I would never go back.	2019-01-26	938	91
948	The host was nice but couldn't stop talking about her cats and the apartment was just as advertised.\n  The four days I spent there were interesting to say the least. I would say things went very well.	2018-11-12	948	91
958	The host was nice but couldn't stop talking about her cats and the villa was breath taking.\n  The two days I spent there were interesting to say the least. I would never go back.	2018-12-23	958	92
972	From the moment I saw the place I knew it would be a trainwreck. The host was warm and friendly and the home was cute and cozy.\n  The four days I spent there were quite pleasent. It was great.	2018-06-27	972	94
979	Unfuhgetable! The host was kinda a jerk and the apartment was lovely.\n  The five days I spent there were well worth the price. I had a great time.	2018-12-08	979	94
992	It was meh. The host was friendly and the home was cute and cozy.\n  The three days I spent there were well worth the price. I would say things went very well.	2018-12-27	992	95
998	Great space. The host was warm and friendly and the villa was cute and cozy.\n  The five days I spent there were fun and relaxing. In conclusion I absolutely loved my time there.	2019-04-06	998	95
1012	The host was nice but couldn't stop talking about her cats and the house was cute and cozy.\n  The three days I spent there were well worth the price. I would say things went very well.	2018-09-04	1012	96
1019	Unfuhgetable! The host was kinda a jerk and the villa was lovely.\n  The five days I spent there were interesting to say the least. It was great.	2019-05-20	1019	97
1030	OMG! The host was kinda a jerk and the home was lovely.\n  The three days I spent there were quite pleasent. It was great.	2018-07-14	1030	98
1041	What a blast! The host was warm and friendly and the home was lovely.\n  The three days I spent there were quite pleasent. It was great.	2019-04-04	1041	100
1051	Unfuhgetable! The host was nice but couldn't stop talking about her cats and the apartment was lovely.\n  The four days I spent there were interesting to say the least. It was great.	2018-06-16	1051	100
839	Great space. The host was charming and the villa was breath taking.\n  The three days I spent there were interesting to say the least. In conclusion I absolutely loved my time there.	2018-12-25	839	84
849	The host was nice but couldn't stop talking about her cats and the apartment was lovely.\n  The five days I spent there were fun and relaxing. I would never go back.	2018-06-17	849	85
859	The host was nice but couldn't stop talking about her cats and the house was breath taking.\n  The two days I spent there were well worth the price. all in all I absolutely loved my time there.	2018-11-27	859	85
869	Unfuhgetable! The host was very helpful and pleasant and the apartment was breath taking.\n  The five days I spent there were quite pleasent. In conclusion I absolutely loved my time there.	2018-10-17	869	86
879	Good news everyone! The host was very helpful and pleasant and the apartment was just what the doctor ordered.\n  The four days I spent there were quite pleasent. I hated it.	2018-10-06	879	87
889	My wife and I really enjoyed the location. The host was nice but couldn't stop talking about her cats and the villa was just what the doctor ordered.\n  The four days I spent there were interesting to say the least. I had a great time.	2018-10-24	889	88
899	Very clean and beautiful decore! The host was kinda a jerk and the apartment was breath taking.\n  The three days I spent there were fun and relaxing. In conclusion I hated it.	2018-07-08	899	89
909	WARNING: not as advertised. The host was friendly and the house was just as advertised.\n  The two days I spent there were interesting to say the least. In conclusion It was great.	2019-05-22	909	89
919	WARNING: not as advertised. The host was kinda a jerk and the townhouse was lovely.\n  The four days I spent there were quite pleasent. I hated it.	2018-12-09	919	90
929	The host was very helpful and pleasant and the villa was cute and cozy.\n  The three days I spent there were fun and relaxing. I would say things went very well.	2019-04-20	929	90
939	The host was friendly and the townhouse was just what the doctor ordered.\n  The two days I spent there were interesting to say the least. all in all I would say things went very well.	2018-08-05	939	91
949	Great space. The host was very helpful and pleasant and the villa was just as advertised.\n  The two days I spent there were well worth the price. I had a great time.	2018-11-20	949	91
959	It was meh. The host was kinda a jerk and the house was lovely.\n  The three days I spent there were quite pleasent. I would never go back.	2019-04-14	959	93
970	My wife and I really enjoyed the location. The host was charming and the townhouse was just as advertised.\n  The four days I spent there were fun and relaxing. It was great.	2019-01-06	970	94
982	Great space. The host was friendly and the home was just what the doctor ordered.\n  The five days I spent there were fun and relaxing. all in all I we had a wonderful stay.	2018-10-05	982	94
990	OMG! The host was kinda a jerk and the villa was lovely.\n  The three days I spent there were fun and relaxing. I we had a wonderful stay.	2019-02-05	990	95
1001	Unfuhgetable! The host was warm and friendly and the townhouse was just what the doctor ordered.\n  The three days I spent there were quite pleasent. all in all I had a great time.	2019-01-18	1001	95
1008	It was meh. The host was nice but couldn't stop talking about her cats and the villa was just as advertised.\n  The five days I spent there were quite pleasent. I had a great time.	2019-01-23	1008	96
1021	Very clean and beautiful decore! The host was warm and friendly and the apartment was just as advertised.\n  The three days I spent there were interesting to say the least. all in all I we had a wonderful stay.	2018-09-28	1021	97
1028	Very clean and beautiful decore! The host was nice but couldn't stop talking about her cats and the house was breath taking.\n  The four days I spent there were well worth the price. all in all I absolutely loved my time there.	2018-10-31	1028	98
1042	It was nice. The host was nice but couldn't stop talking about her cats and the apartment was cute and cozy.\n  The two days I spent there were fun and relaxing. I we had a wonderful stay.	2019-01-07	1042	100
1052	What a blast! The host was very helpful and pleasant and the villa was just as advertised.\n  The three days I spent there were well worth the price. I we had a wonderful stay.	2018-08-07	1052	100
840	Good news everyone! The host was warm and friendly and the house was just as advertised.\n  The five days I spent there were fun and relaxing. I absolutely loved my time there.	2018-12-22	840	84
850	OMG! The host was charming and the house was cute and cozy.\n  The three days I spent there were well worth the price. all in all I hated it.	2018-09-16	850	85
860	Unfuhgetable! The host was charming and the house was breath taking.\n  The three days I spent there were quite pleasent. I would say things went very well.	2018-08-12	860	85
870	JUST. WOW. The host was friendly and the apartment was breath taking.\n  The four days I spent there were well worth the price. I had a great time.	2018-06-02	870	86
880	From the moment I saw the place I knew it would be a trainwreck. The host was very helpful and pleasant and the apartment was breath taking.\n  The four days I spent there were well worth the price. It was great.	2018-12-17	880	87
890	WARNING: not as advertised. The host was kinda a jerk and the apartment was lovely.\n  The three days I spent there were well worth the price. I hated it.	2019-02-23	890	88
900	The host was nice but couldn't stop talking about her cats and the house was lovely.\n  The four days I spent there were quite pleasent. I absolutely loved my time there.	2019-04-05	900	89
910	My wife and I really enjoyed the location. The host was friendly and the house was cute and cozy.\n  The four days I spent there were well worth the price. I we had a wonderful stay.	2018-12-27	910	90
920	It was meh. The host was warm and friendly and the apartment was just what the doctor ordered.\n  The two days I spent there were fun and relaxing. I would say things went very well.	2019-01-13	920	90
930	From the moment I saw the place I knew it would be a trainwreck. The host was warm and friendly and the townhouse was cute and cozy.\n  The four days I spent there were well worth the price. all in all It was great.	2018-12-24	930	91
940	What a blast! The host was charming and the apartment was just as advertised.\n  The five days I spent there were interesting to say the least. all in all I had a great time.	2018-08-06	940	91
950	Unfuhgetable! The host was charming and the villa was lovely.\n  The four days I spent there were interesting to say the least. In conclusion I had a great time.	2018-09-04	950	92
960	The host was warm and friendly and the house was lovely.\n  The four days I spent there were fun and relaxing. I would never go back.	2018-12-28	960	93
971	It was nice. The host was nice but couldn't stop talking about her cats and the apartment was just what the doctor ordered.\n  The three days I spent there were interesting to say the least. all in all It was great.	2018-09-13	971	94
978	OMG! The host was warm and friendly and the home was lovely.\n  The three days I spent there were fun and relaxing. I had a great time.	2019-02-03	978	94
991	What a blast! The host was charming and the villa was just as advertised.\n  The four days I spent there were well worth the price. I absolutely loved my time there.	2018-06-21	991	95
997	WARNING: not as advertised. The host was charming and the apartment was breath taking.\n  The four days I spent there were interesting to say the least. all in all I would never go back.	2019-04-05	997	95
1010	It was meh. The host was kinda a jerk and the home was just what the doctor ordered.\n  The three days I spent there were interesting to say the least. I absolutely loved my time there.	2019-01-20	1010	96
1017	My wife and I really enjoyed the location. The host was charming and the home was breath taking.\n  The five days I spent there were quite pleasent. I we had a wonderful stay.	2018-07-23	1017	97
1027	Good news everyone! The host was kinda a jerk and the townhouse was breath taking.\n  The two days I spent there were well worth the price. all in all I we had a wonderful stay.	2018-07-23	1027	98
1037	OMG! The host was nice but couldn't stop talking about her cats and the house was cute and cozy.\n  The four days I spent there were interesting to say the least. In conclusion I we had a wonderful stay.	2018-10-14	1037	98
1047	It was meh. The host was nice but couldn't stop talking about her cats and the apartment was just what the doctor ordered.\n  The five days I spent there were well worth the price. I absolutely loved my time there.	2019-02-27	1047	100
841	OMG! The host was charming and the home was just as advertised.\n  The three days I spent there were interesting to say the least. all in all I hated it.	2019-04-14	841	84
851	It was meh. The host was charming and the home was just as advertised.\n  The five days I spent there were interesting to say the least. In conclusion It was great.	2019-05-10	851	85
861	The host was very helpful and pleasant and the townhouse was cute and cozy.\n  The five days I spent there were well worth the price. all in all I we had a wonderful stay.	2018-10-23	861	85
871	OMG! The host was charming and the home was cute and cozy.\n  The five days I spent there were quite pleasent. I had a great time.	2018-11-19	871	87
881	It was nice. The host was friendly and the apartment was cute and cozy.\n  The five days I spent there were quite pleasent. I we had a wonderful stay.	2019-03-29	881	87
891	The host was warm and friendly and the home was lovely.\n  The four days I spent there were interesting to say the least. In conclusion It was great.	2018-10-23	891	88
901	It was meh. The host was charming and the villa was cute and cozy.\n  The three days I spent there were interesting to say the least. I we had a wonderful stay.	2019-02-03	901	89
911	Very clean and beautiful decore! The host was charming and the house was lovely.\n  The four days I spent there were fun and relaxing. I would say things went very well.	2019-01-03	911	90
921	OMG! The host was nice but couldn't stop talking about her cats and the townhouse was cute and cozy.\n  The five days I spent there were interesting to say the least. all in all I we had a wonderful stay.	2019-01-04	921	90
931	It was nice. The host was warm and friendly and the house was lovely.\n  The two days I spent there were quite pleasent. In conclusion I we had a wonderful stay.	2019-04-18	931	91
941	The host was nice but couldn't stop talking about her cats and the house was just as advertised.\n  The five days I spent there were well worth the price. It was great.	2019-01-12	941	91
951	Unfuhgetable! The host was warm and friendly and the home was breath taking.\n  The three days I spent there were fun and relaxing. I would say things went very well.	2018-09-29	951	92
961	OMG! The host was nice but couldn't stop talking about her cats and the townhouse was just as advertised.\n  The four days I spent there were interesting to say the least. In conclusion It was great.	2018-07-18	961	93
968	JUST. WOW. The host was warm and friendly and the home was just as advertised.\n  The three days I spent there were fun and relaxing. I would say things went very well.	2018-12-21	968	93
980	JUST. WOW. The host was kinda a jerk and the house was cute and cozy.\n  The three days I spent there were interesting to say the least. all in all I absolutely loved my time there.	2019-02-25	980	94
988	My wife and I really enjoyed the location. The host was warm and friendly and the house was just what the doctor ordered.\n  The four days I spent there were interesting to say the least. I hated it.	2018-11-05	988	94
1002	JUST. WOW. The host was kinda a jerk and the home was just what the doctor ordered.\n  The three days I spent there were well worth the price. I would say things went very well.	2018-12-05	1002	95
1009	It was nice. The host was charming and the house was breath taking.\n  The two days I spent there were interesting to say the least. all in all It was great.	2019-05-01	1009	96
1022	WARNING: not as advertised. The host was very helpful and pleasant and the home was breath taking.\n  The three days I spent there were interesting to say the least. In conclusion It was great.	2018-06-01	1022	97
1029	WARNING: not as advertised. The host was nice but couldn't stop talking about her cats and the home was just as advertised.\n  The three days I spent there were fun and relaxing. I would never go back.	2018-12-25	1029	98
1040	The host was nice but couldn't stop talking about her cats and the townhouse was cute and cozy.\n  The two days I spent there were well worth the price. I would say things went very well.	2019-02-03	1040	99
1050	Unfuhgetable! The host was very helpful and pleasant and the apartment was just what the doctor ordered.\n  The four days I spent there were interesting to say the least. I would say things went very well.	2018-12-08	1050	100
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: cj
--

COPY public.users (id, name, "photoUrl") FROM stdin;
1	Adam	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
2	Roy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
3	Claude	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
4	Jarod	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
5	Colleen	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
6	Hermina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
7	Doris	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
8	Lauryn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
9	Emma	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
10	Ian	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
11	Kennedy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
12	Ernestina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
13	Garrison	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
14	Lafayette	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
15	Rico	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
16	Arthur	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
17	Keenan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
18	Minnie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
19	Sadie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
20	Manuel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
21	Phoebe	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
22	Rhoda	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
23	Britney	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
24	Shania	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
25	Alexa	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
26	Vivienne	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
27	Pete	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
28	Dannie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
29	Kaia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
30	Jaren	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
31	Teresa	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
32	Iva	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
33	Kelvin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
34	Rebeka	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
35	Neal	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
36	Chauncey	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
37	Forrest	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
38	Domenico	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
39	Kaylin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
40	Shaina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
41	Laisha	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
42	Aiyana	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
43	Jazlyn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
44	Teresa	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
45	Chaz	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
46	Name	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
47	Brisa	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
48	Daisha	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
49	Samson	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
50	Christop	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
51	Donald	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
52	Coty	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
53	Lyda	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg
54	Kellie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
55	Adalberto	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
56	Carleton	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
57	Kaelyn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
58	Bulah	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
59	Mohammed	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
60	Stephon	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
61	Arthur	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
62	Leif	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
63	Keshawn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
64	Austin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
65	Garret	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
66	Dolly	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
67	Eric	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
68	Kaleigh	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
69	Joshuah	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
70	Cordia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
71	Justus	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
81	Madie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
91	Rocio	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
101	Norma	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
111	Dusty	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
121	Toni	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
131	Will	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
141	Jocelyn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
151	Eugene	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
161	Hannah	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
171	Donna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
181	Hal	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
191	Lyla	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
201	Nicolette	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
211	Eladio	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
221	Kacey	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
231	Bulah	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
241	Camille	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
251	Camryn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
261	Cassandre	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
271	Rita	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
281	Haven	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
291	Ethyl	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
301	Ubaldo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
311	Nadia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
321	Leatha	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
331	Noble	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
341	Marc	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
351	Nicholas	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
361	Carroll	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
371	Forrest	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
381	Brittany	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
391	Birdie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Y6N_w94x8ik.jpeg
401	Carlie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
411	Bennie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
421	Lucie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
431	Susanna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
441	Domenico	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
451	Warren	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
461	Meda	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
471	Bart	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
481	Dulce	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
491	Camryn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
501	Dameon	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
511	Aliya	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
521	Jadyn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
531	Emely	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
541	Annette	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
551	Dallas	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
561	Audra	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
571	Jaron	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
581	Cortney	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
591	Kelsie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
601	Paxton	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
611	Ryann	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
621	Dahlia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg
631	Eino	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
641	Emily	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
651	Jeremy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
661	Jamal	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
671	Leon	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
681	Emilie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
691	Ashlee	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
701	Isabell	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
711	Micheal	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
721	Felipe	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
731	Claire	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
741	Xzavier	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
751	Maximillia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
761	Nona	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
73	Hazle	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
83	Jermaine	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
93	Hillard	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
103	Caleigh	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
113	Danny	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
123	Rey	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
133	Krista	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
143	Glenna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
153	Emma	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
163	Frederick	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
173	Anastasia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
183	Demetrius	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
193	Mac	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
203	Hans	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
213	Orin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
223	Noe	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
233	Brad	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
243	Anais	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
253	Terrance	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
263	Aurelie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
273	Estevan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
283	Juvenal	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
293	Angelo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
303	Carmelo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
313	Cornelius	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
323	Nicola	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
333	Maurine	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
343	Gerson	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
353	Mozell	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
363	Thad	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
373	Duane	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
383	Henderson	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
393	Cayla	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
403	Virgie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
413	Sallie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
423	Rupert	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
433	America	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
443	Mertie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
453	Karelle	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
463	Courtney	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
473	Nayeli	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
483	Raoul	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
493	Ole	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
503	Agustin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
513	Adan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
523	Yasmin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
533	Saul	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
543	Hector	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
553	Oran	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
563	Kraig	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
573	Dawson	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
583	Leonel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
593	Marvin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
603	Virginie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
613	Jaylan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
623	Corrine	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_ZxG76-UM6w0.jpeg
633	Briana	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
643	Liliana	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
653	Emilio	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
663	Stefanie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
673	Adelle	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
683	Cecilia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
693	Mathilde	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
703	Alec	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
713	Meggie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
723	Gunner	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
733	Linnie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
743	Tamara	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
753	Americo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
763	Dylan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
74	Guy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
84	Ibrahim	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
94	Alicia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
104	Betty	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
114	Deshawn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
124	Esta	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
134	Ubaldo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
144	Enid	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
154	Savannah	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
164	Cheyenne	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
174	Lilla	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
184	Norris	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
194	Coby	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
204	Kennith	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
214	Elva	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
224	Jaylin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
234	Brenda	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
244	Katharina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
254	Joshuah	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
264	Hallie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
274	Margarita	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
284	Kailey	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
294	Anya	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
304	Lemuel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
314	Otto	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
324	Immanuel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
334	Rogers	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
344	Luis	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
354	Vicenta	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
364	Cameron	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
374	Augustine	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
384	Karli	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
394	Delores	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
404	Randy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
414	Janick	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
424	Evan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
434	Daisy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
444	Toy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
454	Milton	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
464	Regan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
474	Arvel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg
484	Ashlynn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
494	Harold	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
504	Deion	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
514	Rickey	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
524	Arturo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
534	Hadley	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
544	Zion	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
554	Frank	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
564	Easton	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
574	Aidan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
584	Paolo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
594	Monica	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
604	Zander	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
614	Anderson	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
624	Gerson	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
634	Alysha	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
644	Madilyn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
654	Jamarcus	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
664	Lyric	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
674	Marlee	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
684	Sigrid	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
694	Nicola	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
704	Rey	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
714	Mylene	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
724	Kody	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
734	Alize	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
744	Manuela	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
754	Alicia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
764	Skyla	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
75	Bill	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
85	Sunny	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
95	Hollie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
105	Zena	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
115	Cesar	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
125	Adeline	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
135	Wilhelm	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
145	Ella	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
155	Doyle	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
165	Catharine	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
175	Elva	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
185	Rusty	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
195	Gabriel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
205	Jace	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
215	Leopoldo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
225	Carey	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
235	Reese	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
245	Rodolfo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
255	Valentin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
265	Liliana	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
275	Yesenia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
285	Sammy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
295	Bertram	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
305	Nicolas	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
315	Damian	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
325	Bailee	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
335	Johan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
345	Paul	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
355	Coralie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
365	Garland	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
375	Niko	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
385	Ariane	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
395	Ubaldo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
405	Eloisa	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
415	Lina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
425	Lorenz	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
435	Patience	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
445	Victoria	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
455	Karlie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg
465	Darien	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
475	Mason	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Y6N_w94x8ik.jpeg
485	Humberto	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
495	Madalyn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
505	Oda	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
515	Donnell	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
525	Meggie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
535	Eli	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
545	Aubree	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
555	Una	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
565	Vilma	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
575	Wilhelm	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
585	Cynthia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
595	Israel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
605	Carmela	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
615	Berry	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
625	Connor	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
635	Royce	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
645	Amelia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
655	Karley	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
665	Aurelio	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
675	Mariela	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
685	Elouise	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
695	Americo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
705	Katlynn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg
715	Athena	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
725	Chesley	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
735	Berta	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
745	Aaliyah	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
755	Kellie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
765	Sandy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
76	Hector	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
86	Lawrence	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
96	Joanie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
106	Tania	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
116	Emilia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
126	Jacques	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
136	Lee	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
146	Kiana	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
156	Walter	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
166	Hugh	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
176	Howard	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
186	Sammie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
196	Adonis	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
206	Astrid	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
216	Dewayne	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
226	Michael	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
236	Rosalia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
246	Andreanne	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
256	Darrion	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
266	Darryl	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
276	Judson	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
286	Devon	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
296	Okey	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
306	Modesta	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
316	Martina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
326	Julian	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
336	Rodger	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
346	Wilton	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
356	Rashawn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
366	Shanelle	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
376	Dora	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
386	Loyce	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
396	Dashawn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
406	Jakayla	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
416	Prudence	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
426	Melvina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
436	Kali	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
446	Rhianna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
456	Leanna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Y6N_w94x8ik.jpeg
466	Ocie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
476	Herminia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_ZxG76-UM6w0.jpeg
486	Thalia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
496	Jessy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
506	Simeon	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
516	Harvey	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
526	Peter	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
536	Abel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
546	Caden	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
556	Oswaldo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
566	Zane	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
576	Angus	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
586	Buford	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
596	Alana	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
606	Sylvia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
616	Domenic	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
626	Alexis	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
636	Eveline	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
646	Emanuel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
656	Markus	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
666	Jerry	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
676	Jody	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
686	Verdie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
696	Selmer	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
706	Percy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Y6N_w94x8ik.jpeg
716	Dorcas	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
726	Darian	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
736	Mary	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
746	Jules	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
756	Nova	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
766	Brittany	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
77	Camden	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
87	Katlynn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
97	Helmer	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
107	Davonte	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
117	Flossie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
127	Leonor	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
137	Brayan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
147	Lexi	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
157	Alek	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
167	Erica	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
177	Mariane	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
187	Abigail	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
197	Demario	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
207	Annetta	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
217	Oren	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
227	Liam	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
237	Kolby	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
247	Aron	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
257	Jermain	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
267	Pinkie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
277	Alan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
287	Raven	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
297	Ronny	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
307	Alanna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
317	Celia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
327	Lois	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
337	Noemi	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
347	Cristal	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
357	Colby	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
367	Albin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
377	Cristina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
387	Elta	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
397	Caleb	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
407	Lea	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
417	Sylvia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
427	Adele	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
437	Ryann	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
447	Lillie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
457	Emory	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
467	Loy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
477	Vickie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
487	Violette	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
497	Frank	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
507	Belle	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
517	Frederik	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
527	Clementina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
537	Harmony	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
547	Lyda	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
557	Savanna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
567	Timmy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
577	Rafaela	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
587	Velda	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
597	Zack	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
607	Beulah	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
617	Rollin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
627	Thaddeus	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
637	Arne	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
647	Valentine	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
657	Pierce	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
667	Chanelle	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
677	Florencio	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
687	Jarrett	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
697	Zelda	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
707	Van	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
717	Rickie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
727	Efrain	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
737	Woodrow	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
747	Riley	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
757	Dovie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
767	Willard	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
78	Gardner	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
88	Ismael	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
98	Christopher	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
108	Josefina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
118	Cathrine	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
128	Shany	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
138	Angeline	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
148	Shanelle	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg
158	Martine	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
168	Fleta	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
178	Felipe	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
188	Julien	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
198	Burnice	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
208	Arnold	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
218	Melissa	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
228	Hugh	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
238	Iva	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
248	Paolo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
258	Kurtis	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
268	Paula	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
278	Yessenia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
288	Samson	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
298	Sammy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
308	Karley	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
318	Augustine	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
328	Julius	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
338	Ivy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
348	Leta	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
358	Tony	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
368	Carmel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
378	Scotty	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
388	Franz	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
398	Lee	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
408	Aurelia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
418	Melyna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
428	Emory	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
438	Irving	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
448	Sonya	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
458	Fletcher	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
468	Zoie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
478	Reina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
488	Mabel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
498	River	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
508	Carroll	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
518	Letha	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
528	Pierce	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
538	Adele	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
548	Kenna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
558	Eryn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
568	Irwin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
578	Paxton	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
588	Nelle	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
598	Antonette	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
608	Garth	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
618	Otis	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
628	Lorine	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
638	Name	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
648	Lee	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
658	Jairo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
668	Anita	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg
678	Judge	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
688	Bennett	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
698	Jamil	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
708	Yolanda	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
718	Marlen	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
728	Jerald	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
738	Ned	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
748	Gene	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
758	Maymie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
768	Shane	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
79	Tommie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
89	Ned	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
99	Randall	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
109	Meagan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
119	Hardy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
129	Karelle	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
139	Spencer	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
149	Lamont	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Y6N_w94x8ik.jpeg
159	Orville	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
169	Green	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
179	Abbey	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
189	Florencio	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
199	Agnes	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
209	Ricky	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
219	Garfield	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
229	Paolo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
239	Melyna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
249	Carmelo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
259	Carey	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
269	Elody	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
279	Pink	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
289	Guy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
299	Hilma	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
309	Stanton	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
319	Celia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
329	Mckayla	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
339	Lacy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
349	Lexus	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
359	Alaina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
369	Christelle	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
379	Hubert	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
389	Chyna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
399	Walton	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
409	Manuela	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
419	Mathias	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
429	Ansel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
439	Dasia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
449	Cornell	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
459	Lonzo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
469	Keshaun	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
479	Laron	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
489	Sherwood	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
499	Elissa	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
509	Verda	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
519	Olga	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
529	Pearl	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
539	Bridgette	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
549	Mariam	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
559	Consuelo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
569	Tania	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
579	Jed	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
589	Al	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
599	Kattie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
609	Lauriane	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
619	Willie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
629	Audra	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
639	Arjun	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
649	Stephan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
659	Leif	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
669	Mose	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Y6N_w94x8ik.jpeg
679	Emanuel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
689	Gia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
699	Erik	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
709	Claire	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
719	Joany	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
729	Elenor	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
739	Bell	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
749	Velma	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
759	Nova	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
769	Wilfredo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
80	Aliya	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
90	Cameron	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
100	Vicenta	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
110	Gisselle	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
120	Zoila	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
130	Rowan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
140	Sonny	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
150	Mike	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
160	Brendan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
170	Abbie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
180	Sierra	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
190	Eve	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
200	Alessandro	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
210	Kurt	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
220	Grant	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
230	Derrick	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
240	Zelma	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
250	Jarrell	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
260	Princess	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
270	Danyka	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
280	Shaina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
290	Shyanne	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
300	Maynard	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
310	Amari	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
320	Clemens	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
330	Haylee	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
340	Felipe	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
350	Heather	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
360	Lew	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
370	Mariano	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
380	Meghan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
390	Napoleon	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg
400	Jaquelin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
410	Hazel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
420	Margaret	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
430	Luther	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
440	Myrtis	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
450	Rafael	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
460	Darius	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
470	Diamond	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
480	Hubert	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
490	Cleveland	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
500	Marvin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
510	Myra	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
520	Zack	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
530	Waldo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
540	Gonzalo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
550	Kayli	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
560	Xzavier	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
570	Gustave	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
580	Tierra	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
590	Narciso	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
600	Ansley	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
610	Adah	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
620	Tianna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
630	Webster	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
640	Sammie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
650	Mollie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
660	Brayan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
670	Solon	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
680	Rollin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
690	Garrick	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
700	Chelsey	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
710	Elvera	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
720	Amaya	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
730	Kianna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
740	Anthony	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
750	Ramiro	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
760	Dovie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
770	Saige	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
771	Vernon	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
781	Brice	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
791	Sydni	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
801	Abe	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
811	Lilliana	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
821	Alisa	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
831	Leora	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
841	Laverna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
851	Eudora	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
861	Tavares	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
871	Estrella	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
881	Nils	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
891	Fern	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
901	Kathryn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
911	Virgie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
921	Destany	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
931	Garry	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
941	Keyshawn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
951	Valentina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
961	Kaycee	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
971	Yoshiko	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
981	Gianni	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
991	Jacques	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
1001	Palma	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
1011	Lon	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
1021	Lester	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
1031	Peter	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
1052	Percival	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
772	Lulu	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
782	Oleta	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
792	Maximillian	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
802	Sedrick	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
812	Eldridge	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
822	Dillan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
832	Angus	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
842	Raphaelle	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
852	Emerson	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
862	Nadia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
872	Jerel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
882	Barton	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
892	Eleonore	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
902	Rickey	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
912	Kyra	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
922	Maudie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
932	Niko	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
942	Euna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
952	Orrin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
962	Marcelle	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
972	Faustino	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
982	Eveline	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
992	Gaetano	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
1002	Noelia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
1012	Edwina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
1022	Laurine	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
1032	Wayne	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
1040	Elda	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
1048	Jayme	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
773	Cristal	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
783	Marian	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
793	Novella	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
803	Garry	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
813	Alexa	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
823	Ocie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
833	Billy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
843	Eduardo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
853	Ruthie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
863	Ari	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
873	Abbigail	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
883	Dorian	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
893	Julian	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
903	Alysson	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
913	Lou	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
923	Lolita	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
933	Genoveva	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
943	Katherine	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
953	Brianne	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
963	Rahsaan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
973	Marta	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
983	Amya	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
993	Keyshawn	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
1003	Damon	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
1013	Peter	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
1023	Helen	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
1033	Kara	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
1041	Karley	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
1049	Agnes	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
774	Liliane	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
784	Jude	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
794	Elena	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
804	Haylee	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
814	Tod	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
824	Malvina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
834	Kelly	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
844	Kelton	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
854	Rosetta	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
864	Karson	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
874	Jose	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
884	Dessie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
894	Eudora	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
904	Brant	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
914	Akeem	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
924	Chadd	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
934	Elmore	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
944	Hipolito	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
954	Alison	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
964	Arvilla	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
974	Savion	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
984	Dayna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
994	Eldora	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
1004	Brett	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
1014	Alexanne	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
1024	Florencio	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
1034	Liana	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
1042	Alf	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
1051	Zackery	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
775	Margarete	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
785	Bethel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
795	Duncan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
805	Rebekah	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
815	Carlotta	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
825	Allene	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
835	Ollie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
845	Helmer	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
855	Dolores	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
865	Daisy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg
875	Angelina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
885	Edyth	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
895	Maureen	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
905	Gennaro	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
915	Pearline	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
925	Major	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
935	Kirsten	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
945	Alvera	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
955	Pearlie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
965	Valentine	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
975	Bennie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
985	Sydnee	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
995	Tre	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
1005	Laurianne	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
1015	Jamel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
1025	Isaiah	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
1035	Zachery	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
1043	Guillermo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
1053	Eladio	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
776	Katarina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
786	Ernest	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
796	Arnaldo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
806	Triston	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
816	Abagail	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
826	Emely	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
836	Uriel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
846	Erin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
856	Guadalupe	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
866	Elliot	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
876	Kelvin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
886	Florencio	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
896	Easter	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
906	Andrew	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
916	Davion	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
926	Ottis	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
936	Karlie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
946	Niko	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
956	Pearl	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
966	Litzy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
976	Tyson	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
986	Clinton	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
996	Edwin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
1006	Carli	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
1016	Cameron	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
1026	Marcus	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
1036	Cecilia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
1044	Osbaldo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
1054	Dorcas	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
777	Zachariah	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
787	Francis	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg
797	Bryana	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
807	Rosa	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
817	Arvilla	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
827	Kendall	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
837	Josh	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
847	Miles	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
857	Josiah	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
867	Monica	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
877	Mertie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
887	Dustin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_XU-OwxtV4Ko.jpeg
897	Vena	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
907	Darwin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
917	Terrance	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
927	Sim	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg
937	Garrison	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
947	Michaela	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg
957	Abel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
967	Eladio	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
977	Evan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
987	Roxanne	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg
997	Jonathon	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
1007	Cristian	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
1017	Tessie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
1027	Natasha	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
1037	Jordan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
1045	Coby	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
1055	Eloisa	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
778	Shannon	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
788	Watson	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Y6N_w94x8ik.jpeg
798	Amie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
808	Shyanne	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
818	Henderson	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
828	Stacey	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
838	Beaulah	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
848	Velma	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
858	Donnie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
868	Winnifred	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
878	Annabelle	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
888	Mallory	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg
898	Jovani	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
908	Maritza	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
918	Kaia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
928	Jess	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Y6N_w94x8ik.jpeg
938	Matteo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
948	Abbigail	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Y6N_w94x8ik.jpeg
958	Marion	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
968	Irving	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
978	Chauncey	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
988	Federico	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Y6N_w94x8ik.jpeg
998	Arianna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
1008	Taurean	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
1018	Jade	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
1028	Chaya	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
1038	Gail	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
1046	Delaney	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
1056	Dasia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
779	Aditya	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
789	Ken	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
799	General	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
809	Gia	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
819	Kameron	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
829	Ian	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
839	Antonietta	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
849	Conrad	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
859	Aniyah	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
869	Rosina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
879	Collin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
889	Rusty	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
899	Rhianna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
909	Mara	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
919	Sabrina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
929	Cesar	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_ZxG76-UM6w0.jpeg
939	Rogers	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
949	Baby	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_ZxG76-UM6w0.jpeg
959	Coy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
969	Imelda	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
979	Edgar	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
989	Porter	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
999	Cesar	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
1009	Ivory	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
1019	Enoch	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
1029	Wendy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
1039	Shawna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
1047	Carter	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
780	Helene	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
790	Ivy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
800	Turner	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
810	Lucious	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
820	Judd	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
830	Vallie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
840	Luciano	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
850	Lorenza	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
860	Demetris	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
870	Ignatius	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
880	Jeffry	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
890	Curtis	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
900	Henry	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
910	Lula	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
920	Lonzo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
930	Rhett	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
940	Samara	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
950	Gerda	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
960	Buck	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
970	Sebastian	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
980	Isaiah	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
990	Norris	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
1000	Ike	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
1010	Amani	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
1020	Maritza	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
1030	Josefina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
1050	Felicity	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
72	Penelope	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
82	Buster	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
92	Ashton	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
102	Wellington	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
112	Vernon	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
122	Jaylan	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
132	Florian	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
142	Davon	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
152	Laron	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
162	Wava	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
172	Giovanna	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
182	Vern	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
192	Imani	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
202	Coby	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
212	Colby	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
222	Braden	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
232	Thelma	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
242	Itzel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
252	Daryl	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FVrXs076Df8.jpeg
262	Raymond	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
272	Hellen	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
282	Krystina	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
292	Maurice	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
302	Oceane	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
312	Wilmer	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
322	Coty	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
332	Julio	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_MeU7XG3HOes.jpeg
342	Carrie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
352	Coleman	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
362	Daisha	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
372	Rocio	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
382	Leila	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_FULkoZ989E4.jpeg
392	Pearl	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_ZxG76-UM6w0.jpeg
402	Vesta	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
412	Karl	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
422	Kyla	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
432	Elliot	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
442	Weldon	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
452	Allene	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
462	Harmon	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
472	Sandy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_VN2znosQaK0.jpeg
482	Ernie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
492	Ezekiel	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
502	Kaycee	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
512	Spencer	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Xa2xi8g5xrI.jpeg
522	Franz	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
532	Elsa	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
542	Newton	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
552	Benton	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_0bDm6kFC2Tc.jpeg
562	Bud	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
572	Precious	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
582	Miller	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
592	Avery	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
602	Leila	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JyVcAIUAcPM.jpeg
612	Shanelle	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
622	Michael	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_Y6N_w94x8ik.jpeg
632	Ray	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_DpdTfB8lQTc.jpeg
642	Jasper	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
652	Aileen	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_3U2wGr-Inps.jpeg
662	Dolores	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_JC1oue4zY5U.jpeg
672	Pierre	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_4Np_d6IJuQk.jpeg
682	Jessy	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
692	Jerrold	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
702	Ralph	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_V2sJMCDdslA.jpeg
712	Davion	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
722	Edyth	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_6TLxH30vmWM.jpeg
732	Leon	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_C9EOBGeiJsw.jpeg
742	Kaylin	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_8GuvbXdn40U.jpeg
752	Linnie	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_7ncPcGL60-s.jpeg
762	Dangelo	https://s3.amazonaws.com/airbnbcloneuserphotos/225x225_CUJTifrLCLs.jpeg
\.


--
-- Name: hosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cj
--

SELECT pg_catalog.setval('public.hosts_id_seq', 100, true);


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cj
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 8, true);


--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: cj
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- Name: listings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cj
--

SELECT pg_catalog.setval('public.listings_id_seq', 100, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cj
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1056, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cj
--

SELECT pg_catalog.setval('public.users_id_seq', 1056, true);


--
-- Name: hosts hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: cj
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_pkey PRIMARY KEY (id);


--
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: cj
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: cj
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: listings listings_pkey; Type: CONSTRAINT; Schema: public; Owner: cj
--

ALTER TABLE ONLY public.listings
    ADD CONSTRAINT listings_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: cj
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: cj
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: listings listings_host_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: cj
--

ALTER TABLE ONLY public.listings
    ADD CONSTRAINT listings_host_id_foreign FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- Name: reviews reviews_listing_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: cj
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_listing_id_foreign FOREIGN KEY (listing_id) REFERENCES public.listings(id);


--
-- Name: reviews reviews_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: cj
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

