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

--
-- Name: iamcentral; Type: SCHEMA; Schema: -; Owner: kccentral
--

CREATE SCHEMA iamcentral;


ALTER SCHEMA iamcentral OWNER TO kccentral;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE iamcentral.admin_event_entity OWNER TO kccentral;

--
-- Name: associated_policy; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.associated_policy OWNER TO kccentral;

--
-- Name: authentication_execution; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE iamcentral.authentication_execution OWNER TO kccentral;

--
-- Name: authentication_flow; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE iamcentral.authentication_flow OWNER TO kccentral;

--
-- Name: authenticator_config; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE iamcentral.authenticator_config OWNER TO kccentral;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE iamcentral.authenticator_config_entry OWNER TO kccentral;

--
-- Name: broker_link; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE iamcentral.broker_link OWNER TO kccentral;

--
-- Name: client; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE iamcentral.client OWNER TO kccentral;

--
-- Name: client_attributes; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE iamcentral.client_attributes OWNER TO kccentral;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE iamcentral.client_auth_flow_bindings OWNER TO kccentral;

--
-- Name: client_initial_access; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE iamcentral.client_initial_access OWNER TO kccentral;

--
-- Name: client_node_registrations; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE iamcentral.client_node_registrations OWNER TO kccentral;

--
-- Name: client_scope; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE iamcentral.client_scope OWNER TO kccentral;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE iamcentral.client_scope_attributes OWNER TO kccentral;

--
-- Name: client_scope_client; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE iamcentral.client_scope_client OWNER TO kccentral;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.client_scope_role_mapping OWNER TO kccentral;

--
-- Name: client_session; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE iamcentral.client_session OWNER TO kccentral;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE iamcentral.client_session_auth_status OWNER TO kccentral;

--
-- Name: client_session_note; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE iamcentral.client_session_note OWNER TO kccentral;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE iamcentral.client_session_prot_mapper OWNER TO kccentral;

--
-- Name: client_session_role; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE iamcentral.client_session_role OWNER TO kccentral;

--
-- Name: client_user_session_note; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE iamcentral.client_user_session_note OWNER TO kccentral;

--
-- Name: component; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE iamcentral.component OWNER TO kccentral;

--
-- Name: component_config; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE iamcentral.component_config OWNER TO kccentral;

--
-- Name: composite_role; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE iamcentral.composite_role OWNER TO kccentral;

--
-- Name: credential; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE iamcentral.credential OWNER TO kccentral;

--
-- Name: databasechangelog; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE iamcentral.databasechangelog OWNER TO kccentral;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE iamcentral.databasechangeloglock OWNER TO kccentral;

--
-- Name: default_client_scope; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE iamcentral.default_client_scope OWNER TO kccentral;

--
-- Name: event_entity; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE iamcentral.event_entity OWNER TO kccentral;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE iamcentral.fed_user_attribute OWNER TO kccentral;

--
-- Name: fed_user_consent; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE iamcentral.fed_user_consent OWNER TO kccentral;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.fed_user_consent_cl_scope OWNER TO kccentral;

--
-- Name: fed_user_credential; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE iamcentral.fed_user_credential OWNER TO kccentral;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE iamcentral.fed_user_group_membership OWNER TO kccentral;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE iamcentral.fed_user_required_action OWNER TO kccentral;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE iamcentral.fed_user_role_mapping OWNER TO kccentral;

--
-- Name: federated_identity; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.federated_identity OWNER TO kccentral;

--
-- Name: federated_user; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.federated_user OWNER TO kccentral;

--
-- Name: group_attribute; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.group_attribute OWNER TO kccentral;

--
-- Name: group_role_mapping; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.group_role_mapping OWNER TO kccentral;

--
-- Name: identity_provider; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE iamcentral.identity_provider OWNER TO kccentral;

--
-- Name: identity_provider_config; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE iamcentral.identity_provider_config OWNER TO kccentral;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.identity_provider_mapper OWNER TO kccentral;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE iamcentral.idp_mapper_config OWNER TO kccentral;

--
-- Name: keycloak_group; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE iamcentral.keycloak_group OWNER TO kccentral;

--
-- Name: keycloak_role; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE iamcentral.keycloak_role OWNER TO kccentral;

--
-- Name: migration_model; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE iamcentral.migration_model OWNER TO kccentral;

--
-- Name: offline_client_session; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE iamcentral.offline_client_session OWNER TO kccentral;

--
-- Name: offline_user_session; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE iamcentral.offline_user_session OWNER TO kccentral;

--
-- Name: policy_config; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE iamcentral.policy_config OWNER TO kccentral;

--
-- Name: protocol_mapper; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE iamcentral.protocol_mapper OWNER TO kccentral;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE iamcentral.protocol_mapper_config OWNER TO kccentral;

--
-- Name: realm; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE iamcentral.realm OWNER TO kccentral;

--
-- Name: realm_attribute; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE iamcentral.realm_attribute OWNER TO kccentral;

--
-- Name: realm_default_groups; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.realm_default_groups OWNER TO kccentral;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE iamcentral.realm_enabled_event_types OWNER TO kccentral;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE iamcentral.realm_events_listeners OWNER TO kccentral;

--
-- Name: realm_localizations; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE iamcentral.realm_localizations OWNER TO kccentral;

--
-- Name: realm_required_credential; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.realm_required_credential OWNER TO kccentral;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE iamcentral.realm_smtp_config OWNER TO kccentral;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE iamcentral.realm_supported_locales OWNER TO kccentral;

--
-- Name: redirect_uris; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE iamcentral.redirect_uris OWNER TO kccentral;

--
-- Name: required_action_config; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE iamcentral.required_action_config OWNER TO kccentral;

--
-- Name: required_action_provider; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE iamcentral.required_action_provider OWNER TO kccentral;

--
-- Name: resource_attribute; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.resource_attribute OWNER TO kccentral;

--
-- Name: resource_policy; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.resource_policy OWNER TO kccentral;

--
-- Name: resource_scope; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.resource_scope OWNER TO kccentral;

--
-- Name: resource_server; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE iamcentral.resource_server OWNER TO kccentral;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE iamcentral.resource_server_perm_ticket OWNER TO kccentral;

--
-- Name: resource_server_policy; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE iamcentral.resource_server_policy OWNER TO kccentral;

--
-- Name: resource_server_resource; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE iamcentral.resource_server_resource OWNER TO kccentral;

--
-- Name: resource_server_scope; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE iamcentral.resource_server_scope OWNER TO kccentral;

--
-- Name: resource_uris; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE iamcentral.resource_uris OWNER TO kccentral;

--
-- Name: role_attribute; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE iamcentral.role_attribute OWNER TO kccentral;

--
-- Name: scope_mapping; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.scope_mapping OWNER TO kccentral;

--
-- Name: scope_policy; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.scope_policy OWNER TO kccentral;

--
-- Name: user_attribute; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE iamcentral.user_attribute OWNER TO kccentral;

--
-- Name: user_consent; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE iamcentral.user_consent OWNER TO kccentral;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.user_consent_client_scope OWNER TO kccentral;

--
-- Name: user_entity; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE iamcentral.user_entity OWNER TO kccentral;

--
-- Name: user_federation_config; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE iamcentral.user_federation_config OWNER TO kccentral;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.user_federation_mapper OWNER TO kccentral;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE iamcentral.user_federation_mapper_config OWNER TO kccentral;

--
-- Name: user_federation_provider; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE iamcentral.user_federation_provider OWNER TO kccentral;

--
-- Name: user_group_membership; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.user_group_membership OWNER TO kccentral;

--
-- Name: user_required_action; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE iamcentral.user_required_action OWNER TO kccentral;

--
-- Name: user_role_mapping; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE iamcentral.user_role_mapping OWNER TO kccentral;

--
-- Name: user_session; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE iamcentral.user_session OWNER TO kccentral;

--
-- Name: user_session_note; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE iamcentral.user_session_note OWNER TO kccentral;

--
-- Name: username_login_failure; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE iamcentral.username_login_failure OWNER TO kccentral;

--
-- Name: web_origins; Type: TABLE; Schema: iamcentral; Owner: kccentral
--

CREATE TABLE iamcentral.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE iamcentral.web_origins OWNER TO kccentral;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
637224c9-7580-438d-af50-446f506b586a	1648456192555	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	clients/14807046-362c-4055-905d-76bc2c665be1	\N	\N	CLIENT
08b10106-9047-4748-b954-dfd7de02bbe5	1648456213728	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	clients/705595c7-acd2-4536-ad51-0842f4b137a8	\N	\N	CLIENT
2bc21d49-2a01-4359-8a5f-ec82f5ce5ff4	1648456225994	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	clients/284446ba-5a53-43a9-9333-c0a7b76b0705	\N	\N	CLIENT
7e89d284-217d-4dc4-87c7-af2e055a06f8	1648456235558	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	clients/0886c206-26d1-456a-a1d5-4a42eddeb5cc	\N	\N	CLIENT
a8783904-989b-4708-b4b6-f1051078fcdc	1648456248516	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	clients/e6794a22-3730-409a-bf51-f79a8b54a27d	\N	\N	CLIENT
62ae5f70-1d35-4719-b430-eaa8759217a1	1648456256706	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	clients/e0092201-b8a4-471b-b050-0cf63effe5e3	\N	\N	CLIENT
ce6a3a01-52a4-469c-86bf-adff4989ab35	1648456263002	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	clients/4415793d-142e-4e90-9915-8c903a54a4e2	\N	\N	CLIENT
e7ecc9ba-ca63-4139-8b42-f31d58d00cbd	1648456282434	CX-Central	ACTION	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	clients/7668d79e-e8ed-4fd8-9700-4bfd18a3dadf/client-secret	{"type":"secret","value":"pgQxQMEohdbsam9rExxoul6JqN3bu8ZM"}	\N	CLIENT
f72c6262-5211-4a00-8bfb-68f22eb32dfc	1648456302780	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	identity-provider/instances/SupplyOn	\N	\N	IDENTITY_PROVIDER
2787412e-26e0-4385-9b0e-699ea5cb7a50	1648456308933	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	identity-provider/instances/github	\N	\N	IDENTITY_PROVIDER
e7a2aa48-37c6-4d14-8f6d-3fd93208f188	1648456416400	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	identity-provider/instances/siemensidpauth0	\N	\N	IDENTITY_PROVIDER
7d017c18-bb89-4f53-b2ec-879582858651	1648456420531	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	identity-provider/instances/newcompany	\N	\N	IDENTITY_PROVIDER
e25352e6-7df0-419d-b596-7939a46f328b	1648456424588	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	identity-provider/instances/bmw-wen-oidc	\N	\N	IDENTITY_PROVIDER
5712db49-34c1-4ca6-bd6e-09a096179b83	1648456428107	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	identity-provider/instances/microsoft-azure-speedboat-oidc	\N	\N	IDENTITY_PROVIDER
17514738-2dc0-454c-8f42-60676faa0440	1648456431257	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	identity-provider/instances/cx-test-access	\N	\N	IDENTITY_PROVIDER
6fca958c-106a-43d9-84eb-0599be9d7e7e	1648456434607	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	identity-provider/instances/mycompany	\N	\N	IDENTITY_PROVIDER
2f39d5eb-191c-4255-bb61-733c00834232	1648456466936	CX-Central	CREATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e	{"username":"devenv","enabled":true,"attributes":{},"groups":[]}	\N	USER
23651e17-4c5f-41cc-b4fb-ec357b1c9b15	1648456486376	CX-Central	ACTION	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/reset-password	\N	\N	USER
192669f9-e160-4efa-aacf-e3c388a9ff8e	1648456521234	CX-Central	CREATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"2f66ff52-5bb8-4b17-909b-0e1c6f26ac97","name":"add_app","description":"Users with this role can publish new apps in the Marketplace","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"d36cc7da-e188-4d7d-b17c-794f7008f97a","name":"add_digitial_twin","description":"Users with this role can add digital twins in the digital twin registry","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"35f7681c-bd1d-45f5-a01a-73b7fa6bcdde","name":"add_semantic_model","description":"Add semantic model","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"bfe97d4b-c2fb-40dc-a22c-202aca620b1d","name":"add_user_account","description":"Users with this right can add user accounts under their CX company","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"229ee3da-b667-4fe3-87fa-58699c694223","name":"Admin - Connector Setup","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"b5f93694-56c6-4b24-985b-b360017c84a5","name":"Admin - User Management","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"c4bc6cbd-9ecd-4022-b8c6-4858eae281ca","name":"App Store - Buy","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"da118624-3bf9-46a7-8222-732effd7d0e4","name":"appstore_filterapps","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"984c3e4f-5fb7-4dd6-882b-7c431febb8d9","name":"appstore_updateapps","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"de6280eb-825f-4c12-8f97-6d9086fbff7c","name":"appstore_view","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"55e1e90b-ccb4-4771-88ec-ba698696aef8","name":"Business Admin","composite":true,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"ee2da738-7f4e-4604-9dc7-4aa8a0a70431","name":"BusinessUser","description":"to be deleted","composite":true,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"e8b9f782-d707-4852-a979-e5a08b19f3c7","name":"CX Admin","composite":true,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"b72c63ff-3534-4897-9a81-1bc8cbff8a50","name":"CX User","composite":true,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"da4de06a-5315-4d0e-8d47-d3fb25e63269","name":"Data Specialist","composite":true,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"d8118fe7-8de0-46b3-b791-8de770117aba","name":"delete_apps","description":"User with this role can delete apps published in the Marketplace","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"534ec9af-b909-41af-b33d-d1ba2ee30fc0","name":"delete_digitial_twin","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"6ca94de0-4416-4f07-9394-05b0951c1afa","name":"delete_semantic_model_draft","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"bafd0c12-4c66-4852-a0e3-0c57903aacda","name":"delete_semantic_model_released","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"a2d6f8c4-2d25-48d3-b2b9-4b3e21fba09e","name":"delete_user_account","description":"Users with this right can delete users related to their company","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"418dfd6d-ec59-4a69-bd95-2d525e6379b0","name":"Developer","composite":true,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"ad18a4ad-12fe-4693-a141-4c4005b4e4fc","name":"Developer Hub","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"6fca2875-82e8-47cd-a9fd-2a0fcee0e315","name":"DevOps Management","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"86eaa072-ae2d-4c89-bb1b-70e9b3d45fe5","name":"digitaltwin_addmodel","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"00b1e417-c81c-4b22-ab32-feb36e74592f","name":"digitaltwin_view","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"03b8efba-cb1d-4399-80b4-7cc7527ab72f","name":"edit_apps","description":"Users with this role can edit apps which are published in the marketplace","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"eb8b9cbb-94a9-4258-b225-ada962d08885","name":"filter_apps","description":"Users with this role can filter apps in the App Marketplace","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"109e677c-8e37-46f8-abc1-0eeb2bfaf0c8","name":"invite_new_partner","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"e718571c-b4bb-4c35-81a7-c37ca147c4c2","name":"IT Admin","composite":true,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"9b26b354-8775-4f60-b7e5-8a3fb684149a","name":"semantic_addmodel","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"e03e4f6a-5597-460b-94ee-159e053985c1","name":"semantichub_view","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"eb2c79a7-b646-4cee-8507-617c78c0f5ac","name":"setup_connector","description":"User with this role can connect their company connector or request a connector as a service","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"1a1e42c6-28b7-4191-a52b-b97b72926c33","name":"setup_idp","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"22af7126-087a-459d-8aa1-2a047282371f","name":"update_digitial_twin","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"8d19604b-021e-488f-94fc-9a117f7bfd51","name":"update_semantic_model_draft","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"d9315bb6-244b-45ca-af2d-6e547e6ae19f","name":"update_semantic_model_released","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"2f9c84f7-a3cb-4241-84a7-6d1195cabb59","name":"view_apps","description":"Users with this role can view apps in the App Marketplace","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"93ae3ba4-f3de-4a89-8d94-4838c144f3f4","name":"view_client_roles","description":"Users with this right can view the client roles of an app","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"14371302-7db1-4804-8dd8-adcd4d0fde67","name":"view_digital_twins","description":"Users with this role can view the digital twin registry in the Portal","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"a3cfdfd9-b45a-43b7-bb6d-8da52c7e3377","name":"view_semantic_hub","description":"View existing data models","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"77f051b9-dda3-4cde-966d-eff8f2cdb7b9","name":"view_user_management","description":"Users with this right can access the user management in CX","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
5d697aa4-8aac-4e30-8d07-d1b81e6d756e	1648456526701	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"d36cc7da-e188-4d7d-b17c-794f7008f97a","name":"add_digitial_twin","description":"Users with this role can add digital twins in the digital twin registry","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
9c0501c3-ffef-4cf8-9f70-a24aade4abe1	1648456531450	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"35f7681c-bd1d-45f5-a01a-73b7fa6bcdde","name":"add_semantic_model","description":"Add semantic model","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
7429739b-74a3-4f72-94e5-1a2d93cff00b	1648456537204	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"2f66ff52-5bb8-4b17-909b-0e1c6f26ac97","name":"add_app","description":"Users with this role can publish new apps in the Marketplace","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
f538977f-75d7-48ee-89b9-fbb2a413d933	1648456539407	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"bfe97d4b-c2fb-40dc-a22c-202aca620b1d","name":"add_user_account","description":"Users with this right can add user accounts under their CX company","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
ea6464cc-1d64-4339-8b3d-b48c7d40f802	1648456542435	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"c4bc6cbd-9ecd-4022-b8c6-4858eae281ca","name":"App Store - Buy","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
bce8d504-20f9-4aba-810d-2aa9468506bb	1648468505137	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	identity-provider/instances/idp0	\N	\N	IDENTITY_PROVIDER
749d81d9-0ff1-4385-b6fc-caf9477a64a3	1648456544895	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"da118624-3bf9-46a7-8222-732effd7d0e4","name":"appstore_filterapps","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
8afa8c0d-5986-4d88-89e9-11aafebada77	1648456546330	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"984c3e4f-5fb7-4dd6-882b-7c431febb8d9","name":"appstore_updateapps","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
5ff2eef7-5996-4bbf-b098-1168bb6acc51	1648456561894	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"bafd0c12-4c66-4852-a0e3-0c57903aacda","name":"delete_semantic_model_released","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
25e1e5e8-9cab-4371-b5b1-e8b4f6bacde5	1648456564631	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"a2d6f8c4-2d25-48d3-b2b9-4b3e21fba09e","name":"delete_user_account","description":"Users with this right can delete users related to their company","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
82f39475-eda7-42b7-a048-287d606cb614	1648456571825	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"2f9c84f7-a3cb-4241-84a7-6d1195cabb59","name":"view_apps","description":"Users with this role can view apps in the App Marketplace","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"93ae3ba4-f3de-4a89-8d94-4838c144f3f4","name":"view_client_roles","description":"Users with this right can view the client roles of an app","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"14371302-7db1-4804-8dd8-adcd4d0fde67","name":"view_digital_twins","description":"Users with this role can view the digital twin registry in the Portal","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"a3cfdfd9-b45a-43b7-bb6d-8da52c7e3377","name":"view_semantic_hub","description":"View existing data models","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"77f051b9-dda3-4cde-966d-eff8f2cdb7b9","name":"view_user_management","description":"Users with this right can access the user management in CX","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
c2c60fb1-2f37-42d8-a5f2-1f373470e956	1648456585567	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"229ee3da-b667-4fe3-87fa-58699c694223","name":"Admin - Connector Setup","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"b5f93694-56c6-4b24-985b-b360017c84a5","name":"Admin - User Management","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"55e1e90b-ccb4-4771-88ec-ba698696aef8","name":"Business Admin","composite":true,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"ee2da738-7f4e-4604-9dc7-4aa8a0a70431","name":"BusinessUser","description":"to be deleted","composite":true,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"e8b9f782-d707-4852-a979-e5a08b19f3c7","name":"CX Admin","composite":true,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"b72c63ff-3534-4897-9a81-1bc8cbff8a50","name":"CX User","composite":true,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"da4de06a-5315-4d0e-8d47-d3fb25e63269","name":"Data Specialist","composite":true,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"418dfd6d-ec59-4a69-bd95-2d525e6379b0","name":"Developer","composite":true,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"ad18a4ad-12fe-4693-a141-4c4005b4e4fc","name":"Developer Hub","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"6fca2875-82e8-47cd-a9fd-2a0fcee0e315","name":"DevOps Management","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"86eaa072-ae2d-4c89-bb1b-70e9b3d45fe5","name":"digitaltwin_addmodel","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"00b1e417-c81c-4b22-ab32-feb36e74592f","name":"digitaltwin_view","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"03b8efba-cb1d-4399-80b4-7cc7527ab72f","name":"edit_apps","description":"Users with this role can edit apps which are published in the marketplace","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"eb8b9cbb-94a9-4258-b225-ada962d08885","name":"filter_apps","description":"Users with this role can filter apps in the App Marketplace","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"109e677c-8e37-46f8-abc1-0eeb2bfaf0c8","name":"invite_new_partner","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"e718571c-b4bb-4c35-81a7-c37ca147c4c2","name":"IT Admin","composite":true,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"9b26b354-8775-4f60-b7e5-8a3fb684149a","name":"semantic_addmodel","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"e03e4f6a-5597-460b-94ee-159e053985c1","name":"semantichub_view","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
2bab2550-a81e-4902-aa42-9d55616cd254	1648456628052	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e	\N	\N	USER
9f45da14-afa1-4b25-94c9-bbed026380b1	1648456641875	CX-Central	CREATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/1251f60b-75ce-4fb8-ad36-866a006ded79	{"username":"devenv-portal","enabled":true,"attributes":{},"groups":[]}	\N	USER
3229120c-e751-425a-936b-fb5083003770	1648456763407	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/1251f60b-75ce-4fb8-ad36-866a006ded79	\N	\N	USER
d89cab0b-3106-43be-ad41-20f6ab55ecc2	1648456547956	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"de6280eb-825f-4c12-8f97-6d9086fbff7c","name":"appstore_view","description":"to be deleted","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
c6eefc06-533d-474e-afd5-8e761ab2c1a8	1648456555659	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"534ec9af-b909-41af-b33d-d1ba2ee30fc0","name":"delete_digitial_twin","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
4c9103dc-2c21-47e4-9eba-546590b46f75	1648456799753	CX-Central	CREATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/3cbac5d7-d38e-4366-904a-b5829d0819dd/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"e8b9f782-d707-4852-a979-e5a08b19f3c7","name":"CX Admin","composite":true,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
6abc1a8b-9c63-435c-bb2f-e30bb141cc50	1648456552215	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"d8118fe7-8de0-46b3-b791-8de770117aba","name":"delete_apps","description":"User with this role can delete apps published in the Marketplace","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
e05366d9-d190-4fac-83f8-9b4d80741827	1648456559049	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"6ca94de0-4416-4f07-9394-05b0951c1afa","name":"delete_semantic_model_draft","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
f7bcc16c-d807-49b7-b064-3d1b6840f8e1	1648456710467	CX-Central	CREATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/1251f60b-75ce-4fb8-ad36-866a006ded79/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"e8b9f782-d707-4852-a979-e5a08b19f3c7","name":"CX Admin","composite":true,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
dd1eca50-99f2-4e05-90b3-b40603a81766	1648456579118	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"eb2c79a7-b646-4cee-8507-617c78c0f5ac","name":"setup_connector","description":"User with this role can connect their company connector or request a connector as a service","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"1a1e42c6-28b7-4191-a52b-b97b72926c33","name":"setup_idp","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"22af7126-087a-459d-8aa1-2a047282371f","name":"update_digitial_twin","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"8d19604b-021e-488f-94fc-9a117f7bfd51","name":"update_semantic_model_draft","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"d9315bb6-244b-45ca-af2d-6e547e6ae19f","name":"update_semantic_model_released","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
b495bca0-b80b-4560-acef-15bb1d942f30	1648456590136	CX-Central	CREATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"bfe97d4b-c2fb-40dc-a22c-202aca620b1d","name":"add_user_account","description":"Users with this right can add user accounts under their CX company","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
096276fa-15a5-47f9-ade7-dc77f58200fc	1648456610305	CX-Central	CREATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/5964dabe-a412-4c2a-8857-2806eb4ea12e/role-mappings/clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34	[{"id":"109e677c-8e37-46f8-abc1-0eeb2bfaf0c8","name":"invite_new_partner","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE_MAPPING
b423b943-fd5b-4245-932c-c7394f1bc951	1648456658966	CX-Central	ACTION	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/1251f60b-75ce-4fb8-ad36-866a006ded79/reset-password	\N	\N	USER
cfe2bbec-d34c-4a01-b06b-229d3e82c4e3	1648456779498	CX-Central	CREATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/3cbac5d7-d38e-4366-904a-b5829d0819dd	{"username":"devenv-cx-admin","enabled":true,"attributes":{},"groups":[]}	\N	USER
28e1c9d6-20bf-4e5e-88b0-afe12849d8c2	1648456790488	CX-Central	ACTION	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/3cbac5d7-d38e-4366-904a-b5829d0819dd/reset-password	\N	\N	USER
3edf343b-7819-4a53-9c71-cf6ae39d73f2	1648468176860	CX-Central	CREATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/4575b5b9-fab3-4c85-a722-8816bc487fad/role-mappings/clients/213ea3ce-b036-405f-8abd-3ee08ff72857	[{"id":"cc5e185c-5cc5-4b0d-9d60-a9e733f454ec","name":"manage-authorization","description":"${role_manage-authorization}","composite":false,"clientRole":true,"containerId":"213ea3ce-b036-405f-8abd-3ee08ff72857"},{"id":"99dc3a13-e284-493d-b8db-956f1815b14e","name":"manage-clients","description":"${role_manage-clients}","composite":false,"clientRole":true,"containerId":"213ea3ce-b036-405f-8abd-3ee08ff72857"},{"id":"8a35d055-6927-499d-80a0-28d1b0280623","name":"manage-events","description":"${role_manage-events}","composite":false,"clientRole":true,"containerId":"213ea3ce-b036-405f-8abd-3ee08ff72857"},{"id":"840b627d-4723-4e35-90e0-19c27b6b85cf","name":"manage-identity-providers","description":"${role_manage-identity-providers}","composite":false,"clientRole":true,"containerId":"213ea3ce-b036-405f-8abd-3ee08ff72857"},{"id":"2935c492-8f7b-4550-af8d-adf9f290ca4f","name":"manage-realm","description":"${role_manage-realm}","composite":false,"clientRole":true,"containerId":"213ea3ce-b036-405f-8abd-3ee08ff72857"},{"id":"a83e07cf-e87d-40ca-831a-6b67f0ac4714","name":"manage-users","description":"${role_manage-users}","composite":false,"clientRole":true,"containerId":"213ea3ce-b036-405f-8abd-3ee08ff72857"}]	\N	CLIENT_ROLE_MAPPING
4987d531-0227-4ff8-9cb3-f6d56a94dfed	1648468188109	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp0	{"alias":"idp0","displayName":"Shared Idp Test 22","internalId":"be2c7961-5aaa-41d8-917f-7a0c392191a0","providerId":"keycloak-oidc","enabled":false,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","postBrokerLoginFlowAlias":"","config":{"hideOnLoginPage":"true","clientId":"central-idp","disableUserInfo":"","useJwksUrl":"true","tokenUrl":"https://null","authorizationUrl":"https://null","jwksUrl":"https://null","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
8351ca50-0041-4d9f-91f8-afc80ef92f93	1648468241897	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	identity-provider/instances/idp0	\N	\N	IDENTITY_PROVIDER
a466734f-4fa6-4467-9ad0-cfa89d4a5a4e	1648468272222	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp0	{"alias":"idp0","displayName":"Shared Idp Test 22","internalId":"4c81bbbe-7b41-4795-adb3-902b490b25ee","providerId":"keycloak-oidc","enabled":false,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","postBrokerLoginFlowAlias":"","config":{"hideOnLoginPage":"true","clientId":"central-idp","disableUserInfo":"","useJwksUrl":"true","tokenUrl":"https://null","authorizationUrl":"https://null","jwksUrl":"https://null","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
f38e32f5-7949-4f9b-a0a4-9f034c285be9	1648468401324	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	identity-provider/instances/idp0	\N	\N	IDENTITY_PROVIDER
0fe3c3b9-922d-4947-9da2-d61511c7c44d	1648468428151	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp0	{"alias":"idp0","displayName":"Shared Idp Test 22","internalId":"e85e9f85-b36d-45c5-bc75-76f333c643e4","providerId":"keycloak-oidc","enabled":false,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","postBrokerLoginFlowAlias":"","config":{"hideOnLoginPage":"true","clientId":"central-idp","disableUserInfo":"","useJwksUrl":"true","tokenUrl":"https://null","authorizationUrl":"https://null","jwksUrl":"https://null","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
60f210fd-a31d-44a8-9aad-1fd62fc07a19	1648468508607	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp0	{"alias":"idp0","displayName":"Shared Idp Test 22","internalId":"291829fa-4947-4e02-b322-3d96f3550993","providerId":"keycloak-oidc","enabled":false,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","postBrokerLoginFlowAlias":"","config":{"hideOnLoginPage":"true","clientId":"central-idp","disableUserInfo":"","useJwksUrl":"true","tokenUrl":"https://null","authorizationUrl":"https://null","jwksUrl":"https://null","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
ee5002c9-6b60-4cf5-81a6-6f8d232bca89	1648468513937	CX-Central	UPDATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp0	{"alias":"idp0","displayName":"Shared Idp Test 22","internalId":"291829fa-4947-4e02-b322-3d96f3550993","providerId":"keycloak-oidc","enabled":false,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","config":{"hideOnLoginPage":"true","clientId":"central-idp","useJwksUrl":"true","tokenUrl":"https://devhost:8443/iamshared/auth/realms/idp0/protocol/openid-connect/token","authorizationUrl":"https://devhost:8443/iamshared/auth/realms/idp0/protocol/openid-connect/auth","logoutUrl":"https://devhost:8443/iamshared/auth/realms/idp0/protocol/openid-connect/logout","jwksUrl":"https://devhost:8443/iamshared/auth/realms/idp0/protocol/openid-connect/certs","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
ca81370b-7ec0-4f07-ba6e-af6cf9460a0b	1648468514188	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp0/mappers/73149c5b-74a5-4f7f-9daf-19ecbdc4ec37	{"name":"tenant-mapper","identityProviderAlias":"idp0","identityProviderMapper":"hardcoded-attribute-idp-mapper","config":{"syncMode":"INHERIT","attribute":"tenant","attribute.value":"idp0"}}	\N	IDENTITY_PROVIDER_MAPPER
9a51e62e-bf2a-4ef3-bc64-fc4365c17ab4	1648468514398	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp0/mappers/5cd59da8-f8fd-4783-b912-0636b165996b	{"name":"organisation-mapper","identityProviderAlias":"idp0","identityProviderMapper":"hardcoded-attribute-idp-mapper","config":{"syncMode":"INHERIT","attribute":"organisation","attribute.value":"Shared Idp Test 22"}}	\N	IDENTITY_PROVIDER_MAPPER
f8227236-7dc9-42d1-898a-c8c2db52b5d9	1648468514617	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp0/mappers/64ef82ff-e2a9-4f02-90dd-567389d33755	{"name":"username-mapper","identityProviderAlias":"idp0","identityProviderMapper":"oidc-username-idp-mapper","config":{"syncMode":"INHERIT","target":"LOCAL","template":"${ALIAS}.${CLAIM.sub}"}}	\N	IDENTITY_PROVIDER_MAPPER
aab17bb3-ce70-46d4-9219-e738f091951c	1648468515176	CX-Central	UPDATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp0	{"alias":"idp0","displayName":"Shared Idp Test 22","internalId":"291829fa-4947-4e02-b322-3d96f3550993","providerId":"keycloak-oidc","enabled":true,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","config":{"hideOnLoginPage":"false","clientId":"central-idp","useJwksUrl":"true","tokenUrl":"https://devhost:8443/iamshared/auth/realms/idp0/protocol/openid-connect/token","authorizationUrl":"https://devhost:8443/iamshared/auth/realms/idp0/protocol/openid-connect/auth","logoutUrl":"https://devhost:8443/iamshared/auth/realms/idp0/protocol/openid-connect/logout","jwksUrl":"https://devhost:8443/iamshared/auth/realms/idp0/protocol/openid-connect/certs","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
667356bf-c586-484f-a45e-acec66cc604a	1648468516023	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	users/f37397c5-83af-4847-be3a-8744e729773b	{"createdTimestamp":0,"username":"idp0.b5d55d6d-1e3e-4099-b947-47efd72a00b4","enabled":true,"emailVerified":true,"firstName":"Norbert","lastName":"Truchsess","email":"norbert.truchsess@t-online.de","attributes":{"organisation":["Shared Idp Test 22"],"tenant":["idp0"]}}	\N	USER
d0029ae5-a1ac-436a-97cc-29ef312c634b	1648468516173	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	users/f37397c5-83af-4847-be3a-8744e729773b/federated-identity/idp0	{"identityProvider":"idp0","userId":"b5d55d6d-1e3e-4099-b947-47efd72a00b4","userName":"ntruchsess"}	\N	USER
f3c066ca-db1e-47ba-8cfd-6a1cfe1dd7bb	1648468516444	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	users/f37397c5-83af-4847-be3a-8744e729773b/role-mappings/clients/789fed9d-e369-41db-92d9-5058e21fdd6d	[{"id":"d4e90553-21c6-4922-9b47-26ad2db306dc","name":"Company Admin","composite":true,"clientRole":true,"containerId":"789fed9d-e369-41db-92d9-5058e21fdd6d","attributes":{}}]	\N	CLIENT_ROLE_MAPPING
ca58c834-a975-45bc-a0bf-32e2655ce572	1648482806651	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	identity-provider/instances/idp0	\N	\N	IDENTITY_PROVIDER
5600b240-ec4b-4848-9a6f-3865b32ed058	1648483533474	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp1/mappers/f3fd2df9-3c15-4d17-be48-06d59b983811	{"name":"organisation-mapper","identityProviderAlias":"idp1","identityProviderMapper":"hardcoded-attribute-idp-mapper","config":{"syncMode":"INHERIT","attribute":"organisation","attribute.value":"Devhost Shared Idp"}}	\N	IDENTITY_PROVIDER_MAPPER
0818eb51-a028-48c4-98cb-ab3e0df48fe1	1648483059652	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2	{"alias":"idp2","displayName":"Devhost Shared Idp","internalId":"6d29b72c-1ccc-409f-a2dc-0b7d53a3d605","providerId":"keycloak-oidc","enabled":false,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","postBrokerLoginFlowAlias":"","config":{"hideOnLoginPage":"true","clientId":"central-idp","disableUserInfo":"","useJwksUrl":"true","tokenUrl":"https://null","authorizationUrl":"https://null","jwksUrl":"https://null","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
f37ae469-48b5-4596-b64c-ac20674749bd	1648483068355	CX-Central	UPDATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2	{"alias":"idp2","displayName":"Devhost Shared Idp","internalId":"6d29b72c-1ccc-409f-a2dc-0b7d53a3d605","providerId":"keycloak-oidc","enabled":false,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","config":{"hideOnLoginPage":"true","clientId":"central-idp","useJwksUrl":"true","tokenUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/token","authorizationUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/auth","logoutUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/logout","jwksUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/certs","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
476de12b-dbd6-4998-8a8b-009508634f8d	1648483068759	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2/mappers/0e309e66-fe2c-4f60-8dc4-24101b4fdacf	{"name":"tenant-mapper","identityProviderAlias":"idp2","identityProviderMapper":"hardcoded-attribute-idp-mapper","config":{"syncMode":"INHERIT","attribute":"tenant","attribute.value":"idp2"}}	\N	IDENTITY_PROVIDER_MAPPER
4fd416f6-022a-4f0a-8b84-ce93be70121a	1648483069190	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2/mappers/f60b3f72-8534-4849-b77e-c8f2fd558e23	{"name":"organisation-mapper","identityProviderAlias":"idp2","identityProviderMapper":"hardcoded-attribute-idp-mapper","config":{"syncMode":"INHERIT","attribute":"organisation","attribute.value":"Devhost Shared Idp"}}	\N	IDENTITY_PROVIDER_MAPPER
10e605f2-5432-405a-9d73-830557c7e0ad	1648483069589	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2/mappers/0c99d65c-32ef-4d40-9636-84990a7a366d	{"name":"username-mapper","identityProviderAlias":"idp2","identityProviderMapper":"oidc-username-idp-mapper","config":{"syncMode":"INHERIT","target":"LOCAL","template":"${ALIAS}.${CLAIM.sub}"}}	\N	IDENTITY_PROVIDER_MAPPER
1854bfbb-05c2-4c08-a5d1-e11a1d3ee17a	1648483071760	CX-Central	UPDATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2	{"alias":"idp2","displayName":"Devhost Shared Idp","internalId":"6d29b72c-1ccc-409f-a2dc-0b7d53a3d605","providerId":"keycloak-oidc","enabled":true,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","config":{"hideOnLoginPage":"false","clientId":"central-idp","useJwksUrl":"true","tokenUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/token","authorizationUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/auth","logoutUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/logout","jwksUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/certs","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
68416d58-75ea-4990-819d-e4ab44503377	1648483073912	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	users/7b426914-05a3-4f62-9536-abddd9c99b3b	{"createdTimestamp":0,"username":"idp2.b5f1c970-e4bf-48a2-bc97-8649eed3a10a","enabled":true,"emailVerified":true,"firstName":"Testuser","lastName":"Devhost","email":"norbert.truchsess@t-online.de","attributes":{"organisation":["Devhost Shared Idp"],"tenant":["idp2"]}}	\N	USER
8b2d9260-c14d-4c68-8897-ded51ff78220	1648483074265	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	users/7b426914-05a3-4f62-9536-abddd9c99b3b/federated-identity/idp2	{"identityProvider":"idp2","userId":"b5f1c970-e4bf-48a2-bc97-8649eed3a10a","userName":"devhost-test"}	\N	USER
7e6d02de-b42a-47d5-8b89-2053a861d3fb	1648483075205	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	users/7b426914-05a3-4f62-9536-abddd9c99b3b/role-mappings/clients/789fed9d-e369-41db-92d9-5058e21fdd6d	[{"id":"d4e90553-21c6-4922-9b47-26ad2db306dc","name":"Company Admin","composite":true,"clientRole":true,"containerId":"789fed9d-e369-41db-92d9-5058e21fdd6d","attributes":{}}]	\N	CLIENT_ROLE_MAPPING
543a4db0-bae4-48bf-b664-927cd42a79e2	1648483456747	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	identity-provider/instances/idp2	\N	\N	IDENTITY_PROVIDER
037d5c59-525e-4536-866c-3906332446e4	1648483463999	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2	{"alias":"idp2","displayName":"Devhost Shared Idp","internalId":"78427e48-60c7-4a25-938c-1d163b507012","providerId":"keycloak-oidc","enabled":false,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","postBrokerLoginFlowAlias":"","config":{"hideOnLoginPage":"true","clientId":"central-idp","disableUserInfo":"","useJwksUrl":"true","tokenUrl":"https://null","authorizationUrl":"https://null","jwksUrl":"https://null","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
fdf91266-1b6d-420f-a489-b531dc1684c5	1648483533684	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp1/mappers/c2a8086e-5e07-4828-921b-f8200fa2c58a	{"name":"username-mapper","identityProviderAlias":"idp1","identityProviderMapper":"oidc-username-idp-mapper","config":{"syncMode":"INHERIT","target":"LOCAL","template":"${ALIAS}.${CLAIM.sub}"}}	\N	IDENTITY_PROVIDER_MAPPER
23df81ee-b3e3-4f3b-a26e-f5185be1fd93	1648483654298	CX-Central	ACTION	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/e9b1c0e4-953d-4539-b703-dca9e911eab5/reset-password	\N	\N	USER
a41d14ee-1380-4828-835a-176478c88bb1	1648483466371	CX-Central	UPDATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2	{"alias":"idp2","displayName":"Devhost Shared Idp","internalId":"78427e48-60c7-4a25-938c-1d163b507012","providerId":"keycloak-oidc","enabled":false,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","config":{"hideOnLoginPage":"true","clientId":"central-idp","useJwksUrl":"true","tokenUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/token","authorizationUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/auth","logoutUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/logout","jwksUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/certs","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
6dd916db-774e-440b-821c-3ee19a98cd99	1648483466577	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2/mappers/ba33683a-9c8f-4256-9c3e-6a43978773e4	{"name":"tenant-mapper","identityProviderAlias":"idp2","identityProviderMapper":"hardcoded-attribute-idp-mapper","config":{"syncMode":"INHERIT","attribute":"tenant","attribute.value":"idp2"}}	\N	IDENTITY_PROVIDER_MAPPER
c060e032-68d1-4105-afee-5eb0d00b247d	1648483466944	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2/mappers/a0c1fe1c-6d97-408a-8f0a-8e13439dcfbc	{"name":"organisation-mapper","identityProviderAlias":"idp2","identityProviderMapper":"hardcoded-attribute-idp-mapper","config":{"syncMode":"INHERIT","attribute":"organisation","attribute.value":"Devhost Shared Idp"}}	\N	IDENTITY_PROVIDER_MAPPER
1af0de45-1363-421f-a6a1-6cb7de587e70	1648483467343	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2/mappers/4fcbc0f2-48ca-4c7e-96cb-f4f649294d6c	{"name":"username-mapper","identityProviderAlias":"idp2","identityProviderMapper":"oidc-username-idp-mapper","config":{"syncMode":"INHERIT","target":"LOCAL","template":"${ALIAS}.${CLAIM.sub}"}}	\N	IDENTITY_PROVIDER_MAPPER
74bd104e-c503-43cb-aabb-cbd368511e17	1648483467943	CX-Central	UPDATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2	{"alias":"idp2","displayName":"Devhost Shared Idp","internalId":"78427e48-60c7-4a25-938c-1d163b507012","providerId":"keycloak-oidc","enabled":true,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","config":{"hideOnLoginPage":"false","clientId":"central-idp","useJwksUrl":"true","tokenUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/token","authorizationUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/auth","logoutUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/logout","jwksUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/certs","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
573021d6-9fc5-411b-9d17-2930e9115425	1648483468546	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	users/77a70844-80b3-478e-8796-be359c75dc38	{"createdTimestamp":0,"username":"idp2.98125bb8-af71-426c-be63-b007e8bf75d5","enabled":true,"emailVerified":true,"firstName":"Testuser","lastName":"Devhost","email":"norbert.truchsess@t-online.de","attributes":{"organisation":["Devhost Shared Idp"],"tenant":["idp2"]}}	\N	USER
2cc0cea5-a0d6-42a2-832e-5ae2b89ad8c1	1648483468656	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	users/77a70844-80b3-478e-8796-be359c75dc38/federated-identity/idp2	{"identityProvider":"idp2","userId":"98125bb8-af71-426c-be63-b007e8bf75d5","userName":"devhost-test"}	\N	USER
9f40c7d1-22a7-4457-af9c-4f5aa37126a1	1648483468849	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	users/77a70844-80b3-478e-8796-be359c75dc38/role-mappings/clients/789fed9d-e369-41db-92d9-5058e21fdd6d	[{"id":"d4e90553-21c6-4922-9b47-26ad2db306dc","name":"Company Admin","composite":true,"clientRole":true,"containerId":"789fed9d-e369-41db-92d9-5058e21fdd6d","attributes":{}}]	\N	CLIENT_ROLE_MAPPING
467b9f72-3267-4aa5-ae99-0d3dbeb50658	1648483530488	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp1	{"alias":"idp1","displayName":"Devhost Shared Idp","internalId":"bd73c385-bdd5-405f-977f-db6b5281e68e","providerId":"keycloak-oidc","enabled":false,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","postBrokerLoginFlowAlias":"","config":{"hideOnLoginPage":"true","clientId":"central-idp","disableUserInfo":"","useJwksUrl":"true","tokenUrl":"https://null","authorizationUrl":"https://null","jwksUrl":"https://null","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
79caf2bc-db0f-4181-80cf-525fc98fe97c	1648483533068	CX-Central	UPDATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp1	{"alias":"idp1","displayName":"Devhost Shared Idp","internalId":"bd73c385-bdd5-405f-977f-db6b5281e68e","providerId":"keycloak-oidc","enabled":false,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","config":{"hideOnLoginPage":"true","clientId":"central-idp","useJwksUrl":"true","tokenUrl":"https://devhost:8443/iamshared/auth/realms/idp1/protocol/openid-connect/token","authorizationUrl":"https://devhost:8443/iamshared/auth/realms/idp1/protocol/openid-connect/auth","logoutUrl":"https://devhost:8443/iamshared/auth/realms/idp1/protocol/openid-connect/logout","jwksUrl":"https://devhost:8443/iamshared/auth/realms/idp1/protocol/openid-connect/certs","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
7fe7f439-f5f7-4207-976b-76ae20a682ce	1648483533248	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp1/mappers/bdd91efb-b5f5-4d2b-bce7-e3a8fc93c8b9	{"name":"tenant-mapper","identityProviderAlias":"idp1","identityProviderMapper":"hardcoded-attribute-idp-mapper","config":{"syncMode":"INHERIT","attribute":"tenant","attribute.value":"idp1"}}	\N	IDENTITY_PROVIDER_MAPPER
4ebddcd9-41db-4314-8ea2-1c143b9ad94c	1648483534235	CX-Central	UPDATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp1	{"alias":"idp1","displayName":"Devhost Shared Idp","internalId":"bd73c385-bdd5-405f-977f-db6b5281e68e","providerId":"keycloak-oidc","enabled":true,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","config":{"hideOnLoginPage":"false","clientId":"central-idp","useJwksUrl":"true","tokenUrl":"https://devhost:8443/iamshared/auth/realms/idp1/protocol/openid-connect/token","authorizationUrl":"https://devhost:8443/iamshared/auth/realms/idp1/protocol/openid-connect/auth","logoutUrl":"https://devhost:8443/iamshared/auth/realms/idp1/protocol/openid-connect/logout","jwksUrl":"https://devhost:8443/iamshared/auth/realms/idp1/protocol/openid-connect/certs","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
f62d2eaa-d4b4-46f2-8bba-9c01865f80c5	1648483534701	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	users/e9b1c0e4-953d-4539-b703-dca9e911eab5	{"createdTimestamp":0,"username":"idp1.6ec46cd4-5aec-46c3-88dc-2a283994ab92","enabled":true,"emailVerified":true,"firstName":"Testuser","lastName":"Devhost","email":"norbert.truchsess@t-online.de","attributes":{"organisation":["Devhost Shared Idp"],"tenant":["idp1"]}}	\N	USER
0a07cff9-6a82-4900-8d38-e6d518ccf769	1648483534762	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	users/e9b1c0e4-953d-4539-b703-dca9e911eab5/federated-identity/idp1	{"identityProvider":"idp1","userId":"6ec46cd4-5aec-46c3-88dc-2a283994ab92","userName":"devhost-test"}	\N	USER
83f27d05-c9b2-4f71-bee9-6667defdaca1	1648483534910	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	users/e9b1c0e4-953d-4539-b703-dca9e911eab5/role-mappings/clients/789fed9d-e369-41db-92d9-5058e21fdd6d	[{"id":"d4e90553-21c6-4922-9b47-26ad2db306dc","name":"Company Admin","composite":true,"clientRole":true,"containerId":"789fed9d-e369-41db-92d9-5058e21fdd6d","attributes":{}}]	\N	CLIENT_ROLE_MAPPING
f0e8d7ae-3707-4e80-8371-ddc24a78409e	1648483612287	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/77a70844-80b3-478e-8796-be359c75dc38	\N	\N	USER
937f02c4-a5ef-4ee0-9e26-00f4e2579878	1648483615670	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/7b426914-05a3-4f62-9536-abddd9c99b3b	\N	\N	USER
9e81d589-788f-4deb-a136-06bb4fd0a327	1648483619656	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/f37397c5-83af-4847-be3a-8744e729773b	\N	\N	USER
e8a64130-3fb0-4b71-99b2-a335d98463a2	1648483642830	CX-Central	UPDATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/e9b1c0e4-953d-4539-b703-dca9e911eab5	{"id":"e9b1c0e4-953d-4539-b703-dca9e911eab5","createdTimestamp":1648483534694,"username":"idp1.6ec46cd4-5aec-46c3-88dc-2a283994ab92","enabled":true,"totp":false,"emailVerified":true,"firstName":"Testuser","lastName":"Devhost","email":"no.email@catena.net","attributes":{"organisation":["Devhost Shared Idp"],"tenant":["idp1"]},"disableableCredentialTypes":[],"requiredActions":[],"federatedIdentities":[{"identityProvider":"idp1","userId":"6ec46cd4-5aec-46c3-88dc-2a283994ab92","userName":"devhost-test"}],"notBefore":0,"access":{"manageGroupMembership":true,"view":true,"mapRoles":true,"impersonate":true,"manage":true}}	\N	USER
1d687191-0f9c-47e1-8166-ea6fa426c45f	1648483737717	CX-Central	ACTION	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/e9b1c0e4-953d-4539-b703-dca9e911eab5/credentials/e9810501-5a5a-4bf2-92db-1fad7f1df677	\N	\N	USER
3f5ee067-c208-4c95-b819-20a1e276f6af	1648483781700	CX-Central	UPDATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	identity-provider/instances/idp2	{"alias":"idp2","displayName":"Devhost Shared Idp 2","internalId":"78427e48-60c7-4a25-938c-1d163b507012","providerId":"keycloak-oidc","enabled":true,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","postBrokerLoginFlowAlias":"","config":{"hideOnLoginPage":"false","validateSignature":"true","clientId":"central-idp","tokenUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/token","authorizationUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/auth","jwksUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/certs","clientAuthMethod":"private_key_jwt","logoutUrl":"https://devhost:8443/iamshared/auth/realms/idp2/protocol/openid-connect/logout","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","useJwksUrl":"true","loginHint":"","uiLocales":"","backchannelSupported":"","disableUserInfo":"","acceptsPromptNoneForwardFromClient":"","pkceEnabled":""}}	\N	IDENTITY_PROVIDER
7869101a-a03b-464a-8239-1c2758a07233	1648483792834	CX-Central	DELETE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	identity-provider/instances/idp2	\N	\N	IDENTITY_PROVIDER
9bc86cba-9763-404c-a503-6c51b2a6ed71	1648485056289	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2	{"alias":"idp2","displayName":"WSL Shared Idp","internalId":"145e84bb-56a5-4726-af50-beb7a5b733f8","providerId":"keycloak-oidc","enabled":false,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","postBrokerLoginFlowAlias":"","config":{"hideOnLoginPage":"true","clientId":"central-idp","disableUserInfo":"","useJwksUrl":"true","tokenUrl":"https://null","authorizationUrl":"https://null","jwksUrl":"https://null","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
611af9e4-b43e-41b9-a897-3dfa677f5441	1648485061330	CX-Central	UPDATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2	{"alias":"idp2","displayName":"WSL Shared Idp","internalId":"145e84bb-56a5-4726-af50-beb7a5b733f8","providerId":"keycloak-oidc","enabled":false,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","config":{"hideOnLoginPage":"true","clientId":"central-idp","useJwksUrl":"true","tokenUrl":"https://wsl:8443/iamshared/auth/realms/idp2/protocol/openid-connect/token","authorizationUrl":"https://wsl:8443/iamshared/auth/realms/idp2/protocol/openid-connect/auth","logoutUrl":"https://wsl:8443/iamshared/auth/realms/idp2/protocol/openid-connect/logout","jwksUrl":"https://wsl:8443/iamshared/auth/realms/idp2/protocol/openid-connect/certs","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
be6d13b9-4024-4208-a255-31e7afbf35de	1648485061427	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2/mappers/73df0acd-f1f3-4d47-ad4a-40835d9dfe22	{"name":"tenant-mapper","identityProviderAlias":"idp2","identityProviderMapper":"hardcoded-attribute-idp-mapper","config":{"syncMode":"INHERIT","attribute":"tenant","attribute.value":"idp2"}}	\N	IDENTITY_PROVIDER_MAPPER
8b124b19-5426-4c72-836d-a5d966ddfd44	1648485061518	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2/mappers/f9c70b74-4574-4050-a9db-88d147a74d51	{"name":"organisation-mapper","identityProviderAlias":"idp2","identityProviderMapper":"hardcoded-attribute-idp-mapper","config":{"syncMode":"INHERIT","attribute":"organisation","attribute.value":"WSL Shared Idp"}}	\N	IDENTITY_PROVIDER_MAPPER
b94ad711-3aa5-4642-8833-0406b2c5bf9b	1648485061605	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2/mappers/79eb5890-b2e6-4b5c-b5f6-e1575d2d9aff	{"name":"username-mapper","identityProviderAlias":"idp2","identityProviderMapper":"oidc-username-idp-mapper","config":{"syncMode":"INHERIT","target":"LOCAL","template":"${ALIAS}.${CLAIM.sub}"}}	\N	IDENTITY_PROVIDER_MAPPER
45df5129-065f-4426-9b6e-655a2a06ddfa	1648485061977	CX-Central	UPDATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	identity-provider/instances/idp2	{"alias":"idp2","displayName":"WSL Shared Idp","internalId":"145e84bb-56a5-4726-af50-beb7a5b733f8","providerId":"keycloak-oidc","enabled":true,"updateProfileFirstLoginMode":"on","trustEmail":false,"storeToken":false,"addReadTokenRoleOnCreate":false,"authenticateByDefault":false,"linkOnly":false,"firstBrokerLoginFlowAlias":"first broker login","config":{"hideOnLoginPage":"false","clientId":"central-idp","useJwksUrl":"true","tokenUrl":"https://wsl:8443/iamshared/auth/realms/idp2/protocol/openid-connect/token","authorizationUrl":"https://wsl:8443/iamshared/auth/realms/idp2/protocol/openid-connect/auth","logoutUrl":"https://wsl:8443/iamshared/auth/realms/idp2/protocol/openid-connect/logout","jwksUrl":"https://wsl:8443/iamshared/auth/realms/idp2/protocol/openid-connect/certs","clientAuthMethod":"private_key_jwt","clientAssertionSigningAlg":"RS256","syncMode":"FORCE","validateSignature":"true"}}	\N	IDENTITY_PROVIDER
5320cb8c-bcbe-4606-86a3-72ec33b86576	1648485062342	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	users/3432d787-d7c8-46fb-96d7-cc984c6bfaac	{"createdTimestamp":0,"username":"idp2.f99d2698-5670-41f2-a141-e58b0c99560c","enabled":true,"emailVerified":true,"firstName":"Testuser","lastName":"WSL","email":"norbert.truchsess@t-online.de","attributes":{"organisation":["WSL Shared Idp"],"tenant":["idp2"]}}	\N	USER
71455281-ef37-40e9-8edf-31f03e8a2e83	1648485062490	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	users/3432d787-d7c8-46fb-96d7-cc984c6bfaac/federated-identity/idp2	{"identityProvider":"idp2","userId":"f99d2698-5670-41f2-a141-e58b0c99560c","userName":"wsl-test"}	\N	USER
46d887c9-1832-4589-ac33-76c35a6c691a	1648485062910	CX-Central	CREATE	CX-Central	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	4575b5b9-fab3-4c85-a722-8816bc487fad	10.0.0.2	users/3432d787-d7c8-46fb-96d7-cc984c6bfaac/role-mappings/clients/789fed9d-e369-41db-92d9-5058e21fdd6d	[{"id":"d4e90553-21c6-4922-9b47-26ad2db306dc","name":"Company Admin","composite":true,"clientRole":true,"containerId":"789fed9d-e369-41db-92d9-5058e21fdd6d","attributes":{}}]	\N	CLIENT_ROLE_MAPPING
e82eb495-7c90-4761-b3ea-c9be010e1c4e	1648490668169	CX-Central	UPDATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	users/3432d787-d7c8-46fb-96d7-cc984c6bfaac	{"id":"3432d787-d7c8-46fb-96d7-cc984c6bfaac","createdTimestamp":1648485062303,"username":"idp2.f99d2698-5670-41f2-a141-e58b0c99560c","enabled":true,"totp":false,"emailVerified":true,"firstName":"Testuser","lastName":"WSL","email":"no.email@catena.net","attributes":{"organisation":["WSL Shared Idp"],"tenant":["idp2"]},"disableableCredentialTypes":[],"requiredActions":[],"federatedIdentities":[{"identityProvider":"idp2","userId":"f99d2698-5670-41f2-a141-e58b0c99560c","userName":"wsl-test"}],"notBefore":0,"access":{"manageGroupMembership":true,"view":true,"mapRoles":true,"impersonate":true,"manage":true}}	\N	USER
e2571e90-7313-48e1-8303-7c4335d385ee	1652813259627	CX-Central	CREATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34/roles/view_submitted_applications	{"id":"6f98c370-cd5d-4ffa-9d38-26d39fdf6e25","name":"view_submitted_applications","composite":false}	\N	CLIENT_ROLE
77c35853-7576-4c9d-a47e-6e750d875c21	1652813274525	CX-Central	CREATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	roles-by-id/e8b9f782-d707-4852-a979-e5a08b19f3c7/composites	[{"id":"6f98c370-cd5d-4ffa-9d38-26d39fdf6e25","name":"view_submitted_applications","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE
0282e00c-15d9-42fa-855c-af10c54069e4	1653312900464	CX-Central	CREATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34/roles/add_tech_user_management	{"id":"4db614c5-9c59-47a0-a63d-89407fa77810","name":"add_tech_user_management","composite":false}	\N	CLIENT_ROLE
6fe39c55-f4dd-4625-afa4-5f0dea509956	1653312911376	CX-Central	CREATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34/roles/delete_tech_user_management	{"id":"e7fa4253-9664-4bca-9c0f-966648d19b47","name":"delete_tech_user_management","composite":false}	\N	CLIENT_ROLE
669415d3-8577-46c2-90cc-02c3b1d063ca	1653312920042	CX-Central	CREATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34/roles/view_tech_user_management	{"id":"a718d689-a009-484d-a240-9ce86d922ea3","name":"view_tech_user_management","composite":false}	\N	CLIENT_ROLE
8d137276-ca1c-43a7-a031-00011945f732	1653312940577	CX-Central	CREATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	roles-by-id/e8b9f782-d707-4852-a979-e5a08b19f3c7/composites	[{"id":"4db614c5-9c59-47a0-a63d-89407fa77810","name":"add_tech_user_management","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"e7fa4253-9664-4bca-9c0f-966648d19b47","name":"delete_tech_user_management","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"},{"id":"a718d689-a009-484d-a240-9ce86d922ea3","name":"view_tech_user_management","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE
43c37e10-717e-4f99-9d61-79a45046b7d9	1654185898653	CX-Central	CREATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	clients/dd8c6ef1-a56f-4114-8918-6c7fc2057e34/roles/approve_new_partner	{"id":"c7e88346-ccb7-4d8c-ace3-e22722b2100f","name":"approve_new_partner","composite":false}	\N	CLIENT_ROLE
188eec19-69c4-4e8b-8eed-cbab676d6b9a	1654185910106	CX-Central	CREATE	master	d2280ca6-3454-407a-9683-f39e2a3031dc	d25a17f9-1550-4b79-8495-3c1279c4333a	10.0.0.2	roles-by-id/e8b9f782-d707-4852-a979-e5a08b19f3c7/composites	[{"id":"c7e88346-ccb7-4d8c-ace3-e22722b2100f","name":"approve_new_partner","composite":false,"clientRole":true,"containerId":"dd8c6ef1-a56f-4114-8918-6c7fc2057e34"}]	\N	CLIENT_ROLE
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
b46b805d-b737-48c1-b22c-464f462fab68	\N	auth-cookie	master	97f2dd31-cd18-4273-b42f-55955e14f92c	2	10	f	\N	\N
877f4ee0-6330-4cf8-896a-1c88a8b9244a	\N	auth-spnego	master	97f2dd31-cd18-4273-b42f-55955e14f92c	3	20	f	\N	\N
7f22abdb-0015-4900-a7cf-e2056a5896b3	\N	identity-provider-redirector	master	97f2dd31-cd18-4273-b42f-55955e14f92c	2	25	f	\N	\N
01890636-d4c0-46a8-acf1-244a342ebab5	\N	\N	master	97f2dd31-cd18-4273-b42f-55955e14f92c	2	30	t	690403e8-2fb4-431d-9af0-fe59d6bbd65e	\N
7df1b6f3-1afa-47ed-95a5-993d6c2c6cbb	\N	auth-username-password-form	master	690403e8-2fb4-431d-9af0-fe59d6bbd65e	0	10	f	\N	\N
18ed8ed5-d489-4202-a89e-7c505b754d87	\N	\N	master	690403e8-2fb4-431d-9af0-fe59d6bbd65e	1	20	t	ccf0ff71-9201-4d8f-b201-3e483bfeb3a1	\N
6cc91b75-cd5d-41f1-9a0f-076c88120131	\N	conditional-user-configured	master	ccf0ff71-9201-4d8f-b201-3e483bfeb3a1	0	10	f	\N	\N
134db0a9-b430-4706-b736-3dae24cd1c1f	\N	auth-otp-form	master	ccf0ff71-9201-4d8f-b201-3e483bfeb3a1	0	20	f	\N	\N
d7143fd4-ab32-4b2b-b24e-4f203d09e360	\N	direct-grant-validate-username	master	5af3beed-bf04-40b5-9d9d-813beac0e351	0	10	f	\N	\N
500990e2-648b-4123-aa12-0fde7f205edc	\N	direct-grant-validate-password	master	5af3beed-bf04-40b5-9d9d-813beac0e351	0	20	f	\N	\N
aff0f343-aab7-4475-8bc0-fda79dcfe743	\N	\N	master	5af3beed-bf04-40b5-9d9d-813beac0e351	1	30	t	c7a51616-807d-4ca7-aff7-436370e055f4	\N
1489f6a7-4f49-4ef8-b0a9-567ffc80ba19	\N	conditional-user-configured	master	c7a51616-807d-4ca7-aff7-436370e055f4	0	10	f	\N	\N
c8e46a6b-26df-4453-add4-17d0b426125e	\N	direct-grant-validate-otp	master	c7a51616-807d-4ca7-aff7-436370e055f4	0	20	f	\N	\N
ea2fda45-955e-4023-bbcb-b721d865453a	\N	registration-page-form	master	b2dcdb81-4d8a-43c8-9c29-17f614f7a8fa	0	10	t	86b32227-5173-43cb-94e5-dea640d4ea90	\N
c0e1d638-5ad6-44c6-a3fd-59f0b999a13c	\N	registration-user-creation	master	86b32227-5173-43cb-94e5-dea640d4ea90	0	20	f	\N	\N
96176d27-ecfe-4cc8-a5b0-9127acdbdf56	\N	registration-profile-action	master	86b32227-5173-43cb-94e5-dea640d4ea90	0	40	f	\N	\N
65dd9a3a-578b-42cb-8643-6a6784bd2bb0	\N	registration-password-action	master	86b32227-5173-43cb-94e5-dea640d4ea90	0	50	f	\N	\N
89a0de82-859e-477d-8d30-99c83e158f2f	\N	registration-recaptcha-action	master	86b32227-5173-43cb-94e5-dea640d4ea90	3	60	f	\N	\N
4a66a5d8-d6eb-4532-93d1-c3395f8d8816	\N	reset-credentials-choose-user	master	3845dc5d-f7c7-4f05-b359-f7e7e2c6f380	0	10	f	\N	\N
2c2bbf08-3485-4664-b658-c153ca2d9173	\N	reset-credential-email	master	3845dc5d-f7c7-4f05-b359-f7e7e2c6f380	0	20	f	\N	\N
19fdaa53-4fbd-4df5-929d-3ffd1886c4f0	\N	reset-password	master	3845dc5d-f7c7-4f05-b359-f7e7e2c6f380	0	30	f	\N	\N
218d3f76-2358-4254-bff5-1fb28888045d	\N	\N	master	3845dc5d-f7c7-4f05-b359-f7e7e2c6f380	1	40	t	be0ad44a-1833-4784-9edc-63d8c4cf7e03	\N
bec2594e-7240-4990-86ef-e17080bbe9fd	\N	conditional-user-configured	master	be0ad44a-1833-4784-9edc-63d8c4cf7e03	0	10	f	\N	\N
72a48827-505d-49f9-8453-98092b882091	\N	reset-otp	master	be0ad44a-1833-4784-9edc-63d8c4cf7e03	0	20	f	\N	\N
1d1daadd-3f1e-4167-9c54-0914fba91311	\N	client-secret	master	334c9c46-d2de-481f-b6b7-7fcddff2a3cd	2	10	f	\N	\N
ca06a124-4c39-468a-b139-6f1aa68847cb	\N	client-jwt	master	334c9c46-d2de-481f-b6b7-7fcddff2a3cd	2	20	f	\N	\N
7cbc0228-d657-4106-b676-ae5bd9e1a771	\N	client-secret-jwt	master	334c9c46-d2de-481f-b6b7-7fcddff2a3cd	2	30	f	\N	\N
aa8fc600-23f0-440f-91d4-9c9ecb57a4de	\N	client-x509	master	334c9c46-d2de-481f-b6b7-7fcddff2a3cd	2	40	f	\N	\N
f1d96fff-a73c-4fe7-a947-dfc3fa7a59c1	\N	idp-review-profile	master	48f7bdea-dc66-4305-90bd-41c5f7fc123a	0	10	f	\N	62d08a13-4f52-4003-8e37-3a1a5aa0ef57
06786c0a-bed1-4992-b199-8056cc69c4b8	\N	\N	master	48f7bdea-dc66-4305-90bd-41c5f7fc123a	0	20	t	b91b9486-3c47-4254-8f10-4c0e4d5b713e	\N
00fbd2f7-2e5e-4ee5-978e-8551a14beab9	\N	idp-create-user-if-unique	master	b91b9486-3c47-4254-8f10-4c0e4d5b713e	2	10	f	\N	feaccdda-a7ea-4820-971e-377c13847eeb
27601e47-cb66-4d66-bfa7-3cbf9ba3f94c	\N	\N	master	b91b9486-3c47-4254-8f10-4c0e4d5b713e	2	20	t	63aa8a85-53aa-48da-88f5-4e6b90bcc3e2	\N
1b159ece-159b-469a-962b-e2b407125d66	\N	idp-confirm-link	master	63aa8a85-53aa-48da-88f5-4e6b90bcc3e2	0	10	f	\N	\N
00ff960d-fcdd-426b-951f-5e7fbf0c4da6	\N	\N	master	63aa8a85-53aa-48da-88f5-4e6b90bcc3e2	0	20	t	69e81a7e-4e3a-4a34-b8a7-d35c0728769a	\N
eb47aa86-e2d1-4394-ae94-6f41a64560a3	\N	idp-email-verification	master	69e81a7e-4e3a-4a34-b8a7-d35c0728769a	2	10	f	\N	\N
1f8aee75-aa0e-4cc8-b1a2-b808a9b81692	\N	\N	master	69e81a7e-4e3a-4a34-b8a7-d35c0728769a	2	20	t	2b6e697d-73ce-4e00-a873-18882dfba513	\N
a79aece7-c44a-4cf8-9a36-4df97c570740	\N	idp-username-password-form	master	2b6e697d-73ce-4e00-a873-18882dfba513	0	10	f	\N	\N
4a6443dd-f53e-4e47-9857-bf715c06a63f	\N	\N	master	2b6e697d-73ce-4e00-a873-18882dfba513	1	20	t	1ca79995-15bb-420d-b228-9f33ab2e7f42	\N
72cb03a7-3ea5-42f1-a32c-217381b5c5d8	\N	conditional-user-configured	master	1ca79995-15bb-420d-b228-9f33ab2e7f42	0	10	f	\N	\N
ceeef6bf-dae7-45a5-bd78-017c6520e6fd	\N	auth-otp-form	master	1ca79995-15bb-420d-b228-9f33ab2e7f42	0	20	f	\N	\N
2ac3d612-8e4a-429b-88f4-9482e72ba7fc	\N	http-basic-authenticator	master	6fd08f9b-1e0f-45ad-a263-559b1b091657	0	10	f	\N	\N
be3cf570-b73f-419d-8899-7d3c8c5c9c27	\N	docker-http-basic-authenticator	master	0d655c8a-a112-4e07-947f-6eb1490e8e39	0	10	f	\N	\N
ac87556b-fe87-4603-921c-df09bda726ff	\N	no-cookie-redirect	master	fbd11620-7faf-4b37-985b-9f91ae993b9f	0	10	f	\N	\N
4538f821-3040-4940-84e9-72ba6830cb13	\N	\N	master	fbd11620-7faf-4b37-985b-9f91ae993b9f	0	20	t	f2f746db-4083-4b29-8de3-11be9bd5f9cd	\N
da1d72d8-16a7-453f-bf5d-b7a256e593da	\N	basic-auth	master	f2f746db-4083-4b29-8de3-11be9bd5f9cd	0	10	f	\N	\N
2250ec9a-a1bf-4623-a4d4-b020cec2770d	\N	basic-auth-otp	master	f2f746db-4083-4b29-8de3-11be9bd5f9cd	3	20	f	\N	\N
8af7f609-0cfe-46ce-b412-969d31e8643c	\N	auth-spnego	master	f2f746db-4083-4b29-8de3-11be9bd5f9cd	3	30	f	\N	\N
f485fecc-8ad9-413f-8daf-652e1fa0eb91	\N	idp-email-verification	CX-Central	6db7dc80-2dd8-474f-a632-7c2e62d48e0e	2	10	f	\N	\N
2a17f380-8d55-4b5a-afb9-2d12ecc0a144	\N	\N	CX-Central	6db7dc80-2dd8-474f-a632-7c2e62d48e0e	2	20	t	5f281bd1-fed9-41d7-b3d8-7298c5d3c9f2	\N
9c8be59c-c27f-413d-84b6-c34471916d2b	\N	basic-auth	CX-Central	e9f2d5f7-e87b-41d7-b4f6-ec270ff5894b	0	10	f	\N	\N
85c8c323-1d79-4f20-b4f8-adb0abd3600e	\N	basic-auth-otp	CX-Central	e9f2d5f7-e87b-41d7-b4f6-ec270ff5894b	3	20	f	\N	\N
c8afd437-4add-4d23-825e-83275a04f446	\N	auth-spnego	CX-Central	e9f2d5f7-e87b-41d7-b4f6-ec270ff5894b	3	30	f	\N	\N
3aec6235-53bc-49a5-8130-64b25bf8137c	\N	conditional-user-configured	CX-Central	65e926e5-6e24-4a47-9b6a-c1a94518bcdd	0	10	f	\N	\N
bea52098-fa71-4ebb-ac70-278b84ec90f6	\N	auth-otp-form	CX-Central	65e926e5-6e24-4a47-9b6a-c1a94518bcdd	0	20	f	\N	\N
442a1ed1-cdc8-417f-9a74-27c1b7246980	\N	conditional-user-configured	CX-Central	7374beea-8edb-47b2-b23d-7bd976885414	0	10	f	\N	\N
42ed6012-912a-4558-83be-4b52e293dea6	\N	direct-grant-validate-otp	CX-Central	7374beea-8edb-47b2-b23d-7bd976885414	0	20	f	\N	\N
71846f85-a0e0-44bf-96e8-bb735f06954e	\N	conditional-user-configured	CX-Central	854eb625-22f6-4e3b-bc50-d73df836ccc8	0	10	f	\N	\N
00b5c4a0-8bee-4fb9-a7ef-8e73660a9a64	\N	auth-otp-form	CX-Central	854eb625-22f6-4e3b-bc50-d73df836ccc8	0	20	f	\N	\N
37232151-01f0-4663-8930-9497d50dd066	\N	idp-confirm-link	CX-Central	aed912e2-0370-4fb8-9da3-a887ed065953	0	10	f	\N	\N
9f01afab-9b92-4f19-a4f7-1b315759bb49	\N	\N	CX-Central	aed912e2-0370-4fb8-9da3-a887ed065953	0	20	t	6db7dc80-2dd8-474f-a632-7c2e62d48e0e	\N
ccf300d5-ca75-44f3-b6cb-7fc5e3942b27	\N	conditional-user-configured	CX-Central	785160d4-4574-4b5f-bdb3-aa79dcb45661	0	10	f	\N	\N
61c31226-0356-46fd-8bbf-33cf7ee49381	\N	reset-otp	CX-Central	785160d4-4574-4b5f-bdb3-aa79dcb45661	0	20	f	\N	\N
a745fdf2-3579-44ef-b7fc-a94cc7bbb140	\N	idp-create-user-if-unique	CX-Central	f9a7af65-3cd6-40c2-8e4a-67c9d5b5f2d3	2	10	f	\N	34c58867-d93e-4dd2-bfe7-4f0a1f88b45e
186e330c-aef4-43c1-953d-57e370506323	\N	\N	CX-Central	f9a7af65-3cd6-40c2-8e4a-67c9d5b5f2d3	2	20	t	aed912e2-0370-4fb8-9da3-a887ed065953	\N
47a671e1-8555-415b-b008-b304be2933ec	\N	idp-username-password-form	CX-Central	5f281bd1-fed9-41d7-b3d8-7298c5d3c9f2	0	10	f	\N	\N
1c4bd2d9-ccfe-4bb5-8c76-50319e0cddaf	\N	\N	CX-Central	5f281bd1-fed9-41d7-b3d8-7298c5d3c9f2	1	20	t	854eb625-22f6-4e3b-bc50-d73df836ccc8	\N
1ca11581-37f3-4110-a57e-c10b76d774a3	\N	auth-cookie	CX-Central	53ed9422-c904-4ef3-9349-211269ba91b7	2	10	f	\N	\N
fc41fcff-dcf5-46d5-89f3-192e1954aa60	\N	auth-spnego	CX-Central	53ed9422-c904-4ef3-9349-211269ba91b7	3	20	f	\N	\N
808dae09-fba0-4a66-9522-34569a5302c7	\N	identity-provider-redirector	CX-Central	53ed9422-c904-4ef3-9349-211269ba91b7	2	25	f	\N	\N
2871d75a-fa6b-4e0f-92cf-0d7c5fdafa1c	\N	\N	CX-Central	53ed9422-c904-4ef3-9349-211269ba91b7	2	30	t	0deb821c-7542-4824-9cf0-ec32a2b97272	\N
d4c3b163-80a1-44ee-83c8-9b4a80ec0553	\N	client-secret	CX-Central	faa735a6-7006-40a9-8b14-85c61e6063c5	2	10	f	\N	\N
346603aa-5491-4bb5-9d2e-2956fba4780b	\N	client-jwt	CX-Central	faa735a6-7006-40a9-8b14-85c61e6063c5	2	20	f	\N	\N
7d5b6e0d-e26a-483a-8739-9053f774b706	\N	client-secret-jwt	CX-Central	faa735a6-7006-40a9-8b14-85c61e6063c5	2	30	f	\N	\N
65172da0-31fb-4626-82a8-605f03130a20	\N	client-x509	CX-Central	faa735a6-7006-40a9-8b14-85c61e6063c5	2	40	f	\N	\N
c8176e40-bd2c-453c-be73-aa93b1ebc3e3	\N	direct-grant-validate-username	CX-Central	a8bef900-8437-429f-b15a-9f729933f31d	0	10	f	\N	\N
0ef80cc8-1f90-47bc-a537-f3fcfeba18d8	\N	direct-grant-validate-password	CX-Central	a8bef900-8437-429f-b15a-9f729933f31d	0	20	f	\N	\N
6f2744d1-3850-43e0-8405-607e568b355b	\N	\N	CX-Central	a8bef900-8437-429f-b15a-9f729933f31d	1	30	t	7374beea-8edb-47b2-b23d-7bd976885414	\N
fb69aa43-6d03-47f0-a2b4-518c84bbf8b2	\N	docker-http-basic-authenticator	CX-Central	16f9d21a-9f9b-4f82-8eee-77c16b9eb0b1	0	10	f	\N	\N
d2a5b4b1-f78d-4998-bd1d-8106da3f2d4d	\N	idp-review-profile	CX-Central	045ba328-a6b4-4566-b240-57dfcf866788	0	10	f	\N	5efa6279-47e3-4ccd-a784-84cbf65a6c03
5b60451d-b8ae-4a53-88b6-36f2be540a62	\N	\N	CX-Central	045ba328-a6b4-4566-b240-57dfcf866788	0	20	t	f9a7af65-3cd6-40c2-8e4a-67c9d5b5f2d3	\N
43aca60f-0059-480c-9de5-d16d9e8f4aa0	\N	auth-username-password-form	CX-Central	0deb821c-7542-4824-9cf0-ec32a2b97272	0	10	f	\N	\N
79c5d110-8227-43d6-991b-cffff75a6fb3	\N	\N	CX-Central	0deb821c-7542-4824-9cf0-ec32a2b97272	1	20	t	65e926e5-6e24-4a47-9b6a-c1a94518bcdd	\N
f0b8409e-c64b-4666-b81f-ee94a4f48e3d	\N	no-cookie-redirect	CX-Central	a35d5a91-a476-4153-a85b-dcf05a3e1021	0	10	f	\N	\N
a2f1660a-0af9-433c-ada6-6f406bf9a28c	\N	\N	CX-Central	a35d5a91-a476-4153-a85b-dcf05a3e1021	0	20	t	e9f2d5f7-e87b-41d7-b4f6-ec270ff5894b	\N
dd4d502b-e90e-40b6-981d-5f41588ce730	\N	registration-page-form	CX-Central	efbe9560-b9a0-4323-9699-19c72ac70617	0	10	t	099bc657-52fa-4c65-8246-8fd6eea7e9c6	\N
613cf4fb-9a80-42db-a37a-ea817375432d	\N	registration-user-creation	CX-Central	099bc657-52fa-4c65-8246-8fd6eea7e9c6	0	20	f	\N	\N
3cbae2b0-ceb0-4b9e-9e97-6ecbd5946370	\N	registration-profile-action	CX-Central	099bc657-52fa-4c65-8246-8fd6eea7e9c6	0	40	f	\N	\N
09ee53d1-3e5c-4d53-8e8d-1ae6993c9228	\N	registration-password-action	CX-Central	099bc657-52fa-4c65-8246-8fd6eea7e9c6	0	50	f	\N	\N
646d7946-9e78-4bd9-863b-912fdb812bfb	\N	registration-recaptcha-action	CX-Central	099bc657-52fa-4c65-8246-8fd6eea7e9c6	3	60	f	\N	\N
bc0fc922-5f38-4006-8412-e3dc7e26fc23	\N	reset-credentials-choose-user	CX-Central	29167b6a-4a74-4d4a-afe3-0bdb77c58e95	0	10	f	\N	\N
c65a4a74-ed1c-48f6-bf88-da052c5d3579	\N	reset-credential-email	CX-Central	29167b6a-4a74-4d4a-afe3-0bdb77c58e95	0	20	f	\N	\N
70287e4f-5b64-4040-a1b6-42e020be9a8c	\N	reset-password	CX-Central	29167b6a-4a74-4d4a-afe3-0bdb77c58e95	0	30	f	\N	\N
6af04064-b038-4c3c-aebe-24e68e6ddf48	\N	\N	CX-Central	29167b6a-4a74-4d4a-afe3-0bdb77c58e95	1	40	t	785160d4-4574-4b5f-bdb3-aa79dcb45661	\N
6d1fd9de-74e8-4094-8fc2-2c60fac25e95	\N	http-basic-authenticator	CX-Central	5027deba-7fd4-4dbc-b6f6-78429c49e508	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
97f2dd31-cd18-4273-b42f-55955e14f92c	browser	browser based authentication	master	basic-flow	t	t
690403e8-2fb4-431d-9af0-fe59d6bbd65e	forms	Username, password, otp and other auth forms.	master	basic-flow	f	t
ccf0ff71-9201-4d8f-b201-3e483bfeb3a1	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
5af3beed-bf04-40b5-9d9d-813beac0e351	direct grant	OpenID Connect Resource Owner Grant	master	basic-flow	t	t
c7a51616-807d-4ca7-aff7-436370e055f4	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
b2dcdb81-4d8a-43c8-9c29-17f614f7a8fa	registration	registration flow	master	basic-flow	t	t
86b32227-5173-43cb-94e5-dea640d4ea90	registration form	registration form	master	form-flow	f	t
3845dc5d-f7c7-4f05-b359-f7e7e2c6f380	reset credentials	Reset credentials for a user if they forgot their password or something	master	basic-flow	t	t
be0ad44a-1833-4784-9edc-63d8c4cf7e03	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	master	basic-flow	f	t
334c9c46-d2de-481f-b6b7-7fcddff2a3cd	clients	Base authentication for clients	master	client-flow	t	t
48f7bdea-dc66-4305-90bd-41c5f7fc123a	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	master	basic-flow	t	t
b91b9486-3c47-4254-8f10-4c0e4d5b713e	User creation or linking	Flow for the existing/non-existing user alternatives	master	basic-flow	f	t
63aa8a85-53aa-48da-88f5-4e6b90bcc3e2	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	master	basic-flow	f	t
69e81a7e-4e3a-4a34-b8a7-d35c0728769a	Account verification options	Method with which to verity the existing account	master	basic-flow	f	t
2b6e697d-73ce-4e00-a873-18882dfba513	Verify Existing Account by Re-authentication	Reauthentication of existing account	master	basic-flow	f	t
1ca79995-15bb-420d-b228-9f33ab2e7f42	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
6fd08f9b-1e0f-45ad-a263-559b1b091657	saml ecp	SAML ECP Profile Authentication Flow	master	basic-flow	t	t
0d655c8a-a112-4e07-947f-6eb1490e8e39	docker auth	Used by Docker clients to authenticate against the IDP	master	basic-flow	t	t
fbd11620-7faf-4b37-985b-9f91ae993b9f	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	master	basic-flow	t	t
f2f746db-4083-4b29-8de3-11be9bd5f9cd	Authentication Options	Authentication options.	master	basic-flow	f	t
6db7dc80-2dd8-474f-a632-7c2e62d48e0e	Account verification options	Method with which to verity the existing account	CX-Central	basic-flow	f	t
e9f2d5f7-e87b-41d7-b4f6-ec270ff5894b	Authentication Options	Authentication options.	CX-Central	basic-flow	f	t
65e926e5-6e24-4a47-9b6a-c1a94518bcdd	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	CX-Central	basic-flow	f	t
7374beea-8edb-47b2-b23d-7bd976885414	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	CX-Central	basic-flow	f	t
854eb625-22f6-4e3b-bc50-d73df836ccc8	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	CX-Central	basic-flow	f	t
aed912e2-0370-4fb8-9da3-a887ed065953	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	CX-Central	basic-flow	f	t
785160d4-4574-4b5f-bdb3-aa79dcb45661	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	CX-Central	basic-flow	f	t
f9a7af65-3cd6-40c2-8e4a-67c9d5b5f2d3	User creation or linking	Flow for the existing/non-existing user alternatives	CX-Central	basic-flow	f	t
5f281bd1-fed9-41d7-b3d8-7298c5d3c9f2	Verify Existing Account by Re-authentication	Reauthentication of existing account	CX-Central	basic-flow	f	t
53ed9422-c904-4ef3-9349-211269ba91b7	browser	browser based authentication	CX-Central	basic-flow	t	t
faa735a6-7006-40a9-8b14-85c61e6063c5	clients	Base authentication for clients	CX-Central	client-flow	t	t
a8bef900-8437-429f-b15a-9f729933f31d	direct grant	OpenID Connect Resource Owner Grant	CX-Central	basic-flow	t	t
16f9d21a-9f9b-4f82-8eee-77c16b9eb0b1	docker auth	Used by Docker clients to authenticate against the IDP	CX-Central	basic-flow	t	t
045ba328-a6b4-4566-b240-57dfcf866788	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	CX-Central	basic-flow	t	t
0deb821c-7542-4824-9cf0-ec32a2b97272	forms	Username, password, otp and other auth forms.	CX-Central	basic-flow	f	t
a35d5a91-a476-4153-a85b-dcf05a3e1021	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	CX-Central	basic-flow	t	t
efbe9560-b9a0-4323-9699-19c72ac70617	registration	registration flow	CX-Central	basic-flow	t	t
099bc657-52fa-4c65-8246-8fd6eea7e9c6	registration form	registration form	CX-Central	form-flow	f	t
29167b6a-4a74-4d4a-afe3-0bdb77c58e95	reset credentials	Reset credentials for a user if they forgot their password or something	CX-Central	basic-flow	t	t
5027deba-7fd4-4dbc-b6f6-78429c49e508	saml ecp	SAML ECP Profile Authentication Flow	CX-Central	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.authenticator_config (id, alias, realm_id) FROM stdin;
62d08a13-4f52-4003-8e37-3a1a5aa0ef57	review profile config	master
feaccdda-a7ea-4820-971e-377c13847eeb	create unique user config	master
34c58867-d93e-4dd2-bfe7-4f0a1f88b45e	create unique user config	CX-Central
5efa6279-47e3-4ccd-a784-84cbf65a6c03	review profile config	CX-Central
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
62d08a13-4f52-4003-8e37-3a1a5aa0ef57	missing	update.profile.on.first.login
feaccdda-a7ea-4820-971e-377c13847eeb	false	require.password.update.after.registration
34c58867-d93e-4dd2-bfe7-4f0a1f88b45e	false	require.password.update.after.registration
5efa6279-47e3-4ccd-a784-84cbf65a6c03	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	f	master-realm	0	f	\N	\N	t	\N	f	master	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
fd3d118a-2d23-4836-b8e3-383fee4ffeea	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
5d7b9a9b-4ec1-4fa8-a4d4-41877e7e20e6	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
ee809656-0126-4c36-a293-bb2d01dd6416	t	f	broker	0	f	\N	\N	t	\N	f	master	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
d2280ca6-3454-407a-9683-f39e2a3031dc	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	master	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
db4a211d-97fd-4786-b830-84fba6e855fc	t	f	admin-cli	0	t	\N	\N	f	\N	f	master	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	f	CX-Central-realm	0	f	\N	\N	t	\N	f	master	\N	0	f	f	CX-Central Realm	f	client-secret	\N	\N	\N	t	f	f	f
60313b78-e131-4358-9817-163ee938cc59	t	f	account	0	t	\N	/realms/CX-Central/account/	f	\N	f	CX-Central	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	t	f
2d37c8a9-7036-4e36-a085-12fec6e22938	t	f	account-console	0	t	\N	/realms/CX-Central/account/	f	\N	f	CX-Central	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
38d072af-d85b-4b39-ad55-13ed5ce45791	t	f	admin-cli	0	t	\N	\N	f	\N	f	CX-Central	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
03885031-084a-4317-aa51-de9b4acf8fa9	t	f	broker	0	f	\N	\N	t	\N	f	CX-Central	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	t	Cl2-CX-Portal	0	t	\N	\N	f	https://catenaxintaksportal.germanywestcentral.cloudapp.azure.com/home	f	CX-Central	openid-connect	-1	f	f	\N	f	client-secret	https://catenaxintaksportal.germanywestcentral.cloudapp.azure.com/home	\N	\N	t	f	t	f
789fed9d-e369-41db-92d9-5058e21fdd6d	t	t	Cl1-CX-Registration	0	t	\N	\N	f	\N	f	CX-Central	openid-connect	-1	f	f	\N	f	client-secret		\N	\N	t	f	t	f
213ea3ce-b036-405f-8abd-3ee08ff72857	t	f	realm-management	0	f	\N	\N	t	\N	f	CX-Central	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
d5265cd8-d128-4dc9-8602-d49d1df0a86c	t	f	security-admin-console	0	t	\N	/admin/CX-Central/console/	f	\N	f	CX-Central	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	t	t	sa-cl1-reg-2	0	f	pgQxQMEohdbsam9rExxoul6JqN3bu8ZM	\N	f	\N	f	CX-Central	openid-connect	-1	f	f	\N	t	client-secret	\N	\N	\N	t	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.client_attributes (client_id, value, name) FROM stdin;
5d7b9a9b-4ec1-4fa8-a4d4-41877e7e20e6	S256	pkce.code.challenge.method
d2280ca6-3454-407a-9683-f39e2a3031dc	S256	pkce.code.challenge.method
60313b78-e131-4358-9817-163ee938cc59	false	saml.assertion.signature
60313b78-e131-4358-9817-163ee938cc59	false	id.token.as.detached.signature
60313b78-e131-4358-9817-163ee938cc59	false	saml.multivalued.roles
60313b78-e131-4358-9817-163ee938cc59	false	saml.force.post.binding
60313b78-e131-4358-9817-163ee938cc59	false	saml.encrypt
60313b78-e131-4358-9817-163ee938cc59	false	oauth2.device.authorization.grant.enabled
60313b78-e131-4358-9817-163ee938cc59	false	saml.server.signature
60313b78-e131-4358-9817-163ee938cc59	false	backchannel.logout.revoke.offline.tokens
60313b78-e131-4358-9817-163ee938cc59	false	saml.server.signature.keyinfo.ext
60313b78-e131-4358-9817-163ee938cc59	true	use.refresh.tokens
60313b78-e131-4358-9817-163ee938cc59	false	exclude.session.state.from.auth.response
60313b78-e131-4358-9817-163ee938cc59	false	oidc.ciba.grant.enabled
60313b78-e131-4358-9817-163ee938cc59	false	saml.artifact.binding
60313b78-e131-4358-9817-163ee938cc59	false	backchannel.logout.session.required
60313b78-e131-4358-9817-163ee938cc59	false	client_credentials.use_refresh_token
60313b78-e131-4358-9817-163ee938cc59	false	saml_force_name_id_format
60313b78-e131-4358-9817-163ee938cc59	false	saml.client.signature
60313b78-e131-4358-9817-163ee938cc59	false	tls.client.certificate.bound.access.tokens
60313b78-e131-4358-9817-163ee938cc59	false	require.pushed.authorization.requests
60313b78-e131-4358-9817-163ee938cc59	false	saml.authnstatement
60313b78-e131-4358-9817-163ee938cc59	false	display.on.consent.screen
60313b78-e131-4358-9817-163ee938cc59	false	saml.onetimeuse.condition
2d37c8a9-7036-4e36-a085-12fec6e22938	false	saml.assertion.signature
2d37c8a9-7036-4e36-a085-12fec6e22938	false	id.token.as.detached.signature
2d37c8a9-7036-4e36-a085-12fec6e22938	false	saml.multivalued.roles
2d37c8a9-7036-4e36-a085-12fec6e22938	false	saml.force.post.binding
2d37c8a9-7036-4e36-a085-12fec6e22938	false	saml.encrypt
2d37c8a9-7036-4e36-a085-12fec6e22938	false	oauth2.device.authorization.grant.enabled
2d37c8a9-7036-4e36-a085-12fec6e22938	false	saml.server.signature
2d37c8a9-7036-4e36-a085-12fec6e22938	false	backchannel.logout.revoke.offline.tokens
2d37c8a9-7036-4e36-a085-12fec6e22938	false	saml.server.signature.keyinfo.ext
2d37c8a9-7036-4e36-a085-12fec6e22938	true	use.refresh.tokens
2d37c8a9-7036-4e36-a085-12fec6e22938	false	exclude.session.state.from.auth.response
2d37c8a9-7036-4e36-a085-12fec6e22938	false	oidc.ciba.grant.enabled
2d37c8a9-7036-4e36-a085-12fec6e22938	false	saml.artifact.binding
2d37c8a9-7036-4e36-a085-12fec6e22938	false	backchannel.logout.session.required
2d37c8a9-7036-4e36-a085-12fec6e22938	false	client_credentials.use_refresh_token
2d37c8a9-7036-4e36-a085-12fec6e22938	false	saml_force_name_id_format
2d37c8a9-7036-4e36-a085-12fec6e22938	false	saml.client.signature
2d37c8a9-7036-4e36-a085-12fec6e22938	false	tls.client.certificate.bound.access.tokens
2d37c8a9-7036-4e36-a085-12fec6e22938	false	require.pushed.authorization.requests
2d37c8a9-7036-4e36-a085-12fec6e22938	false	saml.authnstatement
2d37c8a9-7036-4e36-a085-12fec6e22938	false	display.on.consent.screen
2d37c8a9-7036-4e36-a085-12fec6e22938	S256	pkce.code.challenge.method
2d37c8a9-7036-4e36-a085-12fec6e22938	false	saml.onetimeuse.condition
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	saml.assertion.signature
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	id.token.as.detached.signature
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	saml.multivalued.roles
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	saml.force.post.binding
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	saml.encrypt
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	oauth2.device.authorization.grant.enabled
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	backchannel.logout.revoke.offline.tokens
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	saml.server.signature
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	saml.server.signature.keyinfo.ext
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	true	use.refresh.tokens
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	exclude.session.state.from.auth.response
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	oidc.ciba.grant.enabled
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	saml.artifact.binding
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	true	backchannel.logout.session.required
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	client_credentials.use_refresh_token
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	saml_force_name_id_format
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	saml.client.signature
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	tls.client.certificate.bound.access.tokens
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	require.pushed.authorization.requests
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	saml.authnstatement
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	display.on.consent.screen
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	false	saml.onetimeuse.condition
789fed9d-e369-41db-92d9-5058e21fdd6d	false	saml.assertion.signature
789fed9d-e369-41db-92d9-5058e21fdd6d	false	id.token.as.detached.signature
789fed9d-e369-41db-92d9-5058e21fdd6d	false	saml.multivalued.roles
789fed9d-e369-41db-92d9-5058e21fdd6d	false	saml.force.post.binding
789fed9d-e369-41db-92d9-5058e21fdd6d	false	saml.encrypt
789fed9d-e369-41db-92d9-5058e21fdd6d	false	oauth2.device.authorization.grant.enabled
789fed9d-e369-41db-92d9-5058e21fdd6d	false	saml.server.signature
789fed9d-e369-41db-92d9-5058e21fdd6d	false	backchannel.logout.revoke.offline.tokens
789fed9d-e369-41db-92d9-5058e21fdd6d	false	saml.server.signature.keyinfo.ext
789fed9d-e369-41db-92d9-5058e21fdd6d	true	use.refresh.tokens
789fed9d-e369-41db-92d9-5058e21fdd6d	false	exclude.session.state.from.auth.response
789fed9d-e369-41db-92d9-5058e21fdd6d	false	oidc.ciba.grant.enabled
789fed9d-e369-41db-92d9-5058e21fdd6d	false	saml.artifact.binding
789fed9d-e369-41db-92d9-5058e21fdd6d	false	backchannel.logout.session.required
789fed9d-e369-41db-92d9-5058e21fdd6d	false	client_credentials.use_refresh_token
789fed9d-e369-41db-92d9-5058e21fdd6d	false	saml_force_name_id_format
789fed9d-e369-41db-92d9-5058e21fdd6d	false	saml.client.signature
789fed9d-e369-41db-92d9-5058e21fdd6d	false	tls.client.certificate.bound.access.tokens
789fed9d-e369-41db-92d9-5058e21fdd6d	false	require.pushed.authorization.requests
789fed9d-e369-41db-92d9-5058e21fdd6d	false	saml.authnstatement
789fed9d-e369-41db-92d9-5058e21fdd6d	false	display.on.consent.screen
789fed9d-e369-41db-92d9-5058e21fdd6d	false	saml.onetimeuse.condition
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	saml.assertion.signature
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	id.token.as.detached.signature
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	saml.multivalued.roles
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	saml.force.post.binding
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	saml.encrypt
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	oauth2.device.authorization.grant.enabled
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	backchannel.logout.revoke.offline.tokens
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	saml.server.signature
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	saml.server.signature.keyinfo.ext
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	true	use.refresh.tokens
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	exclude.session.state.from.auth.response
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	oidc.ciba.grant.enabled
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	saml.artifact.binding
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	true	backchannel.logout.session.required
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	client_credentials.use_refresh_token
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	saml_force_name_id_format
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	saml.client.signature
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	tls.client.certificate.bound.access.tokens
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	require.pushed.authorization.requests
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	saml.authnstatement
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	display.on.consent.screen
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	false	saml.onetimeuse.condition
d5265cd8-d128-4dc9-8602-d49d1df0a86c	S256	pkce.code.challenge.method
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.client_scope (id, name, realm_id, description, protocol) FROM stdin;
f6f1e627-1516-492b-b944-b2b439d8b14d	offline_access	master	OpenID Connect built-in scope: offline_access	openid-connect
40241723-0925-42f6-b493-2d927e630745	role_list	master	SAML role list	saml
d1f04108-1dd3-4fb4-a9c6-8d82d46769d2	profile	master	OpenID Connect built-in scope: profile	openid-connect
d48ebb40-f04c-4e49-a592-adcf9c89748c	email	master	OpenID Connect built-in scope: email	openid-connect
f6117e46-8f84-4562-b02b-a454870093f2	address	master	OpenID Connect built-in scope: address	openid-connect
fcccf8cf-5e6d-434b-b681-4a9fc4295e23	phone	master	OpenID Connect built-in scope: phone	openid-connect
3fdddfbd-f44d-45db-b4ec-ea8ba26436a9	roles	master	OpenID Connect scope for add user roles to the access token	openid-connect
384d1be6-14dd-4438-8de2-765a4c8b841e	web-origins	master	OpenID Connect scope for add allowed web origins to the access token	openid-connect
b0e34d62-4ec6-422d-9992-7bf5ce09df18	microprofile-jwt	master	Microprofile - JWT built-in scope	openid-connect
13834c57-9211-4e3e-b892-0632a3c15225	phone	CX-Central	OpenID Connect built-in scope: phone	openid-connect
23e5acb7-2d8c-4bca-8565-36fb57ee7ee0	role_list	CX-Central	SAML role list	saml
fc35a8f5-fedd-4b66-b3fa-9427e3947dc5	roles	CX-Central	OpenID Connect scope for add user roles to the access token	openid-connect
09dc23a3-1b9f-4b9d-aa87-e875f0f20655	address	CX-Central	OpenID Connect built-in scope: address	openid-connect
34a2f332-9752-4a7f-9d61-b4dbd40946b4	microprofile-jwt	CX-Central	Microprofile - JWT built-in scope	openid-connect
e24a7d06-7406-4b2f-854e-a5653f8b964f	profile	CX-Central	OpenID Connect built-in scope: profile	openid-connect
99ca536c-58c2-432f-904e-10926bbc207b	offline_access	CX-Central	OpenID Connect built-in scope: offline_access	openid-connect
8a14f08a-0ba9-44ae-83bd-5a65b9d0fe8c	email	CX-Central	OpenID Connect built-in scope: email	openid-connect
2629904c-d708-4072-9fe4-98e4a30c7dde	web-origins	CX-Central	OpenID Connect scope for add allowed web origins to the access token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.client_scope_attributes (scope_id, value, name) FROM stdin;
f6f1e627-1516-492b-b944-b2b439d8b14d	true	display.on.consent.screen
f6f1e627-1516-492b-b944-b2b439d8b14d	${offlineAccessScopeConsentText}	consent.screen.text
40241723-0925-42f6-b493-2d927e630745	true	display.on.consent.screen
40241723-0925-42f6-b493-2d927e630745	${samlRoleListScopeConsentText}	consent.screen.text
d1f04108-1dd3-4fb4-a9c6-8d82d46769d2	true	display.on.consent.screen
d1f04108-1dd3-4fb4-a9c6-8d82d46769d2	${profileScopeConsentText}	consent.screen.text
d1f04108-1dd3-4fb4-a9c6-8d82d46769d2	true	include.in.token.scope
d48ebb40-f04c-4e49-a592-adcf9c89748c	true	display.on.consent.screen
d48ebb40-f04c-4e49-a592-adcf9c89748c	${emailScopeConsentText}	consent.screen.text
d48ebb40-f04c-4e49-a592-adcf9c89748c	true	include.in.token.scope
f6117e46-8f84-4562-b02b-a454870093f2	true	display.on.consent.screen
f6117e46-8f84-4562-b02b-a454870093f2	${addressScopeConsentText}	consent.screen.text
f6117e46-8f84-4562-b02b-a454870093f2	true	include.in.token.scope
fcccf8cf-5e6d-434b-b681-4a9fc4295e23	true	display.on.consent.screen
fcccf8cf-5e6d-434b-b681-4a9fc4295e23	${phoneScopeConsentText}	consent.screen.text
fcccf8cf-5e6d-434b-b681-4a9fc4295e23	true	include.in.token.scope
3fdddfbd-f44d-45db-b4ec-ea8ba26436a9	true	display.on.consent.screen
3fdddfbd-f44d-45db-b4ec-ea8ba26436a9	${rolesScopeConsentText}	consent.screen.text
3fdddfbd-f44d-45db-b4ec-ea8ba26436a9	false	include.in.token.scope
384d1be6-14dd-4438-8de2-765a4c8b841e	false	display.on.consent.screen
384d1be6-14dd-4438-8de2-765a4c8b841e		consent.screen.text
384d1be6-14dd-4438-8de2-765a4c8b841e	false	include.in.token.scope
b0e34d62-4ec6-422d-9992-7bf5ce09df18	false	display.on.consent.screen
b0e34d62-4ec6-422d-9992-7bf5ce09df18	true	include.in.token.scope
13834c57-9211-4e3e-b892-0632a3c15225	true	include.in.token.scope
13834c57-9211-4e3e-b892-0632a3c15225	true	display.on.consent.screen
13834c57-9211-4e3e-b892-0632a3c15225	${phoneScopeConsentText}	consent.screen.text
23e5acb7-2d8c-4bca-8565-36fb57ee7ee0	${samlRoleListScopeConsentText}	consent.screen.text
23e5acb7-2d8c-4bca-8565-36fb57ee7ee0	true	display.on.consent.screen
fc35a8f5-fedd-4b66-b3fa-9427e3947dc5	false	include.in.token.scope
fc35a8f5-fedd-4b66-b3fa-9427e3947dc5	true	display.on.consent.screen
fc35a8f5-fedd-4b66-b3fa-9427e3947dc5	${rolesScopeConsentText}	consent.screen.text
09dc23a3-1b9f-4b9d-aa87-e875f0f20655	true	include.in.token.scope
09dc23a3-1b9f-4b9d-aa87-e875f0f20655	true	display.on.consent.screen
09dc23a3-1b9f-4b9d-aa87-e875f0f20655	${addressScopeConsentText}	consent.screen.text
34a2f332-9752-4a7f-9d61-b4dbd40946b4	true	include.in.token.scope
34a2f332-9752-4a7f-9d61-b4dbd40946b4	false	display.on.consent.screen
e24a7d06-7406-4b2f-854e-a5653f8b964f	true	include.in.token.scope
e24a7d06-7406-4b2f-854e-a5653f8b964f	true	display.on.consent.screen
e24a7d06-7406-4b2f-854e-a5653f8b964f	${profileScopeConsentText}	consent.screen.text
99ca536c-58c2-432f-904e-10926bbc207b	${offlineAccessScopeConsentText}	consent.screen.text
99ca536c-58c2-432f-904e-10926bbc207b	true	display.on.consent.screen
8a14f08a-0ba9-44ae-83bd-5a65b9d0fe8c	true	include.in.token.scope
8a14f08a-0ba9-44ae-83bd-5a65b9d0fe8c	true	display.on.consent.screen
8a14f08a-0ba9-44ae-83bd-5a65b9d0fe8c	${emailScopeConsentText}	consent.screen.text
2629904c-d708-4072-9fe4-98e4a30c7dde	false	include.in.token.scope
2629904c-d708-4072-9fe4-98e4a30c7dde	false	display.on.consent.screen
2629904c-d708-4072-9fe4-98e4a30c7dde		consent.screen.text
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
fd3d118a-2d23-4836-b8e3-383fee4ffeea	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2	t
fd3d118a-2d23-4836-b8e3-383fee4ffeea	3fdddfbd-f44d-45db-b4ec-ea8ba26436a9	t
fd3d118a-2d23-4836-b8e3-383fee4ffeea	384d1be6-14dd-4438-8de2-765a4c8b841e	t
fd3d118a-2d23-4836-b8e3-383fee4ffeea	d48ebb40-f04c-4e49-a592-adcf9c89748c	t
fd3d118a-2d23-4836-b8e3-383fee4ffeea	b0e34d62-4ec6-422d-9992-7bf5ce09df18	f
fd3d118a-2d23-4836-b8e3-383fee4ffeea	fcccf8cf-5e6d-434b-b681-4a9fc4295e23	f
fd3d118a-2d23-4836-b8e3-383fee4ffeea	f6f1e627-1516-492b-b944-b2b439d8b14d	f
fd3d118a-2d23-4836-b8e3-383fee4ffeea	f6117e46-8f84-4562-b02b-a454870093f2	f
5d7b9a9b-4ec1-4fa8-a4d4-41877e7e20e6	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2	t
5d7b9a9b-4ec1-4fa8-a4d4-41877e7e20e6	3fdddfbd-f44d-45db-b4ec-ea8ba26436a9	t
5d7b9a9b-4ec1-4fa8-a4d4-41877e7e20e6	384d1be6-14dd-4438-8de2-765a4c8b841e	t
5d7b9a9b-4ec1-4fa8-a4d4-41877e7e20e6	d48ebb40-f04c-4e49-a592-adcf9c89748c	t
5d7b9a9b-4ec1-4fa8-a4d4-41877e7e20e6	b0e34d62-4ec6-422d-9992-7bf5ce09df18	f
5d7b9a9b-4ec1-4fa8-a4d4-41877e7e20e6	fcccf8cf-5e6d-434b-b681-4a9fc4295e23	f
5d7b9a9b-4ec1-4fa8-a4d4-41877e7e20e6	f6f1e627-1516-492b-b944-b2b439d8b14d	f
5d7b9a9b-4ec1-4fa8-a4d4-41877e7e20e6	f6117e46-8f84-4562-b02b-a454870093f2	f
db4a211d-97fd-4786-b830-84fba6e855fc	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2	t
db4a211d-97fd-4786-b830-84fba6e855fc	3fdddfbd-f44d-45db-b4ec-ea8ba26436a9	t
db4a211d-97fd-4786-b830-84fba6e855fc	384d1be6-14dd-4438-8de2-765a4c8b841e	t
db4a211d-97fd-4786-b830-84fba6e855fc	d48ebb40-f04c-4e49-a592-adcf9c89748c	t
db4a211d-97fd-4786-b830-84fba6e855fc	b0e34d62-4ec6-422d-9992-7bf5ce09df18	f
db4a211d-97fd-4786-b830-84fba6e855fc	fcccf8cf-5e6d-434b-b681-4a9fc4295e23	f
db4a211d-97fd-4786-b830-84fba6e855fc	f6f1e627-1516-492b-b944-b2b439d8b14d	f
db4a211d-97fd-4786-b830-84fba6e855fc	f6117e46-8f84-4562-b02b-a454870093f2	f
ee809656-0126-4c36-a293-bb2d01dd6416	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2	t
ee809656-0126-4c36-a293-bb2d01dd6416	3fdddfbd-f44d-45db-b4ec-ea8ba26436a9	t
ee809656-0126-4c36-a293-bb2d01dd6416	384d1be6-14dd-4438-8de2-765a4c8b841e	t
ee809656-0126-4c36-a293-bb2d01dd6416	d48ebb40-f04c-4e49-a592-adcf9c89748c	t
ee809656-0126-4c36-a293-bb2d01dd6416	b0e34d62-4ec6-422d-9992-7bf5ce09df18	f
ee809656-0126-4c36-a293-bb2d01dd6416	fcccf8cf-5e6d-434b-b681-4a9fc4295e23	f
ee809656-0126-4c36-a293-bb2d01dd6416	f6f1e627-1516-492b-b944-b2b439d8b14d	f
ee809656-0126-4c36-a293-bb2d01dd6416	f6117e46-8f84-4562-b02b-a454870093f2	f
e3c1a1a8-743b-4df9-887e-cad92ccb7620	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2	t
e3c1a1a8-743b-4df9-887e-cad92ccb7620	3fdddfbd-f44d-45db-b4ec-ea8ba26436a9	t
e3c1a1a8-743b-4df9-887e-cad92ccb7620	384d1be6-14dd-4438-8de2-765a4c8b841e	t
e3c1a1a8-743b-4df9-887e-cad92ccb7620	d48ebb40-f04c-4e49-a592-adcf9c89748c	t
e3c1a1a8-743b-4df9-887e-cad92ccb7620	b0e34d62-4ec6-422d-9992-7bf5ce09df18	f
e3c1a1a8-743b-4df9-887e-cad92ccb7620	fcccf8cf-5e6d-434b-b681-4a9fc4295e23	f
e3c1a1a8-743b-4df9-887e-cad92ccb7620	f6f1e627-1516-492b-b944-b2b439d8b14d	f
e3c1a1a8-743b-4df9-887e-cad92ccb7620	f6117e46-8f84-4562-b02b-a454870093f2	f
d2280ca6-3454-407a-9683-f39e2a3031dc	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2	t
d2280ca6-3454-407a-9683-f39e2a3031dc	3fdddfbd-f44d-45db-b4ec-ea8ba26436a9	t
d2280ca6-3454-407a-9683-f39e2a3031dc	384d1be6-14dd-4438-8de2-765a4c8b841e	t
d2280ca6-3454-407a-9683-f39e2a3031dc	d48ebb40-f04c-4e49-a592-adcf9c89748c	t
d2280ca6-3454-407a-9683-f39e2a3031dc	b0e34d62-4ec6-422d-9992-7bf5ce09df18	f
d2280ca6-3454-407a-9683-f39e2a3031dc	fcccf8cf-5e6d-434b-b681-4a9fc4295e23	f
d2280ca6-3454-407a-9683-f39e2a3031dc	f6f1e627-1516-492b-b944-b2b439d8b14d	f
d2280ca6-3454-407a-9683-f39e2a3031dc	f6117e46-8f84-4562-b02b-a454870093f2	f
60313b78-e131-4358-9817-163ee938cc59	2629904c-d708-4072-9fe4-98e4a30c7dde	t
60313b78-e131-4358-9817-163ee938cc59	fc35a8f5-fedd-4b66-b3fa-9427e3947dc5	t
60313b78-e131-4358-9817-163ee938cc59	8a14f08a-0ba9-44ae-83bd-5a65b9d0fe8c	t
60313b78-e131-4358-9817-163ee938cc59	09dc23a3-1b9f-4b9d-aa87-e875f0f20655	f
60313b78-e131-4358-9817-163ee938cc59	13834c57-9211-4e3e-b892-0632a3c15225	f
60313b78-e131-4358-9817-163ee938cc59	99ca536c-58c2-432f-904e-10926bbc207b	f
60313b78-e131-4358-9817-163ee938cc59	34a2f332-9752-4a7f-9d61-b4dbd40946b4	f
2d37c8a9-7036-4e36-a085-12fec6e22938	2629904c-d708-4072-9fe4-98e4a30c7dde	t
2d37c8a9-7036-4e36-a085-12fec6e22938	fc35a8f5-fedd-4b66-b3fa-9427e3947dc5	t
2d37c8a9-7036-4e36-a085-12fec6e22938	e24a7d06-7406-4b2f-854e-a5653f8b964f	t
2d37c8a9-7036-4e36-a085-12fec6e22938	8a14f08a-0ba9-44ae-83bd-5a65b9d0fe8c	t
2d37c8a9-7036-4e36-a085-12fec6e22938	09dc23a3-1b9f-4b9d-aa87-e875f0f20655	f
2d37c8a9-7036-4e36-a085-12fec6e22938	13834c57-9211-4e3e-b892-0632a3c15225	f
2d37c8a9-7036-4e36-a085-12fec6e22938	99ca536c-58c2-432f-904e-10926bbc207b	f
2d37c8a9-7036-4e36-a085-12fec6e22938	34a2f332-9752-4a7f-9d61-b4dbd40946b4	f
38d072af-d85b-4b39-ad55-13ed5ce45791	2629904c-d708-4072-9fe4-98e4a30c7dde	t
38d072af-d85b-4b39-ad55-13ed5ce45791	fc35a8f5-fedd-4b66-b3fa-9427e3947dc5	t
38d072af-d85b-4b39-ad55-13ed5ce45791	e24a7d06-7406-4b2f-854e-a5653f8b964f	t
38d072af-d85b-4b39-ad55-13ed5ce45791	8a14f08a-0ba9-44ae-83bd-5a65b9d0fe8c	t
38d072af-d85b-4b39-ad55-13ed5ce45791	09dc23a3-1b9f-4b9d-aa87-e875f0f20655	f
38d072af-d85b-4b39-ad55-13ed5ce45791	13834c57-9211-4e3e-b892-0632a3c15225	f
38d072af-d85b-4b39-ad55-13ed5ce45791	99ca536c-58c2-432f-904e-10926bbc207b	f
38d072af-d85b-4b39-ad55-13ed5ce45791	34a2f332-9752-4a7f-9d61-b4dbd40946b4	f
03885031-084a-4317-aa51-de9b4acf8fa9	2629904c-d708-4072-9fe4-98e4a30c7dde	t
03885031-084a-4317-aa51-de9b4acf8fa9	fc35a8f5-fedd-4b66-b3fa-9427e3947dc5	t
03885031-084a-4317-aa51-de9b4acf8fa9	e24a7d06-7406-4b2f-854e-a5653f8b964f	t
03885031-084a-4317-aa51-de9b4acf8fa9	8a14f08a-0ba9-44ae-83bd-5a65b9d0fe8c	t
03885031-084a-4317-aa51-de9b4acf8fa9	09dc23a3-1b9f-4b9d-aa87-e875f0f20655	f
03885031-084a-4317-aa51-de9b4acf8fa9	13834c57-9211-4e3e-b892-0632a3c15225	f
03885031-084a-4317-aa51-de9b4acf8fa9	99ca536c-58c2-432f-904e-10926bbc207b	f
03885031-084a-4317-aa51-de9b4acf8fa9	34a2f332-9752-4a7f-9d61-b4dbd40946b4	f
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	2629904c-d708-4072-9fe4-98e4a30c7dde	t
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	fc35a8f5-fedd-4b66-b3fa-9427e3947dc5	t
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	e24a7d06-7406-4b2f-854e-a5653f8b964f	t
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	8a14f08a-0ba9-44ae-83bd-5a65b9d0fe8c	t
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	09dc23a3-1b9f-4b9d-aa87-e875f0f20655	f
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	13834c57-9211-4e3e-b892-0632a3c15225	f
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	99ca536c-58c2-432f-904e-10926bbc207b	f
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	34a2f332-9752-4a7f-9d61-b4dbd40946b4	f
789fed9d-e369-41db-92d9-5058e21fdd6d	2629904c-d708-4072-9fe4-98e4a30c7dde	t
789fed9d-e369-41db-92d9-5058e21fdd6d	fc35a8f5-fedd-4b66-b3fa-9427e3947dc5	t
789fed9d-e369-41db-92d9-5058e21fdd6d	e24a7d06-7406-4b2f-854e-a5653f8b964f	t
789fed9d-e369-41db-92d9-5058e21fdd6d	8a14f08a-0ba9-44ae-83bd-5a65b9d0fe8c	t
789fed9d-e369-41db-92d9-5058e21fdd6d	09dc23a3-1b9f-4b9d-aa87-e875f0f20655	f
789fed9d-e369-41db-92d9-5058e21fdd6d	13834c57-9211-4e3e-b892-0632a3c15225	f
789fed9d-e369-41db-92d9-5058e21fdd6d	99ca536c-58c2-432f-904e-10926bbc207b	f
789fed9d-e369-41db-92d9-5058e21fdd6d	34a2f332-9752-4a7f-9d61-b4dbd40946b4	f
213ea3ce-b036-405f-8abd-3ee08ff72857	2629904c-d708-4072-9fe4-98e4a30c7dde	t
213ea3ce-b036-405f-8abd-3ee08ff72857	fc35a8f5-fedd-4b66-b3fa-9427e3947dc5	t
213ea3ce-b036-405f-8abd-3ee08ff72857	e24a7d06-7406-4b2f-854e-a5653f8b964f	t
213ea3ce-b036-405f-8abd-3ee08ff72857	8a14f08a-0ba9-44ae-83bd-5a65b9d0fe8c	t
213ea3ce-b036-405f-8abd-3ee08ff72857	09dc23a3-1b9f-4b9d-aa87-e875f0f20655	f
213ea3ce-b036-405f-8abd-3ee08ff72857	13834c57-9211-4e3e-b892-0632a3c15225	f
213ea3ce-b036-405f-8abd-3ee08ff72857	99ca536c-58c2-432f-904e-10926bbc207b	f
213ea3ce-b036-405f-8abd-3ee08ff72857	34a2f332-9752-4a7f-9d61-b4dbd40946b4	f
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	2629904c-d708-4072-9fe4-98e4a30c7dde	t
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	fc35a8f5-fedd-4b66-b3fa-9427e3947dc5	t
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	e24a7d06-7406-4b2f-854e-a5653f8b964f	t
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	8a14f08a-0ba9-44ae-83bd-5a65b9d0fe8c	t
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	09dc23a3-1b9f-4b9d-aa87-e875f0f20655	f
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	13834c57-9211-4e3e-b892-0632a3c15225	f
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	99ca536c-58c2-432f-904e-10926bbc207b	f
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	34a2f332-9752-4a7f-9d61-b4dbd40946b4	f
d5265cd8-d128-4dc9-8602-d49d1df0a86c	2629904c-d708-4072-9fe4-98e4a30c7dde	t
d5265cd8-d128-4dc9-8602-d49d1df0a86c	fc35a8f5-fedd-4b66-b3fa-9427e3947dc5	t
d5265cd8-d128-4dc9-8602-d49d1df0a86c	e24a7d06-7406-4b2f-854e-a5653f8b964f	t
d5265cd8-d128-4dc9-8602-d49d1df0a86c	8a14f08a-0ba9-44ae-83bd-5a65b9d0fe8c	t
d5265cd8-d128-4dc9-8602-d49d1df0a86c	09dc23a3-1b9f-4b9d-aa87-e875f0f20655	f
d5265cd8-d128-4dc9-8602-d49d1df0a86c	13834c57-9211-4e3e-b892-0632a3c15225	f
d5265cd8-d128-4dc9-8602-d49d1df0a86c	99ca536c-58c2-432f-904e-10926bbc207b	f
d5265cd8-d128-4dc9-8602-d49d1df0a86c	34a2f332-9752-4a7f-9d61-b4dbd40946b4	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.client_scope_role_mapping (scope_id, role_id) FROM stdin;
f6f1e627-1516-492b-b944-b2b439d8b14d	58f2e33d-f552-45a0-9df5-78c3f2b165e2
99ca536c-58c2-432f-904e-10926bbc207b	1ec798aa-cd95-43bd-9494-b1883e451fbb
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
f9bbd8b1-38a5-4e48-8507-0861a5c63de3	Trusted Hosts	master	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
7066ecff-1cdf-4dad-977b-d0443dda251b	Consent Required	master	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
7cebb956-2271-401a-bf6b-a004d5316b13	Full Scope Disabled	master	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
e2f6243e-e1f3-4d39-9ca5-3fe9ee33c461	Max Clients Limit	master	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
83dc67f9-e1d4-411f-9f3e-8c69c0b6324f	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
d854a149-e9e8-46b5-89be-1b731bbf7aed	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
c48a40c8-185b-46c7-a9f1-4010dfdc2b09	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
52bf630f-6020-4b08-9014-e3bb85c4f99d	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
7f222e07-c721-43b5-baba-ac695f292d3d	rsa-generated	master	rsa-generated	org.keycloak.keys.KeyProvider	master	\N
5f6e8f35-b508-4dcc-bca0-2adbcb1fa261	rsa-enc-generated	master	rsa-enc-generated	org.keycloak.keys.KeyProvider	master	\N
37de6cbe-1637-4176-8cc4-337cf179f0d8	hmac-generated	master	hmac-generated	org.keycloak.keys.KeyProvider	master	\N
776a4e27-cbd9-4555-85fa-df1ddae693f6	aes-generated	master	aes-generated	org.keycloak.keys.KeyProvider	master	\N
ab25cbe7-60bc-49ed-aa4a-707f84a70893	Max Clients Limit	CX-Central	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	CX-Central	anonymous
277b586e-0b26-40e9-90d1-e76305d69a10	Consent Required	CX-Central	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	CX-Central	anonymous
552bd2e5-c656-4796-8d61-b87c3508aab5	Trusted Hosts	CX-Central	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	CX-Central	anonymous
de1bbb33-9e18-4fc1-9ea3-1fd8ad22eae9	Allowed Protocol Mapper Types	CX-Central	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	CX-Central	authenticated
b521525f-30e3-4b93-b42b-8c0dd53fc3af	Full Scope Disabled	CX-Central	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	CX-Central	anonymous
a4df1d6a-2c46-44f4-9d06-62eb9b754bab	Allowed Protocol Mapper Types	CX-Central	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	CX-Central	anonymous
f7e25fe0-dfe5-451a-8f54-ceea0cf201b4	Allowed Client Scopes	CX-Central	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	CX-Central	anonymous
d15d2dae-9c9c-4c7d-83f3-726f29194489	Allowed Client Scopes	CX-Central	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	CX-Central	authenticated
9fd3a6a3-e143-403f-baac-129f937b4cf1	\N	CX-Central	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	CX-Central	\N
2bd55ad0-2f32-40f3-9749-c2d422fb697d	hmac-generated	CX-Central	hmac-generated	org.keycloak.keys.KeyProvider	CX-Central	\N
676a20ad-a79d-4175-998a-672bf4826e92	rsa-enc-generated	CX-Central	rsa-enc-generated	org.keycloak.keys.KeyProvider	CX-Central	\N
50220023-09bf-443a-a8b3-f306279cbb5b	rsa-generated	CX-Central	rsa-generated	org.keycloak.keys.KeyProvider	CX-Central	\N
a510d16e-c3f7-4a88-b853-625a2cd357b4	aes-generated	CX-Central	aes-generated	org.keycloak.keys.KeyProvider	CX-Central	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.component_config (id, component_id, name, value) FROM stdin;
65ee0c75-ca56-44be-876b-775da79c37af	f9bbd8b1-38a5-4e48-8507-0861a5c63de3	host-sending-registration-request-must-match	true
01165dc3-d5f5-4b11-8086-452b2f3087f4	f9bbd8b1-38a5-4e48-8507-0861a5c63de3	client-uris-must-match	true
26924e3b-99ca-4c4c-8d9b-dc8c7c3ce5e1	d854a149-e9e8-46b5-89be-1b731bbf7aed	allow-default-scopes	true
06e56ea8-e97d-442a-aafc-cb0e4f8f3d5a	e2f6243e-e1f3-4d39-9ca5-3fe9ee33c461	max-clients	200
10a25f4a-86d2-4be3-aea7-734a7a3358f2	c48a40c8-185b-46c7-a9f1-4010dfdc2b09	allowed-protocol-mapper-types	saml-user-attribute-mapper
3d0493fe-b189-4832-ba5a-f244f3b510b5	c48a40c8-185b-46c7-a9f1-4010dfdc2b09	allowed-protocol-mapper-types	saml-user-property-mapper
66612803-cd44-4179-9219-54e3d5911ed8	c48a40c8-185b-46c7-a9f1-4010dfdc2b09	allowed-protocol-mapper-types	oidc-full-name-mapper
87c643b7-afd6-47bf-a3d2-a06870bb682b	c48a40c8-185b-46c7-a9f1-4010dfdc2b09	allowed-protocol-mapper-types	saml-role-list-mapper
4d7aabdf-99eb-47d5-a42f-8cc8f8398309	c48a40c8-185b-46c7-a9f1-4010dfdc2b09	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
49aa1b8b-4f99-430b-937b-ca8156f81cdd	c48a40c8-185b-46c7-a9f1-4010dfdc2b09	allowed-protocol-mapper-types	oidc-address-mapper
44e6d52b-65ac-4140-a74c-c02f5e8a104a	c48a40c8-185b-46c7-a9f1-4010dfdc2b09	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
daa0d4f4-e72d-4d1d-a7a9-0b36bbdc7ffd	c48a40c8-185b-46c7-a9f1-4010dfdc2b09	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
543c5010-a60f-4e33-ab88-9d7d34b923fe	83dc67f9-e1d4-411f-9f3e-8c69c0b6324f	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
af1422b0-7253-4101-bbfb-01f7a47d5b2c	83dc67f9-e1d4-411f-9f3e-8c69c0b6324f	allowed-protocol-mapper-types	oidc-full-name-mapper
ff56a4f1-61c3-478f-b71a-d203f7c3b644	83dc67f9-e1d4-411f-9f3e-8c69c0b6324f	allowed-protocol-mapper-types	saml-user-attribute-mapper
9b40d017-7ccc-4a77-bc8b-7152ac56dcc2	83dc67f9-e1d4-411f-9f3e-8c69c0b6324f	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
90035462-e1c4-4746-8aa3-91fc7db11b24	83dc67f9-e1d4-411f-9f3e-8c69c0b6324f	allowed-protocol-mapper-types	saml-user-property-mapper
2b0597c7-61c7-4597-b8c4-66289fe05ff5	83dc67f9-e1d4-411f-9f3e-8c69c0b6324f	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
5c2ec417-fdd8-4476-9f4d-2651ac9d7387	83dc67f9-e1d4-411f-9f3e-8c69c0b6324f	allowed-protocol-mapper-types	saml-role-list-mapper
717d2d06-3a11-409b-b659-40338c4198c0	83dc67f9-e1d4-411f-9f3e-8c69c0b6324f	allowed-protocol-mapper-types	oidc-address-mapper
2864d35f-d05a-4b1b-a715-d5d0447967fa	52bf630f-6020-4b08-9014-e3bb85c4f99d	allow-default-scopes	true
98630d9c-1e7c-4511-bd2d-48a02a353000	37de6cbe-1637-4176-8cc4-337cf179f0d8	priority	100
33fdc36c-baab-4c5c-8d69-5904cc9f36b7	37de6cbe-1637-4176-8cc4-337cf179f0d8	kid	b5549ca3-c011-48fa-9622-e627669b7716
dbeaca8a-ca71-487a-9c9b-ded605ee0713	37de6cbe-1637-4176-8cc4-337cf179f0d8	secret	qbjP7l_XTFRdp83dLWuhwdPYKhCUWqjTeO13oa8XDefoXuKcs-CVxgvRhg1yIYpryG41ALPb0t_whqN5ANn48Q
5658d56d-b4ae-4fcf-a826-c5afd828ca07	37de6cbe-1637-4176-8cc4-337cf179f0d8	algorithm	HS256
068fa6c2-773d-4c5b-aff4-b307dc442460	7f222e07-c721-43b5-baba-ac695f292d3d	privateKey	MIIEogIBAAKCAQEArcBP0ZYHEXymSrcEtDSlkpNDa5nYN/hjyk6YXJEL6e73MHr83CN0+u4+7NWJ3KNRdeG7eEAmoJA6P49OhBMqmeHj5RSUcZJLEwT1lSwI0tZ00EHADy/Sll/9x0wQLds3FHdb9/cyMft5yqJJn/uXImqmvIOXplAcGo8yeaPhQHAVjRamn6+ZB2OCUuUr905GgjsJNMAqe7nLP+wBN3sG5rke95KtRdmM04a2zIvNbK9bYoiCZHFEAFcKCyobczbtK/1VAIZgzGO6PbAHYsesFEKxwQzTlrQxzZ72Ln1eY6Ic5boObBbh1ifHCZhiJawSpWU54aOMfRDspVln5Cu3QwIDAQABAoIBAGuRyljZZ1reLx3GnTTr+y352h29y20rbKyNaCq26gdUmNj865tmoD/STEbYFVfyDLbMoAHcxY1WfZloIZYHP7KxdSQYT6bYiX4m7dwCvRu7BesBKeS9GMVcfINshf+93iXfl6K2+e6T4F0hiC9x1anLGZtQZQzkP+H5kahZW1VGiej1XOh3EwXtBsWDThobhOqJ2a2WZ/ap1ZDc/ya0cv86FIPCv0iLY80l3Lz93ptCOXrj9uAP8lnMOsjkvDkdvsq0+sjLrmCUND+5ArikoSltgLj40QwaEpLfmvye8+asWa8ZvTUVETp4B9YAeNLCQo/Z7HSfJ+58cl1hUWFKyXECgYEA2dhLnLpYytXLeVgLwsT59Jjq05MEpyNgyIKTYooAeorazJ+ee1Mkcpfmc+NFtbGSm6wlaI38DlLejhHhLBoXcqcQL75LUy/w+Gu/ncGjX2K/gUKtsaPOfHD33s8I4NrF/WS+CGpdV5sUVbXHponc1sUwPV2cK7IBdQHWnQrMCJ0CgYEAzC7y5xTS/c+rt1g9y/5q44VNtad8dYu+7qiVodjNThYnnSy9HpuVCR5Gy0DVJ+nyz8G1tLJpvImhFplSMLCY9iTY664U5hZHvyH5FDoP27DNNgfE8SIPS8+ywIcuBeWh71qAGo7KOF/ww5PKlQzRVTn8zhZY/mffkruNTJSTCV8CgYBqJ7yw4x3huc0tlHomr1Yem2XTNBFQYS0IiJjJq/YPwRpeHGpeLmXUcbEbR+TwZVfMBFc2W/o4AKnzEUNo+k3y0PZSTajnILWMWPVHKtUx5izsEFIT/n7gpSwkpz7sU6+nizAPacWSqz99hNeFkCjNf8nCHZu8r0GGgx7R6DEFAQKBgFa7ApbBs7X4RpqEsws5sLGgaBfnYuiTSbEajyTGcL7gjkcnP9YGhFHxOGURzvk7WNaDE+oDdwKM+44b5lukR/UWRcYmld3+TM+VYLYEy8On4CM5PaCntROgz+8T/KqolhaTvKKLUL6NkjmhR4X0gd7P2OC5gWffO4qafDSxT5vFAoGARoA1DxSr1Vty463SLOgB0AIiO0PLZvCEnuG2L9lL7SEw5h320n5IxY2NS+Q312/+L4TfdpnPMVmRo2+0H/0JLM1ctY75u8fz/c7hr0txOG8MVU7bFzE+0oSxWH2JLHPawQy8tVgqsZiIQECs3QVZUsflAGxA05v+2SmZFIKgK6I=
d954e547-59a7-40ae-baf4-ac79b007ff50	7f222e07-c721-43b5-baba-ac695f292d3d	certificate	MIICmzCCAYMCBgF/z5eHdDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwMzI4MDgxMzA4WhcNMzIwMzI4MDgxNDQ4WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCtwE/RlgcRfKZKtwS0NKWSk0Nrmdg3+GPKTphckQvp7vcwevzcI3T67j7s1Ynco1F14bt4QCagkDo/j06EEyqZ4ePlFJRxkksTBPWVLAjS1nTQQcAPL9KWX/3HTBAt2zcUd1v39zIx+3nKokmf+5ciaqa8g5emUBwajzJ5o+FAcBWNFqafr5kHY4JS5Sv3TkaCOwk0wCp7ucs/7AE3ewbmuR73kq1F2YzThrbMi81sr1tiiIJkcUQAVwoLKhtzNu0r/VUAhmDMY7o9sAdix6wUQrHBDNOWtDHNnvYufV5johzlug5sFuHWJ8cJmGIlrBKlZTnho4x9EOylWWfkK7dDAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAD7is1xU987SVCqpKq0OsuxVAZrCb2llto7dLXr775Wo7Hg4dtghFBWbfXq4quNS8tloONifkkKtd3koGQQ61aQD68MmDji3yh6tbQAS4NQ8kyXBUsJJ32xDOOjqXLJOcVGidyL3y5ke4ahEfaR9OVxscR0vEu4ZnqUkcwFvR5y01IMucH8PJeVmy5fiB2xbEHvcOt1vGxfLESYAUYvPSq3hYlNTr9M7gzRG8G+ylk5VfbfLT8l1Fg/Og1XElMAqQJJ3wIzEqMB9pJoAYcxpzJ5sLdf9Qwpc1oeQ7Hx7Zq+VN03dSWp2f3Lu5pK3o91Tre4u1iYoJsA3wX2MxyD/gIk=
07353bc2-7668-4e72-ac11-06912057eef2	7f222e07-c721-43b5-baba-ac695f292d3d	priority	100
75b35d5c-d499-4cce-92e6-685de7ce0612	7f222e07-c721-43b5-baba-ac695f292d3d	keyUse	SIG
9208e4fd-83e3-4f72-b063-20a7f4319e34	5f6e8f35-b508-4dcc-bca0-2adbcb1fa261	certificate	MIICmzCCAYMCBgF/z5eNwTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwMzI4MDgxMzEwWhcNMzIwMzI4MDgxNDUwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCQKeLfPyU+Uf28nOZaz+7IRqw3g6q+VPHeUG7NeY4WwAeFw8ph/+nj1EcqQ3BMwOWdR3Ow2CWg3fXBFLiaVbHjzX2ID/9OZwE/dM3wjQrnStaqyqW6DJKJPQ5bycIKtVaifwLAp9bGQoz1EyoBKMP4xQxtyX6wcuAFJFqKwoqUmRe9V8I7v+YpiSsFDSi4QWeS7iHAFZZBUsL/mcvD/jnYzC+ff7ubtH+YMg5kEkwVQdifKTBHax6DC94g4kb3iJ+TrFvP3ceAAJOMPXUAfTC2+bHHScdzP0LG32keu5w8W5qtbMoeqEdlIhVNiBiCwSwETWWGkSgomU1BWgF4pSJ3AgMBAAEwDQYJKoZIhvcNAQELBQADggEBADNcEEhGWpDivWTOVDfUgNVrBy/0SOL+9seYNMXgk7pz/cTUek0CapP3pqsgaOHEOn2wu+FnCLXuCrr25DAafe+d38NpbecE04tfr1h90cdfaFwWU1U+QoOVJlVvielaczTnSXe81w8V1Y99R24rxwaAevfWdmXNpQkgCwB6O1ZB5Vsx4UPReZffpY8n6Axb0hYN192soU/e3c536e/YEDm3EityRVcQ2AgTDMm1pQ50u1rKeJ6oID4t7FtEVwkFnE1pC7MPQntR0JRpNZFg6FdWTwtY4V6qou5ba2K8t0FHxn348wxygi8+uzP0XnSqQ1mjk+dWFH3dgDVfXPEJuOg=
06e31241-eb24-48b7-a6a1-0cf9d06cda52	5f6e8f35-b508-4dcc-bca0-2adbcb1fa261	priority	100
3c766f92-a08c-471a-ba68-a4c3fb30df67	5f6e8f35-b508-4dcc-bca0-2adbcb1fa261	algorithm	RSA-OAEP
9da3fb72-3d2c-41e3-83dc-4c1f19a5b1f1	5f6e8f35-b508-4dcc-bca0-2adbcb1fa261	keyUse	ENC
eecd4c0e-fa0b-4919-a24d-4c6aa6729a35	5f6e8f35-b508-4dcc-bca0-2adbcb1fa261	privateKey	MIIEogIBAAKCAQEAkCni3z8lPlH9vJzmWs/uyEasN4OqvlTx3lBuzXmOFsAHhcPKYf/p49RHKkNwTMDlnUdzsNgloN31wRS4mlWx4819iA//TmcBP3TN8I0K50rWqsqlugySiT0OW8nCCrVWon8CwKfWxkKM9RMqASjD+MUMbcl+sHLgBSRaisKKlJkXvVfCO7/mKYkrBQ0ouEFnku4hwBWWQVLC/5nLw/452Mwvn3+7m7R/mDIOZBJMFUHYnykwR2segwveIOJG94ifk6xbz93HgACTjD11AH0wtvmxx0nHcz9Cxt9pHrucPFuarWzKHqhHZSIVTYgYgsEsBE1lhpEoKJlNQVoBeKUidwIDAQABAoIBAAuM/5uJkK9cnGr3W1GdZXFwkC3mg9C6N6LraOVXvvW9rxydomKVwaS6hnUxcBcGQZ+HcRKTTviDsEQnJ99dzGIHPe6f8YHTqPrvneyPMHd1vJt0nzC3/ym11aevE7gN7YIZkRvklsXN4UNlpLDxFjqhdyx4v4jdu2tODV8e1UGwn4096Rh0gy4ebFCcGSWzqegFkjWAgkkV8uZGNBjDGtLg3Xz1wSH3Gsq6EVOe3NRTFYzNsRlQSbZBTzDUvqDCCfB9UyWFmoZlBLK/D/n99cyUtTf/ZJr27gio7J9TqEwPamCrZkQG11bQvy7hH+oHMi0P/01mQ5dtIzqxlT4pxHECgYEA1UdvqTY48/lHzub4IMqkdCyjOdrGNX7rLow0SjOvBSCpIUdvhASB9HN5ZxyGsXt8jMahFYZ+7WiykxBZJ1L9pgryA8X89X2/rwOLTFPVlIU4LnfxnrRSgtRGZxJHNwCu5L+wnTNjBDmEtCVbzXFVGfEUm3KkUp2MXdWXGAXBSU8CgYEArQpV+D3z+YT1PGDBbpxmg2GjSHibAO53LnMM2xM/xYPwI/MurtpqbQXFLiT4clJmrG4kQ48tFI5hBe0xcas8/D0NC8wF97HVfHVmzQRQpUjjgNaBbFkm6WhJ3mXzahLJA7vSwEcEjME7e/00+zQtad2u2bVEyMj6xG3qZ5WNelkCgYAiqxsGeW7mkaXPhxHcWrRCwiLCO8KuXXQjO90gFqijf7yeUTtaTVVGhCK+1Q87+GO1inASzKsDMlqctzKWxtG+VNckL+G/kfI/o6bYAGSeYM1SGGMpNgyXgaP0Cy+STEUhn9s4omq8/BCLK+txSLPZpKuB3S/C0iNH+Xk3CXBy1wKBgB0ffjSXiLZYEEYnKqcJH5/BERAjbEMN33Ur2+ALL1J40DPcu+Cl1f+fVv5bLo1fHPSsXOIZ+MZa6C1tLEMrRMpXJBj2L5LulTWrNLAQp9oJmHCYqZOotYnXCYeqtPsHSlmchO3jhfqCkxZdGUumDnag3sq5XWhFmx7wOOFSJEuRAoGAMMNIrXAi9X2Dn0m5t3tI5fuccja9smiAin3/sV5g/F+96ooDjelkM6lYjk/8VCPgmjFc3KKyLK8MVKzQ+nTIIXFIyIgz7bQHvRvqnaWvdhn7rIlY2zWs6YeBJTVN1JRVKMUreDQAiIcmcrcBT2pgyWpWJ0qYQlC80HznL2S3ciI=
eb73f524-b480-4cd7-a914-a0aa57cc15a1	776a4e27-cbd9-4555-85fa-df1ddae693f6	priority	100
3abb1fbd-96c4-4b86-9f82-78e03ee69726	776a4e27-cbd9-4555-85fa-df1ddae693f6	secret	baCjbsKI-D3eGtFQkURJ6A
ddf611f8-4d46-41d4-a27e-6738c3edb02c	776a4e27-cbd9-4555-85fa-df1ddae693f6	kid	2e3f0796-ea1d-4d78-acce-91d219096b4c
aa4c83af-f8d2-4ff1-b7b5-f53b62c9bb6b	ab25cbe7-60bc-49ed-aa4a-707f84a70893	max-clients	200
3a599340-9809-44e1-bf73-d1c04848092b	2bd55ad0-2f32-40f3-9749-c2d422fb697d	algorithm	HS256
ab403d7c-c3f5-4197-9939-5fe054cb9275	2bd55ad0-2f32-40f3-9749-c2d422fb697d	priority	100
d4cfe4ad-19dd-4248-8940-84617735df3f	2bd55ad0-2f32-40f3-9749-c2d422fb697d	secret	NlYl4arPV-qlOY-JhhJmG5s_pd55lJ5IUsP35mR2V58_9-aiCqGwrvSDr7afooM_QtvJzuxiuxnRvgchTZYUWQ
0f0143ac-5fc0-45a3-af8f-260f0906049a	2bd55ad0-2f32-40f3-9749-c2d422fb697d	kid	19caccca-88ac-47f4-a9b1-a7acd0ff1c70
7ce35898-a676-441d-a9b8-86c3eb353e4c	552bd2e5-c656-4796-8d61-b87c3508aab5	client-uris-must-match	true
ccc9f95b-945d-4c96-8ee1-ac6065f5b5d3	552bd2e5-c656-4796-8d61-b87c3508aab5	host-sending-registration-request-must-match	true
86ca7c69-ef95-4980-bd39-6ce0356b8e56	de1bbb33-9e18-4fc1-9ea3-1fd8ad22eae9	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
b56deabf-602e-47f2-8859-8433634bb941	de1bbb33-9e18-4fc1-9ea3-1fd8ad22eae9	allowed-protocol-mapper-types	oidc-full-name-mapper
12c64523-929c-40d4-a67f-2f40f96a528a	de1bbb33-9e18-4fc1-9ea3-1fd8ad22eae9	allowed-protocol-mapper-types	saml-user-attribute-mapper
513a5bbc-d568-463d-b052-184e73a5fe16	de1bbb33-9e18-4fc1-9ea3-1fd8ad22eae9	allowed-protocol-mapper-types	saml-user-property-mapper
35efbb94-fa26-49f0-ab1c-a4850d18100b	de1bbb33-9e18-4fc1-9ea3-1fd8ad22eae9	allowed-protocol-mapper-types	saml-role-list-mapper
67d6deac-0bd9-47a1-aace-3f52e30b40b8	de1bbb33-9e18-4fc1-9ea3-1fd8ad22eae9	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
1f67d1da-7b65-4961-a7b9-16da52e06ae9	de1bbb33-9e18-4fc1-9ea3-1fd8ad22eae9	allowed-protocol-mapper-types	oidc-address-mapper
b6124e27-85f3-4144-8503-afc7b59f471e	de1bbb33-9e18-4fc1-9ea3-1fd8ad22eae9	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
c858e53f-301f-43cb-a560-342e8bf1eaad	676a20ad-a79d-4175-998a-672bf4826e92	certificate	MIICozCCAYsCBgF/z5fVpDANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApDWC1DZW50cmFsMB4XDTIyMDMyODA4MTMyOFoXDTMyMDMyODA4MTUwOFowFTETMBEGA1UEAwwKQ1gtQ2VudHJhbDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJhpouV7Ph54LcvOMEWnkhfZuVBoSIltVyD2pS0LwgRVr9h5/lWCzdJcWfu9eVYK9pZpjP15G/qI7IwaFXjBu6fZc0NWffy7CLQ13q65km628ezDeiZ2lHXy3PWiHg6PEX7Q9D0CS2Xi8xrP6HTZvXr69Sbv6GBU4t3lBrkY3SgDnV+Ad+ex7EHBnytoanfVhF4YayEGzq6O94X4Z2hC1kEAzxWGCZr/zZRY/GPhrEopYMgsQdePBzO5oXWS/QH07uvbBHwf3GfN6eFfLu5fdDlgqbsaeSExV0mRQROeyauA9X8NIuTyEOSnmGFcfxaFMFV3A0B/kOl53ixkALrtyg0CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAkvKVUD2LqrDp0az4xz2yE9iGNWRqRe0CtrGKnfz93IeWfJ5cSiLdWDobNl7TprHqdNPqPGeEhONzxIwfOfMaLh7M/cUbT+IaQHxe9ILZMsY7jWRW7WWOO/RiwrjPS9t/YmTf0PYk6bY9XxHQHj5aNgDQmV91zLVLFPXgCTOQzGNXnLl4Tg84KafCIPQV++NKsaBOkBXq6hHuulcZcJ835q3wArxtrhNwPV8QMLCN2v5mW85jYy9AJvAXCXdYci971nHiut/fyBFqk23XqQ5ItwtOgOy5ZqOU1rQdSQ7bB1t2Lkk/nx98LpTHE9j9nKtRslpKXfabiyBTxyjcbtd+uQ==
b23aa1a4-b22b-41c2-a5f4-bc6d5deb6399	676a20ad-a79d-4175-998a-672bf4826e92	priority	100
f251db68-ef60-4144-99ab-166a73b0ee18	676a20ad-a79d-4175-998a-672bf4826e92	algorithm	RSA-OAEP
19d8c6b4-7278-4074-b6e5-7d029e62987c	676a20ad-a79d-4175-998a-672bf4826e92	privateKey	MIIEowIBAAKCAQEAmGmi5Xs+Hngty84wRaeSF9m5UGhIiW1XIPalLQvCBFWv2Hn+VYLN0lxZ+715Vgr2lmmM/Xkb+ojsjBoVeMG7p9lzQ1Z9/LsItDXerrmSbrbx7MN6JnaUdfLc9aIeDo8RftD0PQJLZeLzGs/odNm9evr1Ju/oYFTi3eUGuRjdKAOdX4B357HsQcGfK2hqd9WEXhhrIQbOro73hfhnaELWQQDPFYYJmv/NlFj8Y+GsSilgyCxB148HM7mhdZL9AfTu69sEfB/cZ83p4V8u7l90OWCpuxp5ITFXSZFBE57Jq4D1fw0i5PIQ5KeYYVx/FoUwVXcDQH+Q6XneLGQAuu3KDQIDAQABAoIBABwpuO4Knennbx7v1L+qPTanBrUy7+RlDeqLaO4v9AP1CW9I65RFfV7XrdD0rA0YLYSRsHnN/TuIPZ2N3FXaBqD3b3ML8m/W577VDXbf140ZxQ5o+JNO6hP5cpb5A/DQwvzaA6eaWvBSxXU44c1lxruIz/AH+LqENP+nqFxfmc4gw8eWE2lDI82n/uaa2tkuzxpoTemQ3xHNQx0uQ7NCEH5Nf8kyMDjfzB5zfikLWbn7ITXIW5Pdw03anqQ2oYeXh+xzaisQvM5FYjuxuhNp/Kh5JbQEuNr6hps3VjwbB/mPQjWCD+Zn4Jt8ZIUB6TqRqn2FA6kUtAXDPQv8Yhk2xoECgYEAz1xsQKoTnsMJps+RRaWsbjIfUMz4HBj5hMbg2bFyxWkcfL79qbT6G+B+wzMuHZxxfMejXg3rXfeE7ZTTda7OQla+jc3GP8892ekvL6768hDNPPWoTGSwG5GxMJ6y7jLwVtlB3C8Ibv+3FHO6xAw3OtfjrXeWcHIZZRfh5IyMjVECgYEAvCmuzzSvkoUbZhpFSt8QF/bMaDWOv2FyVlNV8FyCclTI1p1Zy5ptQcjUwaflg9O1ikQ7kyga0jY0L1C391FEs9rX6oQCb1YC7I8f75SKmbK/hK02CQ8hm1EYj488BEzSftZox0V/R24y2eT0l7of2jIIggG54LMXL6heziR30f0CgYBb37pC6FgrFoU3OG5IKoB8jo6bcUVYxaQANVG4gku0tb6ecszXHU1Xfp8Lg6iiDAeoXpe+e3JWPu3Riggq8xmGAQMKtypoaT0hSJTUjrW2/MTChqFbv5zbijC0twvWSBF+mWH52YjmDTyjvib45+SsmKzS1dJ83cDsrqkyZyd7EQKBgAUAXqMnVVthql7GZ/0bfMQGTVyfv9Gad32P7YLcEqOTWVtLB24ABtNu0Sjsm48re3HXanX45O2dfzmavakXQeo98OtM4vuun5lGHKUzn5OCStDuAbev7UbBmxOFzSSYHig87sANOtrdNQDRsyatTddw6QT7osM0P3OG2C5GjeDJAoGBAK9Zni4vBBD0nFvNMvlpzi3X3HV2wdGAu8quXahMHe7bdXj40mh2JPgV7B1gby1qKwc/JWDt6ptyejUsVN3rS33E6pnHguMTIvruC9YHjxZZgjYt0RAb8xVSv+jPpySreRF53Ie/dKDR1qvX3qm/2js4ejQJ+D0FIQOgb3IJYe8q
a757f01d-2c60-45f1-a992-7114f6916570	a4df1d6a-2c46-44f4-9d06-62eb9b754bab	allowed-protocol-mapper-types	oidc-address-mapper
043d9b7a-e114-4634-bbf8-7ca845cae9a3	a4df1d6a-2c46-44f4-9d06-62eb9b754bab	allowed-protocol-mapper-types	oidc-full-name-mapper
cfb3fdf2-0c0c-41fa-ba60-b7bbd75e6476	a4df1d6a-2c46-44f4-9d06-62eb9b754bab	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
dbd2b361-9f1a-4272-95f1-5e93db7c9c1a	a4df1d6a-2c46-44f4-9d06-62eb9b754bab	allowed-protocol-mapper-types	saml-user-attribute-mapper
9c239ce5-8f5a-4ae6-a596-c43d3d547704	a4df1d6a-2c46-44f4-9d06-62eb9b754bab	allowed-protocol-mapper-types	saml-user-property-mapper
50bd8d51-d161-435b-992b-d990d902b8b1	a4df1d6a-2c46-44f4-9d06-62eb9b754bab	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
e9491689-e7ce-41ff-a39a-84f313b9306b	a4df1d6a-2c46-44f4-9d06-62eb9b754bab	allowed-protocol-mapper-types	saml-role-list-mapper
c9c6e421-69bd-473f-bb9e-a106aedccb2c	a4df1d6a-2c46-44f4-9d06-62eb9b754bab	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
59f7c4be-a350-49f2-b945-47c28245d8cc	f7e25fe0-dfe5-451a-8f54-ceea0cf201b4	allow-default-scopes	true
3691c0ee-df70-4b13-996a-ff88a34ce8f5	50220023-09bf-443a-a8b3-f306279cbb5b	certificate	MIICozCCAYsCBgF/z5fWXzANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApDWC1DZW50cmFsMB4XDTIyMDMyODA4MTMyOFoXDTMyMDMyODA4MTUwOFowFTETMBEGA1UEAwwKQ1gtQ2VudHJhbDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAIPHLH4eumqUnWVn9f9cDu7jQpzKzJrrE0dcTlpk6xG3+20HqT85/H1/37glq1l8loDuLRCDB11APcS63y3FasKHSRJYO9gFqFKBIfWod4AXwvTkuOaG4CQpEawzQtM4sA40brvNo69h7X8gDrJxJ+6TP5jNRiYGKJwnV1DYkWUa2j6Nb86YsTmQNz8fcW/GT03HQkCXo/Jb3ZL+vYyTg2xRfKS3O9ISe3j2bPDYcgEmRFGIAZOhI3uuUfjlhmO+aur8EkLCLpnco25l3yoVhf0FPbr4oH1UuQGXSmO1VWyQbJrTwBVgBq5q2L0qQwwJcgswHyXbWq0ctlbbevDRNCcCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAAvXTIZ5WimcPsModpvGg4U18MzqL2z8lSsShJBjrwRq66c8H1+gJw6SRcr7Cu6+HiRKf4ColjSmjTlX755JtptQBUGX0j+6f/Hwvy/piCZIw4MqJBAzYcsQsLkgr65DhJUj6NFSlUXfBc5MBp+vVmgkMXD9mzY9a5WoHBIL4qog4X9vtr4ybWeTBcggKaaW/R0Tcbn5XFIJKF6tSOXnzMiiYeNbZkH1mJQpgyu4Bgqyvs+jex8WTpXA624shYAPB+GZtKEZcy1PcBBGkPA4kQUZ2ULFnqN+3oMKW5fNpCjc9nULsxI3g3ALa53yCZrYRlljB0UEyNk8vYRRD5ffNvA==
fbcf2c33-8f37-4531-8024-0ed5862ac20a	50220023-09bf-443a-a8b3-f306279cbb5b	privateKey	MIIEpAIBAAKCAQEAg8csfh66apSdZWf1/1wO7uNCnMrMmusTR1xOWmTrEbf7bQepPzn8fX/fuCWrWXyWgO4tEIMHXUA9xLrfLcVqwodJElg72AWoUoEh9ah3gBfC9OS45obgJCkRrDNC0ziwDjRuu82jr2HtfyAOsnEn7pM/mM1GJgYonCdXUNiRZRraPo1vzpixOZA3Px9xb8ZPTcdCQJej8lvdkv69jJODbFF8pLc70hJ7ePZs8NhyASZEUYgBk6Eje65R+OWGY75q6vwSQsIumdyjbmXfKhWF/QU9uvigfVS5AZdKY7VVbJBsmtPAFWAGrmrYvSpDDAlyCzAfJdtarRy2Vtt68NE0JwIDAQABAoIBAHv9CDj2cpHbmSiTo5sMJCTTAZcDHXZZ3n7TNAnLUH4QbOnOPol15sKycW4TS2DcX8OZ1h7mGiS8UCHtbhXj3SqBHdi72jrMP+64/5njU+Ta9p1zIyIMH5MGbVFnveV9PfFvlgzwVKWs70gggpOU8myAcWM1KV6Xhtg+D+LKkircuTDT/EUoH6La7OiHPY0s9VZXPIv5qxuezCQPo5mHcdpDfcKmiVc1nJdznTTTLZWQho4/RACo5w2AdB/S+YipMnyHJUKqoBL3a2SC35zl9kuAC3YgZZnip24FhNvEFH4nPy4WDyI+XewBbEremXf3ZBBaftgbkq2N9lkpeoANnukCgYEAyF0HN8/P34RxJSwvSJcsiFhOyNlySHXxHK4XOWBb7OzrPjSCeE8Z0ldJfT7Vg2KBPvxNVwmDBYOcHDv+6rFuhu71NtwFxbExI9PIjpbsSKUxAt1SpBX3GXkFogqlHpL69draUomPrGMtzg31FkM4rhoBLLYGDOBDctuJ2xjjxQ0CgYEAqF606l46YgJDl9t6/zl/M19Zv6wHQggG//hQYgd+/mjCYVYHb8VRdtSc2rx7/bMKfEKzifZVZqQdi5qv5I3v170ILqmSshQNVFHXDO391GfGHmsZG1PuV6mP2zdcZR9oEJPjNBhW2OIE1x7OqYqxCewqeqTlr990F/0yusbeOQMCgYBN9ozhdbZgNevE2B2J9HD6mMoHMz1Z3rK0QzV8OPdsCIA80zfVUooso5RP7Mwt9H1wIcKCVIwr8BsljV7SubnVPVQjRZflZd5GH5lRin5kggrBH5eRi4571fCQLe40KGMImWEMbsR+ApWHMT0lrYB3llzQpf9SsUzte2l33IZ8XQKBgQCUQlkSq4jDdvToSqdDCPE+Xm8cPbJibckkKxc1Sx6DjeHkbim8PUdf2RaJ8kFIhBjulJmeGaDX8hnmLX9HRcj18wm6dS2sy8V1A1/XjdXe7MZjULFaBA0zeicnxNcCYKZ1OpRt8iS/dD8I4qLeXjdI4oIBXyS2OpDy8s1x9N4H2wKBgQCgv4RgsLURhZKUVv/gMe1ATpkVZTKOyeS3RdyZMY1GglIBsjddUFKvaahFP+qXszoqty2dDxx+vlBHZOpuFc09VNPWRWIHZQzdLe0M92iDAnJUgHjq1VMdz7+J2i96R+MYDI4EUcRS6fWKNsang7mwuxUN8NReYnxL2Gae67H+rw==
8306b75c-baca-43cb-94ea-02f5ebbaf31a	50220023-09bf-443a-a8b3-f306279cbb5b	priority	100
720a312d-92c1-47b6-bce6-2aba9f34b40b	d15d2dae-9c9c-4c7d-83f3-726f29194489	allow-default-scopes	true
88f70bc8-5ff3-4b35-87eb-7c62756b5414	a510d16e-c3f7-4a88-b853-625a2cd357b4	secret	zNndCcjSGYCCQEgKEQSmaA
56e5ed20-e52c-432a-9deb-f71b3b3832f3	a510d16e-c3f7-4a88-b853-625a2cd357b4	priority	100
f52ea82f-9134-4b0b-ae23-f13f0880c39e	a510d16e-c3f7-4a88-b853-625a2cd357b4	kid	ab7ec58f-31e1-423d-bf0a-cf237692b08d
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.composite_role (composite, child_role) FROM stdin;
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	f3d7dfbc-a4f6-4e1a-b2f2-7c5b2bb06d63
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	52585d9d-9441-4579-ace7-74a4353e350f
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	ea5161bf-8bfc-48b7-add0-4275a7e49172
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	2191cca9-5d72-4652-a957-ca0df546967f
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	84acc456-fc49-4cca-9283-38fd388e4365
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	8ac9b15a-6a3c-4556-8f77-4a91388febbb
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	fb42ac73-3c2f-4056-92ce-788079b9951d
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	c927a511-831c-4a40-8e25-862f177fbf2b
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	af3a11f3-b6c6-44db-8856-69521645831d
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	6ed7b246-00ce-4a91-8fad-bfaed57f4883
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	546af231-cd35-4618-92fe-843ae553f7fa
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	a5ce8b8c-5238-445a-b598-49f9c6ce58f0
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	04093287-3ff9-42a6-ae66-6d5b1fbed060
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	690cb0d3-8a6e-40ae-a6ea-6bb5d215fc4c
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	c6829fa0-100e-4744-9074-efab3af64623
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	07038b86-b3ac-4650-9423-d6ebbe1e1f50
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	7aa9a310-f078-46a1-894b-252c75bee221
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	d5b6e728-ae0f-4ef6-9da2-8fd05331b800
84acc456-fc49-4cca-9283-38fd388e4365	07038b86-b3ac-4650-9423-d6ebbe1e1f50
2191cca9-5d72-4652-a957-ca0df546967f	d5b6e728-ae0f-4ef6-9da2-8fd05331b800
2191cca9-5d72-4652-a957-ca0df546967f	c6829fa0-100e-4744-9074-efab3af64623
496938e7-f432-4eb0-90f4-dcbd8a453eb3	5681c07f-ce97-4502-96a0-98b0a69c91c7
496938e7-f432-4eb0-90f4-dcbd8a453eb3	e7560a55-d870-4cc9-a78c-1a3995582440
e7560a55-d870-4cc9-a78c-1a3995582440	43e3c764-d253-4cb8-9280-cbf50dd7603b
491bdc27-9d60-4a12-a6a9-19438b7d6974	0dd4b27e-5012-4cd3-b0e5-489d58832250
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	99a9eb90-ee90-44df-8a4a-d5865fb3cac6
496938e7-f432-4eb0-90f4-dcbd8a453eb3	58f2e33d-f552-45a0-9df5-78c3f2b165e2
496938e7-f432-4eb0-90f4-dcbd8a453eb3	64a7da4d-4baf-4b5d-ae94-54664a583717
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	943c4df8-4d26-41ee-8292-57c6b88a47a6
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	ae017042-26cb-44b9-b97b-6c1f95579313
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	1d08f9af-be23-4547-b903-3f1a433c418b
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	2be20230-ce54-494d-9423-14522d828912
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	ddf7eced-0dbf-499e-ad70-d56544b989cd
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	c73f3cc3-bf6d-442b-b7ad-b1d12e943c47
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	3fa2cb16-40fc-4a56-a7f0-a65722f09e4f
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	99460e36-bb23-4b0f-90b4-3a7501488557
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	7e161a36-8bdf-4059-bec6-5746d3578fab
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	97150a72-c3a5-4b77-af3a-2c11c3cb543b
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	9d0bee00-9d0a-43eb-b43e-406da4d277d4
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	5db5d9ac-ab2d-4e8b-ae23-189ed57f6265
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	2158d2e4-87e1-4ff8-9dd4-4ec6a7d58997
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	f9f24aea-193a-4568-9f40-77fa6376ab58
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	89eee4e4-4c99-4e8b-8830-a345eaa4a1a1
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	ea6c45b5-aad1-4dec-b3c2-61f157a5a118
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	860136d7-d41b-47d2-a52c-f5196ac8c545
2be20230-ce54-494d-9423-14522d828912	89eee4e4-4c99-4e8b-8830-a345eaa4a1a1
1d08f9af-be23-4547-b903-3f1a433c418b	f9f24aea-193a-4568-9f40-77fa6376ab58
1d08f9af-be23-4547-b903-3f1a433c418b	860136d7-d41b-47d2-a52c-f5196ac8c545
4c19f2aa-f9b9-473e-ba5c-46c2f4e52c8b	1ec798aa-cd95-43bd-9494-b1883e451fbb
4c19f2aa-f9b9-473e-ba5c-46c2f4e52c8b	9ed742fe-ac2e-462c-ab1f-09895db556b6
555cb91f-8d72-416a-b92b-b4cbbe7af84e	b3d3467f-bf0e-4beb-89c9-ed3f1c24218f
baaefcc2-1f34-4150-80e6-b12ea7b99fbf	d7b9b5a3-98ff-47ca-b92c-41fc1ee12991
baaefcc2-1f34-4150-80e6-b12ea7b99fbf	19b8f94a-1c8c-4fe5-af5d-eb267875b316
9481d47f-0f38-4168-8dc1-85ee90fd9952	111ffe9e-7621-4e3a-b4c9-4ee6e3537871
9481d47f-0f38-4168-8dc1-85ee90fd9952	fafffc7a-a5dc-4e81-b015-360caf631623
9481d47f-0f38-4168-8dc1-85ee90fd9952	d7b9b5a3-98ff-47ca-b92c-41fc1ee12991
9481d47f-0f38-4168-8dc1-85ee90fd9952	4faa62f4-4e98-4724-a9e2-1108c3ebe2ad
9481d47f-0f38-4168-8dc1-85ee90fd9952	baaefcc2-1f34-4150-80e6-b12ea7b99fbf
9481d47f-0f38-4168-8dc1-85ee90fd9952	555cb91f-8d72-416a-b92b-b4cbbe7af84e
9481d47f-0f38-4168-8dc1-85ee90fd9952	ad46b3be-cb57-474c-9f08-affea208b8b7
9481d47f-0f38-4168-8dc1-85ee90fd9952	840b627d-4723-4e35-90e0-19c27b6b85cf
9481d47f-0f38-4168-8dc1-85ee90fd9952	a83e07cf-e87d-40ca-831a-6b67f0ac4714
9481d47f-0f38-4168-8dc1-85ee90fd9952	d1a7b303-33e0-4759-9489-a3531df3859b
9481d47f-0f38-4168-8dc1-85ee90fd9952	8a35d055-6927-499d-80a0-28d1b0280623
9481d47f-0f38-4168-8dc1-85ee90fd9952	23135309-3d58-4494-8baa-5876b4d953c8
9481d47f-0f38-4168-8dc1-85ee90fd9952	b3d3467f-bf0e-4beb-89c9-ed3f1c24218f
9481d47f-0f38-4168-8dc1-85ee90fd9952	99dc3a13-e284-493d-b8db-956f1815b14e
9481d47f-0f38-4168-8dc1-85ee90fd9952	2935c492-8f7b-4550-af8d-adf9f290ca4f
9481d47f-0f38-4168-8dc1-85ee90fd9952	19b8f94a-1c8c-4fe5-af5d-eb267875b316
9481d47f-0f38-4168-8dc1-85ee90fd9952	57f3ac97-4df1-4198-b534-9a363c819c27
9481d47f-0f38-4168-8dc1-85ee90fd9952	cc5e185c-5cc5-4b0d-9d60-a9e733f454ec
384155f2-e2dd-4522-a376-297f5b46583e	2b074f06-a0b6-44b9-b066-31646a404bbd
384155f2-e2dd-4522-a376-297f5b46583e	52f58e84-eb22-4183-ae2e-79efc3b24ef8
384155f2-e2dd-4522-a376-297f5b46583e	0dafac79-e275-4da4-93af-835065f13a58
384155f2-e2dd-4522-a376-297f5b46583e	b955a642-bad0-4673-861b-bf9e92671159
384155f2-e2dd-4522-a376-297f5b46583e	00cd4ea4-292d-4359-848d-43ae48a97a72
384155f2-e2dd-4522-a376-297f5b46583e	0b785d01-ddac-48bc-bb3e-e31066b12938
d4e90553-21c6-4922-9b47-26ad2db306dc	2b074f06-a0b6-44b9-b066-31646a404bbd
d4e90553-21c6-4922-9b47-26ad2db306dc	52f58e84-eb22-4183-ae2e-79efc3b24ef8
d4e90553-21c6-4922-9b47-26ad2db306dc	0dafac79-e275-4da4-93af-835065f13a58
d4e90553-21c6-4922-9b47-26ad2db306dc	b955a642-bad0-4673-861b-bf9e92671159
d4e90553-21c6-4922-9b47-26ad2db306dc	00cd4ea4-292d-4359-848d-43ae48a97a72
d4e90553-21c6-4922-9b47-26ad2db306dc	0b785d01-ddac-48bc-bb3e-e31066b12938
03d6eb50-c77f-4621-81d9-0f42768ff51f	2b074f06-a0b6-44b9-b066-31646a404bbd
03d6eb50-c77f-4621-81d9-0f42768ff51f	52f58e84-eb22-4183-ae2e-79efc3b24ef8
03d6eb50-c77f-4621-81d9-0f42768ff51f	00cd4ea4-292d-4359-848d-43ae48a97a72
27f270f7-c6a5-45c9-971b-ce5652d4e6d2	2b074f06-a0b6-44b9-b066-31646a404bbd
27f270f7-c6a5-45c9-971b-ce5652d4e6d2	52f58e84-eb22-4183-ae2e-79efc3b24ef8
27f270f7-c6a5-45c9-971b-ce5652d4e6d2	00cd4ea4-292d-4359-848d-43ae48a97a72
e8b9f782-d707-4852-a979-e5a08b19f3c7	1a1e42c6-28b7-4191-a52b-b97b72926c33
e8b9f782-d707-4852-a979-e5a08b19f3c7	eb2c79a7-b646-4cee-8507-617c78c0f5ac
e8b9f782-d707-4852-a979-e5a08b19f3c7	35f7681c-bd1d-45f5-a01a-73b7fa6bcdde
e8b9f782-d707-4852-a979-e5a08b19f3c7	03b8efba-cb1d-4399-80b4-7cc7527ab72f
e8b9f782-d707-4852-a979-e5a08b19f3c7	a2d6f8c4-2d25-48d3-b2b9-4b3e21fba09e
e8b9f782-d707-4852-a979-e5a08b19f3c7	d8118fe7-8de0-46b3-b791-8de770117aba
e8b9f782-d707-4852-a979-e5a08b19f3c7	eb8b9cbb-94a9-4258-b225-ada962d08885
e8b9f782-d707-4852-a979-e5a08b19f3c7	109e677c-8e37-46f8-abc1-0eeb2bfaf0c8
e8b9f782-d707-4852-a979-e5a08b19f3c7	d36cc7da-e188-4d7d-b17c-794f7008f97a
e8b9f782-d707-4852-a979-e5a08b19f3c7	2f9c84f7-a3cb-4241-84a7-6d1195cabb59
e8b9f782-d707-4852-a979-e5a08b19f3c7	93ae3ba4-f3de-4a89-8d94-4838c144f3f4
e8b9f782-d707-4852-a979-e5a08b19f3c7	2f66ff52-5bb8-4b17-909b-0e1c6f26ac97
e8b9f782-d707-4852-a979-e5a08b19f3c7	14371302-7db1-4804-8dd8-adcd4d0fde67
e8b9f782-d707-4852-a979-e5a08b19f3c7	bfe97d4b-c2fb-40dc-a22c-202aca620b1d
e8b9f782-d707-4852-a979-e5a08b19f3c7	a3cfdfd9-b45a-43b7-bb6d-8da52c7e3377
e8b9f782-d707-4852-a979-e5a08b19f3c7	77f051b9-dda3-4cde-966d-eff8f2cdb7b9
b72c63ff-3534-4897-9a81-1bc8cbff8a50	eb8b9cbb-94a9-4258-b225-ada962d08885
b72c63ff-3534-4897-9a81-1bc8cbff8a50	14371302-7db1-4804-8dd8-adcd4d0fde67
b72c63ff-3534-4897-9a81-1bc8cbff8a50	a3cfdfd9-b45a-43b7-bb6d-8da52c7e3377
b72c63ff-3534-4897-9a81-1bc8cbff8a50	77f051b9-dda3-4cde-966d-eff8f2cdb7b9
b72c63ff-3534-4897-9a81-1bc8cbff8a50	2f9c84f7-a3cb-4241-84a7-6d1195cabb59
418dfd6d-ec59-4a69-bd95-2d525e6379b0	2f66ff52-5bb8-4b17-909b-0e1c6f26ac97
418dfd6d-ec59-4a69-bd95-2d525e6379b0	eb8b9cbb-94a9-4258-b225-ada962d08885
418dfd6d-ec59-4a69-bd95-2d525e6379b0	14371302-7db1-4804-8dd8-adcd4d0fde67
418dfd6d-ec59-4a69-bd95-2d525e6379b0	a3cfdfd9-b45a-43b7-bb6d-8da52c7e3377
418dfd6d-ec59-4a69-bd95-2d525e6379b0	2f9c84f7-a3cb-4241-84a7-6d1195cabb59
e718571c-b4bb-4c35-81a7-c37ca147c4c2	1a1e42c6-28b7-4191-a52b-b97b72926c33
e718571c-b4bb-4c35-81a7-c37ca147c4c2	eb2c79a7-b646-4cee-8507-617c78c0f5ac
e718571c-b4bb-4c35-81a7-c37ca147c4c2	35f7681c-bd1d-45f5-a01a-73b7fa6bcdde
e718571c-b4bb-4c35-81a7-c37ca147c4c2	14371302-7db1-4804-8dd8-adcd4d0fde67
e718571c-b4bb-4c35-81a7-c37ca147c4c2	bfe97d4b-c2fb-40dc-a22c-202aca620b1d
e718571c-b4bb-4c35-81a7-c37ca147c4c2	a3cfdfd9-b45a-43b7-bb6d-8da52c7e3377
e718571c-b4bb-4c35-81a7-c37ca147c4c2	77f051b9-dda3-4cde-966d-eff8f2cdb7b9
e718571c-b4bb-4c35-81a7-c37ca147c4c2	d36cc7da-e188-4d7d-b17c-794f7008f97a
e718571c-b4bb-4c35-81a7-c37ca147c4c2	2f9c84f7-a3cb-4241-84a7-6d1195cabb59
55e1e90b-ccb4-4771-88ec-ba698696aef8	35f7681c-bd1d-45f5-a01a-73b7fa6bcdde
55e1e90b-ccb4-4771-88ec-ba698696aef8	eb8b9cbb-94a9-4258-b225-ada962d08885
55e1e90b-ccb4-4771-88ec-ba698696aef8	14371302-7db1-4804-8dd8-adcd4d0fde67
55e1e90b-ccb4-4771-88ec-ba698696aef8	bfe97d4b-c2fb-40dc-a22c-202aca620b1d
55e1e90b-ccb4-4771-88ec-ba698696aef8	a3cfdfd9-b45a-43b7-bb6d-8da52c7e3377
55e1e90b-ccb4-4771-88ec-ba698696aef8	d36cc7da-e188-4d7d-b17c-794f7008f97a
55e1e90b-ccb4-4771-88ec-ba698696aef8	2f9c84f7-a3cb-4241-84a7-6d1195cabb59
ee2da738-7f4e-4604-9dc7-4aa8a0a70431	de6280eb-825f-4c12-8f97-6d9086fbff7c
ee2da738-7f4e-4604-9dc7-4aa8a0a70431	da118624-3bf9-46a7-8222-732effd7d0e4
da4de06a-5315-4d0e-8d47-d3fb25e63269	35f7681c-bd1d-45f5-a01a-73b7fa6bcdde
da4de06a-5315-4d0e-8d47-d3fb25e63269	14371302-7db1-4804-8dd8-adcd4d0fde67
da4de06a-5315-4d0e-8d47-d3fb25e63269	a3cfdfd9-b45a-43b7-bb6d-8da52c7e3377
da4de06a-5315-4d0e-8d47-d3fb25e63269	d36cc7da-e188-4d7d-b17c-794f7008f97a
da4de06a-5315-4d0e-8d47-d3fb25e63269	2f9c84f7-a3cb-4241-84a7-6d1195cabb59
d95f2bd5-0380-4f9b-832b-f80640426002	b5c6e85f-92af-4ba1-b3af-08d6fb34f47b
84e52241-1d69-46a9-98ad-7954369582f1	1c44f74b-db89-4017-94ec-21c9ee8ce7ea
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	4d87806a-dc8d-4784-9bf1-a918e4a53402
e8b9f782-d707-4852-a979-e5a08b19f3c7	6f98c370-cd5d-4ffa-9d38-26d39fdf6e25
e8b9f782-d707-4852-a979-e5a08b19f3c7	e7fa4253-9664-4bca-9c0f-966648d19b47
e8b9f782-d707-4852-a979-e5a08b19f3c7	a718d689-a009-484d-a240-9ce86d922ea3
e8b9f782-d707-4852-a979-e5a08b19f3c7	4db614c5-9c59-47a0-a63d-89407fa77810
e8b9f782-d707-4852-a979-e5a08b19f3c7	c7e88346-ccb7-4d8c-ace3-e22722b2100f
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
a7aa7cad-62d7-49d1-a99a-b7c646583702	\N	password	d25a17f9-1550-4b79-8495-3c1279c4333a	1648455310586	\N	{"value":"xXV6Mf2wLv4iYh6e6G9eGdvWTzh63Dex9N2CApNsZlRt/XFZqBC3kT/88WrkapcpcKrvYu9yVv4Fr0g3vTQdaQ==","salt":"MaPZY0n1tNvcKOZh+MUusA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ed95045e-367c-4087-87cd-5d843ee81e27	\N	password	3cbac5d7-d38e-4366-904a-b5829d0819dd	1648456790481	\N	{"value":"c8jg0vMuhcSskv4OZwOtsx5c0NOzDITDm5QvF8Zy2bo2Lmi95JrvA/iaVDSerPw1h3TAPTgebU9UOfefig21WA==","salt":"Tx5z9NfPmABWEmA6jcqDHw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2022-03-28 08:13:59.253712	1	EXECUTED	7:4e70412f24a3f382c82183742ec79317	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	8455237708
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2022-03-28 08:13:59.420793	2	MARK_RAN	7:cb16724583e9675711801c6875114f28	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	8455237708
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2022-03-28 08:13:59.638838	3	EXECUTED	7:0310eb8ba07cec616460794d42ade0fa	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	3.5.4	\N	\N	8455237708
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2022-03-28 08:13:59.646457	4	EXECUTED	7:5d25857e708c3233ef4439df1f93f012	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	8455237708
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2022-03-28 08:14:00.246282	5	EXECUTED	7:c7a54a1041d58eb3817a4a883b4d4e84	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	8455237708
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2022-03-28 08:14:00.289587	6	MARK_RAN	7:2e01012df20974c1c2a605ef8afe25b7	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	8455237708
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2022-03-28 08:14:00.634538	7	EXECUTED	7:0f08df48468428e0f30ee59a8ec01a41	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	8455237708
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2022-03-28 08:14:00.646209	8	MARK_RAN	7:a77ea2ad226b345e7d689d366f185c8c	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	8455237708
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2022-03-28 08:14:00.69923	9	EXECUTED	7:a3377a2059aefbf3b90ebb4c4cc8e2ab	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	3.5.4	\N	\N	8455237708
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2022-03-28 08:14:01.291488	10	EXECUTED	7:04c1dbedc2aa3e9756d1a1668e003451	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	3.5.4	\N	\N	8455237708
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2022-03-28 08:14:01.71176	11	EXECUTED	7:36ef39ed560ad07062d956db861042ba	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	8455237708
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2022-03-28 08:14:01.747239	12	MARK_RAN	7:d909180b2530479a716d3f9c9eaea3d7	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	8455237708
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2022-03-28 08:14:01.953022	13	EXECUTED	7:cf12b04b79bea5152f165eb41f3955f6	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	8455237708
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-03-28 08:14:02.104807	14	EXECUTED	7:7e32c8f05c755e8675764e7d5f514509	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	3.5.4	\N	\N	8455237708
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-03-28 08:14:02.112862	15	MARK_RAN	7:980ba23cc0ec39cab731ce903dd01291	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	8455237708
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-03-28 08:14:02.306177	16	MARK_RAN	7:2fa220758991285312eb84f3b4ff5336	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	3.5.4	\N	\N	8455237708
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-03-28 08:14:02.341619	17	EXECUTED	7:d41d8cd98f00b204e9800998ecf8427e	empty		\N	3.5.4	\N	\N	8455237708
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2022-03-28 08:14:02.766429	18	EXECUTED	7:91ace540896df890cc00a0490ee52bbc	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	3.5.4	\N	\N	8455237708
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2022-03-28 08:14:02.969009	19	EXECUTED	7:c31d1646dfa2618a9335c00e07f89f24	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	8455237708
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2022-03-28 08:14:03.008542	20	EXECUTED	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	8455237708
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-03-28 08:14:11.529304	45	EXECUTED	7:6a48ce645a3525488a90fbf76adf3bb3	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	8455237708
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2022-03-28 08:14:03.014289	21	MARK_RAN	7:f987971fe6b37d963bc95fee2b27f8df	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	8455237708
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2022-03-28 08:14:03.029173	22	MARK_RAN	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	8455237708
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2022-03-28 08:14:03.310621	23	EXECUTED	7:ed2dc7f799d19ac452cbcda56c929e47	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	3.5.4	\N	\N	8455237708
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2022-03-28 08:14:03.365287	24	EXECUTED	7:80b5db88a5dda36ece5f235be8757615	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	8455237708
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2022-03-28 08:14:03.373982	25	MARK_RAN	7:1437310ed1305a9b93f8848f301726ce	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	8455237708
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2022-03-28 08:14:05.160338	26	EXECUTED	7:b82ffb34850fa0836be16deefc6a87c4	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	3.5.4	\N	\N	8455237708
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2022-03-28 08:14:05.491677	27	EXECUTED	7:9cc98082921330d8d9266decdd4bd658	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	3.5.4	\N	\N	8455237708
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2022-03-28 08:14:05.530022	28	EXECUTED	7:03d64aeed9cb52b969bd30a7ac0db57e	update tableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	8455237708
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2022-03-28 08:14:05.770578	29	EXECUTED	7:f1f9fd8710399d725b780f463c6b21cd	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	3.5.4	\N	\N	8455237708
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2022-03-28 08:14:05.867933	30	EXECUTED	7:53188c3eb1107546e6f765835705b6c1	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	3.5.4	\N	\N	8455237708
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2022-03-28 08:14:06.003353	31	EXECUTED	7:d6e6f3bc57a0c5586737d1351725d4d4	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	3.5.4	\N	\N	8455237708
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2022-03-28 08:14:06.03824	32	EXECUTED	7:454d604fbd755d9df3fd9c6329043aa5	customChange		\N	3.5.4	\N	\N	8455237708
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-03-28 08:14:06.088654	33	EXECUTED	7:57e98a3077e29caf562f7dbf80c72600	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	8455237708
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-03-28 08:14:06.114568	34	MARK_RAN	7:e4c7e8f2256210aee71ddc42f538b57a	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	8455237708
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-03-28 08:14:06.301943	35	EXECUTED	7:09a43c97e49bc626460480aa1379b522	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	8455237708
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2022-03-28 08:14:06.356752	36	EXECUTED	7:26bfc7c74fefa9126f2ce702fb775553	addColumn tableName=REALM		\N	3.5.4	\N	\N	8455237708
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-03-28 08:14:06.371378	37	EXECUTED	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	8455237708
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2022-03-28 08:14:06.409115	38	EXECUTED	7:37fc1781855ac5388c494f1442b3f717	addColumn tableName=FED_USER_CONSENT		\N	3.5.4	\N	\N	8455237708
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2022-03-28 08:14:06.415122	39	EXECUTED	7:13a27db0dae6049541136adad7261d27	addColumn tableName=IDENTITY_PROVIDER		\N	3.5.4	\N	\N	8455237708
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-03-28 08:14:06.420314	40	MARK_RAN	7:550300617e3b59e8af3a6294df8248a3	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	8455237708
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-03-28 08:14:06.429003	41	MARK_RAN	7:e3a9482b8931481dc2772a5c07c44f17	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	8455237708
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2022-03-28 08:14:06.445911	42	EXECUTED	7:72b07d85a2677cb257edb02b408f332d	customChange		\N	3.5.4	\N	\N	8455237708
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-03-28 08:14:11.44376	43	EXECUTED	7:a72a7858967bd414835d19e04d880312	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	3.5.4	\N	\N	8455237708
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2022-03-28 08:14:11.477031	44	EXECUTED	7:94edff7cf9ce179e7e85f0cd78a3cf2c	addColumn tableName=USER_ENTITY		\N	3.5.4	\N	\N	8455237708
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-03-28 08:14:11.582423	46	EXECUTED	7:e64b5dcea7db06077c6e57d3b9e5ca14	customChange		\N	3.5.4	\N	\N	8455237708
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-03-28 08:14:11.600633	47	MARK_RAN	7:fd8cf02498f8b1e72496a20afc75178c	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	8455237708
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-03-28 08:14:12.142513	48	EXECUTED	7:542794f25aa2b1fbabb7e577d6646319	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	3.5.4	\N	\N	8455237708
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-03-28 08:14:12.181602	49	EXECUTED	7:edad604c882df12f74941dac3cc6d650	addColumn tableName=REALM		\N	3.5.4	\N	\N	8455237708
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2022-03-28 08:14:12.341726	50	EXECUTED	7:0f88b78b7b46480eb92690cbf5e44900	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	3.5.4	\N	\N	8455237708
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2022-03-28 08:14:13.566315	51	EXECUTED	7:d560e43982611d936457c327f872dd59	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	3.5.4	\N	\N	8455237708
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2022-03-28 08:14:13.571888	52	EXECUTED	7:c155566c42b4d14ef07059ec3b3bbd8e	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	8455237708
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2022-03-28 08:14:13.576676	53	EXECUTED	7:b40376581f12d70f3c89ba8ddf5b7dea	update tableName=REALM		\N	3.5.4	\N	\N	8455237708
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2022-03-28 08:14:13.590019	54	EXECUTED	7:a1132cc395f7b95b3646146c2e38f168	update tableName=CLIENT		\N	3.5.4	\N	\N	8455237708
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-03-28 08:14:13.631094	55	EXECUTED	7:d8dc5d89c789105cfa7ca0e82cba60af	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	3.5.4	\N	\N	8455237708
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-03-28 08:14:13.645211	56	EXECUTED	7:7822e0165097182e8f653c35517656a3	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	3.5.4	\N	\N	8455237708
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-03-28 08:14:13.911535	57	EXECUTED	7:c6538c29b9c9a08f9e9ea2de5c2b6375	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	3.5.4	\N	\N	8455237708
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-03-28 08:14:15.492851	58	EXECUTED	7:6d4893e36de22369cf73bcb051ded875	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	3.5.4	\N	\N	8455237708
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2022-03-28 08:14:15.73371	59	EXECUTED	7:57960fc0b0f0dd0563ea6f8b2e4a1707	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	3.5.4	\N	\N	8455237708
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2022-03-28 08:14:15.805298	60	EXECUTED	7:2b4b8bff39944c7097977cc18dbceb3b	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	8455237708
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2022-03-28 08:14:15.896204	61	EXECUTED	7:2aa42a964c59cd5b8ca9822340ba33a8	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	3.5.4	\N	\N	8455237708
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2022-03-28 08:14:15.940888	62	EXECUTED	7:9ac9e58545479929ba23f4a3087a0346	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	3.5.4	\N	\N	8455237708
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2022-03-28 08:14:15.956284	63	EXECUTED	7:14d407c35bc4fe1976867756bcea0c36	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	8455237708
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2022-03-28 08:14:15.998764	64	EXECUTED	7:241a8030c748c8548e346adee548fa93	update tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	8455237708
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2022-03-28 08:14:16.028474	65	EXECUTED	7:7d3182f65a34fcc61e8d23def037dc3f	update tableName=RESOURCE_SERVER_RESOURCE		\N	3.5.4	\N	\N	8455237708
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2022-03-28 08:14:16.228115	66	EXECUTED	7:b30039e00a0b9715d430d1b0636728fa	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	3.5.4	\N	\N	8455237708
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2022-03-28 08:14:16.334037	67	EXECUTED	7:3797315ca61d531780f8e6f82f258159	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	3.5.4	\N	\N	8455237708
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2022-03-28 08:14:16.382777	68	EXECUTED	7:c7aa4c8d9573500c2d347c1941ff0301	addColumn tableName=REALM		\N	3.5.4	\N	\N	8455237708
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2022-03-28 08:14:16.603375	69	EXECUTED	7:b207faee394fc074a442ecd42185a5dd	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	3.5.4	\N	\N	8455237708
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2022-03-28 08:14:16.694121	70	EXECUTED	7:ab9a9762faaba4ddfa35514b212c4922	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	3.5.4	\N	\N	8455237708
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2022-03-28 08:14:16.747532	71	EXECUTED	7:b9710f74515a6ccb51b72dc0d19df8c4	addColumn tableName=RESOURCE_SERVER		\N	3.5.4	\N	\N	8455237708
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-03-28 08:14:16.804142	72	EXECUTED	7:ec9707ae4d4f0b7452fee20128083879	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	8455237708
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-03-28 08:14:16.851676	73	EXECUTED	7:3979a0ae07ac465e920ca696532fc736	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	8455237708
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-03-28 08:14:16.866338	74	MARK_RAN	7:5abfde4c259119d143bd2fbf49ac2bca	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	8455237708
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-03-28 08:14:17.109782	75	EXECUTED	7:b48da8c11a3d83ddd6b7d0c8c2219345	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	3.5.4	\N	\N	8455237708
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-03-28 08:14:17.325129	76	EXECUTED	7:a73379915c23bfad3e8f5c6d5c0aa4bd	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	3.5.4	\N	\N	8455237708
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-03-28 08:14:17.370119	77	EXECUTED	7:39e0073779aba192646291aa2332493d	addColumn tableName=CLIENT		\N	3.5.4	\N	\N	8455237708
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-03-28 08:14:17.382053	78	MARK_RAN	7:81f87368f00450799b4bf42ea0b3ec34	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	3.5.4	\N	\N	8455237708
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-03-28 08:14:17.486549	79	EXECUTED	7:20b37422abb9fb6571c618148f013a15	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	3.5.4	\N	\N	8455237708
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-03-28 08:14:17.515387	80	MARK_RAN	7:1970bb6cfb5ee800736b95ad3fb3c78a	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	3.5.4	\N	\N	8455237708
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-03-28 08:14:17.635586	81	EXECUTED	7:45d9b25fc3b455d522d8dcc10a0f4c80	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	3.5.4	\N	\N	8455237708
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-03-28 08:14:17.639818	82	MARK_RAN	7:890ae73712bc187a66c2813a724d037f	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	8455237708
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-03-28 08:14:17.674307	83	EXECUTED	7:0a211980d27fafe3ff50d19a3a29b538	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	8455237708
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-03-28 08:14:17.686039	84	MARK_RAN	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	8455237708
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-03-28 08:14:17.899118	85	EXECUTED	7:01c49302201bdf815b0a18d1f98a55dc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	8455237708
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2022-03-28 08:14:17.940567	86	EXECUTED	7:3dace6b144c11f53f1ad2c0361279b86	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	3.5.4	\N	\N	8455237708
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2022-03-28 08:14:17.985716	87	EXECUTED	7:578d0b92077eaf2ab95ad0ec087aa903	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	3.5.4	\N	\N	8455237708
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2022-03-28 08:14:18.008977	88	EXECUTED	7:c95abe90d962c57a09ecaee57972835d	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	3.5.4	\N	\N	8455237708
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-03-28 08:14:18.053767	89	EXECUTED	7:f1313bcc2994a5c4dc1062ed6d8282d3	addColumn tableName=REALM; customChange		\N	3.5.4	\N	\N	8455237708
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-03-28 08:14:18.064536	90	EXECUTED	7:90d763b52eaffebefbcbde55f269508b	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	3.5.4	\N	\N	8455237708
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-03-28 08:14:18.14657	91	EXECUTED	7:d554f0cb92b764470dccfa5e0014a7dd	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	8455237708
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-03-28 08:14:18.194747	92	EXECUTED	7:73193e3ab3c35cf0f37ccea3bf783764	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	3.5.4	\N	\N	8455237708
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-03-28 08:14:18.198897	93	MARK_RAN	7:90a1e74f92e9cbaa0c5eab80b8a037f3	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	3.5.4	\N	\N	8455237708
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-03-28 08:14:18.214197	94	EXECUTED	7:5b9248f29cd047c200083cc6d8388b16	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	3.5.4	\N	\N	8455237708
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-03-28 08:14:18.24065	95	MARK_RAN	7:64db59e44c374f13955489e8990d17a1	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	3.5.4	\N	\N	8455237708
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-03-28 08:14:18.248966	96	EXECUTED	7:329a578cdb43262fff975f0a7f6cda60	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	3.5.4	\N	\N	8455237708
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-03-28 08:14:18.54575	97	EXECUTED	7:fae0de241ac0fd0bbc2b380b85e4f567	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	8455237708
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-03-28 08:14:18.556083	98	MARK_RAN	7:075d54e9180f49bb0c64ca4218936e81	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	8455237708
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-03-28 08:14:18.681344	99	MARK_RAN	7:06499836520f4f6b3d05e35a59324910	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	8455237708
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-03-28 08:14:19.051911	100	EXECUTED	7:fad08e83c77d0171ec166bc9bc5d390a	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	8455237708
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-03-28 08:14:19.058396	101	MARK_RAN	7:3d2b23076e59c6f70bae703aa01be35b	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	8455237708
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-03-28 08:14:19.244508	102	EXECUTED	7:1a7f28ff8d9e53aeb879d76ea3d9341a	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	3.5.4	\N	\N	8455237708
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-03-28 08:14:19.288052	103	EXECUTED	7:2fd554456fed4a82c698c555c5b751b6	customChange		\N	3.5.4	\N	\N	8455237708
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2022-03-28 08:14:19.297715	104	EXECUTED	7:b06356d66c2790ecc2ae54ba0458397a	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	3.5.4	\N	\N	8455237708
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
master	f6f1e627-1516-492b-b944-b2b439d8b14d	f
master	40241723-0925-42f6-b493-2d927e630745	t
master	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2	t
master	d48ebb40-f04c-4e49-a592-adcf9c89748c	t
master	f6117e46-8f84-4562-b02b-a454870093f2	f
master	fcccf8cf-5e6d-434b-b681-4a9fc4295e23	f
master	3fdddfbd-f44d-45db-b4ec-ea8ba26436a9	t
master	384d1be6-14dd-4438-8de2-765a4c8b841e	t
master	b0e34d62-4ec6-422d-9992-7bf5ce09df18	f
CX-Central	23e5acb7-2d8c-4bca-8565-36fb57ee7ee0	t
CX-Central	8a14f08a-0ba9-44ae-83bd-5a65b9d0fe8c	t
CX-Central	fc35a8f5-fedd-4b66-b3fa-9427e3947dc5	t
CX-Central	2629904c-d708-4072-9fe4-98e4a30c7dde	t
CX-Central	e24a7d06-7406-4b2f-854e-a5653f8b964f	t
CX-Central	99ca536c-58c2-432f-904e-10926bbc207b	f
CX-Central	09dc23a3-1b9f-4b9d-aa87-e875f0f20655	f
CX-Central	13834c57-9211-4e3e-b892-0632a3c15225	f
CX-Central	34a2f332-9752-4a7f-9d61-b4dbd40946b4	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
db93e99a-3f66-4833-82ac-37c080ad983a	catenax-portal	{"auth_method":"openid-connect","token_id":"509be5d5-e9f3-4e98-9bb5-98eeb24029aa","grant_type":"password","refresh_token_type":"Refresh","scope":"profile email","refresh_token_id":"e1cbb998-f2fc-4bab-840a-ec31a980a834","client_auth_method":"client-secret","username":"devenv-cx-admin"}	\N	10.0.0.2	CX-Central	168798b3-0e17-48bd-a2fc-8e003c0ccf62	1648457696087	LOGIN	3cbac5d7-d38e-4366-904a-b5829d0819dd
e007169c-e3a5-4f18-9ad1-57d3b8446b1a	catenax-portal	{"auth_method":"openid-connect","token_id":"ea3edd4d-c904-46b2-a399-ac2ce7027c66","grant_type":"password","refresh_token_type":"Refresh","scope":"profile email","refresh_token_id":"a29c44f3-83c5-4837-8d99-0bfe18eda962","client_auth_method":"client-secret","username":"devenv-cx-admin"}	\N	10.0.0.2	CX-Central	39b4bf21-d848-4c44-addb-39c5cf06baf5	1648467829246	LOGIN	3cbac5d7-d38e-4366-904a-b5829d0819dd
7a86087f-e80b-4bb5-95e4-80d4f9c5efc6	sa-cl1-reg-2	{"token_id":"1184e0bd-f41c-43dc-878e-89c1d8582938","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	fc7564ed-e230-4e68-a21a-5ddbac8336c6	1648468052117	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
a5495f51-7b5d-4cfe-bd61-1ee32bae40a8	sa-cl1-reg-2	{"token_id":"fce0a5b0-5160-46fc-a2c8-eb1769d7263a","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	85fdd4b0-1244-4f4c-9083-b2bd9d919527	1648468188019	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
7c59da1d-a9b9-47e7-b315-714c8a501466	catenax-portal	{"auth_method":"openid-connect","token_id":"494eb451-7e25-4801-9a64-0c97db367b3a","grant_type":"password","refresh_token_type":"Refresh","scope":"profile email","refresh_token_id":"b13d536e-265e-4c00-bd74-26e087082aa3","client_auth_method":"client-secret","username":"devenv-cx-admin"}	\N	10.0.0.2	CX-Central	1f0c3022-e95c-4b92-bb66-615eaf35b0dd	1648468215288	LOGIN	3cbac5d7-d38e-4366-904a-b5829d0819dd
eea9f337-608b-4241-af87-33862e7a00ba	sa-cl1-reg-2	{"token_id":"62758e03-89ba-47a2-b33b-1b31ba54ccd9","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	e2bd9ef0-9022-4bfa-8c23-19a20e36a9cd	1648468218263	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
c838c3dc-e229-4b2d-bd91-12d301b9e71d	sa-cl1-reg-2	{"token_id":"8d5d5914-648c-42f8-a086-7050079d4e26","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	2aa1922d-9ebc-46a2-bc79-cbb57403e323	1648468272180	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
ac8bd70a-a83b-4fcd-bb1e-97c2ff57332b	catenax-portal	{"auth_method":"openid-connect","token_id":"0abc85d2-5dad-4e84-80bd-b00a6bddb837","grant_type":"password","refresh_token_type":"Refresh","scope":"profile email","refresh_token_id":"ade8b5a8-0dad-497d-8f84-4c12a97cee17","client_auth_method":"client-secret","username":"devenv-cx-admin"}	\N	10.0.0.2	CX-Central	72400f07-8524-48f1-a371-c0168047f5b4	1648468422832	LOGIN	3cbac5d7-d38e-4366-904a-b5829d0819dd
bd1bfe51-1cd2-4fd1-af56-c92c79ad8d1e	sa-cl1-reg-2	{"token_id":"74174014-3474-4356-895c-4b4efb993556","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	40ad011e-9922-4490-bc8a-10a075ecf83e	1648468427977	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
4f3aee60-3c81-46bb-b85d-9565499f199f	sa-cl1-reg-2	{"token_id":"602db0e2-6b0e-433a-a713-a3ac360847f8","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	ff6f43fb-2a38-444f-ace8-84bdbf205ace	1648468508573	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
adaedcd7-ca47-4b8f-a43e-7fd2006e484c	sa-cl1-reg-2	{"token_id":"cdb43aa7-e9ec-4137-9604-6af2d1beb050","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	94cc8ceb-2e27-4d3d-a9fe-5881a0294be3	1648468513758	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
1549383a-3984-4a6e-b642-bd8d6e7c286b	sa-cl1-reg-2	{"token_id":"3ebdc57c-30a2-4838-a9b0-1d89d1fab0cb","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	d7aacd04-f4f2-4553-9e5a-a84c21587e68	1648468513882	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
90b5a250-931c-47aa-8c2f-a1690d66aa3e	sa-cl1-reg-2	{"token_id":"e611f6e5-0e2b-496c-b41b-acf7d547ee49","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	885e58b6-2a33-4001-96b0-c998e647902f	1648468514125	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
de7ec099-6f47-4f9f-97bd-cbcf8245ed68	sa-cl1-reg-2	{"token_id":"1294b240-a3d9-47ff-8ad8-e76c91519a9b","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	5c789110-077b-45b3-bb2c-2936d23c301d	1648468514345	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
406e6280-763d-41e1-938f-7600be8b34e3	sa-cl1-reg-2	{"token_id":"59411d21-19f2-4a34-8bd5-27d322194285","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	b593cafc-7447-4839-9d5d-57db226df40f	1648468514574	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
6a20e081-c541-4b20-a9c7-e885dba2d39a	sa-cl1-reg-2	{"token_id":"163af513-47cf-4382-ac0f-9f17a8ef6f63","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	15dcce26-dccc-4a14-8ab4-dc09aa5f9438	1648468514784	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
e91aa2f4-6353-4982-b791-5de51e3e1693	sa-cl1-reg-2	{"token_id":"dde950f8-f281-4e8e-a41b-2743f06ade5a","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	f20654eb-1c74-49d3-ac64-4418feb6453d	1648468514834	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
60bc10f5-6e39-4309-8be7-094fcfe755ac	sa-cl1-reg-2	{"token_id":"2582b0c9-1ec0-4442-89e4-8729562fa7c9","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	254dcde8-3820-42ea-b999-a98d67cf70ee	1648468515093	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
95741cbe-5d2f-4d6d-9e19-ea5cb4021d7d	sa-cl1-reg-2	{"token_id":"1061ad38-e58f-448a-9760-8ac2a300822e","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	7697a2e6-f8e5-4861-a2a1-10bff10acc0d	1648468515133	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
32535940-8552-44ba-9731-ff7a30084469	sa-cl1-reg-2	{"token_id":"40b4d41f-8226-4534-8d54-a82a23ab1ee1","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	10af0128-2987-48d5-afa0-858f10a7940c	1648468515764	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
224ceaca-8ed3-47c9-b319-5586d98b36ee	sa-cl1-reg-2	{"token_id":"684e66f3-044b-4178-909d-0a9edb9508d1","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	7197e692-3107-4dea-9d15-6ca17e4577c5	1648468516105	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
fbf342ab-b98a-4858-a04b-ce2042d231b2	sa-cl1-reg-2	{"token_id":"3b16f42f-50fd-4822-b967-ee2ede12d40d","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	6acc7251-b861-42d4-b598-5c0b4ab18100	1648468516221	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
1c73a186-9161-4b77-8c07-33ca81409774	sa-cl1-reg-2	{"token_id":"c3816273-45ec-4f81-9950-3b6a22c0c822","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	42bce6cb-e899-4997-9c0c-2dd7f66a65eb	1648468516307	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
c44570ad-067c-449a-af40-4cbd5cb3c46c	sa-cl1-reg-2	{"token_id":"c6e5ae70-6229-48c6-b161-b3e010f1b9b6","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	409057c0-3f4b-45d0-8b2f-77fcd3f15d99	1648468516399	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
f3a01d6f-bd10-4133-a080-3abefe042b30	account-console	{"identity_provider":"idp0","redirect_uri":"https://devhost:8443/iamcentral/auth/realms/CX-Central/account/#/","consent":"no_consent_required","identity_provider_identity":"ntruchsess","code_id":"b58edbd0-b39a-460c-b30e-7dfd63991939","username":"idp0.b5d55d6d-1e3e-4099-b947-47efd72a00b4"}	\N	10.0.0.2	CX-Central	b58edbd0-b39a-460c-b30e-7dfd63991939	1648468617779	LOGIN	f37397c5-83af-4847-be3a-8744e729773b
598dab86-095e-43a2-97ea-f31ac93e7403	account-console	{"token_id":"a6c42326-a24b-400e-afc9-32addfc7590d","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid profile email","refresh_token_id":"083cd0fd-4082-4ea0-a20b-e7eeae88e751","code_id":"b58edbd0-b39a-460c-b30e-7dfd63991939","client_auth_method":"client-secret"}	\N	10.0.0.2	CX-Central	b58edbd0-b39a-460c-b30e-7dfd63991939	1648468618155	CODE_TO_TOKEN	f37397c5-83af-4847-be3a-8744e729773b
da1ab3df-1c07-4c1d-83ac-6ba02ce8f0e0	\N	{"redirect_uri":"https://devhost:8443/iamcentral/auth/realms/CX-Central/account/#/"}	\N	10.0.0.2	CX-Central	b58edbd0-b39a-460c-b30e-7dfd63991939	1648468621228	LOGOUT	f37397c5-83af-4847-be3a-8744e729773b
d9a9dc89-a91b-49b8-b175-b3fd81487452	catenax-portal	{"auth_method":"openid-connect","token_id":"99b793d5-ae19-46d6-898f-667511b89a6c","grant_type":"password","refresh_token_type":"Refresh","scope":"profile email","refresh_token_id":"d8d8819c-bd31-4891-b8de-86d2f597441d","client_auth_method":"client-secret","username":"devenv-cx-admin"}	\N	10.0.0.2	CX-Central	6c1dc5cf-cc36-4d63-acec-e8de8537d5fb	1648482835355	LOGIN	3cbac5d7-d38e-4366-904a-b5829d0819dd
7e2987d3-7e3c-431b-94bc-f727bd5df733	sa-cl1-reg-2	{"token_id":"9f891fce-1d3a-4846-a845-bc5cd9c09129","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	53d4f539-8592-4e09-b5a9-a50fc6520741	1648483059180	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
469a1de9-cc25-4508-a666-a5177dc20df7	sa-cl1-reg-2	{"token_id":"cbd825f1-8d74-496e-8e80-b2ffd23d3cac","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	0e5a7f6a-d4fa-46f6-a4c5-37cd50890d1b	1648483068033	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
90cb3a97-34a6-4e95-939f-a7ea1d7c7ee0	sa-cl1-reg-2	{"token_id":"7fc858d7-de9a-40c4-9ff6-88e764d94218","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	cc34a3c8-ba8f-43c9-99a4-857e5a7cee30	1648483068207	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
a72b025c-34f7-4727-ba23-7329cdfa8ea0	sa-cl1-reg-2	{"token_id":"ff1ee5e9-2580-4412-8551-201cb9697f74","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	60e14de2-5b79-4e33-a2b5-1dbbd83cfa08	1648483068637	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
b63a8ee0-4683-43fd-858e-133b901725fa	sa-cl1-reg-2	{"token_id":"c01dbe1f-33bd-48b7-a9e6-9489587d9663","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	e18812bf-ab6e-4852-b0a4-e317fa5897a4	1648483069056	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
178269c9-a290-46a8-97d4-27eed285004f	sa-cl1-reg-2	{"token_id":"0091bfc6-7b36-455c-8bde-a5f005de9512","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	a18c4b61-2ab0-4970-93f4-eafa85c7334f	1648483069455	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
bce29bbc-dbdd-4f1e-b930-f0423764c1aa	sa-cl1-reg-2	{"token_id":"f339722f-b405-4d73-aaa5-2d4f3cf05f78","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	b705cf4f-77b0-478e-8f3e-70da6ba46d39	1648483070021	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
3683637c-d2fc-48cc-b7d0-394fe21f541f	sa-cl1-reg-2	{"token_id":"ff3ca292-1c2c-4a98-bc25-52384f500105","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	cb8d72f4-b6ee-43fa-a8b3-da4a1363198f	1648483070191	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
5510fb7b-c82a-483a-ae45-d1588fc74365	sa-cl1-reg-2	{"token_id":"a0661a32-09b7-45c3-a070-a82370e32ad5","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	1a099d92-cc75-4ba1-9037-7352d1070015	1648483071368	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
2c624c81-6219-43a6-9ba9-70391dfda0e7	sa-cl1-reg-2	{"token_id":"4e2bd06c-5173-4652-b0b4-3def820c2c31","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	1dbadb9c-1363-4e5f-9321-e71e00045b95	1648483071611	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
a71d7507-1b2a-47e7-b23f-2cd1b1b97dd2	sa-cl1-reg-2	{"token_id":"757b6c00-5d49-43aa-b3a7-8a47101f32c5","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	c94f7a47-8efd-4b23-81d1-15d16aab65a9	1648483073532	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
43d464b6-faf0-4b24-91b2-2d848abdda5e	sa-cl1-reg-2	{"token_id":"ead8305d-a6bd-40b0-a598-b30e05b91816","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	dc6b2e61-fba7-4b78-95e8-005c750f83eb	1648483073996	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
184ada06-5381-437d-8113-4b4e9211c222	sa-cl1-reg-2	{"token_id":"b61270a5-1c6d-478a-8223-dfe008c6ea9b","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	a27b60bc-b09a-4a52-89a4-4d0897e227d6	1648483074394	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
d73ef4d7-c4ea-477c-add5-ef568416ace0	sa-cl1-reg-2	{"token_id":"a438dc59-d9cb-4059-8d86-3b7e8cfcc0b0","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	78c7e6a6-ccdf-42ee-b2b3-3938494ffb1e	1648483074830	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
2f7f9d81-7b37-4cce-a13a-f3d5ee51cdfd	sa-cl1-reg-2	{"token_id":"a783861e-bf63-4b53-b050-a334421cec4b","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	6c8c8896-ad79-4924-9c88-c59a40a8ac25	1648483075081	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
2051bad4-f09d-4699-89ed-5a0712fd761a	sa-cl1-reg-2	{"token_id":"67932a94-413e-465c-9e32-c10957368dfc","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	4ecd9f85-0d7f-4cd1-a7e6-7ddbe52a2538	1648483463958	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
c482ffa2-8fd2-4e48-b093-078d4d4b644d	sa-cl1-reg-2	{"token_id":"13b96cfc-225f-4522-a52c-2b6c152bd81c","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	23cb8a1c-a5fe-4dcd-970c-9c06a9bc1d49	1648483466232	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
c9cb3b0a-1f79-4352-b2aa-8aae26639456	sa-cl1-reg-2	{"token_id":"27426054-e57e-4294-8832-79a1ef5bfe93","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	12b393f4-e431-49af-9f19-ed16ae3975b8	1648483466314	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
5118dfa5-8bd7-4e35-9f5c-9286b4dc6666	sa-cl1-reg-2	{"token_id":"811dd87a-9e52-45c4-a14d-7f9578ff823d","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	c0653a11-cfcd-47c8-b83a-393cad9316d5	1648483466541	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
dfc9593f-d48f-41d1-92b4-e7acc2af975c	sa-cl1-reg-2	{"token_id":"6810faf2-f84e-4dcc-b098-25de95eb48ba","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	d2486011-c79e-4638-8f1d-7d3a6ddf3be4	1648483466859	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
639190ae-5c91-4705-a737-18f455a94a92	sa-cl1-reg-2	{"token_id":"d789971f-1859-463f-8647-283b9f398a48","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	47eb057e-5ba5-4168-ac00-fdb33542fbe8	1648483467291	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
f1b05225-3920-40b6-bf68-66779bbaa7e9	sa-cl1-reg-2	{"token_id":"8b0ab494-b007-42fc-a2ca-256e6c5a9418","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	9d671fa6-0562-4fef-a456-143b0482254e	1648483467522	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
643a57af-81c4-40dd-b323-6ae5f8e974c8	sa-cl1-reg-2	{"token_id":"d10edb56-d92b-459a-b063-c37e9b8cef04","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	56883d85-e29e-4b54-bfd6-0e8257c5fe21	1648483467603	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
78ed13ac-f6b3-47dd-9338-dcf67127ea29	sa-cl1-reg-2	{"token_id":"f57e78c9-317b-4373-8c5f-d194ef15af27","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	f60ff08e-407b-4400-9987-deaa4d82fd17	1648483467825	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
844887eb-d2f8-449d-ab08-1fda3ba9d1cf	sa-cl1-reg-2	{"token_id":"d15c22cf-957a-44cf-9656-3758c888a538","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	a1cb08c4-bafe-46a2-830f-eea1cd48c96b	1648483467888	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
39f126a0-75e9-41db-9b88-a9e3f46fed5f	sa-cl1-reg-2	{"token_id":"c862fd16-7f42-4f2f-b9db-19817af18e3e","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	7bbc2ce5-b55f-4042-8fd0-f147488badb2	1648483468445	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
05cfa3c2-6969-4670-8d8b-fc2d635c0cdb	sa-cl1-reg-2	{"token_id":"2c2198ea-058c-4159-b5da-a05c9dee466b","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	fc8e6a43-8e13-4e9e-a61a-c8f04a854ba0	1648483468599	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
92bafec0-2ddb-494a-b988-3ff23d6a4daa	sa-cl1-reg-2	{"token_id":"000b0f3e-e67d-45e5-b5d4-91610a647a97","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	8909feda-29a0-4734-b7b5-b547792dd5b4	1648483468700	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
b2b4aa81-3e43-4c0b-969b-527a94d6d6f1	sa-cl1-reg-2	{"token_id":"faaf0f3c-1e7d-4fb5-a2f5-af5a9ce42cff","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	e5298a7a-f707-4e74-8779-5588560e98a9	1648483468760	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
d72303a1-ed63-404f-a2c6-e6ed37c594d2	sa-cl1-reg-2	{"token_id":"56429748-4ddf-4050-a64b-d42277efe549","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	3390685f-e6c9-48cd-88cd-0b57f5a34536	1648483468806	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
f5aa879d-587e-4890-88d0-ad37d1989354	sa-cl1-reg-2	{"token_id":"9cbc8efd-01cb-46df-ba21-8ad6f07c089e","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	25ce8c39-db6c-4ffb-ac67-79f9f536537d	1648483530456	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
8e4fba7b-c9ec-4c4c-8b66-fd680a3ce297	sa-cl1-reg-2	{"token_id":"9e91e4fa-046c-4545-9507-ec460194040a","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	3ebb3167-af31-4e61-ba96-2dd8b3fe89ed	1648483532998	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
8738ae6c-3917-428d-b58e-422c98976df8	sa-cl1-reg-2	{"token_id":"8197bb70-a658-4de5-b7bf-ff740313e442","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	b67046d4-21a5-4bd4-80df-c6f365bebb4c	1648483533035	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
a933597a-44bd-43a8-9e4e-8ae7e49dcad3	sa-cl1-reg-2	{"token_id":"91bbd585-5885-4761-83e8-b5d26953b89a","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	d9b38788-8b94-4332-9643-8c247d057066	1648483533195	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
f7aee586-ab63-42bb-b8f3-08b2f48a86d9	sa-cl1-reg-2	{"token_id":"a3113e1e-ca06-4e66-9b27-1f224624651f","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	d453d34b-8d38-48c5-b502-0eaaf09a0433	1648483533432	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
f43cbfe8-dbbf-44c5-a8c0-286f9dfedeb1	sa-cl1-reg-2	{"token_id":"9eb80791-6349-4c52-a431-c1636347de14","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	1fb248c6-3f25-448d-b21a-098e5d312fe0	1648483533647	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
40895460-ea95-43c4-827b-ca15a70654b1	sa-cl1-reg-2	{"token_id":"b530b3b3-591e-4d9e-97c8-087edc4168dd","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	101d3df8-bd64-48c0-93a4-98a3b74ea89a	1648483533864	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
06006275-773e-49ec-9df5-ff30dd327270	sa-cl1-reg-2	{"token_id":"c18b65df-35f6-4542-b420-a0b16626537f","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	d95d7165-b332-4007-803f-297dd5e87252	1648483533916	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
b6d5abec-a2ff-4166-bf74-6410c6271d81	sa-cl1-reg-2	{"token_id":"efe919c6-dbb1-4cc1-b83a-fe62324efb5e","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	a0923b4c-cb2e-4604-be34-736c25ba4521	1648483534088	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
520928b6-02fb-40af-a014-0e4f39ad2b69	sa-cl1-reg-2	{"token_id":"15bddfac-e29d-48a7-b7d4-9939b39fad7e","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	eb8de736-0082-4bff-8b34-02639e4da280	1648483534142	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
8d87612e-cbea-4736-b970-9b4f4de8f4ba	sa-cl1-reg-2	{"token_id":"a1943be4-31e5-4abf-a16c-0419499486f4","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	d6c8247c-c254-47f4-a8d5-9d18ddb211a2	1648483534670	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
4175d347-ea5f-43da-9aa0-f63bd04ae423	sa-cl1-reg-2	{"token_id":"10dc4314-3683-4a9d-844c-4f7e23a8b841","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	ece9b893-f8c6-48ec-b68e-bc235bf12aec	1648483534735	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
7d5c7e7e-6017-4102-93fe-51a9f67cbd60	sa-cl1-reg-2	{"token_id":"20757335-a3c9-4381-a1f8-a6000a1d2ee9","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	a849274f-dcb4-474d-9e6d-502fc3752226	1648483534787	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
e2995adc-db0d-4664-b30a-90e4fcf123ce	sa-cl1-reg-2	{"token_id":"3e637aa7-429d-4262-978d-1dfed5cd61ed","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	33e779b5-ee43-4283-b014-efdb57512f7e	1648483534833	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
d3704829-fcf9-4b78-9e35-e200f2a7064b	sa-cl1-reg-2	{"token_id":"bf37d569-5ff9-40a2-9acc-a89532ddd50a","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	b3e5314e-e1ba-4680-ba4e-e98095944a16	1648483534876	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
89af8cb4-4a64-49b1-9821-6d8ba47c00b8	account-console	{"identity_provider":"idp1","redirect_uri":"https://devhost:8443/iamcentral/auth/realms/CX-Central/account/#/","consent":"no_consent_required","identity_provider_identity":"devhost-test","code_id":"4a63d42d-4e6d-4562-a54d-afc5d589b6e1","username":"idp1.6ec46cd4-5aec-46c3-88dc-2a283994ab92"}	\N	10.0.0.2	CX-Central	4a63d42d-4e6d-4562-a54d-afc5d589b6e1	1648483764880	LOGIN	e9b1c0e4-953d-4539-b703-dca9e911eab5
0ce32c45-9f54-4843-93c5-7f41d6c6e3d6	account-console	{"token_id":"0ad101de-fa99-4c44-945d-c2e69fcd2c7e","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid profile email","refresh_token_id":"7f4d6a04-0f3b-4ca8-85e4-91b081a89b96","code_id":"4a63d42d-4e6d-4562-a54d-afc5d589b6e1","client_auth_method":"client-secret"}	\N	10.0.0.2	CX-Central	4a63d42d-4e6d-4562-a54d-afc5d589b6e1	1648483765499	CODE_TO_TOKEN	e9b1c0e4-953d-4539-b703-dca9e911eab5
7f6cf477-aed9-43d6-91be-b19062295576	\N	{"redirect_uri":"https://devhost:8443/iamcentral/auth/realms/CX-Central/account/#/"}	\N	10.0.0.2	CX-Central	4a63d42d-4e6d-4562-a54d-afc5d589b6e1	1648483768023	LOGOUT	e9b1c0e4-953d-4539-b703-dca9e911eab5
b696ddee-603f-40c7-882e-5909d0835319	catenax-portal	{"auth_method":"openid-connect","token_id":"7edde7d7-7ac4-4a63-8b56-208597c175b7","grant_type":"password","refresh_token_type":"Refresh","scope":"profile email","refresh_token_id":"60614f50-5767-4d9e-ab95-d091c4dc099d","client_auth_method":"client-secret","username":"devenv-cx-admin"}	\N	10.0.0.2	CX-Central	367f8d79-4dfb-4220-88e6-fc890770840d	1648485012169	LOGIN	3cbac5d7-d38e-4366-904a-b5829d0819dd
e8eda92e-00a9-4eaf-ba8d-00c84f26b8c5	sa-cl1-reg-2	{"token_id":"50ae13d4-7263-4003-b0ef-a925ae31a7fb","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	99028331-4b96-4f9c-998e-a3bfbc2964fd	1648485056073	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
33961198-4e5f-4c73-86f3-ba827bcf7c39	sa-cl1-reg-2	{"token_id":"6e0ba710-920b-4bfb-a1d8-0d2fca529dbb","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	dc42364a-6505-4fe1-a939-79ef2b8eddd5	1648485061206	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
2ed799ce-a410-4176-886e-12293fee335d	sa-cl1-reg-2	{"token_id":"ea3e4c87-773a-4ee0-8835-73768e596007","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	f43df06a-be5e-4d86-b312-5f44ac1f34ab	1648485061301	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
5cabf0f7-ee37-46a0-bae0-cd44c3d631b4	sa-cl1-reg-2	{"token_id":"60318205-b111-4de2-8d23-c478f0f8fc97","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	5729a16a-7716-4398-bf10-467af82f0ca1	1648485061402	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
4566e06d-e58b-4175-9e68-9dbc714dcb3f	sa-cl1-reg-2	{"token_id":"0bedafbf-be64-4a9f-b8f1-7a471e4d4dc5","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	9fe8e53b-d730-4e7b-8503-4d4f6224e6b5	1648485061497	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
39b0111f-8052-43a7-9835-16d05034d4af	sa-cl1-reg-2	{"token_id":"a884d099-212c-4f97-b1b6-78da9ce14a72","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	961558fa-8b9f-4fdb-a457-a138e9611887	1648485061585	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
425af5fa-f324-4e08-85fc-4877b8500541	sa-cl1-reg-2	{"token_id":"7d5655dd-41df-4e85-ba30-d107a4957734","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	a63ef0c9-c800-471f-ad85-1715f4886d73	1648485061669	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
18ddd631-95ad-4bfc-91b2-cb5bfb80339c	sa-cl1-reg-2	{"token_id":"276a1c8f-7a48-40f9-8d23-a3d6529dc1e1","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	55c63675-621a-479e-b8d5-9d5a499b5b84	1648485061701	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
32354dfa-26f3-4dfb-8cca-7a8abbfe034d	sa-cl1-reg-2	{"token_id":"129c0aea-80b7-4026-b919-18887b741543","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	4f4d864a-73ee-434f-9d21-dab1b933c296	1648485061920	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
5f7515b6-1d23-4863-9f0d-43d429b90aa8	sa-cl1-reg-2	{"token_id":"7e7f121a-0c37-4785-bea5-88ab34e5fba8","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	82b06924-c900-418f-bb00-d8d8b491f280	1648485061954	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
949d3c2c-c5dc-4cce-b483-d08945c1c813	sa-cl1-reg-2	{"token_id":"d4d0f2b6-31c2-4893-90ef-157e1f44a82d","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	be665f62-a372-4b91-aee5-c6f008ee95a4	1648485062253	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
a5588b73-2be5-4de2-967f-fedd50b3f2fb	sa-cl1-reg-2	{"token_id":"0c6e0fb0-463b-4379-b167-30bed30f342f","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	9d54404e-7973-4321-b156-75d2c6387a02	1648485062383	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
02bd9e6f-4448-4bb0-9b47-1721f9b5988b	sa-cl1-reg-2	{"token_id":"efdee071-228b-4b80-b14f-af921564559d","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	68a79c5a-55ed-4199-9d89-63c77e75a292	1648485062529	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
71656c1a-e5b4-4eda-8a07-ecc4530f6b0f	sa-cl1-reg-2	{"token_id":"9ce35ee0-7227-4b26-8afd-e5212f2ca831","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	790ef27d-1e5b-4775-8e77-a95338638145	1648485062646	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
3d70fdde-9ddb-4fa9-9ede-1991d572aea2	sa-cl1-reg-2	{"token_id":"f849435a-e21c-4a1e-af26-2b35f86bd877","grant_type":"client_credentials","scope":"profile email","client_auth_method":"client-secret","username":"service-account-sa-cl1-reg-2"}	\N	10.0.0.2	CX-Central	ac46fd63-8955-4b1a-ae41-7c14ee16984f	1648485062861	CLIENT_LOGIN	4575b5b9-fab3-4c85-a722-8816bc487fad
dc2a6a1f-7d44-4edd-a029-7b0253d95792	account-console	{"identity_provider":"idp2","redirect_uri":"https://wsl:8443/iamcentral/auth/realms/CX-Central/account/#/","consent":"no_consent_required","identity_provider_identity":"wsl-test","code_id":"01b6003c-0824-418c-ab0e-9860564e4d6b","username":"idp2.f99d2698-5670-41f2-a141-e58b0c99560c"}	\N	10.0.0.2	CX-Central	01b6003c-0824-418c-ab0e-9860564e4d6b	1648485203560	LOGIN	3432d787-d7c8-46fb-96d7-cc984c6bfaac
7b2ca4d9-26a0-4aa2-a1bd-e30bf2c76215	account-console	{"token_id":"a576e033-d029-4d81-a182-f91ade5f034c","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid profile email","refresh_token_id":"fa19a3c4-5c1a-4b0f-9dd6-a9ad8ae68b56","code_id":"01b6003c-0824-418c-ab0e-9860564e4d6b","client_auth_method":"client-secret"}	\N	10.0.0.2	CX-Central	01b6003c-0824-418c-ab0e-9860564e4d6b	1648485203874	CODE_TO_TOKEN	3432d787-d7c8-46fb-96d7-cc984c6bfaac
954a6d55-8ac4-4cf5-a2a7-a39f642b2e7d	\N	{"redirect_uri":"https://wsl:8443/iamcentral/auth/realms/CX-Central/account/#/"}	\N	10.0.0.2	CX-Central	01b6003c-0824-418c-ab0e-9860564e4d6b	1648485206636	LOGOUT	3432d787-d7c8-46fb-96d7-cc984c6bfaac
73fab0a4-332d-4a4d-8c1b-c1ca0bf49fdc	account-console	{"identity_provider":"idp2","redirect_uri":"https://wsl:8443/iamcentral/auth/realms/CX-Central/account/#/","consent":"no_consent_required","identity_provider_identity":"wsl-test","code_id":"864eeb36-2fea-49e8-a6e3-23fdcd20adad","username":"idp2.f99d2698-5670-41f2-a141-e58b0c99560c"}	\N	10.0.0.2	CX-Central	864eeb36-2fea-49e8-a6e3-23fdcd20adad	1648490736357	LOGIN	3432d787-d7c8-46fb-96d7-cc984c6bfaac
f22fb0be-b172-44d5-857c-2e7d893f2ba8	account-console	{"token_id":"d80a65fb-c68a-4d7a-86a0-e089f84e3a37","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid profile email","refresh_token_id":"2fb3f6cd-3a33-4234-95d1-096230dc680d","code_id":"864eeb36-2fea-49e8-a6e3-23fdcd20adad","client_auth_method":"client-secret"}	\N	10.0.0.2	CX-Central	864eeb36-2fea-49e8-a6e3-23fdcd20adad	1648490736575	CODE_TO_TOKEN	3432d787-d7c8-46fb-96d7-cc984c6bfaac
370c8cd3-11e7-4451-96f4-7b5d49a6f312	\N	{"redirect_uri":"https://wsl:8443/iamcentral/auth/realms/CX-Central/account/#/"}	\N	10.0.0.2	CX-Central	864eeb36-2fea-49e8-a6e3-23fdcd20adad	1648490739067	LOGOUT	3432d787-d7c8-46fb-96d7-cc984c6bfaac
cba6359f-9bc5-489f-8b07-3d62b63f1c2f	account-console	{"identity_provider":"idp1","redirect_uri":"https://devhost:8443/iamcentral/auth/realms/CX-Central/account/#/","consent":"no_consent_required","identity_provider_identity":"devhost-test","code_id":"3c99fb27-8028-49c6-b7e4-1571699dbf5e","username":"idp1.6ec46cd4-5aec-46c3-88dc-2a283994ab92"}	\N	10.0.0.2	CX-Central	3c99fb27-8028-49c6-b7e4-1571699dbf5e	1648491917675	LOGIN	e9b1c0e4-953d-4539-b703-dca9e911eab5
91ae554a-763c-4f88-9159-31c7f85a4c9c	account-console	{"token_id":"56cdb5cc-08e2-4a1c-b289-b88332d3fa03","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid profile email","refresh_token_id":"fd0e8c62-acf2-4d8f-9d4b-30a8c73c7195","code_id":"3c99fb27-8028-49c6-b7e4-1571699dbf5e","client_auth_method":"client-secret"}	\N	10.0.0.2	CX-Central	3c99fb27-8028-49c6-b7e4-1571699dbf5e	1648491918225	CODE_TO_TOKEN	e9b1c0e4-953d-4539-b703-dca9e911eab5
9860078e-e4aa-48b6-8513-6aa090df1017	\N	{"redirect_uri":"https://devhost:8443/iamcentral/auth/realms/CX-Central/account/#/"}	\N	10.0.0.2	CX-Central	3c99fb27-8028-49c6-b7e4-1571699dbf5e	1648491920959	LOGOUT	e9b1c0e4-953d-4539-b703-dca9e911eab5
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
idp1	CX-Central	6ec46cd4-5aec-46c3-88dc-2a283994ab92	devhost-test	\N	e9b1c0e4-953d-4539-b703-dca9e911eab5
idp2	CX-Central	f99d2698-5670-41f2-a141-e58b0c99560c	wsl-test	\N	3432d787-d7c8-46fb-96d7-cc984c6bfaac
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
bd73c385-bdd5-405f-977f-db6b5281e68e	t	idp1	keycloak-oidc	f	f	CX-Central	f	f	045ba328-a6b4-4566-b240-57dfcf866788	\N	Devhost Shared Idp	f
145e84bb-56a5-4726-af50-beb7a5b733f8	t	idp2	keycloak-oidc	f	f	CX-Central	f	f	045ba328-a6b4-4566-b240-57dfcf866788	\N	WSL Shared Idp	f
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.identity_provider_config (identity_provider_id, value, name) FROM stdin;
bd73c385-bdd5-405f-977f-db6b5281e68e	false	hideOnLoginPage
bd73c385-bdd5-405f-977f-db6b5281e68e	true	validateSignature
bd73c385-bdd5-405f-977f-db6b5281e68e	central-idp	clientId
bd73c385-bdd5-405f-977f-db6b5281e68e	https://devhost:8443/iamshared/auth/realms/idp1/protocol/openid-connect/token	tokenUrl
bd73c385-bdd5-405f-977f-db6b5281e68e	https://devhost:8443/iamshared/auth/realms/idp1/protocol/openid-connect/auth	authorizationUrl
bd73c385-bdd5-405f-977f-db6b5281e68e	https://devhost:8443/iamshared/auth/realms/idp1/protocol/openid-connect/certs	jwksUrl
bd73c385-bdd5-405f-977f-db6b5281e68e	private_key_jwt	clientAuthMethod
bd73c385-bdd5-405f-977f-db6b5281e68e	https://devhost:8443/iamshared/auth/realms/idp1/protocol/openid-connect/logout	logoutUrl
bd73c385-bdd5-405f-977f-db6b5281e68e	RS256	clientAssertionSigningAlg
bd73c385-bdd5-405f-977f-db6b5281e68e	FORCE	syncMode
bd73c385-bdd5-405f-977f-db6b5281e68e	true	useJwksUrl
145e84bb-56a5-4726-af50-beb7a5b733f8	false	hideOnLoginPage
145e84bb-56a5-4726-af50-beb7a5b733f8	true	validateSignature
145e84bb-56a5-4726-af50-beb7a5b733f8	central-idp	clientId
145e84bb-56a5-4726-af50-beb7a5b733f8	https://wsl:8443/iamshared/auth/realms/idp2/protocol/openid-connect/token	tokenUrl
145e84bb-56a5-4726-af50-beb7a5b733f8	https://wsl:8443/iamshared/auth/realms/idp2/protocol/openid-connect/auth	authorizationUrl
145e84bb-56a5-4726-af50-beb7a5b733f8	https://wsl:8443/iamshared/auth/realms/idp2/protocol/openid-connect/certs	jwksUrl
145e84bb-56a5-4726-af50-beb7a5b733f8	private_key_jwt	clientAuthMethod
145e84bb-56a5-4726-af50-beb7a5b733f8	https://wsl:8443/iamshared/auth/realms/idp2/protocol/openid-connect/logout	logoutUrl
145e84bb-56a5-4726-af50-beb7a5b733f8	RS256	clientAssertionSigningAlg
145e84bb-56a5-4726-af50-beb7a5b733f8	FORCE	syncMode
145e84bb-56a5-4726-af50-beb7a5b733f8	true	useJwksUrl
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
bdd91efb-b5f5-4d2b-bce7-e3a8fc93c8b9	tenant-mapper	idp1	hardcoded-attribute-idp-mapper	CX-Central
f3fd2df9-3c15-4d17-be48-06d59b983811	organisation-mapper	idp1	hardcoded-attribute-idp-mapper	CX-Central
c2a8086e-5e07-4828-921b-f8200fa2c58a	username-mapper	idp1	oidc-username-idp-mapper	CX-Central
73df0acd-f1f3-4d47-ad4a-40835d9dfe22	tenant-mapper	idp2	hardcoded-attribute-idp-mapper	CX-Central
f9c70b74-4574-4050-a9db-88d147a74d51	organisation-mapper	idp2	hardcoded-attribute-idp-mapper	CX-Central
79eb5890-b2e6-4b5c-b5f6-e1575d2d9aff	username-mapper	idp2	oidc-username-idp-mapper	CX-Central
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
bdd91efb-b5f5-4d2b-bce7-e3a8fc93c8b9	INHERIT	syncMode
bdd91efb-b5f5-4d2b-bce7-e3a8fc93c8b9	idp1	attribute.value
bdd91efb-b5f5-4d2b-bce7-e3a8fc93c8b9	tenant	attribute
f3fd2df9-3c15-4d17-be48-06d59b983811	INHERIT	syncMode
f3fd2df9-3c15-4d17-be48-06d59b983811	Devhost Shared Idp	attribute.value
f3fd2df9-3c15-4d17-be48-06d59b983811	organisation	attribute
c2a8086e-5e07-4828-921b-f8200fa2c58a	INHERIT	syncMode
c2a8086e-5e07-4828-921b-f8200fa2c58a	${ALIAS}.${CLAIM.sub}	template
c2a8086e-5e07-4828-921b-f8200fa2c58a	LOCAL	target
73df0acd-f1f3-4d47-ad4a-40835d9dfe22	INHERIT	syncMode
73df0acd-f1f3-4d47-ad4a-40835d9dfe22	idp2	attribute.value
73df0acd-f1f3-4d47-ad4a-40835d9dfe22	tenant	attribute
f9c70b74-4574-4050-a9db-88d147a74d51	INHERIT	syncMode
f9c70b74-4574-4050-a9db-88d147a74d51	WSL Shared Idp	attribute.value
f9c70b74-4574-4050-a9db-88d147a74d51	organisation	attribute
79eb5890-b2e6-4b5c-b5f6-e1575d2d9aff	INHERIT	syncMode
79eb5890-b2e6-4b5c-b5f6-e1575d2d9aff	${ALIAS}.${CLAIM.sub}	template
79eb5890-b2e6-4b5c-b5f6-e1575d2d9aff	LOCAL	target
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
496938e7-f432-4eb0-90f4-dcbd8a453eb3	master	f	${role_default-roles}	default-roles-master	master	\N	\N
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	master	f	${role_admin}	admin	master	\N	\N
f3d7dfbc-a4f6-4e1a-b2f2-7c5b2bb06d63	master	f	${role_create-realm}	create-realm	master	\N	\N
52585d9d-9441-4579-ace7-74a4353e350f	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_create-client}	create-client	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
ea5161bf-8bfc-48b7-add0-4275a7e49172	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_view-realm}	view-realm	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
2191cca9-5d72-4652-a957-ca0df546967f	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_view-users}	view-users	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
84acc456-fc49-4cca-9283-38fd388e4365	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_view-clients}	view-clients	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
8ac9b15a-6a3c-4556-8f77-4a91388febbb	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_view-events}	view-events	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
fb42ac73-3c2f-4056-92ce-788079b9951d	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_view-identity-providers}	view-identity-providers	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
c927a511-831c-4a40-8e25-862f177fbf2b	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_view-authorization}	view-authorization	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
af3a11f3-b6c6-44db-8856-69521645831d	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_manage-realm}	manage-realm	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
6ed7b246-00ce-4a91-8fad-bfaed57f4883	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_manage-users}	manage-users	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
546af231-cd35-4618-92fe-843ae553f7fa	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_manage-clients}	manage-clients	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
a5ce8b8c-5238-445a-b598-49f9c6ce58f0	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_manage-events}	manage-events	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
04093287-3ff9-42a6-ae66-6d5b1fbed060	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_manage-identity-providers}	manage-identity-providers	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
690cb0d3-8a6e-40ae-a6ea-6bb5d215fc4c	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_manage-authorization}	manage-authorization	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
c6829fa0-100e-4744-9074-efab3af64623	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_query-users}	query-users	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
07038b86-b3ac-4650-9423-d6ebbe1e1f50	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_query-clients}	query-clients	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
7aa9a310-f078-46a1-894b-252c75bee221	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_query-realms}	query-realms	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
d5b6e728-ae0f-4ef6-9da2-8fd05331b800	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_query-groups}	query-groups	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
5681c07f-ce97-4502-96a0-98b0a69c91c7	fd3d118a-2d23-4836-b8e3-383fee4ffeea	t	${role_view-profile}	view-profile	master	fd3d118a-2d23-4836-b8e3-383fee4ffeea	\N
e7560a55-d870-4cc9-a78c-1a3995582440	fd3d118a-2d23-4836-b8e3-383fee4ffeea	t	${role_manage-account}	manage-account	master	fd3d118a-2d23-4836-b8e3-383fee4ffeea	\N
43e3c764-d253-4cb8-9280-cbf50dd7603b	fd3d118a-2d23-4836-b8e3-383fee4ffeea	t	${role_manage-account-links}	manage-account-links	master	fd3d118a-2d23-4836-b8e3-383fee4ffeea	\N
16796c14-ba85-49e8-9e77-abe76a12e913	fd3d118a-2d23-4836-b8e3-383fee4ffeea	t	${role_view-applications}	view-applications	master	fd3d118a-2d23-4836-b8e3-383fee4ffeea	\N
0dd4b27e-5012-4cd3-b0e5-489d58832250	fd3d118a-2d23-4836-b8e3-383fee4ffeea	t	${role_view-consent}	view-consent	master	fd3d118a-2d23-4836-b8e3-383fee4ffeea	\N
491bdc27-9d60-4a12-a6a9-19438b7d6974	fd3d118a-2d23-4836-b8e3-383fee4ffeea	t	${role_manage-consent}	manage-consent	master	fd3d118a-2d23-4836-b8e3-383fee4ffeea	\N
2530bc6a-68ec-4f47-9c95-24f731eddbc5	fd3d118a-2d23-4836-b8e3-383fee4ffeea	t	${role_delete-account}	delete-account	master	fd3d118a-2d23-4836-b8e3-383fee4ffeea	\N
a97d11b1-e910-425f-b615-109259710714	ee809656-0126-4c36-a293-bb2d01dd6416	t	${role_read-token}	read-token	master	ee809656-0126-4c36-a293-bb2d01dd6416	\N
99a9eb90-ee90-44df-8a4a-d5865fb3cac6	e3c1a1a8-743b-4df9-887e-cad92ccb7620	t	${role_impersonation}	impersonation	master	e3c1a1a8-743b-4df9-887e-cad92ccb7620	\N
58f2e33d-f552-45a0-9df5-78c3f2b165e2	master	f	${role_offline-access}	offline_access	master	\N	\N
64a7da4d-4baf-4b5d-ae94-54664a583717	master	f	${role_uma_authorization}	uma_authorization	master	\N	\N
4c19f2aa-f9b9-473e-ba5c-46c2f4e52c8b	CX-Central	f	${role_default-roles}	default-roles-catena-x realm	CX-Central	\N	\N
943c4df8-4d26-41ee-8292-57c6b88a47a6	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_create-client}	create-client	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
ae017042-26cb-44b9-b97b-6c1f95579313	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_view-realm}	view-realm	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
1d08f9af-be23-4547-b903-3f1a433c418b	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_view-users}	view-users	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
2be20230-ce54-494d-9423-14522d828912	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_view-clients}	view-clients	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
ddf7eced-0dbf-499e-ad70-d56544b989cd	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_view-events}	view-events	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
c73f3cc3-bf6d-442b-b7ad-b1d12e943c47	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_view-identity-providers}	view-identity-providers	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
3fa2cb16-40fc-4a56-a7f0-a65722f09e4f	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_view-authorization}	view-authorization	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
99460e36-bb23-4b0f-90b4-3a7501488557	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_manage-realm}	manage-realm	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
7e161a36-8bdf-4059-bec6-5746d3578fab	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_manage-users}	manage-users	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
97150a72-c3a5-4b77-af3a-2c11c3cb543b	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_manage-clients}	manage-clients	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
9d0bee00-9d0a-43eb-b43e-406da4d277d4	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_manage-events}	manage-events	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
5db5d9ac-ab2d-4e8b-ae23-189ed57f6265	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_manage-identity-providers}	manage-identity-providers	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
2158d2e4-87e1-4ff8-9dd4-4ec6a7d58997	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_manage-authorization}	manage-authorization	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
f9f24aea-193a-4568-9f40-77fa6376ab58	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_query-users}	query-users	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
89eee4e4-4c99-4e8b-8830-a345eaa4a1a1	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_query-clients}	query-clients	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
ea6c45b5-aad1-4dec-b3c2-61f157a5a118	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_query-realms}	query-realms	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
860136d7-d41b-47d2-a52c-f5196ac8c545	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_query-groups}	query-groups	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
9ed742fe-ac2e-462c-ab1f-09895db556b6	CX-Central	f	${role_uma_authorization}	uma_authorization	CX-Central	\N	\N
1ec798aa-cd95-43bd-9494-b1883e451fbb	CX-Central	f	${role_offline-access}	offline_access	CX-Central	\N	\N
111ffe9e-7621-4e3a-b4c9-4ee6e3537871	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_query-realms}	query-realms	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
fafffc7a-a5dc-4e81-b015-360caf631623	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_impersonation}	impersonation	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
d7b9b5a3-98ff-47ca-b92c-41fc1ee12991	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_query-users}	query-users	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
4faa62f4-4e98-4724-a9e2-1108c3ebe2ad	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_create-client}	create-client	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
555cb91f-8d72-416a-b92b-b4cbbe7af84e	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_view-clients}	view-clients	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
baaefcc2-1f34-4150-80e6-b12ea7b99fbf	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_view-users}	view-users	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
ad46b3be-cb57-474c-9f08-affea208b8b7	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_view-events}	view-events	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
840b627d-4723-4e35-90e0-19c27b6b85cf	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_manage-identity-providers}	manage-identity-providers	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
a83e07cf-e87d-40ca-831a-6b67f0ac4714	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_manage-users}	manage-users	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
d1a7b303-33e0-4759-9489-a3531df3859b	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_view-authorization}	view-authorization	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
8a35d055-6927-499d-80a0-28d1b0280623	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_manage-events}	manage-events	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
23135309-3d58-4494-8baa-5876b4d953c8	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_view-identity-providers}	view-identity-providers	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
9481d47f-0f38-4168-8dc1-85ee90fd9952	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_realm-admin}	realm-admin	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
99dc3a13-e284-493d-b8db-956f1815b14e	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_manage-clients}	manage-clients	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
b3d3467f-bf0e-4beb-89c9-ed3f1c24218f	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_query-clients}	query-clients	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
2935c492-8f7b-4550-af8d-adf9f290ca4f	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_manage-realm}	manage-realm	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
19b8f94a-1c8c-4fe5-af5d-eb267875b316	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_query-groups}	query-groups	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
57f3ac97-4df1-4198-b534-9a363c819c27	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_view-realm}	view-realm	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
cc5e185c-5cc5-4b0d-9d60-a9e733f454ec	213ea3ce-b036-405f-8abd-3ee08ff72857	t	${role_manage-authorization}	manage-authorization	CX-Central	213ea3ce-b036-405f-8abd-3ee08ff72857	\N
2b074f06-a0b6-44b9-b066-31646a404bbd	789fed9d-e369-41db-92d9-5058e21fdd6d	t	Permission to access & view the registration process	view_registration	CX-Central	789fed9d-e369-41db-92d9-5058e21fdd6d	\N
384155f2-e2dd-4522-a376-297f5b46583e	789fed9d-e369-41db-92d9-5058e21fdd6d	t	\N	CX Admin	CX-Central	789fed9d-e369-41db-92d9-5058e21fdd6d	\N
d4e90553-21c6-4922-9b47-26ad2db306dc	789fed9d-e369-41db-92d9-5058e21fdd6d	t	\N	Company Admin	CX-Central	789fed9d-e369-41db-92d9-5058e21fdd6d	\N
52f58e84-eb22-4183-ae2e-79efc3b24ef8	789fed9d-e369-41db-92d9-5058e21fdd6d	t	User is able to confirm Terms & Conditions	sign_consent	CX-Central	789fed9d-e369-41db-92d9-5058e21fdd6d	\N
03d6eb50-c77f-4621-81d9-0f42768ff51f	789fed9d-e369-41db-92d9-5058e21fdd6d	t	\N	Legal Manager	CX-Central	789fed9d-e369-41db-92d9-5058e21fdd6d	\N
0dafac79-e275-4da4-93af-835065f13a58	789fed9d-e369-41db-92d9-5058e21fdd6d	t	User is able to add additional users to the registration process	invite_user	CX-Central	789fed9d-e369-41db-92d9-5058e21fdd6d	\N
b955a642-bad0-4673-861b-bf9e92671159	789fed9d-e369-41db-92d9-5058e21fdd6d	t	User is able to add / edit company data under the registration process	add_company_data	CX-Central	789fed9d-e369-41db-92d9-5058e21fdd6d	\N
0b785d01-ddac-48bc-bb3e-e31066b12938	789fed9d-e369-41db-92d9-5058e21fdd6d	t	User is able to submit the registration to Catena-X	submit_registration	CX-Central	789fed9d-e369-41db-92d9-5058e21fdd6d	\N
00cd4ea4-292d-4359-848d-43ae48a97a72	789fed9d-e369-41db-92d9-5058e21fdd6d	t	User is able to upload documents in the registration service	upload_documents	CX-Central	789fed9d-e369-41db-92d9-5058e21fdd6d	\N
27f270f7-c6a5-45c9-971b-ce5652d4e6d2	789fed9d-e369-41db-92d9-5058e21fdd6d	t	\N	Signing Manager	CX-Central	789fed9d-e369-41db-92d9-5058e21fdd6d	\N
46ba5c6e-7469-4a12-bbef-b753dd061b57	03885031-084a-4317-aa51-de9b4acf8fa9	t	${role_read-token}	read-token	CX-Central	03885031-084a-4317-aa51-de9b4acf8fa9	\N
1a1e42c6-28b7-4191-a52b-b97b72926c33	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	setup_idp	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
35f7681c-bd1d-45f5-a01a-73b7fa6bcdde	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	Add semantic model	add_semantic_model	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
d9315bb6-244b-45ca-af2d-6e547e6ae19f	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	update_semantic_model_released	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
de6280eb-825f-4c12-8f97-6d9086fbff7c	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	to be deleted	appstore_view	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
d8118fe7-8de0-46b3-b791-8de770117aba	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	User with this role can delete apps published in the Marketplace	delete_apps	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
00b1e417-c81c-4b22-ab32-feb36e74592f	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	to be deleted	digitaltwin_view	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
c4bc6cbd-9ecd-4022-b8c6-4858eae281ca	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	to be deleted	App Store - Buy	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
e8b9f782-d707-4852-a979-e5a08b19f3c7	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	CX Admin	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
d36cc7da-e188-4d7d-b17c-794f7008f97a	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	Users with this role can add digital twins in the digital twin registry	add_digitial_twin	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
86eaa072-ae2d-4c89-bb1b-70e9b3d45fe5	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	to be deleted	digitaltwin_addmodel	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
2f9c84f7-a3cb-4241-84a7-6d1195cabb59	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	Users with this role can view apps in the App Marketplace	view_apps	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
b72c63ff-3534-4897-9a81-1bc8cbff8a50	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	CX User	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
ad18a4ad-12fe-4693-a141-4c4005b4e4fc	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	to be deleted	Developer Hub	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
93ae3ba4-f3de-4a89-8d94-4838c144f3f4	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	Users with this right can view the client roles of an app	view_client_roles	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
2f66ff52-5bb8-4b17-909b-0e1c6f26ac97	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	Users with this role can publish new apps in the Marketplace	add_app	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
b5f93694-56c6-4b24-985b-b360017c84a5	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	Admin - User Management	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
418dfd6d-ec59-4a69-bd95-2d525e6379b0	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	Developer	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
a3cfdfd9-b45a-43b7-bb6d-8da52c7e3377	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	View existing data models	view_semantic_hub	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
e03e4f6a-5597-460b-94ee-159e053985c1	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	to be deleted	semantichub_view	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
229ee3da-b667-4fe3-87fa-58699c694223	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	Admin - Connector Setup	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
6ca94de0-4416-4f07-9394-05b0951c1afa	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	delete_semantic_model_draft	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
6fca2875-82e8-47cd-a9fd-2a0fcee0e315	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	DevOps Management	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
eb2c79a7-b646-4cee-8507-617c78c0f5ac	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	User with this role can connect their company connector or request a connector as a service	setup_connector	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
03b8efba-cb1d-4399-80b4-7cc7527ab72f	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	Users with this role can edit apps which are published in the marketplace	edit_apps	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
e718571c-b4bb-4c35-81a7-c37ca147c4c2	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	IT Admin	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
a2d6f8c4-2d25-48d3-b2b9-4b3e21fba09e	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	Users with this right can delete users related to their company	delete_user_account	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
eb8b9cbb-94a9-4258-b225-ada962d08885	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	Users with this role can filter apps in the App Marketplace	filter_apps	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
109e677c-8e37-46f8-abc1-0eeb2bfaf0c8	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	invite_new_partner	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
9b26b354-8775-4f60-b7e5-8a3fb684149a	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	to be deleted	semantic_addmodel	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
8d19604b-021e-488f-94fc-9a117f7bfd51	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	update_semantic_model_draft	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
55e1e90b-ccb4-4771-88ec-ba698696aef8	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	Business Admin	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
984c3e4f-5fb7-4dd6-882b-7c431febb8d9	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	to be deleted	appstore_updateapps	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
14371302-7db1-4804-8dd8-adcd4d0fde67	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	Users with this role can view the digital twin registry in the Portal	view_digital_twins	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
ee2da738-7f4e-4604-9dc7-4aa8a0a70431	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	to be deleted	BusinessUser	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
bafd0c12-4c66-4852-a0e3-0c57903aacda	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	delete_semantic_model_released	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
da118624-3bf9-46a7-8222-732effd7d0e4	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	to be deleted	appstore_filterapps	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
da4de06a-5315-4d0e-8d47-d3fb25e63269	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	Data Specialist	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
bfe97d4b-c2fb-40dc-a22c-202aca620b1d	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	Users with this right can add user accounts under their CX company	add_user_account	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
534ec9af-b909-41af-b33d-d1ba2ee30fc0	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	delete_digitial_twin	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
77f051b9-dda3-4cde-966d-eff8f2cdb7b9	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	Users with this right can access the user management in CX	view_user_management	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
22af7126-087a-459d-8aa1-2a047282371f	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	update_digitial_twin	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
d95f2bd5-0380-4f9b-832b-f80640426002	60313b78-e131-4358-9817-163ee938cc59	t	${role_manage-account}	manage-account	CX-Central	60313b78-e131-4358-9817-163ee938cc59	\N
b5c6e85f-92af-4ba1-b3af-08d6fb34f47b	60313b78-e131-4358-9817-163ee938cc59	t	${role_manage-account-links}	manage-account-links	CX-Central	60313b78-e131-4358-9817-163ee938cc59	\N
031152e1-b835-473f-a581-f23fd5807af3	60313b78-e131-4358-9817-163ee938cc59	t	${role_view-applications}	view-applications	CX-Central	60313b78-e131-4358-9817-163ee938cc59	\N
7d2a7e0f-652d-4b54-94c4-ba62d25fb686	60313b78-e131-4358-9817-163ee938cc59	t	${role_view-profile}	view-profile	CX-Central	60313b78-e131-4358-9817-163ee938cc59	\N
1c44f74b-db89-4017-94ec-21c9ee8ce7ea	60313b78-e131-4358-9817-163ee938cc59	t	${role_view-consent}	view-consent	CX-Central	60313b78-e131-4358-9817-163ee938cc59	\N
84e52241-1d69-46a9-98ad-7954369582f1	60313b78-e131-4358-9817-163ee938cc59	t	${role_manage-consent}	manage-consent	CX-Central	60313b78-e131-4358-9817-163ee938cc59	\N
1d7e915f-b970-485b-9071-a12b797e88aa	60313b78-e131-4358-9817-163ee938cc59	t	${role_delete-account}	delete-account	CX-Central	60313b78-e131-4358-9817-163ee938cc59	\N
4d87806a-dc8d-4784-9bf1-a918e4a53402	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	t	${role_impersonation}	impersonation	master	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	\N
6f98c370-cd5d-4ffa-9d38-26d39fdf6e25	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	view_submitted_applications	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
4db614c5-9c59-47a0-a63d-89407fa77810	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	add_tech_user_management	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
e7fa4253-9664-4bca-9c0f-966648d19b47	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	delete_tech_user_management	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
a718d689-a009-484d-a240-9ce86d922ea3	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	view_tech_user_management	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
c7e88346-ccb7-4d8c-ace3-e22722b2100f	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	t	\N	approve_new_partner	CX-Central	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.migration_model (id, version, update_time) FROM stdin;
s5r47	16.1.1	1648455280
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
25a3f657-30b7-47d0-b87b-abb388decf08	audience resolve	openid-connect	oidc-audience-resolve-mapper	5d7b9a9b-4ec1-4fa8-a4d4-41877e7e20e6	\N
aa6a8b77-2968-42dc-b478-5efd87561aee	locale	openid-connect	oidc-usermodel-attribute-mapper	d2280ca6-3454-407a-9683-f39e2a3031dc	\N
d0571446-19c2-469a-9cc6-c1c4849e6065	role list	saml	saml-role-list-mapper	\N	40241723-0925-42f6-b493-2d927e630745
ead88be1-53ec-4095-ad0c-0dfc19ec26b8	full name	openid-connect	oidc-full-name-mapper	\N	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2
1372fa13-84f8-45ae-a5b5-dd218e22d1b6	family name	openid-connect	oidc-usermodel-property-mapper	\N	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2
85d2b101-e039-4ec5-b8af-ad9551e1d2b4	given name	openid-connect	oidc-usermodel-property-mapper	\N	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2
2cd3d814-b6a7-4b9a-ae30-d8bc384644ed	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2
f2e1fa6c-31f4-4dcc-af2f-51d04a17cec8	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2
8e599cb5-5cd9-4bb9-b0b2-46b6eaef5daa	username	openid-connect	oidc-usermodel-property-mapper	\N	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2
82c14f71-134c-4ec1-b881-ed8e4e47429c	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2
707ab7b5-be93-4e82-a8e9-970c0489fc41	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2
d5d453ce-6fb6-486a-bc5e-b96fd2a12bd1	website	openid-connect	oidc-usermodel-attribute-mapper	\N	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2
48677423-90b3-4636-8f08-f292fa71d3db	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2
9203a54f-79ec-48f4-930d-9efab3ae8946	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2
6711a579-778c-4c77-a4d9-73a1db0cd31d	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2
8c388dcb-0df4-4632-84dd-4dc1304aaa1c	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2
b0c394af-6bd2-4689-a523-5c4147e6fc05	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	d1f04108-1dd3-4fb4-a9c6-8d82d46769d2
56426a88-f51f-48ce-8c66-2d1d010969b6	email	openid-connect	oidc-usermodel-property-mapper	\N	d48ebb40-f04c-4e49-a592-adcf9c89748c
0927680f-9a55-4d99-80db-74ed2122333b	email verified	openid-connect	oidc-usermodel-property-mapper	\N	d48ebb40-f04c-4e49-a592-adcf9c89748c
d1817f75-a346-4fe0-ac2e-24a028d596ad	address	openid-connect	oidc-address-mapper	\N	f6117e46-8f84-4562-b02b-a454870093f2
43db8254-4093-4d93-abc3-55d7eb9979fc	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	fcccf8cf-5e6d-434b-b681-4a9fc4295e23
852eb04d-2ff0-450f-81ee-91aaf213adb1	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	fcccf8cf-5e6d-434b-b681-4a9fc4295e23
2f01a5f3-268a-49c0-8b3b-3ce35fa4feaa	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	3fdddfbd-f44d-45db-b4ec-ea8ba26436a9
dd3c5b4c-93bf-453d-8e5b-3e15cc563f47	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	3fdddfbd-f44d-45db-b4ec-ea8ba26436a9
79ba188e-f866-4b22-b71e-bd6a81d731e2	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	3fdddfbd-f44d-45db-b4ec-ea8ba26436a9
e2d11a12-3e53-44d5-ba93-c7259053a79d	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	384d1be6-14dd-4438-8de2-765a4c8b841e
84049c61-be99-4f7b-88b5-cc57e24c5b5c	upn	openid-connect	oidc-usermodel-property-mapper	\N	b0e34d62-4ec6-422d-9992-7bf5ce09df18
e861b5b6-2873-4854-bdb9-c40bc00905a1	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	b0e34d62-4ec6-422d-9992-7bf5ce09df18
6c0bfbc5-e3d7-45f9-a0bc-61e30225e22b	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	13834c57-9211-4e3e-b892-0632a3c15225
8868b283-df78-4c9a-b78e-1c29e4b9b61c	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	13834c57-9211-4e3e-b892-0632a3c15225
0adf14b5-a345-4d20-83cc-2a353c686161	role list	saml	saml-role-list-mapper	\N	23e5acb7-2d8c-4bca-8565-36fb57ee7ee0
73a111cf-271c-4b9f-abca-e4894e29229d	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	fc35a8f5-fedd-4b66-b3fa-9427e3947dc5
c06270fe-f203-4c9b-92a8-ff716b81127a	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	fc35a8f5-fedd-4b66-b3fa-9427e3947dc5
8e22da0e-f450-444a-80b4-824a69532949	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	fc35a8f5-fedd-4b66-b3fa-9427e3947dc5
0543fff7-3732-433b-8a24-d2784bba1501	address	openid-connect	oidc-address-mapper	\N	09dc23a3-1b9f-4b9d-aa87-e875f0f20655
955c2cb6-3abb-44d1-a3eb-9ebec0cf6094	upn	openid-connect	oidc-usermodel-property-mapper	\N	34a2f332-9752-4a7f-9d61-b4dbd40946b4
48b4aa99-383c-4178-b966-c0ae710d8c21	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	34a2f332-9752-4a7f-9d61-b4dbd40946b4
987e5408-e6ef-4cd2-a51f-451fb7c0dc4e	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	e24a7d06-7406-4b2f-854e-a5653f8b964f
1a9bd37a-377a-48ae-9b95-a1c0c5f3fa08	username	openid-connect	oidc-usermodel-property-mapper	\N	e24a7d06-7406-4b2f-854e-a5653f8b964f
dca5ee31-87cb-407b-aba6-d6c846e6a6b4	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	e24a7d06-7406-4b2f-854e-a5653f8b964f
6af98429-3234-4f57-95c0-7df4209cb349	family name	openid-connect	oidc-usermodel-property-mapper	\N	e24a7d06-7406-4b2f-854e-a5653f8b964f
b7e70ea0-1b54-469b-b818-dcb7d4657d9b	given name	openid-connect	oidc-usermodel-property-mapper	\N	e24a7d06-7406-4b2f-854e-a5653f8b964f
02aff4ea-454c-41cf-8bf6-1bea1e933812	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	e24a7d06-7406-4b2f-854e-a5653f8b964f
438a5f2c-727b-4ba2-82de-d5cf4b8d4daa	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	e24a7d06-7406-4b2f-854e-a5653f8b964f
70bf1855-c34a-4bd3-a06d-f3d62d91693b	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	e24a7d06-7406-4b2f-854e-a5653f8b964f
0c9106a1-9c93-47bd-85b3-8607ba8485c2	full name	openid-connect	oidc-full-name-mapper	\N	e24a7d06-7406-4b2f-854e-a5653f8b964f
4386dc68-8dd3-4439-8c63-eabcdb92fd76	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	e24a7d06-7406-4b2f-854e-a5653f8b964f
78be8eb6-ca31-434c-8441-6abbfe553a22	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	e24a7d06-7406-4b2f-854e-a5653f8b964f
fb918735-48a7-4f96-8830-606815788dfb	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	e24a7d06-7406-4b2f-854e-a5653f8b964f
6e4e8483-7c58-4539-98d1-4b02ff5dc6f5	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	e24a7d06-7406-4b2f-854e-a5653f8b964f
58e59849-6457-4c8b-b713-2c5a008461c6	website	openid-connect	oidc-usermodel-attribute-mapper	\N	e24a7d06-7406-4b2f-854e-a5653f8b964f
2c452702-a301-4cc7-b76c-619b23f44fa0	email verified	openid-connect	oidc-usermodel-property-mapper	\N	8a14f08a-0ba9-44ae-83bd-5a65b9d0fe8c
1e6f0566-fc33-4e1f-bf4e-686676fcde70	email	openid-connect	oidc-usermodel-property-mapper	\N	8a14f08a-0ba9-44ae-83bd-5a65b9d0fe8c
07ab75f1-40a3-4b2c-ae83-94dac6e529e2	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	2629904c-d708-4072-9fe4-98e4a30c7dde
a3b92823-3028-45b8-a59b-aa679d4b5774	audience resolve	openid-connect	oidc-audience-resolve-mapper	2d37c8a9-7036-4e36-a085-12fec6e22938	\N
7032993a-ee90-4ac3-84c7-e39014732523	idp mapper	openid-connect	oidc-usermodel-attribute-mapper	2d37c8a9-7036-4e36-a085-12fec6e22938	\N
540b21f4-b5e5-41ff-9f10-8a85268baa49	idp mapper	openid-connect	oidc-usermodel-attribute-mapper	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
9c248eae-4081-4bdd-8255-522d63cdd4c7	Cl1-CX-Registration audience-mapper	openid-connect	oidc-audience-mapper	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
c6d77a7d-5171-44d9-a659-22b9daea784c	organisation-mapper	openid-connect	oidc-usermodel-attribute-mapper	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
94eccfae-488f-43b9-8771-72dbdb558fe1	BPN	openid-connect	oidc-usermodel-attribute-mapper	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
13a97a74-91e3-480f-8bbf-cb4b30c8688a	Cl2-CX-Portal audience-mapper	openid-connect	oidc-audience-mapper	dd8c6ef1-a56f-4114-8918-6c7fc2057e34	\N
5eb2df4d-608a-4338-8f6a-171c82f2abbd	idp mapper	openid-connect	oidc-usermodel-attribute-mapper	789fed9d-e369-41db-92d9-5058e21fdd6d	\N
ee07bab9-a017-44b9-b82c-c4d62670516d	audience-mapper	openid-connect	oidc-audience-mapper	789fed9d-e369-41db-92d9-5058e21fdd6d	\N
2423df79-1ca8-40eb-915e-29cee841111c	organisation-mapper	openid-connect	oidc-usermodel-attribute-mapper	789fed9d-e369-41db-92d9-5058e21fdd6d	\N
84577355-e775-4f09-9bb0-5c0f547b4f2d	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	\N
85546302-2448-40f8-bd89-eba6c3fb0950	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	\N
7b979fe6-32fd-4b76-ad28-2825042e9ed0	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	\N
12d9df9a-241b-4ec2-bafa-3f26ccaa1890	locale	openid-connect	oidc-usermodel-attribute-mapper	d5265cd8-d128-4dc9-8602-d49d1df0a86c	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
aa6a8b77-2968-42dc-b478-5efd87561aee	true	userinfo.token.claim
aa6a8b77-2968-42dc-b478-5efd87561aee	locale	user.attribute
aa6a8b77-2968-42dc-b478-5efd87561aee	true	id.token.claim
aa6a8b77-2968-42dc-b478-5efd87561aee	true	access.token.claim
aa6a8b77-2968-42dc-b478-5efd87561aee	locale	claim.name
aa6a8b77-2968-42dc-b478-5efd87561aee	String	jsonType.label
d0571446-19c2-469a-9cc6-c1c4849e6065	false	single
d0571446-19c2-469a-9cc6-c1c4849e6065	Basic	attribute.nameformat
d0571446-19c2-469a-9cc6-c1c4849e6065	Role	attribute.name
ead88be1-53ec-4095-ad0c-0dfc19ec26b8	true	userinfo.token.claim
ead88be1-53ec-4095-ad0c-0dfc19ec26b8	true	id.token.claim
ead88be1-53ec-4095-ad0c-0dfc19ec26b8	true	access.token.claim
1372fa13-84f8-45ae-a5b5-dd218e22d1b6	true	userinfo.token.claim
1372fa13-84f8-45ae-a5b5-dd218e22d1b6	lastName	user.attribute
1372fa13-84f8-45ae-a5b5-dd218e22d1b6	true	id.token.claim
1372fa13-84f8-45ae-a5b5-dd218e22d1b6	true	access.token.claim
1372fa13-84f8-45ae-a5b5-dd218e22d1b6	family_name	claim.name
1372fa13-84f8-45ae-a5b5-dd218e22d1b6	String	jsonType.label
85d2b101-e039-4ec5-b8af-ad9551e1d2b4	true	userinfo.token.claim
85d2b101-e039-4ec5-b8af-ad9551e1d2b4	firstName	user.attribute
85d2b101-e039-4ec5-b8af-ad9551e1d2b4	true	id.token.claim
85d2b101-e039-4ec5-b8af-ad9551e1d2b4	true	access.token.claim
85d2b101-e039-4ec5-b8af-ad9551e1d2b4	given_name	claim.name
85d2b101-e039-4ec5-b8af-ad9551e1d2b4	String	jsonType.label
2cd3d814-b6a7-4b9a-ae30-d8bc384644ed	true	userinfo.token.claim
2cd3d814-b6a7-4b9a-ae30-d8bc384644ed	middleName	user.attribute
2cd3d814-b6a7-4b9a-ae30-d8bc384644ed	true	id.token.claim
2cd3d814-b6a7-4b9a-ae30-d8bc384644ed	true	access.token.claim
2cd3d814-b6a7-4b9a-ae30-d8bc384644ed	middle_name	claim.name
2cd3d814-b6a7-4b9a-ae30-d8bc384644ed	String	jsonType.label
f2e1fa6c-31f4-4dcc-af2f-51d04a17cec8	true	userinfo.token.claim
f2e1fa6c-31f4-4dcc-af2f-51d04a17cec8	nickname	user.attribute
f2e1fa6c-31f4-4dcc-af2f-51d04a17cec8	true	id.token.claim
f2e1fa6c-31f4-4dcc-af2f-51d04a17cec8	true	access.token.claim
f2e1fa6c-31f4-4dcc-af2f-51d04a17cec8	nickname	claim.name
f2e1fa6c-31f4-4dcc-af2f-51d04a17cec8	String	jsonType.label
8e599cb5-5cd9-4bb9-b0b2-46b6eaef5daa	true	userinfo.token.claim
8e599cb5-5cd9-4bb9-b0b2-46b6eaef5daa	username	user.attribute
8e599cb5-5cd9-4bb9-b0b2-46b6eaef5daa	true	id.token.claim
8e599cb5-5cd9-4bb9-b0b2-46b6eaef5daa	true	access.token.claim
8e599cb5-5cd9-4bb9-b0b2-46b6eaef5daa	preferred_username	claim.name
8e599cb5-5cd9-4bb9-b0b2-46b6eaef5daa	String	jsonType.label
82c14f71-134c-4ec1-b881-ed8e4e47429c	true	userinfo.token.claim
82c14f71-134c-4ec1-b881-ed8e4e47429c	profile	user.attribute
82c14f71-134c-4ec1-b881-ed8e4e47429c	true	id.token.claim
82c14f71-134c-4ec1-b881-ed8e4e47429c	true	access.token.claim
82c14f71-134c-4ec1-b881-ed8e4e47429c	profile	claim.name
82c14f71-134c-4ec1-b881-ed8e4e47429c	String	jsonType.label
707ab7b5-be93-4e82-a8e9-970c0489fc41	true	userinfo.token.claim
707ab7b5-be93-4e82-a8e9-970c0489fc41	picture	user.attribute
707ab7b5-be93-4e82-a8e9-970c0489fc41	true	id.token.claim
707ab7b5-be93-4e82-a8e9-970c0489fc41	true	access.token.claim
707ab7b5-be93-4e82-a8e9-970c0489fc41	picture	claim.name
707ab7b5-be93-4e82-a8e9-970c0489fc41	String	jsonType.label
d5d453ce-6fb6-486a-bc5e-b96fd2a12bd1	true	userinfo.token.claim
d5d453ce-6fb6-486a-bc5e-b96fd2a12bd1	website	user.attribute
d5d453ce-6fb6-486a-bc5e-b96fd2a12bd1	true	id.token.claim
d5d453ce-6fb6-486a-bc5e-b96fd2a12bd1	true	access.token.claim
d5d453ce-6fb6-486a-bc5e-b96fd2a12bd1	website	claim.name
d5d453ce-6fb6-486a-bc5e-b96fd2a12bd1	String	jsonType.label
48677423-90b3-4636-8f08-f292fa71d3db	true	userinfo.token.claim
48677423-90b3-4636-8f08-f292fa71d3db	gender	user.attribute
48677423-90b3-4636-8f08-f292fa71d3db	true	id.token.claim
48677423-90b3-4636-8f08-f292fa71d3db	true	access.token.claim
48677423-90b3-4636-8f08-f292fa71d3db	gender	claim.name
48677423-90b3-4636-8f08-f292fa71d3db	String	jsonType.label
9203a54f-79ec-48f4-930d-9efab3ae8946	true	userinfo.token.claim
9203a54f-79ec-48f4-930d-9efab3ae8946	birthdate	user.attribute
9203a54f-79ec-48f4-930d-9efab3ae8946	true	id.token.claim
9203a54f-79ec-48f4-930d-9efab3ae8946	true	access.token.claim
9203a54f-79ec-48f4-930d-9efab3ae8946	birthdate	claim.name
9203a54f-79ec-48f4-930d-9efab3ae8946	String	jsonType.label
6711a579-778c-4c77-a4d9-73a1db0cd31d	true	userinfo.token.claim
6711a579-778c-4c77-a4d9-73a1db0cd31d	zoneinfo	user.attribute
6711a579-778c-4c77-a4d9-73a1db0cd31d	true	id.token.claim
6711a579-778c-4c77-a4d9-73a1db0cd31d	true	access.token.claim
6711a579-778c-4c77-a4d9-73a1db0cd31d	zoneinfo	claim.name
6711a579-778c-4c77-a4d9-73a1db0cd31d	String	jsonType.label
8c388dcb-0df4-4632-84dd-4dc1304aaa1c	true	userinfo.token.claim
8c388dcb-0df4-4632-84dd-4dc1304aaa1c	locale	user.attribute
8c388dcb-0df4-4632-84dd-4dc1304aaa1c	true	id.token.claim
8c388dcb-0df4-4632-84dd-4dc1304aaa1c	true	access.token.claim
8c388dcb-0df4-4632-84dd-4dc1304aaa1c	locale	claim.name
8c388dcb-0df4-4632-84dd-4dc1304aaa1c	String	jsonType.label
b0c394af-6bd2-4689-a523-5c4147e6fc05	true	userinfo.token.claim
b0c394af-6bd2-4689-a523-5c4147e6fc05	updatedAt	user.attribute
b0c394af-6bd2-4689-a523-5c4147e6fc05	true	id.token.claim
b0c394af-6bd2-4689-a523-5c4147e6fc05	true	access.token.claim
b0c394af-6bd2-4689-a523-5c4147e6fc05	updated_at	claim.name
b0c394af-6bd2-4689-a523-5c4147e6fc05	String	jsonType.label
56426a88-f51f-48ce-8c66-2d1d010969b6	true	userinfo.token.claim
56426a88-f51f-48ce-8c66-2d1d010969b6	email	user.attribute
56426a88-f51f-48ce-8c66-2d1d010969b6	true	id.token.claim
56426a88-f51f-48ce-8c66-2d1d010969b6	true	access.token.claim
56426a88-f51f-48ce-8c66-2d1d010969b6	email	claim.name
56426a88-f51f-48ce-8c66-2d1d010969b6	String	jsonType.label
0927680f-9a55-4d99-80db-74ed2122333b	true	userinfo.token.claim
0927680f-9a55-4d99-80db-74ed2122333b	emailVerified	user.attribute
0927680f-9a55-4d99-80db-74ed2122333b	true	id.token.claim
0927680f-9a55-4d99-80db-74ed2122333b	true	access.token.claim
0927680f-9a55-4d99-80db-74ed2122333b	email_verified	claim.name
0927680f-9a55-4d99-80db-74ed2122333b	boolean	jsonType.label
d1817f75-a346-4fe0-ac2e-24a028d596ad	formatted	user.attribute.formatted
d1817f75-a346-4fe0-ac2e-24a028d596ad	country	user.attribute.country
d1817f75-a346-4fe0-ac2e-24a028d596ad	postal_code	user.attribute.postal_code
d1817f75-a346-4fe0-ac2e-24a028d596ad	true	userinfo.token.claim
d1817f75-a346-4fe0-ac2e-24a028d596ad	street	user.attribute.street
d1817f75-a346-4fe0-ac2e-24a028d596ad	true	id.token.claim
d1817f75-a346-4fe0-ac2e-24a028d596ad	region	user.attribute.region
d1817f75-a346-4fe0-ac2e-24a028d596ad	true	access.token.claim
d1817f75-a346-4fe0-ac2e-24a028d596ad	locality	user.attribute.locality
43db8254-4093-4d93-abc3-55d7eb9979fc	true	userinfo.token.claim
43db8254-4093-4d93-abc3-55d7eb9979fc	phoneNumber	user.attribute
43db8254-4093-4d93-abc3-55d7eb9979fc	true	id.token.claim
43db8254-4093-4d93-abc3-55d7eb9979fc	true	access.token.claim
43db8254-4093-4d93-abc3-55d7eb9979fc	phone_number	claim.name
43db8254-4093-4d93-abc3-55d7eb9979fc	String	jsonType.label
852eb04d-2ff0-450f-81ee-91aaf213adb1	true	userinfo.token.claim
852eb04d-2ff0-450f-81ee-91aaf213adb1	phoneNumberVerified	user.attribute
852eb04d-2ff0-450f-81ee-91aaf213adb1	true	id.token.claim
852eb04d-2ff0-450f-81ee-91aaf213adb1	true	access.token.claim
852eb04d-2ff0-450f-81ee-91aaf213adb1	phone_number_verified	claim.name
852eb04d-2ff0-450f-81ee-91aaf213adb1	boolean	jsonType.label
2f01a5f3-268a-49c0-8b3b-3ce35fa4feaa	true	multivalued
2f01a5f3-268a-49c0-8b3b-3ce35fa4feaa	foo	user.attribute
2f01a5f3-268a-49c0-8b3b-3ce35fa4feaa	true	access.token.claim
2f01a5f3-268a-49c0-8b3b-3ce35fa4feaa	realm_access.roles	claim.name
2f01a5f3-268a-49c0-8b3b-3ce35fa4feaa	String	jsonType.label
dd3c5b4c-93bf-453d-8e5b-3e15cc563f47	true	multivalued
dd3c5b4c-93bf-453d-8e5b-3e15cc563f47	foo	user.attribute
dd3c5b4c-93bf-453d-8e5b-3e15cc563f47	true	access.token.claim
dd3c5b4c-93bf-453d-8e5b-3e15cc563f47	resource_access.${client_id}.roles	claim.name
dd3c5b4c-93bf-453d-8e5b-3e15cc563f47	String	jsonType.label
84049c61-be99-4f7b-88b5-cc57e24c5b5c	true	userinfo.token.claim
84049c61-be99-4f7b-88b5-cc57e24c5b5c	username	user.attribute
84049c61-be99-4f7b-88b5-cc57e24c5b5c	true	id.token.claim
84049c61-be99-4f7b-88b5-cc57e24c5b5c	true	access.token.claim
84049c61-be99-4f7b-88b5-cc57e24c5b5c	upn	claim.name
84049c61-be99-4f7b-88b5-cc57e24c5b5c	String	jsonType.label
e861b5b6-2873-4854-bdb9-c40bc00905a1	true	multivalued
e861b5b6-2873-4854-bdb9-c40bc00905a1	foo	user.attribute
e861b5b6-2873-4854-bdb9-c40bc00905a1	true	id.token.claim
e861b5b6-2873-4854-bdb9-c40bc00905a1	true	access.token.claim
e861b5b6-2873-4854-bdb9-c40bc00905a1	groups	claim.name
e861b5b6-2873-4854-bdb9-c40bc00905a1	String	jsonType.label
6c0bfbc5-e3d7-45f9-a0bc-61e30225e22b	true	userinfo.token.claim
6c0bfbc5-e3d7-45f9-a0bc-61e30225e22b	phoneNumberVerified	user.attribute
6c0bfbc5-e3d7-45f9-a0bc-61e30225e22b	true	id.token.claim
6c0bfbc5-e3d7-45f9-a0bc-61e30225e22b	true	access.token.claim
6c0bfbc5-e3d7-45f9-a0bc-61e30225e22b	phone_number_verified	claim.name
6c0bfbc5-e3d7-45f9-a0bc-61e30225e22b	boolean	jsonType.label
8868b283-df78-4c9a-b78e-1c29e4b9b61c	true	userinfo.token.claim
8868b283-df78-4c9a-b78e-1c29e4b9b61c	phoneNumber	user.attribute
8868b283-df78-4c9a-b78e-1c29e4b9b61c	true	id.token.claim
8868b283-df78-4c9a-b78e-1c29e4b9b61c	true	access.token.claim
8868b283-df78-4c9a-b78e-1c29e4b9b61c	phone_number	claim.name
8868b283-df78-4c9a-b78e-1c29e4b9b61c	String	jsonType.label
0adf14b5-a345-4d20-83cc-2a353c686161	false	single
0adf14b5-a345-4d20-83cc-2a353c686161	Basic	attribute.nameformat
0adf14b5-a345-4d20-83cc-2a353c686161	Role	attribute.name
73a111cf-271c-4b9f-abca-e4894e29229d	true	multivalued
73a111cf-271c-4b9f-abca-e4894e29229d	false	userinfo.token.claim
73a111cf-271c-4b9f-abca-e4894e29229d	foo	user.attribute
73a111cf-271c-4b9f-abca-e4894e29229d	false	id.token.claim
73a111cf-271c-4b9f-abca-e4894e29229d	true	access.token.claim
73a111cf-271c-4b9f-abca-e4894e29229d	realm_access.roles	claim.name
73a111cf-271c-4b9f-abca-e4894e29229d	String	jsonType.label
8e22da0e-f450-444a-80b4-824a69532949	foo	user.attribute
8e22da0e-f450-444a-80b4-824a69532949	true	access.token.claim
8e22da0e-f450-444a-80b4-824a69532949	resource_access.${client_id}.roles	claim.name
8e22da0e-f450-444a-80b4-824a69532949	String	jsonType.label
8e22da0e-f450-444a-80b4-824a69532949	true	multivalued
0543fff7-3732-433b-8a24-d2784bba1501	formatted	user.attribute.formatted
0543fff7-3732-433b-8a24-d2784bba1501	country	user.attribute.country
0543fff7-3732-433b-8a24-d2784bba1501	postal_code	user.attribute.postal_code
0543fff7-3732-433b-8a24-d2784bba1501	true	userinfo.token.claim
0543fff7-3732-433b-8a24-d2784bba1501	street	user.attribute.street
0543fff7-3732-433b-8a24-d2784bba1501	true	id.token.claim
0543fff7-3732-433b-8a24-d2784bba1501	region	user.attribute.region
0543fff7-3732-433b-8a24-d2784bba1501	true	access.token.claim
0543fff7-3732-433b-8a24-d2784bba1501	locality	user.attribute.locality
955c2cb6-3abb-44d1-a3eb-9ebec0cf6094	true	userinfo.token.claim
955c2cb6-3abb-44d1-a3eb-9ebec0cf6094	username	user.attribute
955c2cb6-3abb-44d1-a3eb-9ebec0cf6094	true	id.token.claim
955c2cb6-3abb-44d1-a3eb-9ebec0cf6094	true	access.token.claim
955c2cb6-3abb-44d1-a3eb-9ebec0cf6094	upn	claim.name
955c2cb6-3abb-44d1-a3eb-9ebec0cf6094	String	jsonType.label
48b4aa99-383c-4178-b966-c0ae710d8c21	true	multivalued
48b4aa99-383c-4178-b966-c0ae710d8c21	true	userinfo.token.claim
48b4aa99-383c-4178-b966-c0ae710d8c21	foo	user.attribute
48b4aa99-383c-4178-b966-c0ae710d8c21	true	id.token.claim
48b4aa99-383c-4178-b966-c0ae710d8c21	true	access.token.claim
48b4aa99-383c-4178-b966-c0ae710d8c21	groups	claim.name
48b4aa99-383c-4178-b966-c0ae710d8c21	String	jsonType.label
987e5408-e6ef-4cd2-a51f-451fb7c0dc4e	true	userinfo.token.claim
987e5408-e6ef-4cd2-a51f-451fb7c0dc4e	locale	user.attribute
987e5408-e6ef-4cd2-a51f-451fb7c0dc4e	true	id.token.claim
987e5408-e6ef-4cd2-a51f-451fb7c0dc4e	true	access.token.claim
987e5408-e6ef-4cd2-a51f-451fb7c0dc4e	locale	claim.name
987e5408-e6ef-4cd2-a51f-451fb7c0dc4e	String	jsonType.label
1a9bd37a-377a-48ae-9b95-a1c0c5f3fa08	true	userinfo.token.claim
1a9bd37a-377a-48ae-9b95-a1c0c5f3fa08	username	user.attribute
1a9bd37a-377a-48ae-9b95-a1c0c5f3fa08	true	id.token.claim
1a9bd37a-377a-48ae-9b95-a1c0c5f3fa08	true	access.token.claim
1a9bd37a-377a-48ae-9b95-a1c0c5f3fa08	preferred_username	claim.name
1a9bd37a-377a-48ae-9b95-a1c0c5f3fa08	String	jsonType.label
dca5ee31-87cb-407b-aba6-d6c846e6a6b4	true	userinfo.token.claim
dca5ee31-87cb-407b-aba6-d6c846e6a6b4	zoneinfo	user.attribute
dca5ee31-87cb-407b-aba6-d6c846e6a6b4	true	id.token.claim
dca5ee31-87cb-407b-aba6-d6c846e6a6b4	true	access.token.claim
dca5ee31-87cb-407b-aba6-d6c846e6a6b4	zoneinfo	claim.name
dca5ee31-87cb-407b-aba6-d6c846e6a6b4	String	jsonType.label
6af98429-3234-4f57-95c0-7df4209cb349	true	userinfo.token.claim
6af98429-3234-4f57-95c0-7df4209cb349	lastName	user.attribute
6af98429-3234-4f57-95c0-7df4209cb349	true	id.token.claim
6af98429-3234-4f57-95c0-7df4209cb349	true	access.token.claim
6af98429-3234-4f57-95c0-7df4209cb349	family_name	claim.name
6af98429-3234-4f57-95c0-7df4209cb349	String	jsonType.label
b7e70ea0-1b54-469b-b818-dcb7d4657d9b	true	userinfo.token.claim
b7e70ea0-1b54-469b-b818-dcb7d4657d9b	firstName	user.attribute
b7e70ea0-1b54-469b-b818-dcb7d4657d9b	true	id.token.claim
b7e70ea0-1b54-469b-b818-dcb7d4657d9b	true	access.token.claim
b7e70ea0-1b54-469b-b818-dcb7d4657d9b	given_name	claim.name
b7e70ea0-1b54-469b-b818-dcb7d4657d9b	String	jsonType.label
02aff4ea-454c-41cf-8bf6-1bea1e933812	true	userinfo.token.claim
02aff4ea-454c-41cf-8bf6-1bea1e933812	nickname	user.attribute
02aff4ea-454c-41cf-8bf6-1bea1e933812	true	id.token.claim
02aff4ea-454c-41cf-8bf6-1bea1e933812	true	access.token.claim
02aff4ea-454c-41cf-8bf6-1bea1e933812	nickname	claim.name
02aff4ea-454c-41cf-8bf6-1bea1e933812	String	jsonType.label
438a5f2c-727b-4ba2-82de-d5cf4b8d4daa	true	userinfo.token.claim
438a5f2c-727b-4ba2-82de-d5cf4b8d4daa	gender	user.attribute
438a5f2c-727b-4ba2-82de-d5cf4b8d4daa	true	id.token.claim
438a5f2c-727b-4ba2-82de-d5cf4b8d4daa	true	access.token.claim
438a5f2c-727b-4ba2-82de-d5cf4b8d4daa	gender	claim.name
438a5f2c-727b-4ba2-82de-d5cf4b8d4daa	String	jsonType.label
70bf1855-c34a-4bd3-a06d-f3d62d91693b	true	userinfo.token.claim
70bf1855-c34a-4bd3-a06d-f3d62d91693b	middleName	user.attribute
70bf1855-c34a-4bd3-a06d-f3d62d91693b	true	id.token.claim
70bf1855-c34a-4bd3-a06d-f3d62d91693b	true	access.token.claim
70bf1855-c34a-4bd3-a06d-f3d62d91693b	middle_name	claim.name
70bf1855-c34a-4bd3-a06d-f3d62d91693b	String	jsonType.label
0c9106a1-9c93-47bd-85b3-8607ba8485c2	true	id.token.claim
0c9106a1-9c93-47bd-85b3-8607ba8485c2	true	access.token.claim
0c9106a1-9c93-47bd-85b3-8607ba8485c2	true	userinfo.token.claim
4386dc68-8dd3-4439-8c63-eabcdb92fd76	true	userinfo.token.claim
4386dc68-8dd3-4439-8c63-eabcdb92fd76	birthdate	user.attribute
4386dc68-8dd3-4439-8c63-eabcdb92fd76	true	id.token.claim
4386dc68-8dd3-4439-8c63-eabcdb92fd76	true	access.token.claim
4386dc68-8dd3-4439-8c63-eabcdb92fd76	birthdate	claim.name
4386dc68-8dd3-4439-8c63-eabcdb92fd76	String	jsonType.label
78be8eb6-ca31-434c-8441-6abbfe553a22	true	userinfo.token.claim
78be8eb6-ca31-434c-8441-6abbfe553a22	profile	user.attribute
78be8eb6-ca31-434c-8441-6abbfe553a22	true	id.token.claim
78be8eb6-ca31-434c-8441-6abbfe553a22	true	access.token.claim
78be8eb6-ca31-434c-8441-6abbfe553a22	profile	claim.name
78be8eb6-ca31-434c-8441-6abbfe553a22	String	jsonType.label
fb918735-48a7-4f96-8830-606815788dfb	true	userinfo.token.claim
fb918735-48a7-4f96-8830-606815788dfb	picture	user.attribute
fb918735-48a7-4f96-8830-606815788dfb	true	id.token.claim
fb918735-48a7-4f96-8830-606815788dfb	true	access.token.claim
fb918735-48a7-4f96-8830-606815788dfb	picture	claim.name
fb918735-48a7-4f96-8830-606815788dfb	String	jsonType.label
6e4e8483-7c58-4539-98d1-4b02ff5dc6f5	true	userinfo.token.claim
6e4e8483-7c58-4539-98d1-4b02ff5dc6f5	updatedAt	user.attribute
6e4e8483-7c58-4539-98d1-4b02ff5dc6f5	true	id.token.claim
6e4e8483-7c58-4539-98d1-4b02ff5dc6f5	true	access.token.claim
6e4e8483-7c58-4539-98d1-4b02ff5dc6f5	updated_at	claim.name
6e4e8483-7c58-4539-98d1-4b02ff5dc6f5	String	jsonType.label
58e59849-6457-4c8b-b713-2c5a008461c6	true	userinfo.token.claim
58e59849-6457-4c8b-b713-2c5a008461c6	website	user.attribute
58e59849-6457-4c8b-b713-2c5a008461c6	true	id.token.claim
58e59849-6457-4c8b-b713-2c5a008461c6	true	access.token.claim
58e59849-6457-4c8b-b713-2c5a008461c6	website	claim.name
58e59849-6457-4c8b-b713-2c5a008461c6	String	jsonType.label
2c452702-a301-4cc7-b76c-619b23f44fa0	true	userinfo.token.claim
2c452702-a301-4cc7-b76c-619b23f44fa0	emailVerified	user.attribute
2c452702-a301-4cc7-b76c-619b23f44fa0	true	id.token.claim
2c452702-a301-4cc7-b76c-619b23f44fa0	true	access.token.claim
2c452702-a301-4cc7-b76c-619b23f44fa0	email_verified	claim.name
2c452702-a301-4cc7-b76c-619b23f44fa0	boolean	jsonType.label
1e6f0566-fc33-4e1f-bf4e-686676fcde70	false	userinfo.token.claim
1e6f0566-fc33-4e1f-bf4e-686676fcde70	email	user.attribute
1e6f0566-fc33-4e1f-bf4e-686676fcde70	true	id.token.claim
1e6f0566-fc33-4e1f-bf4e-686676fcde70	true	access.token.claim
1e6f0566-fc33-4e1f-bf4e-686676fcde70	email	claim.name
1e6f0566-fc33-4e1f-bf4e-686676fcde70	String	jsonType.label
7032993a-ee90-4ac3-84c7-e39014732523	true	userinfo.token.claim
7032993a-ee90-4ac3-84c7-e39014732523	idp	user.attribute
7032993a-ee90-4ac3-84c7-e39014732523	true	id.token.claim
7032993a-ee90-4ac3-84c7-e39014732523	true	access.token.claim
7032993a-ee90-4ac3-84c7-e39014732523	tenant	claim.name
7032993a-ee90-4ac3-84c7-e39014732523	String	jsonType.label
540b21f4-b5e5-41ff-9f10-8a85268baa49	true	userinfo.token.claim
540b21f4-b5e5-41ff-9f10-8a85268baa49	tenant	user.attribute
540b21f4-b5e5-41ff-9f10-8a85268baa49	true	id.token.claim
540b21f4-b5e5-41ff-9f10-8a85268baa49	true	access.token.claim
540b21f4-b5e5-41ff-9f10-8a85268baa49	tenant	claim.name
540b21f4-b5e5-41ff-9f10-8a85268baa49	String	jsonType.label
9c248eae-4081-4bdd-8255-522d63cdd4c7	Cl1-CX-Registration	included.client.audience
9c248eae-4081-4bdd-8255-522d63cdd4c7	true	id.token.claim
9c248eae-4081-4bdd-8255-522d63cdd4c7	true	access.token.claim
9c248eae-4081-4bdd-8255-522d63cdd4c7	true	userinfo.token.claim
c6d77a7d-5171-44d9-a659-22b9daea784c	true	userinfo.token.claim
c6d77a7d-5171-44d9-a659-22b9daea784c	organisation	user.attribute
c6d77a7d-5171-44d9-a659-22b9daea784c	true	id.token.claim
c6d77a7d-5171-44d9-a659-22b9daea784c	true	access.token.claim
c6d77a7d-5171-44d9-a659-22b9daea784c	organisation	claim.name
c6d77a7d-5171-44d9-a659-22b9daea784c	String	jsonType.label
94eccfae-488f-43b9-8771-72dbdb558fe1	false	userinfo.token.claim
94eccfae-488f-43b9-8771-72dbdb558fe1	bpn	user.attribute
94eccfae-488f-43b9-8771-72dbdb558fe1	false	id.token.claim
94eccfae-488f-43b9-8771-72dbdb558fe1	true	access.token.claim
94eccfae-488f-43b9-8771-72dbdb558fe1	bpn	claim.name
94eccfae-488f-43b9-8771-72dbdb558fe1	String	jsonType.label
13a97a74-91e3-480f-8bbf-cb4b30c8688a	Cl2-CX-Portal	included.client.audience
13a97a74-91e3-480f-8bbf-cb4b30c8688a	true	id.token.claim
13a97a74-91e3-480f-8bbf-cb4b30c8688a	true	access.token.claim
13a97a74-91e3-480f-8bbf-cb4b30c8688a	true	userinfo.token.claim
5eb2df4d-608a-4338-8f6a-171c82f2abbd	true	userinfo.token.claim
5eb2df4d-608a-4338-8f6a-171c82f2abbd	tenant	user.attribute
5eb2df4d-608a-4338-8f6a-171c82f2abbd	true	id.token.claim
5eb2df4d-608a-4338-8f6a-171c82f2abbd	true	access.token.claim
5eb2df4d-608a-4338-8f6a-171c82f2abbd	tenant	claim.name
5eb2df4d-608a-4338-8f6a-171c82f2abbd	String	jsonType.label
ee07bab9-a017-44b9-b82c-c4d62670516d	Cl1-CX-Registration	included.client.audience
ee07bab9-a017-44b9-b82c-c4d62670516d	true	id.token.claim
ee07bab9-a017-44b9-b82c-c4d62670516d	true	access.token.claim
ee07bab9-a017-44b9-b82c-c4d62670516d	true	userinfo.token.claim
2423df79-1ca8-40eb-915e-29cee841111c	true	userinfo.token.claim
2423df79-1ca8-40eb-915e-29cee841111c	organisation	user.attribute
2423df79-1ca8-40eb-915e-29cee841111c	true	id.token.claim
2423df79-1ca8-40eb-915e-29cee841111c	true	access.token.claim
2423df79-1ca8-40eb-915e-29cee841111c	organisation	claim.name
2423df79-1ca8-40eb-915e-29cee841111c	String	jsonType.label
84577355-e775-4f09-9bb0-5c0f547b4f2d	clientId	user.session.note
84577355-e775-4f09-9bb0-5c0f547b4f2d	true	userinfo.token.claim
84577355-e775-4f09-9bb0-5c0f547b4f2d	true	id.token.claim
84577355-e775-4f09-9bb0-5c0f547b4f2d	true	access.token.claim
84577355-e775-4f09-9bb0-5c0f547b4f2d	clientId	claim.name
84577355-e775-4f09-9bb0-5c0f547b4f2d	String	jsonType.label
85546302-2448-40f8-bd89-eba6c3fb0950	clientAddress	user.session.note
85546302-2448-40f8-bd89-eba6c3fb0950	true	userinfo.token.claim
85546302-2448-40f8-bd89-eba6c3fb0950	true	id.token.claim
85546302-2448-40f8-bd89-eba6c3fb0950	true	access.token.claim
85546302-2448-40f8-bd89-eba6c3fb0950	clientAddress	claim.name
85546302-2448-40f8-bd89-eba6c3fb0950	String	jsonType.label
7b979fe6-32fd-4b76-ad28-2825042e9ed0	clientHost	user.session.note
7b979fe6-32fd-4b76-ad28-2825042e9ed0	true	userinfo.token.claim
7b979fe6-32fd-4b76-ad28-2825042e9ed0	true	id.token.claim
7b979fe6-32fd-4b76-ad28-2825042e9ed0	true	access.token.claim
7b979fe6-32fd-4b76-ad28-2825042e9ed0	clientHost	claim.name
7b979fe6-32fd-4b76-ad28-2825042e9ed0	String	jsonType.label
12d9df9a-241b-4ec2-bafa-3f26ccaa1890	true	userinfo.token.claim
12d9df9a-241b-4ec2-bafa-3f26ccaa1890	locale	user.attribute
12d9df9a-241b-4ec2-bafa-3f26ccaa1890	true	id.token.claim
12d9df9a-241b-4ec2-bafa-3f26ccaa1890	true	access.token.claim
12d9df9a-241b-4ec2-bafa-3f26ccaa1890	locale	claim.name
12d9df9a-241b-4ec2-bafa-3f26ccaa1890	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
master	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	e3c1a1a8-743b-4df9-887e-cad92ccb7620	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	97f2dd31-cd18-4273-b42f-55955e14f92c	b2dcdb81-4d8a-43c8-9c29-17f614f7a8fa	5af3beed-bf04-40b5-9d9d-813beac0e351	3845dc5d-f7c7-4f05-b359-f7e7e2c6f380	334c9c46-d2de-481f-b6b7-7fcddff2a3cd	2592000	f	900	t	f	0d655c8a-a112-4e07-947f-6eb1490e8e39	0	f	0	0	496938e7-f432-4eb0-90f4-dcbd8a453eb3
CX-Central	60	300	300	\N	\N	\N	t	t	0	catenax-central	CX-Central	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	3f759b87-a1b1-4a53-a1dd-54e0efd9c08b	1800	t	en	f	t	t	f	0	1	30	6	HmacSHA1	totp	53ed9422-c904-4ef3-9349-211269ba91b7	efbe9560-b9a0-4323-9699-19c72ac70617	a8bef900-8437-429f-b15a-9f729933f31d	29167b6a-4a74-4d4a-afe3-0bdb77c58e95	faa735a6-7006-40a9-8b14-85c61e6063c5	2592000	f	900	f	t	16f9d21a-9f9b-4f82-8eee-77c16b9eb0b1	0	f	0	0	4c19f2aa-f9b9-473e-ba5c-46c2f4e52c8b
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	master	
_browser_header.xContentTypeOptions	master	nosniff
_browser_header.xRobotsTag	master	none
_browser_header.xFrameOptions	master	SAMEORIGIN
_browser_header.contentSecurityPolicy	master	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	master	1; mode=block
_browser_header.strictTransportSecurity	master	max-age=31536000; includeSubDomains
bruteForceProtected	master	false
permanentLockout	master	false
maxFailureWaitSeconds	master	900
minimumQuickLoginWaitSeconds	master	60
waitIncrementSeconds	master	60
quickLoginCheckMilliSeconds	master	1000
maxDeltaTimeSeconds	master	43200
failureFactor	master	30
displayName	master	Keycloak
displayNameHtml	master	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	master	RS256
offlineSessionMaxLifespanEnabled	master	false
offlineSessionMaxLifespan	master	5184000
_browser_header.contentSecurityPolicyReportOnly	CX-Central	
_browser_header.xContentTypeOptions	CX-Central	nosniff
_browser_header.xRobotsTag	CX-Central	none
_browser_header.xFrameOptions	CX-Central	SAMEORIGIN
_browser_header.contentSecurityPolicy	CX-Central	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	CX-Central	1; mode=block
_browser_header.strictTransportSecurity	CX-Central	max-age=31536000; includeSubDomains
permanentLockout	CX-Central	false
maxFailureWaitSeconds	CX-Central	900
minimumQuickLoginWaitSeconds	CX-Central	60
waitIncrementSeconds	CX-Central	60
quickLoginCheckMilliSeconds	CX-Central	1000
maxDeltaTimeSeconds	CX-Central	43200
displayName	CX-Central	Catena-X Central
bruteForceProtected	CX-Central	true
failureFactor	CX-Central	10
defaultSignatureAlgorithm	CX-Central	RS256
offlineSessionMaxLifespanEnabled	CX-Central	false
offlineSessionMaxLifespan	CX-Central	5184000
clientSessionIdleTimeout	CX-Central	0
clientSessionMaxLifespan	CX-Central	0
clientOfflineSessionIdleTimeout	CX-Central	0
clientOfflineSessionMaxLifespan	CX-Central	0
actionTokenGeneratedByAdminLifespan	CX-Central	43200
actionTokenGeneratedByUserLifespan	CX-Central	300
oauth2DeviceCodeLifespan	CX-Central	600
oauth2DevicePollingInterval	CX-Central	5
webAuthnPolicyRpEntityName	CX-Central	keycloak
webAuthnPolicySignatureAlgorithms	CX-Central	ES256
webAuthnPolicyRpId	CX-Central	
webAuthnPolicyAttestationConveyancePreference	CX-Central	not specified
webAuthnPolicyAuthenticatorAttachment	CX-Central	not specified
webAuthnPolicyRequireResidentKey	CX-Central	not specified
webAuthnPolicyUserVerificationRequirement	CX-Central	not specified
webAuthnPolicyCreateTimeout	CX-Central	0
webAuthnPolicyAvoidSameAuthenticatorRegister	CX-Central	false
webAuthnPolicyRpEntityNamePasswordless	CX-Central	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	CX-Central	ES256
webAuthnPolicyRpIdPasswordless	CX-Central	
webAuthnPolicyAttestationConveyancePreferencePasswordless	CX-Central	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	CX-Central	not specified
webAuthnPolicyRequireResidentKeyPasswordless	CX-Central	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	CX-Central	not specified
webAuthnPolicyCreateTimeoutPasswordless	CX-Central	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	CX-Central	false
cibaBackchannelTokenDeliveryMode	CX-Central	poll
cibaExpiresIn	CX-Central	120
cibaInterval	CX-Central	5
cibaAuthRequestedUserHint	CX-Central	login_hint
parRequestUriLifespan	CX-Central	60
userProfileEnabled	CX-Central	false
client-policies.profiles	CX-Central	{"profiles":[]}
client-policies.policies	CX-Central	{"policies":[]}
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.realm_enabled_event_types (realm_id, value) FROM stdin;
CX-Central	UPDATE_CONSENT_ERROR
CX-Central	SEND_RESET_PASSWORD
CX-Central	GRANT_CONSENT
CX-Central	VERIFY_PROFILE_ERROR
CX-Central	UPDATE_TOTP
CX-Central	REMOVE_TOTP
CX-Central	REVOKE_GRANT
CX-Central	LOGIN_ERROR
CX-Central	CLIENT_LOGIN
CX-Central	RESET_PASSWORD_ERROR
CX-Central	IMPERSONATE_ERROR
CX-Central	CODE_TO_TOKEN_ERROR
CX-Central	CUSTOM_REQUIRED_ACTION
CX-Central	OAUTH2_DEVICE_CODE_TO_TOKEN_ERROR
CX-Central	RESTART_AUTHENTICATION
CX-Central	UPDATE_PROFILE_ERROR
CX-Central	IMPERSONATE
CX-Central	LOGIN
CX-Central	UPDATE_PASSWORD_ERROR
CX-Central	OAUTH2_DEVICE_VERIFY_USER_CODE
CX-Central	CLIENT_INITIATED_ACCOUNT_LINKING
CX-Central	TOKEN_EXCHANGE
CX-Central	REGISTER
CX-Central	LOGOUT
CX-Central	AUTHREQID_TO_TOKEN
CX-Central	DELETE_ACCOUNT_ERROR
CX-Central	CLIENT_REGISTER
CX-Central	IDENTITY_PROVIDER_LINK_ACCOUNT
CX-Central	UPDATE_PASSWORD
CX-Central	DELETE_ACCOUNT
CX-Central	FEDERATED_IDENTITY_LINK_ERROR
CX-Central	CLIENT_DELETE
CX-Central	IDENTITY_PROVIDER_FIRST_LOGIN
CX-Central	VERIFY_EMAIL
CX-Central	CLIENT_DELETE_ERROR
CX-Central	CLIENT_LOGIN_ERROR
CX-Central	RESTART_AUTHENTICATION_ERROR
CX-Central	REMOVE_FEDERATED_IDENTITY_ERROR
CX-Central	EXECUTE_ACTIONS
CX-Central	TOKEN_EXCHANGE_ERROR
CX-Central	PERMISSION_TOKEN
CX-Central	SEND_IDENTITY_PROVIDER_LINK_ERROR
CX-Central	EXECUTE_ACTION_TOKEN_ERROR
CX-Central	SEND_VERIFY_EMAIL
CX-Central	OAUTH2_DEVICE_AUTH
CX-Central	EXECUTE_ACTIONS_ERROR
CX-Central	REMOVE_FEDERATED_IDENTITY
CX-Central	OAUTH2_DEVICE_CODE_TO_TOKEN
CX-Central	IDENTITY_PROVIDER_POST_LOGIN
CX-Central	IDENTITY_PROVIDER_LINK_ACCOUNT_ERROR
CX-Central	UPDATE_EMAIL
CX-Central	OAUTH2_DEVICE_VERIFY_USER_CODE_ERROR
CX-Central	REGISTER_ERROR
CX-Central	REVOKE_GRANT_ERROR
CX-Central	LOGOUT_ERROR
CX-Central	UPDATE_EMAIL_ERROR
CX-Central	EXECUTE_ACTION_TOKEN
CX-Central	CLIENT_UPDATE_ERROR
CX-Central	UPDATE_PROFILE
CX-Central	AUTHREQID_TO_TOKEN_ERROR
CX-Central	FEDERATED_IDENTITY_LINK
CX-Central	CLIENT_REGISTER_ERROR
CX-Central	SEND_IDENTITY_PROVIDER_LINK
CX-Central	SEND_VERIFY_EMAIL_ERROR
CX-Central	RESET_PASSWORD
CX-Central	CLIENT_INITIATED_ACCOUNT_LINKING_ERROR
CX-Central	OAUTH2_DEVICE_AUTH_ERROR
CX-Central	UPDATE_CONSENT
CX-Central	REMOVE_TOTP_ERROR
CX-Central	VERIFY_EMAIL_ERROR
CX-Central	SEND_RESET_PASSWORD_ERROR
CX-Central	CLIENT_UPDATE
CX-Central	IDENTITY_PROVIDER_POST_LOGIN_ERROR
CX-Central	CUSTOM_REQUIRED_ACTION_ERROR
CX-Central	UPDATE_TOTP_ERROR
CX-Central	CODE_TO_TOKEN
CX-Central	VERIFY_PROFILE
CX-Central	GRANT_CONSENT_ERROR
CX-Central	IDENTITY_PROVIDER_FIRST_LOGIN_ERROR
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.realm_events_listeners (realm_id, value) FROM stdin;
master	jboss-logging
CX-Central	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	master
password	password	t	t	CX-Central
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.realm_smtp_config (realm_id, value, name) FROM stdin;
CX-Central	**********	password
CX-Central	true	starttls
CX-Central	true	auth
CX-Central	587	port
CX-Central	smtp.office365.com	host
CX-Central	no-reply@catena-x.net	replyTo
CX-Central	Notifications@catena-x.net	from
CX-Central		ssl
CX-Central	Notifications@catena-x.net	user
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.realm_supported_locales (realm_id, value) FROM stdin;
CX-Central	en
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.redirect_uris (client_id, value) FROM stdin;
fd3d118a-2d23-4836-b8e3-383fee4ffeea	/realms/master/account/*
5d7b9a9b-4ec1-4fa8-a4d4-41877e7e20e6	/realms/master/account/*
d2280ca6-3454-407a-9683-f39e2a3031dc	/admin/master/console/*
60313b78-e131-4358-9817-163ee938cc59	/realms/CX-Central/account/*
60313b78-e131-4358-9817-163ee938cc59	https://catenaxdev003akssrv.germanywestcentral.cloudapp.azure.com/iamcentralidp/*
2d37c8a9-7036-4e36-a085-12fec6e22938	/realms/CX-Central/account/*
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	https://catenaxintaksportal.germanywestcentral.cloudapp.azure.com/*
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	https://catenaxintakssrv.germanywestcentral.cloudapp.azure.com/*
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	http://localhost:3000/*
789fed9d-e369-41db-92d9-5058e21fdd6d	https://catenax-int-app-onboarding.azurewebsites.net/*
789fed9d-e369-41db-92d9-5058e21fdd6d	http://localhost:3000/*
7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	*
d5265cd8-d128-4dc9-8602-d49d1df0a86c	/admin/CX-Central/console/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
a7fb298f-4589-438a-baac-23081af62886	VERIFY_EMAIL	Verify Email	master	t	f	VERIFY_EMAIL	50
437dce63-dcb7-47c7-8765-0a8c088d805f	UPDATE_PROFILE	Update Profile	master	t	f	UPDATE_PROFILE	40
ca9f02c1-4b60-4050-ab2b-686d3f7efa27	CONFIGURE_TOTP	Configure OTP	master	t	f	CONFIGURE_TOTP	10
ab200c01-1780-489f-bb1d-4a5646db5014	UPDATE_PASSWORD	Update Password	master	t	f	UPDATE_PASSWORD	30
cdc0563a-d828-41e2-b6d3-0f99d2ee5d49	terms_and_conditions	Terms and Conditions	master	f	f	terms_and_conditions	20
2fd65603-4b89-4417-820d-3bce162f36dd	update_user_locale	Update User Locale	master	t	f	update_user_locale	1000
e497d490-e6b2-4b97-a3a5-8418be786c6b	delete_account	Delete Account	master	f	f	delete_account	60
4bb75fd9-0c64-4d53-aab3-a599440daa8c	CONFIGURE_TOTP	Configure OTP	CX-Central	t	f	CONFIGURE_TOTP	10
22814002-f76a-4a29-9768-5f34da13c3b8	terms_and_conditions	Terms and Conditions	CX-Central	f	f	terms_and_conditions	20
8dd57b1c-986d-4389-855b-692f06941d60	UPDATE_PASSWORD	Update Password	CX-Central	t	f	UPDATE_PASSWORD	30
1f825316-946e-4975-9649-78d27508019c	UPDATE_PROFILE	Update Profile	CX-Central	t	f	UPDATE_PROFILE	40
ba0e7695-2af8-48b7-9ffa-d3564c5b750b	VERIFY_EMAIL	Verify Email	CX-Central	t	f	VERIFY_EMAIL	50
b407f3a7-c1bc-40cd-932a-d2d9960b12fd	delete_account	Delete Account	CX-Central	f	f	delete_account	60
c9263144-12bd-45da-9ddb-60b47b060a98	update_user_locale	Update User Locale	CX-Central	t	f	update_user_locale	1000
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.scope_mapping (client_id, role_id) FROM stdin;
5d7b9a9b-4ec1-4fa8-a4d4-41877e7e20e6	e7560a55-d870-4cc9-a78c-1a3995582440
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.user_attribute (name, value, user_id, id) FROM stdin;
organisation	Devhost Shared Idp	e9b1c0e4-953d-4539-b703-dca9e911eab5	19fd7857-2747-4259-9a72-0af5dcaa01ad
tenant	idp1	e9b1c0e4-953d-4539-b703-dca9e911eab5	0483b9d3-fd77-4ffc-9ee3-9d6c48962b6b
organisation	WSL Shared Idp	3432d787-d7c8-46fb-96d7-cc984c6bfaac	f70bdb60-63ba-4567-8ffb-018dddc27d71
tenant	idp2	3432d787-d7c8-46fb-96d7-cc984c6bfaac	64b657ee-eede-497d-b24e-feb49b100739
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
4575b5b9-fab3-4c85-a722-8816bc487fad	\N	a02a93bd-3ab8-4bdf-aa32-a6060082f353	f	t	\N	\N	\N	CX-Central	service-account-sa-cl1-reg-2	1648455309628	7668d79e-e8ed-4fd8-9700-4bfd18a3dadf	0
d25a17f9-1550-4b79-8495-3c1279c4333a	\N	78d0c7a6-917d-4c11-9f15-966b72aea8f4	f	t	\N	\N	\N	master	admin	1648455310538	\N	0
3cbac5d7-d38e-4366-904a-b5829d0819dd	\N	569ca9a7-3092-4c42-9bfc-43aef2aeafb2	f	t	\N	\N	\N	CX-Central	devenv-cx-admin	1648456779494	\N	0
e9b1c0e4-953d-4539-b703-dca9e911eab5	no.email@catena.net	71daec41-f89c-407e-a9ad-9247b738f4a4	t	t	\N	Testuser	Devhost	CX-Central	idp1.6ec46cd4-5aec-46c3-88dc-2a283994ab92	1648483534694	\N	0
3432d787-d7c8-46fb-96d7-cc984c6bfaac	no.email@catena.net	a8cfe098-2d4e-4e6d-baa1-75fa7587834b	t	t	\N	Testuser	WSL	CX-Central	idp2.f99d2698-5670-41f2-a141-e58b0c99560c	1648485062303	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.user_role_mapping (role_id, user_id) FROM stdin;
4c19f2aa-f9b9-473e-ba5c-46c2f4e52c8b	4575b5b9-fab3-4c85-a722-8816bc487fad
496938e7-f432-4eb0-90f4-dcbd8a453eb3	d25a17f9-1550-4b79-8495-3c1279c4333a
314b0ae7-55ac-4ba4-bc67-ca36c48efafd	d25a17f9-1550-4b79-8495-3c1279c4333a
4c19f2aa-f9b9-473e-ba5c-46c2f4e52c8b	3cbac5d7-d38e-4366-904a-b5829d0819dd
e8b9f782-d707-4852-a979-e5a08b19f3c7	3cbac5d7-d38e-4366-904a-b5829d0819dd
cc5e185c-5cc5-4b0d-9d60-a9e733f454ec	4575b5b9-fab3-4c85-a722-8816bc487fad
99dc3a13-e284-493d-b8db-956f1815b14e	4575b5b9-fab3-4c85-a722-8816bc487fad
8a35d055-6927-499d-80a0-28d1b0280623	4575b5b9-fab3-4c85-a722-8816bc487fad
840b627d-4723-4e35-90e0-19c27b6b85cf	4575b5b9-fab3-4c85-a722-8816bc487fad
2935c492-8f7b-4550-af8d-adf9f290ca4f	4575b5b9-fab3-4c85-a722-8816bc487fad
a83e07cf-e87d-40ca-831a-6b67f0ac4714	4575b5b9-fab3-4c85-a722-8816bc487fad
4c19f2aa-f9b9-473e-ba5c-46c2f4e52c8b	e9b1c0e4-953d-4539-b703-dca9e911eab5
d4e90553-21c6-4922-9b47-26ad2db306dc	e9b1c0e4-953d-4539-b703-dca9e911eab5
4c19f2aa-f9b9-473e-ba5c-46c2f4e52c8b	3432d787-d7c8-46fb-96d7-cc984c6bfaac
d4e90553-21c6-4922-9b47-26ad2db306dc	3432d787-d7c8-46fb-96d7-cc984c6bfaac
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: iamcentral; Owner: kccentral
--

COPY iamcentral.web_origins (client_id, value) FROM stdin;
d2280ca6-3454-407a-9683-f39e2a3031dc	+
60313b78-e131-4358-9817-163ee938cc59	+
2d37c8a9-7036-4e36-a085-12fec6e22938	+
dd8c6ef1-a56f-4114-8918-6c7fc2057e34	+
789fed9d-e369-41db-92d9-5058e21fdd6d	+
d5265cd8-d128-4dc9-8602-d49d1df0a86c	+
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON iamcentral.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_auth_config_realm ON iamcentral.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_auth_exec_flow ON iamcentral.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_auth_exec_realm_flow ON iamcentral.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_auth_flow_realm ON iamcentral.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_cl_clscope ON iamcentral.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_client_att_by_name_value ON iamcentral.client_attributes USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_client_id; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_client_id ON iamcentral.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_client_init_acc_realm ON iamcentral.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_client_session_session ON iamcentral.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_clscope_attrs ON iamcentral.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_clscope_cl ON iamcentral.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_clscope_protmap ON iamcentral.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_clscope_role ON iamcentral.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_compo_config_compo ON iamcentral.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_component_provider_type ON iamcentral.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_component_realm ON iamcentral.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_composite ON iamcentral.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_composite_child ON iamcentral.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_defcls_realm ON iamcentral.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_defcls_scope ON iamcentral.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_event_time ON iamcentral.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_fedidentity_feduser ON iamcentral.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_fedidentity_user ON iamcentral.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_fu_attribute ON iamcentral.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_fu_cnsnt_ext ON iamcentral.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_fu_consent ON iamcentral.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_fu_consent_ru ON iamcentral.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_fu_credential ON iamcentral.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_fu_credential_ru ON iamcentral.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_fu_group_membership ON iamcentral.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_fu_group_membership_ru ON iamcentral.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_fu_required_action ON iamcentral.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_fu_required_action_ru ON iamcentral.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_fu_role_mapping ON iamcentral.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_fu_role_mapping_ru ON iamcentral.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_group_attr_group ON iamcentral.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_group_role_mapp_group ON iamcentral.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_id_prov_mapp_realm ON iamcentral.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_ident_prov_realm ON iamcentral.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_keycloak_role_client ON iamcentral.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_keycloak_role_realm ON iamcentral.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_offline_css_preload ON iamcentral.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_offline_uss_by_user ON iamcentral.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_offline_uss_by_usersess ON iamcentral.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_offline_uss_createdon ON iamcentral.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_offline_uss_preload ON iamcentral.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_protocol_mapper_client ON iamcentral.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_realm_attr_realm ON iamcentral.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_realm_clscope ON iamcentral.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_realm_def_grp_realm ON iamcentral.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_realm_evt_list_realm ON iamcentral.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_realm_evt_types_realm ON iamcentral.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_realm_master_adm_cli ON iamcentral.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_realm_supp_local_realm ON iamcentral.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_redir_uri_client ON iamcentral.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_req_act_prov_realm ON iamcentral.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_res_policy_policy ON iamcentral.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_res_scope_scope ON iamcentral.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_res_serv_pol_res_serv ON iamcentral.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_res_srv_res_res_srv ON iamcentral.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_res_srv_scope_res_srv ON iamcentral.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_role_attribute ON iamcentral.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_role_clscope ON iamcentral.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_scope_mapping_role ON iamcentral.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_scope_policy_policy ON iamcentral.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_update_time ON iamcentral.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON iamcentral.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_usconsent_clscope ON iamcentral.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_user_attribute ON iamcentral.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_user_attribute_name ON iamcentral.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_user_consent ON iamcentral.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_user_credential ON iamcentral.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_user_email ON iamcentral.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_user_group_mapping ON iamcentral.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_user_reqactions ON iamcentral.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_user_role_mapping ON iamcentral.user_role_mapping USING btree (user_id);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_usr_fed_map_fed_prv ON iamcentral.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_usr_fed_map_realm ON iamcentral.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_usr_fed_prv_realm ON iamcentral.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: iamcentral; Owner: kccentral
--

CREATE INDEX idx_web_orig_client ON iamcentral.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES iamcentral.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES iamcentral.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES iamcentral.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES iamcentral.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES iamcentral.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES iamcentral.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES iamcentral.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES iamcentral.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES iamcentral.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES iamcentral.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES iamcentral.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES iamcentral.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES iamcentral.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES iamcentral.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES iamcentral.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES iamcentral.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES iamcentral.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES iamcentral.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES iamcentral.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES iamcentral.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES iamcentral.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES iamcentral.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES iamcentral.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES iamcentral.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES iamcentral.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES iamcentral.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES iamcentral.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES iamcentral.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES iamcentral.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES iamcentral.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES iamcentral.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES iamcentral.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES iamcentral.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES iamcentral.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES iamcentral.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES iamcentral.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES iamcentral.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES iamcentral.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES iamcentral.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES iamcentral.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES iamcentral.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES iamcentral.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES iamcentral.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES iamcentral.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES iamcentral.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES iamcentral.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES iamcentral.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES iamcentral.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES iamcentral.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES iamcentral.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES iamcentral.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES iamcentral.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES iamcentral.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES iamcentral.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES iamcentral.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES iamcentral.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: iamcentral; Owner: kccentral
--

ALTER TABLE ONLY iamcentral.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES iamcentral.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

