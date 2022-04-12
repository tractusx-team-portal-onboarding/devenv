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
    id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    licensetext character varying(255)
);


--
-- Name: company_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_roles (
    id integer PRIMARY KEY,
    company_role character varying(255) NOT NULL,
    date_created timestamp without time zone,
    name_de character varying(255) NOT NULL,
    name_en character varying(255) NOT NULL
);


--
-- Name: company_user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_user_roles (
    id uuid PRIMARY KEY,
    company_user_role character varying(255) NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    namede character varying(255) NOT NULL,
    nameen character varying(255) NOT NULL
);


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.countries (
    country_name_en character varying(255) NOT NULL,
    alpha_2_code character(2) PRIMARY KEY,
    alpha_3_code character(3),
    country_name_de character varying(255) NOT NULL
);


--
-- Name: document_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.document_templates (
    id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    documenttemplatename character varying(255) NOT NULL,
    documenttemplateversion character varying(255) NOT NULL
);


CREATE TABLE portal.identity_provider_categories (
    identity_provider_category_id integer PRIMARY KEY,
    label character varying(255)
);


--
-- Name: identity_providers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.identity_providers (
    identity_provider_category_id integer NOT NULL,
    id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    CONSTRAINT fk_iwohgwi9342adf9asdnfuie28 FOREIGN KEY (identity_provider_category_id) REFERENCES portal.identity_provider_categories(identity_provider_category_id)
);


CREATE TABLE portal.iam_identity_providers (
    identity_provider_id uuid NOT NULL,
    iam_idp_alias character varying(255) PRIMARY KEY,
    CONSTRAINT fk_9balkda89j2498dkj2lkjd9s3 FOREIGN KEY (identity_provider_id) REFERENCES portal.identity_providers(id),
    CONSTRAINT uk_aiehoat94wlhasdfiwlkefisi UNIQUE (identity_provider_id)
);


--
-- Name: languages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.languages (
    language_short_name character(2) PRIMARY KEY,
    long_name_de character varying(255),
    long_name_en character varying(255)
);


--
-- Name: use_cases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.use_cases (
    id uuid PRIMARY KEY,
    name character varying(255),
    shortname character varying(255)
);


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.addresses (
    id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    city character varying(255),
    region character varying(255),
    streetadditional character varying(255),
    streetname character varying(255),
    streetnumber character varying(255),
    zipcode numeric(19,2),
    country_alpha_2_code character(2),
    CONSTRAINT fk_6jg6itw07d2qww62deuyk0kh FOREIGN KEY (country_alpha_2_code) REFERENCES portal.countries(alpha_2_code)
);


CREATE TABLE portal.company_status (
    company_status_id integer PRIMARY KEY,
    label character varying(255)
);

--
-- Name: companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.companies (
    id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    bpn character varying(20),
    name character varying(255),
    parent character varying(255),
    shortname character varying(255),
    company_status_id integer,
    address_id uuid,
    CONSTRAINT fk_w70yf6urddd0ky7ev90okenf FOREIGN KEY (address_id) REFERENCES portal.addresses(id),
    CONSTRAINT fk_owihadhfweilwefhaf682khj FOREIGN KEY (company_status_id) REFERENCES portal.company_status(company_status_id)
);

CREATE TABLE portal.company_identity_provider (
    company_id uuid NOT NULL,
    identity_provider_id uuid NOT NULL,
    CONSTRAINT pk_company_identity_provider PRIMARY KEY (company_id, identity_provider_id),
    CONSTRAINT fk_haad983jkald89wlkejidk234 FOREIGN KEY (company_id) REFERENCES portal.companies(id),
    CONSTRAINT fk_iwzehadf8whjd8asjdfuwefhs FOREIGN KEY (identity_provider_id) REFERENCES portal.identity_providers(id)
);

--
-- Name: apps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.apps (
    id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    name character varying(255),
    date_released timestamp without time zone,
    thumbnail_url character varying(255),
    app_url character varying(255),
    marketing_url character varying(255),
    contact_email character varying(255),
    contact_number character varying(255),
    provider character varying(255),
    vendor_company_id uuid,
    CONSTRAINT fk_68a9joedhyf43smfx2xc4rgm FOREIGN KEY (vendor_company_id) REFERENCES portal.companies(id)
);


-- Name: app_detail_image; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_detail_image (
    app_id uuid,
    image_url character varying(255),
    CONSTRAINT pk_app_assg_comp_user_roles PRIMARY KEY (app_id, image_url),
    CONSTRAINT fk_oayyvy590ngh5705yspep0up FOREIGN KEY (app_id) REFERENCES portal.apps(id)
);

--
-- Name: company_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_users (
    id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    email character varying(255),
    firstname character varying(255),
    lastlogin bytea,
    lastname character varying(255),
    company_id uuid NOT NULL,
    CONSTRAINT fk_ku01366dbcqk8h32lh8k5sx1 FOREIGN KEY (company_id) REFERENCES portal.companies(id)
);


CREATE TABLE portal.iam_users (
    user_entity_id character varying(36) PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    company_user_id uuid NOT NULL,
    CONSTRAINT uk_wiodwiowhdfo84f0sd9afsd2 UNIQUE (company_user_id),
    CONSTRAINT fk_iweorqwaeilskjeijekkalwo FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id)
);


--
-- Name: documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.documents (
    id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    document oid NOT NULL,
    documenthash character varying(255) NOT NULL,
    documentname character varying(255) NOT NULL,
    documentuploaddate bytea NOT NULL,
    documentversion character varying(255) NOT NULL,
    company_user_id uuid,
    CONSTRAINT fk_xcgobngn7vk56k8nfkuaysvn FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id)
);

CREATE TABLE portal.agreement_categories (
    agreement_category_id integer PRIMARY KEY,
    label character varying(255)
);

--
-- Name: agreements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.agreements (
    agreement_category_id integer NOT NULL,
    id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    agreement_type character varying(255),
    name character varying(255) NOT NULL,
    app_id uuid,
    issuer_company_id uuid NOT NULL,
    use_case_id uuid,
    CONSTRAINT fk_n4nnf5bn8i3i9ijrf7kchfvc FOREIGN KEY (issuer_company_id) REFERENCES portal.companies(id),
    CONSTRAINT fk_whby66dika71srejhja6g75a FOREIGN KEY (use_case_id) REFERENCES portal.use_cases(id),
    CONSTRAINT fk_ooy9ydkah696jxh4lq7pn0xe FOREIGN KEY (app_id) REFERENCES portal.apps(id),
    CONSTRAINT fk_owqie84qkle78dasifljiwer FOREIGN KEY (agreement_category_id) REFERENCES portal.agreement_categories(agreement_category_id)
);


--
-- Name: agreement_assigned_company_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.agreement_assigned_company_roles (
    agreement_id uuid NOT NULL,
    company_role_id integer NOT NULL,
    CONSTRAINT pk_agreement_ass_comp_roles PRIMARY KEY (agreement_id, company_role_id),
    CONSTRAINT uk_6df9o1r7dy987w1pt9qnkopc UNIQUE (company_role_id),
    CONSTRAINT fk_qh1hby9qcrr3gmy1cvi7nd3h FOREIGN KEY (company_role_id) REFERENCES portal.company_roles(id),
    CONSTRAINT fk_ljol11mdo76f4kv7fwqn1qc6 FOREIGN KEY (agreement_id) REFERENCES portal.agreements(id)
);


--
-- Name: agreement_assigned_document_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.agreement_assigned_document_templates (
    agreement_id uuid NOT NULL,
    document_template_id uuid NOT NULL,
    CONSTRAINT pk_agreement_ass_doc_templa PRIMARY KEY (agreement_id, document_template_id),
    CONSTRAINT uk_9ib7xuc1vke96s9rvlyhxbtu UNIQUE (document_template_id),
    CONSTRAINT fk_fvcwoptsuer9p23m055osose FOREIGN KEY (agreement_id) REFERENCES portal.agreements(id),
    CONSTRAINT fk_bvrvs5aktrcn4t6565pnj3ur FOREIGN KEY (document_template_id) REFERENCES portal.document_templates(id)
);


--
-- Name: app_assigned_company_user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_assigned_company_user_roles (
    app_id uuid NOT NULL,
    company_user_role_id uuid,
    CONSTRAINT pk_app_assg_comp_user_roles PRIMARY KEY (app_id, company_user_role_id),
    CONSTRAINT fk_4m022ek8gffepnqlnuxwyxp8 FOREIGN KEY (company_user_role_id) REFERENCES portal.company_user_roles(id),
    CONSTRAINT fk_oayyvy590ngh5705yspep0up FOREIGN KEY (app_id) REFERENCES portal.apps(id)
);


--
-- Name: app_assigned_licenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_assigned_licenses (
    app_id uuid NOT NULL,
    app_license_id uuid NOT NULL,
    CONSTRAINT pk_app_assigned_licenses PRIMARY KEY (app_id, app_license_id),
    CONSTRAINT fk_3of613iyw1jx8gcj5i46jc1h FOREIGN KEY (app_id) REFERENCES portal.apps(id),
    CONSTRAINT fk_mes2xm3i1wotryfc88be4dkf FOREIGN KEY (app_license_id) REFERENCES portal.app_licenses(id)
);


--
-- Name: app_assigned_use_cases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_assigned_use_cases (
    app_id uuid NOT NULL,
    use_case_id uuid NOT NULL,
    CONSTRAINT pk_app_assigned_use_cases PRIMARY KEY (app_id, use_case_id),
    CONSTRAINT fk_sjyfs49ma0kxaqfknjbaye0i FOREIGN KEY (use_case_id) REFERENCES portal.use_cases(id),
    CONSTRAINT fk_qi320sp8lxy7drw6kt4vheka FOREIGN KEY (app_id) REFERENCES portal.apps(id)
);


--
-- Name: app_descriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_descriptions (
    description_long character varying(4096),
    description_short character varying(255),
    app_id uuid NOT NULL,
    language_short_name character(2),
    CONSTRAINT app_descriptions_pkey PRIMARY KEY (app_id, language_short_name),
    CONSTRAINT fk_qamy6j7s3klebrf2s69v9k0i FOREIGN KEY (app_id) REFERENCES portal.apps(id),
    CONSTRAINT fk_vrom2pjij9x6stgovhaqkfxf FOREIGN KEY (language_short_name) REFERENCES portal.languages(language_short_name)
);


CREATE TABLE portal.company_application_status (
    application_status_id integer PRIMARY KEY,
    label character varying(255)
);

--
-- Name: company_applications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_applications (
    id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    application_status_id integer,
    company_id uuid NOT NULL,
    CONSTRAINT fk_3prv5i3o84vwvh7v0hh3sav7 FOREIGN KEY (company_id) REFERENCES portal.companies(id),
    CONSTRAINT fk_akuwiehfiadf8928fhefhuda FOREIGN KEY (application_status_id) REFERENCES portal.company_application_status(application_status_id)
);


--
-- Name: company_assigned_apps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_assigned_apps (
    company_id uuid NOT NULL,
    app_id uuid NOT NULL,
    CONSTRAINT pk_company_assigned_apps PRIMARY KEY (company_id, app_id),
    CONSTRAINT fk_t365qpfvehuq40om25dyrnn5 FOREIGN KEY (app_id) REFERENCES portal.apps(id),
    CONSTRAINT fk_k1dqlv81463yes0k8f2giyaf FOREIGN KEY (company_id) REFERENCES portal.companies(id)
);


--
-- Name: company_assigned_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_assigned_roles (
    company_id uuid NOT NULL,
    company_role_id integer NOT NULL,
    CONSTRAINT pk_company_assigned_roles PRIMARY KEY (company_id, company_role_id),
    CONSTRAINT fk_my2p7jlqrjf0tq1f8rhk0i0a FOREIGN KEY (company_role_id) REFERENCES portal.company_roles(id),
    CONSTRAINT fk_4db4hgj3yvqlkn9h6q8m4e0j FOREIGN KEY (company_id) REFERENCES portal.companies(id)
);


--
-- Name: company_assigned_use_cases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_assigned_use_cases (
    company_id uuid NOT NULL,
    use_case_id uuid NOT NULL,
    CONSTRAINT pk_company_assigned_use_cas PRIMARY KEY (company_id, use_case_id),
    CONSTRAINT fk_m5eyaohrl0g9ju52byxsouqk FOREIGN KEY (use_case_id) REFERENCES portal.use_cases(id),
    CONSTRAINT fk_u65fkdrxnbkp8n0s7mate01v FOREIGN KEY (company_id) REFERENCES portal.companies(id)
);


--
-- Name: company_user_assigned_app_favourites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_user_assigned_app_favourites (
    company_user_id uuid NOT NULL,
    app_id uuid NOT NULL,
    CONSTRAINT pk_comp_user_ass_app_favour PRIMARY KEY (company_user_id, app_id),
    CONSTRAINT fk_wva553r3xiew3ngbdkvafk85 FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id),
    CONSTRAINT fk_eip97mygnbglivrtmkagesjh FOREIGN KEY (app_id) REFERENCES portal.apps(id)
);


--
-- Name: company_user_assigned_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_user_assigned_roles (
    company_user_id uuid NOT NULL,
    user_role_id uuid NOT NULL,
    CONSTRAINT pk_comp_user_assigned_roles PRIMARY KEY (company_user_id, user_role_id),
    CONSTRAINT fk_0c9rjjf9gm3l0n6reb4o0f1s FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id),
    CONSTRAINT fk_bw1yhel67uhrxfk7mevovq5p FOREIGN KEY (user_role_id) REFERENCES portal.company_user_roles(id)
);


CREATE TABLE portal.consent_status (
    consent_status_id integer PRIMARY KEY,
    label character varying(255)
);

--
-- Name: consents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.consents (
    id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    comment character varying(255),
    consent_status_id integer NOT NULL,
    target character varying(255),
    "timestamp" bytea NOT NULL,
    agreement_id uuid NOT NULL,
    company_id uuid NOT NULL,
    documents_id uuid,
    company_user_id uuid NOT NULL,
    CONSTRAINT fk_asqxie2r7yr06cdrw9ifaex8 FOREIGN KEY (company_id) REFERENCES portal.companies(id),
    CONSTRAINT fk_cnrtafckouq96m0fw2qtpwbs FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id),
    CONSTRAINT fk_36j22f34lgi2444n4tynxamh FOREIGN KEY (documents_id) REFERENCES portal.documents(id),
    CONSTRAINT fk_39a5cbiv35v59ysgfon5oole FOREIGN KEY (agreement_id) REFERENCES portal.agreements(id),
    CONSTRAINT fk_aiodhuwehw8wee20adskdfo2 FOREIGN KEY (consent_status_id) REFERENCES portal.consent_status(consent_status_id)
);


CREATE TABLE portal.invitation_status (
    invitation_status_id integer PRIMARY KEY,
    label character varying(255)
);

--
-- Name: invitations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.invitations (
    id uuid PRIMARY KEY,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    invitation_status_id integer NOT NULL,
    company_application_id uuid,
    company_user_id uuid NOT NULL,
    CONSTRAINT fk_9tgenb7p09hr5c24haxjw259 FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id),
    CONSTRAINT fk_dlrst4ju9d0wcgkh4w1nnoj3 FOREIGN KEY (company_application_id) REFERENCES portal.company_applications(id),
    CONSTRAINT fk_woihaodhawoeir72alfidosd FOREIGN KEY (invitation_status_id) REFERENCES portal.invitation_status(invitation_status_id)
);
