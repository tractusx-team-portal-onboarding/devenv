--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
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
    zipcode character varying(12),
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
    id integer NOT NULL,
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
-- Name: app_statuses; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.app_statuses (
    id integer NOT NULL,
    label character varying(255) NOT NULL
);


--
-- Name: app_subscription_statuses; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.app_subscription_statuses (
    id integer NOT NULL,
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
    business_partner_number character varying(20),
    tax_id character varying(20),
    name character varying(255) NOT NULL,
    shortname character varying(255),
    company_status_id integer NOT NULL,
    address_id uuid
);


--
-- Name: company_application_statuses; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_application_statuses (
    id integer NOT NULL,
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
    app_id uuid NOT NULL,
    app_subscription_status_id integer DEFAULT 1 NOT NULL
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
-- Name: company_identity_providers; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_identity_providers (
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
    id integer NOT NULL,
    label character varying(255) NOT NULL
);


--
-- Name: company_service_account_assigned_roles; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_service_account_assigned_roles (
    company_service_account_id uuid NOT NULL,
    user_role_id uuid NOT NULL
);


--
-- Name: company_service_account_statuses; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_service_account_statuses (
    id integer NOT NULL,
    label character varying(255) NOT NULL
);


--
-- Name: company_service_accounts; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_service_accounts (
    id uuid NOT NULL,
    date_created timestamp with time zone NOT NULL,
    company_id uuid NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    company_service_account_status_id integer NOT NULL
);


--
-- Name: company_statuses; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_statuses (
    id integer NOT NULL,
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
-- Name: company_user_assigned_business_partners; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_user_assigned_business_partners (
    company_user_id uuid NOT NULL,
    business_partner_number character varying(20) NOT NULL
);


--
-- Name: company_user_assigned_roles; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_user_assigned_roles (
    company_user_id uuid NOT NULL,
    user_role_id uuid NOT NULL
);


--
-- Name: company_user_statuses; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.company_user_statuses (
    id integer NOT NULL,
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
-- Name: connector_statuses; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.connector_statuses (
    id integer NOT NULL,
    label character varying(255) NOT NULL
);


--
-- Name: connector_types; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.connector_types (
    id integer NOT NULL,
    label character varying(255) NOT NULL
);


--
-- Name: connectors; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.connectors (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    connector_url character varying(255) NOT NULL,
    type_id integer NOT NULL,
    status_id integer NOT NULL,
    provider_id uuid NOT NULL,
    host_id uuid,
    location_id character(2) NOT NULL
);


--
-- Name: consent_statuses; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.consent_statuses (
    id integer NOT NULL,
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
-- Name: document_status; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.document_status (
    id integer NOT NULL,
    label character varying(255) NOT NULL
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
    id integer NOT NULL,
    label character varying(255) NOT NULL
);


--
-- Name: documents; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.documents (
    id uuid NOT NULL,
    date_created timestamp with time zone NOT NULL,
    document_name character varying(255) NOT NULL,
    document_type_id integer,
    company_user_id uuid,
    document_hash bytea NOT NULL,
    document_content bytea NOT NULL,
    document_status_id integer NOT NULL
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
-- Name: iam_service_accounts; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.iam_service_accounts (
    client_id character varying(36) NOT NULL,
    client_client_id character varying(255) NOT NULL,
    user_entity_id character varying(36) NOT NULL,
    company_service_account_id uuid NOT NULL
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
    id integer NOT NULL,
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
-- Name: invitation_statuses; Type: TABLE; Schema: portal; Owner: -
--

CREATE TABLE portal.invitation_statuses (
    id integer NOT NULL,
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
-- Name: addresses pk_addresses; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.addresses
    ADD CONSTRAINT pk_addresses PRIMARY KEY (id);


--
-- Name: agreement_assigned_company_roles pk_agreement_assigned_company_roles; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreement_assigned_company_roles
    ADD CONSTRAINT pk_agreement_assigned_company_roles PRIMARY KEY (agreement_id, company_role_id);


--
-- Name: agreement_assigned_document_templates pk_agreement_assigned_document_templates; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreement_assigned_document_templates
    ADD CONSTRAINT pk_agreement_assigned_document_templates PRIMARY KEY (agreement_id, document_template_id);


--
-- Name: agreement_categories pk_agreement_categories; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreement_categories
    ADD CONSTRAINT pk_agreement_categories PRIMARY KEY (id);


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
-- Name: app_descriptions pk_app_descriptions; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_descriptions
    ADD CONSTRAINT pk_app_descriptions PRIMARY KEY (app_id, language_short_name);


--
-- Name: app_detail_images pk_app_detail_images; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_detail_images
    ADD CONSTRAINT pk_app_detail_images PRIMARY KEY (id);


--
-- Name: app_languages pk_app_languages; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_languages
    ADD CONSTRAINT pk_app_languages PRIMARY KEY (app_id, language_short_name);


--
-- Name: app_licenses pk_app_licenses; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_licenses
    ADD CONSTRAINT pk_app_licenses PRIMARY KEY (id);


--
-- Name: app_statuses pk_app_statuses; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_statuses
    ADD CONSTRAINT pk_app_statuses PRIMARY KEY (id);


--
-- Name: app_subscription_statuses pk_app_subscription_statuses; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_subscription_statuses
    ADD CONSTRAINT pk_app_subscription_statuses PRIMARY KEY (id);


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
-- Name: companies pk_companies; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.companies
    ADD CONSTRAINT pk_companies PRIMARY KEY (id);


--
-- Name: company_application_statuses pk_company_application_statuses; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_application_statuses
    ADD CONSTRAINT pk_company_application_statuses PRIMARY KEY (id);


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
-- Name: company_assigned_use_cases pk_company_assigned_use_cases; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_assigned_use_cases
    ADD CONSTRAINT pk_company_assigned_use_cases PRIMARY KEY (company_id, use_case_id);


--
-- Name: company_identity_providers pk_company_identity_providers; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_identity_providers
    ADD CONSTRAINT pk_company_identity_providers PRIMARY KEY (company_id, identity_provider_id);


--
-- Name: company_role_descriptions pk_company_role_descriptions; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_role_descriptions
    ADD CONSTRAINT pk_company_role_descriptions PRIMARY KEY (company_role_id, language_short_name);


--
-- Name: company_roles pk_company_roles; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_roles
    ADD CONSTRAINT pk_company_roles PRIMARY KEY (id);


--
-- Name: company_service_account_assigned_roles pk_company_service_account_assigned_roles; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_service_account_assigned_roles
    ADD CONSTRAINT pk_company_service_account_assigned_roles PRIMARY KEY (company_service_account_id, user_role_id);


--
-- Name: company_service_account_statuses pk_company_service_account_statuses; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_service_account_statuses
    ADD CONSTRAINT pk_company_service_account_statuses PRIMARY KEY (id);


--
-- Name: company_service_accounts pk_company_service_accounts; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_service_accounts
    ADD CONSTRAINT pk_company_service_accounts PRIMARY KEY (id);


--
-- Name: company_statuses pk_company_statuses; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_statuses
    ADD CONSTRAINT pk_company_statuses PRIMARY KEY (id);


--
-- Name: company_user_assigned_app_favourites pk_company_user_assigned_app_favourites; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_user_assigned_app_favourites
    ADD CONSTRAINT pk_company_user_assigned_app_favourites PRIMARY KEY (company_user_id, app_id);


--
-- Name: company_user_assigned_business_partners pk_company_user_assigned_business_partners; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_user_assigned_business_partners
    ADD CONSTRAINT pk_company_user_assigned_business_partners PRIMARY KEY (company_user_id, business_partner_number);


--
-- Name: company_user_assigned_roles pk_company_user_assigned_roles; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_user_assigned_roles
    ADD CONSTRAINT pk_company_user_assigned_roles PRIMARY KEY (company_user_id, user_role_id);


--
-- Name: company_user_statuses pk_company_user_statuses; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_user_statuses
    ADD CONSTRAINT pk_company_user_statuses PRIMARY KEY (id);


--
-- Name: company_users pk_company_users; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_users
    ADD CONSTRAINT pk_company_users PRIMARY KEY (id);


--
-- Name: connector_statuses pk_connector_statuses; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.connector_statuses
    ADD CONSTRAINT pk_connector_statuses PRIMARY KEY (id);


--
-- Name: connector_types pk_connector_types; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.connector_types
    ADD CONSTRAINT pk_connector_types PRIMARY KEY (id);


--
-- Name: connectors pk_connectors; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.connectors
    ADD CONSTRAINT pk_connectors PRIMARY KEY (id);


--
-- Name: consent_statuses pk_consent_statuses; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.consent_statuses
    ADD CONSTRAINT pk_consent_statuses PRIMARY KEY (id);


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
-- Name: document_status pk_document_status; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.document_status
    ADD CONSTRAINT pk_document_status PRIMARY KEY (id);


--
-- Name: document_templates pk_document_templates; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.document_templates
    ADD CONSTRAINT pk_document_templates PRIMARY KEY (id);


--
-- Name: document_types pk_document_types; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.document_types
    ADD CONSTRAINT pk_document_types PRIMARY KEY (id);


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
-- Name: iam_service_accounts pk_iam_service_accounts; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.iam_service_accounts
    ADD CONSTRAINT pk_iam_service_accounts PRIMARY KEY (client_id);


--
-- Name: iam_users pk_iam_users; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.iam_users
    ADD CONSTRAINT pk_iam_users PRIMARY KEY (user_entity_id);


--
-- Name: identity_provider_categories pk_identity_provider_categories; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.identity_provider_categories
    ADD CONSTRAINT pk_identity_provider_categories PRIMARY KEY (id);


--
-- Name: identity_providers pk_identity_providers; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.identity_providers
    ADD CONSTRAINT pk_identity_providers PRIMARY KEY (id);


--
-- Name: invitation_statuses pk_invitation_statuses; Type: CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.invitation_statuses
    ADD CONSTRAINT pk_invitation_statuses PRIMARY KEY (id);


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
-- Name: ix_company_assigned_apps_app_subscription_status_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_assigned_apps_app_subscription_status_id ON portal.company_assigned_apps USING btree (app_subscription_status_id);


--
-- Name: ix_company_assigned_roles_company_role_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_assigned_roles_company_role_id ON portal.company_assigned_roles USING btree (company_role_id);


--
-- Name: ix_company_assigned_use_cases_use_case_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_assigned_use_cases_use_case_id ON portal.company_assigned_use_cases USING btree (use_case_id);


--
-- Name: ix_company_identity_providers_identity_provider_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_identity_providers_identity_provider_id ON portal.company_identity_providers USING btree (identity_provider_id);


--
-- Name: ix_company_role_descriptions_language_short_name; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_role_descriptions_language_short_name ON portal.company_role_descriptions USING btree (language_short_name);


--
-- Name: ix_company_service_account_assigned_roles_user_role_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_service_account_assigned_roles_user_role_id ON portal.company_service_account_assigned_roles USING btree (user_role_id);


--
-- Name: ix_company_service_accounts_company_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_service_accounts_company_id ON portal.company_service_accounts USING btree (company_id);


--
-- Name: ix_company_service_accounts_company_service_account_status_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_company_service_accounts_company_service_account_status_id ON portal.company_service_accounts USING btree (company_service_account_status_id);


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
-- Name: ix_connectors_host_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_connectors_host_id ON portal.connectors USING btree (host_id);


--
-- Name: ix_connectors_location_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_connectors_location_id ON portal.connectors USING btree (location_id);


--
-- Name: ix_connectors_provider_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_connectors_provider_id ON portal.connectors USING btree (provider_id);


--
-- Name: ix_connectors_status_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_connectors_status_id ON portal.connectors USING btree (status_id);


--
-- Name: ix_connectors_type_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_connectors_type_id ON portal.connectors USING btree (type_id);


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
-- Name: ix_documents_document_status_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE INDEX ix_documents_document_status_id ON portal.documents USING btree (document_status_id);


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
-- Name: ix_iam_service_accounts_client_client_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE UNIQUE INDEX ix_iam_service_accounts_client_client_id ON portal.iam_service_accounts USING btree (client_client_id);


--
-- Name: ix_iam_service_accounts_company_service_account_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE UNIQUE INDEX ix_iam_service_accounts_company_service_account_id ON portal.iam_service_accounts USING btree (company_service_account_id);


--
-- Name: ix_iam_service_accounts_user_entity_id; Type: INDEX; Schema: portal; Owner: -
--

CREATE UNIQUE INDEX ix_iam_service_accounts_user_entity_id ON portal.iam_service_accounts USING btree (user_entity_id);


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
-- Name: addresses fk_addresses_countries_country_temp_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.addresses
    ADD CONSTRAINT fk_addresses_countries_country_temp_id FOREIGN KEY (country_alpha2code) REFERENCES portal.countries(alpha2code) ON DELETE CASCADE;


--
-- Name: agreement_assigned_company_roles fk_agreement_assigned_company_roles_agreements_agreement_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreement_assigned_company_roles
    ADD CONSTRAINT fk_agreement_assigned_company_roles_agreements_agreement_id FOREIGN KEY (agreement_id) REFERENCES portal.agreements(id);


--
-- Name: agreement_assigned_company_roles fk_agreement_assigned_company_roles_company_roles_company_role; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreement_assigned_company_roles
    ADD CONSTRAINT fk_agreement_assigned_company_roles_company_roles_company_role FOREIGN KEY (company_role_id) REFERENCES portal.company_roles(id);


--
-- Name: agreement_assigned_document_templates fk_agreement_assigned_document_templates_agreements_agreement_; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreement_assigned_document_templates
    ADD CONSTRAINT fk_agreement_assigned_document_templates_agreements_agreement_ FOREIGN KEY (agreement_id) REFERENCES portal.agreements(id);


--
-- Name: agreement_assigned_document_templates fk_agreement_assigned_document_templates_document_templates_do; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreement_assigned_document_templates
    ADD CONSTRAINT fk_agreement_assigned_document_templates_document_templates_do FOREIGN KEY (document_template_id) REFERENCES portal.document_templates(id);


--
-- Name: agreements fk_agreements_agreement_categories_agreement_category_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreements
    ADD CONSTRAINT fk_agreements_agreement_categories_agreement_category_id FOREIGN KEY (agreement_category_id) REFERENCES portal.agreement_categories(id);


--
-- Name: agreements fk_agreements_apps_app_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreements
    ADD CONSTRAINT fk_agreements_apps_app_id FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: agreements fk_agreements_companies_issuer_company_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreements
    ADD CONSTRAINT fk_agreements_companies_issuer_company_id FOREIGN KEY (issuer_company_id) REFERENCES portal.companies(id);


--
-- Name: agreements fk_agreements_use_cases_use_case_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.agreements
    ADD CONSTRAINT fk_agreements_use_cases_use_case_id FOREIGN KEY (use_case_id) REFERENCES portal.use_cases(id);


--
-- Name: app_assigned_clients fk_app_assigned_clients_apps_app_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_assigned_clients
    ADD CONSTRAINT fk_app_assigned_clients_apps_app_id FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: app_assigned_clients fk_app_assigned_clients_iam_clients_iam_client_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_assigned_clients
    ADD CONSTRAINT fk_app_assigned_clients_iam_clients_iam_client_id FOREIGN KEY (iam_client_id) REFERENCES portal.iam_clients(id) ON DELETE CASCADE;


--
-- Name: app_assigned_licenses fk_app_assigned_licenses_app_licenses_app_license_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_assigned_licenses
    ADD CONSTRAINT fk_app_assigned_licenses_app_licenses_app_license_id FOREIGN KEY (app_license_id) REFERENCES portal.app_licenses(id);


--
-- Name: app_assigned_licenses fk_app_assigned_licenses_apps_app_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_assigned_licenses
    ADD CONSTRAINT fk_app_assigned_licenses_apps_app_id FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: app_assigned_use_cases fk_app_assigned_use_cases_apps_app_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_assigned_use_cases
    ADD CONSTRAINT fk_app_assigned_use_cases_apps_app_id FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: app_assigned_use_cases fk_app_assigned_use_cases_use_cases_use_case_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_assigned_use_cases
    ADD CONSTRAINT fk_app_assigned_use_cases_use_cases_use_case_id FOREIGN KEY (use_case_id) REFERENCES portal.use_cases(id);


--
-- Name: app_descriptions fk_app_descriptions_apps_app_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_descriptions
    ADD CONSTRAINT fk_app_descriptions_apps_app_id FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: app_descriptions fk_app_descriptions_languages_language_temp_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_descriptions
    ADD CONSTRAINT fk_app_descriptions_languages_language_temp_id FOREIGN KEY (language_short_name) REFERENCES portal.languages(short_name);


--
-- Name: app_detail_images fk_app_detail_images_apps_app_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_detail_images
    ADD CONSTRAINT fk_app_detail_images_apps_app_id FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: app_languages fk_app_languages_apps_app_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_languages
    ADD CONSTRAINT fk_app_languages_apps_app_id FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: app_languages fk_app_languages_languages_language_temp_id1; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_languages
    ADD CONSTRAINT fk_app_languages_languages_language_temp_id1 FOREIGN KEY (language_short_name) REFERENCES portal.languages(short_name);


--
-- Name: app_tags fk_app_tags_apps_app_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.app_tags
    ADD CONSTRAINT fk_app_tags_apps_app_id FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: apps fk_apps_app_statuses_app_status_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.apps
    ADD CONSTRAINT fk_apps_app_statuses_app_status_id FOREIGN KEY (app_status_id) REFERENCES portal.app_statuses(id) ON DELETE CASCADE;


--
-- Name: apps fk_apps_companies_provider_company_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.apps
    ADD CONSTRAINT fk_apps_companies_provider_company_id FOREIGN KEY (provider_company_id) REFERENCES portal.companies(id);


--
-- Name: companies fk_companies_addresses_address_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.companies
    ADD CONSTRAINT fk_companies_addresses_address_id FOREIGN KEY (address_id) REFERENCES portal.addresses(id);


--
-- Name: companies fk_companies_company_statuses_company_status_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.companies
    ADD CONSTRAINT fk_companies_company_statuses_company_status_id FOREIGN KEY (company_status_id) REFERENCES portal.company_statuses(id) ON DELETE CASCADE;


--
-- Name: company_applications fk_company_applications_companies_company_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_applications
    ADD CONSTRAINT fk_company_applications_companies_company_id FOREIGN KEY (company_id) REFERENCES portal.companies(id);


--
-- Name: company_applications fk_company_applications_company_application_statuses_applicati; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_applications
    ADD CONSTRAINT fk_company_applications_company_application_statuses_applicati FOREIGN KEY (application_status_id) REFERENCES portal.company_application_statuses(id) ON DELETE CASCADE;


--
-- Name: company_assigned_apps fk_company_assigned_apps_app_subscription_statuses_app_subscri; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_assigned_apps
    ADD CONSTRAINT fk_company_assigned_apps_app_subscription_statuses_app_subscri FOREIGN KEY (app_subscription_status_id) REFERENCES portal.app_subscription_statuses(id);


--
-- Name: company_assigned_apps fk_company_assigned_apps_apps_app_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_assigned_apps
    ADD CONSTRAINT fk_company_assigned_apps_apps_app_id FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: company_assigned_apps fk_company_assigned_apps_companies_company_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_assigned_apps
    ADD CONSTRAINT fk_company_assigned_apps_companies_company_id FOREIGN KEY (company_id) REFERENCES portal.companies(id);


--
-- Name: company_assigned_roles fk_company_assigned_roles_companies_company_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_assigned_roles
    ADD CONSTRAINT fk_company_assigned_roles_companies_company_id FOREIGN KEY (company_id) REFERENCES portal.companies(id);


--
-- Name: company_assigned_roles fk_company_assigned_roles_company_roles_company_role_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_assigned_roles
    ADD CONSTRAINT fk_company_assigned_roles_company_roles_company_role_id FOREIGN KEY (company_role_id) REFERENCES portal.company_roles(id);


--
-- Name: company_assigned_use_cases fk_company_assigned_use_cases_companies_company_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_assigned_use_cases
    ADD CONSTRAINT fk_company_assigned_use_cases_companies_company_id FOREIGN KEY (company_id) REFERENCES portal.companies(id);


--
-- Name: company_assigned_use_cases fk_company_assigned_use_cases_use_cases_use_case_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_assigned_use_cases
    ADD CONSTRAINT fk_company_assigned_use_cases_use_cases_use_case_id FOREIGN KEY (use_case_id) REFERENCES portal.use_cases(id);


--
-- Name: company_identity_providers fk_company_identity_providers_companies_company_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_identity_providers
    ADD CONSTRAINT fk_company_identity_providers_companies_company_id FOREIGN KEY (company_id) REFERENCES portal.companies(id);


--
-- Name: company_identity_providers fk_company_identity_providers_identity_providers_identity_prov; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_identity_providers
    ADD CONSTRAINT fk_company_identity_providers_identity_providers_identity_prov FOREIGN KEY (identity_provider_id) REFERENCES portal.identity_providers(id);


--
-- Name: company_role_descriptions fk_company_role_descriptions_company_roles_company_role_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_role_descriptions
    ADD CONSTRAINT fk_company_role_descriptions_company_roles_company_role_id FOREIGN KEY (company_role_id) REFERENCES portal.company_roles(id) ON DELETE CASCADE;


--
-- Name: company_role_descriptions fk_company_role_descriptions_languages_language_temp_id2; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_role_descriptions
    ADD CONSTRAINT fk_company_role_descriptions_languages_language_temp_id2 FOREIGN KEY (language_short_name) REFERENCES portal.languages(short_name) ON DELETE CASCADE;


--
-- Name: company_service_account_assigned_roles fk_company_service_account_assigned_roles_company_service_acco; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_service_account_assigned_roles
    ADD CONSTRAINT fk_company_service_account_assigned_roles_company_service_acco FOREIGN KEY (company_service_account_id) REFERENCES portal.company_service_accounts(id);


--
-- Name: company_service_account_assigned_roles fk_company_service_account_assigned_roles_user_roles_user_role; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_service_account_assigned_roles
    ADD CONSTRAINT fk_company_service_account_assigned_roles_user_roles_user_role FOREIGN KEY (user_role_id) REFERENCES portal.user_roles(id);


--
-- Name: company_service_accounts fk_company_service_accounts_companies_company_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_service_accounts
    ADD CONSTRAINT fk_company_service_accounts_companies_company_id FOREIGN KEY (company_id) REFERENCES portal.companies(id);


--
-- Name: company_service_accounts fk_company_service_accounts_company_service_account_statuses_c; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_service_accounts
    ADD CONSTRAINT fk_company_service_accounts_company_service_account_statuses_c FOREIGN KEY (company_service_account_status_id) REFERENCES portal.company_service_account_statuses(id) ON DELETE CASCADE;


--
-- Name: company_user_assigned_app_favourites fk_company_user_assigned_app_favourites_apps_app_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_user_assigned_app_favourites
    ADD CONSTRAINT fk_company_user_assigned_app_favourites_apps_app_id FOREIGN KEY (app_id) REFERENCES portal.apps(id);


--
-- Name: company_user_assigned_app_favourites fk_company_user_assigned_app_favourites_company_users_company_; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_user_assigned_app_favourites
    ADD CONSTRAINT fk_company_user_assigned_app_favourites_company_users_company_ FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id);


--
-- Name: company_user_assigned_business_partners fk_company_user_assigned_business_partners_company_users_compa; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_user_assigned_business_partners
    ADD CONSTRAINT fk_company_user_assigned_business_partners_company_users_compa FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id) ON DELETE CASCADE;


--
-- Name: company_user_assigned_roles fk_company_user_assigned_roles_company_users_company_user_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_user_assigned_roles
    ADD CONSTRAINT fk_company_user_assigned_roles_company_users_company_user_id FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id);


--
-- Name: company_user_assigned_roles fk_company_user_assigned_roles_user_roles_user_role_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_user_assigned_roles
    ADD CONSTRAINT fk_company_user_assigned_roles_user_roles_user_role_id FOREIGN KEY (user_role_id) REFERENCES portal.user_roles(id);


--
-- Name: company_users fk_company_users_companies_company_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_users
    ADD CONSTRAINT fk_company_users_companies_company_id FOREIGN KEY (company_id) REFERENCES portal.companies(id);


--
-- Name: company_users fk_company_users_company_user_statuses_company_user_status_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.company_users
    ADD CONSTRAINT fk_company_users_company_user_statuses_company_user_status_id FOREIGN KEY (company_user_status_id) REFERENCES portal.company_user_statuses(id) ON DELETE CASCADE;


--
-- Name: connectors fk_connectors_companies_host_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.connectors
    ADD CONSTRAINT fk_connectors_companies_host_id FOREIGN KEY (host_id) REFERENCES portal.companies(id);


--
-- Name: connectors fk_connectors_companies_provider_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.connectors
    ADD CONSTRAINT fk_connectors_companies_provider_id FOREIGN KEY (provider_id) REFERENCES portal.companies(id) ON DELETE CASCADE;


--
-- Name: connectors fk_connectors_connector_statuses_status_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.connectors
    ADD CONSTRAINT fk_connectors_connector_statuses_status_id FOREIGN KEY (status_id) REFERENCES portal.connector_statuses(id);


--
-- Name: connectors fk_connectors_connector_types_type_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.connectors
    ADD CONSTRAINT fk_connectors_connector_types_type_id FOREIGN KEY (type_id) REFERENCES portal.connector_types(id);


--
-- Name: connectors fk_connectors_countries_location_temp_id1; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.connectors
    ADD CONSTRAINT fk_connectors_countries_location_temp_id1 FOREIGN KEY (location_id) REFERENCES portal.countries(alpha2code) ON DELETE CASCADE;


--
-- Name: consents fk_consents_agreements_agreement_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.consents
    ADD CONSTRAINT fk_consents_agreements_agreement_id FOREIGN KEY (agreement_id) REFERENCES portal.agreements(id);


--
-- Name: consents fk_consents_companies_company_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.consents
    ADD CONSTRAINT fk_consents_companies_company_id FOREIGN KEY (company_id) REFERENCES portal.companies(id);


--
-- Name: consents fk_consents_company_users_company_user_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.consents
    ADD CONSTRAINT fk_consents_company_users_company_user_id FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id);


--
-- Name: consents fk_consents_consent_statuses_consent_status_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.consents
    ADD CONSTRAINT fk_consents_consent_statuses_consent_status_id FOREIGN KEY (consent_status_id) REFERENCES portal.consent_statuses(id);


--
-- Name: consents fk_consents_documents_document_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.consents
    ADD CONSTRAINT fk_consents_documents_document_id FOREIGN KEY (document_id) REFERENCES portal.documents(id);


--
-- Name: documents fk_documents_company_users_company_user_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.documents
    ADD CONSTRAINT fk_documents_company_users_company_user_id FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id);


--
-- Name: documents fk_documents_document_status_document_status_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.documents
    ADD CONSTRAINT fk_documents_document_status_document_status_id FOREIGN KEY (document_status_id) REFERENCES portal.document_status(id) ON DELETE CASCADE;


--
-- Name: documents fk_documents_document_types_document_type_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.documents
    ADD CONSTRAINT fk_documents_document_types_document_type_id FOREIGN KEY (document_type_id) REFERENCES portal.document_types(id);


--
-- Name: iam_identity_providers fk_iam_identity_providers_identity_providers_identity_provider; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.iam_identity_providers
    ADD CONSTRAINT fk_iam_identity_providers_identity_providers_identity_provider FOREIGN KEY (identity_provider_id) REFERENCES portal.identity_providers(id);


--
-- Name: iam_service_accounts fk_iam_service_accounts_company_service_accounts_company_servi; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.iam_service_accounts
    ADD CONSTRAINT fk_iam_service_accounts_company_service_accounts_company_servi FOREIGN KEY (company_service_account_id) REFERENCES portal.company_service_accounts(id);


--
-- Name: iam_users fk_iam_users_company_users_company_user_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.iam_users
    ADD CONSTRAINT fk_iam_users_company_users_company_user_id FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id);


--
-- Name: identity_providers fk_identity_providers_identity_provider_categories_identity_pr; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.identity_providers
    ADD CONSTRAINT fk_identity_providers_identity_provider_categories_identity_pr FOREIGN KEY (identity_provider_category_id) REFERENCES portal.identity_provider_categories(id);


--
-- Name: invitations fk_invitations_company_applications_company_application_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.invitations
    ADD CONSTRAINT fk_invitations_company_applications_company_application_id FOREIGN KEY (company_application_id) REFERENCES portal.company_applications(id) ON DELETE CASCADE;


--
-- Name: invitations fk_invitations_company_users_company_user_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.invitations
    ADD CONSTRAINT fk_invitations_company_users_company_user_id FOREIGN KEY (company_user_id) REFERENCES portal.company_users(id);


--
-- Name: invitations fk_invitations_invitation_statuses_invitation_status_id; Type: FK CONSTRAINT; Schema: portal; Owner: -
--

ALTER TABLE ONLY portal.invitations
    ADD CONSTRAINT fk_invitations_invitation_statuses_invitation_status_id FOREIGN KEY (invitation_status_id) REFERENCES portal.invitation_statuses(id);


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
-- PostgreSQL database dump complete
--

