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

--
-- Name: portal; Type: SCHEMA; Schema: -; Owner: portal
--

CREATE SCHEMA portal;


ALTER SCHEMA portal OWNER TO portal;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: addresses; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.addresses (
    address_id uuid NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    city character varying(255),
    region character varying(255),
    streetadditional character varying(255),
    streetname character varying(255),
    streetnumber character varying(255),
    zipcode numeric(19,2),
    country_country_name_en character varying(255)
);


ALTER TABLE portal.addresses OWNER TO portal;

--
-- Name: agreement_assigned_company_roles; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.agreement_assigned_company_roles (
    agreement_id uuid NOT NULL,
    company_role_id integer NOT NULL
);


ALTER TABLE portal.agreement_assigned_company_roles OWNER TO portal;

--
-- Name: agreement_assigned_document_templates; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.agreement_assigned_document_templates (
    agreement_id uuid NOT NULL,
    document_template_id uuid NOT NULL
);


ALTER TABLE portal.agreement_assigned_document_templates OWNER TO portal;

--
-- Name: agreement_categories; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.agreement_categories (
    agreement_category_id integer NOT NULL,
    label character varying(255)
);


ALTER TABLE portal.agreement_categories OWNER TO portal;

--
-- Name: agreements; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.agreements (
    agreement_category_id integer NOT NULL,
    agreement_id uuid NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    agreement_type character varying(255),
    name character varying(255) NOT NULL,
    app_id uuid,
    issuer_company_id uuid NOT NULL,
    use_case_id uuid
);


ALTER TABLE portal.agreements OWNER TO portal;

--
-- Name: app_assigned_company_user_roles; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.app_assigned_company_user_roles (
    app_id uuid NOT NULL,
    company_user_role_id uuid
);


ALTER TABLE portal.app_assigned_company_user_roles OWNER TO portal;

--
-- Name: app_assigned_licenses; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.app_assigned_licenses (
    app_id uuid NOT NULL,
    app_license_id uuid NOT NULL
);


ALTER TABLE portal.app_assigned_licenses OWNER TO portal;

--
-- Name: app_assigned_use_cases; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.app_assigned_use_cases (
    app_id uuid NOT NULL,
    use_case_id uuid NOT NULL
);


ALTER TABLE portal.app_assigned_use_cases OWNER TO portal;

--
-- Name: app_descriptions; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.app_descriptions (
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    description_long character varying(4096),
    description_short character varying(255),
    app_id uuid NOT NULL,
    language_short_name character varying(255) NOT NULL
);


ALTER TABLE portal.app_descriptions OWNER TO portal;

--
-- Name: app_licenses; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.app_licenses (
    app_license_id uuid NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    licensetext character varying(255)
);


ALTER TABLE portal.app_licenses OWNER TO portal;

--
-- Name: apps; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.apps (
    app_id uuid NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    name character varying(255),
    date_released timestamp without time zone,
    thumbnail_url character varying(255),
    vendor_company_id uuid
);


ALTER TABLE portal.apps OWNER TO portal;

--
-- Name: companies; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.companies (
    company_id uuid NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    bpn character varying(20) NOT NULL,
    name character varying(255),
    parent character varying(255),
    shortname character varying(255),
    company_status_id integer,
    address_id uuid
);


ALTER TABLE portal.companies OWNER TO portal;

--
-- Name: company_application_status; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.company_application_status (
    application_status_id integer NOT NULL,
    label character varying(255)
);


ALTER TABLE portal.company_application_status OWNER TO portal;

--
-- Name: company_applications; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.company_applications (
    company_application_id uuid NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    application_status_id integer,
    company_id uuid NOT NULL
);


ALTER TABLE portal.company_applications OWNER TO portal;

--
-- Name: company_assigned_apps; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.company_assigned_apps (
    company_id uuid NOT NULL,
    app_id uuid NOT NULL
);


ALTER TABLE portal.company_assigned_apps OWNER TO portal;

--
-- Name: company_assigned_roles; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.company_assigned_roles (
    company_id uuid NOT NULL,
    company_role_id integer NOT NULL
);


ALTER TABLE portal.company_assigned_roles OWNER TO portal;

--
-- Name: company_assigned_use_cases; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.company_assigned_use_cases (
    company_id uuid NOT NULL,
    use_case_id uuid NOT NULL
);


ALTER TABLE portal.company_assigned_use_cases OWNER TO portal;

--
-- Name: company_identity_provider; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.company_identity_provider (
    company_id uuid NOT NULL,
    identity_provider_id uuid NOT NULL
);


ALTER TABLE portal.company_identity_provider OWNER TO portal;

--
-- Name: company_roles; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.company_roles (
    company_role_id integer NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    name_de character varying(255) NOT NULL,
    name_en character varying(255) NOT NULL
);


ALTER TABLE portal.company_roles OWNER TO portal;

--
-- Name: company_status; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.company_status (
    company_status_id integer NOT NULL,
    label character varying(255)
);


ALTER TABLE portal.company_status OWNER TO portal;

--
-- Name: company_user_assigned_app_favourites; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.company_user_assigned_app_favourites (
    company_user_id uuid NOT NULL,
    app_id uuid NOT NULL
);


ALTER TABLE portal.company_user_assigned_app_favourites OWNER TO portal;

--
-- Name: company_user_assigned_roles; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.company_user_assigned_roles (
    company_user_id uuid NOT NULL,
    user_role_id uuid NOT NULL
);


ALTER TABLE portal.company_user_assigned_roles OWNER TO portal;

--
-- Name: company_user_roles; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.company_user_roles (
    company_user_role_id uuid NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    namede character varying(255) NOT NULL,
    nameen character varying(255) NOT NULL
);


ALTER TABLE portal.company_user_roles OWNER TO portal;

--
-- Name: company_users; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.company_users (
    company_user_id uuid NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    email character varying(255),
    firstname character varying(255),
    lastlogin bytea,
    lastname character varying(255),
    company_id uuid NOT NULL
);


ALTER TABLE portal.company_users OWNER TO portal;

--
-- Name: consent_status; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.consent_status (
    consent_status_id integer NOT NULL,
    label character varying(255)
);


ALTER TABLE portal.consent_status OWNER TO portal;

--
-- Name: consents; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.consents (
    consent_id uuid NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    comment character varying(255),
    consent_status_id integer NOT NULL,
    target character varying(255),
    "timestamp" bytea NOT NULL,
    agreement_id uuid NOT NULL,
    company_id uuid NOT NULL,
    documents_id uuid,
    company_user_id uuid NOT NULL
);


ALTER TABLE portal.consents OWNER TO portal;

--
-- Name: countries; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.countries (
    country_name_en character varying(255) NOT NULL,
    alpha_2_code character varying(255),
    alpha_3_code character varying(255),
    country_name_de character varying(255)
);


ALTER TABLE portal.countries OWNER TO portal;

--
-- Name: document_templates; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.document_templates (
    document_template_id uuid NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    documenttemplatename character varying(255) NOT NULL,
    documenttemplateversion character varying(255) NOT NULL
);


ALTER TABLE portal.document_templates OWNER TO portal;

--
-- Name: documents; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.documents (
    document_id uuid NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    document oid NOT NULL,
    documenthash character varying(255) NOT NULL,
    documentname character varying(255) NOT NULL,
    documentuploaddate bytea NOT NULL,
    documentversion character varying(255) NOT NULL,
    company_user_id uuid
);


ALTER TABLE portal.documents OWNER TO portal;

--
-- Name: iam_identity_providers; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.iam_identity_providers (
    identity_provider_id uuid NOT NULL,
    iam_idp_alias character varying(255) NOT NULL
);


ALTER TABLE portal.iam_identity_providers OWNER TO portal;

--
-- Name: iam_users; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.iam_users (
    company_user_id uuid NOT NULL,
    iam_user_id uuid NOT NULL
);


ALTER TABLE portal.iam_users OWNER TO portal;

--
-- Name: identity_provider_categories; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.identity_provider_categories (
    identity_provider_category_id integer NOT NULL,
    label character varying(255)
);


ALTER TABLE portal.identity_provider_categories OWNER TO portal;

--
-- Name: identity_providers; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.identity_providers (
    identity_provider_category_id integer NOT NULL,
    identity_provider_id uuid NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone
);


ALTER TABLE portal.identity_providers OWNER TO portal;

--
-- Name: invitation_status; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.invitation_status (
    invitation_status_id integer NOT NULL,
    label character varying(255)
);


ALTER TABLE portal.invitation_status OWNER TO portal;

--
-- Name: invitations; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.invitations (
    invitation_id uuid NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    invitation_status_id integer NOT NULL,
    company_application_id uuid,
    company_user_id uuid NOT NULL
);


ALTER TABLE portal.invitations OWNER TO portal;

--
-- Name: languages; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.languages (
    short_name character varying(255) NOT NULL,
    long_name_de character varying(255),
    long_name_en character varying(255)
);


ALTER TABLE portal.languages OWNER TO portal;

--
-- Name: use_cases; Type: TABLE; Schema: portal; Owner: portal
--

CREATE TABLE portal.use_cases (
    use_case_id uuid NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    name character varying(255),
    shortname character varying(255)
);


ALTER TABLE portal.use_cases OWNER TO portal;

--
-- Data for Name: addresses; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.addresses (address_id, date_created, date_last_changed, city, region, streetadditional, streetname, streetnumber, zipcode, country_country_name_en) FROM stdin;
\.


--
-- Data for Name: agreement_assigned_company_roles; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.agreement_assigned_company_roles (agreement_id, company_role_id) FROM stdin;
\.


--
-- Data for Name: agreement_assigned_document_templates; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.agreement_assigned_document_templates (agreement_id, document_template_id) FROM stdin;
\.


--
-- Data for Name: agreement_categories; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.agreement_categories (agreement_category_id, label) FROM stdin;
\.


--
-- Data for Name: agreements; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.agreements (agreement_category_id, agreement_id, date_created, date_last_changed, agreement_type, name, app_id, issuer_company_id, use_case_id) FROM stdin;
\.


--
-- Data for Name: app_assigned_company_user_roles; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.app_assigned_company_user_roles (app_id, company_user_role_id) FROM stdin;
\.


--
-- Data for Name: app_assigned_licenses; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.app_assigned_licenses (app_id, app_license_id) FROM stdin;
\.


--
-- Data for Name: app_assigned_use_cases; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.app_assigned_use_cases (app_id, use_case_id) FROM stdin;
\.


--
-- Data for Name: app_descriptions; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.app_descriptions (date_created, date_last_changed, description_long, description_short, app_id, language_short_name) FROM stdin;
\.


--
-- Data for Name: app_licenses; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.app_licenses (app_license_id, date_created, date_last_changed, licensetext) FROM stdin;
\.


--
-- Data for Name: apps; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.apps (app_id, date_created, date_last_changed, name, date_released, thumbnail_url, vendor_company_id) FROM stdin;
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.companies (company_id, date_created, date_last_changed, bpn, name, parent, shortname, company_status_id, address_id) FROM stdin;
\.


--
-- Data for Name: company_application_status; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_application_status (application_status_id, label) FROM stdin;
1	ADD_COMPANY_DATA
2	INVITE_USER
3	SELECT_COMPANY_ROLE
4	UPLOAD_DOCUMENTS
5	VERIFY
6	SUBMITTED
\.


--
-- Data for Name: company_applications; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_applications (company_application_id, date_created, date_last_changed, application_status_id, company_id) FROM stdin;
\.


--
-- Data for Name: company_assigned_apps; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_assigned_apps (company_id, app_id) FROM stdin;
\.


--
-- Data for Name: company_assigned_roles; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_assigned_roles (company_id, company_role_id) FROM stdin;
\.


--
-- Data for Name: company_assigned_use_cases; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_assigned_use_cases (company_id, use_case_id) FROM stdin;
\.


--
-- Data for Name: company_identity_provider; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_identity_provider (company_id, identity_provider_id) FROM stdin;
\.


--
-- Data for Name: company_roles; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_roles (company_role_id, date_created, date_last_changed, name_de, name_en) FROM stdin;
\.


--
-- Data for Name: company_status; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_status (company_status_id, label) FROM stdin;
\.


--
-- Data for Name: company_user_assigned_app_favourites; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_user_assigned_app_favourites (company_user_id, app_id) FROM stdin;
\.


--
-- Data for Name: company_user_assigned_roles; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_user_assigned_roles (company_user_id, user_role_id) FROM stdin;
\.


--
-- Data for Name: company_user_roles; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_user_roles (company_user_role_id, date_created, date_last_changed, namede, nameen) FROM stdin;
\.


--
-- Data for Name: company_users; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.company_users (company_user_id, date_created, date_last_changed, email, firstname, lastlogin, lastname, company_id) FROM stdin;
\.


--
-- Data for Name: consent_status; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.consent_status (consent_status_id, label) FROM stdin;
\.


--
-- Data for Name: consents; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.consents (consent_id, date_created, date_last_changed, comment, consent_status_id, target, "timestamp", agreement_id, company_id, documents_id, company_user_id) FROM stdin;
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.countries (country_name_en, alpha_2_code, alpha_3_code, country_name_de) FROM stdin;
\.


--
-- Data for Name: document_templates; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.document_templates (document_template_id, date_created, date_last_changed, documenttemplatename, documenttemplateversion) FROM stdin;
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.documents (document_id, date_created, date_last_changed, document, documenthash, documentname, documentuploaddate, documentversion, company_user_id) FROM stdin;
\.


--
-- Data for Name: iam_identity_providers; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.iam_identity_providers (identity_provider_id, iam_idp_alias) FROM stdin;
\.


--
-- Data for Name: iam_users; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.iam_users (company_user_id, iam_user_id) FROM stdin;
\.


--
-- Data for Name: identity_provider_categories; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.identity_provider_categories (identity_provider_category_id, label) FROM stdin;
1	KEYCLOAK_SHARED
2	KEYCLOAK_OIDC
3	KEYCLOAK_SAML
\.


--
-- Data for Name: identity_providers; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.identity_providers (identity_provider_category_id, identity_provider_id, date_created, date_last_changed) FROM stdin;
\.


--
-- Data for Name: invitation_status; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.invitation_status (invitation_status_id, label) FROM stdin;
\.


--
-- Data for Name: invitations; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.invitations (invitation_id, date_created, date_last_changed, invitation_status_id, company_application_id, company_user_id) FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.languages (short_name, long_name_de, long_name_en) FROM stdin;
\.


--
-- Data for Name: use_cases; Type: TABLE DATA; Schema: portal; Owner: portal
--

COPY portal.use_cases (use_case_id, date_created, date_last_changed, name, shortname) FROM stdin;
\.


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (address_id);


--
-- Name: agreement_categories agreement_categories_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.agreement_categories
    ADD CONSTRAINT agreement_categories_pkey PRIMARY KEY (agreement_category_id);


--
-- Name: agreements agreements_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.agreements
    ADD CONSTRAINT agreements_pkey PRIMARY KEY (agreement_id);


--
-- Name: app_descriptions app_descriptions_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.app_descriptions
    ADD CONSTRAINT app_descriptions_pkey PRIMARY KEY (app_id, language_short_name);


--
-- Name: app_licenses app_licenses_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.app_licenses
    ADD CONSTRAINT app_licenses_pkey PRIMARY KEY (app_license_id);


--
-- Name: apps apps_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.apps
    ADD CONSTRAINT apps_pkey PRIMARY KEY (app_id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (company_id);


--
-- Name: company_application_status company_application_status_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_application_status
    ADD CONSTRAINT company_application_status_pkey PRIMARY KEY (application_status_id);


--
-- Name: company_applications company_applications_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_applications
    ADD CONSTRAINT company_applications_pkey PRIMARY KEY (company_application_id);


--
-- Name: company_roles company_roles_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_roles
    ADD CONSTRAINT company_roles_pkey PRIMARY KEY (company_role_id);


--
-- Name: company_status company_status_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_status
    ADD CONSTRAINT company_status_pkey PRIMARY KEY (company_status_id);


--
-- Name: company_user_roles company_user_roles_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_user_roles
    ADD CONSTRAINT company_user_roles_pkey PRIMARY KEY (company_user_role_id);


--
-- Name: company_users company_users_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_users
    ADD CONSTRAINT company_users_pkey PRIMARY KEY (company_user_id);


--
-- Name: consent_status consent_status_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.consent_status
    ADD CONSTRAINT consent_status_pkey PRIMARY KEY (consent_status_id);


--
-- Name: consents consents_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.consents
    ADD CONSTRAINT consents_pkey PRIMARY KEY (consent_id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_name_en);


--
-- Name: document_templates document_templates_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.document_templates
    ADD CONSTRAINT document_templates_pkey PRIMARY KEY (document_template_id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (document_id);


--
-- Name: iam_identity_providers iam_identity_providers_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.iam_identity_providers
    ADD CONSTRAINT iam_identity_providers_pkey PRIMARY KEY (identity_provider_id);


--
-- Name: iam_users iam_users_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.iam_users
    ADD CONSTRAINT iam_users_pkey PRIMARY KEY (company_user_id);


--
-- Name: identity_provider_categories identity_provider_categories_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.identity_provider_categories
    ADD CONSTRAINT identity_provider_categories_pkey PRIMARY KEY (identity_provider_category_id);


--
-- Name: identity_providers identity_providers_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.identity_providers
    ADD CONSTRAINT identity_providers_pkey PRIMARY KEY (identity_provider_id);


--
-- Name: invitation_status invitation_status_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.invitation_status
    ADD CONSTRAINT invitation_status_pkey PRIMARY KEY (invitation_status_id);


--
-- Name: invitations invitations_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.invitations
    ADD CONSTRAINT invitations_pkey PRIMARY KEY (invitation_id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (short_name);


--
-- Name: company_identity_provider pk_company_identity_provider; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_identity_provider
    ADD CONSTRAINT pk_company_identity_provider PRIMARY KEY (company_id, identity_provider_id);


--
-- Name: agreement_assigned_company_roles uk_6df9o1r7dy987w1pt9qnkopcv; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.agreement_assigned_company_roles
    ADD CONSTRAINT uk_6df9o1r7dy987w1pt9qnkopcv UNIQUE (company_role_id);


--
-- Name: agreement_assigned_document_templates uk_9ib7xuc1vke96s9rvlyhxbtuc; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.agreement_assigned_document_templates
    ADD CONSTRAINT uk_9ib7xuc1vke96s9rvlyhxbtuc UNIQUE (document_template_id);


--
-- Name: iam_users uk_wiodwiowhdfo84f0sd9afsd2; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.iam_users
    ADD CONSTRAINT uk_wiodwiowhdfo84f0sd9afsd2 UNIQUE (iam_user_id);


--
-- Name: use_cases use_cases_pkey; Type: CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.use_cases
    ADD CONSTRAINT use_cases_pkey PRIMARY KEY (use_case_id);


--
-- Name: company_user_assigned_roles fk_0c9rjjf9gm3l0n6reb4o0f1s; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_user_assigned_roles
    ADD CONSTRAINT fk_0c9rjjf9gm3l0n6reb4o0f1s FOREIGN KEY (company_user_id) REFERENCES portal.company_users(company_user_id);


--
-- Name: consents fk_36j22f34lgi2444n4tynxamh; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.consents
    ADD CONSTRAINT fk_36j22f34lgi2444n4tynxamh FOREIGN KEY (documents_id) REFERENCES portal.documents(document_id);


--
-- Name: consents fk_39a5cbiv35v59ysgfon5oole; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.consents
    ADD CONSTRAINT fk_39a5cbiv35v59ysgfon5oole FOREIGN KEY (agreement_id) REFERENCES portal.agreements(agreement_id);


--
-- Name: app_assigned_licenses fk_3of613iyw1jx8gcj5i46jc1h; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.app_assigned_licenses
    ADD CONSTRAINT fk_3of613iyw1jx8gcj5i46jc1h FOREIGN KEY (app_id) REFERENCES portal.apps(app_id);


--
-- Name: company_applications fk_3prv5i3o84vwvh7v0hh3sav7; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_applications
    ADD CONSTRAINT fk_3prv5i3o84vwvh7v0hh3sav7 FOREIGN KEY (company_id) REFERENCES portal.companies(company_id);


--
-- Name: company_assigned_roles fk_4db4hgj3yvqlkn9h6q8m4e0j; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_assigned_roles
    ADD CONSTRAINT fk_4db4hgj3yvqlkn9h6q8m4e0j FOREIGN KEY (company_id) REFERENCES portal.companies(company_id);


--
-- Name: app_assigned_company_user_roles fk_4m022ek8gffepnqlnuxwyxp8; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.app_assigned_company_user_roles
    ADD CONSTRAINT fk_4m022ek8gffepnqlnuxwyxp8 FOREIGN KEY (company_user_role_id) REFERENCES portal.company_user_roles(company_user_role_id);


--
-- Name: apps fk_68a9joedhyf43smfx2xc4rgm; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.apps
    ADD CONSTRAINT fk_68a9joedhyf43smfx2xc4rgm FOREIGN KEY (vendor_company_id) REFERENCES portal.companies(company_id);


--
-- Name: addresses fk_6jg6itw07d2qww62deuyk0kh; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.addresses
    ADD CONSTRAINT fk_6jg6itw07d2qww62deuyk0kh FOREIGN KEY (country_country_name_en) REFERENCES portal.countries(country_name_en);


--
-- Name: iam_identity_providers fk_9balkda89j2498dkj2lkjd9s3; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.iam_identity_providers
    ADD CONSTRAINT fk_9balkda89j2498dkj2lkjd9s3 FOREIGN KEY (identity_provider_id) REFERENCES portal.identity_providers(identity_provider_id);


--
-- Name: invitations fk_9tgenb7p09hr5c24haxjw259; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.invitations
    ADD CONSTRAINT fk_9tgenb7p09hr5c24haxjw259 FOREIGN KEY (company_user_id) REFERENCES portal.company_users(company_user_id);


--
-- Name: consents fk_aiodhuwehw8wee20adskdfo2; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.consents
    ADD CONSTRAINT fk_aiodhuwehw8wee20adskdfo2 FOREIGN KEY (consent_status_id) REFERENCES portal.consent_status(consent_status_id);


--
-- Name: company_applications fk_akuwiehfiadf8928fhefhuda; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_applications
    ADD CONSTRAINT fk_akuwiehfiadf8928fhefhuda FOREIGN KEY (application_status_id) REFERENCES portal.company_application_status(application_status_id);


--
-- Name: consents fk_asqxie2r7yr06cdrw9ifaex8; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.consents
    ADD CONSTRAINT fk_asqxie2r7yr06cdrw9ifaex8 FOREIGN KEY (company_id) REFERENCES portal.companies(company_id);


--
-- Name: agreement_assigned_document_templates fk_bvrvs5aktrcn4t6565pnj3ur; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.agreement_assigned_document_templates
    ADD CONSTRAINT fk_bvrvs5aktrcn4t6565pnj3ur FOREIGN KEY (document_template_id) REFERENCES portal.document_templates(document_template_id);


--
-- Name: company_user_assigned_roles fk_bw1yhel67uhrxfk7mevovq5p; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_user_assigned_roles
    ADD CONSTRAINT fk_bw1yhel67uhrxfk7mevovq5p FOREIGN KEY (user_role_id) REFERENCES portal.company_user_roles(company_user_role_id);


--
-- Name: consents fk_cnrtafckouq96m0fw2qtpwbs; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.consents
    ADD CONSTRAINT fk_cnrtafckouq96m0fw2qtpwbs FOREIGN KEY (company_user_id) REFERENCES portal.company_users(company_user_id);


--
-- Name: invitations fk_dlrst4ju9d0wcgkh4w1nnoj3; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.invitations
    ADD CONSTRAINT fk_dlrst4ju9d0wcgkh4w1nnoj3 FOREIGN KEY (company_application_id) REFERENCES portal.company_applications(company_application_id);


--
-- Name: company_user_assigned_app_favourites fk_eip97mygnbglivrtmkagesjh; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_user_assigned_app_favourites
    ADD CONSTRAINT fk_eip97mygnbglivrtmkagesjh FOREIGN KEY (app_id) REFERENCES portal.apps(app_id);


--
-- Name: agreement_assigned_document_templates fk_fvcwoptsuer9p23m055osose; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.agreement_assigned_document_templates
    ADD CONSTRAINT fk_fvcwoptsuer9p23m055osose FOREIGN KEY (agreement_id) REFERENCES portal.agreements(agreement_id);


--
-- Name: company_identity_provider fk_haad983jkald89wlkejidk234; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_identity_provider
    ADD CONSTRAINT fk_haad983jkald89wlkejidk234 FOREIGN KEY (company_id) REFERENCES portal.companies(company_id);


--
-- Name: iam_users fk_iweorqwaeilskjeijekkalwo; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.iam_users
    ADD CONSTRAINT fk_iweorqwaeilskjeijekkalwo FOREIGN KEY (company_user_id) REFERENCES portal.company_users(company_user_id);


--
-- Name: identity_providers fk_iwohgwi9342adf9asdnfuie28; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.identity_providers
    ADD CONSTRAINT fk_iwohgwi9342adf9asdnfuie28 FOREIGN KEY (identity_provider_category_id) REFERENCES portal.identity_provider_categories(identity_provider_category_id);


--
-- Name: company_identity_provider fk_iwzehadf8whjd8asjdfuwefhs; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_identity_provider
    ADD CONSTRAINT fk_iwzehadf8whjd8asjdfuwefhs FOREIGN KEY (identity_provider_id) REFERENCES portal.identity_providers(identity_provider_id);


--
-- Name: company_assigned_apps fk_k1dqlv81463yes0k8f2giyaf; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_assigned_apps
    ADD CONSTRAINT fk_k1dqlv81463yes0k8f2giyaf FOREIGN KEY (company_id) REFERENCES portal.companies(company_id);


--
-- Name: company_users fk_ku01366dbcqk8h32lh8k5sx1; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_users
    ADD CONSTRAINT fk_ku01366dbcqk8h32lh8k5sx1 FOREIGN KEY (company_id) REFERENCES portal.companies(company_id);


--
-- Name: agreement_assigned_company_roles fk_ljol11mdo76f4kv7fwqn1qc6; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.agreement_assigned_company_roles
    ADD CONSTRAINT fk_ljol11mdo76f4kv7fwqn1qc6 FOREIGN KEY (agreement_id) REFERENCES portal.agreements(agreement_id);


--
-- Name: company_assigned_use_cases fk_m5eyaohrl0g9ju52byxsouqk; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_assigned_use_cases
    ADD CONSTRAINT fk_m5eyaohrl0g9ju52byxsouqk FOREIGN KEY (use_case_id) REFERENCES portal.use_cases(use_case_id);


--
-- Name: app_assigned_licenses fk_mes2xm3i1wotryfc88be4dkf; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.app_assigned_licenses
    ADD CONSTRAINT fk_mes2xm3i1wotryfc88be4dkf FOREIGN KEY (app_license_id) REFERENCES portal.app_licenses(app_license_id);


--
-- Name: company_assigned_roles fk_my2p7jlqrjf0tq1f8rhk0i0a; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_assigned_roles
    ADD CONSTRAINT fk_my2p7jlqrjf0tq1f8rhk0i0a FOREIGN KEY (company_role_id) REFERENCES portal.company_roles(company_role_id);


--
-- Name: agreements fk_n4nnf5bn8i3i9ijrf7kchfvc; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.agreements
    ADD CONSTRAINT fk_n4nnf5bn8i3i9ijrf7kchfvc FOREIGN KEY (issuer_company_id) REFERENCES portal.companies(company_id);


--
-- Name: app_assigned_company_user_roles fk_oayyvy590ngh5705yspep0up; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.app_assigned_company_user_roles
    ADD CONSTRAINT fk_oayyvy590ngh5705yspep0up FOREIGN KEY (app_id) REFERENCES portal.apps(app_id);


--
-- Name: agreements fk_ooy9ydkah696jxh4lq7pn0xe; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.agreements
    ADD CONSTRAINT fk_ooy9ydkah696jxh4lq7pn0xe FOREIGN KEY (app_id) REFERENCES portal.apps(app_id);


--
-- Name: companies fk_owihadhfweilwefhaf682khj; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.companies
    ADD CONSTRAINT fk_owihadhfweilwefhaf682khj FOREIGN KEY (company_status_id) REFERENCES portal.company_status(company_status_id);


--
-- Name: agreements fk_owqie84qkle78dasifljiwer; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.agreements
    ADD CONSTRAINT fk_owqie84qkle78dasifljiwer FOREIGN KEY (agreement_category_id) REFERENCES portal.agreement_categories(agreement_category_id);


--
-- Name: app_descriptions fk_qamy6j7s3klebrf2s69v9k0i; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.app_descriptions
    ADD CONSTRAINT fk_qamy6j7s3klebrf2s69v9k0i FOREIGN KEY (app_id) REFERENCES portal.apps(app_id);


--
-- Name: agreement_assigned_company_roles fk_qh1hby9qcrr3gmy1cvi7nd3h; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.agreement_assigned_company_roles
    ADD CONSTRAINT fk_qh1hby9qcrr3gmy1cvi7nd3h FOREIGN KEY (company_role_id) REFERENCES portal.company_roles(company_role_id);


--
-- Name: app_assigned_use_cases fk_qi320sp8lxy7drw6kt4vheka; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.app_assigned_use_cases
    ADD CONSTRAINT fk_qi320sp8lxy7drw6kt4vheka FOREIGN KEY (app_id) REFERENCES portal.apps(app_id);


--
-- Name: app_assigned_use_cases fk_sjyfs49ma0kxaqfknjbaye0i; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.app_assigned_use_cases
    ADD CONSTRAINT fk_sjyfs49ma0kxaqfknjbaye0i FOREIGN KEY (use_case_id) REFERENCES portal.use_cases(use_case_id);


--
-- Name: company_assigned_apps fk_t365qpfvehuq40om25dyrnn5; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_assigned_apps
    ADD CONSTRAINT fk_t365qpfvehuq40om25dyrnn5 FOREIGN KEY (app_id) REFERENCES portal.apps(app_id);


--
-- Name: company_assigned_use_cases fk_u65fkdrxnbkp8n0s7mate01v; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_assigned_use_cases
    ADD CONSTRAINT fk_u65fkdrxnbkp8n0s7mate01v FOREIGN KEY (company_id) REFERENCES portal.companies(company_id);


--
-- Name: app_descriptions fk_vrom2pjij9x6stgovhaqkfxf; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.app_descriptions
    ADD CONSTRAINT fk_vrom2pjij9x6stgovhaqkfxf FOREIGN KEY (language_short_name) REFERENCES portal.languages(short_name);


--
-- Name: companies fk_w70yf6urddd0ky7ev90okenf; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.companies
    ADD CONSTRAINT fk_w70yf6urddd0ky7ev90okenf FOREIGN KEY (address_id) REFERENCES portal.addresses(address_id);


--
-- Name: agreements fk_whby66dika71srejhja6g75a; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.agreements
    ADD CONSTRAINT fk_whby66dika71srejhja6g75a FOREIGN KEY (use_case_id) REFERENCES portal.use_cases(use_case_id);


--
-- Name: invitations fk_woihaodhawoeir72alfidosd; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.invitations
    ADD CONSTRAINT fk_woihaodhawoeir72alfidosd FOREIGN KEY (invitation_status_id) REFERENCES portal.invitation_status(invitation_status_id);


--
-- Name: company_user_assigned_app_favourites fk_wva553r3xiew3ngbdkvafk85; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.company_user_assigned_app_favourites
    ADD CONSTRAINT fk_wva553r3xiew3ngbdkvafk85 FOREIGN KEY (company_user_id) REFERENCES portal.company_users(company_user_id);


--
-- Name: documents fk_xcgobngn7vk56k8nfkuaysvn; Type: FK CONSTRAINT; Schema: portal; Owner: portal
--

ALTER TABLE ONLY portal.documents
    ADD CONSTRAINT fk_xcgobngn7vk56k8nfkuaysvn FOREIGN KEY (company_user_id) REFERENCES portal.company_users(company_user_id);


--
-- PostgreSQL database dump complete
--

