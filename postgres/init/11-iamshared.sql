--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.4 (Debian 14.4-1.pgdg110+1)

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
-- Name: iamshared; Type: SCHEMA; Schema: -; Owner: kcshared
--

CREATE SCHEMA iamshared;


ALTER SCHEMA iamshared OWNER TO kcshared;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.admin_event_entity (
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


ALTER TABLE iamshared.admin_event_entity OWNER TO kcshared;

--
-- Name: associated_policy; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.associated_policy OWNER TO kcshared;

--
-- Name: authentication_execution; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.authentication_execution (
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


ALTER TABLE iamshared.authentication_execution OWNER TO kcshared;

--
-- Name: authentication_flow; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE iamshared.authentication_flow OWNER TO kcshared;

--
-- Name: authenticator_config; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE iamshared.authenticator_config OWNER TO kcshared;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE iamshared.authenticator_config_entry OWNER TO kcshared;

--
-- Name: broker_link; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE iamshared.broker_link OWNER TO kcshared;

--
-- Name: client; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.client (
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


ALTER TABLE iamshared.client OWNER TO kcshared;

--
-- Name: client_attributes; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE iamshared.client_attributes OWNER TO kcshared;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE iamshared.client_auth_flow_bindings OWNER TO kcshared;

--
-- Name: client_initial_access; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE iamshared.client_initial_access OWNER TO kcshared;

--
-- Name: client_node_registrations; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE iamshared.client_node_registrations OWNER TO kcshared;

--
-- Name: client_scope; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE iamshared.client_scope OWNER TO kcshared;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE iamshared.client_scope_attributes OWNER TO kcshared;

--
-- Name: client_scope_client; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE iamshared.client_scope_client OWNER TO kcshared;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.client_scope_role_mapping OWNER TO kcshared;

--
-- Name: client_session; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.client_session (
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


ALTER TABLE iamshared.client_session OWNER TO kcshared;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE iamshared.client_session_auth_status OWNER TO kcshared;

--
-- Name: client_session_note; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE iamshared.client_session_note OWNER TO kcshared;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE iamshared.client_session_prot_mapper OWNER TO kcshared;

--
-- Name: client_session_role; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE iamshared.client_session_role OWNER TO kcshared;

--
-- Name: client_user_session_note; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE iamshared.client_user_session_note OWNER TO kcshared;

--
-- Name: component; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE iamshared.component OWNER TO kcshared;

--
-- Name: component_config; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE iamshared.component_config OWNER TO kcshared;

--
-- Name: composite_role; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE iamshared.composite_role OWNER TO kcshared;

--
-- Name: credential; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.credential (
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


ALTER TABLE iamshared.credential OWNER TO kcshared;

--
-- Name: databasechangelog; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.databasechangelog (
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


ALTER TABLE iamshared.databasechangelog OWNER TO kcshared;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE iamshared.databasechangeloglock OWNER TO kcshared;

--
-- Name: default_client_scope; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE iamshared.default_client_scope OWNER TO kcshared;

--
-- Name: event_entity; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.event_entity (
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


ALTER TABLE iamshared.event_entity OWNER TO kcshared;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE iamshared.fed_user_attribute OWNER TO kcshared;

--
-- Name: fed_user_consent; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.fed_user_consent (
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


ALTER TABLE iamshared.fed_user_consent OWNER TO kcshared;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.fed_user_consent_cl_scope OWNER TO kcshared;

--
-- Name: fed_user_credential; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.fed_user_credential (
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


ALTER TABLE iamshared.fed_user_credential OWNER TO kcshared;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE iamshared.fed_user_group_membership OWNER TO kcshared;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE iamshared.fed_user_required_action OWNER TO kcshared;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE iamshared.fed_user_role_mapping OWNER TO kcshared;

--
-- Name: federated_identity; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.federated_identity OWNER TO kcshared;

--
-- Name: federated_user; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.federated_user OWNER TO kcshared;

--
-- Name: group_attribute; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.group_attribute OWNER TO kcshared;

--
-- Name: group_role_mapping; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.group_role_mapping OWNER TO kcshared;

--
-- Name: identity_provider; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.identity_provider (
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


ALTER TABLE iamshared.identity_provider OWNER TO kcshared;

--
-- Name: identity_provider_config; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE iamshared.identity_provider_config OWNER TO kcshared;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.identity_provider_mapper OWNER TO kcshared;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE iamshared.idp_mapper_config OWNER TO kcshared;

--
-- Name: keycloak_group; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE iamshared.keycloak_group OWNER TO kcshared;

--
-- Name: keycloak_role; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE iamshared.keycloak_role OWNER TO kcshared;

--
-- Name: migration_model; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE iamshared.migration_model OWNER TO kcshared;

--
-- Name: offline_client_session; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE iamshared.offline_client_session OWNER TO kcshared;

--
-- Name: offline_user_session; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE iamshared.offline_user_session OWNER TO kcshared;

--
-- Name: policy_config; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE iamshared.policy_config OWNER TO kcshared;

--
-- Name: protocol_mapper; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE iamshared.protocol_mapper OWNER TO kcshared;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE iamshared.protocol_mapper_config OWNER TO kcshared;

--
-- Name: realm; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.realm (
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


ALTER TABLE iamshared.realm OWNER TO kcshared;

--
-- Name: realm_attribute; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE iamshared.realm_attribute OWNER TO kcshared;

--
-- Name: realm_default_groups; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.realm_default_groups OWNER TO kcshared;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE iamshared.realm_enabled_event_types OWNER TO kcshared;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE iamshared.realm_events_listeners OWNER TO kcshared;

--
-- Name: realm_localizations; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE iamshared.realm_localizations OWNER TO kcshared;

--
-- Name: realm_required_credential; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.realm_required_credential OWNER TO kcshared;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE iamshared.realm_smtp_config OWNER TO kcshared;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE iamshared.realm_supported_locales OWNER TO kcshared;

--
-- Name: redirect_uris; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE iamshared.redirect_uris OWNER TO kcshared;

--
-- Name: required_action_config; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE iamshared.required_action_config OWNER TO kcshared;

--
-- Name: required_action_provider; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE iamshared.required_action_provider OWNER TO kcshared;

--
-- Name: resource_attribute; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.resource_attribute OWNER TO kcshared;

--
-- Name: resource_policy; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.resource_policy OWNER TO kcshared;

--
-- Name: resource_scope; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.resource_scope OWNER TO kcshared;

--
-- Name: resource_server; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE iamshared.resource_server OWNER TO kcshared;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.resource_server_perm_ticket (
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


ALTER TABLE iamshared.resource_server_perm_ticket OWNER TO kcshared;

--
-- Name: resource_server_policy; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE iamshared.resource_server_policy OWNER TO kcshared;

--
-- Name: resource_server_resource; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE iamshared.resource_server_resource OWNER TO kcshared;

--
-- Name: resource_server_scope; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE iamshared.resource_server_scope OWNER TO kcshared;

--
-- Name: resource_uris; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE iamshared.resource_uris OWNER TO kcshared;

--
-- Name: role_attribute; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE iamshared.role_attribute OWNER TO kcshared;

--
-- Name: scope_mapping; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.scope_mapping OWNER TO kcshared;

--
-- Name: scope_policy; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.scope_policy OWNER TO kcshared;

--
-- Name: user_attribute; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE iamshared.user_attribute OWNER TO kcshared;

--
-- Name: user_consent; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE iamshared.user_consent OWNER TO kcshared;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.user_consent_client_scope OWNER TO kcshared;

--
-- Name: user_entity; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.user_entity (
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


ALTER TABLE iamshared.user_entity OWNER TO kcshared;

--
-- Name: user_federation_config; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE iamshared.user_federation_config OWNER TO kcshared;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.user_federation_mapper OWNER TO kcshared;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE iamshared.user_federation_mapper_config OWNER TO kcshared;

--
-- Name: user_federation_provider; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE iamshared.user_federation_provider OWNER TO kcshared;

--
-- Name: user_group_membership; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.user_group_membership OWNER TO kcshared;

--
-- Name: user_required_action; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE iamshared.user_required_action OWNER TO kcshared;

--
-- Name: user_role_mapping; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE iamshared.user_role_mapping OWNER TO kcshared;

--
-- Name: user_session; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.user_session (
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


ALTER TABLE iamshared.user_session OWNER TO kcshared;

--
-- Name: user_session_note; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE iamshared.user_session_note OWNER TO kcshared;

--
-- Name: username_login_failure; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE iamshared.username_login_failure OWNER TO kcshared;

--
-- Name: web_origins; Type: TABLE; Schema: iamshared; Owner: kcshared
--

CREATE TABLE iamshared.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE iamshared.web_origins OWNER TO kcshared;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
91d8affa-ea4e-4475-b11d-e75885b0c458	\N	auth-cookie	master	05dabaf1-aa19-4649-a10b-d546c9a987dd	2	10	f	\N	\N
82795a7b-abe4-4f0e-99b1-12d416d0bf6d	\N	auth-spnego	master	05dabaf1-aa19-4649-a10b-d546c9a987dd	3	20	f	\N	\N
4881e197-aab2-4885-b9d4-1c34c1438c00	\N	identity-provider-redirector	master	05dabaf1-aa19-4649-a10b-d546c9a987dd	2	25	f	\N	\N
1942e280-dab0-4a81-9a2d-39658b5af339	\N	\N	master	05dabaf1-aa19-4649-a10b-d546c9a987dd	2	30	t	c57cf74a-d690-430c-89d8-506713b0a641	\N
e06360c4-27c2-41c0-b2fa-dc7b52095179	\N	auth-username-password-form	master	c57cf74a-d690-430c-89d8-506713b0a641	0	10	f	\N	\N
a86fd52d-6102-411c-971a-928a86c7558a	\N	\N	master	c57cf74a-d690-430c-89d8-506713b0a641	1	20	t	f1d0b876-608a-4582-9251-f99eaac985b3	\N
a9e80e96-d5fa-4588-865e-3e88f77dc066	\N	conditional-user-configured	master	f1d0b876-608a-4582-9251-f99eaac985b3	0	10	f	\N	\N
afd0cbd3-31c6-42c2-a6e5-4077aad3f448	\N	auth-otp-form	master	f1d0b876-608a-4582-9251-f99eaac985b3	0	20	f	\N	\N
19eaa734-3690-430d-afb7-0f1aac741c97	\N	direct-grant-validate-username	master	59c4129f-76fb-4ecd-8d6e-bd2b9294e7c8	0	10	f	\N	\N
8274be6a-b2ea-4e69-96ca-14afdcf6746c	\N	direct-grant-validate-password	master	59c4129f-76fb-4ecd-8d6e-bd2b9294e7c8	0	20	f	\N	\N
e2cbaa58-2fe8-4402-8a79-9341c6b31b28	\N	\N	master	59c4129f-76fb-4ecd-8d6e-bd2b9294e7c8	1	30	t	58c299c5-b970-4f4d-824a-6f62296a4095	\N
b20f69b5-76f0-4b38-bcc6-781a7f508d63	\N	conditional-user-configured	master	58c299c5-b970-4f4d-824a-6f62296a4095	0	10	f	\N	\N
c1906b66-537f-4202-b4ab-89c3cec7c386	\N	direct-grant-validate-otp	master	58c299c5-b970-4f4d-824a-6f62296a4095	0	20	f	\N	\N
709b2aa0-ff3b-4f05-ae5b-83999bf9f987	\N	registration-page-form	master	a72f912c-884d-40ec-80ee-f58927c19f3f	0	10	t	e2eb1cdb-fc83-421c-a4d8-44e68232f529	\N
a2543dfc-4c19-4450-b947-71f66574d324	\N	registration-user-creation	master	e2eb1cdb-fc83-421c-a4d8-44e68232f529	0	20	f	\N	\N
40c6aaa0-1335-4877-bf36-2a4f3ea6ba55	\N	registration-profile-action	master	e2eb1cdb-fc83-421c-a4d8-44e68232f529	0	40	f	\N	\N
a0995f85-2679-4f79-87e3-9b62ad06889b	\N	registration-password-action	master	e2eb1cdb-fc83-421c-a4d8-44e68232f529	0	50	f	\N	\N
9c633730-a19f-4c0d-9243-db791947835f	\N	registration-recaptcha-action	master	e2eb1cdb-fc83-421c-a4d8-44e68232f529	3	60	f	\N	\N
e053bdbb-1656-4d0c-a44b-88e214c2e0d9	\N	reset-credentials-choose-user	master	c4bc5dec-5f75-42a0-83d3-a8e98ff22f25	0	10	f	\N	\N
de80a40c-4896-4f38-8bf9-99b464dd945a	\N	reset-credential-email	master	c4bc5dec-5f75-42a0-83d3-a8e98ff22f25	0	20	f	\N	\N
1fad8e88-cb78-401f-b53b-fce83c94f9df	\N	reset-password	master	c4bc5dec-5f75-42a0-83d3-a8e98ff22f25	0	30	f	\N	\N
ce8b9aeb-adfb-4d35-9038-13749d5e6ebf	\N	\N	master	c4bc5dec-5f75-42a0-83d3-a8e98ff22f25	1	40	t	6277f4f6-b053-495f-b1ca-36271b16ad35	\N
451fdcbe-c116-4ab3-aa64-825efc08cbba	\N	conditional-user-configured	master	6277f4f6-b053-495f-b1ca-36271b16ad35	0	10	f	\N	\N
eb6e2f9d-1194-43d4-8a22-2524e3922170	\N	reset-otp	master	6277f4f6-b053-495f-b1ca-36271b16ad35	0	20	f	\N	\N
032c5375-8b58-4809-b841-82ae046ac94f	\N	client-secret	master	6a14112d-2b10-4196-8d85-f2080bef7dfa	2	10	f	\N	\N
abf66a8a-acb2-4951-b281-af50cb194f14	\N	client-jwt	master	6a14112d-2b10-4196-8d85-f2080bef7dfa	2	20	f	\N	\N
341ae7fe-bee0-4923-bce9-94e03e76faed	\N	client-secret-jwt	master	6a14112d-2b10-4196-8d85-f2080bef7dfa	2	30	f	\N	\N
95353351-418f-459b-bb15-3c9fa60b1184	\N	client-x509	master	6a14112d-2b10-4196-8d85-f2080bef7dfa	2	40	f	\N	\N
78b233d6-4d84-4ad4-a180-e4dedf63b9a3	\N	idp-review-profile	master	f2ea78e6-0daf-4cc8-91ca-e6b39f448e18	0	10	f	\N	7658409a-10b1-4c0f-9617-5d5cd1a67a76
3e669301-6285-4ad2-a954-15bb22ca7493	\N	\N	master	f2ea78e6-0daf-4cc8-91ca-e6b39f448e18	0	20	t	ea555723-0af1-4afb-9810-f28013c3fde8	\N
38b00a7f-17be-4c51-a558-9de0c2f71d49	\N	idp-create-user-if-unique	master	ea555723-0af1-4afb-9810-f28013c3fde8	2	10	f	\N	d73d6462-d171-4269-8a96-6fac9924ff52
5599b9c2-d59e-4c70-bc00-f379c7941c9a	\N	\N	master	ea555723-0af1-4afb-9810-f28013c3fde8	2	20	t	0dad17c6-c5c0-47d4-9ece-5d5a157d80a6	\N
eb8bbded-0b9f-43a2-915f-28233c283469	\N	idp-confirm-link	master	0dad17c6-c5c0-47d4-9ece-5d5a157d80a6	0	10	f	\N	\N
704b7839-f5e1-4108-a625-0870d14d4565	\N	\N	master	0dad17c6-c5c0-47d4-9ece-5d5a157d80a6	0	20	t	9c49a781-1cee-4773-a68b-bfe1944e8f33	\N
b7408b5b-6bec-46d7-a924-773cd1d9043b	\N	idp-email-verification	master	9c49a781-1cee-4773-a68b-bfe1944e8f33	2	10	f	\N	\N
9ffc4080-031f-4dcd-81e9-520c7dbd05bf	\N	\N	master	9c49a781-1cee-4773-a68b-bfe1944e8f33	2	20	t	06613723-c6b6-4efb-85b1-a84c59d98bee	\N
b41123dc-2017-4942-8ae9-1229cf126bbc	\N	idp-username-password-form	master	06613723-c6b6-4efb-85b1-a84c59d98bee	0	10	f	\N	\N
1529027d-beb2-4598-ab6e-f3816c3a3773	\N	\N	master	06613723-c6b6-4efb-85b1-a84c59d98bee	1	20	t	37d2378f-c7cd-49a4-9df8-2af6d7535158	\N
50880d5a-b4b1-4d7d-a5a2-9c254032f1e0	\N	conditional-user-configured	master	37d2378f-c7cd-49a4-9df8-2af6d7535158	0	10	f	\N	\N
3f8d3095-2b4b-4060-8fa8-e7a5c8125372	\N	auth-otp-form	master	37d2378f-c7cd-49a4-9df8-2af6d7535158	0	20	f	\N	\N
f311ab11-f2fe-4f89-972e-8d360b9963a0	\N	http-basic-authenticator	master	3a7bac29-6d9e-4f0d-b71d-56d6ca5c033c	0	10	f	\N	\N
7a8360f5-b911-4319-93ae-9e583871f47b	\N	docker-http-basic-authenticator	master	9c43a4ff-63ac-41ed-88bd-ccc556a5293b	0	10	f	\N	\N
fc2bddf7-10fc-4c27-ad60-7305bdd75921	\N	no-cookie-redirect	master	049537fa-02ba-4699-b59b-1b4631921577	0	10	f	\N	\N
25d78243-d81b-4e0b-97aa-273f1768bd9b	\N	\N	master	049537fa-02ba-4699-b59b-1b4631921577	0	20	t	5126300f-1f60-4785-9674-01cf156ff4cc	\N
cc624b2e-4053-46a8-a1c9-6c9272e5c2b6	\N	basic-auth	master	5126300f-1f60-4785-9674-01cf156ff4cc	0	10	f	\N	\N
7b64cc1a-5510-45ac-a16e-27f015f629ee	\N	basic-auth-otp	master	5126300f-1f60-4785-9674-01cf156ff4cc	3	20	f	\N	\N
83456977-e6dd-4014-9de2-2be248a74b67	\N	auth-spnego	master	5126300f-1f60-4785-9674-01cf156ff4cc	3	30	f	\N	\N
00cedeb8-c456-4536-9d75-9122959518e5	\N	auth-cookie	idp1	35630408-7231-41ce-9017-8d4351e28c9f	2	10	f	\N	\N
9ee30ff5-3417-49cc-8ce3-2f2963abcc30	\N	auth-spnego	idp1	35630408-7231-41ce-9017-8d4351e28c9f	3	20	f	\N	\N
f3253a0d-77a2-4d9b-a720-b15e6602ba01	\N	identity-provider-redirector	idp1	35630408-7231-41ce-9017-8d4351e28c9f	2	25	f	\N	\N
8051ef84-20c7-4a58-9c24-9b862eab447a	\N	\N	idp1	35630408-7231-41ce-9017-8d4351e28c9f	2	30	t	33406282-aac1-4fee-a0a6-8cb7f2b03181	\N
50e01bfe-2bb2-4574-8759-ebd5c89c6727	\N	auth-username-password-form	idp1	33406282-aac1-4fee-a0a6-8cb7f2b03181	0	10	f	\N	\N
e1f88c53-e5a3-4a28-91d8-c7bd43e4c467	\N	\N	idp1	33406282-aac1-4fee-a0a6-8cb7f2b03181	1	20	t	e5713655-74a1-4700-a18d-55a7ee7bf6fc	\N
9b3850de-974c-40ff-8782-e995580802c4	\N	conditional-user-configured	idp1	e5713655-74a1-4700-a18d-55a7ee7bf6fc	0	10	f	\N	\N
ef3c5f7c-ab0b-42aa-814d-310cbe9f3735	\N	auth-otp-form	idp1	e5713655-74a1-4700-a18d-55a7ee7bf6fc	0	20	f	\N	\N
3680c0a8-0513-4d07-a4c1-bc0fb6f906fc	\N	direct-grant-validate-username	idp1	53488584-71ed-4e9b-928b-693c2b9284b9	0	10	f	\N	\N
2053a7ab-c3c8-41ba-8faa-86e21adf5fd3	\N	direct-grant-validate-password	idp1	53488584-71ed-4e9b-928b-693c2b9284b9	0	20	f	\N	\N
685b0d18-76ce-49ab-9425-0bbdae9b78b1	\N	\N	idp1	53488584-71ed-4e9b-928b-693c2b9284b9	1	30	t	f84e4b17-fbb2-47ea-9ce4-d207b72a2d57	\N
b59290ce-55c2-4f41-a657-2f8d0f0e5e3f	\N	conditional-user-configured	idp1	f84e4b17-fbb2-47ea-9ce4-d207b72a2d57	0	10	f	\N	\N
8217df5c-57ea-4fc6-ac2b-e0e26d7c1572	\N	direct-grant-validate-otp	idp1	f84e4b17-fbb2-47ea-9ce4-d207b72a2d57	0	20	f	\N	\N
52743d69-1808-4358-aefe-6f3fbaa0826c	\N	registration-page-form	idp1	01b63b85-5c34-49d1-abdc-65604d580f41	0	10	t	3c05bffd-5b7d-4071-b272-3ee73b998b9f	\N
3e6ad6e7-ed41-4cb0-8064-70993faac0fb	\N	registration-user-creation	idp1	3c05bffd-5b7d-4071-b272-3ee73b998b9f	0	20	f	\N	\N
0328fc03-d476-4282-9cd5-b42643ab1686	\N	registration-profile-action	idp1	3c05bffd-5b7d-4071-b272-3ee73b998b9f	0	40	f	\N	\N
f1e23bc7-1385-4f9a-8078-9b6a7d0c9973	\N	registration-password-action	idp1	3c05bffd-5b7d-4071-b272-3ee73b998b9f	0	50	f	\N	\N
dcfa89c5-6bfa-4976-a083-04a29879ca47	\N	registration-recaptcha-action	idp1	3c05bffd-5b7d-4071-b272-3ee73b998b9f	3	60	f	\N	\N
c7971ea4-5b9d-4300-9785-4c111a6268c7	\N	reset-credentials-choose-user	idp1	9bc01d2e-546e-4fd5-916c-3731996395b3	0	10	f	\N	\N
7feb9926-73ed-4390-b878-97f2af4c59b4	\N	reset-credential-email	idp1	9bc01d2e-546e-4fd5-916c-3731996395b3	0	20	f	\N	\N
2bd1569e-ef73-4fb0-9802-6b0c2e4c4ba3	\N	reset-password	idp1	9bc01d2e-546e-4fd5-916c-3731996395b3	0	30	f	\N	\N
0ccc2b4b-e3fb-4864-a8d5-353a8449a285	\N	\N	idp1	9bc01d2e-546e-4fd5-916c-3731996395b3	1	40	t	872eac11-5dc0-424b-805f-60f49e03476d	\N
8c623a07-f363-42d4-919d-640cefb1146e	\N	conditional-user-configured	idp1	872eac11-5dc0-424b-805f-60f49e03476d	0	10	f	\N	\N
442a2a66-a525-4d86-ad04-498ae58180e9	\N	reset-otp	idp1	872eac11-5dc0-424b-805f-60f49e03476d	0	20	f	\N	\N
98d3bfcd-59e8-4a9e-ad93-365fc60d39d2	\N	client-secret	idp1	ac7e99f1-9441-4dd1-b587-e778fdc578a0	2	10	f	\N	\N
7cf24c8e-f82f-4164-9e7c-67b28bcb6252	\N	client-jwt	idp1	ac7e99f1-9441-4dd1-b587-e778fdc578a0	2	20	f	\N	\N
06fe8c28-51dd-4776-83b1-55fdc3ff106a	\N	client-secret-jwt	idp1	ac7e99f1-9441-4dd1-b587-e778fdc578a0	2	30	f	\N	\N
e88384e6-9b88-434b-92fe-da42ab20014d	\N	client-x509	idp1	ac7e99f1-9441-4dd1-b587-e778fdc578a0	2	40	f	\N	\N
395dec8f-08a0-47f6-aab3-b253dd5159f2	\N	idp-review-profile	idp1	e316bea3-71dc-4674-8a07-e9f12ba146cd	0	10	f	\N	5ff7d74d-b58f-424e-971c-22e402a7a77f
74b5747e-b2d7-4645-b26f-d8f6655b418c	\N	\N	idp1	e316bea3-71dc-4674-8a07-e9f12ba146cd	0	20	t	1a201da1-6523-4667-b0e4-27c3b8cbd4ef	\N
e93e2d85-998b-455f-82d1-af1fa930ca5e	\N	idp-create-user-if-unique	idp1	1a201da1-6523-4667-b0e4-27c3b8cbd4ef	2	10	f	\N	4f10da10-fc53-491a-928b-5364da64235c
2fb4479d-9236-45e2-b35c-5a3948b00839	\N	\N	idp1	1a201da1-6523-4667-b0e4-27c3b8cbd4ef	2	20	t	0b2c8127-521c-4db2-b63e-7c5ad155e776	\N
cc588a0d-75ff-4d0a-9e1a-960833c7da0d	\N	idp-confirm-link	idp1	0b2c8127-521c-4db2-b63e-7c5ad155e776	0	10	f	\N	\N
70d43304-ff9e-4050-b3af-18a628cb4986	\N	\N	idp1	0b2c8127-521c-4db2-b63e-7c5ad155e776	0	20	t	4e5c629b-9771-462b-bc6d-e33c6a6f3e3f	\N
dd24c578-1556-4a0d-824d-f9ac32da359f	\N	idp-email-verification	idp1	4e5c629b-9771-462b-bc6d-e33c6a6f3e3f	2	10	f	\N	\N
27845c87-d259-493c-a512-6b36b0a13403	\N	\N	idp1	4e5c629b-9771-462b-bc6d-e33c6a6f3e3f	2	20	t	a8dd8c20-e069-4e41-ae98-1c3e997f34db	\N
ec4f1ba7-ccc4-4d51-92c9-a207cb04684b	\N	idp-username-password-form	idp1	a8dd8c20-e069-4e41-ae98-1c3e997f34db	0	10	f	\N	\N
ecb95c07-5edc-4f37-8fbe-f7b28dd56bd8	\N	\N	idp1	a8dd8c20-e069-4e41-ae98-1c3e997f34db	1	20	t	7fd0000c-45fc-4dc9-8787-4eddbb60e1c0	\N
1fb3944a-277b-4d20-8c4c-4bce619a1504	\N	conditional-user-configured	idp1	7fd0000c-45fc-4dc9-8787-4eddbb60e1c0	0	10	f	\N	\N
0cf874d1-85d0-4a96-8acf-1815b815a16f	\N	auth-otp-form	idp1	7fd0000c-45fc-4dc9-8787-4eddbb60e1c0	0	20	f	\N	\N
6acab1c5-b5ba-45ed-9385-a7217702e00e	\N	http-basic-authenticator	idp1	acf29285-6dc0-473a-bb4c-c38a3706aaea	0	10	f	\N	\N
dd96f873-dc6b-4360-887d-1b0643fd5320	\N	docker-http-basic-authenticator	idp1	d2293172-f1a7-4c55-a930-9e435b0f718c	0	10	f	\N	\N
c9874a5f-f031-4319-8802-47a391434eff	\N	no-cookie-redirect	idp1	c100df38-cffc-4cd2-9f56-ac2e2d7c8015	0	10	f	\N	\N
e1c65954-d69f-47cd-83e8-a0d909d0f912	\N	\N	idp1	c100df38-cffc-4cd2-9f56-ac2e2d7c8015	0	20	t	75ab9c9a-8964-4738-abe6-b944ec47a409	\N
53e11cfc-4fdc-499e-8793-6e2494d54a81	\N	basic-auth	idp1	75ab9c9a-8964-4738-abe6-b944ec47a409	0	10	f	\N	\N
6bf33a5d-6897-4477-8561-aaf8112c39b9	\N	basic-auth-otp	idp1	75ab9c9a-8964-4738-abe6-b944ec47a409	3	20	f	\N	\N
f1bf2842-f313-487f-84c2-c330fd0bde5d	\N	auth-spnego	idp1	75ab9c9a-8964-4738-abe6-b944ec47a409	3	30	f	\N	\N
91b0fa60-c42a-4e57-943a-c0583d6c06ff	\N	auth-cookie	idp2	bfe73b71-0ba7-493c-ae4c-fb56cd9acf2e	2	10	f	\N	\N
5839e874-d0dc-44b3-96a3-b948a54b9ba5	\N	auth-spnego	idp2	bfe73b71-0ba7-493c-ae4c-fb56cd9acf2e	3	20	f	\N	\N
15ab4e93-c410-4257-afb6-06e3a2fdd177	\N	identity-provider-redirector	idp2	bfe73b71-0ba7-493c-ae4c-fb56cd9acf2e	2	25	f	\N	\N
5830bb56-0f98-4e7a-aba5-efc3d7f7d612	\N	\N	idp2	bfe73b71-0ba7-493c-ae4c-fb56cd9acf2e	2	30	t	c33eafac-b75b-4d00-bb8f-7be5c1321a7e	\N
76f9a9d2-f3bb-4ce2-9bb2-ed70fb921152	\N	auth-username-password-form	idp2	c33eafac-b75b-4d00-bb8f-7be5c1321a7e	0	10	f	\N	\N
fae6c229-0970-43d0-a3a5-816a5467c16f	\N	\N	idp2	c33eafac-b75b-4d00-bb8f-7be5c1321a7e	1	20	t	d2c2df48-87df-4711-b27a-69fc7cbbd43b	\N
36efc3e6-eebc-4480-af1a-772cd1af91f2	\N	conditional-user-configured	idp2	d2c2df48-87df-4711-b27a-69fc7cbbd43b	0	10	f	\N	\N
4d3290e8-8946-4e25-8d57-896b66b12258	\N	auth-otp-form	idp2	d2c2df48-87df-4711-b27a-69fc7cbbd43b	0	20	f	\N	\N
058f6c38-38f4-4a69-b6a6-df1b5a3b38e6	\N	direct-grant-validate-username	idp2	6d1ff1a5-aa6f-45c6-a82e-6e7e9dfe7d69	0	10	f	\N	\N
58e65062-1668-4b03-89fd-02941e39b43d	\N	direct-grant-validate-password	idp2	6d1ff1a5-aa6f-45c6-a82e-6e7e9dfe7d69	0	20	f	\N	\N
1be8b9f9-1f23-488d-a756-5da5b502a30d	\N	\N	idp2	6d1ff1a5-aa6f-45c6-a82e-6e7e9dfe7d69	1	30	t	b8c33d62-8cd3-45ad-8a29-7ba163b4a404	\N
60078583-a166-4da5-9519-9c41af491017	\N	conditional-user-configured	idp2	b8c33d62-8cd3-45ad-8a29-7ba163b4a404	0	10	f	\N	\N
37a570a9-7dda-4456-8bcd-4a30ce1e30a0	\N	direct-grant-validate-otp	idp2	b8c33d62-8cd3-45ad-8a29-7ba163b4a404	0	20	f	\N	\N
ccbb0f21-4ad1-4680-9278-e8328d496d66	\N	registration-page-form	idp2	2166cc67-0adb-4ad2-97d8-a6792bd7e74a	0	10	t	b721960a-8853-4b01-bd28-dc8dcad635ec	\N
44e6a70a-a201-480f-95b8-3c17bfbaa69e	\N	registration-user-creation	idp2	b721960a-8853-4b01-bd28-dc8dcad635ec	0	20	f	\N	\N
ccd9b767-0494-456d-ac3a-e798dcd7c08d	\N	registration-profile-action	idp2	b721960a-8853-4b01-bd28-dc8dcad635ec	0	40	f	\N	\N
06b896ac-5d46-48c4-974b-5e1a420ece2f	\N	registration-password-action	idp2	b721960a-8853-4b01-bd28-dc8dcad635ec	0	50	f	\N	\N
ef422c26-c35a-4f32-84ca-35b2d6f41fc3	\N	registration-recaptcha-action	idp2	b721960a-8853-4b01-bd28-dc8dcad635ec	3	60	f	\N	\N
e1b7ce29-712e-4ccf-bc29-0f795bb600d5	\N	reset-credentials-choose-user	idp2	5dc34871-cfc1-40c9-ac66-b5762524924c	0	10	f	\N	\N
6a426347-ed2c-466b-94e4-5ad6d6068538	\N	reset-credential-email	idp2	5dc34871-cfc1-40c9-ac66-b5762524924c	0	20	f	\N	\N
ed44af94-f5c9-4af8-be93-1baa9fcc5b38	\N	reset-password	idp2	5dc34871-cfc1-40c9-ac66-b5762524924c	0	30	f	\N	\N
83e3b354-95b5-45d2-854d-511240c2f24a	\N	\N	idp2	5dc34871-cfc1-40c9-ac66-b5762524924c	1	40	t	d4a7b6d0-63aa-4eed-9c5e-afe2c10d06ea	\N
eb14d6ac-07af-496b-9511-822467c50506	\N	conditional-user-configured	idp2	d4a7b6d0-63aa-4eed-9c5e-afe2c10d06ea	0	10	f	\N	\N
8d57649c-63c5-4465-869b-2eb7c4146d53	\N	reset-otp	idp2	d4a7b6d0-63aa-4eed-9c5e-afe2c10d06ea	0	20	f	\N	\N
08ce11a0-e0e0-42cf-a273-9b873edd1ea2	\N	client-secret	idp2	a49b6a0d-d6a7-418c-8bfa-5f8dfda45cba	2	10	f	\N	\N
05712414-a859-4766-93e5-180f5136809f	\N	client-jwt	idp2	a49b6a0d-d6a7-418c-8bfa-5f8dfda45cba	2	20	f	\N	\N
5f5e4e62-5135-4467-8eab-9ebf5becdcfd	\N	client-secret-jwt	idp2	a49b6a0d-d6a7-418c-8bfa-5f8dfda45cba	2	30	f	\N	\N
567dd11f-b6d1-4d66-864b-7cd9949b73c9	\N	client-x509	idp2	a49b6a0d-d6a7-418c-8bfa-5f8dfda45cba	2	40	f	\N	\N
4b134780-a2b0-46f4-bb35-927ac2f3b692	\N	idp-review-profile	idp2	256aa084-8369-4af0-8bf1-d72ab2fb4939	0	10	f	\N	36eb5287-d797-459b-b531-381f6db1203b
c5c5acb3-e909-4d78-ab5d-483ac2d0d139	\N	\N	idp2	256aa084-8369-4af0-8bf1-d72ab2fb4939	0	20	t	637e9e22-bef6-43e4-8e8e-de5513ae3cd9	\N
32d54507-95f4-4e26-a1c0-51d3fb238b70	\N	idp-create-user-if-unique	idp2	637e9e22-bef6-43e4-8e8e-de5513ae3cd9	2	10	f	\N	1c03c6ef-e0fb-47de-953f-bbebb191022f
57425ad5-8ad0-4684-af8e-6bcfe776524c	\N	\N	idp2	637e9e22-bef6-43e4-8e8e-de5513ae3cd9	2	20	t	fc1ac105-5df3-41c2-bc30-fdd6ce8198c1	\N
e58533e5-ca0e-4004-b265-8b065ba312ce	\N	idp-confirm-link	idp2	fc1ac105-5df3-41c2-bc30-fdd6ce8198c1	0	10	f	\N	\N
2e515a5c-1cc3-41f2-b8e2-4cfde880a9c3	\N	\N	idp2	fc1ac105-5df3-41c2-bc30-fdd6ce8198c1	0	20	t	4909a7eb-5fd4-4aef-b8e6-858dd2fb3a20	\N
180b0a7b-ea7b-4388-b20c-3367131bd6d2	\N	idp-email-verification	idp2	4909a7eb-5fd4-4aef-b8e6-858dd2fb3a20	2	10	f	\N	\N
a532667e-1924-457b-a7b9-1e3e7e0ecdfe	\N	\N	idp2	4909a7eb-5fd4-4aef-b8e6-858dd2fb3a20	2	20	t	88651bc9-6020-45a2-ac34-0edf248c813a	\N
f2df56a5-9427-4aac-b8c0-cead9660a9b2	\N	idp-username-password-form	idp2	88651bc9-6020-45a2-ac34-0edf248c813a	0	10	f	\N	\N
9c0d9c5c-0e57-4476-ae9b-358b59148d58	\N	\N	idp2	88651bc9-6020-45a2-ac34-0edf248c813a	1	20	t	a390a4fb-84f8-4e1d-951d-d2ba33e0afb7	\N
7e92aecc-f437-4128-a66c-21e52a4a0b02	\N	conditional-user-configured	idp2	a390a4fb-84f8-4e1d-951d-d2ba33e0afb7	0	10	f	\N	\N
1cb86aad-6c95-4e8c-a866-eef29a05af35	\N	auth-otp-form	idp2	a390a4fb-84f8-4e1d-951d-d2ba33e0afb7	0	20	f	\N	\N
10b37b6d-0b8a-47c6-96db-2f8bac102960	\N	http-basic-authenticator	idp2	992eaa1a-c171-47df-b1a3-66638fcb4f1f	0	10	f	\N	\N
45743c17-1217-4c56-95c4-04d8792c506d	\N	docker-http-basic-authenticator	idp2	9a421374-4f7b-49e9-a545-8f87606effa8	0	10	f	\N	\N
9c3de777-b648-4d20-b1cc-23837b74f3aa	\N	no-cookie-redirect	idp2	a960289a-d30b-4aeb-b9cc-5be42682b769	0	10	f	\N	\N
6e62a9eb-556f-4a34-be0d-e0ff8e321252	\N	\N	idp2	a960289a-d30b-4aeb-b9cc-5be42682b769	0	20	t	a4379b86-2926-450a-a8dc-697eec829903	\N
b78703f4-346f-419e-bebd-989b9376610e	\N	basic-auth	idp2	a4379b86-2926-450a-a8dc-697eec829903	0	10	f	\N	\N
f81c2c1f-5028-47b6-8850-58106755dcb9	\N	basic-auth-otp	idp2	a4379b86-2926-450a-a8dc-697eec829903	3	20	f	\N	\N
82ef5952-82aa-44ca-af75-f9b02e48b34a	\N	auth-spnego	idp2	a4379b86-2926-450a-a8dc-697eec829903	3	30	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
05dabaf1-aa19-4649-a10b-d546c9a987dd	browser	browser based authentication	master	basic-flow	t	t
c57cf74a-d690-430c-89d8-506713b0a641	forms	Username, password, otp and other auth forms.	master	basic-flow	f	t
f1d0b876-608a-4582-9251-f99eaac985b3	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
59c4129f-76fb-4ecd-8d6e-bd2b9294e7c8	direct grant	OpenID Connect Resource Owner Grant	master	basic-flow	t	t
58c299c5-b970-4f4d-824a-6f62296a4095	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
a72f912c-884d-40ec-80ee-f58927c19f3f	registration	registration flow	master	basic-flow	t	t
e2eb1cdb-fc83-421c-a4d8-44e68232f529	registration form	registration form	master	form-flow	f	t
c4bc5dec-5f75-42a0-83d3-a8e98ff22f25	reset credentials	Reset credentials for a user if they forgot their password or something	master	basic-flow	t	t
6277f4f6-b053-495f-b1ca-36271b16ad35	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	master	basic-flow	f	t
6a14112d-2b10-4196-8d85-f2080bef7dfa	clients	Base authentication for clients	master	client-flow	t	t
f2ea78e6-0daf-4cc8-91ca-e6b39f448e18	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	master	basic-flow	t	t
ea555723-0af1-4afb-9810-f28013c3fde8	User creation or linking	Flow for the existing/non-existing user alternatives	master	basic-flow	f	t
0dad17c6-c5c0-47d4-9ece-5d5a157d80a6	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	master	basic-flow	f	t
9c49a781-1cee-4773-a68b-bfe1944e8f33	Account verification options	Method with which to verity the existing account	master	basic-flow	f	t
06613723-c6b6-4efb-85b1-a84c59d98bee	Verify Existing Account by Re-authentication	Reauthentication of existing account	master	basic-flow	f	t
37d2378f-c7cd-49a4-9df8-2af6d7535158	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
3a7bac29-6d9e-4f0d-b71d-56d6ca5c033c	saml ecp	SAML ECP Profile Authentication Flow	master	basic-flow	t	t
9c43a4ff-63ac-41ed-88bd-ccc556a5293b	docker auth	Used by Docker clients to authenticate against the IDP	master	basic-flow	t	t
049537fa-02ba-4699-b59b-1b4631921577	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	master	basic-flow	t	t
5126300f-1f60-4785-9674-01cf156ff4cc	Authentication Options	Authentication options.	master	basic-flow	f	t
35630408-7231-41ce-9017-8d4351e28c9f	browser	browser based authentication	idp1	basic-flow	t	t
33406282-aac1-4fee-a0a6-8cb7f2b03181	forms	Username, password, otp and other auth forms.	idp1	basic-flow	f	t
e5713655-74a1-4700-a18d-55a7ee7bf6fc	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	idp1	basic-flow	f	t
53488584-71ed-4e9b-928b-693c2b9284b9	direct grant	OpenID Connect Resource Owner Grant	idp1	basic-flow	t	t
f84e4b17-fbb2-47ea-9ce4-d207b72a2d57	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	idp1	basic-flow	f	t
01b63b85-5c34-49d1-abdc-65604d580f41	registration	registration flow	idp1	basic-flow	t	t
3c05bffd-5b7d-4071-b272-3ee73b998b9f	registration form	registration form	idp1	form-flow	f	t
9bc01d2e-546e-4fd5-916c-3731996395b3	reset credentials	Reset credentials for a user if they forgot their password or something	idp1	basic-flow	t	t
872eac11-5dc0-424b-805f-60f49e03476d	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	idp1	basic-flow	f	t
ac7e99f1-9441-4dd1-b587-e778fdc578a0	clients	Base authentication for clients	idp1	client-flow	t	t
e316bea3-71dc-4674-8a07-e9f12ba146cd	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	idp1	basic-flow	t	t
1a201da1-6523-4667-b0e4-27c3b8cbd4ef	User creation or linking	Flow for the existing/non-existing user alternatives	idp1	basic-flow	f	t
0b2c8127-521c-4db2-b63e-7c5ad155e776	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	idp1	basic-flow	f	t
4e5c629b-9771-462b-bc6d-e33c6a6f3e3f	Account verification options	Method with which to verity the existing account	idp1	basic-flow	f	t
a8dd8c20-e069-4e41-ae98-1c3e997f34db	Verify Existing Account by Re-authentication	Reauthentication of existing account	idp1	basic-flow	f	t
7fd0000c-45fc-4dc9-8787-4eddbb60e1c0	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	idp1	basic-flow	f	t
acf29285-6dc0-473a-bb4c-c38a3706aaea	saml ecp	SAML ECP Profile Authentication Flow	idp1	basic-flow	t	t
d2293172-f1a7-4c55-a930-9e435b0f718c	docker auth	Used by Docker clients to authenticate against the IDP	idp1	basic-flow	t	t
c100df38-cffc-4cd2-9f56-ac2e2d7c8015	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	idp1	basic-flow	t	t
75ab9c9a-8964-4738-abe6-b944ec47a409	Authentication Options	Authentication options.	idp1	basic-flow	f	t
bfe73b71-0ba7-493c-ae4c-fb56cd9acf2e	browser	browser based authentication	idp2	basic-flow	t	t
c33eafac-b75b-4d00-bb8f-7be5c1321a7e	forms	Username, password, otp and other auth forms.	idp2	basic-flow	f	t
d2c2df48-87df-4711-b27a-69fc7cbbd43b	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	idp2	basic-flow	f	t
6d1ff1a5-aa6f-45c6-a82e-6e7e9dfe7d69	direct grant	OpenID Connect Resource Owner Grant	idp2	basic-flow	t	t
b8c33d62-8cd3-45ad-8a29-7ba163b4a404	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	idp2	basic-flow	f	t
2166cc67-0adb-4ad2-97d8-a6792bd7e74a	registration	registration flow	idp2	basic-flow	t	t
b721960a-8853-4b01-bd28-dc8dcad635ec	registration form	registration form	idp2	form-flow	f	t
5dc34871-cfc1-40c9-ac66-b5762524924c	reset credentials	Reset credentials for a user if they forgot their password or something	idp2	basic-flow	t	t
d4a7b6d0-63aa-4eed-9c5e-afe2c10d06ea	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	idp2	basic-flow	f	t
a49b6a0d-d6a7-418c-8bfa-5f8dfda45cba	clients	Base authentication for clients	idp2	client-flow	t	t
256aa084-8369-4af0-8bf1-d72ab2fb4939	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	idp2	basic-flow	t	t
637e9e22-bef6-43e4-8e8e-de5513ae3cd9	User creation or linking	Flow for the existing/non-existing user alternatives	idp2	basic-flow	f	t
fc1ac105-5df3-41c2-bc30-fdd6ce8198c1	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	idp2	basic-flow	f	t
4909a7eb-5fd4-4aef-b8e6-858dd2fb3a20	Account verification options	Method with which to verity the existing account	idp2	basic-flow	f	t
88651bc9-6020-45a2-ac34-0edf248c813a	Verify Existing Account by Re-authentication	Reauthentication of existing account	idp2	basic-flow	f	t
a390a4fb-84f8-4e1d-951d-d2ba33e0afb7	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	idp2	basic-flow	f	t
992eaa1a-c171-47df-b1a3-66638fcb4f1f	saml ecp	SAML ECP Profile Authentication Flow	idp2	basic-flow	t	t
9a421374-4f7b-49e9-a545-8f87606effa8	docker auth	Used by Docker clients to authenticate against the IDP	idp2	basic-flow	t	t
a960289a-d30b-4aeb-b9cc-5be42682b769	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	idp2	basic-flow	t	t
a4379b86-2926-450a-a8dc-697eec829903	Authentication Options	Authentication options.	idp2	basic-flow	f	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.authenticator_config (id, alias, realm_id) FROM stdin;
7658409a-10b1-4c0f-9617-5d5cd1a67a76	review profile config	master
d73d6462-d171-4269-8a96-6fac9924ff52	create unique user config	master
5ff7d74d-b58f-424e-971c-22e402a7a77f	review profile config	idp1
4f10da10-fc53-491a-928b-5364da64235c	create unique user config	idp1
36eb5287-d797-459b-b531-381f6db1203b	review profile config	idp2
1c03c6ef-e0fb-47de-953f-bbebb191022f	create unique user config	idp2
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
7658409a-10b1-4c0f-9617-5d5cd1a67a76	missing	update.profile.on.first.login
d73d6462-d171-4269-8a96-6fac9924ff52	false	require.password.update.after.registration
5ff7d74d-b58f-424e-971c-22e402a7a77f	missing	update.profile.on.first.login
4f10da10-fc53-491a-928b-5364da64235c	false	require.password.update.after.registration
36eb5287-d797-459b-b531-381f6db1203b	missing	update.profile.on.first.login
1c03c6ef-e0fb-47de-953f-bbebb191022f	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
99ef1033-fe12-4820-9069-f08ef89fcd1a	t	f	master-realm	0	f	\N	\N	t	\N	f	master	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
70c8782b-daf7-47a3-8158-967fb3136ce8	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
3f3cf5f1-2598-41ce-abb9-2f1fa15bc8d0	t	f	broker	0	f	\N	\N	t	\N	f	master	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
62f0b9a7-6ca2-4cd8-9630-116e3c8e0aab	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	master	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
7f982a45-ad9b-4977-9f27-9b0c3c1bb970	t	f	admin-cli	0	t	\N	\N	f	\N	f	master	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
38f342fe-a164-4928-94ce-86c2ff574f2c	t	t	iam_user_id	0	f	SWHegJWYSq4OSKau7ndySvxdo7gNLwjQ	\N	f	\N	f	master	openid-connect	-1	f	f	\N	t	client-secret	\N	\N	\N	t	f	t	f
f9ea5e59-8453-4997-9e7a-0524931be1ac	t	t	sa-cl1-reg-1	0	f	nzjUqdNBYbpJHJF2rbiM659lTxCWBdKz	\N	f	\N	f	master	openid-connect	-1	f	f	\N	t	client-secret	\N	\N	\N	t	f	t	f
350c8e59-0892-4bd1-93a7-90e8e7907108	t	f	idp1-realm	0	f	\N	\N	t	\N	f	master	\N	0	f	f	idp1 Realm	f	client-secret	\N	\N	\N	t	f	f	f
f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	f	realm-management	0	f	\N	\N	t	\N	f	idp1	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
cba5cd0d-1e50-4b56-adc0-2ec111f848a1	t	f	account	0	t	\N	/realms/idp1/account/	f	\N	f	idp1	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
a31ff307-fa23-4749-9f0b-ffd3c20a316d	t	f	account-console	0	t	\N	/realms/idp1/account/	f	\N	f	idp1	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
1a5c1598-7e09-43ee-a194-6bf6baef32ea	t	f	broker	0	f	\N	\N	t	\N	f	idp1	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
3c3326af-8f11-44c7-9e23-7876c3142a3f	t	f	security-admin-console	0	t	\N	/admin/idp1/console/	f	\N	f	idp1	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
645acdff-ba24-4e6b-996d-d9f09e01bba9	t	f	admin-cli	0	t	\N	\N	f	\N	f	idp1	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
aa0e2a76-477b-4855-89f8-39f90c2afe34	t	t	central-idp	0	f	jPg3Yl87YyyYrmXCX5lmkAtMqD4mf6Ug	\N	f	\N	f	idp1	openid-connect	-1	f	f	\N	f	client-jwt	\N	\N	\N	t	f	t	f
0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	f	idp2-realm	0	f	\N	\N	t	\N	f	master	\N	0	f	f	idp2 Realm	f	client-secret	\N	\N	\N	t	f	f	f
8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	f	realm-management	0	f	\N	\N	t	\N	f	idp2	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
0930b3c3-b0ea-46db-b765-c02775579f10	t	f	account	0	t	\N	/realms/idp2/account/	f	\N	f	idp2	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
fd0a3e4a-2997-4975-9752-217d3dede715	t	f	account-console	0	t	\N	/realms/idp2/account/	f	\N	f	idp2	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
00c6faa8-d259-4fdd-bfc8-d8649b362f82	t	f	broker	0	f	\N	\N	t	\N	f	idp2	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
28bff4e7-9868-486d-93ae-374994b60819	t	f	security-admin-console	0	t	\N	/admin/idp2/console/	f	\N	f	idp2	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
2a4e93f9-1f46-49a5-a5d2-276b22df6fc9	t	f	admin-cli	0	t	\N	\N	f	\N	f	idp2	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
6485fa7b-ba42-4456-8e61-d8d82fb0141c	t	t	central-idp	0	f	QReqzpGw1VeIMHLaEltcmu1u1zOj2SBz	\N	f	\N	f	idp2	openid-connect	-1	f	f	\N	f	client-jwt	\N	\N	\N	t	f	t	f
503fd407-6e27-47a9-8001-97e53892cc0a	t	t	saidp1	0	f	IFeLV58INRHwfu3GQg5PSZnroG0TWNqH	\N	f	\N	f	master	openid-connect	-1	f	f	\N	t	client-secret	\N	\N	\N	t	f	t	f
19324db5-81e8-4b25-8f67-a085e8fd6222	t	t	saidp2	0	f	xCNKGZzbhNsD8IOh9LRp6yBvvr9vS36n	\N	f	\N	f	master	openid-connect	-1	f	f	\N	t	client-secret	\N	\N	\N	t	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.client_attributes (client_id, value, name) FROM stdin;
70c8782b-daf7-47a3-8158-967fb3136ce8	S256	pkce.code.challenge.method
62f0b9a7-6ca2-4cd8-9630-116e3c8e0aab	S256	pkce.code.challenge.method
38f342fe-a164-4928-94ce-86c2ff574f2c	true	backchannel.logout.session.required
38f342fe-a164-4928-94ce-86c2ff574f2c	false	backchannel.logout.revoke.offline.tokens
38f342fe-a164-4928-94ce-86c2ff574f2c	false	saml.artifact.binding
38f342fe-a164-4928-94ce-86c2ff574f2c	false	saml.server.signature
38f342fe-a164-4928-94ce-86c2ff574f2c	false	saml.server.signature.keyinfo.ext
38f342fe-a164-4928-94ce-86c2ff574f2c	false	saml.assertion.signature
38f342fe-a164-4928-94ce-86c2ff574f2c	false	saml.client.signature
38f342fe-a164-4928-94ce-86c2ff574f2c	false	saml.encrypt
38f342fe-a164-4928-94ce-86c2ff574f2c	false	saml.authnstatement
38f342fe-a164-4928-94ce-86c2ff574f2c	false	saml.onetimeuse.condition
38f342fe-a164-4928-94ce-86c2ff574f2c	false	saml_force_name_id_format
38f342fe-a164-4928-94ce-86c2ff574f2c	false	saml.multivalued.roles
38f342fe-a164-4928-94ce-86c2ff574f2c	false	saml.force.post.binding
38f342fe-a164-4928-94ce-86c2ff574f2c	false	exclude.session.state.from.auth.response
38f342fe-a164-4928-94ce-86c2ff574f2c	false	oauth2.device.authorization.grant.enabled
38f342fe-a164-4928-94ce-86c2ff574f2c	false	oidc.ciba.grant.enabled
38f342fe-a164-4928-94ce-86c2ff574f2c	true	use.refresh.tokens
38f342fe-a164-4928-94ce-86c2ff574f2c	false	id.token.as.detached.signature
38f342fe-a164-4928-94ce-86c2ff574f2c	false	tls.client.certificate.bound.access.tokens
38f342fe-a164-4928-94ce-86c2ff574f2c	false	require.pushed.authorization.requests
38f342fe-a164-4928-94ce-86c2ff574f2c	false	client_credentials.use_refresh_token
38f342fe-a164-4928-94ce-86c2ff574f2c	false	display.on.consent.screen
f9ea5e59-8453-4997-9e7a-0524931be1ac	true	backchannel.logout.session.required
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	backchannel.logout.revoke.offline.tokens
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	saml.artifact.binding
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	saml.server.signature
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	saml.server.signature.keyinfo.ext
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	saml.assertion.signature
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	saml.client.signature
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	saml.encrypt
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	saml.authnstatement
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	saml.onetimeuse.condition
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	saml_force_name_id_format
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	saml.multivalued.roles
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	saml.force.post.binding
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	exclude.session.state.from.auth.response
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	oauth2.device.authorization.grant.enabled
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	oidc.ciba.grant.enabled
f9ea5e59-8453-4997-9e7a-0524931be1ac	true	use.refresh.tokens
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	id.token.as.detached.signature
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	tls.client.certificate.bound.access.tokens
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	require.pushed.authorization.requests
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	client_credentials.use_refresh_token
f9ea5e59-8453-4997-9e7a-0524931be1ac	false	display.on.consent.screen
a31ff307-fa23-4749-9f0b-ffd3c20a316d	S256	pkce.code.challenge.method
3c3326af-8f11-44c7-9e23-7876c3142a3f	S256	pkce.code.challenge.method
aa0e2a76-477b-4855-89f8-39f90c2afe34	https://devhost:8443/iamcentral/auth/realms/CX-Central/protocol/openid-connect/certs	jwks.url
aa0e2a76-477b-4855-89f8-39f90c2afe34	RS256	token.endpoint.auth.signing.alg
aa0e2a76-477b-4855-89f8-39f90c2afe34	true	use.jwks.url
aa0e2a76-477b-4855-89f8-39f90c2afe34	true	backchannel.logout.session.required
aa0e2a76-477b-4855-89f8-39f90c2afe34	false	backchannel.logout.revoke.offline.tokens
fd0a3e4a-2997-4975-9752-217d3dede715	S256	pkce.code.challenge.method
28bff4e7-9868-486d-93ae-374994b60819	S256	pkce.code.challenge.method
6485fa7b-ba42-4456-8e61-d8d82fb0141c	https://wsl:8443/iamcentral/auth/realms/CX-Central/protocol/openid-connect/certs	jwks.url
6485fa7b-ba42-4456-8e61-d8d82fb0141c	RS256	token.endpoint.auth.signing.alg
6485fa7b-ba42-4456-8e61-d8d82fb0141c	true	use.jwks.url
6485fa7b-ba42-4456-8e61-d8d82fb0141c	true	backchannel.logout.session.required
6485fa7b-ba42-4456-8e61-d8d82fb0141c	false	backchannel.logout.revoke.offline.tokens
503fd407-6e27-47a9-8001-97e53892cc0a	true	backchannel.logout.session.required
503fd407-6e27-47a9-8001-97e53892cc0a	false	backchannel.logout.revoke.offline.tokens
503fd407-6e27-47a9-8001-97e53892cc0a	false	saml.artifact.binding
503fd407-6e27-47a9-8001-97e53892cc0a	false	saml.server.signature
503fd407-6e27-47a9-8001-97e53892cc0a	false	saml.server.signature.keyinfo.ext
503fd407-6e27-47a9-8001-97e53892cc0a	false	saml.assertion.signature
503fd407-6e27-47a9-8001-97e53892cc0a	false	saml.client.signature
503fd407-6e27-47a9-8001-97e53892cc0a	false	saml.encrypt
503fd407-6e27-47a9-8001-97e53892cc0a	false	saml.authnstatement
503fd407-6e27-47a9-8001-97e53892cc0a	false	saml.onetimeuse.condition
503fd407-6e27-47a9-8001-97e53892cc0a	false	saml_force_name_id_format
503fd407-6e27-47a9-8001-97e53892cc0a	false	saml.multivalued.roles
503fd407-6e27-47a9-8001-97e53892cc0a	false	saml.force.post.binding
503fd407-6e27-47a9-8001-97e53892cc0a	false	exclude.session.state.from.auth.response
503fd407-6e27-47a9-8001-97e53892cc0a	false	oauth2.device.authorization.grant.enabled
503fd407-6e27-47a9-8001-97e53892cc0a	false	oidc.ciba.grant.enabled
503fd407-6e27-47a9-8001-97e53892cc0a	true	use.refresh.tokens
503fd407-6e27-47a9-8001-97e53892cc0a	false	id.token.as.detached.signature
503fd407-6e27-47a9-8001-97e53892cc0a	false	tls.client.certificate.bound.access.tokens
503fd407-6e27-47a9-8001-97e53892cc0a	false	require.pushed.authorization.requests
503fd407-6e27-47a9-8001-97e53892cc0a	false	client_credentials.use_refresh_token
503fd407-6e27-47a9-8001-97e53892cc0a	false	display.on.consent.screen
19324db5-81e8-4b25-8f67-a085e8fd6222	true	backchannel.logout.session.required
19324db5-81e8-4b25-8f67-a085e8fd6222	false	backchannel.logout.revoke.offline.tokens
19324db5-81e8-4b25-8f67-a085e8fd6222	false	saml.artifact.binding
19324db5-81e8-4b25-8f67-a085e8fd6222	false	saml.server.signature
19324db5-81e8-4b25-8f67-a085e8fd6222	false	saml.server.signature.keyinfo.ext
19324db5-81e8-4b25-8f67-a085e8fd6222	false	saml.assertion.signature
19324db5-81e8-4b25-8f67-a085e8fd6222	false	saml.client.signature
19324db5-81e8-4b25-8f67-a085e8fd6222	false	saml.encrypt
19324db5-81e8-4b25-8f67-a085e8fd6222	false	saml.authnstatement
19324db5-81e8-4b25-8f67-a085e8fd6222	false	saml.onetimeuse.condition
19324db5-81e8-4b25-8f67-a085e8fd6222	false	saml_force_name_id_format
19324db5-81e8-4b25-8f67-a085e8fd6222	false	saml.multivalued.roles
19324db5-81e8-4b25-8f67-a085e8fd6222	false	saml.force.post.binding
19324db5-81e8-4b25-8f67-a085e8fd6222	false	exclude.session.state.from.auth.response
19324db5-81e8-4b25-8f67-a085e8fd6222	false	oauth2.device.authorization.grant.enabled
19324db5-81e8-4b25-8f67-a085e8fd6222	false	oidc.ciba.grant.enabled
19324db5-81e8-4b25-8f67-a085e8fd6222	true	use.refresh.tokens
19324db5-81e8-4b25-8f67-a085e8fd6222	false	id.token.as.detached.signature
19324db5-81e8-4b25-8f67-a085e8fd6222	false	tls.client.certificate.bound.access.tokens
19324db5-81e8-4b25-8f67-a085e8fd6222	false	require.pushed.authorization.requests
19324db5-81e8-4b25-8f67-a085e8fd6222	false	client_credentials.use_refresh_token
19324db5-81e8-4b25-8f67-a085e8fd6222	false	display.on.consent.screen
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.client_scope (id, name, realm_id, description, protocol) FROM stdin;
d5909064-37a4-4cd8-995f-da6675c81629	offline_access	master	OpenID Connect built-in scope: offline_access	openid-connect
0c8c1fa5-b26d-43c7-8173-e779e8319278	role_list	master	SAML role list	saml
72fbe764-b192-463e-992b-ee50971b9a5a	profile	master	OpenID Connect built-in scope: profile	openid-connect
3d7c7e6d-e8f2-4d0e-ba63-1ee879299964	email	master	OpenID Connect built-in scope: email	openid-connect
ab36e86d-028d-4c3c-b626-a58c855ab0f0	address	master	OpenID Connect built-in scope: address	openid-connect
92d99ca8-0faa-4df6-aecb-ec264afc1a08	phone	master	OpenID Connect built-in scope: phone	openid-connect
7d35c604-2bf0-41fb-9e0a-84721050d48f	roles	master	OpenID Connect scope for add user roles to the access token	openid-connect
a92ad0e3-298b-4c29-b026-bfbc23e550e4	web-origins	master	OpenID Connect scope for add allowed web origins to the access token	openid-connect
3750c622-b41b-40fb-9129-9fe4a5928591	microprofile-jwt	master	Microprofile - JWT built-in scope	openid-connect
d6ae812a-05a8-4277-b73e-af63f8617a42	address	idp1	OpenID Connect built-in scope: address	openid-connect
70c95c82-eb6b-4a07-a843-0324cf9f70ea	phone	idp1	OpenID Connect built-in scope: phone	openid-connect
6907f50b-922d-4045-a34c-d14f3d3c7312	roles	idp1	OpenID Connect scope for add user roles to the access token	openid-connect
0d1fa12b-62fa-4328-9f99-e09ef958b664	web-origins	idp1	OpenID Connect scope for add allowed web origins to the access token	openid-connect
d408470e-93dc-4dfc-9ad8-06b0d9f97762	microprofile-jwt	idp1	Microprofile - JWT built-in scope	openid-connect
ebf588b9-a67b-49be-af34-c57c6839d2bf	offline_access	idp1	OpenID Connect built-in scope: offline_access	openid-connect
cb31a428-a081-4059-8faf-f0e1e486be88	role_list	idp1	SAML role list	saml
2e84accf-757b-4d3f-bf00-36a7c4541f88	profile	idp1	OpenID Connect built-in scope: profile	openid-connect
121927d8-16f5-46a9-b94a-ff6a9e51ec72	email	idp1	OpenID Connect built-in scope: email	openid-connect
9768a898-6a62-4e46-81ac-bf179fc691ec	offline_access	idp2	OpenID Connect built-in scope: offline_access	openid-connect
9cbd6416-1106-4948-8efc-12fa442e408f	role_list	idp2	SAML role list	saml
73f21ff8-9f52-4014-9ad2-a5543278ece0	profile	idp2	OpenID Connect built-in scope: profile	openid-connect
86c6d9cb-e044-4938-a92d-7ea6efc972a8	email	idp2	OpenID Connect built-in scope: email	openid-connect
4784e596-acbe-42bb-8887-09a7bc21eadd	address	idp2	OpenID Connect built-in scope: address	openid-connect
0b573c62-d03f-4bdd-ad9d-05950d11ebdf	phone	idp2	OpenID Connect built-in scope: phone	openid-connect
ab217cca-28e9-43c0-a419-298aee0c435f	roles	idp2	OpenID Connect scope for add user roles to the access token	openid-connect
48f9943c-94cb-47bb-ac74-3f643990aeab	web-origins	idp2	OpenID Connect scope for add allowed web origins to the access token	openid-connect
1b5f828d-701d-49ea-a9da-b1c83606240d	microprofile-jwt	idp2	Microprofile - JWT built-in scope	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.client_scope_attributes (scope_id, value, name) FROM stdin;
d5909064-37a4-4cd8-995f-da6675c81629	true	display.on.consent.screen
d5909064-37a4-4cd8-995f-da6675c81629	${offlineAccessScopeConsentText}	consent.screen.text
0c8c1fa5-b26d-43c7-8173-e779e8319278	true	display.on.consent.screen
0c8c1fa5-b26d-43c7-8173-e779e8319278	${samlRoleListScopeConsentText}	consent.screen.text
72fbe764-b192-463e-992b-ee50971b9a5a	true	display.on.consent.screen
72fbe764-b192-463e-992b-ee50971b9a5a	${profileScopeConsentText}	consent.screen.text
72fbe764-b192-463e-992b-ee50971b9a5a	true	include.in.token.scope
3d7c7e6d-e8f2-4d0e-ba63-1ee879299964	true	display.on.consent.screen
3d7c7e6d-e8f2-4d0e-ba63-1ee879299964	${emailScopeConsentText}	consent.screen.text
3d7c7e6d-e8f2-4d0e-ba63-1ee879299964	true	include.in.token.scope
ab36e86d-028d-4c3c-b626-a58c855ab0f0	true	display.on.consent.screen
ab36e86d-028d-4c3c-b626-a58c855ab0f0	${addressScopeConsentText}	consent.screen.text
ab36e86d-028d-4c3c-b626-a58c855ab0f0	true	include.in.token.scope
92d99ca8-0faa-4df6-aecb-ec264afc1a08	true	display.on.consent.screen
92d99ca8-0faa-4df6-aecb-ec264afc1a08	${phoneScopeConsentText}	consent.screen.text
92d99ca8-0faa-4df6-aecb-ec264afc1a08	true	include.in.token.scope
7d35c604-2bf0-41fb-9e0a-84721050d48f	true	display.on.consent.screen
7d35c604-2bf0-41fb-9e0a-84721050d48f	${rolesScopeConsentText}	consent.screen.text
7d35c604-2bf0-41fb-9e0a-84721050d48f	false	include.in.token.scope
a92ad0e3-298b-4c29-b026-bfbc23e550e4	false	display.on.consent.screen
a92ad0e3-298b-4c29-b026-bfbc23e550e4		consent.screen.text
a92ad0e3-298b-4c29-b026-bfbc23e550e4	false	include.in.token.scope
3750c622-b41b-40fb-9129-9fe4a5928591	false	display.on.consent.screen
3750c622-b41b-40fb-9129-9fe4a5928591	true	include.in.token.scope
ebf588b9-a67b-49be-af34-c57c6839d2bf	true	display.on.consent.screen
ebf588b9-a67b-49be-af34-c57c6839d2bf	${offlineAccessScopeConsentText}	consent.screen.text
cb31a428-a081-4059-8faf-f0e1e486be88	true	display.on.consent.screen
cb31a428-a081-4059-8faf-f0e1e486be88	${samlRoleListScopeConsentText}	consent.screen.text
2e84accf-757b-4d3f-bf00-36a7c4541f88	true	display.on.consent.screen
2e84accf-757b-4d3f-bf00-36a7c4541f88	${profileScopeConsentText}	consent.screen.text
2e84accf-757b-4d3f-bf00-36a7c4541f88	true	include.in.token.scope
121927d8-16f5-46a9-b94a-ff6a9e51ec72	true	display.on.consent.screen
121927d8-16f5-46a9-b94a-ff6a9e51ec72	${emailScopeConsentText}	consent.screen.text
121927d8-16f5-46a9-b94a-ff6a9e51ec72	true	include.in.token.scope
d6ae812a-05a8-4277-b73e-af63f8617a42	true	display.on.consent.screen
d6ae812a-05a8-4277-b73e-af63f8617a42	${addressScopeConsentText}	consent.screen.text
d6ae812a-05a8-4277-b73e-af63f8617a42	true	include.in.token.scope
70c95c82-eb6b-4a07-a843-0324cf9f70ea	true	display.on.consent.screen
70c95c82-eb6b-4a07-a843-0324cf9f70ea	${phoneScopeConsentText}	consent.screen.text
70c95c82-eb6b-4a07-a843-0324cf9f70ea	true	include.in.token.scope
6907f50b-922d-4045-a34c-d14f3d3c7312	true	display.on.consent.screen
6907f50b-922d-4045-a34c-d14f3d3c7312	${rolesScopeConsentText}	consent.screen.text
6907f50b-922d-4045-a34c-d14f3d3c7312	false	include.in.token.scope
0d1fa12b-62fa-4328-9f99-e09ef958b664	false	display.on.consent.screen
0d1fa12b-62fa-4328-9f99-e09ef958b664		consent.screen.text
0d1fa12b-62fa-4328-9f99-e09ef958b664	false	include.in.token.scope
d408470e-93dc-4dfc-9ad8-06b0d9f97762	false	display.on.consent.screen
d408470e-93dc-4dfc-9ad8-06b0d9f97762	true	include.in.token.scope
9768a898-6a62-4e46-81ac-bf179fc691ec	true	display.on.consent.screen
9768a898-6a62-4e46-81ac-bf179fc691ec	${offlineAccessScopeConsentText}	consent.screen.text
9cbd6416-1106-4948-8efc-12fa442e408f	true	display.on.consent.screen
9cbd6416-1106-4948-8efc-12fa442e408f	${samlRoleListScopeConsentText}	consent.screen.text
73f21ff8-9f52-4014-9ad2-a5543278ece0	true	display.on.consent.screen
73f21ff8-9f52-4014-9ad2-a5543278ece0	${profileScopeConsentText}	consent.screen.text
73f21ff8-9f52-4014-9ad2-a5543278ece0	true	include.in.token.scope
86c6d9cb-e044-4938-a92d-7ea6efc972a8	true	display.on.consent.screen
86c6d9cb-e044-4938-a92d-7ea6efc972a8	${emailScopeConsentText}	consent.screen.text
86c6d9cb-e044-4938-a92d-7ea6efc972a8	true	include.in.token.scope
4784e596-acbe-42bb-8887-09a7bc21eadd	true	display.on.consent.screen
4784e596-acbe-42bb-8887-09a7bc21eadd	${addressScopeConsentText}	consent.screen.text
4784e596-acbe-42bb-8887-09a7bc21eadd	true	include.in.token.scope
0b573c62-d03f-4bdd-ad9d-05950d11ebdf	true	display.on.consent.screen
0b573c62-d03f-4bdd-ad9d-05950d11ebdf	${phoneScopeConsentText}	consent.screen.text
0b573c62-d03f-4bdd-ad9d-05950d11ebdf	true	include.in.token.scope
ab217cca-28e9-43c0-a419-298aee0c435f	true	display.on.consent.screen
ab217cca-28e9-43c0-a419-298aee0c435f	${rolesScopeConsentText}	consent.screen.text
ab217cca-28e9-43c0-a419-298aee0c435f	false	include.in.token.scope
48f9943c-94cb-47bb-ac74-3f643990aeab	false	display.on.consent.screen
48f9943c-94cb-47bb-ac74-3f643990aeab		consent.screen.text
48f9943c-94cb-47bb-ac74-3f643990aeab	false	include.in.token.scope
1b5f828d-701d-49ea-a9da-b1c83606240d	false	display.on.consent.screen
1b5f828d-701d-49ea-a9da-b1c83606240d	true	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	72fbe764-b192-463e-992b-ee50971b9a5a	t
e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	a92ad0e3-298b-4c29-b026-bfbc23e550e4	t
e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	7d35c604-2bf0-41fb-9e0a-84721050d48f	t
e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	3d7c7e6d-e8f2-4d0e-ba63-1ee879299964	t
e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	92d99ca8-0faa-4df6-aecb-ec264afc1a08	f
e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	d5909064-37a4-4cd8-995f-da6675c81629	f
e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	3750c622-b41b-40fb-9129-9fe4a5928591	f
e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	ab36e86d-028d-4c3c-b626-a58c855ab0f0	f
70c8782b-daf7-47a3-8158-967fb3136ce8	72fbe764-b192-463e-992b-ee50971b9a5a	t
70c8782b-daf7-47a3-8158-967fb3136ce8	a92ad0e3-298b-4c29-b026-bfbc23e550e4	t
70c8782b-daf7-47a3-8158-967fb3136ce8	7d35c604-2bf0-41fb-9e0a-84721050d48f	t
70c8782b-daf7-47a3-8158-967fb3136ce8	3d7c7e6d-e8f2-4d0e-ba63-1ee879299964	t
70c8782b-daf7-47a3-8158-967fb3136ce8	92d99ca8-0faa-4df6-aecb-ec264afc1a08	f
70c8782b-daf7-47a3-8158-967fb3136ce8	d5909064-37a4-4cd8-995f-da6675c81629	f
70c8782b-daf7-47a3-8158-967fb3136ce8	3750c622-b41b-40fb-9129-9fe4a5928591	f
70c8782b-daf7-47a3-8158-967fb3136ce8	ab36e86d-028d-4c3c-b626-a58c855ab0f0	f
7f982a45-ad9b-4977-9f27-9b0c3c1bb970	72fbe764-b192-463e-992b-ee50971b9a5a	t
7f982a45-ad9b-4977-9f27-9b0c3c1bb970	a92ad0e3-298b-4c29-b026-bfbc23e550e4	t
7f982a45-ad9b-4977-9f27-9b0c3c1bb970	7d35c604-2bf0-41fb-9e0a-84721050d48f	t
7f982a45-ad9b-4977-9f27-9b0c3c1bb970	3d7c7e6d-e8f2-4d0e-ba63-1ee879299964	t
7f982a45-ad9b-4977-9f27-9b0c3c1bb970	92d99ca8-0faa-4df6-aecb-ec264afc1a08	f
7f982a45-ad9b-4977-9f27-9b0c3c1bb970	d5909064-37a4-4cd8-995f-da6675c81629	f
7f982a45-ad9b-4977-9f27-9b0c3c1bb970	3750c622-b41b-40fb-9129-9fe4a5928591	f
7f982a45-ad9b-4977-9f27-9b0c3c1bb970	ab36e86d-028d-4c3c-b626-a58c855ab0f0	f
3f3cf5f1-2598-41ce-abb9-2f1fa15bc8d0	72fbe764-b192-463e-992b-ee50971b9a5a	t
3f3cf5f1-2598-41ce-abb9-2f1fa15bc8d0	a92ad0e3-298b-4c29-b026-bfbc23e550e4	t
3f3cf5f1-2598-41ce-abb9-2f1fa15bc8d0	7d35c604-2bf0-41fb-9e0a-84721050d48f	t
3f3cf5f1-2598-41ce-abb9-2f1fa15bc8d0	3d7c7e6d-e8f2-4d0e-ba63-1ee879299964	t
3f3cf5f1-2598-41ce-abb9-2f1fa15bc8d0	92d99ca8-0faa-4df6-aecb-ec264afc1a08	f
3f3cf5f1-2598-41ce-abb9-2f1fa15bc8d0	d5909064-37a4-4cd8-995f-da6675c81629	f
3f3cf5f1-2598-41ce-abb9-2f1fa15bc8d0	3750c622-b41b-40fb-9129-9fe4a5928591	f
3f3cf5f1-2598-41ce-abb9-2f1fa15bc8d0	ab36e86d-028d-4c3c-b626-a58c855ab0f0	f
99ef1033-fe12-4820-9069-f08ef89fcd1a	72fbe764-b192-463e-992b-ee50971b9a5a	t
99ef1033-fe12-4820-9069-f08ef89fcd1a	a92ad0e3-298b-4c29-b026-bfbc23e550e4	t
99ef1033-fe12-4820-9069-f08ef89fcd1a	7d35c604-2bf0-41fb-9e0a-84721050d48f	t
99ef1033-fe12-4820-9069-f08ef89fcd1a	3d7c7e6d-e8f2-4d0e-ba63-1ee879299964	t
99ef1033-fe12-4820-9069-f08ef89fcd1a	92d99ca8-0faa-4df6-aecb-ec264afc1a08	f
99ef1033-fe12-4820-9069-f08ef89fcd1a	d5909064-37a4-4cd8-995f-da6675c81629	f
99ef1033-fe12-4820-9069-f08ef89fcd1a	3750c622-b41b-40fb-9129-9fe4a5928591	f
99ef1033-fe12-4820-9069-f08ef89fcd1a	ab36e86d-028d-4c3c-b626-a58c855ab0f0	f
62f0b9a7-6ca2-4cd8-9630-116e3c8e0aab	72fbe764-b192-463e-992b-ee50971b9a5a	t
62f0b9a7-6ca2-4cd8-9630-116e3c8e0aab	a92ad0e3-298b-4c29-b026-bfbc23e550e4	t
62f0b9a7-6ca2-4cd8-9630-116e3c8e0aab	7d35c604-2bf0-41fb-9e0a-84721050d48f	t
62f0b9a7-6ca2-4cd8-9630-116e3c8e0aab	3d7c7e6d-e8f2-4d0e-ba63-1ee879299964	t
62f0b9a7-6ca2-4cd8-9630-116e3c8e0aab	92d99ca8-0faa-4df6-aecb-ec264afc1a08	f
62f0b9a7-6ca2-4cd8-9630-116e3c8e0aab	d5909064-37a4-4cd8-995f-da6675c81629	f
62f0b9a7-6ca2-4cd8-9630-116e3c8e0aab	3750c622-b41b-40fb-9129-9fe4a5928591	f
62f0b9a7-6ca2-4cd8-9630-116e3c8e0aab	ab36e86d-028d-4c3c-b626-a58c855ab0f0	f
38f342fe-a164-4928-94ce-86c2ff574f2c	72fbe764-b192-463e-992b-ee50971b9a5a	t
38f342fe-a164-4928-94ce-86c2ff574f2c	a92ad0e3-298b-4c29-b026-bfbc23e550e4	t
38f342fe-a164-4928-94ce-86c2ff574f2c	7d35c604-2bf0-41fb-9e0a-84721050d48f	t
38f342fe-a164-4928-94ce-86c2ff574f2c	3d7c7e6d-e8f2-4d0e-ba63-1ee879299964	t
38f342fe-a164-4928-94ce-86c2ff574f2c	92d99ca8-0faa-4df6-aecb-ec264afc1a08	f
38f342fe-a164-4928-94ce-86c2ff574f2c	d5909064-37a4-4cd8-995f-da6675c81629	f
38f342fe-a164-4928-94ce-86c2ff574f2c	3750c622-b41b-40fb-9129-9fe4a5928591	f
38f342fe-a164-4928-94ce-86c2ff574f2c	ab36e86d-028d-4c3c-b626-a58c855ab0f0	f
f9ea5e59-8453-4997-9e7a-0524931be1ac	72fbe764-b192-463e-992b-ee50971b9a5a	t
f9ea5e59-8453-4997-9e7a-0524931be1ac	a92ad0e3-298b-4c29-b026-bfbc23e550e4	t
f9ea5e59-8453-4997-9e7a-0524931be1ac	7d35c604-2bf0-41fb-9e0a-84721050d48f	t
f9ea5e59-8453-4997-9e7a-0524931be1ac	3d7c7e6d-e8f2-4d0e-ba63-1ee879299964	t
f9ea5e59-8453-4997-9e7a-0524931be1ac	92d99ca8-0faa-4df6-aecb-ec264afc1a08	f
f9ea5e59-8453-4997-9e7a-0524931be1ac	d5909064-37a4-4cd8-995f-da6675c81629	f
f9ea5e59-8453-4997-9e7a-0524931be1ac	3750c622-b41b-40fb-9129-9fe4a5928591	f
f9ea5e59-8453-4997-9e7a-0524931be1ac	ab36e86d-028d-4c3c-b626-a58c855ab0f0	f
cba5cd0d-1e50-4b56-adc0-2ec111f848a1	121927d8-16f5-46a9-b94a-ff6a9e51ec72	t
cba5cd0d-1e50-4b56-adc0-2ec111f848a1	0d1fa12b-62fa-4328-9f99-e09ef958b664	t
cba5cd0d-1e50-4b56-adc0-2ec111f848a1	6907f50b-922d-4045-a34c-d14f3d3c7312	t
cba5cd0d-1e50-4b56-adc0-2ec111f848a1	2e84accf-757b-4d3f-bf00-36a7c4541f88	t
cba5cd0d-1e50-4b56-adc0-2ec111f848a1	ebf588b9-a67b-49be-af34-c57c6839d2bf	f
cba5cd0d-1e50-4b56-adc0-2ec111f848a1	d408470e-93dc-4dfc-9ad8-06b0d9f97762	f
cba5cd0d-1e50-4b56-adc0-2ec111f848a1	d6ae812a-05a8-4277-b73e-af63f8617a42	f
cba5cd0d-1e50-4b56-adc0-2ec111f848a1	70c95c82-eb6b-4a07-a843-0324cf9f70ea	f
a31ff307-fa23-4749-9f0b-ffd3c20a316d	121927d8-16f5-46a9-b94a-ff6a9e51ec72	t
a31ff307-fa23-4749-9f0b-ffd3c20a316d	0d1fa12b-62fa-4328-9f99-e09ef958b664	t
a31ff307-fa23-4749-9f0b-ffd3c20a316d	6907f50b-922d-4045-a34c-d14f3d3c7312	t
a31ff307-fa23-4749-9f0b-ffd3c20a316d	2e84accf-757b-4d3f-bf00-36a7c4541f88	t
a31ff307-fa23-4749-9f0b-ffd3c20a316d	ebf588b9-a67b-49be-af34-c57c6839d2bf	f
a31ff307-fa23-4749-9f0b-ffd3c20a316d	d408470e-93dc-4dfc-9ad8-06b0d9f97762	f
a31ff307-fa23-4749-9f0b-ffd3c20a316d	d6ae812a-05a8-4277-b73e-af63f8617a42	f
a31ff307-fa23-4749-9f0b-ffd3c20a316d	70c95c82-eb6b-4a07-a843-0324cf9f70ea	f
645acdff-ba24-4e6b-996d-d9f09e01bba9	121927d8-16f5-46a9-b94a-ff6a9e51ec72	t
645acdff-ba24-4e6b-996d-d9f09e01bba9	0d1fa12b-62fa-4328-9f99-e09ef958b664	t
645acdff-ba24-4e6b-996d-d9f09e01bba9	6907f50b-922d-4045-a34c-d14f3d3c7312	t
645acdff-ba24-4e6b-996d-d9f09e01bba9	2e84accf-757b-4d3f-bf00-36a7c4541f88	t
645acdff-ba24-4e6b-996d-d9f09e01bba9	ebf588b9-a67b-49be-af34-c57c6839d2bf	f
645acdff-ba24-4e6b-996d-d9f09e01bba9	d408470e-93dc-4dfc-9ad8-06b0d9f97762	f
645acdff-ba24-4e6b-996d-d9f09e01bba9	d6ae812a-05a8-4277-b73e-af63f8617a42	f
645acdff-ba24-4e6b-996d-d9f09e01bba9	70c95c82-eb6b-4a07-a843-0324cf9f70ea	f
1a5c1598-7e09-43ee-a194-6bf6baef32ea	121927d8-16f5-46a9-b94a-ff6a9e51ec72	t
1a5c1598-7e09-43ee-a194-6bf6baef32ea	0d1fa12b-62fa-4328-9f99-e09ef958b664	t
1a5c1598-7e09-43ee-a194-6bf6baef32ea	6907f50b-922d-4045-a34c-d14f3d3c7312	t
1a5c1598-7e09-43ee-a194-6bf6baef32ea	2e84accf-757b-4d3f-bf00-36a7c4541f88	t
1a5c1598-7e09-43ee-a194-6bf6baef32ea	ebf588b9-a67b-49be-af34-c57c6839d2bf	f
1a5c1598-7e09-43ee-a194-6bf6baef32ea	d408470e-93dc-4dfc-9ad8-06b0d9f97762	f
1a5c1598-7e09-43ee-a194-6bf6baef32ea	d6ae812a-05a8-4277-b73e-af63f8617a42	f
1a5c1598-7e09-43ee-a194-6bf6baef32ea	70c95c82-eb6b-4a07-a843-0324cf9f70ea	f
f8c2e970-10a1-4457-b3ca-48e1ad88d646	121927d8-16f5-46a9-b94a-ff6a9e51ec72	t
f8c2e970-10a1-4457-b3ca-48e1ad88d646	0d1fa12b-62fa-4328-9f99-e09ef958b664	t
f8c2e970-10a1-4457-b3ca-48e1ad88d646	6907f50b-922d-4045-a34c-d14f3d3c7312	t
f8c2e970-10a1-4457-b3ca-48e1ad88d646	2e84accf-757b-4d3f-bf00-36a7c4541f88	t
f8c2e970-10a1-4457-b3ca-48e1ad88d646	ebf588b9-a67b-49be-af34-c57c6839d2bf	f
f8c2e970-10a1-4457-b3ca-48e1ad88d646	d408470e-93dc-4dfc-9ad8-06b0d9f97762	f
f8c2e970-10a1-4457-b3ca-48e1ad88d646	d6ae812a-05a8-4277-b73e-af63f8617a42	f
f8c2e970-10a1-4457-b3ca-48e1ad88d646	70c95c82-eb6b-4a07-a843-0324cf9f70ea	f
3c3326af-8f11-44c7-9e23-7876c3142a3f	121927d8-16f5-46a9-b94a-ff6a9e51ec72	t
3c3326af-8f11-44c7-9e23-7876c3142a3f	0d1fa12b-62fa-4328-9f99-e09ef958b664	t
3c3326af-8f11-44c7-9e23-7876c3142a3f	6907f50b-922d-4045-a34c-d14f3d3c7312	t
3c3326af-8f11-44c7-9e23-7876c3142a3f	2e84accf-757b-4d3f-bf00-36a7c4541f88	t
3c3326af-8f11-44c7-9e23-7876c3142a3f	ebf588b9-a67b-49be-af34-c57c6839d2bf	f
3c3326af-8f11-44c7-9e23-7876c3142a3f	d408470e-93dc-4dfc-9ad8-06b0d9f97762	f
3c3326af-8f11-44c7-9e23-7876c3142a3f	d6ae812a-05a8-4277-b73e-af63f8617a42	f
3c3326af-8f11-44c7-9e23-7876c3142a3f	70c95c82-eb6b-4a07-a843-0324cf9f70ea	f
aa0e2a76-477b-4855-89f8-39f90c2afe34	121927d8-16f5-46a9-b94a-ff6a9e51ec72	t
aa0e2a76-477b-4855-89f8-39f90c2afe34	0d1fa12b-62fa-4328-9f99-e09ef958b664	t
aa0e2a76-477b-4855-89f8-39f90c2afe34	6907f50b-922d-4045-a34c-d14f3d3c7312	t
aa0e2a76-477b-4855-89f8-39f90c2afe34	2e84accf-757b-4d3f-bf00-36a7c4541f88	t
aa0e2a76-477b-4855-89f8-39f90c2afe34	ebf588b9-a67b-49be-af34-c57c6839d2bf	f
aa0e2a76-477b-4855-89f8-39f90c2afe34	d408470e-93dc-4dfc-9ad8-06b0d9f97762	f
aa0e2a76-477b-4855-89f8-39f90c2afe34	d6ae812a-05a8-4277-b73e-af63f8617a42	f
aa0e2a76-477b-4855-89f8-39f90c2afe34	70c95c82-eb6b-4a07-a843-0324cf9f70ea	f
0930b3c3-b0ea-46db-b765-c02775579f10	86c6d9cb-e044-4938-a92d-7ea6efc972a8	t
0930b3c3-b0ea-46db-b765-c02775579f10	48f9943c-94cb-47bb-ac74-3f643990aeab	t
0930b3c3-b0ea-46db-b765-c02775579f10	ab217cca-28e9-43c0-a419-298aee0c435f	t
0930b3c3-b0ea-46db-b765-c02775579f10	73f21ff8-9f52-4014-9ad2-a5543278ece0	t
0930b3c3-b0ea-46db-b765-c02775579f10	9768a898-6a62-4e46-81ac-bf179fc691ec	f
0930b3c3-b0ea-46db-b765-c02775579f10	4784e596-acbe-42bb-8887-09a7bc21eadd	f
0930b3c3-b0ea-46db-b765-c02775579f10	0b573c62-d03f-4bdd-ad9d-05950d11ebdf	f
0930b3c3-b0ea-46db-b765-c02775579f10	1b5f828d-701d-49ea-a9da-b1c83606240d	f
fd0a3e4a-2997-4975-9752-217d3dede715	86c6d9cb-e044-4938-a92d-7ea6efc972a8	t
fd0a3e4a-2997-4975-9752-217d3dede715	48f9943c-94cb-47bb-ac74-3f643990aeab	t
fd0a3e4a-2997-4975-9752-217d3dede715	ab217cca-28e9-43c0-a419-298aee0c435f	t
fd0a3e4a-2997-4975-9752-217d3dede715	73f21ff8-9f52-4014-9ad2-a5543278ece0	t
fd0a3e4a-2997-4975-9752-217d3dede715	9768a898-6a62-4e46-81ac-bf179fc691ec	f
fd0a3e4a-2997-4975-9752-217d3dede715	4784e596-acbe-42bb-8887-09a7bc21eadd	f
fd0a3e4a-2997-4975-9752-217d3dede715	0b573c62-d03f-4bdd-ad9d-05950d11ebdf	f
fd0a3e4a-2997-4975-9752-217d3dede715	1b5f828d-701d-49ea-a9da-b1c83606240d	f
2a4e93f9-1f46-49a5-a5d2-276b22df6fc9	86c6d9cb-e044-4938-a92d-7ea6efc972a8	t
2a4e93f9-1f46-49a5-a5d2-276b22df6fc9	48f9943c-94cb-47bb-ac74-3f643990aeab	t
2a4e93f9-1f46-49a5-a5d2-276b22df6fc9	ab217cca-28e9-43c0-a419-298aee0c435f	t
2a4e93f9-1f46-49a5-a5d2-276b22df6fc9	73f21ff8-9f52-4014-9ad2-a5543278ece0	t
2a4e93f9-1f46-49a5-a5d2-276b22df6fc9	9768a898-6a62-4e46-81ac-bf179fc691ec	f
2a4e93f9-1f46-49a5-a5d2-276b22df6fc9	4784e596-acbe-42bb-8887-09a7bc21eadd	f
2a4e93f9-1f46-49a5-a5d2-276b22df6fc9	0b573c62-d03f-4bdd-ad9d-05950d11ebdf	f
2a4e93f9-1f46-49a5-a5d2-276b22df6fc9	1b5f828d-701d-49ea-a9da-b1c83606240d	f
00c6faa8-d259-4fdd-bfc8-d8649b362f82	86c6d9cb-e044-4938-a92d-7ea6efc972a8	t
00c6faa8-d259-4fdd-bfc8-d8649b362f82	48f9943c-94cb-47bb-ac74-3f643990aeab	t
00c6faa8-d259-4fdd-bfc8-d8649b362f82	ab217cca-28e9-43c0-a419-298aee0c435f	t
00c6faa8-d259-4fdd-bfc8-d8649b362f82	73f21ff8-9f52-4014-9ad2-a5543278ece0	t
00c6faa8-d259-4fdd-bfc8-d8649b362f82	9768a898-6a62-4e46-81ac-bf179fc691ec	f
00c6faa8-d259-4fdd-bfc8-d8649b362f82	4784e596-acbe-42bb-8887-09a7bc21eadd	f
00c6faa8-d259-4fdd-bfc8-d8649b362f82	0b573c62-d03f-4bdd-ad9d-05950d11ebdf	f
00c6faa8-d259-4fdd-bfc8-d8649b362f82	1b5f828d-701d-49ea-a9da-b1c83606240d	f
8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	86c6d9cb-e044-4938-a92d-7ea6efc972a8	t
8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	48f9943c-94cb-47bb-ac74-3f643990aeab	t
8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	ab217cca-28e9-43c0-a419-298aee0c435f	t
8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	73f21ff8-9f52-4014-9ad2-a5543278ece0	t
8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	9768a898-6a62-4e46-81ac-bf179fc691ec	f
8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	4784e596-acbe-42bb-8887-09a7bc21eadd	f
8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	0b573c62-d03f-4bdd-ad9d-05950d11ebdf	f
8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	1b5f828d-701d-49ea-a9da-b1c83606240d	f
28bff4e7-9868-486d-93ae-374994b60819	86c6d9cb-e044-4938-a92d-7ea6efc972a8	t
28bff4e7-9868-486d-93ae-374994b60819	48f9943c-94cb-47bb-ac74-3f643990aeab	t
28bff4e7-9868-486d-93ae-374994b60819	ab217cca-28e9-43c0-a419-298aee0c435f	t
28bff4e7-9868-486d-93ae-374994b60819	73f21ff8-9f52-4014-9ad2-a5543278ece0	t
28bff4e7-9868-486d-93ae-374994b60819	9768a898-6a62-4e46-81ac-bf179fc691ec	f
28bff4e7-9868-486d-93ae-374994b60819	4784e596-acbe-42bb-8887-09a7bc21eadd	f
28bff4e7-9868-486d-93ae-374994b60819	0b573c62-d03f-4bdd-ad9d-05950d11ebdf	f
28bff4e7-9868-486d-93ae-374994b60819	1b5f828d-701d-49ea-a9da-b1c83606240d	f
6485fa7b-ba42-4456-8e61-d8d82fb0141c	86c6d9cb-e044-4938-a92d-7ea6efc972a8	t
6485fa7b-ba42-4456-8e61-d8d82fb0141c	48f9943c-94cb-47bb-ac74-3f643990aeab	t
6485fa7b-ba42-4456-8e61-d8d82fb0141c	ab217cca-28e9-43c0-a419-298aee0c435f	t
6485fa7b-ba42-4456-8e61-d8d82fb0141c	73f21ff8-9f52-4014-9ad2-a5543278ece0	t
6485fa7b-ba42-4456-8e61-d8d82fb0141c	9768a898-6a62-4e46-81ac-bf179fc691ec	f
6485fa7b-ba42-4456-8e61-d8d82fb0141c	4784e596-acbe-42bb-8887-09a7bc21eadd	f
6485fa7b-ba42-4456-8e61-d8d82fb0141c	0b573c62-d03f-4bdd-ad9d-05950d11ebdf	f
6485fa7b-ba42-4456-8e61-d8d82fb0141c	1b5f828d-701d-49ea-a9da-b1c83606240d	f
503fd407-6e27-47a9-8001-97e53892cc0a	72fbe764-b192-463e-992b-ee50971b9a5a	t
503fd407-6e27-47a9-8001-97e53892cc0a	a92ad0e3-298b-4c29-b026-bfbc23e550e4	t
503fd407-6e27-47a9-8001-97e53892cc0a	7d35c604-2bf0-41fb-9e0a-84721050d48f	t
503fd407-6e27-47a9-8001-97e53892cc0a	3d7c7e6d-e8f2-4d0e-ba63-1ee879299964	t
503fd407-6e27-47a9-8001-97e53892cc0a	92d99ca8-0faa-4df6-aecb-ec264afc1a08	f
503fd407-6e27-47a9-8001-97e53892cc0a	d5909064-37a4-4cd8-995f-da6675c81629	f
503fd407-6e27-47a9-8001-97e53892cc0a	3750c622-b41b-40fb-9129-9fe4a5928591	f
503fd407-6e27-47a9-8001-97e53892cc0a	ab36e86d-028d-4c3c-b626-a58c855ab0f0	f
19324db5-81e8-4b25-8f67-a085e8fd6222	72fbe764-b192-463e-992b-ee50971b9a5a	t
19324db5-81e8-4b25-8f67-a085e8fd6222	a92ad0e3-298b-4c29-b026-bfbc23e550e4	t
19324db5-81e8-4b25-8f67-a085e8fd6222	7d35c604-2bf0-41fb-9e0a-84721050d48f	t
19324db5-81e8-4b25-8f67-a085e8fd6222	3d7c7e6d-e8f2-4d0e-ba63-1ee879299964	t
19324db5-81e8-4b25-8f67-a085e8fd6222	92d99ca8-0faa-4df6-aecb-ec264afc1a08	f
19324db5-81e8-4b25-8f67-a085e8fd6222	d5909064-37a4-4cd8-995f-da6675c81629	f
19324db5-81e8-4b25-8f67-a085e8fd6222	3750c622-b41b-40fb-9129-9fe4a5928591	f
19324db5-81e8-4b25-8f67-a085e8fd6222	ab36e86d-028d-4c3c-b626-a58c855ab0f0	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.client_scope_role_mapping (scope_id, role_id) FROM stdin;
d5909064-37a4-4cd8-995f-da6675c81629	b3a680e4-0e86-4b05-ab5b-649314ab6b61
ebf588b9-a67b-49be-af34-c57c6839d2bf	adbfcc74-f8d0-4c01-8fc6-41fe03551b3e
9768a898-6a62-4e46-81ac-bf179fc691ec	cacd76c8-c52f-4300-97f1-938f0184bf36
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
2db4c5ba-78de-4dc9-9578-077cfa8cad89	Trusted Hosts	master	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
90d71420-af8d-4cf0-8a3b-1746bd1ba08c	Consent Required	master	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
363a1354-32c6-438d-9f85-0d9cffa9ce8e	Full Scope Disabled	master	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
b7806d4d-503f-4d77-9e98-a5fb8afc7a5a	Max Clients Limit	master	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
29fb0493-3afb-48e0-8af2-d512733859cd	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
7877db19-a102-4032-88e5-f2459445604a	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
685e864a-d7d2-48ba-9139-d7b92ab4be87	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
9056949a-d5f7-4be8-8bf9-3199f8d588bf	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
07cb2acf-ac09-4b48-92b7-ef3afe0911e2	rsa-generated	master	rsa-generated	org.keycloak.keys.KeyProvider	master	\N
c21056d7-5b86-46ca-af24-30bc41caa5bc	rsa-enc-generated	master	rsa-enc-generated	org.keycloak.keys.KeyProvider	master	\N
4aacba02-b391-41b5-8589-ba1d4cc548e2	hmac-generated	master	hmac-generated	org.keycloak.keys.KeyProvider	master	\N
91ba2216-bcf1-417e-9282-ad4d2fb519cc	aes-generated	master	aes-generated	org.keycloak.keys.KeyProvider	master	\N
1fb8a8a0-0746-46bd-88fe-5f2c5c4ebeef	rsa-generated	idp1	rsa-generated	org.keycloak.keys.KeyProvider	idp1	\N
9d0d7371-d393-4118-a24c-7822dd283391	rsa-enc-generated	idp1	rsa-enc-generated	org.keycloak.keys.KeyProvider	idp1	\N
23d8d36b-23fc-482c-9d9f-ee12f0225be8	hmac-generated	idp1	hmac-generated	org.keycloak.keys.KeyProvider	idp1	\N
d959de75-beb1-43a5-8a8e-1f10ea984790	aes-generated	idp1	aes-generated	org.keycloak.keys.KeyProvider	idp1	\N
81832b12-2cd4-4adb-baf8-808073b66873	Trusted Hosts	idp1	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	idp1	anonymous
2ffad205-8d31-4a57-b35f-7ab03ac95f05	Consent Required	idp1	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	idp1	anonymous
31cc647b-cd15-4c11-a870-0207b8bbaa1c	Full Scope Disabled	idp1	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	idp1	anonymous
c4e41382-5731-41ff-bde4-95af447bedbd	Max Clients Limit	idp1	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	idp1	anonymous
7c48ddb2-08b9-495d-a785-3c8393e55a47	Allowed Protocol Mapper Types	idp1	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	idp1	anonymous
c348ef45-2e2c-4caf-b537-63669b6758ac	Allowed Client Scopes	idp1	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	idp1	anonymous
36f20034-25e3-40a2-a09f-3676784db39e	Allowed Protocol Mapper Types	idp1	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	idp1	authenticated
2265e93d-8277-42bf-8a94-4d5d534d0729	Allowed Client Scopes	idp1	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	idp1	authenticated
f87cfd8f-5784-47ee-ad96-d4667b99824e	rsa-generated	idp2	rsa-generated	org.keycloak.keys.KeyProvider	idp2	\N
89e3a45a-55eb-4f22-8943-225d6c7b02ca	rsa-enc-generated	idp2	rsa-enc-generated	org.keycloak.keys.KeyProvider	idp2	\N
c3dc6bda-830f-4b7d-85b5-7fa6e21b7a1b	hmac-generated	idp2	hmac-generated	org.keycloak.keys.KeyProvider	idp2	\N
e0292ba4-d2cd-48a5-9cae-5d68fc36a88a	aes-generated	idp2	aes-generated	org.keycloak.keys.KeyProvider	idp2	\N
f491d0e3-c1c6-4f1a-9d79-459430fafe0f	Trusted Hosts	idp2	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	idp2	anonymous
b490288e-054a-4b51-becb-c19d752a7b4f	Consent Required	idp2	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	idp2	anonymous
1d7dc437-3096-4b80-b4a6-e696679fd065	Full Scope Disabled	idp2	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	idp2	anonymous
4263a1ca-7c06-45c7-94b1-0f54c3d412c2	Max Clients Limit	idp2	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	idp2	anonymous
71023497-5ac3-4053-8700-1e8c107477c8	Allowed Protocol Mapper Types	idp2	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	idp2	anonymous
4b53a2b2-ef32-4a04-981e-f0a08cd8cbef	Allowed Client Scopes	idp2	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	idp2	anonymous
fe374f13-5910-4f55-b11d-1c0c9eae52bf	Allowed Protocol Mapper Types	idp2	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	idp2	authenticated
40a4a0d0-1612-40dc-8f25-01193c1cadc1	Allowed Client Scopes	idp2	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	idp2	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.component_config (id, component_id, name, value) FROM stdin;
dab4bdfa-5cbb-4937-ab84-557d16b70406	29fb0493-3afb-48e0-8af2-d512733859cd	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
f40cb7b2-0176-4a54-b792-e187ef343797	29fb0493-3afb-48e0-8af2-d512733859cd	allowed-protocol-mapper-types	saml-user-property-mapper
75aa8e53-3f76-45a7-97d7-f72b42080330	29fb0493-3afb-48e0-8af2-d512733859cd	allowed-protocol-mapper-types	oidc-full-name-mapper
b7d4e638-cc99-481e-b12c-4fcd629568ea	29fb0493-3afb-48e0-8af2-d512733859cd	allowed-protocol-mapper-types	saml-role-list-mapper
234a489c-b8a4-49e8-9ef7-65eacd6d44da	29fb0493-3afb-48e0-8af2-d512733859cd	allowed-protocol-mapper-types	saml-user-attribute-mapper
b8bec7b7-2d46-4fd5-91ab-add302d272c8	29fb0493-3afb-48e0-8af2-d512733859cd	allowed-protocol-mapper-types	oidc-address-mapper
2b0709f6-009b-4ad2-9fa8-8a08e584e9b0	29fb0493-3afb-48e0-8af2-d512733859cd	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
462fb14c-c0be-4c86-a467-329ed3fbd67a	29fb0493-3afb-48e0-8af2-d512733859cd	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
7c6df3c1-619d-4fa7-a5b7-13c9e3b31102	7877db19-a102-4032-88e5-f2459445604a	allow-default-scopes	true
b2482a3b-bcac-4f69-a8db-1d758f7e2b84	2db4c5ba-78de-4dc9-9578-077cfa8cad89	host-sending-registration-request-must-match	true
62712f8d-10e1-4bbd-9256-f6cc18bb59a2	2db4c5ba-78de-4dc9-9578-077cfa8cad89	client-uris-must-match	true
a502b75f-8e10-4191-a630-6bf71b4f3d45	b7806d4d-503f-4d77-9e98-a5fb8afc7a5a	max-clients	200
2f6f4123-a8fa-495d-908b-666259c7a57e	685e864a-d7d2-48ba-9139-d7b92ab4be87	allowed-protocol-mapper-types	oidc-address-mapper
0df1571c-5d8b-4e19-92d8-440b9fb4f024	685e864a-d7d2-48ba-9139-d7b92ab4be87	allowed-protocol-mapper-types	saml-user-property-mapper
9da084b9-06d2-4c2d-b6cf-c01681d0af32	685e864a-d7d2-48ba-9139-d7b92ab4be87	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
396af4c0-c669-488b-b57f-e24100c0488f	685e864a-d7d2-48ba-9139-d7b92ab4be87	allowed-protocol-mapper-types	saml-role-list-mapper
46a02a17-3bb8-4f4f-b164-b8fe5670e962	685e864a-d7d2-48ba-9139-d7b92ab4be87	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
53cc5277-6a84-470e-89ba-3f9408447c0c	685e864a-d7d2-48ba-9139-d7b92ab4be87	allowed-protocol-mapper-types	saml-user-attribute-mapper
c0078469-3ac6-43a1-b8c4-a05cc3bcc939	685e864a-d7d2-48ba-9139-d7b92ab4be87	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
b257d407-61a9-4607-a92e-2171e5f6f7fe	685e864a-d7d2-48ba-9139-d7b92ab4be87	allowed-protocol-mapper-types	oidc-full-name-mapper
b759da8e-2957-4c68-8797-a65a544d47bd	9056949a-d5f7-4be8-8bf9-3199f8d588bf	allow-default-scopes	true
8ed22870-0288-4d9b-9248-9eb23141a3e1	4aacba02-b391-41b5-8589-ba1d4cc548e2	secret	YI5KSdIhucX8ahyzscjXWHnKfRfRRHapsB24P_Av7CftxX6nWB00urt39K11iA5acvWayJk9PIP4jlIhTuaQJw
ae624968-657e-4c88-a241-5f18f981f2c5	4aacba02-b391-41b5-8589-ba1d4cc548e2	kid	4b381f5b-d74e-45b1-aeb2-5960f246c5ad
1b0d1535-db52-4e73-b4c9-5ac236819a72	4aacba02-b391-41b5-8589-ba1d4cc548e2	priority	100
b2d7d39b-f8e0-4eee-a6b7-5d86ec02c54b	4aacba02-b391-41b5-8589-ba1d4cc548e2	algorithm	HS256
8a82a77e-5cbd-4480-98bd-4204319ce333	c21056d7-5b86-46ca-af24-30bc41caa5bc	privateKey	MIIEogIBAAKCAQEAlwxiu5ZA9oPU1sJWV3trEZppCISYyLwbpsVzX1sv2QpcjNtn1nBKdXKMJoPSEaOkXT4qks/+DGclwnItshtgzkmjzFfGaPZfw35qz1fWQggTATeTOZrGqg5N8bvwAy8qqK0vAbj4/R9EMXcHVJZ0iH2g3U3daIk2ORTzgbER9uNz5+52uFOdW5wDVmqWr0B6CW1FlOmfimzTXCdlEbUEzJcirmUH6+vReujB6roZGmMNxtfdQLvAmznDxCpDd5H1FzNWtRCHu29rGf/s2MEXmlPoiQMXTpl63Zr18DkZN5qCpoUjgLPsCXAzMKDdoqf0ptWSX2i3OovpmyMLFFuSuQIDAQABAoIBAQCO4MBkAPTiOkGSA7H4fl4BALZpwENlXcoqLou7n13bR9nTw5atWPqVrgy0QezrkodfS/apeOUuhkNJcweWeh9QAohWOpELqEFdgq82AjhBrbGMbS1uR+Gz6mQATW3zFSKc+3SDhJzBklnHEHh2ovsIQQ1xSL4uq9wGkrLj8sKzbWzFjmiqMO0wArXvIovI3Rk/QND9z7n+BMhXdFeoN/bGkzSWRsFQvQkKLXWSScTJY5c67Un+0ry4ZbkDmLif9S4TuEIyOKrPy47A+paztaY7uFpvoStjE36nHCZq7U/kHe8U7/1PLVsQBpXWF+lCC9wKSDTGpDDOMfwgnvt0WAOhAoGBAN66fQBBGrS5c1WIoAuKA+c95j9GolTIKjTO4iLCQK7y5lziL5DeNlct+Am7ji/tt68avrAQ9UrvmuKNRfYBIzXmHjaVRAe4V/XoeqJxBeS6x9Nxs++XTpWKns26XiQCLWAmh4Q89dNaC5mVyBcITOuBGsJEvLszAy0tjzuJmbOrAoGBAK2cuukIrO+ATADiEtkyWTUV4lYpJHjrj5nowyo1OZm/FoMXQQeOsLaP+kSfoWzxspotWgHCeIt+nWMkQIXrUyth804Ab3LLqb/eyqstG0LKirPU5BJB/AfNtD8ssFQ/tat1ICLRyeGXTXNDYBiXbWD/yUlrRuUgEZjFV7NQqi8rAoGBAJqN5BHaG5MPITZYYV7Afebn8C82b4zPfWI5sXgXPdVo3mvT1Nf9Ks4iKv1t9cPSfGT49RuuGNjQHbVZ/RMxROKw9YRA3f1RcVBF61tvfHx1FBbozsjSQQjKMVpnGc546E3RTrZ3qsnnsSb5Zeh9rQq7AvuNwT1Rr8GY3MyetlaTAoGAdToLCycMfnuG1mHQkE/q5Gludvc45V1JjYcZoPpndmUM8l9VTaEPuXXma0fOXB2nl2tgBygk9Sv9YeAsoUCQ3A47l0O7/St/50qsVoESkzroBR2PErTzVOGU/8NRHNIX/ToNBPXa9zSO23F3BaPZ+1E7vRNuv2+z8g/uc+nXwBkCfzYnrOMoVqLYC3Oj17PiJJs+4moUHW4jPXMMAtGDJof7hqVBVmBx8WowjuuXIhjV2V4SOzR49VGv10NoVS+3chuMo/aA6ucundqGlo9uUXTkjRkxg1Qe/xYctVCFNbZ8R0euJZ0YewY7M95w50dK+1y2btqdnfRmnzs7wA6NtxU=
7ce3b45d-2d12-4dae-aa96-79f4c3906f9a	c21056d7-5b86-46ca-af24-30bc41caa5bc	priority	100
52c57b96-62f2-4097-abac-0b8a18d8e177	c21056d7-5b86-46ca-af24-30bc41caa5bc	keyUse	ENC
724ca9c1-8fce-489a-8acc-e1aa62dc5a81	c21056d7-5b86-46ca-af24-30bc41caa5bc	certificate	MIICmzCCAYMCBgF/z5eoaDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwMzI4MDgxMzE3WhcNMzIwMzI4MDgxNDU3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCXDGK7lkD2g9TWwlZXe2sRmmkIhJjIvBumxXNfWy/ZClyM22fWcEp1cowmg9IRo6RdPiqSz/4MZyXCci2yG2DOSaPMV8Zo9l/DfmrPV9ZCCBMBN5M5msaqDk3xu/ADLyqorS8BuPj9H0QxdwdUlnSIfaDdTd1oiTY5FPOBsRH243Pn7na4U51bnANWapavQHoJbUWU6Z+KbNNcJ2URtQTMlyKuZQfr69F66MHquhkaYw3G191Au8CbOcPEKkN3kfUXM1a1EIe7b2sZ/+zYwReaU+iJAxdOmXrdmvXwORk3moKmhSOAs+wJcDMwoN2ip/Sm1ZJfaLc6i+mbIwsUW5K5AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAEIlfz1118Vy2bBaMBa9wPjrC21l5Y7JILCNAdFNdPbogjS+d8mfrrsEH9M9vDnhkOyD2Z6tN+fz2esUNgqj3+2y8xLKSxSoihHuJuCk8m0MzabLuGxr/O33DNxMAQzok4jx4DBLJjxDz5wXbEAaszuxpY+3y0c63t3tgr+5DVE3HCTZUe7YL+GXy3v4mZSBM+cBeG1D0U59Oif9utu6MggQar6F7NP1FrSNR8Zi9XLv5PJ7Li4S7RFjMAt3vhL9ppeAiGKekP/PZzh6Yp8wGRExwwu0bpjwrTrxqhLFDJ19OnwLnxtfkxGyoN709X13Quyl05wQhE/c0Fxpk0McR/w=
0bdb3574-560f-4df2-99e2-1bfadc709fcc	c21056d7-5b86-46ca-af24-30bc41caa5bc	algorithm	RSA-OAEP
99d04b4c-e7eb-4d2c-b206-d780062fb41d	91ba2216-bcf1-417e-9282-ad4d2fb519cc	kid	d133ad12-8608-4fa0-8f66-3dccfcc31f4a
4cbe9769-e6e3-407d-9469-f8d0afe370b7	91ba2216-bcf1-417e-9282-ad4d2fb519cc	priority	100
79684d35-750d-4750-8ba2-3ffff16f17af	91ba2216-bcf1-417e-9282-ad4d2fb519cc	secret	xVuSS4qFFyMSbGwLkcyK0A
0a2647b2-a71a-4352-abf6-65043d4c457e	07cb2acf-ac09-4b48-92b7-ef3afe0911e2	priority	100
544c536b-cf00-495c-9c49-86703e25e671	07cb2acf-ac09-4b48-92b7-ef3afe0911e2	keyUse	SIG
1c3b711f-2a48-4a5e-bb1b-3a46afb71047	23d8d36b-23fc-482c-9d9f-ee12f0225be8	priority	100
aa2e5ade-c058-4892-ad7a-945c4b7dab27	23d8d36b-23fc-482c-9d9f-ee12f0225be8	kid	80e71ae3-d4fe-41dd-aa34-5ee776793cb1
755d1210-e144-4e9f-962f-8874b1e97bfb	c3dc6bda-830f-4b7d-85b5-7fa6e21b7a1b	kid	6360022e-79dd-4f11-988a-650b84cadaeb
97d80baa-1e66-4130-b9e2-b52ec4d6f90b	c3dc6bda-830f-4b7d-85b5-7fa6e21b7a1b	priority	100
00ad208a-6e17-4a10-9ce9-27ec9e0d8858	07cb2acf-ac09-4b48-92b7-ef3afe0911e2	privateKey	MIIEpAIBAAKCAQEAw3d8VZx2R2DOfft6hM0O+7aY7DsSis2T0YfHxmCRzjIOEW5P2eExK3VOGJY7NjnbFQmtAkVNSatleGzH9zQorYB4j54Un8HqXUFaINzSZhEcIIK1bJDZCfuCvHSHW8VnXAqsIr7DzQyrjs8Z1iRxM0Vng7HLU8SZ/dZafl+xVuci7e68WXigWaNJ+ymaYGfCGjxy4Cl97UPpoxqquHmtctpZz+oU8jZ3JaXcfxUqPQeu0DQgBZUjTHDP1mjx+VDs6Aw6MiI6OpJTCB43QjYqNKc3MngcZA+OVeaEP9FH5EtGdhZMkGvisU7P49l63pTKuR44BKcJh3CZBhKKdOuBoQIDAQABAoIBADHl3K2WJXOPOOdcPSiNmFeVg3A6nD8mv6drfAoeONpkWMcGXAgIvp6TcX5BS5hKKK00LSA5RMObp2mYi2uFuySfeSdgeW9W91cbCcD93hAEKiP6egne6CjuNa+aJ7u7pukOKGcuP5mmtFzebYAHCYbHHue1iWw28gCkqbE9CG5gXIqC+9G3KiYQYLvApxbBCpRLppl8H54p+GvJKIZnjUKSWJwYxFzocLLjh1eSORD1rrpiKgOCxuYYKOJZulodqCt3a14vYEWM+zvic4wt+EFe6K7DP+6mnCt+2JJZD3utMwYVqcmoYdCLmjQqqP1Bm7eXnr6h6DqcEzR8F+MshmkCgYEA4Hf3V9D846n/nqhMlnKviZeoc2pf07wqO/oyXA6Z2yaxpqS1NaqMjBL76oUUt477VJ84SpwlrPMfNWmdaGLRUisGxKGq0QThLSEfo9GL+wzusLjjcnV1z8C85dooWIgOQBrIb/zrBahagJNJIFK5AJThxLUtS/wizoCTS6Qlx4cCgYEA3uyX9x07n9aufaFfCaFFAgut3/tsTn+qk/TXeHG+9U5mKiYycozJBIPNYXrJ7toDqmcT0iRpdSwxVPo0ltd4UP8xXN+I+HOViBDVownQKCBbrD6zQcIvsKgHjkgCssDx2fYt0k3BQv4JqOUxX2nhGYov7akDE5/dasjWAE2o55cCgYEAoFZxEoRQr9q1ocH7+xdutezjwZWBX8Avtunv4Pv5AKayDSPn4K6zeDbzRUDMXJXAh2C4F+tTqid76m5HptG3TWc4jWohlu5SXicj76N1xt0k/o0CwraOcdjt1Y2wdhSxgS7gb8YMptzr0J3khTcxuO2gGx+DfJxczH7hOA3Hgq8CgYBSOXhP+KNecIQJ6LSyS561g3NN02H+jk5vpna3gVULDDDYySAAandWx/rAQtcq15VUjBKehzmys2s6ydMN9En3rjkZ5YWTBqcX+gWizmLN+il2HeZmkeafRUsMKvl7z3kliQ0brfxj5mnPt0H/zIDvt623/ogY+/VihtOQZxSu3wKBgQCV7K3GQ/D4DFEE/g7E7a9wFtk+puepPqM7Z1gyFpcCEihlGf5uaSwB01ofsyLVeOPhF91+fQaLiZqnooMcw2uOzJpD2sJXsanwPL1WuLdaBVy33Hvn7osjOhjxDTQY8YpqOtjWyYOsotVQxytmXpl9Ehl4YiF52SVVtfZqEH1iZg==
ba3e4d2d-6a8f-4f89-83ef-747d72334d38	07cb2acf-ac09-4b48-92b7-ef3afe0911e2	certificate	MIICmzCCAYMCBgF/z5ejxTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwMzI4MDgxMzE1WhcNMzIwMzI4MDgxNDU1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDDd3xVnHZHYM59+3qEzQ77tpjsOxKKzZPRh8fGYJHOMg4Rbk/Z4TErdU4Yljs2OdsVCa0CRU1Jq2V4bMf3NCitgHiPnhSfwepdQVog3NJmERwggrVskNkJ+4K8dIdbxWdcCqwivsPNDKuOzxnWJHEzRWeDsctTxJn91lp+X7FW5yLt7rxZeKBZo0n7KZpgZ8IaPHLgKX3tQ+mjGqq4ea1y2lnP6hTyNnclpdx/FSo9B67QNCAFlSNMcM/WaPH5UOzoDDoyIjo6klMIHjdCNio0pzcyeBxkD45V5oQ/0UfkS0Z2FkyQa+KxTs/j2XrelMq5HjgEpwmHcJkGEop064GhAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAD1x0msv2TomqeMT9dA177d7jq8mTH4oXAD5pfSneRIN/MKRb2V3nADMU375SBSWAOZ/CiU7GUeN8bFxmKk/hQK7Yyy6APob4qZ4nXDSSkSSotbCFQBx3EpY24uyHHlZeDKNXIO9FtDtK8gSw6Gd7+7PXE3KACaDeJ5K7un4TsAOF1VG6RFYyV3rSEg8Obi4QeiAXXhkLkG/ehlBroB3KZhibkGjP7hH+0TtLjguQ+a4/SdSOZjFRj2hWDGGbRfn7OLGNk7Q0vGv9wVcKgaGz1AK7SUNZrUoQnrQ1PcjEpP0K+PMWooJ9y0RLtmqCeL+23KYWPKzFLjl8zczokgVKj4=
fcb3084e-f942-40e6-af36-a21c906c9225	23d8d36b-23fc-482c-9d9f-ee12f0225be8	algorithm	HS256
02bae92c-b189-4583-aa7c-5f1b6f49e010	23d8d36b-23fc-482c-9d9f-ee12f0225be8	secret	2GZZ5T6JKjg8UX1aq-P3kq6oMb6i3H2tZHPJI6QKPi6qJbQpnGuB1YfOLy4Y0p9AYNTP2EuVlHN8haZhv4tspg
84d54552-9c18-494c-8c75-a09502c10ab2	d959de75-beb1-43a5-8a8e-1f10ea984790	secret	E9bzvUB0vLFTrDOQ-S-1Xw
626b75ec-6dae-43f1-83b7-1aefd50e0686	d959de75-beb1-43a5-8a8e-1f10ea984790	kid	f7683c05-5a05-49ce-9e6b-623d524d7afe
3f58e80b-3983-4703-a221-630aab468ea7	d959de75-beb1-43a5-8a8e-1f10ea984790	priority	100
78c5777e-115d-4b15-8668-b96fafdc88d1	1fb8a8a0-0746-46bd-88fe-5f2c5c4ebeef	priority	100
a129209e-d69a-457f-bbf5-65dad21b82d9	1fb8a8a0-0746-46bd-88fe-5f2c5c4ebeef	keyUse	SIG
997ef68d-decb-45bf-9717-62f7e419d542	1fb8a8a0-0746-46bd-88fe-5f2c5c4ebeef	privateKey	MIIEogIBAAKCAQEA1qUpNlO1o8C3w8TpUWkgV386paHZkOE9X6avCdFO+Pas/9tDgnCJMiMHTByK6rknl+vJ4hvJ+NqAjpuVlnMShElitwuQtpEmKzbYPjFwz5wP/gOssSIs5UvgFJ542ZPeTZM/2W/ChoTwYXYfYW2OfL1pScmZyl4kBPpozRt+T9BKg/vi8TCnzUZJsFhHEUuibf0udVCrXPCYGWcvl10atEjTv6166GdUPpHOgK63Ijq8+TmqOr4idHkrx7H/57iJ10nLP8qEvjGPutuWvXyHeZ481hkIShZIqzPnuFTWdPo1dWfjp6+5ko4wvG5UrMA0BiheuJFi4maaKw6LPDHrRwIDAQABAoIBAEQ3IS3e1K9CJCTXg78XxeuIx76z/U0KCFNJyf84wfxliP2XVZEy6qdAcqVBvPRz+51QlkyBwGKSLqEj2RqDX7MjD3hU+JzM7HB3canyVIPmeT6lNFDnJ5WH06M56fZcBB5rWbNkzVGrFiojPD3eb5Y9LCUDKRkjahca7guhXTdHybFUx8BmUkI6RjHgKda0dgHnOZQwi/M6YCnxDAC4UPPs3MWU+uKGQThI6c+NVv9LUojbRvLMUeLFEkkHLAXDbchEhZTH1oPIxlVz9vb0quCw33H4XDS+KL7nmDT9mjWiZ6nTA916YW8QehUKRo1nx4yB9U/a++cSln2fY6s5wMECgYEA/Zn+dX3hKt/XEnQ2RvBBMWTC6K6sPZrzWHSo9j0kUPvxIb0H68rVB2L2qwdp4NyFdHmDboXQL8h3ePYDJna4VEsiZWCDlhtvNZgKxnhOLZl3EBOUBEmZniMYJIDNK06jqE2+1rOtGK7zEX4hKE9XFDl7rkLfhN1DJOFmJwRD5B8CgYEA2KzZFOP4YoT0AQ292xKoDfC6gAsNo6UZ3q/jd4YfM6qzn+NCF+XBc8PVUtzWbmE2OCyNYT40vI2Jk5LhxV7qPPmdd/LgVZdQBLWw8yQloFxlHtxIwyPn057E5lAwNu8eY7TT/+siDto9vpEwRQARTfYmpO7VK6AsSd9wbSJg09kCgYA3iVHASSDWUs62q9x3DIY6WuaULixqEVTZOjMGOb2KPqI/0TW63WBpjbKXIbh+FczkBPhTa9p7nFsNklJ+SeF0FEAkE069wKRKCFHTxOTZ95GrY542kieiCe1vkQVdRotwgBYazp5JmYaBfi2ktjtLoosDToHEhu/9U58bTEPR4QKBgHLqST+hIKzvopGkfhrgLC0ojWE3e4ZdG/lVA6jygz3dvOKBnx4Zhp4lMNB/u2JTQHROfLUkTsfpsRuJfSA2lLi+Elv5fi0m0ROOYUiy1RnVpvPVFOoZ8uvzeq5DvS6FZ3KuBvnl9Ow3pyOY0SbnQEY+1IQI/xniG1sam//licERAoGAeq3U7yUbZaeK1bbMbrIb1t9I75XS+/At3j5cMtYLS8g4QOAyIBcjZu8clZW+SqITExzC8vtjkWQzH2eOyxx9j6s9R9R8/ixWnSuorkkssbWGvQgNX9kZ4oO2Wm3j5h0VWnNHjvNyquOWWg2avfqUPknxykfd0/ac38hI0j4z5CE=
7bd53950-91d9-4d88-b64f-8a25e4ed0439	1fb8a8a0-0746-46bd-88fe-5f2c5c4ebeef	certificate	MIIClzCCAX8CBgF/0UZ8zTANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDARpZHAxMB4XDTIyMDMyODE2MDM1MVoXDTMyMDMyODE2MDUzMVowDzENMAsGA1UEAwwEaWRwMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANalKTZTtaPAt8PE6VFpIFd/OqWh2ZDhPV+mrwnRTvj2rP/bQ4JwiTIjB0wciuq5J5fryeIbyfjagI6blZZzEoRJYrcLkLaRJis22D4xcM+cD/4DrLEiLOVL4BSeeNmT3k2TP9lvwoaE8GF2H2Ftjny9aUnJmcpeJAT6aM0bfk/QSoP74vEwp81GSbBYRxFLom39LnVQq1zwmBlnL5ddGrRI07+teuhnVD6RzoCutyI6vPk5qjq+InR5K8ex/+e4iddJyz/KhL4xj7rblr18h3mePNYZCEoWSKsz57hU1nT6NXVn46evuZKOMLxuVKzANAYoXriRYuJmmisOizwx60cCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAhqjo8f/7vVYJNFU3OWvPs8o//E8wPTNDqC7la1EzpBMzI3pZ3mtp3Wny7Zo09uaq6diEfeGyNka7tGXl3kljxDCisp8R6I4iP7tsZvaOvNpnEBylrGJ/NUGexinb1t530/CFK1BaF8nNbyU30NO9dzKGhOKnS8s6oc83OBu8LcNM7gmrm8r7BV1yKL7knraimUPCOo8SvRPKOBph5u1srtEZ42yhWGmOlGh7w1fQn3pPZ9fOzRARVPU13hRMdLpEbRUY+7Ay39yqbhX9QBVJBkxV0CXatOe2OK6TWZpqK23Ss1MvgzjmvQWbAzf6JKH8Wc8Qwsp5t1iip66XwOo97w==
b305fb93-e91b-4e4e-b44c-a4869ba2bffd	9d0d7371-d393-4118-a24c-7822dd283391	algorithm	RSA-OAEP
fb6a2ae2-2979-4666-969a-d45c188ae3da	9d0d7371-d393-4118-a24c-7822dd283391	keyUse	ENC
532888d1-7a60-4204-b2db-fb9ba9ebc2ba	89e3a45a-55eb-4f22-8943-225d6c7b02ca	certificate	MIIClzCCAX8CBgF/0V3QEzANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDARpZHAyMB4XDTIyMDMyODE2MjkyMFoXDTMyMDMyODE2MzEwMFowDzENMAsGA1UEAwwEaWRwMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMP30QLN5LVb+Hp/j/TRL17cdYvqkElvXJRIQjLG8F9ufEwmncoDSJG6yTSony1H9II/vTPncY+zn9ay8RtFRQkZcVeuKXDj9HNn/3si9tCh8FEaJ2bmzjEZnIdWc/wtj9BsFKwf0L+40pNgtcgrjzru1w1kS+5AEifyQV4wl6x0eRv/M7BvbU6lzvFGX+qLPPMHHTnvoDpnLyVmdAqp4G2ClYySLVW5dhh3Bz39rVcuYMOKEz0PweeHnt3QG+EUoO2fGE0It6/MMUTBy2P09r9steqAbQMio6umvB+Hr2PPeWx73tDA8+jT6EZmt3N1mX6M8H+anYcC38F2nHw6vvsCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAkMN0fx7iri6Uf2SRnLDy31XRX1rusg6UkvRoq6DE5m3A/AwvZKahIKld0IdfL44W4N87jk+3EaniZTAkIKmeDfB4JxioJvXnQyktGkqFuzSLGoS3eZKve8cKnlCRZRbh2VWvGZjb/60nre8xQRTeHA+SJWXF73j9LLdk518VAOPcvnjghxgRvPqksm8RTkaSyx3YeqqdUI2sgO5KYQuPIHR7iT5rWRV44vLO/zDjkGU98BX4MmbUQokAU+KCY9OIKE/Jt60LfgERaSIulFNd4YZFrIs4Gwc8bAqrv28P6zFrWRGlPlaHwjix2tW871GOa06FHfdK5JNoCKFVwltsbw==
2df67246-bf34-40a2-be19-d3faa84375af	89e3a45a-55eb-4f22-8943-225d6c7b02ca	algorithm	RSA-OAEP
4aa1ef2c-9ecc-40b9-815e-a9d4968cacc0	c3dc6bda-830f-4b7d-85b5-7fa6e21b7a1b	secret	VvCKffWhAOmX0QfjPv4znU8YiEv1LY0ffuAYDcO98OAPDigXTs7LUICTe6OVexYlHWQo6kn3XvR6pIDS2H-2kQ
99a7fc2a-bfbd-4698-a3a6-2a3b2d2e07df	c3dc6bda-830f-4b7d-85b5-7fa6e21b7a1b	algorithm	HS256
1d062f2e-ab50-4b68-b6be-8612238f60ab	9d0d7371-d393-4118-a24c-7822dd283391	privateKey	MIIEogIBAAKCAQEAwQ30BbI071nGtNIAhTcpk+V8Bi+2FR0pJ2xbUV0COflOxenXFoC/1akLx4VE/kJ/n4Sm9RjF4efkG8pbxDANcwI6MuQ5dr5q8CIUdzPu2+h4kNfsejkq9wdRinwW39d7b6k/GZEIElyszb04E7yxxrB6son7CpuyyRIy3BJdoJCIy+llBrSWdFumjDoimIUvBGV3sjBSAA9xVyitWrL23o9dlH/arGRQW8l9ZE++nv9PcwIEMRUFcckwvuKtMz1mXH599hCCiyRqdN8DRIXOxmLy9rQaFq8qNljVf/BR4SD6wsqjKl9YMakag4PObKz/oOIMUaHXa4/CDnjVPfZu/wIDAQABAoIBABBK+Cw+5P7KSd3a11Zm2Gh19qijAC/5/Q4ps+9C9TwlUUOcv51Tkl0a3jahhbgbrp+s11ZaF+E/6914j5QYJhpttrGy1zKxUV8g0S9aP69piDtZLckG6BxfDr+sR1Xu3qkG1J94wQCjt6XJcWEhDLPjEwfcY0Z663TSx14RYrt5MXUw/yK7k3XA56KW3E6YqXdwb39pQtNt1YzzuV2vO+x2v9WDMKmNNMpdHEzKYG2yh5CRC8mZa3gGWe+w0eF8EHnkPO7w1KNUslMik3Im21d7QBDrP3IGCQTuaYI0ykCEjez5vzNWKn1ApGbZKEY/Wy5IO9mrfeOQsKTr1Qi4xckCgYEA+wQYsyj2NvKPHcMCEDXrEOIydHkoZbPQ2FcZ7ZnwXK9aOf8S3Vf8n/Dufh2wSm+fG3DTfo0TKOZgfA+Hu/A+3gsRrbaSD9VG6FHknVeqVnVaewoagIlwWNQ8Ufw2wH5fHASVttpQn/V3dF6n/0OGPWctggwWtQ90SszL0+J3lr0CgYEAxOM9rgl+9Evz/0Bs104NmEYe4bhHRpEtkN0xTxPQLopbZw3zHTtTK1KnOGVHOa2Mq6ZTKbxjwA8Y0gcHjrUuTMxS5vcpfTWkOVa6l1LO524eYcrYES9PzWeBt73AfUi1Qpm/6FQROiL2d48aJhxZAQEIohD+onkN/MJfBJJaBmsCgYBkj3SRudRBmRTquGgINIGShvvtm2gqrkn5kZNqk6QujXVZDK3zDL/BF5WD4sLwXx1fseiYp03IsdpveQ1IpmuZKtgPPrfvLeM1STGMM0WjU2pHJnoNioH+pC/yLFeG8FmL8O5FjdqE6qLLdOxaoCOUT9R0aAFk0ecl3DvAC9cbBQKBgBv+SzjBdOF7Ixf5qv/5wwkRfzaMouWvopDkQiyCHqlfVpuSaiyP0MVqHQhxrezPdh65qT1X4b7e5qKGCVcK/6g/rNHV9nos9EqKwEDfrzdMetlgo9PdrDUCMHlVa1bkzZDIl3aK7WActHpPSGJ+yVDROs8AJ5QmLgzv/d6CiHY9AoGAQAPCsreaztD4AGvDIN5kwIayacTtlqDwNIIlwJ6e5GwYHtf7QUWnyUEKf6VV5VHQ4AlZnMq+ZfYHsBGR45/2uu7R14d9LBOCr9y3B/p2A5o8XvRVSHJDF12xGAfeWNzgbKdw/HV72miGgHlWZtt5qB4SdDqZrM9K6mR4qIjswt0=
5d4c9f9d-3cd2-416e-afe4-a9a2baeff505	9d0d7371-d393-4118-a24c-7822dd283391	priority	100
77adb141-095f-4993-a90b-bb7f227e78a1	9d0d7371-d393-4118-a24c-7822dd283391	certificate	MIIClzCCAX8CBgF/0UZ9VTANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDARpZHAxMB4XDTIyMDMyODE2MDM1MloXDTMyMDMyODE2MDUzMlowDzENMAsGA1UEAwwEaWRwMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMEN9AWyNO9ZxrTSAIU3KZPlfAYvthUdKSdsW1FdAjn5TsXp1xaAv9WpC8eFRP5Cf5+EpvUYxeHn5BvKW8QwDXMCOjLkOXa+avAiFHcz7tvoeJDX7Ho5KvcHUYp8Ft/Xe2+pPxmRCBJcrM29OBO8scawerKJ+wqbsskSMtwSXaCQiMvpZQa0lnRbpow6IpiFLwRld7IwUgAPcVcorVqy9t6PXZR/2qxkUFvJfWRPvp7/T3MCBDEVBXHJML7irTM9Zlx+ffYQgoskanTfA0SFzsZi8va0GhavKjZY1X/wUeEg+sLKoypfWDGpGoODzmys/6DiDFGh12uPwg541T32bv8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEALHNqbbg9vEEMHp8J48oK44+apzShlfl6hJZmZ2gwj8wm8oi34NPjTs03L3gFwE0EGFUXQ4HO8gY8CQabk/sHDnpLTwHFZJn1rPRU25fneeBjjenBGxS0CFO+o5HFKxhcZjOHgKJFmV3SyoSlFlAdEkJloYGQUAQHfMhtOvMNOKH8VZ0H3XOltEGAvLIdFsRhwbeiJfxWPPH8npX+hWHw65vl+69n0GZzLj5UZs9Tgm1l9yrQXNOiMm/PekGHQcLiSUSqnNkDmfTSlboa6BzCnlT8rUV/iqur+QOb0RN4Ivnhn/5OQAoDpKOvw+ZykPnRTwwLMQ+H7UeA+/MT2y7CTw==
6fedf3e6-91f2-4865-a615-6065d186c5d2	81832b12-2cd4-4adb-baf8-808073b66873	host-sending-registration-request-must-match	true
41239489-9c57-42b0-8f28-9f895a50c4af	81832b12-2cd4-4adb-baf8-808073b66873	client-uris-must-match	true
f5c7105c-875d-4bff-85d6-4da18bbadc75	c348ef45-2e2c-4caf-b537-63669b6758ac	allow-default-scopes	true
88fa29cc-d2a1-47c2-8b1a-dc243a2de8cc	c4e41382-5731-41ff-bde4-95af447bedbd	max-clients	200
92323fd8-84ea-4027-a565-2e1959a31da2	36f20034-25e3-40a2-a09f-3676784db39e	allowed-protocol-mapper-types	saml-user-attribute-mapper
73679b6e-55c4-42f1-8e8a-68a942be5793	36f20034-25e3-40a2-a09f-3676784db39e	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
f6fcd5e0-35c9-40d2-9c3c-9b2dbb72fd1e	36f20034-25e3-40a2-a09f-3676784db39e	allowed-protocol-mapper-types	saml-user-property-mapper
cdb17cac-613d-4e57-afb0-8293ad890889	36f20034-25e3-40a2-a09f-3676784db39e	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
0eb34ffb-4e7b-4ddd-bc8d-c6cd5743ac3f	36f20034-25e3-40a2-a09f-3676784db39e	allowed-protocol-mapper-types	oidc-full-name-mapper
acc834f9-1588-458e-929a-97cd5d434363	36f20034-25e3-40a2-a09f-3676784db39e	allowed-protocol-mapper-types	oidc-address-mapper
a7bf835c-9d90-4795-9ab8-b7b0e3807c8b	36f20034-25e3-40a2-a09f-3676784db39e	allowed-protocol-mapper-types	saml-role-list-mapper
1a82b0c8-c86a-4c44-a7f9-9731b1f58371	36f20034-25e3-40a2-a09f-3676784db39e	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
7a2bd879-44a2-4466-ba80-bdf87b647842	7c48ddb2-08b9-495d-a785-3c8393e55a47	allowed-protocol-mapper-types	saml-role-list-mapper
4efaa862-c389-41b3-959c-0b37aa94e74f	7c48ddb2-08b9-495d-a785-3c8393e55a47	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
e4422a52-833d-459b-bc6c-957a85d860c3	7c48ddb2-08b9-495d-a785-3c8393e55a47	allowed-protocol-mapper-types	saml-user-attribute-mapper
7c143bf1-101f-4d97-b785-9e78ea371045	7c48ddb2-08b9-495d-a785-3c8393e55a47	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
f0ea30a2-afca-4cde-8434-1106766df8d0	7c48ddb2-08b9-495d-a785-3c8393e55a47	allowed-protocol-mapper-types	saml-user-property-mapper
ce7d9040-6425-48d7-acf4-2dc1a6d2f5f9	7c48ddb2-08b9-495d-a785-3c8393e55a47	allowed-protocol-mapper-types	oidc-address-mapper
271479c4-a0e7-4009-9cff-8ae819b91da8	7c48ddb2-08b9-495d-a785-3c8393e55a47	allowed-protocol-mapper-types	oidc-full-name-mapper
a205c15a-c117-47cc-acbb-cf858f225547	7c48ddb2-08b9-495d-a785-3c8393e55a47	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
2ec6bd5b-78dd-421c-a214-c9e720c3501f	2265e93d-8277-42bf-8a94-4d5d534d0729	allow-default-scopes	true
da9f2b01-acfd-4f38-974f-1f677c302fa2	89e3a45a-55eb-4f22-8943-225d6c7b02ca	priority	100
3dd17c7f-6c24-47f0-a3ab-264a3feb058d	89e3a45a-55eb-4f22-8943-225d6c7b02ca	keyUse	ENC
e06a20ba-8ac0-4bf3-b16e-6050a08f54ca	89e3a45a-55eb-4f22-8943-225d6c7b02ca	privateKey	MIIEowIBAAKCAQEAw/fRAs3ktVv4en+P9NEvXtx1i+qQSW9clEhCMsbwX258TCadygNIkbrJNKifLUf0gj+9M+dxj7Of1rLxG0VFCRlxV64pcOP0c2f/eyL20KHwURonZubOMRmch1Zz/C2P0GwUrB/Qv7jSk2C1yCuPOu7XDWRL7kASJ/JBXjCXrHR5G/8zsG9tTqXO8UZf6os88wcdOe+gOmcvJWZ0CqngbYKVjJItVbl2GHcHPf2tVy5gw4oTPQ/B54ee3dAb4RSg7Z8YTQi3r8wxRMHLY/T2v2y16oBtAyKjq6a8H4evY895bHve0MDz6NPoRma3c3WZfozwf5qdhwLfwXacfDq++wIDAQABAoIBAQC3OtXttk+bFyRMfUs/j/unyaAKs8Y3M22vo6Rpz8Lep/KGTTEJumo3ABuzJdq3Pukqg6hHiKaQw1W3LFbttaXn7Sch4VEUIb/lzB5/puB5kICfhEHFIBc4p4bIsBgAeSVXrkbh7VmEea5CaJFvWPMyGjFvbxDj8npHaWafR/X5IsdhjdHNtwHK0V0OM0tQABlq22GogUVz1s0Z2oKMoBpDtzHNkpvzZmn0tld1+hq8c4LU50fIZWYazwzVfYUtnANrcYHtSmAAOKvT94X8lqbSsRrUpiDpi/X1gMf6qjFO3Glr3JUaXlApT3vUN7CTKtSNgPlV6tZbW5xoHjNaY72JAoGBAOGa91ZjpYOqTPqP7ELbYgYkysBWPQTdac/puCqwP9wjzzQKwFuDjxW8paOLJxnUtwvndfDJJ9vIrxJJpG+u+02owGVURVx6WOorOPxsvszpI2DezCwNibZAL6H7bbFGG6vZXCsM1tJlGxN7bsgaidZMtlX6qXV12r1xotf/TH2XAoGBAN5erAxtSttXnziW8VZrIvmW1vREOqSZi4/eJZOKhbptED3jehsGAXZTIqRMPRdOlfc6+t5thG7VExS2c6TliWOdWc2m1P1GFVL4YesAiJ0hBcR3pAEOz4UobQxmBpU6rRz/LEgUbjzOIAIvcxd6utNS1g2EOhYbJmwRJEd3Y/49AoGAIJbdIcqVLzbbldpSe7nrKA4Kh8wtVlWRomoVo30ATJGTreXbsZyIf9BXcQ95335dzsdpvxWfv1z3BUJEEaoKPUaiPED3IAvAaltCCRzAVyNaa/TjM33lJcGR3+lNCC2jc6ibatCY+52FUsQi1Z8XyDAeqr7h2cjjhzgyGNeVOhMCgYAWArr28+5/7ZlmCZLT4gDxQZv/S62eU1B8KhoAE6sO+/KqnZSdjieg5bO9HYrCftXbRexFDgQY0GB2IWUrAklqIc4czBGzDDfaIZnXoBLlsroWa11BeYzS+mBo5MRsCwXNo/hnHhaXUDPc44N55H0Po9hqOBdjzsYr1jqIFGpCZQKBgHsHN3rkX8wJEiuciEGTIMCSZhvmcDXk6c7LfPD6+p0BnwFxvdqVNBqxqYeJnks//0MofkRlcfrdW6N9ELnD+0Me87+sJ0Bj8CJ4V/JRWlAb34xMdvxkMrfOULCXqMTS+Akr1CuCXJn7t5aLsArOOxzV4VyMLv7GxeF6sMcex4f4
45fadd0d-d424-4076-bf92-2a4ff9212bd3	e0292ba4-d2cd-48a5-9cae-5d68fc36a88a	secret	iuS7yEvZxjjYnKweN_7TNg
4025858a-6209-4686-898a-39a98b506b05	e0292ba4-d2cd-48a5-9cae-5d68fc36a88a	priority	100
4b7a9d12-61f0-4317-bcb2-722d47faa368	e0292ba4-d2cd-48a5-9cae-5d68fc36a88a	kid	7d1911c4-50c4-4f91-8cfa-01bb2d7fd595
79aaae4c-c717-42d5-91ac-299394e681db	f87cfd8f-5784-47ee-ad96-d4667b99824e	certificate	MIIClzCCAX8CBgF/0V3NRDANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDARpZHAyMB4XDTIyMDMyODE2MjkxOVoXDTMyMDMyODE2MzA1OVowDzENMAsGA1UEAwwEaWRwMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKmJGsvHyUkeThtawalDcMNgbQ/b65AdlpDGunN9BXkNqpgFsCJRQUaEMN1mQ5sAnNNhIb7ZZhNE2qipmS+IjUGlwEdv8mXZIHCCoZNPIYskWaXKBcumuzHV7tuNW6mdSJ69uzaN82eDYwmRDTKQrDV7KWzDddvwacZAi2VDBe00iKV9/1EdylEB/o/PCQcK1SyueCBNxEPpgEV2D5QPHHNuBEMLJ3agU+2zBlGIDhQDovkzcB2h8pr1ySVdTScHP9Dt50rF/kf+WMali5wQU3Y9gle/mIqmODvmq0Caihs5HuUntkVa1bn9d7t9i/tFNwacqfISl/U+ftBdz2DlZoUCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAdmNoYhrRNn/0MAsWpdwL1CFgDq0UGAbsrX96dWxVUEsKWWlEcvakJXVA2HwiKJn1gje1rbqIEZD3eUG3dIqHJ/QnHoXtvBAPvjM5OjL4s0Njub4r4cIVOuBH8b/xuuEMf8Xpq73sEyIoriS6MovQrCj+bwn5j9aYgSiYyMB1CgeA9FH4XWepcgR1otiPkg47Je9PpaT1FAIQ3ZN9/cuAO/O5k4pHeMtd7Q9xohSoM1VxGCR0FOWmGck2RFAUdk4ORgwxfEH0OsRgk/f96p/71pT6djAkxm9fSvKT/UC8X/SuJTRMrwzOg4HKzoPExUcZPFk46noguMg+4Fh1uzZoTg==
24b56a0e-9f3f-42e6-a565-93f6ff32cd03	f87cfd8f-5784-47ee-ad96-d4667b99824e	privateKey	MIIEogIBAAKCAQEAqYkay8fJSR5OG1rBqUNww2BtD9vrkB2WkMa6c30FeQ2qmAWwIlFBRoQw3WZDmwCc02EhvtlmE0TaqKmZL4iNQaXAR2/yZdkgcIKhk08hiyRZpcoFy6a7MdXu241bqZ1Inr27No3zZ4NjCZENMpCsNXspbMN12/BpxkCLZUMF7TSIpX3/UR3KUQH+j88JBwrVLK54IE3EQ+mARXYPlA8cc24EQwsndqBT7bMGUYgOFAOi+TNwHaHymvXJJV1NJwc/0O3nSsX+R/5YxqWLnBBTdj2CV7+YiqY4O+arQJqKGzke5Se2RVrVuf13u32L+0U3Bpyp8hKX9T5+0F3PYOVmhQIDAQABAoIBAEEztreK5dIWMqn4lKS5iEPL8QX5abZqer7Bf3HtMk6lP+fpwBzirT0ml/h+XR/e83GkWKsix0w/3eyiFYUfelw2GCYhWtNq1zwOMYALHfZ6i3Pkp6f0Puhiw9NyoT8xe315sOfBXkyATnWecLnyxBhpfrwSzGBDLRsPNc1DIqNgQFZ9ohRGN5JReukPiF6BBrasRIOBXE/TXPr3Tn+B283za/reizpAK/HECxChv/Bh0yN8/Df9eN3AnYGfldbXVMKLbu5lILnHO+eYbYES6091SlgWtSSN4AjMPIUa0LK8RxdQwq5IBIdmG4cB0HDlQ2vIox30Crr9rl1ayvWCKEECgYEA7Us1EwtMQGa4WoF30syuBz8fxVi2YiDYirc2BGLi1gM05irC2KGOM7AV4cCoh52+kfT2BOpPDVWKWcEGsWfgOZaTt6P+T5wtpdg+6rnYBvUMy0lwduf5P4Ny7IV0RG1nsqyUeHvgPFX7TkslSiOf2Ilm0bvovC7zbBna/OJHHDUCgYEAtuZ6cPidQ4De3wKgH11mL99JlHwG0x5OWS32K1HVVJvicNvlPQT/DLW/YgHWh99X6XvDTCGfsSUGZ1XSzMyeVt0FMJ481CFMYWewYrBjA5snqEOM0igQScENV4FAuOa8jW1sC+/8bzShjUxqv355F79CRGpL2zIAQ+llAlRlSxECgYAEhMod8rkhANPB5XVCrmMiADG6sFXIyJdXDOYab0eii60WNPpA5dKvaUsBYYnUC0z1upR0w4F934Mi8moONswuTI/Dj3voSDEWV2fbUG6ssz3rIRrjKMe2TeqCVohARVUUMfUh1joO7BQ9CXFMWCFTHkq2870a2EoKZPOmnSh9gQKBgFK/P1HxCKVLnolilLLb/KlX6eAlpKjLI0MxihfbNBrNU8sfkTzkD8feSjG7ByX9o7ZcaeT9qVPpnlYN/Arv4AsIf5qZXIfUcMv4r1JW3tT40x5LQWCrA4N6teCK948vxMpvYNydvKVLOHPGyNzOCVb3DrIJLTyECJ6w7yP4rsMhAoGAQDcJeht2ORKdMVuOEEhByWJ52QCT0g2U4GLBsR9eclCLFt/RcfDSt97brVGrTmxMbPkzeB9PqwppND4dtBLTy4ofDXXUHXhtOrDeRf5FTs12DnGm3LfE2RnxhHhiR+Rpkq0HRmY6Pck90h/2ffGse68qCk51WxTaV0cMU2Kldr0=
173205ae-9186-4efd-b097-5e30c344b21d	f87cfd8f-5784-47ee-ad96-d4667b99824e	keyUse	SIG
6fcc9b2a-d234-4bef-a563-94276b632713	f87cfd8f-5784-47ee-ad96-d4667b99824e	priority	100
75d34a00-3bee-481f-b817-eb98e60fcd33	4263a1ca-7c06-45c7-94b1-0f54c3d412c2	max-clients	200
52df151a-7b32-42bf-a8c9-9dc82cc06fa2	fe374f13-5910-4f55-b11d-1c0c9eae52bf	allowed-protocol-mapper-types	saml-user-property-mapper
3196a02e-a21f-4c5e-9512-2a72e6779c17	fe374f13-5910-4f55-b11d-1c0c9eae52bf	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
40fac776-5ceb-4eaf-b431-0c91b9783377	fe374f13-5910-4f55-b11d-1c0c9eae52bf	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
2a7d7d94-92cf-440c-8e27-31cd3581cc5a	fe374f13-5910-4f55-b11d-1c0c9eae52bf	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
3ed30e2d-a1de-4d58-a252-15354373a5a9	fe374f13-5910-4f55-b11d-1c0c9eae52bf	allowed-protocol-mapper-types	saml-role-list-mapper
b4a5791c-f395-4282-b9d2-b89207d3b389	fe374f13-5910-4f55-b11d-1c0c9eae52bf	allowed-protocol-mapper-types	oidc-full-name-mapper
d50990f3-32b3-4897-9c6c-915040e7a972	fe374f13-5910-4f55-b11d-1c0c9eae52bf	allowed-protocol-mapper-types	saml-user-attribute-mapper
3467e140-3455-46c2-88d8-51d27b4f224b	fe374f13-5910-4f55-b11d-1c0c9eae52bf	allowed-protocol-mapper-types	oidc-address-mapper
74032aea-80a4-4cb1-851d-76bcbb660006	71023497-5ac3-4053-8700-1e8c107477c8	allowed-protocol-mapper-types	oidc-address-mapper
558135cd-7cad-4d21-9c16-8906af080ebb	71023497-5ac3-4053-8700-1e8c107477c8	allowed-protocol-mapper-types	oidc-full-name-mapper
f01c6f32-b1b6-4e3a-9108-3d64456b0809	71023497-5ac3-4053-8700-1e8c107477c8	allowed-protocol-mapper-types	saml-user-property-mapper
62a19d7f-40c1-407f-889f-07d93b999976	71023497-5ac3-4053-8700-1e8c107477c8	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
1c25f49c-2e09-4a5b-8b3e-e6511e1ccf8f	71023497-5ac3-4053-8700-1e8c107477c8	allowed-protocol-mapper-types	saml-role-list-mapper
fd7c0d34-90ab-40ae-a321-f21c55ad1435	71023497-5ac3-4053-8700-1e8c107477c8	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
b6296637-7a37-44dd-afc6-4b86739671b3	71023497-5ac3-4053-8700-1e8c107477c8	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
6f3895db-1a87-48a8-96b6-02e231012d9a	71023497-5ac3-4053-8700-1e8c107477c8	allowed-protocol-mapper-types	saml-user-attribute-mapper
9b91d260-67a1-4b8c-9fe7-b3a3d22ae66b	f491d0e3-c1c6-4f1a-9d79-459430fafe0f	client-uris-must-match	true
4abbc19f-ac56-4158-9f84-3d48a1e2a308	f491d0e3-c1c6-4f1a-9d79-459430fafe0f	host-sending-registration-request-must-match	true
60c76dcc-2692-46f9-9792-1b6d935fe18d	4b53a2b2-ef32-4a04-981e-f0a08cd8cbef	allow-default-scopes	true
8595abf1-b2ea-4246-b591-17179c791ffa	40a4a0d0-1612-40dc-8f25-01193c1cadc1	allow-default-scopes	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.composite_role (composite, child_role) FROM stdin;
111b076b-edb1-4006-9291-ae2b7fbb5d08	6a06c9d3-9bbc-47bb-9c46-b6c616da9de6
111b076b-edb1-4006-9291-ae2b7fbb5d08	ef49640c-d781-4d7d-b64e-7b915b1489a9
111b076b-edb1-4006-9291-ae2b7fbb5d08	c1fc4ae6-df97-44c4-86c7-c516d366d6e1
111b076b-edb1-4006-9291-ae2b7fbb5d08	e23cf68d-8e4d-4c75-91eb-367828972c5d
111b076b-edb1-4006-9291-ae2b7fbb5d08	23ba5375-9401-412b-9417-3e2c03316f0a
111b076b-edb1-4006-9291-ae2b7fbb5d08	04074553-1aa0-41bc-a938-4406d178aca8
111b076b-edb1-4006-9291-ae2b7fbb5d08	c0644d86-7e6e-4a10-8869-bd2e4330510b
111b076b-edb1-4006-9291-ae2b7fbb5d08	246a0dd8-6d70-4a53-bc5b-ab76389082de
111b076b-edb1-4006-9291-ae2b7fbb5d08	76a268c4-4189-46ea-ac1a-a7a8f4d77f54
111b076b-edb1-4006-9291-ae2b7fbb5d08	a98aa293-9202-4b00-af7e-8141ab7d6667
111b076b-edb1-4006-9291-ae2b7fbb5d08	00a88025-e916-4640-bb9c-f9d0483a58eb
111b076b-edb1-4006-9291-ae2b7fbb5d08	771d29c2-0587-4bf7-86d0-c009cb7daba3
111b076b-edb1-4006-9291-ae2b7fbb5d08	e3ff6fcc-9f14-4589-a3c7-5220c31d671f
111b076b-edb1-4006-9291-ae2b7fbb5d08	9d2c8018-5cb6-4ad5-8001-5879cc055cd8
111b076b-edb1-4006-9291-ae2b7fbb5d08	621e7ad7-0b34-49a0-8dd1-439d1e6fa035
111b076b-edb1-4006-9291-ae2b7fbb5d08	ab9c98ca-7ce8-4634-8307-ef055af1c30c
111b076b-edb1-4006-9291-ae2b7fbb5d08	aa364f44-f75b-47b9-aa76-46c2910f3583
111b076b-edb1-4006-9291-ae2b7fbb5d08	f5670a42-31fc-4400-acc7-38e8666e9a55
23ba5375-9401-412b-9417-3e2c03316f0a	ab9c98ca-7ce8-4634-8307-ef055af1c30c
e23cf68d-8e4d-4c75-91eb-367828972c5d	f5670a42-31fc-4400-acc7-38e8666e9a55
e23cf68d-8e4d-4c75-91eb-367828972c5d	621e7ad7-0b34-49a0-8dd1-439d1e6fa035
84b1eb02-4876-41dd-9bff-8dd2b68b3e80	6e323b36-f4f2-49f4-9300-dc38967bb890
84b1eb02-4876-41dd-9bff-8dd2b68b3e80	07d0f4c8-605b-4dd7-9ef5-e2a5f36895b9
07d0f4c8-605b-4dd7-9ef5-e2a5f36895b9	88ec8d7c-7cbc-420d-8ab5-7535d4b26f97
c0050153-1764-4023-9ce6-ef0dba4c8711	488e4316-0dc2-4c43-9474-31d84a282c84
111b076b-edb1-4006-9291-ae2b7fbb5d08	aded1176-074a-4cf1-a9fe-17f01f6ed95b
84b1eb02-4876-41dd-9bff-8dd2b68b3e80	b3a680e4-0e86-4b05-ab5b-649314ab6b61
84b1eb02-4876-41dd-9bff-8dd2b68b3e80	1a2abfe9-b1a9-40ee-8eb1-93f7373fc280
111b076b-edb1-4006-9291-ae2b7fbb5d08	c1920118-66a3-4763-956a-55d67dee536f
111b076b-edb1-4006-9291-ae2b7fbb5d08	b5b36764-26de-409b-bb75-d9e7c940e3ee
111b076b-edb1-4006-9291-ae2b7fbb5d08	f56ad518-6189-4452-a47d-e612c6bd4b6d
111b076b-edb1-4006-9291-ae2b7fbb5d08	a1a28a53-fc05-49c3-9f6b-98a63f723be6
111b076b-edb1-4006-9291-ae2b7fbb5d08	bf97e54d-663b-42c0-8244-37d1414f7043
111b076b-edb1-4006-9291-ae2b7fbb5d08	5eae02a3-9f69-429f-be6f-27b23cfb4a06
111b076b-edb1-4006-9291-ae2b7fbb5d08	04966c2a-96c5-4739-b293-7213900fd480
111b076b-edb1-4006-9291-ae2b7fbb5d08	279d9f0e-f028-4269-a0f7-4a934671ff5d
111b076b-edb1-4006-9291-ae2b7fbb5d08	d6601946-f90e-4071-be79-244e790a0180
111b076b-edb1-4006-9291-ae2b7fbb5d08	3ee2f8eb-4b0c-4029-86bc-caf2840913a6
111b076b-edb1-4006-9291-ae2b7fbb5d08	44f56580-4264-44f8-b387-bdd2fd3ae32c
111b076b-edb1-4006-9291-ae2b7fbb5d08	399fb6db-e5cb-4e17-ac31-8740a78f30b2
111b076b-edb1-4006-9291-ae2b7fbb5d08	36c17efb-8bdf-4ac7-a1ed-f538c710abe6
111b076b-edb1-4006-9291-ae2b7fbb5d08	2754ef57-9963-452c-b218-628ec0bf3e4d
111b076b-edb1-4006-9291-ae2b7fbb5d08	51fe83f7-45c6-46da-bdca-67d1dbf874f7
111b076b-edb1-4006-9291-ae2b7fbb5d08	9dd94d5a-95a1-4d80-bac2-4179e7171146
111b076b-edb1-4006-9291-ae2b7fbb5d08	7e6ad334-ebea-4ed0-9b39-b28e5364d8cb
a1a28a53-fc05-49c3-9f6b-98a63f723be6	51fe83f7-45c6-46da-bdca-67d1dbf874f7
f56ad518-6189-4452-a47d-e612c6bd4b6d	2754ef57-9963-452c-b218-628ec0bf3e4d
f56ad518-6189-4452-a47d-e612c6bd4b6d	7e6ad334-ebea-4ed0-9b39-b28e5364d8cb
3a46d629-3936-42a7-a3ec-fa392c4b11e5	05c03329-126b-4fcc-9607-42ab4abed25b
3a46d629-3936-42a7-a3ec-fa392c4b11e5	158af3da-a08f-418d-83d3-f425ffceb9b1
3a46d629-3936-42a7-a3ec-fa392c4b11e5	9964bc9d-1678-4922-a856-315c13945a42
3a46d629-3936-42a7-a3ec-fa392c4b11e5	065f9004-19a5-42ff-8d52-4a41485adc6a
3a46d629-3936-42a7-a3ec-fa392c4b11e5	864d2575-6d41-47d2-b063-8a0a3a98aef5
3a46d629-3936-42a7-a3ec-fa392c4b11e5	4d882a25-a021-4eda-a685-4e64cc8e59e2
3a46d629-3936-42a7-a3ec-fa392c4b11e5	7354f7b2-2270-4a21-8560-ccf50be46d13
3a46d629-3936-42a7-a3ec-fa392c4b11e5	ab9aaa6a-df1c-43e7-b549-38d83c12a24c
3a46d629-3936-42a7-a3ec-fa392c4b11e5	5b2130d5-59a4-47cf-a82b-44aae4d421ea
3a46d629-3936-42a7-a3ec-fa392c4b11e5	0024cc34-a701-469d-88e7-c3dcecfee6a3
3a46d629-3936-42a7-a3ec-fa392c4b11e5	cfca0e46-bc67-45fb-b73e-02a29676fd7c
3a46d629-3936-42a7-a3ec-fa392c4b11e5	00cc884e-d0fe-4d2a-8478-e39dcbb3c5db
3a46d629-3936-42a7-a3ec-fa392c4b11e5	96ab3336-9a54-4a73-acd1-10b9484a8e40
3a46d629-3936-42a7-a3ec-fa392c4b11e5	63ea9d91-49b2-4255-99de-e40e2e99f603
3a46d629-3936-42a7-a3ec-fa392c4b11e5	3ee319f4-b301-43d8-bfdb-3912e280f34b
3a46d629-3936-42a7-a3ec-fa392c4b11e5	676637df-e1ce-47a4-9103-b33055b48f64
3a46d629-3936-42a7-a3ec-fa392c4b11e5	2755edc8-eb43-43ea-95ac-4678514b8b49
065f9004-19a5-42ff-8d52-4a41485adc6a	3ee319f4-b301-43d8-bfdb-3912e280f34b
9964bc9d-1678-4922-a856-315c13945a42	2755edc8-eb43-43ea-95ac-4678514b8b49
9964bc9d-1678-4922-a856-315c13945a42	63ea9d91-49b2-4255-99de-e40e2e99f603
cb4c5d64-7023-48d5-93d6-3f63bff0111e	18bccc28-4216-4d80-83a0-02d61ce43d20
cb4c5d64-7023-48d5-93d6-3f63bff0111e	e65ce79c-8502-4096-88af-944767df37ae
e65ce79c-8502-4096-88af-944767df37ae	4db70061-2bb2-40cb-a2c0-d33334c03adb
c96f0377-e677-481b-88f4-c25e4c56ea35	89f66d57-514a-49c8-b645-7888c79abf57
111b076b-edb1-4006-9291-ae2b7fbb5d08	7be8b12e-f383-4a57-ba6b-f9d10aeebcdc
3a46d629-3936-42a7-a3ec-fa392c4b11e5	3448f311-b1d3-49a0-8e0c-ae6559a587b3
cb4c5d64-7023-48d5-93d6-3f63bff0111e	adbfcc74-f8d0-4c01-8fc6-41fe03551b3e
cb4c5d64-7023-48d5-93d6-3f63bff0111e	b58450e4-db19-4a5f-8c73-ea5650ee7ebc
111b076b-edb1-4006-9291-ae2b7fbb5d08	c0061df0-7944-4e94-bd24-8a1607b591cf
111b076b-edb1-4006-9291-ae2b7fbb5d08	e5298cbe-bb78-4e2b-b7fe-4bc019ba58c3
111b076b-edb1-4006-9291-ae2b7fbb5d08	66b8ceaf-05e3-4ab6-bd03-913eed39cc80
111b076b-edb1-4006-9291-ae2b7fbb5d08	f471661a-ae0e-487d-9a12-06c03b07448d
111b076b-edb1-4006-9291-ae2b7fbb5d08	771cf602-5543-46a9-891d-3e0536b18455
111b076b-edb1-4006-9291-ae2b7fbb5d08	f8095801-f7ef-4634-8786-4e4fda2bbc8f
111b076b-edb1-4006-9291-ae2b7fbb5d08	5d55e37d-b3d3-45f9-98c4-a31d43e280f2
111b076b-edb1-4006-9291-ae2b7fbb5d08	1adbb3cb-fe7e-40e9-8e37-7bcb36a28526
111b076b-edb1-4006-9291-ae2b7fbb5d08	3a0bc9ec-2be8-4ed4-8cb4-d7e047d77fa6
111b076b-edb1-4006-9291-ae2b7fbb5d08	e3d11ee6-66df-4c90-8e45-8386f256ec7f
111b076b-edb1-4006-9291-ae2b7fbb5d08	ca0b13fd-1ad0-4cae-8c32-5fadba3bfde2
111b076b-edb1-4006-9291-ae2b7fbb5d08	b194978c-78c4-40aa-9884-52e54484e2df
111b076b-edb1-4006-9291-ae2b7fbb5d08	7a754049-d964-43f1-b89c-498c0e3eb0db
111b076b-edb1-4006-9291-ae2b7fbb5d08	663ee0d8-6c92-4b61-9426-0a3a83f93160
111b076b-edb1-4006-9291-ae2b7fbb5d08	73a48b58-5ad2-4ba0-b8fb-0d1d4fde3f6e
111b076b-edb1-4006-9291-ae2b7fbb5d08	680e748d-76ff-4556-9beb-31309c10a3ce
111b076b-edb1-4006-9291-ae2b7fbb5d08	7797edc4-1757-4f6f-8f8d-d5c3b2a8f6fe
f471661a-ae0e-487d-9a12-06c03b07448d	73a48b58-5ad2-4ba0-b8fb-0d1d4fde3f6e
66b8ceaf-05e3-4ab6-bd03-913eed39cc80	663ee0d8-6c92-4b61-9426-0a3a83f93160
66b8ceaf-05e3-4ab6-bd03-913eed39cc80	7797edc4-1757-4f6f-8f8d-d5c3b2a8f6fe
a0eba644-2519-4189-bbd6-903d28bb7153	44209110-201a-4a64-b9d9-d779f3e24136
a0eba644-2519-4189-bbd6-903d28bb7153	7b0c2663-8da8-4c13-abb8-e17b8b589359
a0eba644-2519-4189-bbd6-903d28bb7153	0b76a757-1cbc-4621-9524-84aa828df396
a0eba644-2519-4189-bbd6-903d28bb7153	73f84d43-9f20-4997-bbc3-5c589ddf53f3
a0eba644-2519-4189-bbd6-903d28bb7153	5a75b912-dffa-4dac-a16e-c2c90e3220d6
a0eba644-2519-4189-bbd6-903d28bb7153	4940d6c1-e80a-4f10-b7b5-aa6900a2b87e
a0eba644-2519-4189-bbd6-903d28bb7153	b0032cc1-9855-4cc8-8365-ed328a68fbe2
a0eba644-2519-4189-bbd6-903d28bb7153	f0e71220-d2b6-4b15-8702-9a24b13ee6eb
a0eba644-2519-4189-bbd6-903d28bb7153	f266283f-f79b-45c8-8757-72841d8652cc
a0eba644-2519-4189-bbd6-903d28bb7153	0956e0b2-ee53-414a-a095-d42c2aa4003c
a0eba644-2519-4189-bbd6-903d28bb7153	d7d488fa-2e25-4840-a92c-520a71a6aab5
a0eba644-2519-4189-bbd6-903d28bb7153	49b3a210-1982-475f-b40d-c85b4cbd3e45
a0eba644-2519-4189-bbd6-903d28bb7153	d979df36-09ad-4a23-85ed-b9d9cd46af61
a0eba644-2519-4189-bbd6-903d28bb7153	2b78070e-906a-4acd-9e7e-8bca710f8f69
a0eba644-2519-4189-bbd6-903d28bb7153	09d60ee4-6344-4496-8978-86f22f644623
a0eba644-2519-4189-bbd6-903d28bb7153	31b3dea8-9d7c-4ab3-acb0-571efc3506cd
a0eba644-2519-4189-bbd6-903d28bb7153	3a1a8ee2-8311-4dbe-a45a-c269d58906be
73f84d43-9f20-4997-bbc3-5c589ddf53f3	09d60ee4-6344-4496-8978-86f22f644623
0b76a757-1cbc-4621-9524-84aa828df396	2b78070e-906a-4acd-9e7e-8bca710f8f69
0b76a757-1cbc-4621-9524-84aa828df396	3a1a8ee2-8311-4dbe-a45a-c269d58906be
0a60b261-fcaf-4d0c-b26d-d6297abbd6cd	bcee3684-cc14-4b87-b674-0e08050a2e36
0a60b261-fcaf-4d0c-b26d-d6297abbd6cd	005d1605-f9b3-4ed8-b6aa-d5ca96155b89
005d1605-f9b3-4ed8-b6aa-d5ca96155b89	03777b96-430d-4be6-8fc9-930d780f92ed
26397318-3a3f-410e-820a-7744c078a969	a84ee3f9-bded-4622-9b87-c5656afc904d
111b076b-edb1-4006-9291-ae2b7fbb5d08	ece0c32c-9f1c-48f0-aef0-160263330bbd
a0eba644-2519-4189-bbd6-903d28bb7153	5a6e443b-5fcb-4431-a5d5-bf099917095c
0a60b261-fcaf-4d0c-b26d-d6297abbd6cd	cacd76c8-c52f-4300-97f1-938f0184bf36
0a60b261-fcaf-4d0c-b26d-d6297abbd6cd	0f2588be-626c-4ecd-a730-c8cbbe2de29d
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
e25a2b25-7e9b-42b8-b1a2-a5f4873034ab	\N	password	8fedf7f0-3c1a-41d7-a8c7-2a1a329b4f75	1648455300991	\N	{"value":"3Qy1MNA8H9BoJ7n4veFGMGusuZ3iVddekuV3qC67Vlsmy+K00R6uSAwj0/bon9ic1Zj/9R8vWqhpHfV8z5j96w==","salt":"IHktx0i7LaEyZO6MZoXyJw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
33a38706-066e-4fa1-b7d6-682bbc4830f3	\N	password	6ec46cd4-5aec-46c3-88dc-2a283994ab92	1648483720459	\N	{"value":"3bY0lMPkujH4dVaJhdtTnriRcdUaY1am4EWkBz79jQbrsyR+AAhNZBxBbtsPF8z/9F648OEFppStHyQbDfw6Ig==","salt":"5EbdScgiZwSt4vQ2cqk/XQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
0555366a-6f56-4bbe-9e79-4972d1c20211	\N	password	f99d2698-5670-41f2-a141-e58b0c99560c	1648485164157	\N	{"value":"Y3PJLshTVVZPFzRMbmdX+RiHPbMhycijDSgKPdz1eMQpRVXDeGl9ekvAsNhlOUpOXgv+TRAYGYIu3iTKPZh8XA==","salt":"o0IzsgWx/gqQhXb6DPrcMg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2022-03-28 08:14:09.675527	1	EXECUTED	7:4e70412f24a3f382c82183742ec79317	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	8455247043
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2022-03-28 08:14:09.822737	2	MARK_RAN	7:cb16724583e9675711801c6875114f28	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	8455247043
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2022-03-28 08:14:10.097197	3	EXECUTED	7:0310eb8ba07cec616460794d42ade0fa	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	3.5.4	\N	\N	8455247043
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2022-03-28 08:14:10.104985	4	EXECUTED	7:5d25857e708c3233ef4439df1f93f012	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	8455247043
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2022-03-28 08:14:10.732618	5	EXECUTED	7:c7a54a1041d58eb3817a4a883b4d4e84	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	8455247043
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2022-03-28 08:14:10.766608	6	MARK_RAN	7:2e01012df20974c1c2a605ef8afe25b7	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	8455247043
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2022-03-28 08:14:11.33004	7	EXECUTED	7:0f08df48468428e0f30ee59a8ec01a41	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	8455247043
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2022-03-28 08:14:11.384662	8	MARK_RAN	7:a77ea2ad226b345e7d689d366f185c8c	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	8455247043
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2022-03-28 08:14:11.447492	9	EXECUTED	7:a3377a2059aefbf3b90ebb4c4cc8e2ab	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	3.5.4	\N	\N	8455247043
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2022-03-28 08:14:12.000727	10	EXECUTED	7:04c1dbedc2aa3e9756d1a1668e003451	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	3.5.4	\N	\N	8455247043
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2022-03-28 08:14:12.307004	11	EXECUTED	7:36ef39ed560ad07062d956db861042ba	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	8455247043
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2022-03-28 08:14:12.312503	12	MARK_RAN	7:d909180b2530479a716d3f9c9eaea3d7	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	8455247043
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2022-03-28 08:14:12.499544	13	EXECUTED	7:cf12b04b79bea5152f165eb41f3955f6	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	8455247043
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-03-28 08:14:12.644912	14	EXECUTED	7:7e32c8f05c755e8675764e7d5f514509	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	3.5.4	\N	\N	8455247043
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-03-28 08:14:12.654665	15	MARK_RAN	7:980ba23cc0ec39cab731ce903dd01291	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	8455247043
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-03-28 08:14:12.664068	16	MARK_RAN	7:2fa220758991285312eb84f3b4ff5336	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	3.5.4	\N	\N	8455247043
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-03-28 08:14:12.673895	17	EXECUTED	7:d41d8cd98f00b204e9800998ecf8427e	empty		\N	3.5.4	\N	\N	8455247043
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2022-03-28 08:14:12.883307	18	EXECUTED	7:91ace540896df890cc00a0490ee52bbc	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	3.5.4	\N	\N	8455247043
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2022-03-28 08:14:13.242427	19	EXECUTED	7:c31d1646dfa2618a9335c00e07f89f24	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	8455247043
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2022-03-28 08:14:13.28397	20	EXECUTED	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	8455247043
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-03-28 08:14:23.904737	45	EXECUTED	7:6a48ce645a3525488a90fbf76adf3bb3	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	8455247043
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2022-03-28 08:14:13.305883	21	MARK_RAN	7:f987971fe6b37d963bc95fee2b27f8df	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	8455247043
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2022-03-28 08:14:13.367522	22	MARK_RAN	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	8455247043
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2022-03-28 08:14:13.911228	23	EXECUTED	7:ed2dc7f799d19ac452cbcda56c929e47	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	3.5.4	\N	\N	8455247043
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2022-03-28 08:14:13.97043	24	EXECUTED	7:80b5db88a5dda36ece5f235be8757615	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	8455247043
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2022-03-28 08:14:13.977052	25	MARK_RAN	7:1437310ed1305a9b93f8848f301726ce	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	8455247043
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2022-03-28 08:14:16.433064	26	EXECUTED	7:b82ffb34850fa0836be16deefc6a87c4	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	3.5.4	\N	\N	8455247043
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2022-03-28 08:14:16.953881	27	EXECUTED	7:9cc98082921330d8d9266decdd4bd658	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	3.5.4	\N	\N	8455247043
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2022-03-28 08:14:16.995959	28	EXECUTED	7:03d64aeed9cb52b969bd30a7ac0db57e	update tableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	8455247043
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2022-03-28 08:14:17.308972	29	EXECUTED	7:f1f9fd8710399d725b780f463c6b21cd	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	3.5.4	\N	\N	8455247043
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2022-03-28 08:14:17.384954	30	EXECUTED	7:53188c3eb1107546e6f765835705b6c1	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	3.5.4	\N	\N	8455247043
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2022-03-28 08:14:17.485604	31	EXECUTED	7:d6e6f3bc57a0c5586737d1351725d4d4	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	3.5.4	\N	\N	8455247043
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2022-03-28 08:14:17.527901	32	EXECUTED	7:454d604fbd755d9df3fd9c6329043aa5	customChange		\N	3.5.4	\N	\N	8455247043
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-03-28 08:14:17.581503	33	EXECUTED	7:57e98a3077e29caf562f7dbf80c72600	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	8455247043
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-03-28 08:14:17.620802	34	MARK_RAN	7:e4c7e8f2256210aee71ddc42f538b57a	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	8455247043
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-03-28 08:14:17.832861	35	EXECUTED	7:09a43c97e49bc626460480aa1379b522	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	8455247043
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2022-03-28 08:14:17.894938	36	EXECUTED	7:26bfc7c74fefa9126f2ce702fb775553	addColumn tableName=REALM		\N	3.5.4	\N	\N	8455247043
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-03-28 08:14:17.934279	37	EXECUTED	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	8455247043
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2022-03-28 08:14:17.950247	38	EXECUTED	7:37fc1781855ac5388c494f1442b3f717	addColumn tableName=FED_USER_CONSENT		\N	3.5.4	\N	\N	8455247043
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2022-03-28 08:14:17.995072	39	EXECUTED	7:13a27db0dae6049541136adad7261d27	addColumn tableName=IDENTITY_PROVIDER		\N	3.5.4	\N	\N	8455247043
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-03-28 08:14:18.001472	40	MARK_RAN	7:550300617e3b59e8af3a6294df8248a3	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	8455247043
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-03-28 08:14:18.006506	41	MARK_RAN	7:e3a9482b8931481dc2772a5c07c44f17	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	8455247043
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2022-03-28 08:14:18.039378	42	EXECUTED	7:72b07d85a2677cb257edb02b408f332d	customChange		\N	3.5.4	\N	\N	8455247043
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-03-28 08:14:23.785968	43	EXECUTED	7:a72a7858967bd414835d19e04d880312	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	3.5.4	\N	\N	8455247043
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2022-03-28 08:14:23.850713	44	EXECUTED	7:94edff7cf9ce179e7e85f0cd78a3cf2c	addColumn tableName=USER_ENTITY		\N	3.5.4	\N	\N	8455247043
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-03-28 08:14:23.965885	46	EXECUTED	7:e64b5dcea7db06077c6e57d3b9e5ca14	customChange		\N	3.5.4	\N	\N	8455247043
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-03-28 08:14:24.011903	47	MARK_RAN	7:fd8cf02498f8b1e72496a20afc75178c	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	8455247043
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-03-28 08:14:24.44236	48	EXECUTED	7:542794f25aa2b1fbabb7e577d6646319	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	3.5.4	\N	\N	8455247043
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-03-28 08:14:24.48635	49	EXECUTED	7:edad604c882df12f74941dac3cc6d650	addColumn tableName=REALM		\N	3.5.4	\N	\N	8455247043
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2022-03-28 08:14:24.650343	50	EXECUTED	7:0f88b78b7b46480eb92690cbf5e44900	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	3.5.4	\N	\N	8455247043
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2022-03-28 08:14:26.269714	51	EXECUTED	7:d560e43982611d936457c327f872dd59	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	3.5.4	\N	\N	8455247043
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2022-03-28 08:14:26.282038	52	EXECUTED	7:c155566c42b4d14ef07059ec3b3bbd8e	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	8455247043
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2022-03-28 08:14:26.293478	53	EXECUTED	7:b40376581f12d70f3c89ba8ddf5b7dea	update tableName=REALM		\N	3.5.4	\N	\N	8455247043
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2022-03-28 08:14:26.346212	54	EXECUTED	7:a1132cc395f7b95b3646146c2e38f168	update tableName=CLIENT		\N	3.5.4	\N	\N	8455247043
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-03-28 08:14:26.372909	55	EXECUTED	7:d8dc5d89c789105cfa7ca0e82cba60af	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	3.5.4	\N	\N	8455247043
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-03-28 08:14:26.41397	56	EXECUTED	7:7822e0165097182e8f653c35517656a3	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	3.5.4	\N	\N	8455247043
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-03-28 08:14:26.57001	57	EXECUTED	7:c6538c29b9c9a08f9e9ea2de5c2b6375	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	3.5.4	\N	\N	8455247043
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-03-28 08:14:27.441337	58	EXECUTED	7:6d4893e36de22369cf73bcb051ded875	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	3.5.4	\N	\N	8455247043
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2022-03-28 08:14:27.563164	59	EXECUTED	7:57960fc0b0f0dd0563ea6f8b2e4a1707	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	3.5.4	\N	\N	8455247043
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2022-03-28 08:14:27.60874	60	EXECUTED	7:2b4b8bff39944c7097977cc18dbceb3b	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	8455247043
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2022-03-28 08:14:27.664589	61	EXECUTED	7:2aa42a964c59cd5b8ca9822340ba33a8	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	3.5.4	\N	\N	8455247043
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2022-03-28 08:14:27.681121	62	EXECUTED	7:9ac9e58545479929ba23f4a3087a0346	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	3.5.4	\N	\N	8455247043
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2022-03-28 08:14:27.692252	63	EXECUTED	7:14d407c35bc4fe1976867756bcea0c36	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	8455247043
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2022-03-28 08:14:27.724827	64	EXECUTED	7:241a8030c748c8548e346adee548fa93	update tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	8455247043
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2022-03-28 08:14:27.735185	65	EXECUTED	7:7d3182f65a34fcc61e8d23def037dc3f	update tableName=RESOURCE_SERVER_RESOURCE		\N	3.5.4	\N	\N	8455247043
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2022-03-28 08:14:27.867068	66	EXECUTED	7:b30039e00a0b9715d430d1b0636728fa	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	3.5.4	\N	\N	8455247043
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2022-03-28 08:14:28.048144	67	EXECUTED	7:3797315ca61d531780f8e6f82f258159	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	3.5.4	\N	\N	8455247043
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2022-03-28 08:14:28.095427	68	EXECUTED	7:c7aa4c8d9573500c2d347c1941ff0301	addColumn tableName=REALM		\N	3.5.4	\N	\N	8455247043
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2022-03-28 08:14:28.270855	69	EXECUTED	7:b207faee394fc074a442ecd42185a5dd	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	3.5.4	\N	\N	8455247043
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2022-03-28 08:14:28.294141	70	EXECUTED	7:ab9a9762faaba4ddfa35514b212c4922	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	3.5.4	\N	\N	8455247043
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2022-03-28 08:14:28.332088	71	EXECUTED	7:b9710f74515a6ccb51b72dc0d19df8c4	addColumn tableName=RESOURCE_SERVER		\N	3.5.4	\N	\N	8455247043
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-03-28 08:14:28.349158	72	EXECUTED	7:ec9707ae4d4f0b7452fee20128083879	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	8455247043
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-03-28 08:14:28.39487	73	EXECUTED	7:3979a0ae07ac465e920ca696532fc736	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	8455247043
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-03-28 08:14:28.39884	74	MARK_RAN	7:5abfde4c259119d143bd2fbf49ac2bca	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	8455247043
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-03-28 08:14:28.505754	75	EXECUTED	7:b48da8c11a3d83ddd6b7d0c8c2219345	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	3.5.4	\N	\N	8455247043
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-03-28 08:14:28.681721	76	EXECUTED	7:a73379915c23bfad3e8f5c6d5c0aa4bd	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	3.5.4	\N	\N	8455247043
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-03-28 08:14:28.691338	77	EXECUTED	7:39e0073779aba192646291aa2332493d	addColumn tableName=CLIENT		\N	3.5.4	\N	\N	8455247043
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-03-28 08:14:28.7004	78	MARK_RAN	7:81f87368f00450799b4bf42ea0b3ec34	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	3.5.4	\N	\N	8455247043
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-03-28 08:14:28.894516	79	EXECUTED	7:20b37422abb9fb6571c618148f013a15	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	3.5.4	\N	\N	8455247043
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-03-28 08:14:28.929837	80	MARK_RAN	7:1970bb6cfb5ee800736b95ad3fb3c78a	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	3.5.4	\N	\N	8455247043
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-03-28 08:14:29.064633	81	EXECUTED	7:45d9b25fc3b455d522d8dcc10a0f4c80	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	3.5.4	\N	\N	8455247043
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-03-28 08:14:29.070823	82	MARK_RAN	7:890ae73712bc187a66c2813a724d037f	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	8455247043
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-03-28 08:14:29.105756	83	EXECUTED	7:0a211980d27fafe3ff50d19a3a29b538	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	8455247043
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-03-28 08:14:29.112255	84	MARK_RAN	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	8455247043
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-03-28 08:14:29.227399	85	EXECUTED	7:01c49302201bdf815b0a18d1f98a55dc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	8455247043
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2022-03-28 08:14:29.276858	86	EXECUTED	7:3dace6b144c11f53f1ad2c0361279b86	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	3.5.4	\N	\N	8455247043
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2022-03-28 08:14:29.325732	87	EXECUTED	7:578d0b92077eaf2ab95ad0ec087aa903	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	3.5.4	\N	\N	8455247043
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2022-03-28 08:14:29.343231	88	EXECUTED	7:c95abe90d962c57a09ecaee57972835d	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	3.5.4	\N	\N	8455247043
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-03-28 08:14:29.365836	89	EXECUTED	7:f1313bcc2994a5c4dc1062ed6d8282d3	addColumn tableName=REALM; customChange		\N	3.5.4	\N	\N	8455247043
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-03-28 08:14:29.421337	90	EXECUTED	7:90d763b52eaffebefbcbde55f269508b	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	3.5.4	\N	\N	8455247043
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-03-28 08:14:29.532184	91	EXECUTED	7:d554f0cb92b764470dccfa5e0014a7dd	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	8455247043
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-03-28 08:14:29.563681	92	EXECUTED	7:73193e3ab3c35cf0f37ccea3bf783764	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	3.5.4	\N	\N	8455247043
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-03-28 08:14:29.599371	93	MARK_RAN	7:90a1e74f92e9cbaa0c5eab80b8a037f3	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	3.5.4	\N	\N	8455247043
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-03-28 08:14:29.621929	94	EXECUTED	7:5b9248f29cd047c200083cc6d8388b16	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	3.5.4	\N	\N	8455247043
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-03-28 08:14:29.630264	95	MARK_RAN	7:64db59e44c374f13955489e8990d17a1	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	3.5.4	\N	\N	8455247043
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-03-28 08:14:29.679966	96	EXECUTED	7:329a578cdb43262fff975f0a7f6cda60	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	3.5.4	\N	\N	8455247043
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-03-28 08:14:29.958954	97	EXECUTED	7:fae0de241ac0fd0bbc2b380b85e4f567	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	8455247043
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-03-28 08:14:29.970094	98	MARK_RAN	7:075d54e9180f49bb0c64ca4218936e81	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	8455247043
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-03-28 08:14:30.150433	99	MARK_RAN	7:06499836520f4f6b3d05e35a59324910	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	8455247043
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-03-28 08:14:30.3145	100	EXECUTED	7:fad08e83c77d0171ec166bc9bc5d390a	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	8455247043
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-03-28 08:14:30.32252	101	MARK_RAN	7:3d2b23076e59c6f70bae703aa01be35b	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	8455247043
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-03-28 08:14:30.442721	102	EXECUTED	7:1a7f28ff8d9e53aeb879d76ea3d9341a	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	3.5.4	\N	\N	8455247043
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-03-28 08:14:30.492938	103	EXECUTED	7:2fd554456fed4a82c698c555c5b751b6	customChange		\N	3.5.4	\N	\N	8455247043
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2022-03-28 08:14:30.550749	104	EXECUTED	7:b06356d66c2790ecc2ae54ba0458397a	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	3.5.4	\N	\N	8455247043
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
master	d5909064-37a4-4cd8-995f-da6675c81629	f
master	0c8c1fa5-b26d-43c7-8173-e779e8319278	t
master	72fbe764-b192-463e-992b-ee50971b9a5a	t
master	3d7c7e6d-e8f2-4d0e-ba63-1ee879299964	t
master	ab36e86d-028d-4c3c-b626-a58c855ab0f0	f
master	92d99ca8-0faa-4df6-aecb-ec264afc1a08	f
master	7d35c604-2bf0-41fb-9e0a-84721050d48f	t
master	a92ad0e3-298b-4c29-b026-bfbc23e550e4	t
master	3750c622-b41b-40fb-9129-9fe4a5928591	f
idp1	ebf588b9-a67b-49be-af34-c57c6839d2bf	f
idp1	cb31a428-a081-4059-8faf-f0e1e486be88	t
idp1	2e84accf-757b-4d3f-bf00-36a7c4541f88	t
idp1	121927d8-16f5-46a9-b94a-ff6a9e51ec72	t
idp1	d6ae812a-05a8-4277-b73e-af63f8617a42	f
idp1	70c95c82-eb6b-4a07-a843-0324cf9f70ea	f
idp1	6907f50b-922d-4045-a34c-d14f3d3c7312	t
idp1	0d1fa12b-62fa-4328-9f99-e09ef958b664	t
idp1	d408470e-93dc-4dfc-9ad8-06b0d9f97762	f
idp2	9768a898-6a62-4e46-81ac-bf179fc691ec	f
idp2	9cbd6416-1106-4948-8efc-12fa442e408f	t
idp2	73f21ff8-9f52-4014-9ad2-a5543278ece0	t
idp2	86c6d9cb-e044-4938-a92d-7ea6efc972a8	t
idp2	4784e596-acbe-42bb-8887-09a7bc21eadd	f
idp2	0b573c62-d03f-4bdd-ad9d-05950d11ebdf	f
idp2	ab217cca-28e9-43c0-a419-298aee0c435f	t
idp2	48f9943c-94cb-47bb-ac74-3f643990aeab	t
idp2	1b5f828d-701d-49ea-a9da-b1c83606240d	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
84b1eb02-4876-41dd-9bff-8dd2b68b3e80	master	f	${role_default-roles}	default-roles-master	master	\N	\N
111b076b-edb1-4006-9291-ae2b7fbb5d08	master	f	${role_admin}	admin	master	\N	\N
6a06c9d3-9bbc-47bb-9c46-b6c616da9de6	master	f	${role_create-realm}	create-realm	master	\N	\N
ef49640c-d781-4d7d-b64e-7b915b1489a9	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_create-client}	create-client	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
c1fc4ae6-df97-44c4-86c7-c516d366d6e1	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_view-realm}	view-realm	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
e23cf68d-8e4d-4c75-91eb-367828972c5d	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_view-users}	view-users	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
23ba5375-9401-412b-9417-3e2c03316f0a	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_view-clients}	view-clients	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
04074553-1aa0-41bc-a938-4406d178aca8	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_view-events}	view-events	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
c0644d86-7e6e-4a10-8869-bd2e4330510b	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_view-identity-providers}	view-identity-providers	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
246a0dd8-6d70-4a53-bc5b-ab76389082de	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_view-authorization}	view-authorization	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
76a268c4-4189-46ea-ac1a-a7a8f4d77f54	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_manage-realm}	manage-realm	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
a98aa293-9202-4b00-af7e-8141ab7d6667	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_manage-users}	manage-users	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
00a88025-e916-4640-bb9c-f9d0483a58eb	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_manage-clients}	manage-clients	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
771d29c2-0587-4bf7-86d0-c009cb7daba3	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_manage-events}	manage-events	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
e3ff6fcc-9f14-4589-a3c7-5220c31d671f	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_manage-identity-providers}	manage-identity-providers	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
9d2c8018-5cb6-4ad5-8001-5879cc055cd8	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_manage-authorization}	manage-authorization	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
621e7ad7-0b34-49a0-8dd1-439d1e6fa035	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_query-users}	query-users	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
ab9c98ca-7ce8-4634-8307-ef055af1c30c	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_query-clients}	query-clients	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
aa364f44-f75b-47b9-aa76-46c2910f3583	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_query-realms}	query-realms	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
f5670a42-31fc-4400-acc7-38e8666e9a55	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_query-groups}	query-groups	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
6e323b36-f4f2-49f4-9300-dc38967bb890	e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	t	${role_view-profile}	view-profile	master	e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	\N
07d0f4c8-605b-4dd7-9ef5-e2a5f36895b9	e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	t	${role_manage-account}	manage-account	master	e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	\N
88ec8d7c-7cbc-420d-8ab5-7535d4b26f97	e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	t	${role_manage-account-links}	manage-account-links	master	e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	\N
0d99f049-825d-4b84-a4f4-d92b8fec5827	e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	t	${role_view-applications}	view-applications	master	e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	\N
488e4316-0dc2-4c43-9474-31d84a282c84	e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	t	${role_view-consent}	view-consent	master	e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	\N
c0050153-1764-4023-9ce6-ef0dba4c8711	e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	t	${role_manage-consent}	manage-consent	master	e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	\N
00d36112-c629-443c-accd-acec9241437e	e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	t	${role_delete-account}	delete-account	master	e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	\N
1f61c09b-d32f-4ab4-8795-0e1480a3b0aa	3f3cf5f1-2598-41ce-abb9-2f1fa15bc8d0	t	${role_read-token}	read-token	master	3f3cf5f1-2598-41ce-abb9-2f1fa15bc8d0	\N
aded1176-074a-4cf1-a9fe-17f01f6ed95b	99ef1033-fe12-4820-9069-f08ef89fcd1a	t	${role_impersonation}	impersonation	master	99ef1033-fe12-4820-9069-f08ef89fcd1a	\N
b3a680e4-0e86-4b05-ab5b-649314ab6b61	master	f	${role_offline-access}	offline_access	master	\N	\N
1a2abfe9-b1a9-40ee-8eb1-93f7373fc280	master	f	${role_uma_authorization}	uma_authorization	master	\N	\N
cb4c5d64-7023-48d5-93d6-3f63bff0111e	idp1	f	${role_default-roles}	default-roles-idp1	idp1	\N	\N
c1920118-66a3-4763-956a-55d67dee536f	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_create-client}	create-client	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
b5b36764-26de-409b-bb75-d9e7c940e3ee	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_view-realm}	view-realm	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
f56ad518-6189-4452-a47d-e612c6bd4b6d	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_view-users}	view-users	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
a1a28a53-fc05-49c3-9f6b-98a63f723be6	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_view-clients}	view-clients	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
bf97e54d-663b-42c0-8244-37d1414f7043	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_view-events}	view-events	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
5eae02a3-9f69-429f-be6f-27b23cfb4a06	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_view-identity-providers}	view-identity-providers	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
04966c2a-96c5-4739-b293-7213900fd480	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_view-authorization}	view-authorization	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
279d9f0e-f028-4269-a0f7-4a934671ff5d	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_manage-realm}	manage-realm	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
d6601946-f90e-4071-be79-244e790a0180	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_manage-users}	manage-users	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
3ee2f8eb-4b0c-4029-86bc-caf2840913a6	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_manage-clients}	manage-clients	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
44f56580-4264-44f8-b387-bdd2fd3ae32c	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_manage-events}	manage-events	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
399fb6db-e5cb-4e17-ac31-8740a78f30b2	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_manage-identity-providers}	manage-identity-providers	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
36c17efb-8bdf-4ac7-a1ed-f538c710abe6	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_manage-authorization}	manage-authorization	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
2754ef57-9963-452c-b218-628ec0bf3e4d	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_query-users}	query-users	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
51fe83f7-45c6-46da-bdca-67d1dbf874f7	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_query-clients}	query-clients	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
9dd94d5a-95a1-4d80-bac2-4179e7171146	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_query-realms}	query-realms	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
7e6ad334-ebea-4ed0-9b39-b28e5364d8cb	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_query-groups}	query-groups	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
3a46d629-3936-42a7-a3ec-fa392c4b11e5	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_realm-admin}	realm-admin	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
05c03329-126b-4fcc-9607-42ab4abed25b	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_create-client}	create-client	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
158af3da-a08f-418d-83d3-f425ffceb9b1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_view-realm}	view-realm	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
9964bc9d-1678-4922-a856-315c13945a42	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_view-users}	view-users	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
065f9004-19a5-42ff-8d52-4a41485adc6a	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_view-clients}	view-clients	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
864d2575-6d41-47d2-b063-8a0a3a98aef5	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_view-events}	view-events	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
4d882a25-a021-4eda-a685-4e64cc8e59e2	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_view-identity-providers}	view-identity-providers	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
7354f7b2-2270-4a21-8560-ccf50be46d13	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_view-authorization}	view-authorization	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
ab9aaa6a-df1c-43e7-b549-38d83c12a24c	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_manage-realm}	manage-realm	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
5b2130d5-59a4-47cf-a82b-44aae4d421ea	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_manage-users}	manage-users	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
0024cc34-a701-469d-88e7-c3dcecfee6a3	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_manage-clients}	manage-clients	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
cfca0e46-bc67-45fb-b73e-02a29676fd7c	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_manage-events}	manage-events	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
00cc884e-d0fe-4d2a-8478-e39dcbb3c5db	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_manage-identity-providers}	manage-identity-providers	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
96ab3336-9a54-4a73-acd1-10b9484a8e40	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_manage-authorization}	manage-authorization	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
63ea9d91-49b2-4255-99de-e40e2e99f603	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_query-users}	query-users	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
3ee319f4-b301-43d8-bfdb-3912e280f34b	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_query-clients}	query-clients	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
676637df-e1ce-47a4-9103-b33055b48f64	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_query-realms}	query-realms	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
2755edc8-eb43-43ea-95ac-4678514b8b49	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_query-groups}	query-groups	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
18bccc28-4216-4d80-83a0-02d61ce43d20	cba5cd0d-1e50-4b56-adc0-2ec111f848a1	t	${role_view-profile}	view-profile	idp1	cba5cd0d-1e50-4b56-adc0-2ec111f848a1	\N
e65ce79c-8502-4096-88af-944767df37ae	cba5cd0d-1e50-4b56-adc0-2ec111f848a1	t	${role_manage-account}	manage-account	idp1	cba5cd0d-1e50-4b56-adc0-2ec111f848a1	\N
4db70061-2bb2-40cb-a2c0-d33334c03adb	cba5cd0d-1e50-4b56-adc0-2ec111f848a1	t	${role_manage-account-links}	manage-account-links	idp1	cba5cd0d-1e50-4b56-adc0-2ec111f848a1	\N
5750d567-a8d4-4e91-8141-53ec453f8531	cba5cd0d-1e50-4b56-adc0-2ec111f848a1	t	${role_view-applications}	view-applications	idp1	cba5cd0d-1e50-4b56-adc0-2ec111f848a1	\N
89f66d57-514a-49c8-b645-7888c79abf57	cba5cd0d-1e50-4b56-adc0-2ec111f848a1	t	${role_view-consent}	view-consent	idp1	cba5cd0d-1e50-4b56-adc0-2ec111f848a1	\N
c96f0377-e677-481b-88f4-c25e4c56ea35	cba5cd0d-1e50-4b56-adc0-2ec111f848a1	t	${role_manage-consent}	manage-consent	idp1	cba5cd0d-1e50-4b56-adc0-2ec111f848a1	\N
e8871093-5f8d-4649-8124-dca36123a8f6	cba5cd0d-1e50-4b56-adc0-2ec111f848a1	t	${role_delete-account}	delete-account	idp1	cba5cd0d-1e50-4b56-adc0-2ec111f848a1	\N
7be8b12e-f383-4a57-ba6b-f9d10aeebcdc	350c8e59-0892-4bd1-93a7-90e8e7907108	t	${role_impersonation}	impersonation	master	350c8e59-0892-4bd1-93a7-90e8e7907108	\N
3448f311-b1d3-49a0-8e0c-ae6559a587b3	f8c2e970-10a1-4457-b3ca-48e1ad88d646	t	${role_impersonation}	impersonation	idp1	f8c2e970-10a1-4457-b3ca-48e1ad88d646	\N
ba519b92-fad0-4595-b449-d87f1044a065	1a5c1598-7e09-43ee-a194-6bf6baef32ea	t	${role_read-token}	read-token	idp1	1a5c1598-7e09-43ee-a194-6bf6baef32ea	\N
adbfcc74-f8d0-4c01-8fc6-41fe03551b3e	idp1	f	${role_offline-access}	offline_access	idp1	\N	\N
b58450e4-db19-4a5f-8c73-ea5650ee7ebc	idp1	f	${role_uma_authorization}	uma_authorization	idp1	\N	\N
0a60b261-fcaf-4d0c-b26d-d6297abbd6cd	idp2	f	${role_default-roles}	default-roles-idp2	idp2	\N	\N
c0061df0-7944-4e94-bd24-8a1607b591cf	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_create-client}	create-client	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
e5298cbe-bb78-4e2b-b7fe-4bc019ba58c3	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_view-realm}	view-realm	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
66b8ceaf-05e3-4ab6-bd03-913eed39cc80	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_view-users}	view-users	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
f471661a-ae0e-487d-9a12-06c03b07448d	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_view-clients}	view-clients	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
771cf602-5543-46a9-891d-3e0536b18455	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_view-events}	view-events	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
f8095801-f7ef-4634-8786-4e4fda2bbc8f	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_view-identity-providers}	view-identity-providers	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
5d55e37d-b3d3-45f9-98c4-a31d43e280f2	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_view-authorization}	view-authorization	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
1adbb3cb-fe7e-40e9-8e37-7bcb36a28526	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_manage-realm}	manage-realm	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
3a0bc9ec-2be8-4ed4-8cb4-d7e047d77fa6	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_manage-users}	manage-users	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
e3d11ee6-66df-4c90-8e45-8386f256ec7f	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_manage-clients}	manage-clients	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
ca0b13fd-1ad0-4cae-8c32-5fadba3bfde2	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_manage-events}	manage-events	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
b194978c-78c4-40aa-9884-52e54484e2df	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_manage-identity-providers}	manage-identity-providers	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
7a754049-d964-43f1-b89c-498c0e3eb0db	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_manage-authorization}	manage-authorization	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
663ee0d8-6c92-4b61-9426-0a3a83f93160	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_query-users}	query-users	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
73a48b58-5ad2-4ba0-b8fb-0d1d4fde3f6e	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_query-clients}	query-clients	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
680e748d-76ff-4556-9beb-31309c10a3ce	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_query-realms}	query-realms	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
7797edc4-1757-4f6f-8f8d-d5c3b2a8f6fe	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_query-groups}	query-groups	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
a0eba644-2519-4189-bbd6-903d28bb7153	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_realm-admin}	realm-admin	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
44209110-201a-4a64-b9d9-d779f3e24136	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_create-client}	create-client	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
7b0c2663-8da8-4c13-abb8-e17b8b589359	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_view-realm}	view-realm	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
0b76a757-1cbc-4621-9524-84aa828df396	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_view-users}	view-users	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
73f84d43-9f20-4997-bbc3-5c589ddf53f3	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_view-clients}	view-clients	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
5a75b912-dffa-4dac-a16e-c2c90e3220d6	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_view-events}	view-events	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
4940d6c1-e80a-4f10-b7b5-aa6900a2b87e	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_view-identity-providers}	view-identity-providers	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
b0032cc1-9855-4cc8-8365-ed328a68fbe2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_view-authorization}	view-authorization	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
f0e71220-d2b6-4b15-8702-9a24b13ee6eb	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_manage-realm}	manage-realm	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
f266283f-f79b-45c8-8757-72841d8652cc	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_manage-users}	manage-users	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
0956e0b2-ee53-414a-a095-d42c2aa4003c	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_manage-clients}	manage-clients	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
d7d488fa-2e25-4840-a92c-520a71a6aab5	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_manage-events}	manage-events	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
49b3a210-1982-475f-b40d-c85b4cbd3e45	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_manage-identity-providers}	manage-identity-providers	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
d979df36-09ad-4a23-85ed-b9d9cd46af61	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_manage-authorization}	manage-authorization	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
2b78070e-906a-4acd-9e7e-8bca710f8f69	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_query-users}	query-users	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
09d60ee4-6344-4496-8978-86f22f644623	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_query-clients}	query-clients	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
31b3dea8-9d7c-4ab3-acb0-571efc3506cd	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_query-realms}	query-realms	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
3a1a8ee2-8311-4dbe-a45a-c269d58906be	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_query-groups}	query-groups	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
bcee3684-cc14-4b87-b674-0e08050a2e36	0930b3c3-b0ea-46db-b765-c02775579f10	t	${role_view-profile}	view-profile	idp2	0930b3c3-b0ea-46db-b765-c02775579f10	\N
005d1605-f9b3-4ed8-b6aa-d5ca96155b89	0930b3c3-b0ea-46db-b765-c02775579f10	t	${role_manage-account}	manage-account	idp2	0930b3c3-b0ea-46db-b765-c02775579f10	\N
03777b96-430d-4be6-8fc9-930d780f92ed	0930b3c3-b0ea-46db-b765-c02775579f10	t	${role_manage-account-links}	manage-account-links	idp2	0930b3c3-b0ea-46db-b765-c02775579f10	\N
15f94c2a-828d-4499-bf3d-0d329f5d9e1e	0930b3c3-b0ea-46db-b765-c02775579f10	t	${role_view-applications}	view-applications	idp2	0930b3c3-b0ea-46db-b765-c02775579f10	\N
a84ee3f9-bded-4622-9b87-c5656afc904d	0930b3c3-b0ea-46db-b765-c02775579f10	t	${role_view-consent}	view-consent	idp2	0930b3c3-b0ea-46db-b765-c02775579f10	\N
26397318-3a3f-410e-820a-7744c078a969	0930b3c3-b0ea-46db-b765-c02775579f10	t	${role_manage-consent}	manage-consent	idp2	0930b3c3-b0ea-46db-b765-c02775579f10	\N
3f716d41-ebb2-48b1-9441-25705e3a1743	0930b3c3-b0ea-46db-b765-c02775579f10	t	${role_delete-account}	delete-account	idp2	0930b3c3-b0ea-46db-b765-c02775579f10	\N
ece0c32c-9f1c-48f0-aef0-160263330bbd	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	t	${role_impersonation}	impersonation	master	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	\N
5a6e443b-5fcb-4431-a5d5-bf099917095c	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	t	${role_impersonation}	impersonation	idp2	8139e82a-d239-4fbc-a1ad-effd5e4c4b1a	\N
aa4b8c28-3290-4adb-8011-16b4d4d0cb46	00c6faa8-d259-4fdd-bfc8-d8649b362f82	t	${role_read-token}	read-token	idp2	00c6faa8-d259-4fdd-bfc8-d8649b362f82	\N
cacd76c8-c52f-4300-97f1-938f0184bf36	idp2	f	${role_offline-access}	offline_access	idp2	\N	\N
0f2588be-626c-4ecd-a730-c8cbbe2de29d	idp2	f	${role_uma_authorization}	uma_authorization	idp2	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.migration_model (id, version, update_time) FROM stdin;
yvr70	16.1.1	1648455287
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
d2dff0a7-10e8-4bfe-a702-b787019d1337	audience resolve	openid-connect	oidc-audience-resolve-mapper	70c8782b-daf7-47a3-8158-967fb3136ce8	\N
c9aee7ec-5354-4cf5-83cd-f8d0257341be	locale	openid-connect	oidc-usermodel-attribute-mapper	62f0b9a7-6ca2-4cd8-9630-116e3c8e0aab	\N
f56d60a3-4dfe-41b8-8d84-462d0944a9de	role list	saml	saml-role-list-mapper	\N	0c8c1fa5-b26d-43c7-8173-e779e8319278
61b5c444-4a95-4d55-a47b-1e586f4981ce	full name	openid-connect	oidc-full-name-mapper	\N	72fbe764-b192-463e-992b-ee50971b9a5a
ef70fb8e-0a53-4064-a6ba-03ed0028a827	family name	openid-connect	oidc-usermodel-property-mapper	\N	72fbe764-b192-463e-992b-ee50971b9a5a
6e25c841-a625-48cd-a5af-cf6062d8c5fb	given name	openid-connect	oidc-usermodel-property-mapper	\N	72fbe764-b192-463e-992b-ee50971b9a5a
05864d0c-0909-4d12-a5f6-890dd4e77405	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	72fbe764-b192-463e-992b-ee50971b9a5a
4f97fc24-cb6f-43c3-a991-bad5b3394afa	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	72fbe764-b192-463e-992b-ee50971b9a5a
a5f6bce5-b33a-47ba-94d1-c49ff17d2afd	username	openid-connect	oidc-usermodel-property-mapper	\N	72fbe764-b192-463e-992b-ee50971b9a5a
1e1e364e-7fef-41fb-882e-c12a3ab814ca	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	72fbe764-b192-463e-992b-ee50971b9a5a
af6428b8-18ee-4508-8c3e-99b2463b0b93	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	72fbe764-b192-463e-992b-ee50971b9a5a
19499609-798d-4d72-8e1c-19233e7dc52f	website	openid-connect	oidc-usermodel-attribute-mapper	\N	72fbe764-b192-463e-992b-ee50971b9a5a
2f65943c-d110-414e-966c-92d5b5609a40	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	72fbe764-b192-463e-992b-ee50971b9a5a
71099ef8-d30a-4e5b-bb52-b7dee87432be	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	72fbe764-b192-463e-992b-ee50971b9a5a
6a195db0-eb19-4e4c-8f06-a1ac0da98b9a	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	72fbe764-b192-463e-992b-ee50971b9a5a
a8651c1f-6227-4ba2-98bc-c29cf53bda2e	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	72fbe764-b192-463e-992b-ee50971b9a5a
97e1b613-12c0-494d-88b7-11a0a1acb888	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	72fbe764-b192-463e-992b-ee50971b9a5a
4c977c62-8eba-419f-9682-b958a43a9157	email	openid-connect	oidc-usermodel-property-mapper	\N	3d7c7e6d-e8f2-4d0e-ba63-1ee879299964
b055710e-f386-49bb-a388-d9c324f7eb16	email verified	openid-connect	oidc-usermodel-property-mapper	\N	3d7c7e6d-e8f2-4d0e-ba63-1ee879299964
b89f6e71-687b-41d8-bf1c-eed1caa8d9f9	address	openid-connect	oidc-address-mapper	\N	ab36e86d-028d-4c3c-b626-a58c855ab0f0
2d1537f8-6bb5-486d-97b3-0a33d8dc924c	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	92d99ca8-0faa-4df6-aecb-ec264afc1a08
7da6b0e6-648e-4bf9-9e26-ca5ae3473376	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	92d99ca8-0faa-4df6-aecb-ec264afc1a08
c32ed695-051f-4f6e-9c0b-6b8e08d06e48	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	7d35c604-2bf0-41fb-9e0a-84721050d48f
36611335-6675-428c-a3da-c49527929d30	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	7d35c604-2bf0-41fb-9e0a-84721050d48f
7c3da4ee-673c-4661-af74-ee16808cbdc5	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	7d35c604-2bf0-41fb-9e0a-84721050d48f
69b050a9-b725-40c2-898f-459cc7353f7a	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	a92ad0e3-298b-4c29-b026-bfbc23e550e4
d6f08844-a495-4636-854a-b79f035a7ada	upn	openid-connect	oidc-usermodel-property-mapper	\N	3750c622-b41b-40fb-9129-9fe4a5928591
42449315-6b6d-4ce1-a0f5-11b0837fd6c4	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	3750c622-b41b-40fb-9129-9fe4a5928591
24824a93-da7a-4d67-8d02-9b8305668042	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	38f342fe-a164-4928-94ce-86c2ff574f2c	\N
1455ed53-98ea-47f9-8dd2-40bad12232a5	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	38f342fe-a164-4928-94ce-86c2ff574f2c	\N
79a51e77-0717-4a1b-ae23-2b98cf92cb96	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	38f342fe-a164-4928-94ce-86c2ff574f2c	\N
0cc3c5ba-8053-4c77-8249-da42709e4c27	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	f9ea5e59-8453-4997-9e7a-0524931be1ac	\N
baaa80d1-8afd-46c0-9c3a-5076b7a779da	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	f9ea5e59-8453-4997-9e7a-0524931be1ac	\N
d5bb2a48-b78b-4844-91f7-9087e0f87dc9	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	f9ea5e59-8453-4997-9e7a-0524931be1ac	\N
68322525-2d94-45ee-90fc-01ade524b9fb	audience resolve	openid-connect	oidc-audience-resolve-mapper	a31ff307-fa23-4749-9f0b-ffd3c20a316d	\N
07cc3de9-b447-439d-bcfb-67c81ad5ef88	role list	saml	saml-role-list-mapper	\N	cb31a428-a081-4059-8faf-f0e1e486be88
cc49de35-55f9-45f7-b61f-125c1caa590f	full name	openid-connect	oidc-full-name-mapper	\N	2e84accf-757b-4d3f-bf00-36a7c4541f88
3e2f2e1b-0a01-495c-824c-871eb4dafe3f	family name	openid-connect	oidc-usermodel-property-mapper	\N	2e84accf-757b-4d3f-bf00-36a7c4541f88
2720fdf9-522e-43f2-b8d5-3c9a93a1c628	given name	openid-connect	oidc-usermodel-property-mapper	\N	2e84accf-757b-4d3f-bf00-36a7c4541f88
9543e68d-4252-4011-ba18-5e9e670588f6	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	2e84accf-757b-4d3f-bf00-36a7c4541f88
106fde51-8dba-4fb2-9208-11ed2d823511	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	2e84accf-757b-4d3f-bf00-36a7c4541f88
f3ed9027-e218-4b92-9c1d-dfa632a2c530	username	openid-connect	oidc-usermodel-property-mapper	\N	2e84accf-757b-4d3f-bf00-36a7c4541f88
425a9617-ccfb-42dc-a3fa-7111a569d627	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	2e84accf-757b-4d3f-bf00-36a7c4541f88
b2c99a75-0f98-44c2-8d6b-22cc33675ff3	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	2e84accf-757b-4d3f-bf00-36a7c4541f88
b2d7a900-4a39-41e7-b4d1-0e4cd914c62d	website	openid-connect	oidc-usermodel-attribute-mapper	\N	2e84accf-757b-4d3f-bf00-36a7c4541f88
94c5a28f-dea1-434b-96ca-8a39bc0c7844	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	2e84accf-757b-4d3f-bf00-36a7c4541f88
8c2e28e2-2b03-4c54-b3d2-482c26db86c7	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	2e84accf-757b-4d3f-bf00-36a7c4541f88
dc67cecb-47e8-4f59-8cbd-d8a1809bf8b6	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	2e84accf-757b-4d3f-bf00-36a7c4541f88
64031243-392c-4c14-aaf3-72d4582c03ff	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	2e84accf-757b-4d3f-bf00-36a7c4541f88
5ef24654-2e88-478c-b099-65f7ca8a67fa	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	2e84accf-757b-4d3f-bf00-36a7c4541f88
555e779c-e3e4-45e6-b747-f33b45e5155a	email	openid-connect	oidc-usermodel-property-mapper	\N	121927d8-16f5-46a9-b94a-ff6a9e51ec72
29a2c71e-43dc-465a-8bf2-01886295e71b	email verified	openid-connect	oidc-usermodel-property-mapper	\N	121927d8-16f5-46a9-b94a-ff6a9e51ec72
06966a5f-46fd-4828-ac5b-4d6aea1e64c5	address	openid-connect	oidc-address-mapper	\N	d6ae812a-05a8-4277-b73e-af63f8617a42
ffad6112-debd-41f3-a70f-c72c78c9de93	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	70c95c82-eb6b-4a07-a843-0324cf9f70ea
476c26ea-8cee-416e-a3fb-8a12bed0c473	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	70c95c82-eb6b-4a07-a843-0324cf9f70ea
a8f1ecf8-f4f0-45e9-b29c-204da07094f0	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	6907f50b-922d-4045-a34c-d14f3d3c7312
8f765655-4fe2-4b2b-91aa-4f18eb94982d	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	6907f50b-922d-4045-a34c-d14f3d3c7312
0980858c-fe86-4218-9e53-a12126a6696b	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	6907f50b-922d-4045-a34c-d14f3d3c7312
5376de85-b7dc-404c-be65-af4e11f81d24	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	0d1fa12b-62fa-4328-9f99-e09ef958b664
b3612760-a7e3-44d2-a788-5ae1ca66b198	upn	openid-connect	oidc-usermodel-property-mapper	\N	d408470e-93dc-4dfc-9ad8-06b0d9f97762
76f0fbaf-a85a-4d1a-84ab-35af14f52cab	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	d408470e-93dc-4dfc-9ad8-06b0d9f97762
133e2e60-2817-447d-a060-b4c8ee623bde	locale	openid-connect	oidc-usermodel-attribute-mapper	3c3326af-8f11-44c7-9e23-7876c3142a3f	\N
ceb4d470-ab7e-4534-a93a-5bd5d3ffa668	audience resolve	openid-connect	oidc-audience-resolve-mapper	fd0a3e4a-2997-4975-9752-217d3dede715	\N
aef8ab20-13ba-4b07-940b-e7ccf32d9668	role list	saml	saml-role-list-mapper	\N	9cbd6416-1106-4948-8efc-12fa442e408f
40f170fa-dd61-4d83-b5dc-62df3377c5c9	full name	openid-connect	oidc-full-name-mapper	\N	73f21ff8-9f52-4014-9ad2-a5543278ece0
9a400e00-3c16-410a-83ed-68e93a8b7845	family name	openid-connect	oidc-usermodel-property-mapper	\N	73f21ff8-9f52-4014-9ad2-a5543278ece0
93703063-38ba-4fa5-baf2-6e816bec88e6	given name	openid-connect	oidc-usermodel-property-mapper	\N	73f21ff8-9f52-4014-9ad2-a5543278ece0
c2182aa0-4f3b-4a44-8bcd-22e07f13b32e	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	73f21ff8-9f52-4014-9ad2-a5543278ece0
090b630e-af55-4586-b30f-d9cb2124fe42	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	73f21ff8-9f52-4014-9ad2-a5543278ece0
72563bce-036e-4d04-8e67-7f9682a5b72c	username	openid-connect	oidc-usermodel-property-mapper	\N	73f21ff8-9f52-4014-9ad2-a5543278ece0
303982a8-4160-4aa8-93d5-9fb6e2889068	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	73f21ff8-9f52-4014-9ad2-a5543278ece0
497ab698-5c40-4ab5-ac77-b39c9cbc3fc1	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	73f21ff8-9f52-4014-9ad2-a5543278ece0
e1026d21-fbf9-4a4e-a1aa-280106c2e02d	website	openid-connect	oidc-usermodel-attribute-mapper	\N	73f21ff8-9f52-4014-9ad2-a5543278ece0
3e06bd3a-cc73-4c2e-8867-32076d5cae9c	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	73f21ff8-9f52-4014-9ad2-a5543278ece0
c2acf7e1-c381-49ba-a102-b711ee372f94	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	73f21ff8-9f52-4014-9ad2-a5543278ece0
38b29b0c-866f-4d02-baf3-15dab50865b3	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	73f21ff8-9f52-4014-9ad2-a5543278ece0
1c1a1a19-9d64-435d-8c0d-429b3fb1319e	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	73f21ff8-9f52-4014-9ad2-a5543278ece0
1072bddc-2827-4033-9e2c-57b72fcf16bc	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	73f21ff8-9f52-4014-9ad2-a5543278ece0
3a35669e-5ae4-4117-8764-0b39764c51ba	email	openid-connect	oidc-usermodel-property-mapper	\N	86c6d9cb-e044-4938-a92d-7ea6efc972a8
18e46646-606e-4ef2-8516-d11de95f2172	email verified	openid-connect	oidc-usermodel-property-mapper	\N	86c6d9cb-e044-4938-a92d-7ea6efc972a8
aea153ce-1961-42af-a7c0-2abe5b6f5095	address	openid-connect	oidc-address-mapper	\N	4784e596-acbe-42bb-8887-09a7bc21eadd
10635df3-9358-4156-960d-481f5f909e5d	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	0b573c62-d03f-4bdd-ad9d-05950d11ebdf
fc954288-74fd-4004-a9d8-acd7bbb8b784	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	0b573c62-d03f-4bdd-ad9d-05950d11ebdf
1f338651-9516-4449-abf5-071dbad340ef	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	ab217cca-28e9-43c0-a419-298aee0c435f
59a896b8-80df-4ecb-864e-ae6e47bc3f0e	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	ab217cca-28e9-43c0-a419-298aee0c435f
88924a41-a685-44a6-97bc-68e0db6549fd	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	ab217cca-28e9-43c0-a419-298aee0c435f
2a706d06-68aa-4989-a0b2-88e176a69da3	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	48f9943c-94cb-47bb-ac74-3f643990aeab
b9651a04-65a7-465b-8c37-dd8b739496c1	upn	openid-connect	oidc-usermodel-property-mapper	\N	1b5f828d-701d-49ea-a9da-b1c83606240d
7081204e-3261-4b41-b489-2031b02790bc	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	1b5f828d-701d-49ea-a9da-b1c83606240d
98da81ac-c6fe-413e-9a79-ec17dfc5d830	locale	openid-connect	oidc-usermodel-attribute-mapper	28bff4e7-9868-486d-93ae-374994b60819	\N
eb3a5951-4e92-40a4-8f51-59a1ab92245f	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	503fd407-6e27-47a9-8001-97e53892cc0a	\N
47e3901d-b9e8-4d8a-92ee-064476554394	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	503fd407-6e27-47a9-8001-97e53892cc0a	\N
f61033d5-14f0-42f3-8c07-d4dddffcd4d8	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	503fd407-6e27-47a9-8001-97e53892cc0a	\N
472651d9-ec42-44c1-9817-05a2bb373b90	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	19324db5-81e8-4b25-8f67-a085e8fd6222	\N
2a1a9214-65ba-4288-abbb-37cdc1e06460	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	19324db5-81e8-4b25-8f67-a085e8fd6222	\N
f4ba15d0-c9f7-42a4-90e0-aa723796d851	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	19324db5-81e8-4b25-8f67-a085e8fd6222	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
c9aee7ec-5354-4cf5-83cd-f8d0257341be	true	userinfo.token.claim
c9aee7ec-5354-4cf5-83cd-f8d0257341be	locale	user.attribute
c9aee7ec-5354-4cf5-83cd-f8d0257341be	true	id.token.claim
c9aee7ec-5354-4cf5-83cd-f8d0257341be	true	access.token.claim
c9aee7ec-5354-4cf5-83cd-f8d0257341be	locale	claim.name
c9aee7ec-5354-4cf5-83cd-f8d0257341be	String	jsonType.label
f56d60a3-4dfe-41b8-8d84-462d0944a9de	false	single
f56d60a3-4dfe-41b8-8d84-462d0944a9de	Basic	attribute.nameformat
f56d60a3-4dfe-41b8-8d84-462d0944a9de	Role	attribute.name
61b5c444-4a95-4d55-a47b-1e586f4981ce	true	userinfo.token.claim
61b5c444-4a95-4d55-a47b-1e586f4981ce	true	id.token.claim
61b5c444-4a95-4d55-a47b-1e586f4981ce	true	access.token.claim
ef70fb8e-0a53-4064-a6ba-03ed0028a827	true	userinfo.token.claim
ef70fb8e-0a53-4064-a6ba-03ed0028a827	lastName	user.attribute
ef70fb8e-0a53-4064-a6ba-03ed0028a827	true	id.token.claim
ef70fb8e-0a53-4064-a6ba-03ed0028a827	true	access.token.claim
ef70fb8e-0a53-4064-a6ba-03ed0028a827	family_name	claim.name
ef70fb8e-0a53-4064-a6ba-03ed0028a827	String	jsonType.label
6e25c841-a625-48cd-a5af-cf6062d8c5fb	true	userinfo.token.claim
6e25c841-a625-48cd-a5af-cf6062d8c5fb	firstName	user.attribute
6e25c841-a625-48cd-a5af-cf6062d8c5fb	true	id.token.claim
6e25c841-a625-48cd-a5af-cf6062d8c5fb	true	access.token.claim
6e25c841-a625-48cd-a5af-cf6062d8c5fb	given_name	claim.name
6e25c841-a625-48cd-a5af-cf6062d8c5fb	String	jsonType.label
05864d0c-0909-4d12-a5f6-890dd4e77405	true	userinfo.token.claim
05864d0c-0909-4d12-a5f6-890dd4e77405	middleName	user.attribute
05864d0c-0909-4d12-a5f6-890dd4e77405	true	id.token.claim
05864d0c-0909-4d12-a5f6-890dd4e77405	true	access.token.claim
05864d0c-0909-4d12-a5f6-890dd4e77405	middle_name	claim.name
05864d0c-0909-4d12-a5f6-890dd4e77405	String	jsonType.label
4f97fc24-cb6f-43c3-a991-bad5b3394afa	true	userinfo.token.claim
4f97fc24-cb6f-43c3-a991-bad5b3394afa	nickname	user.attribute
4f97fc24-cb6f-43c3-a991-bad5b3394afa	true	id.token.claim
4f97fc24-cb6f-43c3-a991-bad5b3394afa	true	access.token.claim
4f97fc24-cb6f-43c3-a991-bad5b3394afa	nickname	claim.name
4f97fc24-cb6f-43c3-a991-bad5b3394afa	String	jsonType.label
a5f6bce5-b33a-47ba-94d1-c49ff17d2afd	true	userinfo.token.claim
a5f6bce5-b33a-47ba-94d1-c49ff17d2afd	username	user.attribute
a5f6bce5-b33a-47ba-94d1-c49ff17d2afd	true	id.token.claim
a5f6bce5-b33a-47ba-94d1-c49ff17d2afd	true	access.token.claim
a5f6bce5-b33a-47ba-94d1-c49ff17d2afd	preferred_username	claim.name
a5f6bce5-b33a-47ba-94d1-c49ff17d2afd	String	jsonType.label
1e1e364e-7fef-41fb-882e-c12a3ab814ca	true	userinfo.token.claim
1e1e364e-7fef-41fb-882e-c12a3ab814ca	profile	user.attribute
1e1e364e-7fef-41fb-882e-c12a3ab814ca	true	id.token.claim
1e1e364e-7fef-41fb-882e-c12a3ab814ca	true	access.token.claim
1e1e364e-7fef-41fb-882e-c12a3ab814ca	profile	claim.name
1e1e364e-7fef-41fb-882e-c12a3ab814ca	String	jsonType.label
af6428b8-18ee-4508-8c3e-99b2463b0b93	true	userinfo.token.claim
af6428b8-18ee-4508-8c3e-99b2463b0b93	picture	user.attribute
af6428b8-18ee-4508-8c3e-99b2463b0b93	true	id.token.claim
af6428b8-18ee-4508-8c3e-99b2463b0b93	true	access.token.claim
af6428b8-18ee-4508-8c3e-99b2463b0b93	picture	claim.name
af6428b8-18ee-4508-8c3e-99b2463b0b93	String	jsonType.label
19499609-798d-4d72-8e1c-19233e7dc52f	true	userinfo.token.claim
19499609-798d-4d72-8e1c-19233e7dc52f	website	user.attribute
19499609-798d-4d72-8e1c-19233e7dc52f	true	id.token.claim
19499609-798d-4d72-8e1c-19233e7dc52f	true	access.token.claim
19499609-798d-4d72-8e1c-19233e7dc52f	website	claim.name
19499609-798d-4d72-8e1c-19233e7dc52f	String	jsonType.label
2f65943c-d110-414e-966c-92d5b5609a40	true	userinfo.token.claim
2f65943c-d110-414e-966c-92d5b5609a40	gender	user.attribute
2f65943c-d110-414e-966c-92d5b5609a40	true	id.token.claim
2f65943c-d110-414e-966c-92d5b5609a40	true	access.token.claim
2f65943c-d110-414e-966c-92d5b5609a40	gender	claim.name
2f65943c-d110-414e-966c-92d5b5609a40	String	jsonType.label
71099ef8-d30a-4e5b-bb52-b7dee87432be	true	userinfo.token.claim
71099ef8-d30a-4e5b-bb52-b7dee87432be	birthdate	user.attribute
71099ef8-d30a-4e5b-bb52-b7dee87432be	true	id.token.claim
71099ef8-d30a-4e5b-bb52-b7dee87432be	true	access.token.claim
71099ef8-d30a-4e5b-bb52-b7dee87432be	birthdate	claim.name
71099ef8-d30a-4e5b-bb52-b7dee87432be	String	jsonType.label
6a195db0-eb19-4e4c-8f06-a1ac0da98b9a	true	userinfo.token.claim
6a195db0-eb19-4e4c-8f06-a1ac0da98b9a	zoneinfo	user.attribute
6a195db0-eb19-4e4c-8f06-a1ac0da98b9a	true	id.token.claim
6a195db0-eb19-4e4c-8f06-a1ac0da98b9a	true	access.token.claim
6a195db0-eb19-4e4c-8f06-a1ac0da98b9a	zoneinfo	claim.name
6a195db0-eb19-4e4c-8f06-a1ac0da98b9a	String	jsonType.label
a8651c1f-6227-4ba2-98bc-c29cf53bda2e	true	userinfo.token.claim
a8651c1f-6227-4ba2-98bc-c29cf53bda2e	locale	user.attribute
a8651c1f-6227-4ba2-98bc-c29cf53bda2e	true	id.token.claim
a8651c1f-6227-4ba2-98bc-c29cf53bda2e	true	access.token.claim
a8651c1f-6227-4ba2-98bc-c29cf53bda2e	locale	claim.name
a8651c1f-6227-4ba2-98bc-c29cf53bda2e	String	jsonType.label
97e1b613-12c0-494d-88b7-11a0a1acb888	true	userinfo.token.claim
97e1b613-12c0-494d-88b7-11a0a1acb888	updatedAt	user.attribute
97e1b613-12c0-494d-88b7-11a0a1acb888	true	id.token.claim
97e1b613-12c0-494d-88b7-11a0a1acb888	true	access.token.claim
97e1b613-12c0-494d-88b7-11a0a1acb888	updated_at	claim.name
97e1b613-12c0-494d-88b7-11a0a1acb888	String	jsonType.label
4c977c62-8eba-419f-9682-b958a43a9157	true	userinfo.token.claim
4c977c62-8eba-419f-9682-b958a43a9157	email	user.attribute
4c977c62-8eba-419f-9682-b958a43a9157	true	id.token.claim
4c977c62-8eba-419f-9682-b958a43a9157	true	access.token.claim
4c977c62-8eba-419f-9682-b958a43a9157	email	claim.name
4c977c62-8eba-419f-9682-b958a43a9157	String	jsonType.label
b055710e-f386-49bb-a388-d9c324f7eb16	true	userinfo.token.claim
b055710e-f386-49bb-a388-d9c324f7eb16	emailVerified	user.attribute
b055710e-f386-49bb-a388-d9c324f7eb16	true	id.token.claim
b055710e-f386-49bb-a388-d9c324f7eb16	true	access.token.claim
b055710e-f386-49bb-a388-d9c324f7eb16	email_verified	claim.name
b055710e-f386-49bb-a388-d9c324f7eb16	boolean	jsonType.label
b89f6e71-687b-41d8-bf1c-eed1caa8d9f9	formatted	user.attribute.formatted
b89f6e71-687b-41d8-bf1c-eed1caa8d9f9	country	user.attribute.country
b89f6e71-687b-41d8-bf1c-eed1caa8d9f9	postal_code	user.attribute.postal_code
b89f6e71-687b-41d8-bf1c-eed1caa8d9f9	true	userinfo.token.claim
b89f6e71-687b-41d8-bf1c-eed1caa8d9f9	street	user.attribute.street
b89f6e71-687b-41d8-bf1c-eed1caa8d9f9	true	id.token.claim
b89f6e71-687b-41d8-bf1c-eed1caa8d9f9	region	user.attribute.region
b89f6e71-687b-41d8-bf1c-eed1caa8d9f9	true	access.token.claim
b89f6e71-687b-41d8-bf1c-eed1caa8d9f9	locality	user.attribute.locality
2d1537f8-6bb5-486d-97b3-0a33d8dc924c	true	userinfo.token.claim
2d1537f8-6bb5-486d-97b3-0a33d8dc924c	phoneNumber	user.attribute
2d1537f8-6bb5-486d-97b3-0a33d8dc924c	true	id.token.claim
2d1537f8-6bb5-486d-97b3-0a33d8dc924c	true	access.token.claim
2d1537f8-6bb5-486d-97b3-0a33d8dc924c	phone_number	claim.name
2d1537f8-6bb5-486d-97b3-0a33d8dc924c	String	jsonType.label
7da6b0e6-648e-4bf9-9e26-ca5ae3473376	true	userinfo.token.claim
7da6b0e6-648e-4bf9-9e26-ca5ae3473376	phoneNumberVerified	user.attribute
7da6b0e6-648e-4bf9-9e26-ca5ae3473376	true	id.token.claim
7da6b0e6-648e-4bf9-9e26-ca5ae3473376	true	access.token.claim
7da6b0e6-648e-4bf9-9e26-ca5ae3473376	phone_number_verified	claim.name
7da6b0e6-648e-4bf9-9e26-ca5ae3473376	boolean	jsonType.label
c32ed695-051f-4f6e-9c0b-6b8e08d06e48	true	multivalued
c32ed695-051f-4f6e-9c0b-6b8e08d06e48	foo	user.attribute
c32ed695-051f-4f6e-9c0b-6b8e08d06e48	true	access.token.claim
c32ed695-051f-4f6e-9c0b-6b8e08d06e48	realm_access.roles	claim.name
c32ed695-051f-4f6e-9c0b-6b8e08d06e48	String	jsonType.label
36611335-6675-428c-a3da-c49527929d30	true	multivalued
36611335-6675-428c-a3da-c49527929d30	foo	user.attribute
36611335-6675-428c-a3da-c49527929d30	true	access.token.claim
36611335-6675-428c-a3da-c49527929d30	resource_access.${client_id}.roles	claim.name
36611335-6675-428c-a3da-c49527929d30	String	jsonType.label
d6f08844-a495-4636-854a-b79f035a7ada	true	userinfo.token.claim
d6f08844-a495-4636-854a-b79f035a7ada	username	user.attribute
d6f08844-a495-4636-854a-b79f035a7ada	true	id.token.claim
d6f08844-a495-4636-854a-b79f035a7ada	true	access.token.claim
d6f08844-a495-4636-854a-b79f035a7ada	upn	claim.name
d6f08844-a495-4636-854a-b79f035a7ada	String	jsonType.label
42449315-6b6d-4ce1-a0f5-11b0837fd6c4	true	multivalued
42449315-6b6d-4ce1-a0f5-11b0837fd6c4	foo	user.attribute
42449315-6b6d-4ce1-a0f5-11b0837fd6c4	true	id.token.claim
42449315-6b6d-4ce1-a0f5-11b0837fd6c4	true	access.token.claim
42449315-6b6d-4ce1-a0f5-11b0837fd6c4	groups	claim.name
42449315-6b6d-4ce1-a0f5-11b0837fd6c4	String	jsonType.label
24824a93-da7a-4d67-8d02-9b8305668042	clientId	user.session.note
24824a93-da7a-4d67-8d02-9b8305668042	true	id.token.claim
24824a93-da7a-4d67-8d02-9b8305668042	true	access.token.claim
24824a93-da7a-4d67-8d02-9b8305668042	clientId	claim.name
24824a93-da7a-4d67-8d02-9b8305668042	String	jsonType.label
1455ed53-98ea-47f9-8dd2-40bad12232a5	clientHost	user.session.note
1455ed53-98ea-47f9-8dd2-40bad12232a5	true	id.token.claim
1455ed53-98ea-47f9-8dd2-40bad12232a5	true	access.token.claim
1455ed53-98ea-47f9-8dd2-40bad12232a5	clientHost	claim.name
1455ed53-98ea-47f9-8dd2-40bad12232a5	String	jsonType.label
79a51e77-0717-4a1b-ae23-2b98cf92cb96	clientAddress	user.session.note
79a51e77-0717-4a1b-ae23-2b98cf92cb96	true	id.token.claim
79a51e77-0717-4a1b-ae23-2b98cf92cb96	true	access.token.claim
79a51e77-0717-4a1b-ae23-2b98cf92cb96	clientAddress	claim.name
79a51e77-0717-4a1b-ae23-2b98cf92cb96	String	jsonType.label
0cc3c5ba-8053-4c77-8249-da42709e4c27	clientId	user.session.note
0cc3c5ba-8053-4c77-8249-da42709e4c27	true	id.token.claim
0cc3c5ba-8053-4c77-8249-da42709e4c27	true	access.token.claim
0cc3c5ba-8053-4c77-8249-da42709e4c27	clientId	claim.name
0cc3c5ba-8053-4c77-8249-da42709e4c27	String	jsonType.label
baaa80d1-8afd-46c0-9c3a-5076b7a779da	clientHost	user.session.note
baaa80d1-8afd-46c0-9c3a-5076b7a779da	true	id.token.claim
baaa80d1-8afd-46c0-9c3a-5076b7a779da	true	access.token.claim
baaa80d1-8afd-46c0-9c3a-5076b7a779da	clientHost	claim.name
baaa80d1-8afd-46c0-9c3a-5076b7a779da	String	jsonType.label
d5bb2a48-b78b-4844-91f7-9087e0f87dc9	clientAddress	user.session.note
d5bb2a48-b78b-4844-91f7-9087e0f87dc9	true	id.token.claim
d5bb2a48-b78b-4844-91f7-9087e0f87dc9	true	access.token.claim
d5bb2a48-b78b-4844-91f7-9087e0f87dc9	clientAddress	claim.name
d5bb2a48-b78b-4844-91f7-9087e0f87dc9	String	jsonType.label
07cc3de9-b447-439d-bcfb-67c81ad5ef88	false	single
07cc3de9-b447-439d-bcfb-67c81ad5ef88	Basic	attribute.nameformat
07cc3de9-b447-439d-bcfb-67c81ad5ef88	Role	attribute.name
cc49de35-55f9-45f7-b61f-125c1caa590f	true	userinfo.token.claim
cc49de35-55f9-45f7-b61f-125c1caa590f	true	id.token.claim
cc49de35-55f9-45f7-b61f-125c1caa590f	true	access.token.claim
3e2f2e1b-0a01-495c-824c-871eb4dafe3f	true	userinfo.token.claim
3e2f2e1b-0a01-495c-824c-871eb4dafe3f	lastName	user.attribute
3e2f2e1b-0a01-495c-824c-871eb4dafe3f	true	id.token.claim
3e2f2e1b-0a01-495c-824c-871eb4dafe3f	true	access.token.claim
3e2f2e1b-0a01-495c-824c-871eb4dafe3f	family_name	claim.name
3e2f2e1b-0a01-495c-824c-871eb4dafe3f	String	jsonType.label
2720fdf9-522e-43f2-b8d5-3c9a93a1c628	true	userinfo.token.claim
2720fdf9-522e-43f2-b8d5-3c9a93a1c628	firstName	user.attribute
2720fdf9-522e-43f2-b8d5-3c9a93a1c628	true	id.token.claim
2720fdf9-522e-43f2-b8d5-3c9a93a1c628	true	access.token.claim
2720fdf9-522e-43f2-b8d5-3c9a93a1c628	given_name	claim.name
2720fdf9-522e-43f2-b8d5-3c9a93a1c628	String	jsonType.label
9543e68d-4252-4011-ba18-5e9e670588f6	true	userinfo.token.claim
9543e68d-4252-4011-ba18-5e9e670588f6	middleName	user.attribute
9543e68d-4252-4011-ba18-5e9e670588f6	true	id.token.claim
9543e68d-4252-4011-ba18-5e9e670588f6	true	access.token.claim
9543e68d-4252-4011-ba18-5e9e670588f6	middle_name	claim.name
9543e68d-4252-4011-ba18-5e9e670588f6	String	jsonType.label
106fde51-8dba-4fb2-9208-11ed2d823511	true	userinfo.token.claim
106fde51-8dba-4fb2-9208-11ed2d823511	nickname	user.attribute
106fde51-8dba-4fb2-9208-11ed2d823511	true	id.token.claim
106fde51-8dba-4fb2-9208-11ed2d823511	true	access.token.claim
106fde51-8dba-4fb2-9208-11ed2d823511	nickname	claim.name
106fde51-8dba-4fb2-9208-11ed2d823511	String	jsonType.label
f3ed9027-e218-4b92-9c1d-dfa632a2c530	true	userinfo.token.claim
f3ed9027-e218-4b92-9c1d-dfa632a2c530	username	user.attribute
f3ed9027-e218-4b92-9c1d-dfa632a2c530	true	id.token.claim
f3ed9027-e218-4b92-9c1d-dfa632a2c530	true	access.token.claim
f3ed9027-e218-4b92-9c1d-dfa632a2c530	preferred_username	claim.name
f3ed9027-e218-4b92-9c1d-dfa632a2c530	String	jsonType.label
425a9617-ccfb-42dc-a3fa-7111a569d627	true	userinfo.token.claim
425a9617-ccfb-42dc-a3fa-7111a569d627	profile	user.attribute
425a9617-ccfb-42dc-a3fa-7111a569d627	true	id.token.claim
425a9617-ccfb-42dc-a3fa-7111a569d627	true	access.token.claim
425a9617-ccfb-42dc-a3fa-7111a569d627	profile	claim.name
425a9617-ccfb-42dc-a3fa-7111a569d627	String	jsonType.label
b2c99a75-0f98-44c2-8d6b-22cc33675ff3	true	userinfo.token.claim
b2c99a75-0f98-44c2-8d6b-22cc33675ff3	picture	user.attribute
b2c99a75-0f98-44c2-8d6b-22cc33675ff3	true	id.token.claim
b2c99a75-0f98-44c2-8d6b-22cc33675ff3	true	access.token.claim
b2c99a75-0f98-44c2-8d6b-22cc33675ff3	picture	claim.name
b2c99a75-0f98-44c2-8d6b-22cc33675ff3	String	jsonType.label
b2d7a900-4a39-41e7-b4d1-0e4cd914c62d	true	userinfo.token.claim
b2d7a900-4a39-41e7-b4d1-0e4cd914c62d	website	user.attribute
b2d7a900-4a39-41e7-b4d1-0e4cd914c62d	true	id.token.claim
b2d7a900-4a39-41e7-b4d1-0e4cd914c62d	true	access.token.claim
b2d7a900-4a39-41e7-b4d1-0e4cd914c62d	website	claim.name
b2d7a900-4a39-41e7-b4d1-0e4cd914c62d	String	jsonType.label
94c5a28f-dea1-434b-96ca-8a39bc0c7844	true	userinfo.token.claim
94c5a28f-dea1-434b-96ca-8a39bc0c7844	gender	user.attribute
94c5a28f-dea1-434b-96ca-8a39bc0c7844	true	id.token.claim
94c5a28f-dea1-434b-96ca-8a39bc0c7844	true	access.token.claim
94c5a28f-dea1-434b-96ca-8a39bc0c7844	gender	claim.name
94c5a28f-dea1-434b-96ca-8a39bc0c7844	String	jsonType.label
8c2e28e2-2b03-4c54-b3d2-482c26db86c7	true	userinfo.token.claim
8c2e28e2-2b03-4c54-b3d2-482c26db86c7	birthdate	user.attribute
8c2e28e2-2b03-4c54-b3d2-482c26db86c7	true	id.token.claim
8c2e28e2-2b03-4c54-b3d2-482c26db86c7	true	access.token.claim
8c2e28e2-2b03-4c54-b3d2-482c26db86c7	birthdate	claim.name
8c2e28e2-2b03-4c54-b3d2-482c26db86c7	String	jsonType.label
dc67cecb-47e8-4f59-8cbd-d8a1809bf8b6	true	userinfo.token.claim
dc67cecb-47e8-4f59-8cbd-d8a1809bf8b6	zoneinfo	user.attribute
dc67cecb-47e8-4f59-8cbd-d8a1809bf8b6	true	id.token.claim
dc67cecb-47e8-4f59-8cbd-d8a1809bf8b6	true	access.token.claim
dc67cecb-47e8-4f59-8cbd-d8a1809bf8b6	zoneinfo	claim.name
dc67cecb-47e8-4f59-8cbd-d8a1809bf8b6	String	jsonType.label
64031243-392c-4c14-aaf3-72d4582c03ff	true	userinfo.token.claim
64031243-392c-4c14-aaf3-72d4582c03ff	locale	user.attribute
64031243-392c-4c14-aaf3-72d4582c03ff	true	id.token.claim
64031243-392c-4c14-aaf3-72d4582c03ff	true	access.token.claim
64031243-392c-4c14-aaf3-72d4582c03ff	locale	claim.name
64031243-392c-4c14-aaf3-72d4582c03ff	String	jsonType.label
5ef24654-2e88-478c-b099-65f7ca8a67fa	true	userinfo.token.claim
5ef24654-2e88-478c-b099-65f7ca8a67fa	updatedAt	user.attribute
5ef24654-2e88-478c-b099-65f7ca8a67fa	true	id.token.claim
5ef24654-2e88-478c-b099-65f7ca8a67fa	true	access.token.claim
5ef24654-2e88-478c-b099-65f7ca8a67fa	updated_at	claim.name
5ef24654-2e88-478c-b099-65f7ca8a67fa	String	jsonType.label
555e779c-e3e4-45e6-b747-f33b45e5155a	true	userinfo.token.claim
555e779c-e3e4-45e6-b747-f33b45e5155a	email	user.attribute
555e779c-e3e4-45e6-b747-f33b45e5155a	true	id.token.claim
555e779c-e3e4-45e6-b747-f33b45e5155a	true	access.token.claim
555e779c-e3e4-45e6-b747-f33b45e5155a	email	claim.name
555e779c-e3e4-45e6-b747-f33b45e5155a	String	jsonType.label
29a2c71e-43dc-465a-8bf2-01886295e71b	true	userinfo.token.claim
29a2c71e-43dc-465a-8bf2-01886295e71b	emailVerified	user.attribute
29a2c71e-43dc-465a-8bf2-01886295e71b	true	id.token.claim
29a2c71e-43dc-465a-8bf2-01886295e71b	true	access.token.claim
29a2c71e-43dc-465a-8bf2-01886295e71b	email_verified	claim.name
29a2c71e-43dc-465a-8bf2-01886295e71b	boolean	jsonType.label
06966a5f-46fd-4828-ac5b-4d6aea1e64c5	formatted	user.attribute.formatted
06966a5f-46fd-4828-ac5b-4d6aea1e64c5	country	user.attribute.country
06966a5f-46fd-4828-ac5b-4d6aea1e64c5	postal_code	user.attribute.postal_code
06966a5f-46fd-4828-ac5b-4d6aea1e64c5	true	userinfo.token.claim
06966a5f-46fd-4828-ac5b-4d6aea1e64c5	street	user.attribute.street
06966a5f-46fd-4828-ac5b-4d6aea1e64c5	true	id.token.claim
06966a5f-46fd-4828-ac5b-4d6aea1e64c5	region	user.attribute.region
06966a5f-46fd-4828-ac5b-4d6aea1e64c5	true	access.token.claim
06966a5f-46fd-4828-ac5b-4d6aea1e64c5	locality	user.attribute.locality
ffad6112-debd-41f3-a70f-c72c78c9de93	true	userinfo.token.claim
ffad6112-debd-41f3-a70f-c72c78c9de93	phoneNumber	user.attribute
ffad6112-debd-41f3-a70f-c72c78c9de93	true	id.token.claim
ffad6112-debd-41f3-a70f-c72c78c9de93	true	access.token.claim
ffad6112-debd-41f3-a70f-c72c78c9de93	phone_number	claim.name
ffad6112-debd-41f3-a70f-c72c78c9de93	String	jsonType.label
476c26ea-8cee-416e-a3fb-8a12bed0c473	true	userinfo.token.claim
476c26ea-8cee-416e-a3fb-8a12bed0c473	phoneNumberVerified	user.attribute
476c26ea-8cee-416e-a3fb-8a12bed0c473	true	id.token.claim
476c26ea-8cee-416e-a3fb-8a12bed0c473	true	access.token.claim
476c26ea-8cee-416e-a3fb-8a12bed0c473	phone_number_verified	claim.name
476c26ea-8cee-416e-a3fb-8a12bed0c473	boolean	jsonType.label
a8f1ecf8-f4f0-45e9-b29c-204da07094f0	true	multivalued
a8f1ecf8-f4f0-45e9-b29c-204da07094f0	foo	user.attribute
a8f1ecf8-f4f0-45e9-b29c-204da07094f0	true	access.token.claim
a8f1ecf8-f4f0-45e9-b29c-204da07094f0	realm_access.roles	claim.name
a8f1ecf8-f4f0-45e9-b29c-204da07094f0	String	jsonType.label
8f765655-4fe2-4b2b-91aa-4f18eb94982d	true	multivalued
8f765655-4fe2-4b2b-91aa-4f18eb94982d	foo	user.attribute
8f765655-4fe2-4b2b-91aa-4f18eb94982d	true	access.token.claim
8f765655-4fe2-4b2b-91aa-4f18eb94982d	resource_access.${client_id}.roles	claim.name
8f765655-4fe2-4b2b-91aa-4f18eb94982d	String	jsonType.label
b3612760-a7e3-44d2-a788-5ae1ca66b198	true	userinfo.token.claim
b3612760-a7e3-44d2-a788-5ae1ca66b198	username	user.attribute
b3612760-a7e3-44d2-a788-5ae1ca66b198	true	id.token.claim
b3612760-a7e3-44d2-a788-5ae1ca66b198	true	access.token.claim
b3612760-a7e3-44d2-a788-5ae1ca66b198	upn	claim.name
b3612760-a7e3-44d2-a788-5ae1ca66b198	String	jsonType.label
76f0fbaf-a85a-4d1a-84ab-35af14f52cab	true	multivalued
76f0fbaf-a85a-4d1a-84ab-35af14f52cab	foo	user.attribute
76f0fbaf-a85a-4d1a-84ab-35af14f52cab	true	id.token.claim
76f0fbaf-a85a-4d1a-84ab-35af14f52cab	true	access.token.claim
76f0fbaf-a85a-4d1a-84ab-35af14f52cab	groups	claim.name
76f0fbaf-a85a-4d1a-84ab-35af14f52cab	String	jsonType.label
133e2e60-2817-447d-a060-b4c8ee623bde	true	userinfo.token.claim
133e2e60-2817-447d-a060-b4c8ee623bde	locale	user.attribute
133e2e60-2817-447d-a060-b4c8ee623bde	true	id.token.claim
133e2e60-2817-447d-a060-b4c8ee623bde	true	access.token.claim
133e2e60-2817-447d-a060-b4c8ee623bde	locale	claim.name
133e2e60-2817-447d-a060-b4c8ee623bde	String	jsonType.label
aef8ab20-13ba-4b07-940b-e7ccf32d9668	false	single
aef8ab20-13ba-4b07-940b-e7ccf32d9668	Basic	attribute.nameformat
aef8ab20-13ba-4b07-940b-e7ccf32d9668	Role	attribute.name
40f170fa-dd61-4d83-b5dc-62df3377c5c9	true	userinfo.token.claim
40f170fa-dd61-4d83-b5dc-62df3377c5c9	true	id.token.claim
40f170fa-dd61-4d83-b5dc-62df3377c5c9	true	access.token.claim
9a400e00-3c16-410a-83ed-68e93a8b7845	true	userinfo.token.claim
9a400e00-3c16-410a-83ed-68e93a8b7845	lastName	user.attribute
9a400e00-3c16-410a-83ed-68e93a8b7845	true	id.token.claim
9a400e00-3c16-410a-83ed-68e93a8b7845	true	access.token.claim
9a400e00-3c16-410a-83ed-68e93a8b7845	family_name	claim.name
9a400e00-3c16-410a-83ed-68e93a8b7845	String	jsonType.label
93703063-38ba-4fa5-baf2-6e816bec88e6	true	userinfo.token.claim
93703063-38ba-4fa5-baf2-6e816bec88e6	firstName	user.attribute
93703063-38ba-4fa5-baf2-6e816bec88e6	true	id.token.claim
93703063-38ba-4fa5-baf2-6e816bec88e6	true	access.token.claim
93703063-38ba-4fa5-baf2-6e816bec88e6	given_name	claim.name
93703063-38ba-4fa5-baf2-6e816bec88e6	String	jsonType.label
c2182aa0-4f3b-4a44-8bcd-22e07f13b32e	true	userinfo.token.claim
c2182aa0-4f3b-4a44-8bcd-22e07f13b32e	middleName	user.attribute
c2182aa0-4f3b-4a44-8bcd-22e07f13b32e	true	id.token.claim
c2182aa0-4f3b-4a44-8bcd-22e07f13b32e	true	access.token.claim
c2182aa0-4f3b-4a44-8bcd-22e07f13b32e	middle_name	claim.name
c2182aa0-4f3b-4a44-8bcd-22e07f13b32e	String	jsonType.label
090b630e-af55-4586-b30f-d9cb2124fe42	true	userinfo.token.claim
090b630e-af55-4586-b30f-d9cb2124fe42	nickname	user.attribute
090b630e-af55-4586-b30f-d9cb2124fe42	true	id.token.claim
090b630e-af55-4586-b30f-d9cb2124fe42	true	access.token.claim
090b630e-af55-4586-b30f-d9cb2124fe42	nickname	claim.name
090b630e-af55-4586-b30f-d9cb2124fe42	String	jsonType.label
72563bce-036e-4d04-8e67-7f9682a5b72c	true	userinfo.token.claim
72563bce-036e-4d04-8e67-7f9682a5b72c	username	user.attribute
72563bce-036e-4d04-8e67-7f9682a5b72c	true	id.token.claim
72563bce-036e-4d04-8e67-7f9682a5b72c	true	access.token.claim
72563bce-036e-4d04-8e67-7f9682a5b72c	preferred_username	claim.name
72563bce-036e-4d04-8e67-7f9682a5b72c	String	jsonType.label
303982a8-4160-4aa8-93d5-9fb6e2889068	true	userinfo.token.claim
303982a8-4160-4aa8-93d5-9fb6e2889068	profile	user.attribute
303982a8-4160-4aa8-93d5-9fb6e2889068	true	id.token.claim
303982a8-4160-4aa8-93d5-9fb6e2889068	true	access.token.claim
303982a8-4160-4aa8-93d5-9fb6e2889068	profile	claim.name
303982a8-4160-4aa8-93d5-9fb6e2889068	String	jsonType.label
497ab698-5c40-4ab5-ac77-b39c9cbc3fc1	true	userinfo.token.claim
497ab698-5c40-4ab5-ac77-b39c9cbc3fc1	picture	user.attribute
497ab698-5c40-4ab5-ac77-b39c9cbc3fc1	true	id.token.claim
497ab698-5c40-4ab5-ac77-b39c9cbc3fc1	true	access.token.claim
497ab698-5c40-4ab5-ac77-b39c9cbc3fc1	picture	claim.name
497ab698-5c40-4ab5-ac77-b39c9cbc3fc1	String	jsonType.label
e1026d21-fbf9-4a4e-a1aa-280106c2e02d	true	userinfo.token.claim
e1026d21-fbf9-4a4e-a1aa-280106c2e02d	website	user.attribute
e1026d21-fbf9-4a4e-a1aa-280106c2e02d	true	id.token.claim
e1026d21-fbf9-4a4e-a1aa-280106c2e02d	true	access.token.claim
e1026d21-fbf9-4a4e-a1aa-280106c2e02d	website	claim.name
e1026d21-fbf9-4a4e-a1aa-280106c2e02d	String	jsonType.label
3e06bd3a-cc73-4c2e-8867-32076d5cae9c	true	userinfo.token.claim
3e06bd3a-cc73-4c2e-8867-32076d5cae9c	gender	user.attribute
3e06bd3a-cc73-4c2e-8867-32076d5cae9c	true	id.token.claim
3e06bd3a-cc73-4c2e-8867-32076d5cae9c	true	access.token.claim
3e06bd3a-cc73-4c2e-8867-32076d5cae9c	gender	claim.name
3e06bd3a-cc73-4c2e-8867-32076d5cae9c	String	jsonType.label
c2acf7e1-c381-49ba-a102-b711ee372f94	true	userinfo.token.claim
c2acf7e1-c381-49ba-a102-b711ee372f94	birthdate	user.attribute
c2acf7e1-c381-49ba-a102-b711ee372f94	true	id.token.claim
c2acf7e1-c381-49ba-a102-b711ee372f94	true	access.token.claim
c2acf7e1-c381-49ba-a102-b711ee372f94	birthdate	claim.name
c2acf7e1-c381-49ba-a102-b711ee372f94	String	jsonType.label
38b29b0c-866f-4d02-baf3-15dab50865b3	true	userinfo.token.claim
38b29b0c-866f-4d02-baf3-15dab50865b3	zoneinfo	user.attribute
38b29b0c-866f-4d02-baf3-15dab50865b3	true	id.token.claim
38b29b0c-866f-4d02-baf3-15dab50865b3	true	access.token.claim
38b29b0c-866f-4d02-baf3-15dab50865b3	zoneinfo	claim.name
38b29b0c-866f-4d02-baf3-15dab50865b3	String	jsonType.label
1c1a1a19-9d64-435d-8c0d-429b3fb1319e	true	userinfo.token.claim
1c1a1a19-9d64-435d-8c0d-429b3fb1319e	locale	user.attribute
1c1a1a19-9d64-435d-8c0d-429b3fb1319e	true	id.token.claim
1c1a1a19-9d64-435d-8c0d-429b3fb1319e	true	access.token.claim
1c1a1a19-9d64-435d-8c0d-429b3fb1319e	locale	claim.name
1c1a1a19-9d64-435d-8c0d-429b3fb1319e	String	jsonType.label
1072bddc-2827-4033-9e2c-57b72fcf16bc	true	userinfo.token.claim
1072bddc-2827-4033-9e2c-57b72fcf16bc	updatedAt	user.attribute
1072bddc-2827-4033-9e2c-57b72fcf16bc	true	id.token.claim
1072bddc-2827-4033-9e2c-57b72fcf16bc	true	access.token.claim
1072bddc-2827-4033-9e2c-57b72fcf16bc	updated_at	claim.name
1072bddc-2827-4033-9e2c-57b72fcf16bc	String	jsonType.label
3a35669e-5ae4-4117-8764-0b39764c51ba	true	userinfo.token.claim
3a35669e-5ae4-4117-8764-0b39764c51ba	email	user.attribute
3a35669e-5ae4-4117-8764-0b39764c51ba	true	id.token.claim
3a35669e-5ae4-4117-8764-0b39764c51ba	true	access.token.claim
3a35669e-5ae4-4117-8764-0b39764c51ba	email	claim.name
3a35669e-5ae4-4117-8764-0b39764c51ba	String	jsonType.label
18e46646-606e-4ef2-8516-d11de95f2172	true	userinfo.token.claim
18e46646-606e-4ef2-8516-d11de95f2172	emailVerified	user.attribute
18e46646-606e-4ef2-8516-d11de95f2172	true	id.token.claim
18e46646-606e-4ef2-8516-d11de95f2172	true	access.token.claim
18e46646-606e-4ef2-8516-d11de95f2172	email_verified	claim.name
18e46646-606e-4ef2-8516-d11de95f2172	boolean	jsonType.label
aea153ce-1961-42af-a7c0-2abe5b6f5095	formatted	user.attribute.formatted
aea153ce-1961-42af-a7c0-2abe5b6f5095	country	user.attribute.country
aea153ce-1961-42af-a7c0-2abe5b6f5095	postal_code	user.attribute.postal_code
aea153ce-1961-42af-a7c0-2abe5b6f5095	true	userinfo.token.claim
aea153ce-1961-42af-a7c0-2abe5b6f5095	street	user.attribute.street
aea153ce-1961-42af-a7c0-2abe5b6f5095	true	id.token.claim
aea153ce-1961-42af-a7c0-2abe5b6f5095	region	user.attribute.region
aea153ce-1961-42af-a7c0-2abe5b6f5095	true	access.token.claim
aea153ce-1961-42af-a7c0-2abe5b6f5095	locality	user.attribute.locality
10635df3-9358-4156-960d-481f5f909e5d	true	userinfo.token.claim
10635df3-9358-4156-960d-481f5f909e5d	phoneNumber	user.attribute
10635df3-9358-4156-960d-481f5f909e5d	true	id.token.claim
10635df3-9358-4156-960d-481f5f909e5d	true	access.token.claim
10635df3-9358-4156-960d-481f5f909e5d	phone_number	claim.name
10635df3-9358-4156-960d-481f5f909e5d	String	jsonType.label
fc954288-74fd-4004-a9d8-acd7bbb8b784	true	userinfo.token.claim
fc954288-74fd-4004-a9d8-acd7bbb8b784	phoneNumberVerified	user.attribute
fc954288-74fd-4004-a9d8-acd7bbb8b784	true	id.token.claim
fc954288-74fd-4004-a9d8-acd7bbb8b784	true	access.token.claim
fc954288-74fd-4004-a9d8-acd7bbb8b784	phone_number_verified	claim.name
fc954288-74fd-4004-a9d8-acd7bbb8b784	boolean	jsonType.label
1f338651-9516-4449-abf5-071dbad340ef	true	multivalued
1f338651-9516-4449-abf5-071dbad340ef	foo	user.attribute
1f338651-9516-4449-abf5-071dbad340ef	true	access.token.claim
1f338651-9516-4449-abf5-071dbad340ef	realm_access.roles	claim.name
1f338651-9516-4449-abf5-071dbad340ef	String	jsonType.label
59a896b8-80df-4ecb-864e-ae6e47bc3f0e	true	multivalued
59a896b8-80df-4ecb-864e-ae6e47bc3f0e	foo	user.attribute
59a896b8-80df-4ecb-864e-ae6e47bc3f0e	true	access.token.claim
59a896b8-80df-4ecb-864e-ae6e47bc3f0e	resource_access.${client_id}.roles	claim.name
59a896b8-80df-4ecb-864e-ae6e47bc3f0e	String	jsonType.label
b9651a04-65a7-465b-8c37-dd8b739496c1	true	userinfo.token.claim
b9651a04-65a7-465b-8c37-dd8b739496c1	username	user.attribute
b9651a04-65a7-465b-8c37-dd8b739496c1	true	id.token.claim
b9651a04-65a7-465b-8c37-dd8b739496c1	true	access.token.claim
b9651a04-65a7-465b-8c37-dd8b739496c1	upn	claim.name
b9651a04-65a7-465b-8c37-dd8b739496c1	String	jsonType.label
7081204e-3261-4b41-b489-2031b02790bc	true	multivalued
7081204e-3261-4b41-b489-2031b02790bc	foo	user.attribute
7081204e-3261-4b41-b489-2031b02790bc	true	id.token.claim
7081204e-3261-4b41-b489-2031b02790bc	true	access.token.claim
7081204e-3261-4b41-b489-2031b02790bc	groups	claim.name
7081204e-3261-4b41-b489-2031b02790bc	String	jsonType.label
98da81ac-c6fe-413e-9a79-ec17dfc5d830	true	userinfo.token.claim
98da81ac-c6fe-413e-9a79-ec17dfc5d830	locale	user.attribute
98da81ac-c6fe-413e-9a79-ec17dfc5d830	true	id.token.claim
98da81ac-c6fe-413e-9a79-ec17dfc5d830	true	access.token.claim
98da81ac-c6fe-413e-9a79-ec17dfc5d830	locale	claim.name
98da81ac-c6fe-413e-9a79-ec17dfc5d830	String	jsonType.label
eb3a5951-4e92-40a4-8f51-59a1ab92245f	clientId	user.session.note
eb3a5951-4e92-40a4-8f51-59a1ab92245f	true	id.token.claim
eb3a5951-4e92-40a4-8f51-59a1ab92245f	true	access.token.claim
eb3a5951-4e92-40a4-8f51-59a1ab92245f	clientId	claim.name
eb3a5951-4e92-40a4-8f51-59a1ab92245f	String	jsonType.label
47e3901d-b9e8-4d8a-92ee-064476554394	clientHost	user.session.note
47e3901d-b9e8-4d8a-92ee-064476554394	true	id.token.claim
47e3901d-b9e8-4d8a-92ee-064476554394	true	access.token.claim
47e3901d-b9e8-4d8a-92ee-064476554394	clientHost	claim.name
47e3901d-b9e8-4d8a-92ee-064476554394	String	jsonType.label
f61033d5-14f0-42f3-8c07-d4dddffcd4d8	clientAddress	user.session.note
f61033d5-14f0-42f3-8c07-d4dddffcd4d8	true	id.token.claim
f61033d5-14f0-42f3-8c07-d4dddffcd4d8	true	access.token.claim
f61033d5-14f0-42f3-8c07-d4dddffcd4d8	clientAddress	claim.name
f61033d5-14f0-42f3-8c07-d4dddffcd4d8	String	jsonType.label
472651d9-ec42-44c1-9817-05a2bb373b90	clientId	user.session.note
472651d9-ec42-44c1-9817-05a2bb373b90	true	id.token.claim
472651d9-ec42-44c1-9817-05a2bb373b90	true	access.token.claim
472651d9-ec42-44c1-9817-05a2bb373b90	clientId	claim.name
472651d9-ec42-44c1-9817-05a2bb373b90	String	jsonType.label
2a1a9214-65ba-4288-abbb-37cdc1e06460	clientHost	user.session.note
2a1a9214-65ba-4288-abbb-37cdc1e06460	true	id.token.claim
2a1a9214-65ba-4288-abbb-37cdc1e06460	true	access.token.claim
2a1a9214-65ba-4288-abbb-37cdc1e06460	clientHost	claim.name
2a1a9214-65ba-4288-abbb-37cdc1e06460	String	jsonType.label
f4ba15d0-c9f7-42a4-90e0-aa723796d851	clientAddress	user.session.note
f4ba15d0-c9f7-42a4-90e0-aa723796d851	true	id.token.claim
f4ba15d0-c9f7-42a4-90e0-aa723796d851	true	access.token.claim
f4ba15d0-c9f7-42a4-90e0-aa723796d851	clientAddress	claim.name
f4ba15d0-c9f7-42a4-90e0-aa723796d851	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
master	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	99ef1033-fe12-4820-9069-f08ef89fcd1a	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	05dabaf1-aa19-4649-a10b-d546c9a987dd	a72f912c-884d-40ec-80ee-f58927c19f3f	59c4129f-76fb-4ecd-8d6e-bd2b9294e7c8	c4bc5dec-5f75-42a0-83d3-a8e98ff22f25	6a14112d-2b10-4196-8d85-f2080bef7dfa	2592000	f	900	t	f	9c43a4ff-63ac-41ed-88bd-ccc556a5293b	0	f	0	0	84b1eb02-4876-41dd-9bff-8dd2b68b3e80
idp1	60	300	300	\N	\N	\N	t	f	0	\N	idp1	0	\N	f	f	t	f	EXTERNAL	1800	36000	f	f	350c8e59-0892-4bd1-93a7-90e8e7907108	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	35630408-7231-41ce-9017-8d4351e28c9f	01b63b85-5c34-49d1-abdc-65604d580f41	53488584-71ed-4e9b-928b-693c2b9284b9	9bc01d2e-546e-4fd5-916c-3731996395b3	ac7e99f1-9441-4dd1-b587-e778fdc578a0	2592000	f	900	t	f	d2293172-f1a7-4c55-a930-9e435b0f718c	0	f	0	0	cb4c5d64-7023-48d5-93d6-3f63bff0111e
idp2	60	300	300	\N	\N	\N	t	f	0	\N	idp2	0	\N	f	f	t	f	EXTERNAL	1800	36000	f	f	0e1ce7c8-7433-4d4d-83f8-0d9ef7cd0d6c	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	bfe73b71-0ba7-493c-ae4c-fb56cd9acf2e	2166cc67-0adb-4ad2-97d8-a6792bd7e74a	6d1ff1a5-aa6f-45c6-a82e-6e7e9dfe7d69	5dc34871-cfc1-40c9-ac66-b5762524924c	a49b6a0d-d6a7-418c-8bfa-5f8dfda45cba	2592000	f	900	t	f	9a421374-4f7b-49e9-a545-8f87606effa8	0	f	0	0	0a60b261-fcaf-4d0c-b26d-d6297abbd6cd
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.realm_attribute (name, realm_id, value) FROM stdin;
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
_browser_header.contentSecurityPolicyReportOnly	idp1	
_browser_header.xContentTypeOptions	idp1	nosniff
_browser_header.xRobotsTag	idp1	none
_browser_header.xFrameOptions	idp1	SAMEORIGIN
_browser_header.contentSecurityPolicy	idp1	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	idp1	1; mode=block
_browser_header.strictTransportSecurity	idp1	max-age=31536000; includeSubDomains
bruteForceProtected	idp1	false
permanentLockout	idp1	false
maxFailureWaitSeconds	idp1	900
minimumQuickLoginWaitSeconds	idp1	60
waitIncrementSeconds	idp1	60
quickLoginCheckMilliSeconds	idp1	1000
maxDeltaTimeSeconds	idp1	43200
failureFactor	idp1	30
displayName	idp1	Devhost Shared Idp
defaultSignatureAlgorithm	idp1	RS256
offlineSessionMaxLifespanEnabled	idp1	false
offlineSessionMaxLifespan	idp1	5184000
actionTokenGeneratedByAdminLifespan	idp1	43200
actionTokenGeneratedByUserLifespan	idp1	300
oauth2DeviceCodeLifespan	idp1	600
oauth2DevicePollingInterval	idp1	5
webAuthnPolicyRpEntityName	idp1	keycloak
webAuthnPolicySignatureAlgorithms	idp1	ES256
webAuthnPolicyRpId	idp1	
webAuthnPolicyAttestationConveyancePreference	idp1	not specified
webAuthnPolicyAuthenticatorAttachment	idp1	not specified
webAuthnPolicyRequireResidentKey	idp1	not specified
webAuthnPolicyUserVerificationRequirement	idp1	not specified
webAuthnPolicyCreateTimeout	idp1	0
webAuthnPolicyAvoidSameAuthenticatorRegister	idp1	false
webAuthnPolicyRpEntityNamePasswordless	idp1	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	idp1	ES256
webAuthnPolicyRpIdPasswordless	idp1	
webAuthnPolicyAttestationConveyancePreferencePasswordless	idp1	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	idp1	not specified
webAuthnPolicyRequireResidentKeyPasswordless	idp1	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	idp1	not specified
webAuthnPolicyCreateTimeoutPasswordless	idp1	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	idp1	false
cibaBackchannelTokenDeliveryMode	idp1	poll
cibaExpiresIn	idp1	120
cibaInterval	idp1	5
cibaAuthRequestedUserHint	idp1	login_hint
parRequestUriLifespan	idp1	60
_browser_header.contentSecurityPolicyReportOnly	idp2	
_browser_header.xContentTypeOptions	idp2	nosniff
_browser_header.xRobotsTag	idp2	none
_browser_header.xFrameOptions	idp2	SAMEORIGIN
_browser_header.contentSecurityPolicy	idp2	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	idp2	1; mode=block
_browser_header.strictTransportSecurity	idp2	max-age=31536000; includeSubDomains
bruteForceProtected	idp2	false
permanentLockout	idp2	false
maxFailureWaitSeconds	idp2	900
minimumQuickLoginWaitSeconds	idp2	60
waitIncrementSeconds	idp2	60
quickLoginCheckMilliSeconds	idp2	1000
maxDeltaTimeSeconds	idp2	43200
failureFactor	idp2	30
displayName	idp2	WSL Shared Idp
defaultSignatureAlgorithm	idp2	RS256
offlineSessionMaxLifespanEnabled	idp2	false
offlineSessionMaxLifespan	idp2	5184000
actionTokenGeneratedByAdminLifespan	idp2	43200
actionTokenGeneratedByUserLifespan	idp2	300
oauth2DeviceCodeLifespan	idp2	600
oauth2DevicePollingInterval	idp2	5
webAuthnPolicyRpEntityName	idp2	keycloak
webAuthnPolicySignatureAlgorithms	idp2	ES256
webAuthnPolicyRpId	idp2	
webAuthnPolicyAttestationConveyancePreference	idp2	not specified
webAuthnPolicyAuthenticatorAttachment	idp2	not specified
webAuthnPolicyRequireResidentKey	idp2	not specified
webAuthnPolicyUserVerificationRequirement	idp2	not specified
webAuthnPolicyCreateTimeout	idp2	0
webAuthnPolicyAvoidSameAuthenticatorRegister	idp2	false
webAuthnPolicyRpEntityNamePasswordless	idp2	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	idp2	ES256
webAuthnPolicyRpIdPasswordless	idp2	
webAuthnPolicyAttestationConveyancePreferencePasswordless	idp2	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	idp2	not specified
webAuthnPolicyRequireResidentKeyPasswordless	idp2	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	idp2	not specified
webAuthnPolicyCreateTimeoutPasswordless	idp2	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	idp2	false
cibaBackchannelTokenDeliveryMode	idp2	poll
cibaExpiresIn	idp2	120
cibaInterval	idp2	5
cibaAuthRequestedUserHint	idp2	login_hint
parRequestUriLifespan	idp2	60
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.realm_events_listeners (realm_id, value) FROM stdin;
master	jboss-logging
idp1	jboss-logging
idp2	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	master
password	password	t	t	idp1
password	password	t	t	idp2
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.realm_smtp_config (realm_id, value, name) FROM stdin;
idp1	ghdfsauejb+34#	password
idp1	true	starttls
idp1	true	auth
idp1	587	port
idp1	smtp.office365.com	host
idp1	no-reply@catena-x.net	replyTo
idp1	Notifications@catena-x.net	from
idp1		ssl
idp1	Notifications@catena-x.net	user
idp2	ghdfsauejb+34#	password
idp2	true	starttls
idp2	true	auth
idp2	587	port
idp2	smtp.office365.com	host
idp2	no-reply@catena-x.net	replyTo
idp2	Notifications@catena-x.net	from
idp2		ssl
idp2	Notifications@catena-x.net	user
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.redirect_uris (client_id, value) FROM stdin;
e05ec7b1-83bd-4135-baf4-3c2b7503bfc7	/realms/master/account/*
70c8782b-daf7-47a3-8158-967fb3136ce8	/realms/master/account/*
62f0b9a7-6ca2-4cd8-9630-116e3c8e0aab	/admin/master/console/*
38f342fe-a164-4928-94ce-86c2ff574f2c	*
f9ea5e59-8453-4997-9e7a-0524931be1ac	*
cba5cd0d-1e50-4b56-adc0-2ec111f848a1	/realms/idp1/account/*
a31ff307-fa23-4749-9f0b-ffd3c20a316d	/realms/idp1/account/*
3c3326af-8f11-44c7-9e23-7876c3142a3f	/admin/idp1/console/*
aa0e2a76-477b-4855-89f8-39f90c2afe34	https://devhost:8443/iamcentral/auth/realms/CX-Central/broker/idp1/endpoint/*
0930b3c3-b0ea-46db-b765-c02775579f10	/realms/idp2/account/*
fd0a3e4a-2997-4975-9752-217d3dede715	/realms/idp2/account/*
28bff4e7-9868-486d-93ae-374994b60819	/admin/idp2/console/*
6485fa7b-ba42-4456-8e61-d8d82fb0141c	https://wsl:8443/iamcentral/auth/realms/CX-Central/broker/idp2/endpoint/*
503fd407-6e27-47a9-8001-97e53892cc0a	https://null
19324db5-81e8-4b25-8f67-a085e8fd6222	https://null
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
039c5032-f9e9-4336-94b3-a4dcb61f7365	VERIFY_EMAIL	Verify Email	master	t	f	VERIFY_EMAIL	50
dff8765b-5974-473d-aa77-220ed9e779ff	UPDATE_PROFILE	Update Profile	master	t	f	UPDATE_PROFILE	40
c5ba2ece-a97d-42ec-a542-6a09aaba7543	CONFIGURE_TOTP	Configure OTP	master	t	f	CONFIGURE_TOTP	10
4641bd3e-4b9b-4396-aadd-c0fa73e5002b	UPDATE_PASSWORD	Update Password	master	t	f	UPDATE_PASSWORD	30
736ca7e5-281c-4b0d-b3fb-4ec49b9a1283	terms_and_conditions	Terms and Conditions	master	f	f	terms_and_conditions	20
a7ddcba8-a056-451b-85df-578aaa9cc504	update_user_locale	Update User Locale	master	t	f	update_user_locale	1000
41ac06d5-6f33-4d47-b0b5-85c2af649cd0	delete_account	Delete Account	master	f	f	delete_account	60
e5a2d64d-ce13-4505-a9a7-31ff26f037aa	VERIFY_EMAIL	Verify Email	idp1	t	f	VERIFY_EMAIL	50
1fe3d449-e324-4893-bdfb-1217f3e59266	UPDATE_PROFILE	Update Profile	idp1	t	f	UPDATE_PROFILE	40
b242d284-036e-4778-a9fd-0f3143efb599	CONFIGURE_TOTP	Configure OTP	idp1	t	f	CONFIGURE_TOTP	10
c13ea260-9b13-4f5a-896e-735df680e283	UPDATE_PASSWORD	Update Password	idp1	t	f	UPDATE_PASSWORD	30
a563b771-fbdc-49aa-b97d-8b3e16e48791	terms_and_conditions	Terms and Conditions	idp1	f	f	terms_and_conditions	20
7769165c-8199-42f4-a21c-5e8d77fc21f2	update_user_locale	Update User Locale	idp1	t	f	update_user_locale	1000
42fb92a0-2f92-4869-9f25-16cf27989795	delete_account	Delete Account	idp1	f	f	delete_account	60
0beb32ce-57e9-4425-96d8-bdbd413acb3c	VERIFY_EMAIL	Verify Email	idp2	t	f	VERIFY_EMAIL	50
e8dd2e9b-bdcc-461e-a753-fbdf3e708ef2	UPDATE_PROFILE	Update Profile	idp2	t	f	UPDATE_PROFILE	40
4388fbed-4983-457d-b80b-ce7e1918fdf9	CONFIGURE_TOTP	Configure OTP	idp2	t	f	CONFIGURE_TOTP	10
664c6805-48c0-4282-b593-4179e047fc16	UPDATE_PASSWORD	Update Password	idp2	t	f	UPDATE_PASSWORD	30
299600c2-67e0-4533-9942-1e33ae297232	terms_and_conditions	Terms and Conditions	idp2	f	f	terms_and_conditions	20
f392acc7-52fc-4475-9775-b664b731b7b1	update_user_locale	Update User Locale	idp2	t	f	update_user_locale	1000
e344796d-b282-4cd6-88dd-bcb41bb4d52b	delete_account	Delete Account	idp2	f	f	delete_account	60
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.scope_mapping (client_id, role_id) FROM stdin;
70c8782b-daf7-47a3-8158-967fb3136ce8	07d0f4c8-605b-4dd7-9ef5-e2a5f36895b9
a31ff307-fa23-4749-9f0b-ffd3c20a316d	e65ce79c-8502-4096-88af-944767df37ae
fd0a3e4a-2997-4975-9752-217d3dede715	005d1605-f9b3-4ed8-b6aa-d5ca96155b89
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
8fedf7f0-3c1a-41d7-a8c7-2a1a329b4f75	\N	d1a69270-04c7-4f14-af08-4f9ea2b684c7	f	t	\N	\N	\N	master	admin	1648455300787	\N	0
5a7bc7f6-8c14-4007-b5c8-4ff59d828aad	\N	69161f44-d66b-4a0f-9374-5de8cb3031a0	f	t	\N	\N	\N	master	service-account-iam_user_id	1648457003897	38f342fe-a164-4928-94ce-86c2ff574f2c	0
63628715-dba2-47b7-9d61-e2262680cb05	\N	5ead5e5c-1821-4171-8c3b-22e2e93ccc2d	f	t	\N	\N	\N	master	service-account-sa-cl1-reg-1	1648468360019	f9ea5e59-8453-4997-9e7a-0524931be1ac	0
6ec46cd4-5aec-46c3-88dc-2a283994ab92	no.email@catena.net	no.email@catena.net	t	t	\N	Testuser	Devhost	idp1	devhost-test	1648483534341	\N	0
f99d2698-5670-41f2-a141-e58b0c99560c	no.email@catena.net	no.email@catena.net	t	t	\N	Testuser	WSL	idp2	wsl-test	1648485062070	\N	0
20f59983-a8b9-42f7-9714-e945f0902689	\N	2384afe6-e405-46e6-acb6-12ee339ede71	f	t	\N	\N	\N	master	service-account-saidp1	1662115132128	503fd407-6e27-47a9-8001-97e53892cc0a	0
fde58b74-4516-4740-a3c6-b4b4ca3a00e0	\N	5e8e4d3f-963f-4f42-8661-c2596a1fa73a	f	t	\N	\N	\N	master	service-account-saidp2	1662115218221	19324db5-81e8-4b25-8f67-a085e8fd6222	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.user_role_mapping (role_id, user_id) FROM stdin;
84b1eb02-4876-41dd-9bff-8dd2b68b3e80	8fedf7f0-3c1a-41d7-a8c7-2a1a329b4f75
111b076b-edb1-4006-9291-ae2b7fbb5d08	8fedf7f0-3c1a-41d7-a8c7-2a1a329b4f75
84b1eb02-4876-41dd-9bff-8dd2b68b3e80	5a7bc7f6-8c14-4007-b5c8-4ff59d828aad
6a06c9d3-9bbc-47bb-9c46-b6c616da9de6	5a7bc7f6-8c14-4007-b5c8-4ff59d828aad
84b1eb02-4876-41dd-9bff-8dd2b68b3e80	63628715-dba2-47b7-9d61-e2262680cb05
c1920118-66a3-4763-956a-55d67dee536f	63628715-dba2-47b7-9d61-e2262680cb05
b5b36764-26de-409b-bb75-d9e7c940e3ee	63628715-dba2-47b7-9d61-e2262680cb05
f56ad518-6189-4452-a47d-e612c6bd4b6d	63628715-dba2-47b7-9d61-e2262680cb05
a1a28a53-fc05-49c3-9f6b-98a63f723be6	63628715-dba2-47b7-9d61-e2262680cb05
bf97e54d-663b-42c0-8244-37d1414f7043	63628715-dba2-47b7-9d61-e2262680cb05
5eae02a3-9f69-429f-be6f-27b23cfb4a06	63628715-dba2-47b7-9d61-e2262680cb05
04966c2a-96c5-4739-b293-7213900fd480	63628715-dba2-47b7-9d61-e2262680cb05
279d9f0e-f028-4269-a0f7-4a934671ff5d	63628715-dba2-47b7-9d61-e2262680cb05
d6601946-f90e-4071-be79-244e790a0180	63628715-dba2-47b7-9d61-e2262680cb05
3ee2f8eb-4b0c-4029-86bc-caf2840913a6	63628715-dba2-47b7-9d61-e2262680cb05
44f56580-4264-44f8-b387-bdd2fd3ae32c	63628715-dba2-47b7-9d61-e2262680cb05
399fb6db-e5cb-4e17-ac31-8740a78f30b2	63628715-dba2-47b7-9d61-e2262680cb05
36c17efb-8bdf-4ac7-a1ed-f538c710abe6	63628715-dba2-47b7-9d61-e2262680cb05
2754ef57-9963-452c-b218-628ec0bf3e4d	63628715-dba2-47b7-9d61-e2262680cb05
51fe83f7-45c6-46da-bdca-67d1dbf874f7	63628715-dba2-47b7-9d61-e2262680cb05
9dd94d5a-95a1-4d80-bac2-4179e7171146	63628715-dba2-47b7-9d61-e2262680cb05
7e6ad334-ebea-4ed0-9b39-b28e5364d8cb	63628715-dba2-47b7-9d61-e2262680cb05
cb4c5d64-7023-48d5-93d6-3f63bff0111e	6ec46cd4-5aec-46c3-88dc-2a283994ab92
c0061df0-7944-4e94-bd24-8a1607b591cf	63628715-dba2-47b7-9d61-e2262680cb05
e5298cbe-bb78-4e2b-b7fe-4bc019ba58c3	63628715-dba2-47b7-9d61-e2262680cb05
66b8ceaf-05e3-4ab6-bd03-913eed39cc80	63628715-dba2-47b7-9d61-e2262680cb05
f471661a-ae0e-487d-9a12-06c03b07448d	63628715-dba2-47b7-9d61-e2262680cb05
771cf602-5543-46a9-891d-3e0536b18455	63628715-dba2-47b7-9d61-e2262680cb05
f8095801-f7ef-4634-8786-4e4fda2bbc8f	63628715-dba2-47b7-9d61-e2262680cb05
5d55e37d-b3d3-45f9-98c4-a31d43e280f2	63628715-dba2-47b7-9d61-e2262680cb05
1adbb3cb-fe7e-40e9-8e37-7bcb36a28526	63628715-dba2-47b7-9d61-e2262680cb05
3a0bc9ec-2be8-4ed4-8cb4-d7e047d77fa6	63628715-dba2-47b7-9d61-e2262680cb05
e3d11ee6-66df-4c90-8e45-8386f256ec7f	63628715-dba2-47b7-9d61-e2262680cb05
ca0b13fd-1ad0-4cae-8c32-5fadba3bfde2	63628715-dba2-47b7-9d61-e2262680cb05
b194978c-78c4-40aa-9884-52e54484e2df	63628715-dba2-47b7-9d61-e2262680cb05
7a754049-d964-43f1-b89c-498c0e3eb0db	63628715-dba2-47b7-9d61-e2262680cb05
663ee0d8-6c92-4b61-9426-0a3a83f93160	63628715-dba2-47b7-9d61-e2262680cb05
73a48b58-5ad2-4ba0-b8fb-0d1d4fde3f6e	63628715-dba2-47b7-9d61-e2262680cb05
680e748d-76ff-4556-9beb-31309c10a3ce	63628715-dba2-47b7-9d61-e2262680cb05
7797edc4-1757-4f6f-8f8d-d5c3b2a8f6fe	63628715-dba2-47b7-9d61-e2262680cb05
0a60b261-fcaf-4d0c-b26d-d6297abbd6cd	f99d2698-5670-41f2-a141-e58b0c99560c
111b076b-edb1-4006-9291-ae2b7fbb5d08	63628715-dba2-47b7-9d61-e2262680cb05
84b1eb02-4876-41dd-9bff-8dd2b68b3e80	20f59983-a8b9-42f7-9714-e945f0902689
c1920118-66a3-4763-956a-55d67dee536f	20f59983-a8b9-42f7-9714-e945f0902689
36c17efb-8bdf-4ac7-a1ed-f538c710abe6	20f59983-a8b9-42f7-9714-e945f0902689
3ee2f8eb-4b0c-4029-86bc-caf2840913a6	20f59983-a8b9-42f7-9714-e945f0902689
44f56580-4264-44f8-b387-bdd2fd3ae32c	20f59983-a8b9-42f7-9714-e945f0902689
399fb6db-e5cb-4e17-ac31-8740a78f30b2	20f59983-a8b9-42f7-9714-e945f0902689
279d9f0e-f028-4269-a0f7-4a934671ff5d	20f59983-a8b9-42f7-9714-e945f0902689
d6601946-f90e-4071-be79-244e790a0180	20f59983-a8b9-42f7-9714-e945f0902689
51fe83f7-45c6-46da-bdca-67d1dbf874f7	20f59983-a8b9-42f7-9714-e945f0902689
7e6ad334-ebea-4ed0-9b39-b28e5364d8cb	20f59983-a8b9-42f7-9714-e945f0902689
9dd94d5a-95a1-4d80-bac2-4179e7171146	20f59983-a8b9-42f7-9714-e945f0902689
2754ef57-9963-452c-b218-628ec0bf3e4d	20f59983-a8b9-42f7-9714-e945f0902689
04966c2a-96c5-4739-b293-7213900fd480	20f59983-a8b9-42f7-9714-e945f0902689
a1a28a53-fc05-49c3-9f6b-98a63f723be6	20f59983-a8b9-42f7-9714-e945f0902689
bf97e54d-663b-42c0-8244-37d1414f7043	20f59983-a8b9-42f7-9714-e945f0902689
5eae02a3-9f69-429f-be6f-27b23cfb4a06	20f59983-a8b9-42f7-9714-e945f0902689
b5b36764-26de-409b-bb75-d9e7c940e3ee	20f59983-a8b9-42f7-9714-e945f0902689
f56ad518-6189-4452-a47d-e612c6bd4b6d	20f59983-a8b9-42f7-9714-e945f0902689
84b1eb02-4876-41dd-9bff-8dd2b68b3e80	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
c0061df0-7944-4e94-bd24-8a1607b591cf	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
7a754049-d964-43f1-b89c-498c0e3eb0db	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
e3d11ee6-66df-4c90-8e45-8386f256ec7f	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
ca0b13fd-1ad0-4cae-8c32-5fadba3bfde2	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
b194978c-78c4-40aa-9884-52e54484e2df	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
1adbb3cb-fe7e-40e9-8e37-7bcb36a28526	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
3a0bc9ec-2be8-4ed4-8cb4-d7e047d77fa6	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
73a48b58-5ad2-4ba0-b8fb-0d1d4fde3f6e	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
7797edc4-1757-4f6f-8f8d-d5c3b2a8f6fe	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
680e748d-76ff-4556-9beb-31309c10a3ce	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
663ee0d8-6c92-4b61-9426-0a3a83f93160	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
5d55e37d-b3d3-45f9-98c4-a31d43e280f2	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
f471661a-ae0e-487d-9a12-06c03b07448d	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
771cf602-5543-46a9-891d-3e0536b18455	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
f8095801-f7ef-4634-8786-4e4fda2bbc8f	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
e5298cbe-bb78-4e2b-b7fe-4bc019ba58c3	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
66b8ceaf-05e3-4ab6-bd03-913eed39cc80	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
6a06c9d3-9bbc-47bb-9c46-b6c616da9de6	fde58b74-4516-4740-a3c6-b4b4ca3a00e0
6a06c9d3-9bbc-47bb-9c46-b6c616da9de6	20f59983-a8b9-42f7-9714-e945f0902689
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: iamshared; Owner: kcshared
--

COPY iamshared.web_origins (client_id, value) FROM stdin;
62f0b9a7-6ca2-4cd8-9630-116e3c8e0aab	+
3c3326af-8f11-44c7-9e23-7876c3142a3f	+
aa0e2a76-477b-4855-89f8-39f90c2afe34	+
28bff4e7-9868-486d-93ae-374994b60819	+
6485fa7b-ba42-4456-8e61-d8d82fb0141c	+
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON iamshared.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_auth_config_realm ON iamshared.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_auth_exec_flow ON iamshared.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_auth_exec_realm_flow ON iamshared.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_auth_flow_realm ON iamshared.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_cl_clscope ON iamshared.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_client_att_by_name_value ON iamshared.client_attributes USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_client_id; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_client_id ON iamshared.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_client_init_acc_realm ON iamshared.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_client_session_session ON iamshared.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_clscope_attrs ON iamshared.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_clscope_cl ON iamshared.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_clscope_protmap ON iamshared.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_clscope_role ON iamshared.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_compo_config_compo ON iamshared.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_component_provider_type ON iamshared.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_component_realm ON iamshared.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_composite ON iamshared.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_composite_child ON iamshared.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_defcls_realm ON iamshared.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_defcls_scope ON iamshared.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_event_time ON iamshared.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_fedidentity_feduser ON iamshared.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_fedidentity_user ON iamshared.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_fu_attribute ON iamshared.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_fu_cnsnt_ext ON iamshared.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_fu_consent ON iamshared.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_fu_consent_ru ON iamshared.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_fu_credential ON iamshared.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_fu_credential_ru ON iamshared.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_fu_group_membership ON iamshared.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_fu_group_membership_ru ON iamshared.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_fu_required_action ON iamshared.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_fu_required_action_ru ON iamshared.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_fu_role_mapping ON iamshared.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_fu_role_mapping_ru ON iamshared.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_group_attr_group ON iamshared.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_group_role_mapp_group ON iamshared.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_id_prov_mapp_realm ON iamshared.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_ident_prov_realm ON iamshared.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_keycloak_role_client ON iamshared.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_keycloak_role_realm ON iamshared.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_offline_css_preload ON iamshared.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_offline_uss_by_user ON iamshared.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_offline_uss_by_usersess ON iamshared.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_offline_uss_createdon ON iamshared.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_offline_uss_preload ON iamshared.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_protocol_mapper_client ON iamshared.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_realm_attr_realm ON iamshared.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_realm_clscope ON iamshared.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_realm_def_grp_realm ON iamshared.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_realm_evt_list_realm ON iamshared.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_realm_evt_types_realm ON iamshared.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_realm_master_adm_cli ON iamshared.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_realm_supp_local_realm ON iamshared.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_redir_uri_client ON iamshared.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_req_act_prov_realm ON iamshared.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_res_policy_policy ON iamshared.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_res_scope_scope ON iamshared.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_res_serv_pol_res_serv ON iamshared.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_res_srv_res_res_srv ON iamshared.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_res_srv_scope_res_srv ON iamshared.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_role_attribute ON iamshared.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_role_clscope ON iamshared.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_scope_mapping_role ON iamshared.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_scope_policy_policy ON iamshared.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_update_time ON iamshared.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON iamshared.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_usconsent_clscope ON iamshared.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_user_attribute ON iamshared.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_user_attribute_name ON iamshared.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_user_consent ON iamshared.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_user_credential ON iamshared.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_user_email ON iamshared.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_user_group_mapping ON iamshared.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_user_reqactions ON iamshared.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_user_role_mapping ON iamshared.user_role_mapping USING btree (user_id);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_usr_fed_map_fed_prv ON iamshared.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_usr_fed_map_realm ON iamshared.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_usr_fed_prv_realm ON iamshared.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: iamshared; Owner: kcshared
--

CREATE INDEX idx_web_orig_client ON iamshared.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES iamshared.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES iamshared.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES iamshared.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES iamshared.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES iamshared.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES iamshared.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES iamshared.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES iamshared.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES iamshared.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES iamshared.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES iamshared.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES iamshared.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES iamshared.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES iamshared.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES iamshared.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES iamshared.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES iamshared.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES iamshared.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES iamshared.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES iamshared.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES iamshared.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES iamshared.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES iamshared.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES iamshared.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES iamshared.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES iamshared.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES iamshared.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES iamshared.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES iamshared.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES iamshared.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES iamshared.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES iamshared.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES iamshared.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES iamshared.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES iamshared.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES iamshared.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES iamshared.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES iamshared.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES iamshared.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES iamshared.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES iamshared.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES iamshared.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES iamshared.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES iamshared.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES iamshared.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES iamshared.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES iamshared.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES iamshared.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES iamshared.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES iamshared.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES iamshared.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES iamshared.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES iamshared.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES iamshared.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES iamshared.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES iamshared.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: iamshared; Owner: kcshared
--

ALTER TABLE ONLY iamshared.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES iamshared.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

