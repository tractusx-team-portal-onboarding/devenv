--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3 (Debian 14.3-1.pgdg110+1)
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
-- Name: __efmigrations_history_portal; Type: TABLE; Schema: public; Owner: portal
--

CREATE TABLE public.__efmigrations_history_portal (
    migration_id character varying(150) NOT NULL,
    product_version character varying(32) NOT NULL
);


ALTER TABLE public.__efmigrations_history_portal OWNER TO portal;

--
-- Data for Name: __efmigrations_history_portal; Type: TABLE DATA; Schema: public; Owner: portal
--

COPY public.__efmigrations_history_portal (migration_id, product_version) FROM stdin;
20220519154644_InitialCreate	6.0.4
20220520103317_AddConnectors	6.0.4
20220520121416_RenameEnumEntityKeyColumns	6.0.4
20220523140724_CPLP-712_service_accounts	6.0.4
\.


--
-- PostgreSQL database dump complete
--

