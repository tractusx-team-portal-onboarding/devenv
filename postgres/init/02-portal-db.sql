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
-- Name: app_licenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_licenses (
    app_license_id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    licensetext character varying(255)
);


--
-- Name: company_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_roles (
    company_role_id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    name_de character varying(255) NOT NULL,
    name_en character varying(255) NOT NULL
);


--
-- Name: company_user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_user_roles (
    company_user_role_id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    namede character varying(255) NOT NULL,
    nameen character varying(255) NOT NULL
);


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.countries (
    country_name_en character varying(255) PRIMARY KEY,  --?? FIXME ??
    alpha_2_code character varying(255),
    alpha_3_code character varying(255),
    country_name_de character varying(255)
);


--
-- Name: document_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.document_templates (
    document_template_id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    documenttemplatename character varying(255) NOT NULL,
    documenttemplateversion character varying(255) NOT NULL
);


CREATE TABLE portal.identity_provider_categories (
    category integer PRIMARY KEY,
    label character varying(255)
);


--
-- Name: identity_providers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.identity_providers (
    item_category integer NOT NULL,
    identity_provider_id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    CONSTRAINT fk_iwohgwi9342adf9asdnfuie28 FOREIGN KEY (item_category) REFERENCES portal.identity_provider_categories(category)
);


CREATE TABLE portal.iam_identity_providers (
    iam_identity_provider_id uuid PRIMARY KEY,
    iam_idp_alias character varying(255) NOT NULL,
    CONSTRAINT fk_9balkda89j2498dkj2lkjd9s3 FOREIGN KEY (iam_identity_provider_id) REFERENCES portal.identity_providers(identity_provider_id)
);


--
-- Name: languages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.languages (
    short_name character varying(255) PRIMARY KEY, --?? FIXME ??
    long_name_de character varying(255),
    long_name_en character varying(255)
);


--
-- Name: use_cases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.use_cases (
    use_case_id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    name character varying(255),
    shortname character varying(255)
);


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.addresses (
    address_id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    city character varying(255),
    region character varying(255),
    streetadditional character varying(255),
    streetname character varying(255),
    streetnumber character varying(255),
    zipcode numeric(19,2),
    country_country_name_en character varying(255), --?? REALLY ??
    CONSTRAINT fk_6jg6itw07d2qww62deuyk0kh FOREIGN KEY (country_country_name_en) REFERENCES portal.countries(country_name_en)
);


CREATE TABLE portal.company_status (
    status integer PRIMARY KEY,
    label character varying(255)
);

--
-- Name: companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.companies (
    company_id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    bpn character varying(20) NOT NULL,
    name character varying(255),
    parent character varying(255),
    shortname character varying(255),
    status integer,
    address_id uuid,
    CONSTRAINT fk_w70yf6urddd0ky7ev90okenf FOREIGN KEY (address_id) REFERENCES portal.addresses(address_id),
    CONSTRAINT fk_owihadhfweilwefhaf682khj FOREIGN KEY (status) REFERENCES portal.company_status(status)
);

CREATE TABLE portal.company_identity_provider (
    company_id uuid NOT NULL,
    identity_provider_id uuid NOT NULL,
    CONSTRAINT pk_company_identity_provider PRIMARY KEY (company_id, identity_provider_id),
    CONSTRAINT fk_haad983jkald89wlkejidk234 FOREIGN KEY (company_id) REFERENCES portal.companies(company_id),
    CONSTRAINT fk_iwzehadf8whjd8asjdfuwefhs FOREIGN KEY (identity_provider_id) REFERENCES portal.identity_providers(identity_provider_id)
);

--
-- Name: apps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.apps (
    app_id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    name character varying(255),
    date_released timestamp without time zone,
    thumbnail_url character varying(255),
    vendor_company_id uuid,
    CONSTRAINT fk_68a9joedhyf43smfx2xc4rgm FOREIGN KEY (vendor_company_id) REFERENCES portal.companies(company_id)
);


--
-- Name: company_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_users (
    company_user_id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    email character varying(255),
    firstname character varying(255),
    lastlogin bytea,
    lastname character varying(255),
    company_id uuid NOT NULL,
    CONSTRAINT fk_ku01366dbcqk8h32lh8k5sx1 FOREIGN KEY (company_id) REFERENCES portal.companies(company_id)
);


CREATE TABLE portal.iam_user (
    company_user_id uuid PRIMARY KEY,
    iam_user_id uuid NOT NULL,
    CONSTRAINT uk_wiodwiowhdfo84f0sd9afsd2 UNIQUE (iam_user_id),
    CONSTRAINT fk_iweorqwaeilskjeijekkalwo FOREIGN KEY (company_user_id) REFERENCES portal.company_users(company_user_id)
);

--
-- Name: documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.documents (
    document_id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    document oid NOT NULL,
    documenthash character varying(255) NOT NULL,
    documentname character varying(255) NOT NULL,
    documentuploaddate bytea NOT NULL,
    documentversion character varying(255) NOT NULL,
    company_user_id uuid,
    CONSTRAINT fk_xcgobngn7vk56k8nfkuaysvn FOREIGN KEY (company_user_id) REFERENCES portal.company_users(company_user_id)
);

--
-- Name: agreements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.agreements (
    item_category integer NOT NULL,
    agreement_id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    agreement_type character varying(255),
    name character varying(255) NOT NULL,
    app_id uuid,
    issuer_company_id uuid NOT NULL,
    usecase_id uuid,
    CONSTRAINT fk_n4nnf5bn8i3i9ijrf7kchfvc FOREIGN KEY (issuer_company_id) REFERENCES portal.companies(company_id),
    CONSTRAINT fk_whby66dika71srejhja6g75a FOREIGN KEY (usecase_id) REFERENCES portal.use_cases(use_case_id),
    CONSTRAINT fk_ooy9ydkah696jxh4lq7pn0xe FOREIGN KEY (app_id) REFERENCES portal.apps(app_id)
);


--
-- Name: agreement_assigned_company_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.agreement_assigned_company_roles (
    agreement_id uuid NOT NULL,
    company_role_id uuid NOT NULL,
    CONSTRAINT uk_6df9o1r7dy987w1pt9qnkopcv UNIQUE (company_role_id),
    CONSTRAINT fk_qh1hby9qcrr3gmy1cvi7nd3h FOREIGN KEY (company_role_id) REFERENCES portal.company_roles(company_role_id),
    CONSTRAINT fk_ljol11mdo76f4kv7fwqn1qc6 FOREIGN KEY (agreement_id) REFERENCES portal.agreements(agreement_id)
);


--
-- Name: agreement_assigned_document_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.agreement_assigned_document_templates (
    agreement_id uuid NOT NULL,
    document_template_id uuid NOT NULL,
    CONSTRAINT uk_9ib7xuc1vke96s9rvlyhxbtuc UNIQUE (document_template_id),
    CONSTRAINT fk_fvcwoptsuer9p23m055osose FOREIGN KEY (agreement_id) REFERENCES portal.agreements(agreement_id),
    CONSTRAINT fk_bvrvs5aktrcn4t6565pnj3ur FOREIGN KEY (document_template_id) REFERENCES portal.document_templates(document_template_id)
);


--
-- Name: app_assigned_company_user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_assigned_company_user_roles (
    app_id uuid NOT NULL,
    company_user_role_id uuid,
    CONSTRAINT fk_4m022ek8gffepnqlnuxwyxp8 FOREIGN KEY (company_user_role_id) REFERENCES portal.company_user_roles(company_user_role_id),
    CONSTRAINT fk_oayyvy590ngh5705yspep0up FOREIGN KEY (app_id) REFERENCES portal.apps(app_id)
);


--
-- Name: app_assigned_licenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_assigned_licenses (
    app_id uuid NOT NULL,
    app_license_id uuid NOT NULL,
    CONSTRAINT fk_3of613iyw1jx8gcj5i46jc1h FOREIGN KEY (app_id) REFERENCES portal.apps(app_id),
    CONSTRAINT fk_mes2xm3i1wotryfc88be4dkf FOREIGN KEY (app_license_id) REFERENCES portal.app_licenses(app_license_id)
);


--
-- Name: app_assigned_use_cases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_assigned_use_cases (
    app_id uuid NOT NULL,
    use_case_id uuid NOT NULL,
    CONSTRAINT fk_sjyfs49ma0kxaqfknjbaye0i FOREIGN KEY (use_case_id) REFERENCES portal.use_cases(use_case_id),
    CONSTRAINT fk_qi320sp8lxy7drw6kt4vheka FOREIGN KEY (app_id) REFERENCES portal.apps(app_id)
);


--
-- Name: app_descriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_descriptions (
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    description_long character varying(4096),
    description_short character varying(255),
    app_id uuid NOT NULL,
    language_short_name character varying(255), -- ?? FIXME ??
    CONSTRAINT app_descriptions_pkey PRIMARY KEY (app_id, language_short_name),
    CONSTRAINT fk_qamy6j7s3klebrf2s69v9k0i FOREIGN KEY (app_id) REFERENCES portal.apps(app_id),
    CONSTRAINT fk_vrom2pjij9x6stgovhaqkfxf FOREIGN KEY (language_short_name) REFERENCES portal.languages(short_name)
);


CREATE TABLE portal.company_application_status (
    status integer PRIMARY KEY,
    label character varying(255)
);

--
-- Name: company_applications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_applications (
    company_application_id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    status integer,
    company_id uuid NOT NULL,
    CONSTRAINT fk_3prv5i3o84vwvh7v0hh3sav7 FOREIGN KEY (company_id) REFERENCES portal.companies(company_id),
    CONSTRAINT fk_akuwiehfiadf8928fhefhuda FOREIGN KEY (status) REFERENCES portal.company_application_status(status)
);


--
-- Name: company_assigned_apps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_assigned_apps (
    company_id uuid NOT NULL,
    app_id uuid NOT NULL,
    CONSTRAINT fk_t365qpfvehuq40om25dyrnn5 FOREIGN KEY (app_id) REFERENCES portal.apps(app_id),
    CONSTRAINT fk_k1dqlv81463yes0k8f2giyaf FOREIGN KEY (company_id) REFERENCES portal.companies(company_id)
);


--
-- Name: company_assigned_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_assigned_roles (
    company_id uuid NOT NULL,
    company_role_id uuid NOT NULL,
    CONSTRAINT fk_my2p7jlqrjf0tq1f8rhk0i0a FOREIGN KEY (company_role_id) REFERENCES portal.company_roles(company_role_id),
    CONSTRAINT fk_4db4hgj3yvqlkn9h6q8m4e0j FOREIGN KEY (company_id) REFERENCES portal.companies(company_id)
);


--
-- Name: company_assigned_use_cases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_assigned_use_cases (
    company_id uuid NOT NULL,
    use_case_id uuid NOT NULL,
    CONSTRAINT fk_m5eyaohrl0g9ju52byxsouqk FOREIGN KEY (use_case_id) REFERENCES portal.use_cases(use_case_id),
    CONSTRAINT fk_u65fkdrxnbkp8n0s7mate01v FOREIGN KEY (company_id) REFERENCES portal.companies(company_id)
);


--
-- Name: company_user_assigned_app_favourites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_user_assigned_app_favourites (
    company_user_id uuid NOT NULL,
    app_id uuid NOT NULL,
    CONSTRAINT fk_wva553r3xiew3ngbdkvafk85 FOREIGN KEY (company_user_id) REFERENCES portal.company_users(company_user_id),
    CONSTRAINT fk_eip97mygnbglivrtmkagesjh FOREIGN KEY (app_id) REFERENCES portal.apps(app_id)
);


--
-- Name: company_user_assigned_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_user_assigned_roles (
    company_user_id uuid NOT NULL,
    user_role_id uuid NOT NULL,
    CONSTRAINT fk_0c9rjjf9gm3l0n6reb4o0f1s FOREIGN KEY (company_user_id) REFERENCES portal.company_users(company_user_id),
    CONSTRAINT fk_bw1yhel67uhrxfk7mevovq5p FOREIGN KEY (user_role_id) REFERENCES portal.company_user_roles(company_user_role_id)
);


CREATE TABLE portal.consent_status (
    status integer PRIMARY KEY,
    label character varying(255)
);

--
-- Name: consents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.consents (
    consent_id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    comment character varying(255),
    status integer NOT NULL,
    target character varying(255),
    "timestamp" bytea NOT NULL,
    agreement_id uuid NOT NULL,
    company_id uuid NOT NULL,
    documents_id uuid,
    company_user_id uuid NOT NULL,
    CONSTRAINT fk_asqxie2r7yr06cdrw9ifaex8 FOREIGN KEY (company_id) REFERENCES portal.companies(company_id),
    CONSTRAINT fk_cnrtafckouq96m0fw2qtpwbs FOREIGN KEY (company_user_id) REFERENCES portal.company_users(company_user_id),
    CONSTRAINT fk_36j22f34lgi2444n4tynxamh FOREIGN KEY (documents_id) REFERENCES portal.documents(document_id),
    CONSTRAINT fk_39a5cbiv35v59ysgfon5oole FOREIGN KEY (agreement_id) REFERENCES portal.agreements(agreement_id),
    CONSTRAINT fk_aiodhuwehw8wee20adskdfo2 FOREIGN KEY (status) REFERENCES portal.consent_status(status)
);


CREATE TABLE portal.invitation_status (
    status integer PRIMARY KEY,
    label character varying(255)
);

--
-- Name: invitations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.invitations (
    invitation_id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    status integer NOT NULL,
    company_application_id uuid,
    company_user_id uuid NOT NULL,
    CONSTRAINT fk_9tgenb7p09hr5c24haxjw259 FOREIGN KEY (company_user_id) REFERENCES portal.company_users(company_user_id),
    CONSTRAINT fk_dlrst4ju9d0wcgkh4w1nnoj3 FOREIGN KEY (company_application_id) REFERENCES portal.company_applications(company_application_id),
    CONSTRAINT fk_woihaodhawoeir72alfidosd FOREIGN KEY (status) REFERENCES portal.invitation_status(status)
);

INSERT INTO portal.company_application_status (status, label) values(1,'ADD_COMPANY_DATA');
INSERT INTO portal.company_application_status (status, label) values(2,'INVITE_USER');
INSERT INTO portal.company_application_status (status, label) values(3,'SELECT_COMPANY_ROLE');
INSERT INTO portal.company_application_status (status, label) values(4,'UPLOAD_DOCUMENTS');
INSERT INTO portal.company_application_status (status, label) values(5,'VERIFY');
INSERT INTO portal.company_application_status (status, label) values(6,'SUBMITTED');

