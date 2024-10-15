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

--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (id, title, sect, file, created_at, updated_at, number) FROM stdin;
1	唯識学派の『金剛般若経』理解	唯識学派	唯識学派の_金剛般若経_理解.pdf	2024-10-13 09:30:40.76749	2024-10-13 09:30:40.76749	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, username, profile, profile_image_id, created_at, updated_at) FROM stdin;
6	bugle@gmail.com	$2a$12$l6v2GQ.AgBQ7pUBzLpLAWO4f14dNPRUl43Ec7irapML1W0i.8LsvC	\N	\N	\N	bugle	\N	\N	2024-10-12 20:33:10.446746	2024-10-12 20:33:10.446746
7	ceciliachen721@gmail.com	$2a$12$DBANFfC9hXncP02OV/DEWe6gfipIeAb/MqOgEV13hf7Kk5BTdEDhC	\N	\N	\N	chen	\N	\N	2024-10-13 06:11:16.891683	2024-10-14 14:06:22.408212
8	runteq@gmail.com	$2a$12$zn8RYymBeeFColacAzz5Re6Xt.EZRwegyCu6KpxWpOOWO60FTJGGS	\N	\N	\N	runteq1	\N	\N	2024-10-15 05:07:52.10348	2024-10-15 05:13:19.434547
\.


--
-- Data for Name: bookmarks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookmarks (id, user_id, book_id, created_at, updated_at) FROM stdin;
23	7	1	2024-10-14 21:04:13.055874	2024-10-14 21:04:13.055874
25	8	1	2024-10-15 05:12:45.252392	2024-10-15 05:12:45.252392
\.


--
-- Data for Name: meditation_guides; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.meditation_guides (id, title, description, user_id, created_at, updated_at, slug) FROM stdin;
4	マインドフルネス瞑想	マインドフルネス瞑想は現在の瞬間に意識を向け、心の平静とストレス軽減を促進する瞑想法です。	\N	2024-10-14 15:58:02.48575	2024-10-14 15:58:02.48575	mindfulness
3	今日の瞑想	これはデフォルトの冥想ガイドです。	\N	2024-10-13 16:54:14.971743	2024-10-14 16:11:27.719158	
5	集中瞑想	集中瞑想は、特定の対象に意識を集中することで心を落ち着ける方法です。精神集中力を高めます。	\N	2024-10-14 16:18:29.815833	2024-10-14 16:18:29.815833	concentration
6	慈悲の瞑想	慈悲の瞑想は、他者への思いやりを育て、内なる平和を感じるための瞑想です。	\N	2024-10-14 16:18:29.826126	2024-10-14 16:18:29.826126	compassion
7	トランセンデンタル・メディテーション	トランセンデンタル・メディテーションは、特定のマントラを用いて深いリラクゼーションを達成する方法です。	\N	2024-10-14 16:18:29.830589	2024-10-14 16:18:29.830589	transcendental
\.


--
-- Data for Name: meditation_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Name: bookmarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookmarks_id_seq', 25, true);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_id_seq', 1, true);


--
-- Name: meditation_guides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.meditation_guides_id_seq', 7, true);


--
-- Name: meditation_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.meditation_sessions_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- PostgreSQL database dump complete
--

