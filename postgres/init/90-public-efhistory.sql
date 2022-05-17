--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: __efmigrations_history_portal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.__efmigrations_history_portal (
    migration_id character varying(150) NOT NULL,
    product_version character varying(32) NOT NULL
);


ALTER TABLE public.__efmigrations_history_portal OWNER TO postgres;

--
-- Data for Name: __efmigrations_history_portal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.__efmigrations_history_portal (migration_id, product_version) FROM stdin;
20220517170706_InitialCreate	6.0.4
\.


--
-- Name: __efmigrations_history_portal pk___ef_migrations_history_portal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.__efmigrations_history_portal
    ADD CONSTRAINT pk___ef_migrations_history_portal PRIMARY KEY (migration_id);


--
-- PostgreSQL database dump complete
--

