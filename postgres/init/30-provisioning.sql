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
-- Name: provisioning; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA provisioning;


--
-- Name: client_sequence_sequence_id_seq; Type: SEQUENCE; Schema: provisioning; Owner: -
--

CREATE SEQUENCE provisioning.client_sequence_sequence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: client_sequences; Type: TABLE; Schema: provisioning; Owner: -
--

CREATE TABLE provisioning.client_sequences (
    sequence_id integer DEFAULT nextval('provisioning.client_sequence_sequence_id_seq'::regclass) NOT NULL
);


--
-- Name: identity_provider_sequence_sequence_id_seq; Type: SEQUENCE; Schema: provisioning; Owner: -
--

CREATE SEQUENCE provisioning.identity_provider_sequence_sequence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: identity_provider_sequences; Type: TABLE; Schema: provisioning; Owner: -
--

CREATE TABLE provisioning.identity_provider_sequences (
    sequence_id integer DEFAULT nextval('provisioning.identity_provider_sequence_sequence_id_seq'::regclass) NOT NULL
);


--
-- Name: user_password_resets; Type: TABLE; Schema: provisioning; Owner: -
--

CREATE TABLE provisioning.user_password_resets (
    user_entity_id character varying(36) NOT NULL,
    password_modified_at timestamp with time zone NOT NULL,
    reset_count integer NOT NULL
);


--
-- Name: client_sequences pk_client_sequences; Type: CONSTRAINT; Schema: provisioning; Owner: -
--

ALTER TABLE ONLY provisioning.client_sequences
    ADD CONSTRAINT pk_client_sequences PRIMARY KEY (sequence_id);


--
-- Name: identity_provider_sequences pk_identity_provider_sequences; Type: CONSTRAINT; Schema: provisioning; Owner: -
--

ALTER TABLE ONLY provisioning.identity_provider_sequences
    ADD CONSTRAINT pk_identity_provider_sequences PRIMARY KEY (sequence_id);


--
-- Name: user_password_resets pk_user_password_resets; Type: CONSTRAINT; Schema: provisioning; Owner: -
--

ALTER TABLE ONLY provisioning.user_password_resets
    ADD CONSTRAINT pk_user_password_resets PRIMARY KEY (user_entity_id);


--
-- PostgreSQL database dump complete
--

