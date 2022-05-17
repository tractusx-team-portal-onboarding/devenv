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
-- Name: portal; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA portal;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: addresses; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.addresses (
    id uuid NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_last_changed timestamp with time zone,
    city character varying(255) NOT NULL,
    region character varying(255),
    streetadditional character varying(255),
    streetname character varying(255) NOT NULL,
    streetnumber character varying(255),
    zipcode numeric(19,2) NOT NULL,
    country_alpha2code character(2) NOT NULL
);


--
-- Name: agreement_assigned_company_roles; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.agreement_assigned_company_roles (
    agreement_id uuid NOT NULL,
    company_role_id integer NOT NULL
);


--
-- Name: agreement_assigned_document_templates; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.agreement_assigned_document_templates (
    agreement_id uuid NOT NULL,
    document_template_id uuid NOT NULL
);


--
-- Name: agreement_categories; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.agreement_categories (
    agreement_category_id integer NOT NULL,
    label character varying(255) NOT NULL
);


--
-- Name: agreements; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.agreements (
    id uuid NOT NULL,
    agreement_category_id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_last_changed timestamp with time zone,
    agreement_type character varying(255),
    name character varying(255) NOT NULL,
    app_id uuid,
    issuer_company_id uuid NOT NULL,
    use_case_id uuid
);


--
-- Name: app_assigned_clients; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.app_assigned_clients (
    app_id uuid NOT NULL,
    iam_client_id uuid NOT NULL
);


--
-- Name: app_assigned_licenses; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.app_assigned_licenses (
    app_id uuid NOT NULL,
    app_license_id uuid NOT NULL
);


--
-- Name: app_assigned_use_cases; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.app_assigned_use_cases (
    app_id uuid NOT NULL,
    use_case_id uuid NOT NULL
);


--
-- Name: app_descriptions; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.app_descriptions (
    app_id uuid NOT NULL,
    language_short_name character(2) NOT NULL,
    description_long character varying(4096) NOT NULL,
    description_short character varying(255) NOT NULL
);


--
-- Name: app_detail_images; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.app_detail_images (
    id uuid NOT NULL,
    app_id uuid NOT NULL,
    image_url character varying(255) NOT NULL
);


--
-- Name: app_languages; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.app_languages (
    app_id uuid NOT NULL,
    language_short_name character(2) NOT NULL
);


--
-- Name: app_licenses; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.app_licenses (
    id uuid NOT NULL,
    licensetext character varying(255) NOT NULL
);


--
-- Name: app_status; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.app_status (
    app_status_id integer NOT NULL,
    label character varying(255) NOT NULL
);


--
-- Name: app_tags; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.app_tags (
    app_id uuid NOT NULL,
    tag_name character varying(255) NOT NULL
);


--
-- Name: apps; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.apps (
    id uuid NOT NULL,
    name character varying(255),
    date_created timestamp with time zone NOT NULL,
    date_released timestamp with time zone,
    thumbnail_url character varying(255),
    app_url character varying(255),
    marketing_url character varying(255),
    contact_email character varying(255),
    contact_number character varying(255),
    provider character varying(255) NOT NULL,
    provider_company_id uuid,
    app_status_id integer NOT NULL
);


--
-- Name: companies; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.companies (
    id uuid NOT NULL,
    date_created timestamp with time zone NOT NULL,
    bpn character varying(20),
    tax_id character varying(20),
    name character varying(255) NOT NULL,
    parent character varying(255),
    shortname character varying(255),
    company_status_id integer NOT NULL,
    address_id uuid
);


--
-- Name: company_application_status; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_application_status (
    application_status_id integer NOT NULL,
    label character varying(255) NOT NULL
);


--
-- Name: company_applications; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_applications (
    id uuid NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_last_changed timestamp with time zone,
    application_status_id integer NOT NULL,
    company_id uuid NOT NULL
);


--
-- Name: company_assigned_apps; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_assigned_apps (
    company_id uuid NOT NULL,
    app_id uuid NOT NULL
);


--
-- Name: company_assigned_roles; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_assigned_roles (
    company_id uuid NOT NULL,
    company_role_id integer NOT NULL
);


--
-- Name: company_assigned_use_cases; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_assigned_use_cases (
    company_id uuid NOT NULL,
    use_case_id uuid NOT NULL
);


--
-- Name: company_identity_provider; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_identity_provider (
    company_id uuid NOT NULL,
    identity_provider_id uuid NOT NULL
);


--
-- Name: company_role_descriptions; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_role_descriptions (
    company_role_id integer NOT NULL,
    language_short_name character(2) NOT NULL,
    description character varying(255) NOT NULL
);


--
-- Name: company_roles; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_roles (
    company_role_id integer NOT NULL,
    label character varying(255) NOT NULL
);


--
-- Name: company_status; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_status (
    company_status_id integer NOT NULL,
    label character varying(255) NOT NULL
);


--
-- Name: company_user_assigned_app_favourites; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_user_assigned_app_favourites (
    company_user_id uuid NOT NULL,
    app_id uuid NOT NULL
);


--
-- Name: company_user_assigned_roles; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_user_assigned_roles (
    company_user_id uuid NOT NULL,
    user_role_id uuid NOT NULL
);


--
-- Name: company_user_status; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_user_status (
    company_user_status_id integer NOT NULL,
    label character varying(255) NOT NULL
);


--
-- Name: company_users; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_users (
    id uuid NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_last_changed timestamp with time zone,
    email character varying(255),
    firstname character varying(255),
    lastlogin bytea,
    lastname character varying(255),
    company_id uuid NOT NULL,
    company_user_status_id integer NOT NULL
);


--
-- Name: consent_status; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.consent_status (
    consent_status_id integer NOT NULL,
    label character varying(255) NOT NULL
);


--
-- Name: consents; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.consents (
    id uuid NOT NULL,
    date_created timestamp with time zone NOT NULL,
    comment character varying(255),
    consent_status_id integer NOT NULL,
    target character varying(255),
    agreement_id uuid NOT NULL,
    company_id uuid NOT NULL,
    document_id uuid,
    company_user_id uuid NOT NULL
);


--
-- Name: countries; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.countries (
    alpha2code character(2) NOT NULL,
    alpha3code character(3),
    country_name_de character varying(255) NOT NULL,
    country_name_en character varying(255) NOT NULL
);


--
-- Name: document_templates; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.document_templates (
    id uuid NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_last_changed timestamp with time zone,
    documenttemplatename character varying(255) NOT NULL,
    documenttemplateversion character varying(255) NOT NULL
);


--
-- Name: document_types; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.document_types (
    document_type_id integer NOT NULL,
    label character varying(255) NOT NULL
);


--
-- Name: documents; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.documents (
    id uuid NOT NULL,
    date_created timestamp with time zone NOT NULL,
    document oid NOT NULL,
    documenthash character varying(255) NOT NULL,
    documentname character varying(255) NOT NULL,
    document_type_id integer,
    company_user_id uuid
);


--
-- Name: iam_clients; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.iam_clients (
    id uuid NOT NULL,
    client_client_id character varying(255) NOT NULL
);


--
-- Name: iam_identity_providers; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.iam_identity_providers (
    iam_idp_alias character varying(255) NOT NULL,
    identity_provider_id uuid NOT NULL
);


--
-- Name: iam_users; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.iam_users (
    user_entity_id character varying(36) NOT NULL,
    company_user_id uuid NOT NULL
);


--
-- Name: identity_provider_categories; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.identity_provider_categories (
    identity_provider_category_id integer NOT NULL,
    label character varying(255) NOT NULL
);


--
-- Name: identity_providers; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.identity_providers (
    id uuid NOT NULL,
    date_created timestamp with time zone NOT NULL,
    identity_provider_category_id integer NOT NULL
);


--
-- Name: invitation_status; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.invitation_status (
    invitation_status_id integer NOT NULL,
    label character varying(255) NOT NULL
);


--
-- Name: invitations; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.invitations (
    id uuid NOT NULL,
    date_created timestamp with time zone NOT NULL,
    invitation_status_id integer NOT NULL,
    company_application_id uuid NOT NULL,
    company_user_id uuid NOT NULL
);


--
-- Name: languages; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.languages (
    short_name character(2) NOT NULL,
    long_name_de character varying(255) NOT NULL,
    long_name_en character varying(255) NOT NULL
);


--
-- Name: use_cases; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.use_cases (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    shortname character varying(255) NOT NULL
);


--
-- Name: user_role_descriptions; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.user_role_descriptions (
    user_role_id uuid NOT NULL,
    language_short_name character(2) NOT NULL,
    description character varying(255) NOT NULL
);


--
-- Name: user_roles; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.user_roles (
    id uuid NOT NULL,
    user_role character varying(255) NOT NULL,
    iam_client_id uuid NOT NULL
);


--
-- Name: app_descriptions app_descriptions_pkey; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_descriptions
    ADD CONSTRAINT app_descriptions_pkey PRIMARY KEY (app_id, language_short_name);


--
-- Name: company_application_status company_application_status_pkey; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_application_status
    ADD CONSTRAINT company_application_status_pkey PRIMARY KEY (application_status_id);


--
-- Name: addresses pk_addresses; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.addresses
    ADD CONSTRAINT pk_addresses PRIMARY KEY (id);


--
-- Name: agreement_assigned_company_roles pk_agreement_ass_comp_roles; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreement_assigned_company_roles
    ADD CONSTRAINT pk_agreement_ass_comp_roles PRIMARY KEY (agreement_id, company_role_id);


--
-- Name: agreement_assigned_document_templates pk_agreement_ass_doc_templa; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreement_assigned_document_templates
    ADD CONSTRAINT pk_agreement_ass_doc_templa PRIMARY KEY (agreement_id, document_template_id);


--
-- Name: agreement_categories pk_agreement_categories; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreement_categories
    ADD CONSTRAINT pk_agreement_categories PRIMARY KEY (agreement_category_id);


--
-- Name: agreements pk_agreements; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreements
    ADD CONSTRAINT pk_agreements PRIMARY KEY (id);


--
-- Name: app_assigned_clients pk_app_assigned_clients; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_assigned_clients
    ADD CONSTRAINT pk_app_assigned_clients PRIMARY KEY (app_id, iam_client_id);


--
-- Name: app_assigned_licenses pk_app_assigned_licenses; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_assigned_licenses
    ADD CONSTRAINT pk_app_assigned_licenses PRIMARY KEY (app_id, app_license_id);


--
-- Name: app_assigned_use_cases pk_app_assigned_use_cases; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_assigned_use_cases
    ADD CONSTRAINT pk_app_assigned_use_cases PRIMARY KEY (app_id, use_case_id);


--
-- Name: app_detail_images pk_app_detail_images; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_detail_images
    ADD CONSTRAINT pk_app_detail_images PRIMARY KEY (id);


--
-- Name: app_languages pk_app_language; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_languages
    ADD CONSTRAINT pk_app_language PRIMARY KEY (app_id, language_short_name);


--
-- Name: app_licenses pk_app_licenses; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_licenses
    ADD CONSTRAINT pk_app_licenses PRIMARY KEY (id);


--
-- Name: app_status pk_app_status; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_status
    ADD CONSTRAINT pk_app_status PRIMARY KEY (app_status_id);


--
-- Name: app_tags pk_app_tags; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_tags
    ADD CONSTRAINT pk_app_tags PRIMARY KEY (app_id, tag_name);


--
-- Name: apps pk_apps; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.apps
    ADD CONSTRAINT pk_apps PRIMARY KEY (id);


--
-- Name: company_user_assigned_app_favourites pk_comp_user_ass_app_favour; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_user_assigned_app_favourites
    ADD CONSTRAINT pk_comp_user_ass_app_favour PRIMARY KEY (company_user_id, app_id);


--
-- Name: company_user_assigned_roles pk_comp_user_assigned_roles; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_user_assigned_roles
    ADD CONSTRAINT pk_comp_user_assigned_roles PRIMARY KEY (company_user_id, user_role_id);


--
-- Name: companies pk_companies; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.companies
    ADD CONSTRAINT pk_companies PRIMARY KEY (id);


--
-- Name: company_applications pk_company_applications; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_applications
    ADD CONSTRAINT pk_company_applications PRIMARY KEY (id);


--
-- Name: company_assigned_apps pk_company_assigned_apps; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_assigned_apps
    ADD CONSTRAINT pk_company_assigned_apps PRIMARY KEY (company_id, app_id);


--
-- Name: company_assigned_roles pk_company_assigned_roles; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_assigned_roles
    ADD CONSTRAINT pk_company_assigned_roles PRIMARY KEY (company_id, company_role_id);


--
-- Name: company_assigned_use_cases pk_company_assigned_use_cas; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_assigned_use_cases
    ADD CONSTRAINT pk_company_assigned_use_cas PRIMARY KEY (company_id, use_case_id);


--
-- Name: company_identity_provider pk_company_identity_provider; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_identity_provider
    ADD CONSTRAINT pk_company_identity_provider PRIMARY KEY (company_id, identity_provider_id);


--
-- Name: company_role_descriptions pk_company_role_descriptions; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_role_descriptions
    ADD CONSTRAINT pk_company_role_descriptions PRIMARY KEY (company_role_id, language_short_name);


--
-- Name: company_roles pk_company_roles; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_roles
    ADD CONSTRAINT pk_company_roles PRIMARY KEY (company_role_id);


--
-- Name: company_status pk_company_status; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_status
    ADD CONSTRAINT pk_company_status PRIMARY KEY (company_status_id);


--
-- Name: company_user_status pk_company_user_status; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_user_status
    ADD CONSTRAINT pk_company_user_status PRIMARY KEY (company_user_status_id);


--
-- Name: company_users pk_company_users; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_users
    ADD CONSTRAINT pk_company_users PRIMARY KEY (id);


--
-- Name: consent_status pk_consent_status; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.consent_status
    ADD CONSTRAINT pk_consent_status PRIMARY KEY (consent_status_id);


--
-- Name: consents pk_consents; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.consents
    ADD CONSTRAINT pk_consents PRIMARY KEY (id);


--
-- Name: countries pk_countries; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.countries
    ADD CONSTRAINT pk_countries PRIMARY KEY (alpha2code);


--
-- Name: document_templates pk_document_templates; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.document_templates
    ADD CONSTRAINT pk_document_templates PRIMARY KEY (id);


--
-- Name: document_types pk_document_types; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.document_types
    ADD CONSTRAINT pk_document_types PRIMARY KEY (document_type_id);


--
-- Name: documents pk_documents; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.documents
    ADD CONSTRAINT pk_documents PRIMARY KEY (id);


--
-- Name: iam_clients pk_iam_clients; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.iam_clients
    ADD CONSTRAINT pk_iam_clients PRIMARY KEY (id);


--
-- Name: iam_identity_providers pk_iam_identity_providers; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.iam_identity_providers
    ADD CONSTRAINT pk_iam_identity_providers PRIMARY KEY (iam_idp_alias);


--
-- Name: iam_users pk_iam_users; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.iam_users
    ADD CONSTRAINT pk_iam_users PRIMARY KEY (user_entity_id);


--
-- Name: identity_provider_categories pk_identity_provider_categories; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.identity_provider_categories
    ADD CONSTRAINT pk_identity_provider_categories PRIMARY KEY (identity_provider_category_id);


--
-- Name: identity_providers pk_identity_providers; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.identity_providers
    ADD CONSTRAINT pk_identity_providers PRIMARY KEY (id);


--
-- Name: invitation_status pk_invitation_status; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.invitation_status
    ADD CONSTRAINT pk_invitation_status PRIMARY KEY (invitation_status_id);


--
-- Name: invitations pk_invitations; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.invitations
    ADD CONSTRAINT pk_invitations PRIMARY KEY (id);


--
-- Name: languages pk_languages; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.languages
    ADD CONSTRAINT pk_languages PRIMARY KEY (short_name);


--
-- Name: use_cases pk_use_cases; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.use_cases
    ADD CONSTRAINT pk_use_cases PRIMARY KEY (id);


--
-- Name: user_role_descriptions pk_user_role_descriptions; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.user_role_descriptions
    ADD CONSTRAINT pk_user_role_descriptions PRIMARY KEY (user_role_id, language_short_name);


--
-- Name: user_roles pk_user_roles; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.user_roles
    ADD CONSTRAINT pk_user_roles PRIMARY KEY (id);


--
-- Name: ix_addresses_country_alpha2code; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_addresses_country_alpha2code ON portal.addresses USING btree (country_alpha2code);


--
-- Name: ix_agreement_assigned_company_roles_company_role_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_agreement_assigned_company_roles_company_role_id ON portal.agreement_assigned_company_roles USING btree (company_role_id);


--
-- Name: ix_agreement_assigned_document_templates_document_template_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE UNIQUE INDEX ix_agreement_assigned_document_templates_document_template_id ON portal.agreement_assigned_document_templates USING btree (document_template_id);


--
-- Name: ix_agreements_agreement_category_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_agreements_agreement_category_id ON portal.agreements USING btree (agreement_category_id);


--
-- Name: ix_agreements_app_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_agreements_app_id ON portal.agreements USING btree (app_id);


--
-- Name: ix_agreements_issuer_company_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_agreements_issuer_company_id ON portal.agreements USING btree (issuer_company_id);


--
-- Name: ix_agreements_use_case_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_agreements_use_case_id ON portal.agreements USING btree (use_case_id);


--
-- Name: ix_app_assigned_clients_iam_client_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_app_assigned_clients_iam_client_id ON portal.app_assigned_clients USING btree (iam_client_id);


--
-- Name: ix_app_assigned_licenses_app_license_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_app_assigned_licenses_app_license_id ON portal.app_assigned_licenses USING btree (app_license_id);


--
-- Name: ix_app_assigned_use_cases_use_case_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_app_assigned_use_cases_use_case_id ON portal.app_assigned_use_cases USING btree (use_case_id);


--
-- Name: ix_app_descriptions_language_short_name; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_app_descriptions_language_short_name ON portal.app_descriptions USING btree (language_short_name);


--
-- Name: ix_app_detail_images_app_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_app_detail_images_app_id ON portal.app_detail_images USING btree (app_id);


--
-- Name: ix_app_languages_language_short_name; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_app_languages_language_short_name ON portal.app_languages USING btree (language_short_name);


--
-- Name: ix_apps_app_status_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_apps_app_status_id ON portal.apps USING btree (app_status_id);


--
-- Name: ix_apps_provider_company_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_apps_provider_company_id ON portal.apps USING btree (provider_company_id);


--
-- Name: ix_companies_address_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_companies_address_id ON portal.companies USING btree (address_id);


--
-- Name: ix_companies_company_status_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_companies_company_status_id ON portal.companies USING btree (company_status_id);


--
-- Name: ix_company_applications_application_status_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_applications_application_status_id ON portal.company_applications USING btree (application_status_id);


--
-- Name: ix_company_applications_company_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_applications_company_id ON portal.company_applications USING btree (company_id);


--
-- Name: ix_company_assigned_apps_app_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_assigned_apps_app_id ON portal.company_assigned_apps USING btree (app_id);


--
-- Name: ix_company_assigned_roles_company_role_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_assigned_roles_company_role_id ON portal.company_assigned_roles USING btree (company_role_id);


--
-- Name: ix_company_assigned_use_cases_use_case_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_assigned_use_cases_use_case_id ON portal.company_assigned_use_cases USING btree (use_case_id);


--
-- Name: ix_company_identity_provider_identity_provider_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_identity_provider_identity_provider_id ON portal.company_identity_provider USING btree (identity_provider_id);


--
-- Name: ix_company_role_descriptions_language_short_name; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_role_descriptions_language_short_name ON portal.company_role_descriptions USING btree (language_short_name);


--
-- Name: ix_company_user_assigned_app_favourites_app_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_user_assigned_app_favourites_app_id ON portal.company_user_assigned_app_favourites USING btree (app_id);


--
-- Name: ix_company_user_assigned_roles_user_role_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_user_assigned_roles_user_role_id ON portal.company_user_assigned_roles USING btree (user_role_id);


--
-- Name: ix_company_users_company_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_users_company_id ON portal.company_users USING btree (company_id);


--
-- Name: ix_company_users_company_user_status_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_users_company_user_status_id ON portal.company_users USING btree (company_user_status_id);


--
-- Name: ix_consents_agreement_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_consents_agreement_id ON portal.consents USING btree (agreement_id);


--
-- Name: ix_consents_company_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_consents_company_id ON portal.consents USING btree (company_id);


--
-- Name: ix_consents_company_user_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_consents_company_user_id ON portal.consents USING btree (company_user_id);


--
-- Name: ix_consents_consent_status_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_consents_consent_status_id ON portal.consents USING btree (consent_status_id);


--
-- Name: ix_consents_document_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_consents_document_id ON portal.consents USING btree (document_id);


--
-- Name: ix_documents_company_user_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_documents_company_user_id ON portal.documents USING btree (company_user_id);


--
-- Name: ix_documents_document_type_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_documents_document_type_id ON portal.documents USING btree (document_type_id);


--
-- Name: ix_iam_clients_client_client_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE UNIQUE INDEX ix_iam_clients_client_client_id ON portal.iam_clients USING btree (client_client_id);


--
-- Name: ix_iam_identity_providers_identity_provider_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE UNIQUE INDEX ix_iam_identity_providers_identity_provider_id ON portal.iam_identity_providers USING btree (identity_provider_id);


--
-- Name: ix_iam_users_company_user_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE UNIQUE INDEX ix_iam_users_company_user_id ON portal.iam_users USING btree (company_user_id);


--
-- Name: ix_identity_providers_identity_provider_category_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_identity_providers_identity_provider_category_id ON portal.identity_providers USING btree (identity_provider_category_id);


--
-- Name: ix_invitations_company_application_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_invitations_company_application_id ON portal.invitations USING btree (company_application_id);


--
-- Name: ix_invitations_company_user_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_invitations_company_user_id ON portal.invitations USING btree (company_user_id);


--
-- Name: ix_invitations_invitation_status_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_invitations_invitation_status_id ON portal.invitations USING btree (invitation_status_id);


--
-- Name: ix_user_role_descriptions_language_short_name; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_user_role_descriptions_language_short_name ON portal.user_role_descriptions USING btree (language_short_name);


--
-- Name: ix_user_roles_iam_client_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_user_roles_iam_client_id ON portal.user_roles USING btree (iam_client_id);


--
-- Name: company_user_assigned_roles fk_0c9rjjf9gm3l0n6reb4o0f1s; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_user_assigned_roles
    ADD CONSTRAINT fk_0c9rjjf9gm3l0n6reb4o0f1s FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id);


--
-- Name: consents fk_36j22f34lgi2444n4tynxamh; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.consents
    ADD CONSTRAINT fk_36j22f34lgi2444n4tynxamh FOREIGN KEY (document_id) REFERENCES portal.documents(id);


--
-- Name: consents fk_39a5cbiv35v59ysgfon5oole; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.consents
    ADD CONSTRAINT fk_39a5cbiv35v59ysgfon5oole FOREIGN KEY (agreement_id) REFERENCES portal.agreements(id);


--
-- Name: app_assigned_licenses fk_3of613iyw1jx8gcj5i46jc1h; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_assigned_licenses
    ADD CONSTRAINT fk_3of613iyw1jx8gcj5i46jc1h FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: company_applications fk_3prv5i3o84vwvh7v0hh3sav7; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_applications
    ADD CONSTRAINT fk_3prv5i3o84vwvh7v0hh3sav7 FOREIGN KEY (company_id) REFERENCES portal.companies(id);


--
-- Name: company_assigned_roles fk_4db4hgj3yvqlkn9h6q8m4e0j; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_assigned_roles
    ADD CONSTRAINT fk_4db4hgj3yvqlkn9h6q8m4e0j FOREIGN KEY (company_id) REFERENCES portal.companies(id);


--
-- Name: app_assigned_clients fk_4m022ek8gffepnqlnuxwyxp8; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_assigned_clients
    ADD CONSTRAINT fk_4m022ek8gffepnqlnuxwyxp8 FOREIGN KEY (iam_client_id) REFERENCES portal.iam_clients(id) ON DELETE CASCADE;


--
-- Name: apps fk_68a9joedhyf43smfx2xc4rgm; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.apps
    ADD CONSTRAINT fk_68a9joedhyf43smfx2xc4rgm FOREIGN KEY (provider_company_id) REFERENCES portal.companies(id);


--
-- Name: addresses fk_6jg6itw07d2qww62deuyk0kh; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.addresses
    ADD CONSTRAINT fk_6jg6itw07d2qww62deuyk0kh FOREIGN KEY (country_alpha2code) REFERENCES portal.countries(alpha2code) ON DELETE CASCADE;


--
-- Name: iam_identity_providers fk_9balkda89j2498dkj2lkjd9s3; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.iam_identity_providers
    ADD CONSTRAINT fk_9balkda89j2498dkj2lkjd9s3 FOREIGN KEY (identity_provider_id) REFERENCES portal.identity_providers(id);


--
-- Name: invitations fk_9tgenb7p09hr5c24haxjw259; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.invitations
    ADD CONSTRAINT fk_9tgenb7p09hr5c24haxjw259 FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id);


--
-- Name: consents fk_aiodhuwehw8wee20adskdfo2; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.consents
    ADD CONSTRAINT fk_aiodhuwehw8wee20adskdfo2 FOREIGN KEY (consent_status_id) REFERENCES portal.consent_status(consent_status_id);


--
-- Name: company_applications fk_akuwiehfiadf8928fhefhuda; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_applications
    ADD CONSTRAINT fk_akuwiehfiadf8928fhefhuda FOREIGN KEY (application_status_id) REFERENCES portal.company_application_status(application_status_id) ON DELETE CASCADE;


--
-- Name: consents fk_asqxie2r7yr06cdrw9ifaex8; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.consents
    ADD CONSTRAINT fk_asqxie2r7yr06cdrw9ifaex8 FOREIGN KEY (company_id) REFERENCES portal.companies(id);


--
-- Name: agreement_assigned_document_templates fk_bvrvs5aktrcn4t6565pnj3ur; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreement_assigned_document_templates
    ADD CONSTRAINT fk_bvrvs5aktrcn4t6565pnj3ur FOREIGN KEY (document_template_id) REFERENCES portal.document_templates(id);


--
-- Name: company_user_assigned_roles fk_bw1yhel67uhrxfk7mevovq5p; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_user_assigned_roles
    ADD CONSTRAINT fk_bw1yhel67uhrxfk7mevovq5p FOREIGN KEY (user_role_id) REFERENCES portal.user_roles(id);


--
-- Name: consents fk_cnrtafckouq96m0fw2qtpwbs; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.consents
    ADD CONSTRAINT fk_cnrtafckouq96m0fw2qtpwbs FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id);


--
-- Name: company_role_descriptions fk_company_role_descriptions_company_roles_company_role_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_role_descriptions
    ADD CONSTRAINT fk_company_role_descriptions_company_roles_company_role_id FOREIGN KEY (company_role_id) REFERENCES portal.company_roles(company_role_id) ON DELETE CASCADE;


--
-- Name: company_role_descriptions fk_company_role_descriptions_languages_language_short_name; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_role_descriptions
    ADD CONSTRAINT fk_company_role_descriptions_languages_language_short_name FOREIGN KEY (language_short_name) REFERENCES portal.languages(short_name) ON DELETE CASCADE;


--
-- Name: company_users fk_company_users_company_user_status_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_users
    ADD CONSTRAINT fk_company_users_company_user_status_id FOREIGN KEY (company_user_status_id) REFERENCES portal.company_user_status(company_user_status_id) ON DELETE CASCADE;


--
-- Name: invitations fk_dlrst4ju9d0wcgkh4w1nnoj3; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.invitations
    ADD CONSTRAINT fk_dlrst4ju9d0wcgkh4w1nnoj3 FOREIGN KEY (company_application_id) REFERENCES portal.company_applications(id) ON DELETE CASCADE;


--
-- Name: company_user_assigned_app_favourites fk_eip97mygnbglivrtmkagesjh; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_user_assigned_app_favourites
    ADD CONSTRAINT fk_eip97mygnbglivrtmkagesjh FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: agreement_assigned_document_templates fk_fvcwoptsuer9p23m055osose; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreement_assigned_document_templates
    ADD CONSTRAINT fk_fvcwoptsuer9p23m055osose FOREIGN KEY (agreement_id) REFERENCES portal.agreements(id);


--
-- Name: company_identity_provider fk_haad983jkald89wlkejidk234; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_identity_provider
    ADD CONSTRAINT fk_haad983jkald89wlkejidk234 FOREIGN KEY (company_id) REFERENCES portal.companies(id);


--
-- Name: iam_users fk_iweorqwaeilskjeijekkalwo; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.iam_users
    ADD CONSTRAINT fk_iweorqwaeilskjeijekkalwo FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id);


--
-- Name: identity_providers fk_iwohgwi9342adf9asdnfuie28; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.identity_providers
    ADD CONSTRAINT fk_iwohgwi9342adf9asdnfuie28 FOREIGN KEY (identity_provider_category_id) REFERENCES portal.identity_provider_categories(identity_provider_category_id);


--
-- Name: company_identity_provider fk_iwzehadf8whjd8asjdfuwefhs; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_identity_provider
    ADD CONSTRAINT fk_iwzehadf8whjd8asjdfuwefhs FOREIGN KEY (identity_provider_id) REFERENCES portal.identity_providers(id);


--
-- Name: company_assigned_apps fk_k1dqlv81463yes0k8f2giyaf; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_assigned_apps
    ADD CONSTRAINT fk_k1dqlv81463yes0k8f2giyaf FOREIGN KEY (company_id) REFERENCES portal.companies(id);


--
-- Name: company_users fk_ku01366dbcqk8h32lh8k5sx1; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_users
    ADD CONSTRAINT fk_ku01366dbcqk8h32lh8k5sx1 FOREIGN KEY (company_id) REFERENCES portal.companies(id);


--
-- Name: agreement_assigned_company_roles fk_ljol11mdo76f4kv7fwqn1qc6; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreement_assigned_company_roles
    ADD CONSTRAINT fk_ljol11mdo76f4kv7fwqn1qc6 FOREIGN KEY (agreement_id) REFERENCES portal.agreements(id);


--
-- Name: company_assigned_use_cases fk_m5eyaohrl0g9ju52byxsouqk; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_assigned_use_cases
    ADD CONSTRAINT fk_m5eyaohrl0g9ju52byxsouqk FOREIGN KEY (use_case_id) REFERENCES portal.use_cases(id);


--
-- Name: app_assigned_licenses fk_mes2xm3i1wotryfc88be4dkf; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_assigned_licenses
    ADD CONSTRAINT fk_mes2xm3i1wotryfc88be4dkf FOREIGN KEY (app_license_id) REFERENCES portal.app_licenses(id);


--
-- Name: company_assigned_roles fk_my2p7jlqrjf0tq1f8rhk0i0a; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_assigned_roles
    ADD CONSTRAINT fk_my2p7jlqrjf0tq1f8rhk0i0a FOREIGN KEY (company_role_id) REFERENCES portal.company_roles(company_role_id);


--
-- Name: agreements fk_n4nnf5bn8i3i9ijrf7kchfvc; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreements
    ADD CONSTRAINT fk_n4nnf5bn8i3i9ijrf7kchfvc FOREIGN KEY (issuer_company_id) REFERENCES portal.companies(id);


--
-- Name: app_assigned_clients fk_oayyvy590ngh5705yspep0up; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_assigned_clients
    ADD CONSTRAINT fk_oayyvy590ngh5705yspep0up FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: app_languages fk_oayyvy590ngh5705yspep101; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_languages
    ADD CONSTRAINT fk_oayyvy590ngh5705yspep101 FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: app_languages fk_oayyvy590ngh5705yspep102; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_languages
    ADD CONSTRAINT fk_oayyvy590ngh5705yspep102 FOREIGN KEY (language_short_name) REFERENCES portal.languages(short_name);


--
-- Name: app_detail_images fk_oayyvy590ngh5705yspep12a; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_detail_images
    ADD CONSTRAINT fk_oayyvy590ngh5705yspep12a FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: agreements fk_ooy9ydkah696jxh4lq7pn0xe; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreements
    ADD CONSTRAINT fk_ooy9ydkah696jxh4lq7pn0xe FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: apps fk_owihadhfweilwefhaf111aaa; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.apps
    ADD CONSTRAINT fk_owihadhfweilwefhaf111aaa FOREIGN KEY (app_status_id) REFERENCES portal.app_status(app_status_id) ON DELETE CASCADE;


--
-- Name: companies fk_owihadhfweilwefhaf682khj; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.companies
    ADD CONSTRAINT fk_owihadhfweilwefhaf682khj FOREIGN KEY (company_status_id) REFERENCES portal.company_status(company_status_id) ON DELETE CASCADE;


--
-- Name: agreements fk_owqie84qkle78dasifljiwer; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreements
    ADD CONSTRAINT fk_owqie84qkle78dasifljiwer FOREIGN KEY (agreement_category_id) REFERENCES portal.agreement_categories(agreement_category_id);


--
-- Name: app_descriptions fk_qamy6j7s3klebrf2s69v9k0i; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_descriptions
    ADD CONSTRAINT fk_qamy6j7s3klebrf2s69v9k0i FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: agreement_assigned_company_roles fk_qh1hby9qcrr3gmy1cvi7nd3h; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreement_assigned_company_roles
    ADD CONSTRAINT fk_qh1hby9qcrr3gmy1cvi7nd3h FOREIGN KEY (company_role_id) REFERENCES portal.company_roles(company_role_id);


--
-- Name: app_assigned_use_cases fk_qi320sp8lxy7drw6kt4vheka; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_assigned_use_cases
    ADD CONSTRAINT fk_qi320sp8lxy7drw6kt4vheka FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: app_tags fk_qi320sp8lxy7drw6kt4vheka; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_tags
    ADD CONSTRAINT fk_qi320sp8lxy7drw6kt4vheka FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: app_assigned_use_cases fk_sjyfs49ma0kxaqfknjbaye0i; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_assigned_use_cases
    ADD CONSTRAINT fk_sjyfs49ma0kxaqfknjbaye0i FOREIGN KEY (use_case_id) REFERENCES portal.use_cases(id);


--
-- Name: company_assigned_apps fk_t365qpfvehuq40om25dyrnn5; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_assigned_apps
    ADD CONSTRAINT fk_t365qpfvehuq40om25dyrnn5 FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: company_assigned_use_cases fk_u65fkdrxnbkp8n0s7mate01v; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_assigned_use_cases
    ADD CONSTRAINT fk_u65fkdrxnbkp8n0s7mate01v FOREIGN KEY (company_id) REFERENCES portal.companies(id);


--
-- Name: user_role_descriptions fk_user_role_descriptions_languages_language_short_name; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.user_role_descriptions
    ADD CONSTRAINT fk_user_role_descriptions_languages_language_short_name FOREIGN KEY (language_short_name) REFERENCES portal.languages(short_name) ON DELETE CASCADE;


--
-- Name: user_role_descriptions fk_user_role_descriptions_user_roles_user_role_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.user_role_descriptions
    ADD CONSTRAINT fk_user_role_descriptions_user_roles_user_role_id FOREIGN KEY (user_role_id) REFERENCES portal.user_roles(id) ON DELETE CASCADE;


--
-- Name: user_roles fk_user_roles_iam_clients_iam_client_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.user_roles
    ADD CONSTRAINT fk_user_roles_iam_clients_iam_client_id FOREIGN KEY (iam_client_id) REFERENCES portal.iam_clients(id) ON DELETE CASCADE;


--
-- Name: app_descriptions fk_vrom2pjij9x6stgovhaqkfxf; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_descriptions
    ADD CONSTRAINT fk_vrom2pjij9x6stgovhaqkfxf FOREIGN KEY (language_short_name) REFERENCES portal.languages(short_name);


--
-- Name: companies fk_w70yf6urddd0ky7ev90okenf; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.companies
    ADD CONSTRAINT fk_w70yf6urddd0ky7ev90okenf FOREIGN KEY (address_id) REFERENCES portal.addresses(id);


--
-- Name: agreements fk_whby66dika71srejhja6g75a; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreements
    ADD CONSTRAINT fk_whby66dika71srejhja6g75a FOREIGN KEY (use_case_id) REFERENCES portal.use_cases(id);


--
-- Name: invitations fk_woihaodhawoeir72alfidosd; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.invitations
    ADD CONSTRAINT fk_woihaodhawoeir72alfidosd FOREIGN KEY (invitation_status_id) REFERENCES portal.invitation_status(invitation_status_id);


--
-- Name: company_user_assigned_app_favourites fk_wva553r3xiew3ngbdkvafk85; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_user_assigned_app_favourites
    ADD CONSTRAINT fk_wva553r3xiew3ngbdkvafk85 FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id);


--
-- Name: documents fk_xcgobngn7vk56k8nfkualsvn; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.documents
    ADD CONSTRAINT fk_xcgobngn7vk56k8nfkualsvn FOREIGN KEY (document_type_id) REFERENCES portal.document_types(document_type_id);


--
-- Name: documents fk_xcgobngn7vk56k8nfkuaysvn; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.documents
    ADD CONSTRAINT fk_xcgobngn7vk56k8nfkuaysvn FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id);


--
-- PostgreSQL database dump complete
--

