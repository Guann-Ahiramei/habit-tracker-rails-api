--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: categories_habits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories_habits (
    id bigint NOT NULL,
    habit_id bigint NOT NULL,
    category_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: categories_habits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_habits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_habits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_habits_id_seq OWNED BY public.categories_habits.id;


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.follows (
    id bigint NOT NULL,
    follower_id bigint NOT NULL,
    followed_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.follows_id_seq OWNED BY public.follows.id;


--
-- Name: habits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.habits (
    id bigint NOT NULL,
    name character varying,
    description text,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: habits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.habits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: habits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.habits_id_seq OWNED BY public.habits.id;


--
-- Name: reminders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reminders (
    id bigint NOT NULL,
    habit_id bigint NOT NULL,
    reminder_time timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: reminders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reminders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reminders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reminders_id_seq OWNED BY public.reminders.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: time_blocks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.time_blocks (
    id bigint NOT NULL,
    start_time timestamp(6) without time zone,
    end_time timestamp(6) without time zone,
    completed boolean,
    reason text,
    habit_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: time_blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.time_blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: time_blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.time_blocks_id_seq OWNED BY public.time_blocks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying,
    role character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    provider character varying DEFAULT 'email'::character varying NOT NULL,
    uid character varying DEFAULT ''::character varying NOT NULL,
    tokens json
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: categories_habits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories_habits ALTER COLUMN id SET DEFAULT nextval('public.categories_habits_id_seq'::regclass);


--
-- Name: follows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows ALTER COLUMN id SET DEFAULT nextval('public.follows_id_seq'::regclass);


--
-- Name: habits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.habits ALTER COLUMN id SET DEFAULT nextval('public.habits_id_seq'::regclass);


--
-- Name: reminders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reminders ALTER COLUMN id SET DEFAULT nextval('public.reminders_id_seq'::regclass);


--
-- Name: time_blocks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.time_blocks ALTER COLUMN id SET DEFAULT nextval('public.time_blocks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2025-03-21 23:53:04.079013	2025-03-21 23:53:04.079016
schema_sha1	f1dc4544edb1c47ac7b22c33b51431abf93abe00	2025-03-21 23:53:04.08471	2025-03-21 23:53:04.084712
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories (id, name, created_at, updated_at) FROM stdin;
3	Health	2025-03-27 18:09:20.895506	2025-03-27 18:09:20.895506
4	Learning	2025-03-27 18:09:20.965199	2025-03-27 18:09:20.965199
5	Communication	2025-03-27 18:09:21.007283	2025-03-27 18:09:21.007283
\.


--
-- Data for Name: categories_habits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories_habits (id, habit_id, category_id, created_at, updated_at) FROM stdin;
4	4	3	2025-03-27 18:09:20.953498	2025-03-27 18:09:20.953498
6	6	4	2025-03-27 18:09:20.993966	2025-03-27 18:09:20.993966
7	7	5	2025-03-27 18:09:21.020641	2025-03-27 18:09:21.020641
8	8	5	2025-03-27 18:09:21.036752	2025-03-27 18:09:21.036752
9	21	4	2025-04-04 04:25:28.959991	2025-04-04 04:25:28.959991
10	29	4	2025-04-04 05:01:52.497327	2025-04-04 05:01:52.497327
11	30	3	2025-04-06 19:34:02.159739	2025-04-06 19:34:02.159739
\.


--
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.follows (id, follower_id, followed_id, created_at, updated_at) FROM stdin;
1	3	4	2025-03-28 16:05:20.15092	2025-03-28 16:05:20.15092
8	4	5	2025-04-04 03:59:40.761027	2025-04-04 03:59:40.761027
10	4	3	2025-04-06 18:24:02.895859	2025-04-06 18:24:02.895859
\.


--
-- Data for Name: habits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.habits (id, name, description, user_id, created_at, updated_at) FROM stdin;
2	Running	Running activity	4	2025-03-27 18:09:20.918139	2025-03-27 18:09:20.918139
3	Dumb bell	Dumb bell activity	4	2025-03-27 18:09:20.934458	2025-03-27 18:09:20.934458
4	Walking	Walking activity	4	2025-03-27 18:09:20.947361	2025-03-27 18:09:20.947361
6	Coding practice	Coding practice activity	4	2025-03-27 18:09:20.986608	2025-03-27 18:09:20.986608
7	Call family	Call family activity	4	2025-03-27 18:09:21.01241	2025-03-27 18:09:21.01241
8	Meet new people	Meet new people activity	4	2025-03-27 18:09:21.02858	2025-03-27 18:09:21.02858
9	璺戞	\N	4	2025-03-28 03:31:47.522996	2025-03-28 03:31:47.522996
10	璺戞	\N	4	2025-03-28 09:06:34.30789	2025-03-28 09:06:34.30789
11	laughing	\N	4	2025-04-03 03:20:16.58886	2025-04-03 03:20:16.58886
13	Daily Exercise	Exercise for 30 minutes every day	4	2025-04-03 19:03:23.27582	2025-04-03 19:03:23.27582
14	Daily Exercise	Exercise for 30 minutes every day	4	2025-04-03 19:03:47.786955	2025-04-03 19:03:47.786955
15	jogging	for 30 mins per day	4	2025-04-03 19:05:00.100609	2025-04-03 19:05:00.100609
16	jogging2	222	4	2025-04-03 19:14:37.736417	2025-04-03 19:14:37.736417
19	reading	papers and magazines	4	2025-04-04 04:00:12.108441	2025-04-04 04:00:12.108441
20	review	course content	4	2025-04-04 04:22:08.271608	2025-04-04 04:22:08.271608
21	Test Habit	Test Description	3	2025-04-04 04:25:28.953935	2025-04-04 04:25:28.953935
22	111	111	4	2025-04-04 04:28:32.976602	2025-04-04 04:28:32.976602
23	111	111	4	2025-04-04 04:28:37.681461	2025-04-04 04:28:37.681461
24	222	222	4	2025-04-04 04:33:18.196606	2025-04-04 04:33:18.196606
25	222	333	4	2025-04-04 04:34:51.674055	2025-04-04 04:34:51.674055
26	333	333	4	2025-04-04 04:44:16.186018	2025-04-04 04:44:16.186018
27	444	444	4	2025-04-04 04:49:38.506485	2025-04-04 04:49:38.506485
28	444	444	4	2025-04-04 04:53:29.031031	2025-04-04 04:53:29.031031
29	pre study	before class, bring questions	4	2025-04-04 05:01:52.483755	2025-04-04 05:01:52.483755
30	Daily meditation	Exercise for 30 minutes every day	4	2025-04-06 19:34:02.132044	2025-04-06 19:34:02.132044
\.


--
-- Data for Name: reminders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reminders (id, habit_id, reminder_time, created_at, updated_at) FROM stdin;
7	2	2025-04-03 14:47:00	2025-04-03 14:47:41.404028	2025-04-03 14:47:41.404028
8	2	2025-04-03 14:47:00	2025-04-03 14:47:46.859368	2025-04-03 14:47:46.859368
10	2	2025-04-03 20:47:00	2025-04-03 20:47:36.311544	2025-04-03 20:47:36.311544
11	2	2025-04-03 20:49:00	2025-04-03 20:49:19.029599	2025-04-03 20:49:19.029599
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20250321222440
20250321222344
20250321222144
20250321222108
20250321222043
20250328094133
20250328161927
20250406205300
20250406210121
20250406210456
20250406224213
20250407015327
\.


--
-- Data for Name: time_blocks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.time_blocks (id, start_time, end_time, completed, reason, habit_id, created_at, updated_at) FROM stdin;
6	2024-03-28 13:00:00	2024-03-28 14:00:00	f	Lunch break reading	4	2025-03-28 04:41:49.510678	2025-03-28 04:41:49.510678
7	2024-03-28 19:00:00	2024-03-28 19:30:00	t	Evening call to parents	6	2025-03-28 04:41:49.510678	2025-03-28 04:41:49.510678
5	2025-03-28 08:42:57.05719	2025-03-28 08:44:38.895285	t	Morning workout routine	2	2025-03-28 04:41:49.510678	2025-03-28 08:44:38.895565
8	2025-04-03 18:10:00	2025-04-03 19:10:00	f	Test time block	2	2025-04-03 18:14:50.396528	2025-04-03 18:14:50.396528
9	2025-04-03 18:19:00	2025-04-03 18:19:00	t		2	2025-04-03 18:21:45.0206	2025-04-03 18:21:45.0206
10	2025-04-03 18:30:00	2025-04-03 18:30:00	t		2	2025-04-03 18:30:20.404475	2025-04-03 18:30:20.404475
11	2025-04-06 18:41:33.029506	2025-04-06 11:00:00	t	Test time block	2	2025-04-06 18:37:44.420546	2025-04-06 18:41:33.029818
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, role, created_at, updated_at, reset_password_token, reset_password_sent_at, remember_created_at, encrypted_password, provider, uid, tokens) FROM stdin;
3	admin@example.com	admin	2025-03-27 18:09:20.704741	2025-03-27 18:09:20.704741	\N	\N	\N		email	admin@example.com	\N
4	user2@example.com	user	2025-03-27 18:09:20.884715	2025-03-27 18:09:20.884715	\N	\N	\N		email	user2@example.com	\N
5	user3@example.com	user	2025-03-27 20:44:45.949741	2025-03-27 20:44:45.949741	\N	\N	\N		email	user3@example.com	\N
6	user4@example.com	user	2025-04-06 18:44:56.037562	2025-04-06 18:44:56.037562	\N	\N	\N		email	user4@example.com	\N
7	user5@example.com	user	2025-04-06 23:34:31.718566	2025-04-06 23:52:47.664267	\N	\N	\N	$2a$12$UKV395Hi7cdl2kTFiQgC.ev8pA979amFLZvduRnVssXZlXob0ZtOm	email	user5@example.com	"{\\"yBAXdJ0zrMRHxggLn8WsQg\\":{\\"token\\":\\"$2a$10$or7/OKt5eLWX6HzFEJUJHOUb4lLwK8Tg6zfb60lKdVBpfTs5ggsJ2\\",\\"expiry\\":1745192071,\\"previous_token\\":\\"$2a$10$xNWTY1m8l1KAoLkKlkfOv.lWoVaieDH98DMSixkSgjXhoAagx4qXu\\",\\"updated_at\\":\\"2025-04-06T23:34:31Z\\"},\\"pc8tXm3ddLj8nxJEQniwkQ\\":{\\"token\\":\\"$2a$10$Dnvr8yiYDfG2re8uZjVobepYrLMVs9fC0rZkF.JxM9nrJ7VhOOyNa\\",\\"expiry\\":1745192174},\\"oGikCwZ8PiS6OGeuyJt7jw\\":{\\"token\\":\\"$2a$10$aqDXT5xG1CN5N1ID3nG7WumORcNQ5QKmtK/A0nShjOqhHn.Wpc/vq\\",\\"expiry\\":1745192341,\\"previous_token\\":\\"$2a$10$Wtfop5ojjbhYCBinNSAW0.mOOuf39rWbdeyQBGMunWX2uGmlHfnLO\\",\\"updated_at\\":\\"2025-04-06T23:39:01Z\\"},\\"W2OsQni2p08FNlq3hj72Bg\\":{\\"token\\":\\"$2a$10$CMoIBy71EdgrFVP3vPGCb.a134ZXOoXPA8S8FFYGF/Q7TeARVyOFG\\",\\"expiry\\":1745192437,\\"previous_token\\":\\"$2a$10$UsjSdbcOC.HyotTB.H9LlOEDgowONVuxDbpm6KfBLyEnmzmtO8.3u\\",\\"updated_at\\":\\"2025-04-06T23:40:37Z\\"},\\"59XZGdxggaO_wRZp57R_wg\\":{\\"token\\":\\"$2a$10$K9YceGpH86W2nsdwxUX3pOdJucd110SQZCj1b.gZsM2xFjcjMIzZu\\",\\"expiry\\":1745192542,\\"previous_token\\":\\"$2a$10$TJrK46ejpz/PeouW3ugVSe2V0c5FOejUXqgGTiOhCkAtdDJHG9Fli\\",\\"updated_at\\":\\"2025-04-06T23:42:21Z\\"},\\"iMTkre1ezaZUusyjkdNSbg\\":{\\"token\\":\\"$2a$10$fV9SEVIy7GEv3GB51GSdTejeOz3jVrcgI0Qg9aIz5DJTxqHQI0nry\\",\\"expiry\\":1745192666,\\"previous_token\\":\\"$2a$10$a4ALQ7cQiivMLArnG9lCTu0D.F9s3XZ2cbTUb6wwCuewi/z1.LKuS\\",\\"updated_at\\":\\"2025-04-06T23:44:26Z\\"},\\"Th5isLrcPuDE3ZLh5SdUhw\\":{\\"token\\":\\"$2a$10$P9gFy3hnTd6r.Mzs3uqnbufslgYqZ37f6PTmo6b4lv.YbU7b3L9Fe\\",\\"expiry\\":1745192944},\\"0s1SO31eEeWlZqMwr-ok1g\\":{\\"token\\":\\"$2a$10$/goPCGAr2rEEEffAhhh6/.mefcgCOCBG3BzFRvRkjLW0h./E2rOEi\\",\\"expiry\\":1745193167}}"
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, false);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, false);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: categories_habits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_habits_id_seq', 11, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- Name: follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.follows_id_seq', 10, true);


--
-- Name: habits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.habits_id_seq', 30, true);


--
-- Name: reminders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reminders_id_seq', 12, true);


--
-- Name: time_blocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.time_blocks_id_seq', 11, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: categories_habits categories_habits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories_habits
    ADD CONSTRAINT categories_habits_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


--
-- Name: habits habits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.habits
    ADD CONSTRAINT habits_pkey PRIMARY KEY (id);


--
-- Name: reminders reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reminders
    ADD CONSTRAINT reminders_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: time_blocks time_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.time_blocks
    ADD CONSTRAINT time_blocks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_categories_habits_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_categories_habits_on_category_id ON public.categories_habits USING btree (category_id);


--
-- Name: index_categories_habits_on_habit_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_categories_habits_on_habit_id ON public.categories_habits USING btree (habit_id);


--
-- Name: index_follows_on_followed_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_follows_on_followed_id ON public.follows USING btree (followed_id);


--
-- Name: index_follows_on_follower_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_follows_on_follower_id ON public.follows USING btree (follower_id);


--
-- Name: index_habits_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_habits_on_user_id ON public.habits USING btree (user_id);


--
-- Name: index_reminders_on_habit_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reminders_on_habit_id ON public.reminders USING btree (habit_id);


--
-- Name: index_time_blocks_on_habit_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_time_blocks_on_habit_id ON public.time_blocks USING btree (habit_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: categories_habits fk_rails_03518abdaf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories_habits
    ADD CONSTRAINT fk_rails_03518abdaf FOREIGN KEY (habit_id) REFERENCES public.habits(id);


--
-- Name: categories_habits fk_rails_102c7ec0d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories_habits
    ADD CONSTRAINT fk_rails_102c7ec0d4 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: time_blocks fk_rails_1a44ef74d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.time_blocks
    ADD CONSTRAINT fk_rails_1a44ef74d6 FOREIGN KEY (habit_id) REFERENCES public.habits(id);


--
-- Name: habits fk_rails_541267aaf9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.habits
    ADD CONSTRAINT fk_rails_541267aaf9 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: follows fk_rails_5ef72a3867; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT fk_rails_5ef72a3867 FOREIGN KEY (followed_id) REFERENCES public.users(id);


--
-- Name: follows fk_rails_622d34a301; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT fk_rails_622d34a301 FOREIGN KEY (follower_id) REFERENCES public.users(id);


--
-- Name: reminders fk_rails_6a973ed923; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reminders
    ADD CONSTRAINT fk_rails_6a973ed923 FOREIGN KEY (habit_id) REFERENCES public.habits(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

