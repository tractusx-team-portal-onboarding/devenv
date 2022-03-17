--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

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
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA portal IS 'catenax portal schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.address (
    id bigint NOT NULL,
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


--
-- Name: agreement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.agreement (
    item_category integer NOT NULL,
    id character varying(255) NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    name character varying(255) NOT NULL,
    issuer_companyid character varying(255) NOT NULL,
    app_uuid character varying(255)
);


--
-- Name: agreement_documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.agreement_documents (
    agreement_id character varying(255) NOT NULL,
    documents_id character varying(255) NOT NULL
);


--
-- Name: agreement_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.agreement_roles (
    policy_id character varying(255) NOT NULL,
    roles_companyrole character varying(255) NOT NULL,
    contract_id character varying(255) NOT NULL
);


--
-- Name: app; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app (
    uuid character varying(255) NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    name character varying(255),
    currentversion_uuid character varying(255),
    vendor_companyid character varying(255)
);


--
-- Name: app_agreements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_agreements (
    app_uuid character varying(255) NOT NULL,
    agreements_id character varying(255) NOT NULL
);


--
-- Name: app_description; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_description (
    uuid character varying(255) NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    app character varying(255),
    description_long character varying(4096),
    description_short character varying(255),
    language_short_name character varying(255)
);


--
-- Name: app_license; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_license (
    uuid character varying(255) NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    licensetext character varying(255)
);


--
-- Name: app_licenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_licenses (
    app_uuid character varying(255) NOT NULL,
    licenses_uuid character varying(255) NOT NULL
);


--
-- Name: app_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_roles (
    app_uuid character varying(255) NOT NULL,
    roles_uuid character varying(255) NOT NULL
);


--
-- Name: app_usecases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_usecases (
    app_uuid character varying(255) NOT NULL,
    usecases_name character varying(255) NOT NULL
);


--
-- Name: app_version; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_version (
    uuid character varying(255) NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    app character varying(255),
    version character varying(255)
);


--
-- Name: app_version_description; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.app_version_description (
    appversion_uuid character varying(255) NOT NULL,
    description_uuid character varying(255) NOT NULL
);


--
-- Name: company; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company (
    companyid character varying(255) NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    bpn character varying(20) NOT NULL,
    name character varying(255),
    parent character varying(255),
    shortname character varying(255),
    address_id bigint,
    idp_uuid character varying(255)
);


--
-- Name: company_application; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_application (
    applicationid character varying(255) NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    deputyacknowledgement boolean,
    status character varying(255),
    company_companyid character varying(255) NOT NULL
);


--
-- Name: company_application_agreements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_application_agreements (
    companyapplication_applicationid character varying(255) NOT NULL,
    agreements_id character varying(255) NOT NULL
);


--
-- Name: company_application_memberroles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_application_memberroles (
    companyapplication_applicationid character varying(255) NOT NULL,
    memberroles_companyrole character varying(255) NOT NULL
);


--
-- Name: company_apps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_apps (
    company_companyid character varying(255) NOT NULL,
    apps_uuid character varying(255) NOT NULL
);


--
-- Name: company_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_role (
    companyrole character varying(255) NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    name_de character varying(255) NOT NULL,
    name_en character varying(255) NOT NULL
);


--
-- Name: company_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_roles (
    company_companyid character varying(255) NOT NULL,
    roles_companyrole character varying(255) NOT NULL
);


--
-- Name: company_usecases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_usecases (
    company_companyid character varying(255) NOT NULL,
    usecases_name character varying(255) NOT NULL
);


--
-- Name: company_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_user (
    uuid character varying(255) NOT NULL,
    companyadmin boolean NOT NULL,
    created bytea,
    email character varying(255),
    firstname character varying(255),
    lastlogin bytea,
    lastname character varying(255),
    company_companyid character varying(255) NOT NULL
);


--
-- Name: company_user_appfavourites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_user_appfavourites (
    user_uuid character varying(255) NOT NULL,
    appfavourites_uuid character varying(255) NOT NULL
);


--
-- Name: company_user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.company_user_roles (
    user_uuid character varying(255) NOT NULL,
    roles_uuid character varying(255) NOT NULL
);


--
-- Name: consent; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.consent (
    id character varying(255) NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    content character varying(255),
    status character varying(255) NOT NULL,
    target character varying(255),
    "timestamp" bytea NOT NULL,
    agreement_id character varying(255) NOT NULL,
    company_companyid character varying(255) NOT NULL,
    documents_id character varying(255),
    user_uuid character varying(255) NOT NULL
);


--
-- Name: contract; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.contract (
    id character varying(255) NOT NULL
);


--
-- Name: country; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.country (
    country_name_en character varying(255) NOT NULL,
    alpha_2_code character varying(255),
    alpha_3_code character varying(255),
    country_name_de character varying(255)
);


--
-- Name: document; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.document (
    id character varying(255) NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    document oid NOT NULL,
    documenthash character varying(255) NOT NULL,
    documentname character varying(255) NOT NULL,
    documentuploaddate bytea NOT NULL,
    documentversion character varying(255) NOT NULL,
    documentuser character varying(255)
);


--
-- Name: document_template; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.document_template (
    id character varying(255) NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    documenttemplatename character varying(255) NOT NULL,
    documenttemplateversion character varying(255) NOT NULL
);


--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE portal.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.identity_provider (
    item_category integer NOT NULL,
    uuid character varying(255) NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    extenalurl character varying(255),
    realm character varying(255),
    auth_url character varying(2048)
);


--
-- Name: identity_provider_catenax; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.identity_provider_catenax (
    uuid character varying(255) NOT NULL
);


--
-- Name: identity_provider_external; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.identity_provider_external (
    uuid character varying(255) NOT NULL
);


--
-- Name: invitation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.invitation (
    uuid character varying(255) NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    status integer NOT NULL,
    application_applicationid character varying(255),
    user_uuid character varying(255) NOT NULL
);


--
-- Name: language; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.language (
    short_name character varying(255) NOT NULL,
    long_name_de character varying(255),
    long_name_en character varying(255)
);


--
-- Name: policy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.policy (
    id character varying(255) NOT NULL
);


--
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.role (
    uuid character varying(255) NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    namede character varying(255) NOT NULL,
    nameen character varying(255) NOT NULL
);


--
-- Name: usage_agreement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.usage_agreement (
    id character varying(255) NOT NULL
);


--
-- Name: use_case; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal.use_case (
    name character varying(255) NOT NULL,
    date_created timestamp without time zone,
    date_last_changed timestamp without time zone,
    shortname character varying(255)
);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: agreement agreement_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.agreement
    ADD CONSTRAINT agreement_pkey PRIMARY KEY (id);


--
-- Name: app_description app_description_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app_description
    ADD CONSTRAINT app_description_pkey PRIMARY KEY (uuid);


--
-- Name: app_license app_license_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app_license
    ADD CONSTRAINT app_license_pkey PRIMARY KEY (uuid);


--
-- Name: app app_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app
    ADD CONSTRAINT app_pkey PRIMARY KEY (uuid);


--
-- Name: app_version app_version_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app_version
    ADD CONSTRAINT app_version_pkey PRIMARY KEY (uuid);


--
-- Name: company_application company_application_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_application
    ADD CONSTRAINT company_application_pkey PRIMARY KEY (applicationid);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (companyid);


--
-- Name: company_role company_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_role
    ADD CONSTRAINT company_role_pkey PRIMARY KEY (companyrole);


--
-- Name: company_user company_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_user
    ADD CONSTRAINT company_user_pkey PRIMARY KEY (uuid);


--
-- Name: consent consent_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.consent
    ADD CONSTRAINT consent_pkey PRIMARY KEY (id);


--
-- Name: contract contract_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_name_en);


--
-- Name: document document_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.document
    ADD CONSTRAINT document_pkey PRIMARY KEY (id);


--
-- Name: document_template document_template_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.document_template
    ADD CONSTRAINT document_template_pkey PRIMARY KEY (id);


--
-- Name: identity_provider_catenax identity_provider_catenax_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.identity_provider_catenax
    ADD CONSTRAINT identity_provider_catenax_pkey PRIMARY KEY (uuid);


--
-- Name: identity_provider_external identity_provider_external_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.identity_provider_external
    ADD CONSTRAINT identity_provider_external_pkey PRIMARY KEY (uuid);


--
-- Name: identity_provider identity_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.identity_provider
    ADD CONSTRAINT identity_provider_pkey PRIMARY KEY (uuid);


--
-- Name: invitation invitation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.invitation
    ADD CONSTRAINT invitation_pkey PRIMARY KEY (uuid);


--
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (short_name);


--
-- Name: policy policy_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.policy
    ADD CONSTRAINT policy_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (uuid);


--
-- Name: agreement_roles uk_6kruknd6fon8yo3qkv29g6hoe; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.agreement_roles
    ADD CONSTRAINT uk_6kruknd6fon8yo3qkv29g6hoe UNIQUE (roles_companyrole);


--
-- Name: company_application_memberroles uk_jnin6ptxtaysis2uyo9624ypr; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_application_memberroles
    ADD CONSTRAINT uk_jnin6ptxtaysis2uyo9624ypr UNIQUE (memberroles_companyrole);


--
-- Name: company_application_agreements uk_nn2q7ay0gkx0glnvt8h8lx47d; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_application_agreements
    ADD CONSTRAINT uk_nn2q7ay0gkx0glnvt8h8lx47d UNIQUE (agreements_id);


--
-- Name: agreement_documents uk_otgpqx8sag78de31n9ln46ty6; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.agreement_documents
    ADD CONSTRAINT uk_otgpqx8sag78de31n9ln46ty6 UNIQUE (documents_id);


--
-- Name: app_agreements uk_rt919mlxl4n5w1sqgr71277ju; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app_agreements
    ADD CONSTRAINT uk_rt919mlxl4n5w1sqgr71277ju UNIQUE (agreements_id);


--
-- Name: usage_agreement usage_agreement_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.usage_agreement
    ADD CONSTRAINT usage_agreement_pkey PRIMARY KEY (id);


--
-- Name: use_case use_case_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.use_case
    ADD CONSTRAINT use_case_pkey PRIMARY KEY (name);


--
-- Name: company_roles fk13go3wxdsx4585n92cximkuwq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_roles
    ADD CONSTRAINT fk13go3wxdsx4585n92cximkuwq FOREIGN KEY (company_companyid) REFERENCES portal.company(companyid);


--
-- Name: agreement_roles fk19s6pf9l28g63cyb5e4j8pcv4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.agreement_roles
    ADD CONSTRAINT fk19s6pf9l28g63cyb5e4j8pcv4 FOREIGN KEY (roles_companyrole) REFERENCES portal.company_role(companyrole);


--
-- Name: app_roles fk1jpppdhu2ykhvmi1cl6vvpt7f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app_roles
    ADD CONSTRAINT fk1jpppdhu2ykhvmi1cl6vvpt7f FOREIGN KEY (roles_uuid) REFERENCES portal.role(uuid);


--
-- Name: company_application fk1w6s3pgqhrw55emsgc3xerqpx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_application
    ADD CONSTRAINT fk1w6s3pgqhrw55emsgc3xerqpx FOREIGN KEY (company_companyid) REFERENCES portal.company(companyid);


--
-- Name: app_usecases fk29km31qqbxkufggkwlvr8i09g; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app_usecases
    ADD CONSTRAINT fk29km31qqbxkufggkwlvr8i09g FOREIGN KEY (app_uuid) REFERENCES portal.app(uuid);


--
-- Name: app_roles fk3r8h92kipu2buoiav1jk5lbx0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app_roles
    ADD CONSTRAINT fk3r8h92kipu2buoiav1jk5lbx0 FOREIGN KEY (app_uuid) REFERENCES portal.app(uuid);


--
-- Name: app fk4861pdemj1btodptattucjk54; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app
    ADD CONSTRAINT fk4861pdemj1btodptattucjk54 FOREIGN KEY (currentversion_uuid) REFERENCES portal.app_version(uuid);


--
-- Name: identity_provider_catenax fk4bsqkfyueu1w9s6ccgjc1uvak; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.identity_provider_catenax
    ADD CONSTRAINT fk4bsqkfyueu1w9s6ccgjc1uvak FOREIGN KEY (uuid) REFERENCES portal.identity_provider(uuid);


--
-- Name: company_user_appfavourites fk5gm8ptc6poufq58a5g45pxlpf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_user_appfavourites
    ADD CONSTRAINT fk5gm8ptc6poufq58a5g45pxlpf FOREIGN KEY (user_uuid) REFERENCES portal.company_user(uuid);


--
-- Name: contract fk5q4ff0eqigaiiqin276trmywi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.contract
    ADD CONSTRAINT fk5q4ff0eqigaiiqin276trmywi FOREIGN KEY (id) REFERENCES portal.agreement(id);


--
-- Name: app_description fk64exjwmhnq0uqfe2yy47atqps; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app_description
    ADD CONSTRAINT fk64exjwmhnq0uqfe2yy47atqps FOREIGN KEY (language_short_name) REFERENCES portal.language(short_name);


--
-- Name: app fk70a0e2hglyj9cdlonish9e48n; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app
    ADD CONSTRAINT fk70a0e2hglyj9cdlonish9e48n FOREIGN KEY (vendor_companyid) REFERENCES portal.company(companyid);


--
-- Name: identity_provider_external fk75y7rvtw1vs8coecjt2fpg6pg; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.identity_provider_external
    ADD CONSTRAINT fk75y7rvtw1vs8coecjt2fpg6pg FOREIGN KEY (uuid) REFERENCES portal.identity_provider(uuid);


--
-- Name: agreement_roles fk7l5dld6yyhpywh5giib5kj19y; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.agreement_roles
    ADD CONSTRAINT fk7l5dld6yyhpywh5giib5kj19y FOREIGN KEY (policy_id) REFERENCES portal.agreement(id);


--
-- Name: usage_agreement fk81ilbpcpqqiedyqrv99gpx96d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.usage_agreement
    ADD CONSTRAINT fk81ilbpcpqqiedyqrv99gpx96d FOREIGN KEY (id) REFERENCES portal.agreement(id);


--
-- Name: app_version_description fk8kneyusmjlnim17b7xovoeemw; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app_version_description
    ADD CONSTRAINT fk8kneyusmjlnim17b7xovoeemw FOREIGN KEY (appversion_uuid) REFERENCES portal.app_version(uuid);


--
-- Name: company_user fk8pux05366ewknmfn8p0vgjy77; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_user
    ADD CONSTRAINT fk8pux05366ewknmfn8p0vgjy77 FOREIGN KEY (company_companyid) REFERENCES portal.company(companyid);


--
-- Name: company fk9wb8u851ode72lhd1mc8h1haa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company
    ADD CONSTRAINT fk9wb8u851ode72lhd1mc8h1haa FOREIGN KEY (idp_uuid) REFERENCES portal.identity_provider(uuid);


--
-- Name: company_roles fka6piwm3sqag62go5r9aorsb8c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_roles
    ADD CONSTRAINT fka6piwm3sqag62go5r9aorsb8c FOREIGN KEY (roles_companyrole) REFERENCES portal.company_role(companyrole);


--
-- Name: consent fkb4bewdytswsa0y9o65txhilwt; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.consent
    ADD CONSTRAINT fkb4bewdytswsa0y9o65txhilwt FOREIGN KEY (user_uuid) REFERENCES portal.company_user(uuid);


--
-- Name: consent fkbewkgq5i1vuwat3j1mhewvhlh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.consent
    ADD CONSTRAINT fkbewkgq5i1vuwat3j1mhewvhlh FOREIGN KEY (company_companyid) REFERENCES portal.company(companyid);


--
-- Name: company_application_memberroles fkblrrkqoy8fsudr535562k6t1h; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_application_memberroles
    ADD CONSTRAINT fkblrrkqoy8fsudr535562k6t1h FOREIGN KEY (companyapplication_applicationid) REFERENCES portal.company_application(applicationid);


--
-- Name: company_usecases fkbp1tvb29367du7hpa57tvhgy9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_usecases
    ADD CONSTRAINT fkbp1tvb29367du7hpa57tvhgy9 FOREIGN KEY (company_companyid) REFERENCES portal.company(companyid);


--
-- Name: app_licenses fkdb45v2bwdke9tx1m0tsnnac63; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app_licenses
    ADD CONSTRAINT fkdb45v2bwdke9tx1m0tsnnac63 FOREIGN KEY (app_uuid) REFERENCES portal.app(uuid);


--
-- Name: consent fkej741e2gq48jklp2eaa1uj9vx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.consent
    ADD CONSTRAINT fkej741e2gq48jklp2eaa1uj9vx FOREIGN KEY (agreement_id) REFERENCES portal.agreement(id);


--
-- Name: invitation fkfdkg6wep556f3rlai3agfegpu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.invitation
    ADD CONSTRAINT fkfdkg6wep556f3rlai3agfegpu FOREIGN KEY (application_applicationid) REFERENCES portal.company_application(applicationid);


--
-- Name: company_application_agreements fkfk859lnpnse1cbixrm53esih1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_application_agreements
    ADD CONSTRAINT fkfk859lnpnse1cbixrm53esih1 FOREIGN KEY (companyapplication_applicationid) REFERENCES portal.company_application(applicationid);


--
-- Name: company_application_agreements fkgfdphek1b09ajg1gmte0pr8tx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_application_agreements
    ADD CONSTRAINT fkgfdphek1b09ajg1gmte0pr8tx FOREIGN KEY (agreements_id) REFERENCES portal.agreement(id);


--
-- Name: company fkgfifm4874ce6mecwj54wdb3ma; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company
    ADD CONSTRAINT fkgfifm4874ce6mecwj54wdb3ma FOREIGN KEY (address_id) REFERENCES portal.address(id);


--
-- Name: app_agreements fkh5kkr03xr1a47daubljxcakwf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app_agreements
    ADD CONSTRAINT fkh5kkr03xr1a47daubljxcakwf FOREIGN KEY (app_uuid) REFERENCES portal.app(uuid);


--
-- Name: agreement fkhkgeafcjpvqnkxwnkmbjc8dcj; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.agreement
    ADD CONSTRAINT fkhkgeafcjpvqnkxwnkmbjc8dcj FOREIGN KEY (app_uuid) REFERENCES portal.app(uuid);


--
-- Name: app_licenses fkhqxy6x66cbkyuxpwf56gflo3c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app_licenses
    ADD CONSTRAINT fkhqxy6x66cbkyuxpwf56gflo3c FOREIGN KEY (licenses_uuid) REFERENCES portal.app_license(uuid);


--
-- Name: company_application_memberroles fki3iscrbwdykl7xjx4j9f3yhkp; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_application_memberroles
    ADD CONSTRAINT fki3iscrbwdykl7xjx4j9f3yhkp FOREIGN KEY (memberroles_companyrole) REFERENCES portal.company_role(companyrole);


--
-- Name: app_usecases fkikhw2cj2gr24hloglo0pawrfx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app_usecases
    ADD CONSTRAINT fkikhw2cj2gr24hloglo0pawrfx FOREIGN KEY (usecases_name) REFERENCES portal.use_case(name);


--
-- Name: company_apps fkjj1f6x78qaxvyq0gbp0fhdjmk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_apps
    ADD CONSTRAINT fkjj1f6x78qaxvyq0gbp0fhdjmk FOREIGN KEY (company_companyid) REFERENCES portal.company(companyid);


--
-- Name: company_user_roles fkjj8n34jkirg6ykpm6u8pklo1d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_user_roles
    ADD CONSTRAINT fkjj8n34jkirg6ykpm6u8pklo1d FOREIGN KEY (roles_uuid) REFERENCES portal.role(uuid);


--
-- Name: app_version_description fkjq6u4ns756dm82vu30crsvshq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app_version_description
    ADD CONSTRAINT fkjq6u4ns756dm82vu30crsvshq FOREIGN KEY (description_uuid) REFERENCES portal.app_description(uuid);


--
-- Name: address fkkcwlkhkrfj54b1yx1dmeidam9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.address
    ADD CONSTRAINT fkkcwlkhkrfj54b1yx1dmeidam9 FOREIGN KEY (country_country_name_en) REFERENCES portal.country(country_name_en);


--
-- Name: company_user_roles fklf5962qg3a3e9ie9t1xmt67im; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_user_roles
    ADD CONSTRAINT fklf5962qg3a3e9ie9t1xmt67im FOREIGN KEY (user_uuid) REFERENCES portal.company_user(uuid);


--
-- Name: document fkll9ftqsw3b8banx5283kno8lq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.document
    ADD CONSTRAINT fkll9ftqsw3b8banx5283kno8lq FOREIGN KEY (documentuser) REFERENCES portal.company_user(uuid);


--
-- Name: agreement_documents fklrjavekoem3kgj7pawsh0yk9c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.agreement_documents
    ADD CONSTRAINT fklrjavekoem3kgj7pawsh0yk9c FOREIGN KEY (documents_id) REFERENCES portal.document_template(id);


--
-- Name: agreement_roles fkltfqljkacdmlgtr9iec71kq0o; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.agreement_roles
    ADD CONSTRAINT fkltfqljkacdmlgtr9iec71kq0o FOREIGN KEY (contract_id) REFERENCES portal.agreement(id);


--
-- Name: consent fkmgq37cv032gltkh2ynjcas6f8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.consent
    ADD CONSTRAINT fkmgq37cv032gltkh2ynjcas6f8 FOREIGN KEY (documents_id) REFERENCES portal.document(id);


--
-- Name: company_user_appfavourites fkn75rh2x2cgersusxc5u8yn8h8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_user_appfavourites
    ADD CONSTRAINT fkn75rh2x2cgersusxc5u8yn8h8 FOREIGN KEY (appfavourites_uuid) REFERENCES portal.app(uuid);


--
-- Name: agreement_documents fkne75pie16l1mxjggyyhg1er5y; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.agreement_documents
    ADD CONSTRAINT fkne75pie16l1mxjggyyhg1er5y FOREIGN KEY (agreement_id) REFERENCES portal.agreement(id);


--
-- Name: invitation fkphjtfnn8m3nrg0cwa5beco7hh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.invitation
    ADD CONSTRAINT fkphjtfnn8m3nrg0cwa5beco7hh FOREIGN KEY (user_uuid) REFERENCES portal.company_user(uuid);


--
-- Name: app_agreements fkq37h8ql6av2ywp9m9wtq0ydv5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.app_agreements
    ADD CONSTRAINT fkq37h8ql6av2ywp9m9wtq0ydv5 FOREIGN KEY (agreements_id) REFERENCES portal.agreement(id);


--
-- Name: company_apps fkqpe388nsvq4dbboqhbhr771ld; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_apps
    ADD CONSTRAINT fkqpe388nsvq4dbboqhbhr771ld FOREIGN KEY (apps_uuid) REFERENCES portal.app(uuid);


--
-- Name: policy fkrn4r8y9dijpr4arhe1cse0o6j; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.policy
    ADD CONSTRAINT fkrn4r8y9dijpr4arhe1cse0o6j FOREIGN KEY (id) REFERENCES portal.agreement(id);


--
-- Name: agreement fkt91pkkfiegka64h156tano4y4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.agreement
    ADD CONSTRAINT fkt91pkkfiegka64h156tano4y4 FOREIGN KEY (issuer_companyid) REFERENCES portal.company(companyid);


--
-- Name: company_usecases fktgryxfhqy65nrsma372464ofv; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal.company_usecases
    ADD CONSTRAINT fktgryxfhqy65nrsma372464ofv FOREIGN KEY (usecases_name) REFERENCES portal.use_case(name);


--
-- PostgreSQL database dump complete
--
