--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-2.pgdg110+2)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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

--
-- Data for Name: client_sequences; Type: TABLE DATA; Schema: provisioning; Owner: provisioning
--

COPY provisioning.client_sequences (sequence_id) FROM stdin;
\.


--
-- Data for Name: identity_provider_sequences; Type: TABLE DATA; Schema: provisioning; Owner: provisioning
--

COPY provisioning.identity_provider_sequences (sequence_id) FROM stdin;
1
2
\.


--
-- Data for Name: user_password_resets; Type: TABLE DATA; Schema: provisioning; Owner: provisioning
--

COPY provisioning.user_password_resets (user_entity_id, password_modified_at, reset_count) FROM stdin;
\.


--
-- Name: client_sequence_sequence_id_seq; Type: SEQUENCE SET; Schema: provisioning; Owner: provisioning
--

SELECT pg_catalog.setval('provisioning.client_sequence_sequence_id_seq', 1, false);


--
-- Name: identity_provider_sequence_sequence_id_seq; Type: SEQUENCE SET; Schema: provisioning; Owner: provisioning
--

SELECT pg_catalog.setval('provisioning.identity_provider_sequence_sequence_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

