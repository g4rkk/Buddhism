--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Debian 17.0-1.pgdg120+1)
-- Dumped by pg_dump version 17.0 (Debian 17.0-1.pgdg120+1)

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: bookmarks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bookmarks (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    book_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: bookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bookmarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bookmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bookmarks_id_seq OWNED BY public.bookmarks.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.books (
    id bigint NOT NULL,
    title character varying,
    sect character varying,
    file character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    number integer
);


--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: meditation_guides; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meditation_guides (
    id bigint NOT NULL,
    title character varying,
    description text,
    user_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    slug character varying
);


--
-- Name: meditation_guides_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.meditation_guides_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: meditation_guides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.meditation_guides_id_seq OWNED BY public.meditation_guides.id;


--
-- Name: meditation_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meditation_sessions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    meditation_guide_id bigint,
    duration_seconds integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: meditation_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.meditation_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: meditation_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.meditation_sessions_id_seq OWNED BY public.meditation_sessions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    username character varying,
    profile text,
    profile_image_id character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
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
-- Name: bookmarks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bookmarks ALTER COLUMN id SET DEFAULT nextval('public.bookmarks_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: meditation_guides id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_guides ALTER COLUMN id SET DEFAULT nextval('public.meditation_guides_id_seq'::regclass);


--
-- Name: meditation_sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_sessions ALTER COLUMN id SET DEFAULT nextval('public.meditation_sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-10-11 05:49:17.612263	2024-10-11 05:49:17.612263
\.


--
-- Data for Name: bookmarks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bookmarks (id, user_id, book_id, created_at, updated_at) FROM stdin;
23	7	1	2024-10-14 21:04:13.055874	2024-10-14 21:04:13.055874
25	8	1	2024-10-15 05:12:45.252392	2024-10-15 05:12:45.252392
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.books (id, title, sect, file, created_at, updated_at, number) FROM stdin;
1	唯識学派の『金剛般若経』理解	唯識学派	唯識学派の_金剛般若経_理解.pdf	2024-10-13 09:30:40.76749	2024-10-13 09:30:40.76749	1
\.


--
-- Data for Name: meditation_guides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.meditation_guides (id, title, description, user_id, created_at, updated_at, slug) FROM stdin;
4	マインドフルネス瞑想	マインドフルネス瞑想は現在の瞬間に意識を向け、心の平静とストレス軽減を促進する瞑想法です。	\N	2024-10-14 15:58:02.48575	2024-10-14 15:58:02.48575	mindfulness
3	今日の瞑想	これはデフォルトの冥想ガイドです。	\N	2024-10-13 16:54:14.971743	2024-10-14 16:11:27.719158	
5	集中瞑想	集中瞑想は、特定の対象に意識を集中することで心を落ち着ける方法です。精神集中力を高めます。	\N	2024-10-14 16:18:29.815833	2024-10-14 16:18:29.815833	concentration
6	慈悲の瞑想	慈悲の瞑想は、他者への思いやりを育て、内なる平和を感じるための瞑想です。	\N	2024-10-14 16:18:29.826126	2024-10-14 16:18:29.826126	compassion
7	トランセンデンタル・メディテーション	トランセンデンタル・メディテーションは、特定のマントラを用いて深いリラクゼーションを達成する方法です。	\N	2024-10-14 16:18:29.830589	2024-10-14 16:18:29.830589	transcendental
\.


--
-- Data for Name: meditation_sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.meditation_sessions (id, user_id, meditation_guide_id, duration_seconds, created_at, updated_at) FROM stdin;
2	7	3	1200	2024-10-13 16:56:01.506976	2024-10-13 16:56:01.506976
3	7	3	600	2024-10-13 17:10:27.62299	2024-10-13 17:10:27.62299
4	7	3	300	2024-10-13 18:06:00.631807	2024-10-13 18:06:00.631807
5	7	3	60	2024-10-13 18:12:50.857827	2024-10-13 18:12:50.857827
6	7	3	60	2024-10-13 18:14:42.871093	2024-10-13 18:14:42.871093
7	8	3	1200	2024-10-15 05:10:54.985623	2024-10-15 05:10:54.985623
8	8	3	300	2024-10-15 05:11:52.387369	2024-10-15 05:11:52.387369
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20241011053321
20241011143758
20241011143825
20241011171740
20241011173303
20241012191734
20241012192622
20241013162354
20241013162752
20241013165015
20241013165243
20241013165509
20241014155431
20241014205239
20241014205746
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, username, profile, profile_image_id, created_at, updated_at) FROM stdin;
6	bugle@gmail.com	$2a$12$l6v2GQ.AgBQ7pUBzLpLAWO4f14dNPRUl43Ec7irapML1W0i.8LsvC	\N	\N	\N	bugle	\N	\N	2024-10-12 20:33:10.446746	2024-10-12 20:33:10.446746
7	ceciliachen721@gmail.com	$2a$12$DBANFfC9hXncP02OV/DEWe6gfipIeAb/MqOgEV13hf7Kk5BTdEDhC	\N	\N	\N	chen	\N	\N	2024-10-13 06:11:16.891683	2024-10-14 14:06:22.408212
8	runteq@gmail.com	$2a$12$zn8RYymBeeFColacAzz5Re6Xt.EZRwegyCu6KpxWpOOWO60FTJGGS	\N	\N	\N	runteq1	\N	\N	2024-10-15 05:07:52.10348	2024-10-15 05:13:19.434547
\.


--
-- Name: bookmarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bookmarks_id_seq', 25, true);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.books_id_seq', 1, true);


--
-- Name: meditation_guides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.meditation_guides_id_seq', 7, true);


--
-- Name: meditation_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.meditation_sessions_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: bookmarks bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_pkey PRIMARY KEY (id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: meditation_guides meditation_guides_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_guides
    ADD CONSTRAINT meditation_guides_pkey PRIMARY KEY (id);


--
-- Name: meditation_sessions meditation_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_sessions
    ADD CONSTRAINT meditation_sessions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_bookmarks_on_book_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bookmarks_on_book_id ON public.bookmarks USING btree (book_id);


--
-- Name: index_bookmarks_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bookmarks_on_user_id ON public.bookmarks USING btree (user_id);


--
-- Name: index_bookmarks_on_user_id_and_book_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_bookmarks_on_user_id_and_book_id ON public.bookmarks USING btree (user_id, book_id);


--
-- Name: index_books_on_number; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_books_on_number ON public.books USING btree (number);


--
-- Name: index_meditation_guides_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_meditation_guides_on_user_id ON public.meditation_guides USING btree (user_id);


--
-- Name: index_meditation_sessions_on_meditation_guide_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_meditation_sessions_on_meditation_guide_id ON public.meditation_sessions USING btree (meditation_guide_id);


--
-- Name: index_meditation_sessions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_meditation_sessions_on_user_id ON public.meditation_sessions USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: meditation_sessions fk_rails_4c345c4e81; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_sessions
    ADD CONSTRAINT fk_rails_4c345c4e81 FOREIGN KEY (meditation_guide_id) REFERENCES public.meditation_guides(id);


--
-- Name: meditation_sessions fk_rails_6a6dcd370a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_sessions
    ADD CONSTRAINT fk_rails_6a6dcd370a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: bookmarks fk_rails_c1ff6fa4ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT fk_rails_c1ff6fa4ac FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: meditation_guides fk_rails_dd200ead46; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meditation_guides
    ADD CONSTRAINT fk_rails_dd200ead46 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: bookmarks fk_rails_ecb780aac3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT fk_rails_ecb780aac3 FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- PostgreSQL database dump complete
--

