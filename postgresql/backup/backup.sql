--
-- PostgreSQL database dump
--

-- Dumped from database version 11.14
-- Dumped by pg_dump version 11.14

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

SET default_with_oids = false;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.admin_event_entity (
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


ALTER TABLE public.admin_event_entity OWNER TO bn_keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO bn_keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.authentication_execution (
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


ALTER TABLE public.authentication_execution OWNER TO bn_keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO bn_keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO bn_keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO bn_keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO bn_keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client (
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


ALTER TABLE public.client OWNER TO bn_keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO bn_keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO bn_keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO bn_keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO bn_keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO bn_keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO bn_keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO bn_keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO bn_keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_session (
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


ALTER TABLE public.client_session OWNER TO bn_keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO bn_keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO bn_keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO bn_keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO bn_keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO bn_keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO bn_keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO bn_keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO bn_keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.credential (
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


ALTER TABLE public.credential OWNER TO bn_keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.databasechangelog (
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


ALTER TABLE public.databasechangelog OWNER TO bn_keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO bn_keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO bn_keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.event_entity (
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


ALTER TABLE public.event_entity OWNER TO bn_keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO bn_keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_consent (
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


ALTER TABLE public.fed_user_consent OWNER TO bn_keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO bn_keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_credential (
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


ALTER TABLE public.fed_user_credential OWNER TO bn_keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO bn_keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO bn_keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO bn_keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO bn_keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO bn_keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO bn_keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO bn_keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.identity_provider (
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


ALTER TABLE public.identity_provider OWNER TO bn_keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO bn_keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO bn_keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO bn_keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO bn_keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO bn_keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO bn_keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO bn_keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO bn_keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO bn_keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO bn_keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO bn_keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm (
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


ALTER TABLE public.realm OWNER TO bn_keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO bn_keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO bn_keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO bn_keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO bn_keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO bn_keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO bn_keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO bn_keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO bn_keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO bn_keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO bn_keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO bn_keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO bn_keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO bn_keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO bn_keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO bn_keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
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


ALTER TABLE public.resource_server_perm_ticket OWNER TO bn_keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO bn_keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO bn_keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO bn_keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO bn_keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO bn_keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO bn_keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO bn_keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO bn_keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO bn_keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO bn_keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_entity (
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


ALTER TABLE public.user_entity OWNER TO bn_keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO bn_keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO bn_keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO bn_keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO bn_keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO bn_keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO bn_keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO bn_keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_session (
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


ALTER TABLE public.user_session OWNER TO bn_keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO bn_keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO bn_keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO bn_keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
7e15ead8-b776-4bae-8007-01b24edbd43f	\N	auth-cookie	master	4e8a0590-6aad-4477-9a0a-96aea4dad26a	2	10	f	\N	\N
1ad96ec1-3966-4260-a168-f1d009ec96b3	\N	auth-spnego	master	4e8a0590-6aad-4477-9a0a-96aea4dad26a	3	20	f	\N	\N
5fe62b54-66da-42ca-b0f9-94727424c1c5	\N	identity-provider-redirector	master	4e8a0590-6aad-4477-9a0a-96aea4dad26a	2	25	f	\N	\N
faa8d1b6-2213-4ed7-b7ff-4130cd846d23	\N	\N	master	4e8a0590-6aad-4477-9a0a-96aea4dad26a	2	30	t	1d770e86-7554-413e-ab27-4c8779533e6d	\N
1d2949bd-9d78-4044-abe5-56cc54e3294d	\N	auth-username-password-form	master	1d770e86-7554-413e-ab27-4c8779533e6d	0	10	f	\N	\N
4a7e66be-26df-48b4-bc6a-24a07a5b7304	\N	\N	master	1d770e86-7554-413e-ab27-4c8779533e6d	1	20	t	54612054-8b98-4843-9fec-9152372932b4	\N
dc4dbcf1-591e-4ed9-811d-3ce2b3b16aa8	\N	conditional-user-configured	master	54612054-8b98-4843-9fec-9152372932b4	0	10	f	\N	\N
bfbce5dd-48ef-4816-b385-ba80dfdb65c1	\N	auth-otp-form	master	54612054-8b98-4843-9fec-9152372932b4	0	20	f	\N	\N
d6764cb4-52fc-47be-a876-a1e38d655ecb	\N	direct-grant-validate-username	master	fd73f947-a8aa-421e-82f3-3800e6c94b45	0	10	f	\N	\N
a3c0d662-64e6-4341-9693-e9dfff8168e9	\N	direct-grant-validate-password	master	fd73f947-a8aa-421e-82f3-3800e6c94b45	0	20	f	\N	\N
1a12bced-42ee-41dd-ae64-db3c726fdfa1	\N	\N	master	fd73f947-a8aa-421e-82f3-3800e6c94b45	1	30	t	da30aaf9-fc64-4cdf-b26a-e5f43f19c7ce	\N
4dd621e2-cd8f-4246-b8b5-f887da5f0f32	\N	conditional-user-configured	master	da30aaf9-fc64-4cdf-b26a-e5f43f19c7ce	0	10	f	\N	\N
4493a081-d9a6-42eb-aae5-ac02a0c70db1	\N	direct-grant-validate-otp	master	da30aaf9-fc64-4cdf-b26a-e5f43f19c7ce	0	20	f	\N	\N
5a7409df-75c5-457c-b99f-070380c45d9a	\N	registration-page-form	master	a861d625-6b3c-44bd-b56b-effc98f526ad	0	10	t	818fc4cd-622d-4a0c-8386-b0a165744178	\N
1297ccbd-7184-4211-a8c2-68ddabb434b5	\N	registration-user-creation	master	818fc4cd-622d-4a0c-8386-b0a165744178	0	20	f	\N	\N
de62e93b-993c-4519-a473-97a6a17a219a	\N	registration-profile-action	master	818fc4cd-622d-4a0c-8386-b0a165744178	0	40	f	\N	\N
ec586407-b157-4d8b-a6d4-f2536a6816f4	\N	registration-password-action	master	818fc4cd-622d-4a0c-8386-b0a165744178	0	50	f	\N	\N
51f5ab75-3989-4b18-a70d-ae746e997ded	\N	registration-recaptcha-action	master	818fc4cd-622d-4a0c-8386-b0a165744178	3	60	f	\N	\N
1aa02bde-1a6f-4c4e-9167-6a52fb849025	\N	reset-credentials-choose-user	master	da0dc6b9-80fa-4fb4-8aa8-a4e10128b113	0	10	f	\N	\N
39aa1696-b852-46c7-921a-2612fff37020	\N	reset-credential-email	master	da0dc6b9-80fa-4fb4-8aa8-a4e10128b113	0	20	f	\N	\N
d11f8e1c-2451-4868-9d99-414c2d89d9d0	\N	reset-password	master	da0dc6b9-80fa-4fb4-8aa8-a4e10128b113	0	30	f	\N	\N
480c9b45-ae0b-4f6e-ba51-a8e75b6e7a34	\N	\N	master	da0dc6b9-80fa-4fb4-8aa8-a4e10128b113	1	40	t	f5ec2919-5f0a-4795-b2db-1d885c356236	\N
88fdfe19-dddb-4f9d-9363-28781ca7e5bf	\N	conditional-user-configured	master	f5ec2919-5f0a-4795-b2db-1d885c356236	0	10	f	\N	\N
4a9a6245-3ac4-4afa-a944-f6bf452e2bb4	\N	reset-otp	master	f5ec2919-5f0a-4795-b2db-1d885c356236	0	20	f	\N	\N
fd4d62f7-7234-448a-af3d-d9f68e267c83	\N	client-secret	master	f6bf4820-ee31-470b-8a79-c405e5f0cbe8	2	10	f	\N	\N
f7b8aa3d-fd89-4458-bca8-f80db551653b	\N	client-jwt	master	f6bf4820-ee31-470b-8a79-c405e5f0cbe8	2	20	f	\N	\N
f65f56d6-5722-467f-8e22-ad61d867f2c2	\N	client-secret-jwt	master	f6bf4820-ee31-470b-8a79-c405e5f0cbe8	2	30	f	\N	\N
6bbfad32-bef7-4e37-a3e0-033aa5d8c58b	\N	client-x509	master	f6bf4820-ee31-470b-8a79-c405e5f0cbe8	2	40	f	\N	\N
50c9b0f4-0042-469c-b326-cb732b150466	\N	idp-review-profile	master	1da7d5c3-0bf3-473f-823d-60b509cdc10b	0	10	f	\N	e783109a-6da6-48ca-a776-de7b79c02fb0
8738da7a-9469-4d1f-9abc-1a27f0a547e3	\N	\N	master	1da7d5c3-0bf3-473f-823d-60b509cdc10b	0	20	t	219401a4-5f2a-41aa-a6b8-bc3d7b58f28d	\N
4c8a0703-e17c-491c-93fc-ac10d885d75b	\N	idp-create-user-if-unique	master	219401a4-5f2a-41aa-a6b8-bc3d7b58f28d	2	10	f	\N	e28e2491-d438-4e2e-acbc-d9184424b05c
95c624bc-4ec6-498e-8ea2-91a88b37e25f	\N	\N	master	219401a4-5f2a-41aa-a6b8-bc3d7b58f28d	2	20	t	4d2074e2-775d-4ab8-8b77-42ce54b0ffca	\N
c26f2c86-1eaa-4839-9afb-ade786c54de3	\N	idp-confirm-link	master	4d2074e2-775d-4ab8-8b77-42ce54b0ffca	0	10	f	\N	\N
ee172bc3-602e-49ce-9b31-cc51f7b94795	\N	\N	master	4d2074e2-775d-4ab8-8b77-42ce54b0ffca	0	20	t	24271bd8-2939-450b-961a-2558c2e3259c	\N
61fb680c-da0f-4f1c-9a1d-7a8813571c43	\N	idp-email-verification	master	24271bd8-2939-450b-961a-2558c2e3259c	2	10	f	\N	\N
7a41f2f1-c8ac-4799-a77b-bc543378244d	\N	\N	master	24271bd8-2939-450b-961a-2558c2e3259c	2	20	t	602e39ed-243d-406e-a444-ebc2ba2f4ad8	\N
424d7ab3-1eaf-419e-8f2f-b5da67d4bff0	\N	idp-username-password-form	master	602e39ed-243d-406e-a444-ebc2ba2f4ad8	0	10	f	\N	\N
73a6c93b-1af2-4e19-9704-b5043c6ad592	\N	\N	master	602e39ed-243d-406e-a444-ebc2ba2f4ad8	1	20	t	7c172dc4-353a-4bb7-adb2-08b7f522b3e7	\N
c9d5f104-41ab-4306-b8db-b723d53de633	\N	conditional-user-configured	master	7c172dc4-353a-4bb7-adb2-08b7f522b3e7	0	10	f	\N	\N
9d80ceec-9f46-4e1c-89d0-909c43d5df10	\N	auth-otp-form	master	7c172dc4-353a-4bb7-adb2-08b7f522b3e7	0	20	f	\N	\N
744c4b63-d898-4dc4-870e-b7a83213dabf	\N	http-basic-authenticator	master	c332f069-c71f-4fa7-89ac-cda459a1f89b	0	10	f	\N	\N
644852d3-7e1c-45a3-9a71-0fd8b1492a59	\N	docker-http-basic-authenticator	master	12ba5142-fa8f-4411-8414-98b1b53cfbaf	0	10	f	\N	\N
48a48109-12ae-4fea-af99-7bfcac8aaa0c	\N	no-cookie-redirect	master	56483a4d-76d8-48cc-8d36-9be8b19eafc0	0	10	f	\N	\N
e906f5a9-9af1-45b6-a7fa-91c3b0493a3b	\N	\N	master	56483a4d-76d8-48cc-8d36-9be8b19eafc0	0	20	t	658b005f-26e6-4673-ba22-0172eb59a911	\N
53475cae-ba39-42be-8e08-cc4cd4de8898	\N	basic-auth	master	658b005f-26e6-4673-ba22-0172eb59a911	0	10	f	\N	\N
597391c5-e983-4461-b076-80807248dc47	\N	basic-auth-otp	master	658b005f-26e6-4673-ba22-0172eb59a911	3	20	f	\N	\N
b958cef8-b1d4-4a76-939b-055b30bccbda	\N	auth-spnego	master	658b005f-26e6-4673-ba22-0172eb59a911	3	30	f	\N	\N
a6228c7e-681c-49df-8835-e6f3bf9aa125	\N	auth-cookie	Store Test Realm	f4accfe6-a96c-4d8c-a4b4-888ec087eec5	2	10	f	\N	\N
fa0fa8e7-f27f-4b45-8e20-c2312e9f8664	\N	auth-spnego	Store Test Realm	f4accfe6-a96c-4d8c-a4b4-888ec087eec5	3	20	f	\N	\N
ac55b073-ad88-491e-96f4-2b71411b7d00	\N	identity-provider-redirector	Store Test Realm	f4accfe6-a96c-4d8c-a4b4-888ec087eec5	2	25	f	\N	\N
0f739caf-d1cd-44a2-965a-05ff10976147	\N	\N	Store Test Realm	f4accfe6-a96c-4d8c-a4b4-888ec087eec5	2	30	t	0fdd4647-ed1e-49b7-afa0-2f815cedfa59	\N
f0ad0b7c-0657-4f5f-9dad-96743bd80827	\N	auth-username-password-form	Store Test Realm	0fdd4647-ed1e-49b7-afa0-2f815cedfa59	0	10	f	\N	\N
da3d3063-e5f3-4454-8517-44f8e0430111	\N	\N	Store Test Realm	0fdd4647-ed1e-49b7-afa0-2f815cedfa59	1	20	t	b6911728-62a9-4a9e-92bf-7ae9baf889fa	\N
5de453a2-ed2c-4b59-ae2d-dade9bec3d9b	\N	conditional-user-configured	Store Test Realm	b6911728-62a9-4a9e-92bf-7ae9baf889fa	0	10	f	\N	\N
aff56217-5f59-430f-a712-46dbb5d2ec84	\N	auth-otp-form	Store Test Realm	b6911728-62a9-4a9e-92bf-7ae9baf889fa	0	20	f	\N	\N
c1a16c5b-5fa8-4b63-b654-71bdee87d8bc	\N	direct-grant-validate-username	Store Test Realm	180081f1-14b1-4a8c-988c-da581beaa76d	0	10	f	\N	\N
35c9fb8d-25a4-4bdd-9848-f6a4f7fc316c	\N	direct-grant-validate-password	Store Test Realm	180081f1-14b1-4a8c-988c-da581beaa76d	0	20	f	\N	\N
52957cd6-850e-4d0f-bc38-e00f146a7a27	\N	\N	Store Test Realm	180081f1-14b1-4a8c-988c-da581beaa76d	1	30	t	644cdf7a-2204-466f-ac20-4d5dfad79b9a	\N
8e7f978e-dc16-4de5-84f8-a1fd673f1753	\N	conditional-user-configured	Store Test Realm	644cdf7a-2204-466f-ac20-4d5dfad79b9a	0	10	f	\N	\N
62c0320b-47e7-41d7-a3af-baf8372fdad0	\N	direct-grant-validate-otp	Store Test Realm	644cdf7a-2204-466f-ac20-4d5dfad79b9a	0	20	f	\N	\N
e9df4e72-c433-4760-b7ec-c04a9e9bbf84	\N	registration-page-form	Store Test Realm	52ad4e88-7c84-4ba5-8d6a-2adc5d610fac	0	10	t	c2b0eb2b-2b40-4576-98a5-4614d7195982	\N
dbab50e1-ab1e-4fb2-8db0-2a1a42081a92	\N	registration-user-creation	Store Test Realm	c2b0eb2b-2b40-4576-98a5-4614d7195982	0	20	f	\N	\N
ffa76528-b88b-4a66-bafd-e5cbaf849b50	\N	registration-profile-action	Store Test Realm	c2b0eb2b-2b40-4576-98a5-4614d7195982	0	40	f	\N	\N
9060e93f-da48-40fc-b080-75e1edd5f175	\N	registration-password-action	Store Test Realm	c2b0eb2b-2b40-4576-98a5-4614d7195982	0	50	f	\N	\N
aaebbe69-c975-4158-b623-07177833a0b3	\N	registration-recaptcha-action	Store Test Realm	c2b0eb2b-2b40-4576-98a5-4614d7195982	3	60	f	\N	\N
6bb61ccd-f69a-4dfa-ba8e-9a0f7d686bd0	\N	reset-credentials-choose-user	Store Test Realm	f9e90fea-910c-4472-9c2f-fba5d7694794	0	10	f	\N	\N
303c6ad1-f908-4351-a4fd-cbfd18f27114	\N	reset-credential-email	Store Test Realm	f9e90fea-910c-4472-9c2f-fba5d7694794	0	20	f	\N	\N
5bded161-10cc-4d02-8bb6-d48c9f76d271	\N	reset-password	Store Test Realm	f9e90fea-910c-4472-9c2f-fba5d7694794	0	30	f	\N	\N
d59ab325-911c-42d5-a13b-523c8a060ae3	\N	\N	Store Test Realm	f9e90fea-910c-4472-9c2f-fba5d7694794	1	40	t	736eac11-2ba2-4a47-985e-239f575140a0	\N
0404f90f-c254-43f3-9b5d-a857c0c0c099	\N	conditional-user-configured	Store Test Realm	736eac11-2ba2-4a47-985e-239f575140a0	0	10	f	\N	\N
a6a8f808-2339-4545-ba5f-de919881755d	\N	reset-otp	Store Test Realm	736eac11-2ba2-4a47-985e-239f575140a0	0	20	f	\N	\N
2deb4fa4-1de7-4bdd-8e9a-d7572fe8a80b	\N	client-secret	Store Test Realm	116dbcc7-8ab8-4c11-8e09-44cde9ce99d9	2	10	f	\N	\N
6db3029f-284b-4991-92f3-47a4188e4cb2	\N	client-jwt	Store Test Realm	116dbcc7-8ab8-4c11-8e09-44cde9ce99d9	2	20	f	\N	\N
df3b02d0-cb38-4f47-880a-0fa7b014af3b	\N	client-secret-jwt	Store Test Realm	116dbcc7-8ab8-4c11-8e09-44cde9ce99d9	2	30	f	\N	\N
29c19d2d-5730-4547-9b3e-f70310d55492	\N	client-x509	Store Test Realm	116dbcc7-8ab8-4c11-8e09-44cde9ce99d9	2	40	f	\N	\N
e72a3748-1b45-4091-bfe0-ccd341e9d9bd	\N	idp-review-profile	Store Test Realm	b3742021-c4d3-4932-8d01-69b1a14b9975	0	10	f	\N	9b21e498-26d3-41b4-a433-f59b295e401f
541ddcc2-04a5-43d2-9da6-d515905d22ae	\N	\N	Store Test Realm	b3742021-c4d3-4932-8d01-69b1a14b9975	0	20	t	badf2f51-a555-49da-9122-4d45656b74d3	\N
65406a07-0360-45b3-954f-e572e4c03dc7	\N	idp-create-user-if-unique	Store Test Realm	badf2f51-a555-49da-9122-4d45656b74d3	2	10	f	\N	d4c98a74-3f03-4a7d-89fa-9cbe93ed77cc
781d8f29-83b3-46d4-be7d-a164dfd72870	\N	\N	Store Test Realm	badf2f51-a555-49da-9122-4d45656b74d3	2	20	t	2336eb9b-53eb-4145-8779-b675467c278b	\N
19bc2901-f26c-4128-9cf3-54d75ecf7f02	\N	idp-confirm-link	Store Test Realm	2336eb9b-53eb-4145-8779-b675467c278b	0	10	f	\N	\N
19e989f0-fcbf-471b-a2fb-98ab6a8c5d3b	\N	\N	Store Test Realm	2336eb9b-53eb-4145-8779-b675467c278b	0	20	t	1ba3d25a-0aa6-42af-894b-5d719fb141f0	\N
629b6524-6e7c-41e3-94d9-a328f679ca13	\N	idp-email-verification	Store Test Realm	1ba3d25a-0aa6-42af-894b-5d719fb141f0	2	10	f	\N	\N
93a9b9ec-bf23-4dca-8295-9990f93e7d55	\N	\N	Store Test Realm	1ba3d25a-0aa6-42af-894b-5d719fb141f0	2	20	t	421824ff-4598-4ee7-a53c-0c55ce66ede6	\N
7079aefc-40a4-49b0-b60f-bee37a04139f	\N	idp-username-password-form	Store Test Realm	421824ff-4598-4ee7-a53c-0c55ce66ede6	0	10	f	\N	\N
3c9e64c4-1411-48fd-b75e-94dfb48def93	\N	\N	Store Test Realm	421824ff-4598-4ee7-a53c-0c55ce66ede6	1	20	t	e1cedaa5-d235-44ec-b61b-70acd92ba481	\N
f3cbfefb-327c-4a12-8511-a4120037f83a	\N	conditional-user-configured	Store Test Realm	e1cedaa5-d235-44ec-b61b-70acd92ba481	0	10	f	\N	\N
d14b7389-ea79-4847-b3c7-fc4a1c59b6e7	\N	auth-otp-form	Store Test Realm	e1cedaa5-d235-44ec-b61b-70acd92ba481	0	20	f	\N	\N
965319bd-458b-4235-89a5-134b3c298eef	\N	http-basic-authenticator	Store Test Realm	680588bb-52dc-4fdc-9b5d-b6bf8e4fda08	0	10	f	\N	\N
1a87da09-a7b6-429e-86bb-ba9f3e336ba7	\N	docker-http-basic-authenticator	Store Test Realm	babe75aa-d43a-4b22-8568-71adad7ba74d	0	10	f	\N	\N
9ecf08ef-f4d2-40be-9b4c-5b357fc6daf9	\N	no-cookie-redirect	Store Test Realm	dd0962c7-2126-4efd-9aa2-88a41c2478b9	0	10	f	\N	\N
91a94315-fb81-4d84-84b0-f42707d48b0a	\N	\N	Store Test Realm	dd0962c7-2126-4efd-9aa2-88a41c2478b9	0	20	t	7f60770f-b9d2-4eeb-a8ba-1e1750756495	\N
ef0d506a-0d68-4bec-a546-e2b3f384c320	\N	basic-auth	Store Test Realm	7f60770f-b9d2-4eeb-a8ba-1e1750756495	0	10	f	\N	\N
de734ec2-44a8-431d-8c43-18698aeda227	\N	basic-auth-otp	Store Test Realm	7f60770f-b9d2-4eeb-a8ba-1e1750756495	3	20	f	\N	\N
7a6349a4-23a0-43e3-b7f1-9a7efe2093b0	\N	auth-spnego	Store Test Realm	7f60770f-b9d2-4eeb-a8ba-1e1750756495	3	30	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
4e8a0590-6aad-4477-9a0a-96aea4dad26a	browser	browser based authentication	master	basic-flow	t	t
1d770e86-7554-413e-ab27-4c8779533e6d	forms	Username, password, otp and other auth forms.	master	basic-flow	f	t
54612054-8b98-4843-9fec-9152372932b4	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
fd73f947-a8aa-421e-82f3-3800e6c94b45	direct grant	OpenID Connect Resource Owner Grant	master	basic-flow	t	t
da30aaf9-fc64-4cdf-b26a-e5f43f19c7ce	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
a861d625-6b3c-44bd-b56b-effc98f526ad	registration	registration flow	master	basic-flow	t	t
818fc4cd-622d-4a0c-8386-b0a165744178	registration form	registration form	master	form-flow	f	t
da0dc6b9-80fa-4fb4-8aa8-a4e10128b113	reset credentials	Reset credentials for a user if they forgot their password or something	master	basic-flow	t	t
f5ec2919-5f0a-4795-b2db-1d885c356236	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	master	basic-flow	f	t
f6bf4820-ee31-470b-8a79-c405e5f0cbe8	clients	Base authentication for clients	master	client-flow	t	t
1da7d5c3-0bf3-473f-823d-60b509cdc10b	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	master	basic-flow	t	t
219401a4-5f2a-41aa-a6b8-bc3d7b58f28d	User creation or linking	Flow for the existing/non-existing user alternatives	master	basic-flow	f	t
4d2074e2-775d-4ab8-8b77-42ce54b0ffca	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	master	basic-flow	f	t
24271bd8-2939-450b-961a-2558c2e3259c	Account verification options	Method with which to verity the existing account	master	basic-flow	f	t
602e39ed-243d-406e-a444-ebc2ba2f4ad8	Verify Existing Account by Re-authentication	Reauthentication of existing account	master	basic-flow	f	t
7c172dc4-353a-4bb7-adb2-08b7f522b3e7	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
c332f069-c71f-4fa7-89ac-cda459a1f89b	saml ecp	SAML ECP Profile Authentication Flow	master	basic-flow	t	t
12ba5142-fa8f-4411-8414-98b1b53cfbaf	docker auth	Used by Docker clients to authenticate against the IDP	master	basic-flow	t	t
56483a4d-76d8-48cc-8d36-9be8b19eafc0	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	master	basic-flow	t	t
658b005f-26e6-4673-ba22-0172eb59a911	Authentication Options	Authentication options.	master	basic-flow	f	t
f4accfe6-a96c-4d8c-a4b4-888ec087eec5	browser	browser based authentication	Store Test Realm	basic-flow	t	t
0fdd4647-ed1e-49b7-afa0-2f815cedfa59	forms	Username, password, otp and other auth forms.	Store Test Realm	basic-flow	f	t
b6911728-62a9-4a9e-92bf-7ae9baf889fa	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	Store Test Realm	basic-flow	f	t
180081f1-14b1-4a8c-988c-da581beaa76d	direct grant	OpenID Connect Resource Owner Grant	Store Test Realm	basic-flow	t	t
644cdf7a-2204-466f-ac20-4d5dfad79b9a	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	Store Test Realm	basic-flow	f	t
52ad4e88-7c84-4ba5-8d6a-2adc5d610fac	registration	registration flow	Store Test Realm	basic-flow	t	t
c2b0eb2b-2b40-4576-98a5-4614d7195982	registration form	registration form	Store Test Realm	form-flow	f	t
f9e90fea-910c-4472-9c2f-fba5d7694794	reset credentials	Reset credentials for a user if they forgot their password or something	Store Test Realm	basic-flow	t	t
736eac11-2ba2-4a47-985e-239f575140a0	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	Store Test Realm	basic-flow	f	t
116dbcc7-8ab8-4c11-8e09-44cde9ce99d9	clients	Base authentication for clients	Store Test Realm	client-flow	t	t
b3742021-c4d3-4932-8d01-69b1a14b9975	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	Store Test Realm	basic-flow	t	t
badf2f51-a555-49da-9122-4d45656b74d3	User creation or linking	Flow for the existing/non-existing user alternatives	Store Test Realm	basic-flow	f	t
2336eb9b-53eb-4145-8779-b675467c278b	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	Store Test Realm	basic-flow	f	t
1ba3d25a-0aa6-42af-894b-5d719fb141f0	Account verification options	Method with which to verity the existing account	Store Test Realm	basic-flow	f	t
421824ff-4598-4ee7-a53c-0c55ce66ede6	Verify Existing Account by Re-authentication	Reauthentication of existing account	Store Test Realm	basic-flow	f	t
e1cedaa5-d235-44ec-b61b-70acd92ba481	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	Store Test Realm	basic-flow	f	t
680588bb-52dc-4fdc-9b5d-b6bf8e4fda08	saml ecp	SAML ECP Profile Authentication Flow	Store Test Realm	basic-flow	t	t
babe75aa-d43a-4b22-8568-71adad7ba74d	docker auth	Used by Docker clients to authenticate against the IDP	Store Test Realm	basic-flow	t	t
dd0962c7-2126-4efd-9aa2-88a41c2478b9	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	Store Test Realm	basic-flow	t	t
7f60770f-b9d2-4eeb-a8ba-1e1750756495	Authentication Options	Authentication options.	Store Test Realm	basic-flow	f	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
e783109a-6da6-48ca-a776-de7b79c02fb0	review profile config	master
e28e2491-d438-4e2e-acbc-d9184424b05c	create unique user config	master
9b21e498-26d3-41b4-a433-f59b295e401f	review profile config	Store Test Realm
d4c98a74-3f03-4a7d-89fa-9cbe93ed77cc	create unique user config	Store Test Realm
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
e783109a-6da6-48ca-a776-de7b79c02fb0	missing	update.profile.on.first.login
e28e2491-d438-4e2e-acbc-d9184424b05c	false	require.password.update.after.registration
9b21e498-26d3-41b4-a433-f59b295e401f	missing	update.profile.on.first.login
d4c98a74-3f03-4a7d-89fa-9cbe93ed77cc	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	f	master-realm	0	f	\N	\N	t	\N	f	master	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
3db5e1fc-aaa8-4c2f-871d-20397d651a3d	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
213f234c-fd1d-40ed-b307-f005c99e02b9	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
96ee517f-0d94-45f5-9314-2ed840aaa03f	t	f	broker	0	f	\N	\N	t	\N	f	master	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
5e41cd16-605e-4533-884e-f8f2a4964c50	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	master	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
89e3d58f-be11-455f-a9c1-7952be3d31e8	t	f	admin-cli	0	t	\N	\N	f	\N	f	master	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
5fab1a22-e6b6-4de7-a907-b12a3a35e691	t	t	store-test-app	0	t	\N	\N	f	\N	f	Store Test Realm	openid-connect	-1	f	f	store-test-app	f	client-secret	\N	\N	\N	t	f	t	f
9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	f	Store Test Realm-realm	0	f	\N	\N	t	\N	f	master	\N	0	f	f	Store Test Realm Realm	f	client-secret	\N	\N	\N	t	f	f	f
afd475fc-72ae-49ee-a173-6661d42e58ad	t	f	realm-management	0	f	\N	\N	t	\N	f	Store Test Realm	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	t	f	account	0	t	\N	/realms/Store Test Realm/account/	f	\N	f	Store Test Realm	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
78ab8f12-3588-4892-83f3-f243576852c2	t	f	account-console	0	t	\N	/realms/Store Test Realm/account/	f	\N	f	Store Test Realm	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
700d6658-8d75-4eed-8051-da4d153dbde9	t	f	broker	0	f	\N	\N	t	\N	f	Store Test Realm	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
2931ab87-d448-4787-86d5-9e3ec3a2deaf	t	f	security-admin-console	0	t	\N	/admin/Store Test Realm/console/	f	\N	f	Store Test Realm	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
36ccf00e-aef3-4c5d-9a26-8d7c960322c0	t	f	admin-cli	0	t	\N	\N	f	\N	f	Store Test Realm	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
213f234c-fd1d-40ed-b307-f005c99e02b9	S256	pkce.code.challenge.method
5e41cd16-605e-4533-884e-f8f2a4964c50	S256	pkce.code.challenge.method
78ab8f12-3588-4892-83f3-f243576852c2	S256	pkce.code.challenge.method
2931ab87-d448-4787-86d5-9e3ec3a2deaf	S256	pkce.code.challenge.method
5fab1a22-e6b6-4de7-a907-b12a3a35e691	true	backchannel.logout.session.required
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	backchannel.logout.revoke.offline.tokens
5fab1a22-e6b6-4de7-a907-b12a3a35e691	3600	access.token.lifespan
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	saml.artifact.binding
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	saml.server.signature
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	saml.server.signature.keyinfo.ext
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	saml.assertion.signature
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	saml.client.signature
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	saml.encrypt
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	saml.authnstatement
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	saml.onetimeuse.condition
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	saml_force_name_id_format
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	saml.multivalued.roles
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	saml.force.post.binding
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	exclude.session.state.from.auth.response
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	oauth2.device.authorization.grant.enabled
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	oidc.ciba.grant.enabled
5fab1a22-e6b6-4de7-a907-b12a3a35e691	true	use.refresh.tokens
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	id.token.as.detached.signature
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	tls.client.certificate.bound.access.tokens
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	require.pushed.authorization.requests
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	client_credentials.use_refresh_token
5fab1a22-e6b6-4de7-a907-b12a3a35e691	false	display.on.consent.screen
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
481bd562-29ea-497c-af9b-4935de901794	offline_access	master	OpenID Connect built-in scope: offline_access	openid-connect
aa36e00c-9258-4150-8232-bbf30cd0607f	role_list	master	SAML role list	saml
e5ce1ddf-d14d-4cf2-a794-439adfb09c31	profile	master	OpenID Connect built-in scope: profile	openid-connect
81d0be7d-40d8-4415-8bab-151da5f49105	email	master	OpenID Connect built-in scope: email	openid-connect
f8bf5f1a-350c-46a6-b4e7-0ffb33d77e49	address	master	OpenID Connect built-in scope: address	openid-connect
57c8eb6a-2a04-44be-9d1b-b4477911f072	phone	master	OpenID Connect built-in scope: phone	openid-connect
78fd28f2-102f-4081-a73e-14f06a24da0a	roles	master	OpenID Connect scope for add user roles to the access token	openid-connect
3bd97282-e6ce-4df8-9b0e-10002208b817	web-origins	master	OpenID Connect scope for add allowed web origins to the access token	openid-connect
91c8a807-6e74-4cea-8b61-a28988fb2845	microprofile-jwt	master	Microprofile - JWT built-in scope	openid-connect
f29a8df1-65d1-4aff-808c-a6ed372b55bb	offline_access	Store Test Realm	OpenID Connect built-in scope: offline_access	openid-connect
3285397d-09bf-475e-84a1-aac370aefd90	role_list	Store Test Realm	SAML role list	saml
5a9c912f-623e-4dbf-a98b-d1a4e1ceb315	profile	Store Test Realm	OpenID Connect built-in scope: profile	openid-connect
142b7e8d-bedf-4505-859d-ec908915bb3d	email	Store Test Realm	OpenID Connect built-in scope: email	openid-connect
9beb9f31-86dc-4be7-bca4-0ffd9c83de3f	address	Store Test Realm	OpenID Connect built-in scope: address	openid-connect
c725bce1-46f4-449f-9104-9703c2a2974e	phone	Store Test Realm	OpenID Connect built-in scope: phone	openid-connect
317b49ac-a743-4e40-b768-a743e876c292	roles	Store Test Realm	OpenID Connect scope for add user roles to the access token	openid-connect
42017f39-8d8a-46cb-beb1-e2686cc6c126	web-origins	Store Test Realm	OpenID Connect scope for add allowed web origins to the access token	openid-connect
e35b190a-7e82-4faf-8b62-ec2d73164c21	microprofile-jwt	Store Test Realm	Microprofile - JWT built-in scope	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
481bd562-29ea-497c-af9b-4935de901794	true	display.on.consent.screen
481bd562-29ea-497c-af9b-4935de901794	${offlineAccessScopeConsentText}	consent.screen.text
aa36e00c-9258-4150-8232-bbf30cd0607f	true	display.on.consent.screen
aa36e00c-9258-4150-8232-bbf30cd0607f	${samlRoleListScopeConsentText}	consent.screen.text
e5ce1ddf-d14d-4cf2-a794-439adfb09c31	true	display.on.consent.screen
e5ce1ddf-d14d-4cf2-a794-439adfb09c31	${profileScopeConsentText}	consent.screen.text
e5ce1ddf-d14d-4cf2-a794-439adfb09c31	true	include.in.token.scope
81d0be7d-40d8-4415-8bab-151da5f49105	true	display.on.consent.screen
81d0be7d-40d8-4415-8bab-151da5f49105	${emailScopeConsentText}	consent.screen.text
81d0be7d-40d8-4415-8bab-151da5f49105	true	include.in.token.scope
f8bf5f1a-350c-46a6-b4e7-0ffb33d77e49	true	display.on.consent.screen
f8bf5f1a-350c-46a6-b4e7-0ffb33d77e49	${addressScopeConsentText}	consent.screen.text
f8bf5f1a-350c-46a6-b4e7-0ffb33d77e49	true	include.in.token.scope
57c8eb6a-2a04-44be-9d1b-b4477911f072	true	display.on.consent.screen
57c8eb6a-2a04-44be-9d1b-b4477911f072	${phoneScopeConsentText}	consent.screen.text
57c8eb6a-2a04-44be-9d1b-b4477911f072	true	include.in.token.scope
78fd28f2-102f-4081-a73e-14f06a24da0a	true	display.on.consent.screen
78fd28f2-102f-4081-a73e-14f06a24da0a	${rolesScopeConsentText}	consent.screen.text
78fd28f2-102f-4081-a73e-14f06a24da0a	false	include.in.token.scope
3bd97282-e6ce-4df8-9b0e-10002208b817	false	display.on.consent.screen
3bd97282-e6ce-4df8-9b0e-10002208b817		consent.screen.text
3bd97282-e6ce-4df8-9b0e-10002208b817	false	include.in.token.scope
91c8a807-6e74-4cea-8b61-a28988fb2845	false	display.on.consent.screen
91c8a807-6e74-4cea-8b61-a28988fb2845	true	include.in.token.scope
f29a8df1-65d1-4aff-808c-a6ed372b55bb	true	display.on.consent.screen
f29a8df1-65d1-4aff-808c-a6ed372b55bb	${offlineAccessScopeConsentText}	consent.screen.text
3285397d-09bf-475e-84a1-aac370aefd90	true	display.on.consent.screen
3285397d-09bf-475e-84a1-aac370aefd90	${samlRoleListScopeConsentText}	consent.screen.text
5a9c912f-623e-4dbf-a98b-d1a4e1ceb315	true	display.on.consent.screen
5a9c912f-623e-4dbf-a98b-d1a4e1ceb315	${profileScopeConsentText}	consent.screen.text
5a9c912f-623e-4dbf-a98b-d1a4e1ceb315	true	include.in.token.scope
142b7e8d-bedf-4505-859d-ec908915bb3d	true	display.on.consent.screen
142b7e8d-bedf-4505-859d-ec908915bb3d	${emailScopeConsentText}	consent.screen.text
142b7e8d-bedf-4505-859d-ec908915bb3d	true	include.in.token.scope
9beb9f31-86dc-4be7-bca4-0ffd9c83de3f	true	display.on.consent.screen
9beb9f31-86dc-4be7-bca4-0ffd9c83de3f	${addressScopeConsentText}	consent.screen.text
9beb9f31-86dc-4be7-bca4-0ffd9c83de3f	true	include.in.token.scope
c725bce1-46f4-449f-9104-9703c2a2974e	true	display.on.consent.screen
c725bce1-46f4-449f-9104-9703c2a2974e	${phoneScopeConsentText}	consent.screen.text
c725bce1-46f4-449f-9104-9703c2a2974e	true	include.in.token.scope
317b49ac-a743-4e40-b768-a743e876c292	true	display.on.consent.screen
317b49ac-a743-4e40-b768-a743e876c292	${rolesScopeConsentText}	consent.screen.text
317b49ac-a743-4e40-b768-a743e876c292	false	include.in.token.scope
42017f39-8d8a-46cb-beb1-e2686cc6c126	false	display.on.consent.screen
42017f39-8d8a-46cb-beb1-e2686cc6c126		consent.screen.text
42017f39-8d8a-46cb-beb1-e2686cc6c126	false	include.in.token.scope
e35b190a-7e82-4faf-8b62-ec2d73164c21	false	display.on.consent.screen
e35b190a-7e82-4faf-8b62-ec2d73164c21	true	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
3db5e1fc-aaa8-4c2f-871d-20397d651a3d	e5ce1ddf-d14d-4cf2-a794-439adfb09c31	t
3db5e1fc-aaa8-4c2f-871d-20397d651a3d	81d0be7d-40d8-4415-8bab-151da5f49105	t
3db5e1fc-aaa8-4c2f-871d-20397d651a3d	3bd97282-e6ce-4df8-9b0e-10002208b817	t
3db5e1fc-aaa8-4c2f-871d-20397d651a3d	78fd28f2-102f-4081-a73e-14f06a24da0a	t
3db5e1fc-aaa8-4c2f-871d-20397d651a3d	91c8a807-6e74-4cea-8b61-a28988fb2845	f
3db5e1fc-aaa8-4c2f-871d-20397d651a3d	57c8eb6a-2a04-44be-9d1b-b4477911f072	f
3db5e1fc-aaa8-4c2f-871d-20397d651a3d	f8bf5f1a-350c-46a6-b4e7-0ffb33d77e49	f
3db5e1fc-aaa8-4c2f-871d-20397d651a3d	481bd562-29ea-497c-af9b-4935de901794	f
213f234c-fd1d-40ed-b307-f005c99e02b9	e5ce1ddf-d14d-4cf2-a794-439adfb09c31	t
213f234c-fd1d-40ed-b307-f005c99e02b9	81d0be7d-40d8-4415-8bab-151da5f49105	t
213f234c-fd1d-40ed-b307-f005c99e02b9	3bd97282-e6ce-4df8-9b0e-10002208b817	t
213f234c-fd1d-40ed-b307-f005c99e02b9	78fd28f2-102f-4081-a73e-14f06a24da0a	t
213f234c-fd1d-40ed-b307-f005c99e02b9	91c8a807-6e74-4cea-8b61-a28988fb2845	f
213f234c-fd1d-40ed-b307-f005c99e02b9	57c8eb6a-2a04-44be-9d1b-b4477911f072	f
213f234c-fd1d-40ed-b307-f005c99e02b9	f8bf5f1a-350c-46a6-b4e7-0ffb33d77e49	f
213f234c-fd1d-40ed-b307-f005c99e02b9	481bd562-29ea-497c-af9b-4935de901794	f
89e3d58f-be11-455f-a9c1-7952be3d31e8	e5ce1ddf-d14d-4cf2-a794-439adfb09c31	t
89e3d58f-be11-455f-a9c1-7952be3d31e8	81d0be7d-40d8-4415-8bab-151da5f49105	t
89e3d58f-be11-455f-a9c1-7952be3d31e8	3bd97282-e6ce-4df8-9b0e-10002208b817	t
89e3d58f-be11-455f-a9c1-7952be3d31e8	78fd28f2-102f-4081-a73e-14f06a24da0a	t
89e3d58f-be11-455f-a9c1-7952be3d31e8	91c8a807-6e74-4cea-8b61-a28988fb2845	f
89e3d58f-be11-455f-a9c1-7952be3d31e8	57c8eb6a-2a04-44be-9d1b-b4477911f072	f
89e3d58f-be11-455f-a9c1-7952be3d31e8	f8bf5f1a-350c-46a6-b4e7-0ffb33d77e49	f
89e3d58f-be11-455f-a9c1-7952be3d31e8	481bd562-29ea-497c-af9b-4935de901794	f
96ee517f-0d94-45f5-9314-2ed840aaa03f	e5ce1ddf-d14d-4cf2-a794-439adfb09c31	t
96ee517f-0d94-45f5-9314-2ed840aaa03f	81d0be7d-40d8-4415-8bab-151da5f49105	t
96ee517f-0d94-45f5-9314-2ed840aaa03f	3bd97282-e6ce-4df8-9b0e-10002208b817	t
96ee517f-0d94-45f5-9314-2ed840aaa03f	78fd28f2-102f-4081-a73e-14f06a24da0a	t
96ee517f-0d94-45f5-9314-2ed840aaa03f	91c8a807-6e74-4cea-8b61-a28988fb2845	f
96ee517f-0d94-45f5-9314-2ed840aaa03f	57c8eb6a-2a04-44be-9d1b-b4477911f072	f
96ee517f-0d94-45f5-9314-2ed840aaa03f	f8bf5f1a-350c-46a6-b4e7-0ffb33d77e49	f
96ee517f-0d94-45f5-9314-2ed840aaa03f	481bd562-29ea-497c-af9b-4935de901794	f
d0e6053f-c37b-4aed-ac33-d2b4d96709ab	e5ce1ddf-d14d-4cf2-a794-439adfb09c31	t
d0e6053f-c37b-4aed-ac33-d2b4d96709ab	81d0be7d-40d8-4415-8bab-151da5f49105	t
d0e6053f-c37b-4aed-ac33-d2b4d96709ab	3bd97282-e6ce-4df8-9b0e-10002208b817	t
d0e6053f-c37b-4aed-ac33-d2b4d96709ab	78fd28f2-102f-4081-a73e-14f06a24da0a	t
d0e6053f-c37b-4aed-ac33-d2b4d96709ab	91c8a807-6e74-4cea-8b61-a28988fb2845	f
d0e6053f-c37b-4aed-ac33-d2b4d96709ab	57c8eb6a-2a04-44be-9d1b-b4477911f072	f
d0e6053f-c37b-4aed-ac33-d2b4d96709ab	f8bf5f1a-350c-46a6-b4e7-0ffb33d77e49	f
d0e6053f-c37b-4aed-ac33-d2b4d96709ab	481bd562-29ea-497c-af9b-4935de901794	f
5e41cd16-605e-4533-884e-f8f2a4964c50	e5ce1ddf-d14d-4cf2-a794-439adfb09c31	t
5e41cd16-605e-4533-884e-f8f2a4964c50	81d0be7d-40d8-4415-8bab-151da5f49105	t
5e41cd16-605e-4533-884e-f8f2a4964c50	3bd97282-e6ce-4df8-9b0e-10002208b817	t
5e41cd16-605e-4533-884e-f8f2a4964c50	78fd28f2-102f-4081-a73e-14f06a24da0a	t
5e41cd16-605e-4533-884e-f8f2a4964c50	91c8a807-6e74-4cea-8b61-a28988fb2845	f
5e41cd16-605e-4533-884e-f8f2a4964c50	57c8eb6a-2a04-44be-9d1b-b4477911f072	f
5e41cd16-605e-4533-884e-f8f2a4964c50	f8bf5f1a-350c-46a6-b4e7-0ffb33d77e49	f
5e41cd16-605e-4533-884e-f8f2a4964c50	481bd562-29ea-497c-af9b-4935de901794	f
d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	42017f39-8d8a-46cb-beb1-e2686cc6c126	t
d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315	t
d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	142b7e8d-bedf-4505-859d-ec908915bb3d	t
d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	317b49ac-a743-4e40-b768-a743e876c292	t
d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	e35b190a-7e82-4faf-8b62-ec2d73164c21	f
d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	c725bce1-46f4-449f-9104-9703c2a2974e	f
d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	9beb9f31-86dc-4be7-bca4-0ffd9c83de3f	f
d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	f29a8df1-65d1-4aff-808c-a6ed372b55bb	f
78ab8f12-3588-4892-83f3-f243576852c2	42017f39-8d8a-46cb-beb1-e2686cc6c126	t
78ab8f12-3588-4892-83f3-f243576852c2	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315	t
78ab8f12-3588-4892-83f3-f243576852c2	142b7e8d-bedf-4505-859d-ec908915bb3d	t
78ab8f12-3588-4892-83f3-f243576852c2	317b49ac-a743-4e40-b768-a743e876c292	t
78ab8f12-3588-4892-83f3-f243576852c2	e35b190a-7e82-4faf-8b62-ec2d73164c21	f
78ab8f12-3588-4892-83f3-f243576852c2	c725bce1-46f4-449f-9104-9703c2a2974e	f
78ab8f12-3588-4892-83f3-f243576852c2	9beb9f31-86dc-4be7-bca4-0ffd9c83de3f	f
78ab8f12-3588-4892-83f3-f243576852c2	f29a8df1-65d1-4aff-808c-a6ed372b55bb	f
36ccf00e-aef3-4c5d-9a26-8d7c960322c0	42017f39-8d8a-46cb-beb1-e2686cc6c126	t
36ccf00e-aef3-4c5d-9a26-8d7c960322c0	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315	t
36ccf00e-aef3-4c5d-9a26-8d7c960322c0	142b7e8d-bedf-4505-859d-ec908915bb3d	t
36ccf00e-aef3-4c5d-9a26-8d7c960322c0	317b49ac-a743-4e40-b768-a743e876c292	t
36ccf00e-aef3-4c5d-9a26-8d7c960322c0	e35b190a-7e82-4faf-8b62-ec2d73164c21	f
36ccf00e-aef3-4c5d-9a26-8d7c960322c0	c725bce1-46f4-449f-9104-9703c2a2974e	f
36ccf00e-aef3-4c5d-9a26-8d7c960322c0	9beb9f31-86dc-4be7-bca4-0ffd9c83de3f	f
36ccf00e-aef3-4c5d-9a26-8d7c960322c0	f29a8df1-65d1-4aff-808c-a6ed372b55bb	f
700d6658-8d75-4eed-8051-da4d153dbde9	42017f39-8d8a-46cb-beb1-e2686cc6c126	t
700d6658-8d75-4eed-8051-da4d153dbde9	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315	t
700d6658-8d75-4eed-8051-da4d153dbde9	142b7e8d-bedf-4505-859d-ec908915bb3d	t
700d6658-8d75-4eed-8051-da4d153dbde9	317b49ac-a743-4e40-b768-a743e876c292	t
700d6658-8d75-4eed-8051-da4d153dbde9	e35b190a-7e82-4faf-8b62-ec2d73164c21	f
700d6658-8d75-4eed-8051-da4d153dbde9	c725bce1-46f4-449f-9104-9703c2a2974e	f
700d6658-8d75-4eed-8051-da4d153dbde9	9beb9f31-86dc-4be7-bca4-0ffd9c83de3f	f
700d6658-8d75-4eed-8051-da4d153dbde9	f29a8df1-65d1-4aff-808c-a6ed372b55bb	f
afd475fc-72ae-49ee-a173-6661d42e58ad	42017f39-8d8a-46cb-beb1-e2686cc6c126	t
afd475fc-72ae-49ee-a173-6661d42e58ad	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315	t
afd475fc-72ae-49ee-a173-6661d42e58ad	142b7e8d-bedf-4505-859d-ec908915bb3d	t
afd475fc-72ae-49ee-a173-6661d42e58ad	317b49ac-a743-4e40-b768-a743e876c292	t
afd475fc-72ae-49ee-a173-6661d42e58ad	e35b190a-7e82-4faf-8b62-ec2d73164c21	f
afd475fc-72ae-49ee-a173-6661d42e58ad	c725bce1-46f4-449f-9104-9703c2a2974e	f
afd475fc-72ae-49ee-a173-6661d42e58ad	9beb9f31-86dc-4be7-bca4-0ffd9c83de3f	f
afd475fc-72ae-49ee-a173-6661d42e58ad	f29a8df1-65d1-4aff-808c-a6ed372b55bb	f
2931ab87-d448-4787-86d5-9e3ec3a2deaf	42017f39-8d8a-46cb-beb1-e2686cc6c126	t
2931ab87-d448-4787-86d5-9e3ec3a2deaf	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315	t
2931ab87-d448-4787-86d5-9e3ec3a2deaf	142b7e8d-bedf-4505-859d-ec908915bb3d	t
2931ab87-d448-4787-86d5-9e3ec3a2deaf	317b49ac-a743-4e40-b768-a743e876c292	t
2931ab87-d448-4787-86d5-9e3ec3a2deaf	e35b190a-7e82-4faf-8b62-ec2d73164c21	f
2931ab87-d448-4787-86d5-9e3ec3a2deaf	c725bce1-46f4-449f-9104-9703c2a2974e	f
2931ab87-d448-4787-86d5-9e3ec3a2deaf	9beb9f31-86dc-4be7-bca4-0ffd9c83de3f	f
2931ab87-d448-4787-86d5-9e3ec3a2deaf	f29a8df1-65d1-4aff-808c-a6ed372b55bb	f
5fab1a22-e6b6-4de7-a907-b12a3a35e691	42017f39-8d8a-46cb-beb1-e2686cc6c126	t
5fab1a22-e6b6-4de7-a907-b12a3a35e691	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315	t
5fab1a22-e6b6-4de7-a907-b12a3a35e691	142b7e8d-bedf-4505-859d-ec908915bb3d	t
5fab1a22-e6b6-4de7-a907-b12a3a35e691	317b49ac-a743-4e40-b768-a743e876c292	t
5fab1a22-e6b6-4de7-a907-b12a3a35e691	e35b190a-7e82-4faf-8b62-ec2d73164c21	f
5fab1a22-e6b6-4de7-a907-b12a3a35e691	c725bce1-46f4-449f-9104-9703c2a2974e	f
5fab1a22-e6b6-4de7-a907-b12a3a35e691	9beb9f31-86dc-4be7-bca4-0ffd9c83de3f	f
5fab1a22-e6b6-4de7-a907-b12a3a35e691	f29a8df1-65d1-4aff-808c-a6ed372b55bb	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
481bd562-29ea-497c-af9b-4935de901794	dad13bc3-9b03-45c1-ba6d-08b4b8e7ea1b
f29a8df1-65d1-4aff-808c-a6ed372b55bb	09e95fcd-508d-4674-b00e-9e6d16402f6a
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
e5f7f017-e215-4024-a9ad-d6479bba3405	Trusted Hosts	master	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
ba00d98d-cab3-4574-b3bb-615235da0039	Consent Required	master	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
a0f9797e-f164-4675-a017-a661e4c372c5	Full Scope Disabled	master	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
22b87508-4a4a-4a61-afb1-ab9300e62cc6	Max Clients Limit	master	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
73472fbe-c305-442d-b299-5560ddc650c4	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
227cf5f9-cfc6-4c85-bb2e-ba732bad4f84	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
7af4b4a0-7c4a-44a2-b4ee-f3bf7927bdcc	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
02505eb4-ea03-4e12-8650-705d5d7dc76b	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
acbbf6e7-6acd-46b9-a857-a5f084d6eb1f	rsa-generated	master	rsa-generated	org.keycloak.keys.KeyProvider	master	\N
2c3fde24-954c-4c2a-81ea-60c54f005b24	rsa-enc-generated	master	rsa-generated	org.keycloak.keys.KeyProvider	master	\N
e691ef93-0679-40fd-bda4-7d6628868ac7	hmac-generated	master	hmac-generated	org.keycloak.keys.KeyProvider	master	\N
4f6c084a-0d70-4dba-a7e5-60cea08bccaa	aes-generated	master	aes-generated	org.keycloak.keys.KeyProvider	master	\N
f4f62e72-cc11-497d-b11e-41d183aace70	rsa-generated	Store Test Realm	rsa-generated	org.keycloak.keys.KeyProvider	Store Test Realm	\N
6ad803d4-fab1-4f80-9fd0-31c84f713ac8	rsa-enc-generated	Store Test Realm	rsa-generated	org.keycloak.keys.KeyProvider	Store Test Realm	\N
e600ff61-8caf-43f6-8365-07e032331ba7	hmac-generated	Store Test Realm	hmac-generated	org.keycloak.keys.KeyProvider	Store Test Realm	\N
aafe8926-1b3d-4a64-bb84-57d29a51e011	aes-generated	Store Test Realm	aes-generated	org.keycloak.keys.KeyProvider	Store Test Realm	\N
736d8bcc-fcba-4d1f-be63-7a844aa28b3a	Trusted Hosts	Store Test Realm	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Store Test Realm	anonymous
fb34dc1d-3dc8-420f-9f8c-47ff1ab0b282	Consent Required	Store Test Realm	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Store Test Realm	anonymous
236ce865-b377-4191-8b61-e07cfa50081f	Full Scope Disabled	Store Test Realm	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Store Test Realm	anonymous
616ca381-0860-43df-b73d-f23a49aac934	Max Clients Limit	Store Test Realm	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Store Test Realm	anonymous
ab60bd1c-50aa-45b8-b26d-665959bdfeea	Allowed Protocol Mapper Types	Store Test Realm	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Store Test Realm	anonymous
a2e3f96c-911d-42ac-bddd-e17d00c038f7	Allowed Client Scopes	Store Test Realm	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Store Test Realm	anonymous
d3cfcdba-8eaa-40ed-924d-29d08b9a47b2	Allowed Protocol Mapper Types	Store Test Realm	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Store Test Realm	authenticated
9da795da-68e8-4008-b49c-be9d7273fc89	Allowed Client Scopes	Store Test Realm	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Store Test Realm	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
11e71dcf-e427-4e0e-9956-9562fbd2a26d	227cf5f9-cfc6-4c85-bb2e-ba732bad4f84	allow-default-scopes	true
ffe2597d-818f-45a5-a5da-1e6768b187d2	7af4b4a0-7c4a-44a2-b4ee-f3bf7927bdcc	allowed-protocol-mapper-types	oidc-full-name-mapper
fb5533f2-ae62-4858-a94e-933796952ac3	7af4b4a0-7c4a-44a2-b4ee-f3bf7927bdcc	allowed-protocol-mapper-types	saml-user-property-mapper
c000b640-92f2-4b2b-a803-ecf105a6f005	7af4b4a0-7c4a-44a2-b4ee-f3bf7927bdcc	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
b89bfd59-952b-488b-9ed9-2dd4dcc656eb	7af4b4a0-7c4a-44a2-b4ee-f3bf7927bdcc	allowed-protocol-mapper-types	oidc-address-mapper
cb3c3454-6e8c-482b-8bf6-f6534b6a7c17	7af4b4a0-7c4a-44a2-b4ee-f3bf7927bdcc	allowed-protocol-mapper-types	saml-role-list-mapper
3e45ea41-8515-4e13-b2cf-73a5a8ac29f8	7af4b4a0-7c4a-44a2-b4ee-f3bf7927bdcc	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
2eff4510-13e4-4042-8247-71b430cccd9f	7af4b4a0-7c4a-44a2-b4ee-f3bf7927bdcc	allowed-protocol-mapper-types	saml-user-attribute-mapper
35c06ca4-5ac5-41da-9adf-3583de1c3c14	7af4b4a0-7c4a-44a2-b4ee-f3bf7927bdcc	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
66e9ef33-bbd0-4322-b171-0f7ba01b54a4	02505eb4-ea03-4e12-8650-705d5d7dc76b	allow-default-scopes	true
87b268e5-187a-472d-adfe-59d372c7b68f	73472fbe-c305-442d-b299-5560ddc650c4	allowed-protocol-mapper-types	oidc-full-name-mapper
98c7dbc4-83cd-4740-8b8b-3c420381f99d	73472fbe-c305-442d-b299-5560ddc650c4	allowed-protocol-mapper-types	saml-user-attribute-mapper
17fd4309-e4d3-4b24-9dd7-df16bdb1b556	73472fbe-c305-442d-b299-5560ddc650c4	allowed-protocol-mapper-types	saml-user-property-mapper
ce7944e2-da8e-4e91-a156-8a3030c021e5	73472fbe-c305-442d-b299-5560ddc650c4	allowed-protocol-mapper-types	saml-role-list-mapper
821177b8-6fae-4ecf-b59a-0b7067001585	73472fbe-c305-442d-b299-5560ddc650c4	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
43d5bed6-fba8-46d7-9322-7d4af7871bb3	73472fbe-c305-442d-b299-5560ddc650c4	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
4a6faaf3-998d-46b6-89a2-af9f4cf90fd6	73472fbe-c305-442d-b299-5560ddc650c4	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
cf1fdb0d-8021-4cab-b311-08e14156ae31	73472fbe-c305-442d-b299-5560ddc650c4	allowed-protocol-mapper-types	oidc-address-mapper
85c4f9fb-3de4-44e5-8fba-1512d9c113e4	22b87508-4a4a-4a61-afb1-ab9300e62cc6	max-clients	200
d67ff43d-5904-4126-98d3-51b93b48c734	e5f7f017-e215-4024-a9ad-d6479bba3405	host-sending-registration-request-must-match	true
cfaf74a2-be57-4132-b832-8947174d75f8	e5f7f017-e215-4024-a9ad-d6479bba3405	client-uris-must-match	true
707ddb05-4470-4fdf-a677-105fa8993328	2c3fde24-954c-4c2a-81ea-60c54f005b24	keyUse	enc
975672f9-5f6f-493b-b244-8e0ed4f2995e	2c3fde24-954c-4c2a-81ea-60c54f005b24	priority	100
cb6221e6-1ef4-4fe8-b12a-a3e30e9a4f58	2c3fde24-954c-4c2a-81ea-60c54f005b24	certificate	MIICmzCCAYMCBgF9cGnb0DANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjExMTMwMTAzMzQ1WhcNMzExMTMwMTAzNTI1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCj/hq7U4bw78WL7UwqXqbRPLGmp8gEyCqC3A45k+ALQVZ1TPEFo1MVxJmZcjVsh120h9lsqE4KLPRtPl2GSrJ6j8jwLoc0ykaIeQ7p6EE34D3OZIa6M/WsbGyz/q96gX0uDXWwaahF/Qpy8zyr1nq58ckq8AueQDFYqOE/Umj40Ka7Q4Kfjx7MYwt0Pcu1l+A5m2gfHU3ss4Kcy2HOSMJfkA0CuaFxp7LcDr54wwGSs1Cf/lnNNID49qRdDq0jhSVAUJfjw6siOCfFT384vrUEii/yR/QsyhVjrzbnNxpIE4npf3TBkGczAxq2B2FPIZa9oB+jfKLV6+nBYDdRG2y9AgMBAAEwDQYJKoZIhvcNAQELBQADggEBACRMKytdG+ZXyGssPsLiMQ7MIU3H4qnU7OQ5EFp878RnYLBURHNZFDwQkoRcL0IawNduyrpBpV+PGZYFvOXxW5KS/hSPicw6l1jto0be6TO16iFsIsjwh3DaWBxV6Zi5fgfM4cV7jMGjEkYLDGfJhign6FK+muTgf+SNQHn4Iz/PyuQt5HQvxl3D4m+zovXamdiZaxZyv6YdlMUgyQ9QmqWywtm2BWN63oG08f7Dk6hmgNCH8KBqaVHGO8k9DOgohSLgn+6r4DA1jUKICSt2rYcmPC2X/kyFO7dPyWyI/fiHzO9cc0xkgfZmuCHG5RWQ8iaHSzKKgkmQuyjBWrl0Dyk=
c0fd2753-8ef2-4490-aeaa-b669330011e8	2c3fde24-954c-4c2a-81ea-60c54f005b24	privateKey	MIIEpAIBAAKCAQEAo/4au1OG8O/Fi+1MKl6m0TyxpqfIBMgqgtwOOZPgC0FWdUzxBaNTFcSZmXI1bIddtIfZbKhOCiz0bT5dhkqyeo/I8C6HNMpGiHkO6ehBN+A9zmSGujP1rGxss/6veoF9Lg11sGmoRf0KcvM8q9Z6ufHJKvALnkAxWKjhP1Jo+NCmu0OCn48ezGMLdD3LtZfgOZtoHx1N7LOCnMthzkjCX5ANArmhcaey3A6+eMMBkrNQn/5ZzTSA+PakXQ6tI4UlQFCX48OrIjgnxU9/OL61BIov8kf0LMoVY6825zcaSBOJ6X90wZBnMwMatgdhTyGWvaAfo3yi1evpwWA3URtsvQIDAQABAoIBAQCRtVcfFkoRjZkiiMdh5hOmWZ0nDHCl/wv2lXt2ITOyDG27b4+/iKxr7PDk7BsXwPa7TvEaoDgmxmavIfiLN5d5WoQZE95CQ2+EFrvvjNNVyEJiPeOPUld4yiWTkDluSdtlrcPh6R8AgKJmHETOEZWd3Xz2T66i/zpZIkRwtNJcL+ulBw7oDEPX+2JbmdWW6oO74NgCEaFNcHn3VG7OUOwWs8m2gRVPrL+U90Si+rGqC+C83Dfi/9WC/BElqxkB5p5pU2siOYuLNf+4xZd6xt+Whj1yMlAtxChuEb4t1NshxR8RkxGnx7kaA3gjOleFkl32LG85oWAtyEVR5k9JgkcpAoGBANE/CmN88ADyDs12s4y9cX7+smDGDLD+hycWktBhwsw+wN+OdSAq91Re0yBzhSMeqITCqW7Xt82CFX/jKawxDJA0Tp6id12h/dsm8pVui0G4JPD96m8iKUzjCK0q7iDgD++aD0qGIYhvQSAQmgP9h1mKlzz8snZfCp+SK8UKUIh/AoGBAMiiiejPGChb62ey3xTpFCiPL5l82BQeqERh+cLV8L0J56DW+J2n22Unw5AwPbL2FGdBSruI0bKv4C75z1ghoMW5QFsg3hZHf8Z29z3vPj8JgpHb8vEGSHEg2CU8kPb8TVo3lTiLAEoAeAybTf9i83X4uDt+LGyjKH9GKg6V4ozDAoGAZNxEP6xra6lB5VwANCjk2lge13LfjzlBIGBLKFLXOOhOw/PBFV5glbSXhB7q4ADZLhU+4oTsvgykHF79KVkDO0dbVi/t5Z495TMi31DHo0gF1nwuUp9e1QbimcYFvqcCR3Y1RLDe3Qrzk2ctNhsw8MJTIDyWMWSilEQ7AOF17DUCgYEAvulzIvWUviqhOH6LKaGTzfhZycpy7coyQUedWpkqxyaaooCL97CW4o1Q2G4e96CSz6HgU8ygBVC3mNuaQflVu29IXq5KxZZpblcbcnKpn2AUP2i0pkZdPlCLe/tC0dJIZJVJR5F0x/XkRdKuCFqG4fW2kN3BteoXCeyg7loPRfMCgYAQxgN0Q4AqR5d5kuf/dsQ7FMocli2HVFTfoWyKVHODzaXOtHJ+Of92w4QLn/1yXjFHs79wbq+frE6qA2KdS/rmvsrUE4DWlib/BIUavHETXYqwYwN9y3Q39SlVkgRjgY2dZg5kpW9jk+u6e5ZBSrGJr5vJsXLkMsGVgYUQm0gW2w==
dfbb0975-d9d3-4171-a39e-8e3c589a2b4d	acbbf6e7-6acd-46b9-a857-a5f084d6eb1f	privateKey	MIIEowIBAAKCAQEAob5itePDHX5fYBJaQ/RGsizsWcaOqu1mRjEZQ24q870gfsakKpJtb5Z0T7fsnyep5ScuXRGtkT3R2KsNdS8XiGv5suKhoYslAPkEqMZnd7O21emSKJBMLvvEHXDWUScJ9RSfoLNfGgA3Fira+FRiYQtq2q90X70lem/0TjeOYP7CaNNR4mR/Lcsrrhdofz8lCspdPKO88291ty6RRyZwIzb3DtENJcUeB976LdPE7iM5BrMZnubpUXLv6kmeVTkIiNq9LMGLnwqsbgTeUW49isUKylUBSq1c2cnyot1vjk4EP3/Gjcon+6kLwNC/Z7QMmOn2P+DBflSOtLF2YVTj1QIDAQABAoIBADfH+y8Tr9TaInZ1nd/VvRPx3klP6yAT47PNdxMESZfp3+0ZAMEV4twbHV3o5pg1C6jWDG1YjW2LznVU+L0zUoBgDKue8XNPE6H0P6EdW82ykxnPBfMrYLrLZWVp5t/yAMMfK7Y2ZlQHQvhIK2B9abhiQaXN4OqrxuMk/TKEgnv8kPMpcSsBXxCcqK8KrnLkF1sEU5rGL6eU80bqqFqczyF2nBVV1TLjP+G7BTHQZ9gvSYWL8NmQIBSsYQWQPUWBw3m+xWP00qJ1jB8e06LES+u9W8kYDQlSoZjqDxJbnnuFHagqCUxIw70fiDmz3ET40/GMgplupNWtSp9pNpKX97kCgYEA+6JUkF6jm6K2zf3f6CmthdyRgA3pu+8XQ+mckwbbI2QkenMEg0F53x0fzoS3Dl5O6RMhwCC/1/46h3/Wd2Ia7o4CxGb5Y9MDqFve+uGVimomsung19/rinlTXNDuW4/ruWmeq8ERPBg3vuTVL1XSuAdjbeZt93Zm6kXwT9Iwo/8CgYEApIzLOm46Jhj6703pGwNJmwXEiNVdCCHx6DpfaucNJKudyMpxMj1cItbHhNutiWhyI1x05KHdePm8gAscvqLYxcjkKzZXbZk81SBol7C5nLkrywnu2SRyRvQeVHBtm4NK+B2Ipr7V3x0Om+0s2xBlNHcP1Hazqfk5o6eMDXB2qCsCgYAmCeUEqfnLhi5iN1WIr/w2NyCbnf7OVRdMQd1UcH3h/Lpy9D4jZVt5+docCv3tIx6Ep0q703eMvDa20wFlrKPrmfYbIIHksDpmUfUEMeO8N82/0BEYMRZXKX4Lkt3lY3072xaMWjQzxGlw5wC/FhczkJJcQ7At720hTw9D0b9emwKBgEkxMyifZRATJnMRZbGVScVB0ITI2yPF7ZNNe6nScj8wcvOgUK93Kad5f6/yAwPOyI5ADuKvuRKZiyYtSzDkwKVhUVSDTGo8shle3Ac1Haq/luIuXeaKVqaG6YLHq4lz4gHxKRp6YilnBFuJKN2cMlge6ZSo5AukBuZrnVlRAAaXAoGBAJHo5SjPy7myDyLFnsctsSMR6zN2cL1QLJncLW7xqbCZRxLLVRSBphNwNqByq9Mjh+9UfCewu7MoXyeNpC4tNEyQ1cI1U0ws7JOBvqolk6XDA/ie+lCaXm/6Y9e0l110Z4by6S5LCgwzkhB9A1sC9SQapaYCfeRXRFn73zH2lQG6
11cbbda5-d023-4e3a-b7d5-ed98088d03bd	e600ff61-8caf-43f6-8365-07e032331ba7	algorithm	HS256
6e9779a7-e7ce-41c2-81c7-19b6db0f797d	acbbf6e7-6acd-46b9-a857-a5f084d6eb1f	certificate	MIICmzCCAYMCBgF9cGnbaTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjExMTMwMTAzMzQ1WhcNMzExMTMwMTAzNTI1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQChvmK148Mdfl9gElpD9EayLOxZxo6q7WZGMRlDbirzvSB+xqQqkm1vlnRPt+yfJ6nlJy5dEa2RPdHYqw11LxeIa/my4qGhiyUA+QSoxmd3s7bV6ZIokEwu+8QdcNZRJwn1FJ+gs18aADcWKtr4VGJhC2rar3RfvSV6b/RON45g/sJo01HiZH8tyyuuF2h/PyUKyl08o7zzb3W3LpFHJnAjNvcO0Q0lxR4H3vot08TuIzkGsxme5ulRcu/qSZ5VOQiI2r0swYufCqxuBN5Rbj2KxQrKVQFKrVzZyfKi3W+OTgQ/f8aNyif7qQvA0L9ntAyY6fY/4MF+VI60sXZhVOPVAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAb42/gQORoqr4OutrPaoUV77MC7Iu5dtjVNZZ+q2GxBzp8ZYhXVj2BFFicfp4Dk5cjhJ7qOpre3+BTv+Wdbv3m/7BfKz3Ve4JKpOSFzaTMLYhn7GLx3j6cphtN5wrY3ppaTtg/6n9/87BFlUQIZjzL/Y+y0tzeVRaxfnBgB6lFusw+qXEIhcZCtkZ9jjYPePaapK1MQ58qL/DRGRSRl5wjcVDFM1yFwQMszXNvytiRp8E0nKNdXs/2U8N5/kyRCrOfPh4b1uKtTlW+xqzG4FumiwlB/pfr+Pa4TA7PAxWdDKwy/azdOSzbGg4ZFUQd7JLuXqImMEu10KQgr1g9LvBo=
d4574039-fb5e-4de8-b40f-41e3cd24fbc4	acbbf6e7-6acd-46b9-a857-a5f084d6eb1f	keyUse	sig
f0574f76-9989-4cd6-94a9-23ffcae3595a	acbbf6e7-6acd-46b9-a857-a5f084d6eb1f	priority	100
16e17f3c-dd80-4dd4-b600-b0e2f2ec23de	4f6c084a-0d70-4dba-a7e5-60cea08bccaa	secret	_DpRZZpTZfuOfJORs-3oSA
d486e100-4eff-49ad-8262-891e8620ae85	4f6c084a-0d70-4dba-a7e5-60cea08bccaa	priority	100
25f803e7-ff5c-4d6a-a6be-193024b81f04	4f6c084a-0d70-4dba-a7e5-60cea08bccaa	kid	b8e020f6-7d64-42ce-abe7-7cc49cc3a3b1
f62528ad-0718-4256-b158-b34ad6be28fb	e691ef93-0679-40fd-bda4-7d6628868ac7	secret	ReWbmIzmbGUIomyuZGklXKpJsyD-W2pAHNMEgTvVfZ1Iqx3RuZknhweVVFtR21AlldWq2lSVoaavhJBDRp5nQw
46d22139-8b07-45ac-8822-647a335f0de6	e691ef93-0679-40fd-bda4-7d6628868ac7	algorithm	HS256
a2579c41-0142-4df2-9522-354350020fad	e691ef93-0679-40fd-bda4-7d6628868ac7	priority	100
512c81ff-a48e-4cef-ae00-9b2a048b3460	e691ef93-0679-40fd-bda4-7d6628868ac7	kid	9b84b63b-f3c1-49ae-9892-823975864af6
0062da4e-e0a3-4169-8976-3497b718bc15	f4f62e72-cc11-497d-b11e-41d183aace70	certificate	MIICrzCCAZcCBgF9fMkVATANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDDBBTdG9yZSBUZXN0IFJlYWxtMB4XDTIxMTIwMjIwMTMxMloXDTMxMTIwMjIwMTQ1MlowGzEZMBcGA1UEAwwQU3RvcmUgVGVzdCBSZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJlM4eFbhexQFcCv0CqCbVRnnHL5BM3p5heuQPOrqIxvGxqEGKWB3cnjz1MXSqD9JpC1Omr0NAEhFym/xeyzdHf98UjpX1YC7WBsLxQITXvsi1XpHF8eySe8UL3gBreIYRxMLw1NwYwP11yt/kaPZKqhdZuuTCCRaWtDkf7gRP8vfSyZlTBOrYkqdxYrqHFqJANqQHc6ezX0anCNXLhDB2PTnnbjdwNkjKNLadIaA/jzc8mmcb+ywW3v2dE3Ua3sopJSWpyPozT3+6uuvaoD+JQanAW+OMUw2bJA/iqcCV4qN/uJvsCjkHZOYN2ADibyWlmxd+uHX4xkFo4C2DSAuo0CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEARyF/7aSkjCHdacLmMpIWmeEWj43Ss/zagv0jTEnnyTBis4K2+Ry9rcs0mmtj64BnSd1CYYYY7yx42u3wM4WDnd2sQuoCfG7ra9xmGzrt8EakB6CnsepL9R8O0E1bkUxWz/T3rmo1oy4xbjpiuuz4qlNo/HbIypKLPGjtNpwztmyhqBDjs9k0MeshTSmRY89SDfyM+XPy9+eIAx8OQEkSgLh7tXqOePgmU1gb1NeQZSmGz6XhoVe1O4qPMUAs91VDmQL7aIHtGhiUbd8HDx7bJYJqXguthhlHVbKVkFYxW5CD5ZqTiN1oha3OPtdXVZy42OCMhq4S1yRdGPmjpz9Pyg==
f81559df-7865-4e13-9bad-1467ac881eab	f4f62e72-cc11-497d-b11e-41d183aace70	keyUse	sig
5cac4524-8ea6-4c08-a93f-fd81095765c3	aafe8926-1b3d-4a64-bb84-57d29a51e011	priority	100
992e5165-b790-4d8e-98ba-7dcac2cc1edc	aafe8926-1b3d-4a64-bb84-57d29a51e011	secret	E-_DDUIc9NZcPEDg1ITzgg
858d6afd-0784-4ba0-be85-5c28b8836b48	f4f62e72-cc11-497d-b11e-41d183aace70	priority	100
6f254ea4-afa1-4cbb-b616-ef76e889ec15	f4f62e72-cc11-497d-b11e-41d183aace70	privateKey	MIIEpAIBAAKCAQEAmUzh4VuF7FAVwK/QKoJtVGeccvkEzenmF65A86uojG8bGoQYpYHdyePPUxdKoP0mkLU6avQ0ASEXKb/F7LN0d/3xSOlfVgLtYGwvFAhNe+yLVekcXx7JJ7xQveAGt4hhHEwvDU3BjA/XXK3+Ro9kqqF1m65MIJFpa0OR/uBE/y99LJmVME6tiSp3FiuocWokA2pAdzp7NfRqcI1cuEMHY9OeduN3A2SMo0tp0hoD+PNzyaZxv7LBbe/Z0TdRreyiklJanI+jNPf7q669qgP4lBqcBb44xTDZskD+KpwJXio3+4m+wKOQdk5g3YAOJvJaWbF364dfjGQWjgLYNIC6jQIDAQABAoIBAQCIMIMjX9m0PNl2WzrF6SUTrRCSG6QnArqFIytUzpVoXXRotB3pO1w79YTEPpbwOrW+LSJ+zgA9WJZpYpOFW1AHIbTvn1Qw51zXIoUYeN/NTjHi2rt3zbPK90OLy7Br8F7FcvECEqf1tEURcwnIya8W32XKLqg27rgGsPrMwZTKVpevkdpflzIDrMh7wifYDmnR1so/UOQHuEOcgzQzu4UqXC/2KJ5W8hytPjQX20cs6px6op1VOpcPMU9GjH3pPqDvNS+Xhe3FC3Zo8G6iPmhNDqLgO2Qzk6Q9mLpcVAABXkFaMY6bkGOUBwREnvpVWJL/VaPkB9orl/eFpEKXw1xBAoGBAM+c7aEyJ4PgczkMY04jCwAJYdd2pFCLyhH6hXDiWujtEbkRdzlN7KqfX+rdQIZ8hkNQchiFcdBysl1LZJUoDotkePTJvezcQ5D4elPInxTG9DnMmkQXx3MuGFD5wgjQ9IHGguI19ayBG3Gme83YEVsWauJQrYtXhstvhA0psmDZAoGBAL0Hbe4GLwj3241AY93GP9Nul/q8GnBhWbQrZK9qzEPCbFarUryJauMZjJGC6NA+rS93KNQh1VHq9gQgLxsVzd1uGxx6osO+gbIhnhnTjEIDV8DKDezR9cCYhXhg72e1Bw6KR6kQ4QWpwNT5tWsSUeadI1d8bM9LCseODlXar5bVAoGAemDPdhBhWIwqfzs9Iibn6gqdwOsvakcsQrLAi8zxt5FevA9+jqnPUrgFSyVGTsACSJWX27p1X2DsoK+7R2zIPgRohCqTKJahwUemm9KLayznc1aWrIKzz8IhFUJTzOyW5BSGvB8AhMHJ0pFHMwwlFuM899CEq7lZPHushDHK8ukCgYA2LFDm7ELCkTYMry1vu4dDMui/ZPU2y8+HgQAj/bl4mdmupP7bJY7KcuIEOb47IBtGBSJgWSnnhiznVcnqOz96fDms2cCX1Jsaz+OdhzElIgweJkoDWtDRV2S48R7rW8gf9KVA4KN8mf+3ibDidKegLdyZEAGnDtySADY/iKLV2QKBgQC3sUfC3Y7k5seAKAxnLEy56ha0G+pTmtyMy2v6gxlAVXoMzk5d8w5EJYDxmMr9Ho7YhxOSnlVc0vw1iVIfGlyUh1dZmGkeGo7Fw3Ghn+gHIxqqqg5us3HovHBWFIhjMPRC/5YCs5YUD5fVHVR3g1VyW78vXSrYqxnnqxOjIpbVtg==
6b55a962-0d39-40b9-822c-837876eb0e17	aafe8926-1b3d-4a64-bb84-57d29a51e011	kid	0e3846f4-10a4-42d3-92c8-8d9d1f680e5c
61f1d8c8-f06e-4cbd-aaca-59bcf8924ee4	e600ff61-8caf-43f6-8365-07e032331ba7	priority	100
a5e27357-e285-4ea6-8422-bae5861623a1	e600ff61-8caf-43f6-8365-07e032331ba7	secret	00hZNFU5CJrFGloxs-i9h1ELX4XWeSQLqw1-VqbfdrDnGaZWEMITtfXS6oCGEy4xnvFOCulbQN_GFe4hlwwreA
a2da107c-cf7d-4c56-948f-2269d7954b73	e600ff61-8caf-43f6-8365-07e032331ba7	kid	0de441e6-cb0a-4144-9174-bdf9c50f9b6b
94bf14c1-1cd6-45d8-b999-8d9955550c81	6ad803d4-fab1-4f80-9fd0-31c84f713ac8	certificate	MIICrzCCAZcCBgF9fMkVOjANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDDBBTdG9yZSBUZXN0IFJlYWxtMB4XDTIxMTIwMjIwMTMxMloXDTMxMTIwMjIwMTQ1MlowGzEZMBcGA1UEAwwQU3RvcmUgVGVzdCBSZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAM7MvEuxum8I0ey5nMTi2tuwOQG9iRO6/geduHjukFTqXdnIpaqAvv+3R6k7+oUh/r5sES0pIpZbxTcUiO+fZJmtOxWPrZdvT1/sPtOgBUaqYF/CV5wzQyqT54jzBquzvKtaneSvC4PzNaMVCcwAJjhUGKT084Gae6OzAMJvhSp4X2BApS3srF40kWV5kMPZYPOqrY4ExblAVT2ldKP3yU7Fl96Sd12cksh6TQWjGhRCWUUT1R8tXrpMN4zUNBV0XkYmUWw6FAqIgS5VKpMb+9PNMK59l9PJSKi2H6Vvm3OgpRTmFhx7nisEMaTB9ahvfLQwTd+Wcy3u3V6D1f5b6rkCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAWVHpJv7S7Up0+xrZacqGmBnJCIISR1eOxWwi64vnyh4ugIq/PrLOlyZ+MvbrcsnWCNt37l7qQ17F7QiYuKjERjWGi2WO6fqmzT35RqbJyLSWxy36tCDf02fFJEl5XuBGMH5+x9wD2THR7Ov6dffEAPvHu+W2pqOCarYka98y18F+/PhXTjXJu0kpJYYyXoLeg6QkZgctlW9h5dopU588vLoKvgFkUYSbxGRmhpEdvNUIbnWkTalxra7A7bX0sPTQSmHNI0dphzGr3cf26kXsM0tQ0icaXpFdbHHcRMNSmQPauxzY/oP7pwVagGUbYn/41NIrvYibmLLeqiGZ8mGdtQ==
82cae6eb-b0ee-4e00-a0e4-8a8cd80656e8	6ad803d4-fab1-4f80-9fd0-31c84f713ac8	privateKey	MIIEpQIBAAKCAQEAzsy8S7G6bwjR7LmcxOLa27A5Ab2JE7r+B524eO6QVOpd2cilqoC+/7dHqTv6hSH+vmwRLSkillvFNxSI759kma07FY+tl29PX+w+06AFRqpgX8JXnDNDKpPniPMGq7O8q1qd5K8Lg/M1oxUJzAAmOFQYpPTzgZp7o7MAwm+FKnhfYEClLeysXjSRZXmQw9lg86qtjgTFuUBVPaV0o/fJTsWX3pJ3XZySyHpNBaMaFEJZRRPVHy1eukw3jNQ0FXReRiZRbDoUCoiBLlUqkxv7080wrn2X08lIqLYfpW+bc6ClFOYWHHueKwQxpMH1qG98tDBN35ZzLe7dXoPV/lvquQIDAQABAoIBAQCHj9xrPlF5Ue3S4YXr5s4TLzzfcDC4l17I/VIdLD2+/HeTOR2oXIdYN/wo6yF5PmSwzUShNxLuP7BTQAnYEsOunclag/oGiDgfKE2zCnYK8csFWu91fIEuGxCvTKh1y/gE1/0jGMBSug7SHgtzCDIFwNL653vs3KjqEYCQ9Ov1fw9UWkf6541eczICMGYAKAVkgziNKDscDLwQVFQjmD5jJDpg07CdqFMfRq02x1wwnZ1NC2y5z8FLuYRwKqmSlNKpbXlY3tXpxGCfbYzWHoQNQVPvFeXG8gRIwnM+s604a1PiBml5GZl6gW+3ZMfyUeo7vtu1wKxaOs/Iz/N7yvm1AoGBAOdAE3CPJqbPFyOJSKUVakd7BbNMgcpKh6TDtjocWtUJhZa7zNkjO51AAM6MkCdY3l+lMm+VIiHG/veJjllmZwsqkYuRFRZBldHvSvSbDsF+m5PmjpML64fjdTyIfuncelupOpLHsZFZmmvK+Cgt71BhLTyWlIsYOqh4HUhLB7a/AoGBAOTuv/iZ49gm+t1lecFK32dKjgFyL2g3ZOB5jP/b4y+QrhLyVnC8XEVRsJG0nij2yjlnk5Y3TUMRPAEI/iiMFTmEzW5uWhYcjK2LDO0u3AY2MweOUXFJglYVdjUSHQW6u5jTog2j2G/2IeOwG9xMNPTqH30dGZxFNpTH5IRMhHSHAoGATogEEgWLKrrJMNg+Q1GydfPhS7J/oSMOTXXpPHLEpfRF2ZqNRnAgnpZNr9csXTBg1DpVlm8e2Dmr/IRKQzHzbGdYZf0vHA/JwTFyUv8VU8CbNO7nHCjAI7Wq6pOwBdtJ8jbWHWKTerjjKBgVjg+LZdCafCjm6RWhVfT0fMh+JiECgYEAyEyL8frS+r/AJg0u5guYQ0tby7AYAlrVDAHNd97veyJe63zUXHaxVIUQs6sP5k9mx6rz2i4wj0l48n7nwJovx8+F3eT3NPltrDlI6gxhvZ2WMDo4z6G9Q4wrjGt4sRacJC6mTsDYEb2MESZ4edrDSrW9Lz5StgNoqevq6EX6bekCgYEA0kzQr8EUUUPSLopywFwQUnaXQK0V9dwDmtV3hYyRnVgUaixya6QEGe+2sxzg0na/88G2859VKO6ceri/TIXnTjNdpuNckiNRRPmGsn/npVRnHMz9j5vRUfLwtJi1rP0KrHMVg+q/ouiBoOmfDtnFsb0SlK09sMhcL+GnhiJYMek=
9fafecd7-a716-4fd8-afe8-7e1e433920aa	6ad803d4-fab1-4f80-9fd0-31c84f713ac8	priority	100
f4edf8b4-5224-46c6-9e65-ab49edd98645	6ad803d4-fab1-4f80-9fd0-31c84f713ac8	keyUse	enc
0af23f62-9aab-45d2-948c-7b10a612e136	736d8bcc-fcba-4d1f-be63-7a844aa28b3a	host-sending-registration-request-must-match	true
bf7e9eae-ae65-46e0-8e8b-852afe6a8d33	736d8bcc-fcba-4d1f-be63-7a844aa28b3a	client-uris-must-match	true
45de2da3-a04b-479f-9642-2e73ecabadad	9da795da-68e8-4008-b49c-be9d7273fc89	allow-default-scopes	true
79895b19-0c7d-44b3-8296-230d3062262c	a2e3f96c-911d-42ac-bddd-e17d00c038f7	allow-default-scopes	true
e42736db-0df9-4045-9705-074ff5fe6613	616ca381-0860-43df-b73d-f23a49aac934	max-clients	200
b8da03d2-3b4f-4b8e-aaf8-7fb3d691a7d9	d3cfcdba-8eaa-40ed-924d-29d08b9a47b2	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
e20c3a5a-7d0d-4886-a389-64c64d8e80cf	d3cfcdba-8eaa-40ed-924d-29d08b9a47b2	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
3cfa4fb2-521c-4cbf-b399-c7942503f9af	d3cfcdba-8eaa-40ed-924d-29d08b9a47b2	allowed-protocol-mapper-types	oidc-address-mapper
021876d2-e468-4ca6-8abb-1d4b4e898927	d3cfcdba-8eaa-40ed-924d-29d08b9a47b2	allowed-protocol-mapper-types	saml-role-list-mapper
ba0ae503-424e-441e-8799-97fe781c1606	d3cfcdba-8eaa-40ed-924d-29d08b9a47b2	allowed-protocol-mapper-types	saml-user-attribute-mapper
10ae6cb5-d484-47fe-9761-3fb90fea6694	d3cfcdba-8eaa-40ed-924d-29d08b9a47b2	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
218d4b1d-b36f-4d2c-a7f4-18ba6f6595e9	d3cfcdba-8eaa-40ed-924d-29d08b9a47b2	allowed-protocol-mapper-types	oidc-full-name-mapper
7e4e6e09-709b-445f-98ea-44213b766add	d3cfcdba-8eaa-40ed-924d-29d08b9a47b2	allowed-protocol-mapper-types	saml-user-property-mapper
a56e0207-5329-4a9b-b58c-a79e462d080e	ab60bd1c-50aa-45b8-b26d-665959bdfeea	allowed-protocol-mapper-types	saml-user-attribute-mapper
d58ee52f-5572-4ec7-93fd-5d862ed9b2c5	ab60bd1c-50aa-45b8-b26d-665959bdfeea	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
01861e86-ec0e-4cf3-aca8-ed05be3174f9	ab60bd1c-50aa-45b8-b26d-665959bdfeea	allowed-protocol-mapper-types	oidc-full-name-mapper
e781b1dc-10de-4a04-baf8-16a10c745baa	ab60bd1c-50aa-45b8-b26d-665959bdfeea	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
ac3a36f6-c0b6-4c87-87ac-c48c4dc5525f	ab60bd1c-50aa-45b8-b26d-665959bdfeea	allowed-protocol-mapper-types	oidc-address-mapper
8b9a67a7-7ea9-4a3b-bff0-96aa90289486	ab60bd1c-50aa-45b8-b26d-665959bdfeea	allowed-protocol-mapper-types	saml-role-list-mapper
2bedb88f-752f-47ee-8e71-2ddd016f77b4	ab60bd1c-50aa-45b8-b26d-665959bdfeea	allowed-protocol-mapper-types	saml-user-property-mapper
b73d4fad-be51-491f-93b1-b3e8cc1cfe3a	ab60bd1c-50aa-45b8-b26d-665959bdfeea	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
5668cff8-1e06-4063-8e7d-e2e10dced450	5ecf3642-c308-43b8-9526-1e83c7ddd8a5
5668cff8-1e06-4063-8e7d-e2e10dced450	d819e179-3cd6-456a-bee7-5bed1b8fb678
5668cff8-1e06-4063-8e7d-e2e10dced450	c8bc82d5-dedf-46d6-9b23-4f288fb28b0e
5668cff8-1e06-4063-8e7d-e2e10dced450	df8c6979-383f-4eed-b089-702a4bb6ad8c
5668cff8-1e06-4063-8e7d-e2e10dced450	509a4463-a5d7-4ef4-8165-447c4a5606ac
5668cff8-1e06-4063-8e7d-e2e10dced450	67f92c08-9192-4861-9fda-ec48b8949f78
5668cff8-1e06-4063-8e7d-e2e10dced450	1b8428ee-78f1-44e4-9900-888839962fe6
5668cff8-1e06-4063-8e7d-e2e10dced450	039baf77-3720-42d8-adcf-47ac6245f456
5668cff8-1e06-4063-8e7d-e2e10dced450	9bfad9c7-e12a-4456-b9bc-dd1f541945a1
5668cff8-1e06-4063-8e7d-e2e10dced450	f3072e52-4089-4d6d-b627-3a9c51b4a276
5668cff8-1e06-4063-8e7d-e2e10dced450	d96b01ef-401c-45c4-a156-1ad6f2f7f326
5668cff8-1e06-4063-8e7d-e2e10dced450	39307a88-3889-4ba4-b42c-981364f565f9
5668cff8-1e06-4063-8e7d-e2e10dced450	7c65ae69-1337-4ac1-a3f7-dcfad4b3a191
5668cff8-1e06-4063-8e7d-e2e10dced450	7e0e288f-6ba6-47a0-802f-a5ffc1aaec9e
5668cff8-1e06-4063-8e7d-e2e10dced450	9061c0f8-ee7c-447f-945d-4f2143726b10
5668cff8-1e06-4063-8e7d-e2e10dced450	1c098dcb-c28b-4329-a37c-068702a800a9
5668cff8-1e06-4063-8e7d-e2e10dced450	c4585ed5-06ea-4a53-850a-93f849238abd
5668cff8-1e06-4063-8e7d-e2e10dced450	cf9e5f48-b122-4e94-96d1-e88248d1810c
509a4463-a5d7-4ef4-8165-447c4a5606ac	1c098dcb-c28b-4329-a37c-068702a800a9
df8c6979-383f-4eed-b089-702a4bb6ad8c	cf9e5f48-b122-4e94-96d1-e88248d1810c
df8c6979-383f-4eed-b089-702a4bb6ad8c	9061c0f8-ee7c-447f-945d-4f2143726b10
e2d30c5e-4b35-4e6a-afa5-6dc5dd2555b6	566469d3-03cb-4d41-b76f-5656912a8418
e2d30c5e-4b35-4e6a-afa5-6dc5dd2555b6	1d2c7675-4774-4b45-8287-3f632edc8297
1d2c7675-4774-4b45-8287-3f632edc8297	7002c318-a649-480e-88b0-bca74c51d9df
9ac5c78d-4a9c-45fc-a604-777b43bb4032	8a50242e-7986-4de4-a2d8-b6caab12d045
5668cff8-1e06-4063-8e7d-e2e10dced450	6ebc47c9-485b-4afd-8f25-434a50fa2e27
e2d30c5e-4b35-4e6a-afa5-6dc5dd2555b6	dad13bc3-9b03-45c1-ba6d-08b4b8e7ea1b
e2d30c5e-4b35-4e6a-afa5-6dc5dd2555b6	bb0ce41e-7f4d-440b-b247-e619493d13d7
5668cff8-1e06-4063-8e7d-e2e10dced450	537b2293-1fdd-4403-94de-e81159bc57a5
5668cff8-1e06-4063-8e7d-e2e10dced450	ad2005bf-9e55-4291-940f-3d1aaa5f4667
5668cff8-1e06-4063-8e7d-e2e10dced450	37015c20-8238-4813-8700-cc7cabbbda1f
5668cff8-1e06-4063-8e7d-e2e10dced450	26434d51-81bf-4926-8ae1-065ca8575a92
5668cff8-1e06-4063-8e7d-e2e10dced450	b6e84375-abad-4c59-b599-b7d9e4b8e88d
5668cff8-1e06-4063-8e7d-e2e10dced450	585637d1-f814-4f6d-92b5-014b2a9f294b
5668cff8-1e06-4063-8e7d-e2e10dced450	0514ee96-0ad9-4756-a8ff-0f6e2d71d8a8
5668cff8-1e06-4063-8e7d-e2e10dced450	7049b4e6-bf50-45d6-b45a-d3efb8df166f
5668cff8-1e06-4063-8e7d-e2e10dced450	8638b9ba-b749-4762-8996-b8dd08dbe097
5668cff8-1e06-4063-8e7d-e2e10dced450	977bc40e-5db6-4071-bd69-9cb65844513b
5668cff8-1e06-4063-8e7d-e2e10dced450	67dddfcb-f90e-42d1-98b9-0064c9e57c91
5668cff8-1e06-4063-8e7d-e2e10dced450	ab0a0da7-eea7-4e6a-af0f-e04e16f5f8b9
5668cff8-1e06-4063-8e7d-e2e10dced450	5a1a0420-0593-4995-b2e9-d3f583693c9d
5668cff8-1e06-4063-8e7d-e2e10dced450	6c062d16-a31e-4763-9be4-3d710b491601
5668cff8-1e06-4063-8e7d-e2e10dced450	47aa05c4-9700-4f59-92f9-b8f3b54ab5ff
5668cff8-1e06-4063-8e7d-e2e10dced450	622243bc-d95f-40d1-9f09-d4fd01542585
5668cff8-1e06-4063-8e7d-e2e10dced450	f69e856f-966f-4c9e-9f2a-14b1d15a0ba1
26434d51-81bf-4926-8ae1-065ca8575a92	47aa05c4-9700-4f59-92f9-b8f3b54ab5ff
37015c20-8238-4813-8700-cc7cabbbda1f	f69e856f-966f-4c9e-9f2a-14b1d15a0ba1
37015c20-8238-4813-8700-cc7cabbbda1f	6c062d16-a31e-4763-9be4-3d710b491601
a6fe68f7-3492-4ad2-a19c-7768783e8e44	b293d3b8-5192-499f-9d9b-3939ab1be311
a6fe68f7-3492-4ad2-a19c-7768783e8e44	215e0e1b-6641-4e74-b51a-ca428913347e
a6fe68f7-3492-4ad2-a19c-7768783e8e44	914f47be-2bc6-40f5-ac4d-0bb5f1ebe26e
a6fe68f7-3492-4ad2-a19c-7768783e8e44	1eb81ec9-b79f-4c41-bb84-5bb6b77064b0
a6fe68f7-3492-4ad2-a19c-7768783e8e44	bf4ece02-8e91-46b1-aa8c-ffa63a7dc710
a6fe68f7-3492-4ad2-a19c-7768783e8e44	c71e02b5-c8bb-4c4a-97f0-b7ab93dd22b1
a6fe68f7-3492-4ad2-a19c-7768783e8e44	fded27c6-f689-4573-b822-c5d1ab774627
a6fe68f7-3492-4ad2-a19c-7768783e8e44	26320f50-a9d3-48ee-8999-217c1b46a7f5
a6fe68f7-3492-4ad2-a19c-7768783e8e44	07617bdd-e587-46e7-979f-bb51c80fe3c9
a6fe68f7-3492-4ad2-a19c-7768783e8e44	c2306b73-47ab-4b12-9cc0-93b27a8e47a0
a6fe68f7-3492-4ad2-a19c-7768783e8e44	abe6333e-d6d3-4dde-9977-e800eb86110e
a6fe68f7-3492-4ad2-a19c-7768783e8e44	74ca5d84-015a-4716-a22c-62508dafe444
a6fe68f7-3492-4ad2-a19c-7768783e8e44	9e10c39c-ce6b-47ef-82bb-f1941b4d6ff9
a6fe68f7-3492-4ad2-a19c-7768783e8e44	7cb69823-be64-4b0d-985d-d56e6f43710e
a6fe68f7-3492-4ad2-a19c-7768783e8e44	48e20dd2-05bf-4c1d-8f80-a13cd658437f
a6fe68f7-3492-4ad2-a19c-7768783e8e44	802f9180-d775-4eb5-83fb-84e27b75800d
a6fe68f7-3492-4ad2-a19c-7768783e8e44	5d7d8047-a133-46b6-b8a6-d26a111ae605
1eb81ec9-b79f-4c41-bb84-5bb6b77064b0	48e20dd2-05bf-4c1d-8f80-a13cd658437f
914f47be-2bc6-40f5-ac4d-0bb5f1ebe26e	5d7d8047-a133-46b6-b8a6-d26a111ae605
914f47be-2bc6-40f5-ac4d-0bb5f1ebe26e	7cb69823-be64-4b0d-985d-d56e6f43710e
9c290eec-94eb-4a28-9922-4e2b5bea821f	d538957c-8c84-4199-b98d-fa17ce5d88a7
9c290eec-94eb-4a28-9922-4e2b5bea821f	4c4ea5a1-3ca0-4b12-977f-3214110c6be4
4c4ea5a1-3ca0-4b12-977f-3214110c6be4	c21f7a8e-33ae-489c-9cc6-52f4d1f72546
00ba8579-905c-461a-898f-f86ee7842dcb	9711a1c7-9492-4556-8248-54cd2f1a5911
5668cff8-1e06-4063-8e7d-e2e10dced450	9b3b13a3-f7f7-4cf2-98aa-3e9ad55de368
a6fe68f7-3492-4ad2-a19c-7768783e8e44	3233a0d7-195f-4397-bc1f-201e7db218b8
9c290eec-94eb-4a28-9922-4e2b5bea821f	09e95fcd-508d-4674-b00e-9e6d16402f6a
9c290eec-94eb-4a28-9922-4e2b5bea821f	027f62da-a586-44f4-bd22-4a8201df2ea8
7389224e-3b56-41f2-bc8f-3c77fd7b15e2	f94613f9-0588-4f04-8671-862f66ae000d
a0de75ff-15d9-487b-8f19-bed0bc2a4995	e71112b0-aea9-4f17-aac6-2fc0f8711c78
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
b19416db-5208-475b-b07a-d9576336a83f	\N	password	a9c36523-f626-457a-836a-7cd7a4c0dc11	1638268526063	\N	{"value":"oZMb4OUhgynA3Hs3SWQ73DKBxbRvPt3E9srxC2TycwlnB89Bh5mPGfsKoQuaonWFGmmFySQUNlDfgQ9mcafqbQ==","salt":"E4goqFUWAejHgLvXjht8XA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
1001860b-19b0-4855-b855-4c688b32b6c6	\N	password	0ac4d063-9901-42b6-bca9-53bdf42139fa	1638476561128	\N	{"value":"QBvaIgMAPhsbjV/OvjXHzpNNVPqk+v7LW13QdykysL48w0pPoERLAlEH+yXrm22vscysqyqnmORXHKHTorb2ZQ==","salt":"tNcInqdPkZZlIgJDFSv+Yw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
d8067fdd-3834-409f-8e2d-c6494e4421eb	\N	password	566d2571-84cd-4e25-a7d1-37b69e21b8ed	1638476584565	\N	{"value":"UvVu8Y7vdSoPKiSCYBifXTwmnihyXs8Kwkb5qyI3dMy5lcYz+TQIUrwyKIDceGNmi13nHRj1/0q9Bf1a+cLIBQ==","salt":"YUQ8CNs3lZnYb74dOvr+FA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
0c0b718b-43e1-4e09-a22c-8ecd51f3a1a6	\N	password	e0af645c-63cc-4f1d-b088-8de3d3c3623b	1638477993271	\N	{"value":"jwShI238i3tSkiNkxuh6NnLhHJ/UPgrhsGOpsjqlRumj8ig4pzRLnzb3SPHOzwqhNthQNC6c3SYnFCZ/VS85Fg==","salt":"WghGC+SzfHHVFXcN/K851A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2021-11-30 10:35:18.14092	1	EXECUTED	7:4e70412f24a3f382c82183742ec79317	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	8268517723
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2021-11-30 10:35:18.151429	2	MARK_RAN	7:cb16724583e9675711801c6875114f28	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	8268517723
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2021-11-30 10:35:18.199484	3	EXECUTED	7:0310eb8ba07cec616460794d42ade0fa	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	3.5.4	\N	\N	8268517723
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2021-11-30 10:35:18.203681	4	EXECUTED	7:5d25857e708c3233ef4439df1f93f012	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	8268517723
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2021-11-30 10:35:18.330883	5	EXECUTED	7:c7a54a1041d58eb3817a4a883b4d4e84	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	8268517723
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2021-11-30 10:35:18.337021	6	MARK_RAN	7:2e01012df20974c1c2a605ef8afe25b7	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	8268517723
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2021-11-30 10:35:18.504899	7	EXECUTED	7:0f08df48468428e0f30ee59a8ec01a41	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	8268517723
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2021-11-30 10:35:18.512203	8	MARK_RAN	7:a77ea2ad226b345e7d689d366f185c8c	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	8268517723
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2021-11-30 10:35:18.518621	9	EXECUTED	7:a3377a2059aefbf3b90ebb4c4cc8e2ab	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	3.5.4	\N	\N	8268517723
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2021-11-30 10:35:18.659435	10	EXECUTED	7:04c1dbedc2aa3e9756d1a1668e003451	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	3.5.4	\N	\N	8268517723
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2021-11-30 10:35:18.725839	11	EXECUTED	7:36ef39ed560ad07062d956db861042ba	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	8268517723
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2021-11-30 10:35:18.729613	12	MARK_RAN	7:d909180b2530479a716d3f9c9eaea3d7	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	8268517723
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2021-11-30 10:35:18.745832	13	EXECUTED	7:cf12b04b79bea5152f165eb41f3955f6	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	8268517723
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-11-30 10:35:18.785362	14	EXECUTED	7:7e32c8f05c755e8675764e7d5f514509	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	3.5.4	\N	\N	8268517723
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-11-30 10:35:18.787745	15	MARK_RAN	7:980ba23cc0ec39cab731ce903dd01291	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	8268517723
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-11-30 10:35:18.790323	16	MARK_RAN	7:2fa220758991285312eb84f3b4ff5336	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	3.5.4	\N	\N	8268517723
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2021-11-30 10:35:18.792979	17	EXECUTED	7:d41d8cd98f00b204e9800998ecf8427e	empty		\N	3.5.4	\N	\N	8268517723
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2021-11-30 10:35:18.853668	18	EXECUTED	7:91ace540896df890cc00a0490ee52bbc	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	3.5.4	\N	\N	8268517723
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2021-11-30 10:35:18.898662	19	EXECUTED	7:c31d1646dfa2618a9335c00e07f89f24	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	8268517723
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2021-11-30 10:35:18.903832	20	EXECUTED	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	8268517723
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-11-30 10:35:20.447416	45	EXECUTED	7:6a48ce645a3525488a90fbf76adf3bb3	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	8268517723
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2021-11-30 10:35:18.906712	21	MARK_RAN	7:f987971fe6b37d963bc95fee2b27f8df	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	8268517723
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2021-11-30 10:35:18.909644	22	MARK_RAN	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	8268517723
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2021-11-30 10:35:18.95235	23	EXECUTED	7:ed2dc7f799d19ac452cbcda56c929e47	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	3.5.4	\N	\N	8268517723
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2021-11-30 10:35:18.957514	24	EXECUTED	7:80b5db88a5dda36ece5f235be8757615	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	8268517723
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2021-11-30 10:35:18.959829	25	MARK_RAN	7:1437310ed1305a9b93f8848f301726ce	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	8268517723
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2021-11-30 10:35:19.224544	26	EXECUTED	7:b82ffb34850fa0836be16deefc6a87c4	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	3.5.4	\N	\N	8268517723
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2021-11-30 10:35:19.338517	27	EXECUTED	7:9cc98082921330d8d9266decdd4bd658	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	3.5.4	\N	\N	8268517723
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2021-11-30 10:35:19.344586	28	EXECUTED	7:03d64aeed9cb52b969bd30a7ac0db57e	update tableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	8268517723
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2021-11-30 10:35:19.414949	29	EXECUTED	7:f1f9fd8710399d725b780f463c6b21cd	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	3.5.4	\N	\N	8268517723
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2021-11-30 10:35:19.433754	30	EXECUTED	7:53188c3eb1107546e6f765835705b6c1	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	3.5.4	\N	\N	8268517723
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2021-11-30 10:35:19.451801	31	EXECUTED	7:d6e6f3bc57a0c5586737d1351725d4d4	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	3.5.4	\N	\N	8268517723
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2021-11-30 10:35:19.456134	32	EXECUTED	7:454d604fbd755d9df3fd9c6329043aa5	customChange		\N	3.5.4	\N	\N	8268517723
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-11-30 10:35:19.461324	33	EXECUTED	7:57e98a3077e29caf562f7dbf80c72600	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	8268517723
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-11-30 10:35:19.462935	34	MARK_RAN	7:e4c7e8f2256210aee71ddc42f538b57a	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	8268517723
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-11-30 10:35:19.482993	35	EXECUTED	7:09a43c97e49bc626460480aa1379b522	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	8268517723
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2021-11-30 10:35:19.486994	36	EXECUTED	7:26bfc7c74fefa9126f2ce702fb775553	addColumn tableName=REALM		\N	3.5.4	\N	\N	8268517723
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2021-11-30 10:35:19.492201	37	EXECUTED	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	8268517723
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2021-11-30 10:35:19.495119	38	EXECUTED	7:37fc1781855ac5388c494f1442b3f717	addColumn tableName=FED_USER_CONSENT		\N	3.5.4	\N	\N	8268517723
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2021-11-30 10:35:19.497804	39	EXECUTED	7:13a27db0dae6049541136adad7261d27	addColumn tableName=IDENTITY_PROVIDER		\N	3.5.4	\N	\N	8268517723
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2021-11-30 10:35:19.499722	40	MARK_RAN	7:550300617e3b59e8af3a6294df8248a3	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	8268517723
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2021-11-30 10:35:19.501728	41	MARK_RAN	7:e3a9482b8931481dc2772a5c07c44f17	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	8268517723
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2021-11-30 10:35:19.505332	42	EXECUTED	7:72b07d85a2677cb257edb02b408f332d	customChange		\N	3.5.4	\N	\N	8268517723
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2021-11-30 10:35:20.435414	43	EXECUTED	7:a72a7858967bd414835d19e04d880312	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	3.5.4	\N	\N	8268517723
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2021-11-30 10:35:20.442269	44	EXECUTED	7:94edff7cf9ce179e7e85f0cd78a3cf2c	addColumn tableName=USER_ENTITY		\N	3.5.4	\N	\N	8268517723
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-11-30 10:35:20.452401	46	EXECUTED	7:e64b5dcea7db06077c6e57d3b9e5ca14	customChange		\N	3.5.4	\N	\N	8268517723
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-11-30 10:35:20.454374	47	MARK_RAN	7:fd8cf02498f8b1e72496a20afc75178c	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	8268517723
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-11-30 10:35:20.532712	48	EXECUTED	7:542794f25aa2b1fbabb7e577d6646319	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	3.5.4	\N	\N	8268517723
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2021-11-30 10:35:20.537228	49	EXECUTED	7:edad604c882df12f74941dac3cc6d650	addColumn tableName=REALM		\N	3.5.4	\N	\N	8268517723
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2021-11-30 10:35:20.576532	50	EXECUTED	7:0f88b78b7b46480eb92690cbf5e44900	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	3.5.4	\N	\N	8268517723
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2021-11-30 10:35:20.814355	51	EXECUTED	7:d560e43982611d936457c327f872dd59	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	3.5.4	\N	\N	8268517723
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2021-11-30 10:35:20.818137	52	EXECUTED	7:c155566c42b4d14ef07059ec3b3bbd8e	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	8268517723
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2021-11-30 10:35:20.821124	53	EXECUTED	7:b40376581f12d70f3c89ba8ddf5b7dea	update tableName=REALM		\N	3.5.4	\N	\N	8268517723
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2021-11-30 10:35:20.824722	54	EXECUTED	7:a1132cc395f7b95b3646146c2e38f168	update tableName=CLIENT		\N	3.5.4	\N	\N	8268517723
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-11-30 10:35:20.845436	55	EXECUTED	7:d8dc5d89c789105cfa7ca0e82cba60af	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	3.5.4	\N	\N	8268517723
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-11-30 10:35:20.850821	56	EXECUTED	7:7822e0165097182e8f653c35517656a3	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	3.5.4	\N	\N	8268517723
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-11-30 10:35:20.887678	57	EXECUTED	7:c6538c29b9c9a08f9e9ea2de5c2b6375	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	3.5.4	\N	\N	8268517723
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2021-11-30 10:35:21.122253	58	EXECUTED	7:6d4893e36de22369cf73bcb051ded875	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	3.5.4	\N	\N	8268517723
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2021-11-30 10:35:21.147024	59	EXECUTED	7:57960fc0b0f0dd0563ea6f8b2e4a1707	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	3.5.4	\N	\N	8268517723
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2021-11-30 10:35:21.151619	60	EXECUTED	7:2b4b8bff39944c7097977cc18dbceb3b	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	8268517723
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2021-11-30 10:35:21.157871	61	EXECUTED	7:2aa42a964c59cd5b8ca9822340ba33a8	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	3.5.4	\N	\N	8268517723
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2021-11-30 10:35:21.162291	62	EXECUTED	7:9ac9e58545479929ba23f4a3087a0346	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	3.5.4	\N	\N	8268517723
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2021-11-30 10:35:21.165733	63	EXECUTED	7:14d407c35bc4fe1976867756bcea0c36	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	8268517723
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2021-11-30 10:35:21.168121	64	EXECUTED	7:241a8030c748c8548e346adee548fa93	update tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	8268517723
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2021-11-30 10:35:21.170397	65	EXECUTED	7:7d3182f65a34fcc61e8d23def037dc3f	update tableName=RESOURCE_SERVER_RESOURCE		\N	3.5.4	\N	\N	8268517723
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2021-11-30 10:35:21.193367	66	EXECUTED	7:b30039e00a0b9715d430d1b0636728fa	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	3.5.4	\N	\N	8268517723
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2021-11-30 10:35:21.20898	67	EXECUTED	7:3797315ca61d531780f8e6f82f258159	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	3.5.4	\N	\N	8268517723
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2021-11-30 10:35:21.212887	68	EXECUTED	7:c7aa4c8d9573500c2d347c1941ff0301	addColumn tableName=REALM		\N	3.5.4	\N	\N	8268517723
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2021-11-30 10:35:21.230574	69	EXECUTED	7:b207faee394fc074a442ecd42185a5dd	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	3.5.4	\N	\N	8268517723
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2021-11-30 10:35:21.23441	70	EXECUTED	7:ab9a9762faaba4ddfa35514b212c4922	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	3.5.4	\N	\N	8268517723
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2021-11-30 10:35:21.237226	71	EXECUTED	7:b9710f74515a6ccb51b72dc0d19df8c4	addColumn tableName=RESOURCE_SERVER		\N	3.5.4	\N	\N	8268517723
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-11-30 10:35:21.242844	72	EXECUTED	7:ec9707ae4d4f0b7452fee20128083879	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	8268517723
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-11-30 10:35:21.24691	73	EXECUTED	7:3979a0ae07ac465e920ca696532fc736	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	8268517723
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-11-30 10:35:21.248482	74	MARK_RAN	7:5abfde4c259119d143bd2fbf49ac2bca	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	8268517723
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-11-30 10:35:21.259545	75	EXECUTED	7:b48da8c11a3d83ddd6b7d0c8c2219345	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	3.5.4	\N	\N	8268517723
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2021-11-30 10:35:21.2766	76	EXECUTED	7:a73379915c23bfad3e8f5c6d5c0aa4bd	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	3.5.4	\N	\N	8268517723
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-11-30 10:35:21.292655	77	EXECUTED	7:39e0073779aba192646291aa2332493d	addColumn tableName=CLIENT		\N	3.5.4	\N	\N	8268517723
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-11-30 10:35:21.294855	78	MARK_RAN	7:81f87368f00450799b4bf42ea0b3ec34	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	3.5.4	\N	\N	8268517723
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-11-30 10:35:21.316765	79	EXECUTED	7:20b37422abb9fb6571c618148f013a15	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	3.5.4	\N	\N	8268517723
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2021-11-30 10:35:21.321607	80	MARK_RAN	7:1970bb6cfb5ee800736b95ad3fb3c78a	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	3.5.4	\N	\N	8268517723
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-11-30 10:35:21.348837	81	EXECUTED	7:45d9b25fc3b455d522d8dcc10a0f4c80	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	3.5.4	\N	\N	8268517723
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-11-30 10:35:21.354801	82	MARK_RAN	7:890ae73712bc187a66c2813a724d037f	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	8268517723
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-11-30 10:35:21.363016	83	EXECUTED	7:0a211980d27fafe3ff50d19a3a29b538	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	8268517723
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-11-30 10:35:21.365789	84	MARK_RAN	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	8268517723
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2021-11-30 10:35:21.391672	85	EXECUTED	7:01c49302201bdf815b0a18d1f98a55dc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	8268517723
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2021-11-30 10:35:21.396887	86	EXECUTED	7:3dace6b144c11f53f1ad2c0361279b86	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	3.5.4	\N	\N	8268517723
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2021-11-30 10:35:21.403463	87	EXECUTED	7:578d0b92077eaf2ab95ad0ec087aa903	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	3.5.4	\N	\N	8268517723
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2021-11-30 10:35:21.412766	88	EXECUTED	7:c95abe90d962c57a09ecaee57972835d	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	3.5.4	\N	\N	8268517723
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2021-11-30 10:35:21.418027	89	EXECUTED	7:f1313bcc2994a5c4dc1062ed6d8282d3	addColumn tableName=REALM; customChange		\N	3.5.4	\N	\N	8268517723
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2021-11-30 10:35:21.42385	90	EXECUTED	7:90d763b52eaffebefbcbde55f269508b	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	3.5.4	\N	\N	8268517723
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2021-11-30 10:35:21.48132	91	EXECUTED	7:d554f0cb92b764470dccfa5e0014a7dd	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	8268517723
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2021-11-30 10:35:21.495045	92	EXECUTED	7:73193e3ab3c35cf0f37ccea3bf783764	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	3.5.4	\N	\N	8268517723
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2021-11-30 10:35:21.508218	93	MARK_RAN	7:90a1e74f92e9cbaa0c5eab80b8a037f3	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	3.5.4	\N	\N	8268517723
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2021-11-30 10:35:21.530954	94	EXECUTED	7:5b9248f29cd047c200083cc6d8388b16	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	3.5.4	\N	\N	8268517723
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2021-11-30 10:35:21.5337	95	MARK_RAN	7:64db59e44c374f13955489e8990d17a1	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	3.5.4	\N	\N	8268517723
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2021-11-30 10:35:21.542919	96	EXECUTED	7:329a578cdb43262fff975f0a7f6cda60	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	3.5.4	\N	\N	8268517723
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2021-11-30 10:35:21.603697	97	EXECUTED	7:fae0de241ac0fd0bbc2b380b85e4f567	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	8268517723
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2021-11-30 10:35:21.605553	98	MARK_RAN	7:075d54e9180f49bb0c64ca4218936e81	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	8268517723
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2021-11-30 10:35:21.614735	99	MARK_RAN	7:06499836520f4f6b3d05e35a59324910	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	8268517723
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2021-11-30 10:35:21.638849	100	EXECUTED	7:fad08e83c77d0171ec166bc9bc5d390a	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	8268517723
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2021-11-30 10:35:21.641293	101	MARK_RAN	7:3d2b23076e59c6f70bae703aa01be35b	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	8268517723
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2021-11-30 10:35:21.660599	102	EXECUTED	7:1a7f28ff8d9e53aeb879d76ea3d9341a	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	3.5.4	\N	\N	8268517723
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2021-11-30 10:35:21.664574	103	EXECUTED	7:2fd554456fed4a82c698c555c5b751b6	customChange		\N	3.5.4	\N	\N	8268517723
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2021-11-30 10:35:21.6684	104	EXECUTED	7:b06356d66c2790ecc2ae54ba0458397a	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	3.5.4	\N	\N	8268517723
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
master	481bd562-29ea-497c-af9b-4935de901794	f
master	aa36e00c-9258-4150-8232-bbf30cd0607f	t
master	e5ce1ddf-d14d-4cf2-a794-439adfb09c31	t
master	81d0be7d-40d8-4415-8bab-151da5f49105	t
master	f8bf5f1a-350c-46a6-b4e7-0ffb33d77e49	f
master	57c8eb6a-2a04-44be-9d1b-b4477911f072	f
master	78fd28f2-102f-4081-a73e-14f06a24da0a	t
master	3bd97282-e6ce-4df8-9b0e-10002208b817	t
master	91c8a807-6e74-4cea-8b61-a28988fb2845	f
Store Test Realm	f29a8df1-65d1-4aff-808c-a6ed372b55bb	f
Store Test Realm	3285397d-09bf-475e-84a1-aac370aefd90	t
Store Test Realm	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315	t
Store Test Realm	142b7e8d-bedf-4505-859d-ec908915bb3d	t
Store Test Realm	9beb9f31-86dc-4be7-bca4-0ffd9c83de3f	f
Store Test Realm	c725bce1-46f4-449f-9104-9703c2a2974e	f
Store Test Realm	317b49ac-a743-4e40-b768-a743e876c292	t
Store Test Realm	42017f39-8d8a-46cb-beb1-e2686cc6c126	t
Store Test Realm	e35b190a-7e82-4faf-8b62-ec2d73164c21	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
e2d30c5e-4b35-4e6a-afa5-6dc5dd2555b6	master	f	${role_default-roles}	default-roles-master	master	\N	\N
5668cff8-1e06-4063-8e7d-e2e10dced450	master	f	${role_admin}	admin	master	\N	\N
5ecf3642-c308-43b8-9526-1e83c7ddd8a5	master	f	${role_create-realm}	create-realm	master	\N	\N
d819e179-3cd6-456a-bee7-5bed1b8fb678	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_create-client}	create-client	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
c8bc82d5-dedf-46d6-9b23-4f288fb28b0e	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_view-realm}	view-realm	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
df8c6979-383f-4eed-b089-702a4bb6ad8c	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_view-users}	view-users	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
509a4463-a5d7-4ef4-8165-447c4a5606ac	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_view-clients}	view-clients	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
67f92c08-9192-4861-9fda-ec48b8949f78	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_view-events}	view-events	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
1b8428ee-78f1-44e4-9900-888839962fe6	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_view-identity-providers}	view-identity-providers	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
039baf77-3720-42d8-adcf-47ac6245f456	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_view-authorization}	view-authorization	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
9bfad9c7-e12a-4456-b9bc-dd1f541945a1	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_manage-realm}	manage-realm	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
f3072e52-4089-4d6d-b627-3a9c51b4a276	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_manage-users}	manage-users	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
d96b01ef-401c-45c4-a156-1ad6f2f7f326	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_manage-clients}	manage-clients	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
39307a88-3889-4ba4-b42c-981364f565f9	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_manage-events}	manage-events	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
7c65ae69-1337-4ac1-a3f7-dcfad4b3a191	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_manage-identity-providers}	manage-identity-providers	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
7e0e288f-6ba6-47a0-802f-a5ffc1aaec9e	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_manage-authorization}	manage-authorization	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
9061c0f8-ee7c-447f-945d-4f2143726b10	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_query-users}	query-users	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
1c098dcb-c28b-4329-a37c-068702a800a9	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_query-clients}	query-clients	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
c4585ed5-06ea-4a53-850a-93f849238abd	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_query-realms}	query-realms	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
cf9e5f48-b122-4e94-96d1-e88248d1810c	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_query-groups}	query-groups	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
566469d3-03cb-4d41-b76f-5656912a8418	3db5e1fc-aaa8-4c2f-871d-20397d651a3d	t	${role_view-profile}	view-profile	master	3db5e1fc-aaa8-4c2f-871d-20397d651a3d	\N
1d2c7675-4774-4b45-8287-3f632edc8297	3db5e1fc-aaa8-4c2f-871d-20397d651a3d	t	${role_manage-account}	manage-account	master	3db5e1fc-aaa8-4c2f-871d-20397d651a3d	\N
7002c318-a649-480e-88b0-bca74c51d9df	3db5e1fc-aaa8-4c2f-871d-20397d651a3d	t	${role_manage-account-links}	manage-account-links	master	3db5e1fc-aaa8-4c2f-871d-20397d651a3d	\N
8150a429-67b4-4d2f-a877-98229b99bceb	3db5e1fc-aaa8-4c2f-871d-20397d651a3d	t	${role_view-applications}	view-applications	master	3db5e1fc-aaa8-4c2f-871d-20397d651a3d	\N
8a50242e-7986-4de4-a2d8-b6caab12d045	3db5e1fc-aaa8-4c2f-871d-20397d651a3d	t	${role_view-consent}	view-consent	master	3db5e1fc-aaa8-4c2f-871d-20397d651a3d	\N
9ac5c78d-4a9c-45fc-a604-777b43bb4032	3db5e1fc-aaa8-4c2f-871d-20397d651a3d	t	${role_manage-consent}	manage-consent	master	3db5e1fc-aaa8-4c2f-871d-20397d651a3d	\N
131796fa-25c3-4434-8bf1-0b581e2c0255	3db5e1fc-aaa8-4c2f-871d-20397d651a3d	t	${role_delete-account}	delete-account	master	3db5e1fc-aaa8-4c2f-871d-20397d651a3d	\N
cd394959-25b2-49cb-828a-51072a6eb3d2	96ee517f-0d94-45f5-9314-2ed840aaa03f	t	${role_read-token}	read-token	master	96ee517f-0d94-45f5-9314-2ed840aaa03f	\N
6ebc47c9-485b-4afd-8f25-434a50fa2e27	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	t	${role_impersonation}	impersonation	master	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	\N
dad13bc3-9b03-45c1-ba6d-08b4b8e7ea1b	master	f	${role_offline-access}	offline_access	master	\N	\N
bb0ce41e-7f4d-440b-b247-e619493d13d7	master	f	${role_uma_authorization}	uma_authorization	master	\N	\N
67dddfcb-f90e-42d1-98b9-0064c9e57c91	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_manage-events}	manage-events	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
9c290eec-94eb-4a28-9922-4e2b5bea821f	Store Test Realm	f	${role_default-roles}	default-roles-store test realm	Store Test Realm	\N	\N
537b2293-1fdd-4403-94de-e81159bc57a5	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_create-client}	create-client	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
ad2005bf-9e55-4291-940f-3d1aaa5f4667	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_view-realm}	view-realm	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
37015c20-8238-4813-8700-cc7cabbbda1f	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_view-users}	view-users	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
26434d51-81bf-4926-8ae1-065ca8575a92	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_view-clients}	view-clients	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
b6e84375-abad-4c59-b599-b7d9e4b8e88d	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_view-events}	view-events	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
585637d1-f814-4f6d-92b5-014b2a9f294b	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_view-identity-providers}	view-identity-providers	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
0514ee96-0ad9-4756-a8ff-0f6e2d71d8a8	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_view-authorization}	view-authorization	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
7049b4e6-bf50-45d6-b45a-d3efb8df166f	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_manage-realm}	manage-realm	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
8638b9ba-b749-4762-8996-b8dd08dbe097	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_manage-users}	manage-users	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
977bc40e-5db6-4071-bd69-9cb65844513b	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_manage-clients}	manage-clients	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
ab0a0da7-eea7-4e6a-af0f-e04e16f5f8b9	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_manage-identity-providers}	manage-identity-providers	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
5a1a0420-0593-4995-b2e9-d3f583693c9d	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_manage-authorization}	manage-authorization	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
6c062d16-a31e-4763-9be4-3d710b491601	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_query-users}	query-users	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
47aa05c4-9700-4f59-92f9-b8f3b54ab5ff	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_query-clients}	query-clients	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
622243bc-d95f-40d1-9f09-d4fd01542585	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_query-realms}	query-realms	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
f69e856f-966f-4c9e-9f2a-14b1d15a0ba1	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_query-groups}	query-groups	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
a6fe68f7-3492-4ad2-a19c-7768783e8e44	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_realm-admin}	realm-admin	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
b293d3b8-5192-499f-9d9b-3939ab1be311	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_create-client}	create-client	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
215e0e1b-6641-4e74-b51a-ca428913347e	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_view-realm}	view-realm	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
914f47be-2bc6-40f5-ac4d-0bb5f1ebe26e	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_view-users}	view-users	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
1eb81ec9-b79f-4c41-bb84-5bb6b77064b0	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_view-clients}	view-clients	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
bf4ece02-8e91-46b1-aa8c-ffa63a7dc710	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_view-events}	view-events	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
c71e02b5-c8bb-4c4a-97f0-b7ab93dd22b1	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_view-identity-providers}	view-identity-providers	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
fded27c6-f689-4573-b822-c5d1ab774627	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_view-authorization}	view-authorization	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
26320f50-a9d3-48ee-8999-217c1b46a7f5	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_manage-realm}	manage-realm	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
07617bdd-e587-46e7-979f-bb51c80fe3c9	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_manage-users}	manage-users	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
c2306b73-47ab-4b12-9cc0-93b27a8e47a0	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_manage-clients}	manage-clients	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
abe6333e-d6d3-4dde-9977-e800eb86110e	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_manage-events}	manage-events	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
74ca5d84-015a-4716-a22c-62508dafe444	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_manage-identity-providers}	manage-identity-providers	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
9e10c39c-ce6b-47ef-82bb-f1941b4d6ff9	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_manage-authorization}	manage-authorization	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
7cb69823-be64-4b0d-985d-d56e6f43710e	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_query-users}	query-users	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
48e20dd2-05bf-4c1d-8f80-a13cd658437f	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_query-clients}	query-clients	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
802f9180-d775-4eb5-83fb-84e27b75800d	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_query-realms}	query-realms	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
5d7d8047-a133-46b6-b8a6-d26a111ae605	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_query-groups}	query-groups	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
d538957c-8c84-4199-b98d-fa17ce5d88a7	d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	t	${role_view-profile}	view-profile	Store Test Realm	d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	\N
4c4ea5a1-3ca0-4b12-977f-3214110c6be4	d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	t	${role_manage-account}	manage-account	Store Test Realm	d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	\N
c21f7a8e-33ae-489c-9cc6-52f4d1f72546	d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	t	${role_manage-account-links}	manage-account-links	Store Test Realm	d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	\N
4bd28ed4-7682-4439-be12-e4032bb6ba2c	d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	t	${role_view-applications}	view-applications	Store Test Realm	d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	\N
9711a1c7-9492-4556-8248-54cd2f1a5911	d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	t	${role_view-consent}	view-consent	Store Test Realm	d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	\N
00ba8579-905c-461a-898f-f86ee7842dcb	d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	t	${role_manage-consent}	manage-consent	Store Test Realm	d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	\N
d238e85a-7569-48c5-8b4a-3339685ea7c9	d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	t	${role_delete-account}	delete-account	Store Test Realm	d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	\N
9b3b13a3-f7f7-4cf2-98aa-3e9ad55de368	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	t	${role_impersonation}	impersonation	master	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	\N
3233a0d7-195f-4397-bc1f-201e7db218b8	afd475fc-72ae-49ee-a173-6661d42e58ad	t	${role_impersonation}	impersonation	Store Test Realm	afd475fc-72ae-49ee-a173-6661d42e58ad	\N
dd986391-18d4-4f27-ab81-87f870b8609b	700d6658-8d75-4eed-8051-da4d153dbde9	t	${role_read-token}	read-token	Store Test Realm	700d6658-8d75-4eed-8051-da4d153dbde9	\N
09e95fcd-508d-4674-b00e-9e6d16402f6a	Store Test Realm	f	${role_offline-access}	offline_access	Store Test Realm	\N	\N
027f62da-a586-44f4-bd22-4a8201df2ea8	Store Test Realm	f	${role_uma_authorization}	uma_authorization	Store Test Realm	\N	\N
f94613f9-0588-4f04-8671-862f66ae000d	5fab1a22-e6b6-4de7-a907-b12a3a35e691	t	Client admin role	admin	Store Test Realm	5fab1a22-e6b6-4de7-a907-b12a3a35e691	\N
e71112b0-aea9-4f17-aac6-2fc0f8711c78	5fab1a22-e6b6-4de7-a907-b12a3a35e691	t	Client user role	user	Store Test Realm	5fab1a22-e6b6-4de7-a907-b12a3a35e691	\N
7389224e-3b56-41f2-bc8f-3c77fd7b15e2	Store Test Realm	f	Realm admin role	app-admin	Store Test Realm	\N	\N
a0de75ff-15d9-487b-8f19-bed0bc2a4995	Store Test Realm	f	Realm user role	app-user	Store Test Realm	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
0rvdf	15.0.2	1638268524
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
7087920e-ff71-4e65-8665-94728bf90de2	audience resolve	openid-connect	oidc-audience-resolve-mapper	213f234c-fd1d-40ed-b307-f005c99e02b9	\N
738d18bf-6204-408f-9af5-18ef34488943	locale	openid-connect	oidc-usermodel-attribute-mapper	5e41cd16-605e-4533-884e-f8f2a4964c50	\N
3d3a1245-472d-44ac-9875-09e347055b8a	role list	saml	saml-role-list-mapper	\N	aa36e00c-9258-4150-8232-bbf30cd0607f
f49c6f58-5c92-4194-954f-c3dd843b378b	full name	openid-connect	oidc-full-name-mapper	\N	e5ce1ddf-d14d-4cf2-a794-439adfb09c31
1b1a40da-10e9-477b-a03c-9a1afebe1767	family name	openid-connect	oidc-usermodel-property-mapper	\N	e5ce1ddf-d14d-4cf2-a794-439adfb09c31
9895de64-52cb-48e7-90d4-ad00d743a30f	given name	openid-connect	oidc-usermodel-property-mapper	\N	e5ce1ddf-d14d-4cf2-a794-439adfb09c31
9422fc7a-bcf1-4ca3-861e-334c4741fae4	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	e5ce1ddf-d14d-4cf2-a794-439adfb09c31
12584e1d-f6f5-4725-a267-9247c3568d42	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	e5ce1ddf-d14d-4cf2-a794-439adfb09c31
1344d704-1c71-469c-8aa1-f5a2ef46fd1b	username	openid-connect	oidc-usermodel-property-mapper	\N	e5ce1ddf-d14d-4cf2-a794-439adfb09c31
b6cb243d-0cad-44c1-a5a7-06f42f47ca22	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	e5ce1ddf-d14d-4cf2-a794-439adfb09c31
fcfcae30-9a6c-42ba-aaef-fe90f62ce6a8	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	e5ce1ddf-d14d-4cf2-a794-439adfb09c31
84d1d27a-98fd-4075-8c4f-0faee21ae16f	website	openid-connect	oidc-usermodel-attribute-mapper	\N	e5ce1ddf-d14d-4cf2-a794-439adfb09c31
cf68ece2-0280-4311-8b2f-2d565d3e2533	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	e5ce1ddf-d14d-4cf2-a794-439adfb09c31
1ec3cdc0-aee0-4696-af14-1961d938094d	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	e5ce1ddf-d14d-4cf2-a794-439adfb09c31
9e4120a5-4ce4-44e5-9772-e3a2d3c69416	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	e5ce1ddf-d14d-4cf2-a794-439adfb09c31
06639d4f-56a6-4da0-ab26-7f5f09c54638	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	e5ce1ddf-d14d-4cf2-a794-439adfb09c31
b2259e52-9d1f-4e0f-94e9-b611a99c94d1	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	e5ce1ddf-d14d-4cf2-a794-439adfb09c31
b5736871-d0c6-438f-bc5b-80314222ec4c	email	openid-connect	oidc-usermodel-property-mapper	\N	81d0be7d-40d8-4415-8bab-151da5f49105
35af1567-7822-4ac7-808b-51cae99e4595	email verified	openid-connect	oidc-usermodel-property-mapper	\N	81d0be7d-40d8-4415-8bab-151da5f49105
76ada962-16cd-47dc-89c1-34fe41d60910	address	openid-connect	oidc-address-mapper	\N	f8bf5f1a-350c-46a6-b4e7-0ffb33d77e49
c490c19a-c33e-46db-bc07-415c14c89d63	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	57c8eb6a-2a04-44be-9d1b-b4477911f072
4037afa0-dff5-474d-9217-78b4c0ae200d	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	57c8eb6a-2a04-44be-9d1b-b4477911f072
2459ac5e-bfc5-4936-80d5-676ebdc22702	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	78fd28f2-102f-4081-a73e-14f06a24da0a
2c91e1b6-e48b-4455-8747-de44e27c802b	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	78fd28f2-102f-4081-a73e-14f06a24da0a
44bbc57f-9f24-45ff-8984-ef6d76a25bd3	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	78fd28f2-102f-4081-a73e-14f06a24da0a
5f25bbf8-c203-4a05-9cb9-ed6e83fadad7	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	3bd97282-e6ce-4df8-9b0e-10002208b817
562a9e59-1758-4d40-9e94-be8b6095ff27	upn	openid-connect	oidc-usermodel-property-mapper	\N	91c8a807-6e74-4cea-8b61-a28988fb2845
cfbe3068-5c33-4abb-ad85-f47d281c4e50	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	91c8a807-6e74-4cea-8b61-a28988fb2845
7cab58de-0ad3-4b4a-b7df-843811fb8066	audience resolve	openid-connect	oidc-audience-resolve-mapper	78ab8f12-3588-4892-83f3-f243576852c2	\N
a571a871-f21f-4f85-943b-8bb207002d9d	role list	saml	saml-role-list-mapper	\N	3285397d-09bf-475e-84a1-aac370aefd90
225946d3-414a-4a26-bd12-239f5b7154e1	full name	openid-connect	oidc-full-name-mapper	\N	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315
601925d1-0803-48c2-bbc9-40476ce74d84	family name	openid-connect	oidc-usermodel-property-mapper	\N	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315
73f081a6-65bf-492b-996f-c249c4f1fe9d	given name	openid-connect	oidc-usermodel-property-mapper	\N	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315
9137a70a-0bbc-47fc-ae31-f6663db50ac4	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315
602c096c-d15d-466c-bb08-2549c1b8a36a	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315
ec4454f5-78b0-43f7-8118-e5cbbba724cb	username	openid-connect	oidc-usermodel-property-mapper	\N	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315
0840cac4-9f89-4bee-9da3-b2b1bbb328cc	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315
e5f38051-6014-40d1-abe9-dd3e783beb8f	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315
f4c8caf4-5f69-415e-97cc-ad12dfa57539	website	openid-connect	oidc-usermodel-attribute-mapper	\N	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315
3ee127e0-eb8c-435c-a444-d498495be4c1	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315
7a668605-0f16-4d7f-9797-4ddb6bdec3b4	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315
b9858f90-a224-49bc-9f08-ffdfb1a9d9e5	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315
9275441a-d578-4067-b592-2540ddb8cf1e	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315
b1441678-65f6-4818-818d-6350dcc0443a	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	5a9c912f-623e-4dbf-a98b-d1a4e1ceb315
7f5d11d3-fb26-4e90-960b-1b7d217ab518	email	openid-connect	oidc-usermodel-property-mapper	\N	142b7e8d-bedf-4505-859d-ec908915bb3d
3ebe941b-acd1-4842-b1d6-0a0e304abd3b	email verified	openid-connect	oidc-usermodel-property-mapper	\N	142b7e8d-bedf-4505-859d-ec908915bb3d
813f2cc6-5b83-4034-89b6-bde9b428af4e	address	openid-connect	oidc-address-mapper	\N	9beb9f31-86dc-4be7-bca4-0ffd9c83de3f
ced6bbdc-db8d-4056-8477-f335e9855bb6	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	c725bce1-46f4-449f-9104-9703c2a2974e
e9cb1358-7bbf-4a11-86c3-1b6c34b25d51	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	c725bce1-46f4-449f-9104-9703c2a2974e
48fcd98c-0119-4c0e-85da-1f54d8012ca6	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	317b49ac-a743-4e40-b768-a743e876c292
081bad96-61c7-4121-8c2a-1919a3f1303e	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	317b49ac-a743-4e40-b768-a743e876c292
93820dce-b7d0-4678-b673-379ce571c843	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	317b49ac-a743-4e40-b768-a743e876c292
2df56f46-1dcd-4658-acd2-c88f6fd6cbf3	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	42017f39-8d8a-46cb-beb1-e2686cc6c126
5188fab5-9c7d-4be8-a937-23155687ba73	upn	openid-connect	oidc-usermodel-property-mapper	\N	e35b190a-7e82-4faf-8b62-ec2d73164c21
f99a6828-bfa1-4d1d-a8e0-03e2be4099b4	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	e35b190a-7e82-4faf-8b62-ec2d73164c21
c30fed80-0f86-4861-929c-c4fd278448e9	locale	openid-connect	oidc-usermodel-attribute-mapper	2931ab87-d448-4787-86d5-9e3ec3a2deaf	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
738d18bf-6204-408f-9af5-18ef34488943	true	userinfo.token.claim
738d18bf-6204-408f-9af5-18ef34488943	locale	user.attribute
738d18bf-6204-408f-9af5-18ef34488943	true	id.token.claim
738d18bf-6204-408f-9af5-18ef34488943	true	access.token.claim
738d18bf-6204-408f-9af5-18ef34488943	locale	claim.name
738d18bf-6204-408f-9af5-18ef34488943	String	jsonType.label
3d3a1245-472d-44ac-9875-09e347055b8a	false	single
3d3a1245-472d-44ac-9875-09e347055b8a	Basic	attribute.nameformat
3d3a1245-472d-44ac-9875-09e347055b8a	Role	attribute.name
f49c6f58-5c92-4194-954f-c3dd843b378b	true	userinfo.token.claim
f49c6f58-5c92-4194-954f-c3dd843b378b	true	id.token.claim
f49c6f58-5c92-4194-954f-c3dd843b378b	true	access.token.claim
1b1a40da-10e9-477b-a03c-9a1afebe1767	true	userinfo.token.claim
1b1a40da-10e9-477b-a03c-9a1afebe1767	lastName	user.attribute
1b1a40da-10e9-477b-a03c-9a1afebe1767	true	id.token.claim
1b1a40da-10e9-477b-a03c-9a1afebe1767	true	access.token.claim
1b1a40da-10e9-477b-a03c-9a1afebe1767	family_name	claim.name
1b1a40da-10e9-477b-a03c-9a1afebe1767	String	jsonType.label
9895de64-52cb-48e7-90d4-ad00d743a30f	true	userinfo.token.claim
9895de64-52cb-48e7-90d4-ad00d743a30f	firstName	user.attribute
9895de64-52cb-48e7-90d4-ad00d743a30f	true	id.token.claim
9895de64-52cb-48e7-90d4-ad00d743a30f	true	access.token.claim
9895de64-52cb-48e7-90d4-ad00d743a30f	given_name	claim.name
9895de64-52cb-48e7-90d4-ad00d743a30f	String	jsonType.label
9422fc7a-bcf1-4ca3-861e-334c4741fae4	true	userinfo.token.claim
9422fc7a-bcf1-4ca3-861e-334c4741fae4	middleName	user.attribute
9422fc7a-bcf1-4ca3-861e-334c4741fae4	true	id.token.claim
9422fc7a-bcf1-4ca3-861e-334c4741fae4	true	access.token.claim
9422fc7a-bcf1-4ca3-861e-334c4741fae4	middle_name	claim.name
9422fc7a-bcf1-4ca3-861e-334c4741fae4	String	jsonType.label
12584e1d-f6f5-4725-a267-9247c3568d42	true	userinfo.token.claim
12584e1d-f6f5-4725-a267-9247c3568d42	nickname	user.attribute
12584e1d-f6f5-4725-a267-9247c3568d42	true	id.token.claim
12584e1d-f6f5-4725-a267-9247c3568d42	true	access.token.claim
12584e1d-f6f5-4725-a267-9247c3568d42	nickname	claim.name
12584e1d-f6f5-4725-a267-9247c3568d42	String	jsonType.label
1344d704-1c71-469c-8aa1-f5a2ef46fd1b	true	userinfo.token.claim
1344d704-1c71-469c-8aa1-f5a2ef46fd1b	username	user.attribute
1344d704-1c71-469c-8aa1-f5a2ef46fd1b	true	id.token.claim
1344d704-1c71-469c-8aa1-f5a2ef46fd1b	true	access.token.claim
1344d704-1c71-469c-8aa1-f5a2ef46fd1b	preferred_username	claim.name
1344d704-1c71-469c-8aa1-f5a2ef46fd1b	String	jsonType.label
b6cb243d-0cad-44c1-a5a7-06f42f47ca22	true	userinfo.token.claim
b6cb243d-0cad-44c1-a5a7-06f42f47ca22	profile	user.attribute
b6cb243d-0cad-44c1-a5a7-06f42f47ca22	true	id.token.claim
b6cb243d-0cad-44c1-a5a7-06f42f47ca22	true	access.token.claim
b6cb243d-0cad-44c1-a5a7-06f42f47ca22	profile	claim.name
b6cb243d-0cad-44c1-a5a7-06f42f47ca22	String	jsonType.label
fcfcae30-9a6c-42ba-aaef-fe90f62ce6a8	true	userinfo.token.claim
fcfcae30-9a6c-42ba-aaef-fe90f62ce6a8	picture	user.attribute
fcfcae30-9a6c-42ba-aaef-fe90f62ce6a8	true	id.token.claim
fcfcae30-9a6c-42ba-aaef-fe90f62ce6a8	true	access.token.claim
fcfcae30-9a6c-42ba-aaef-fe90f62ce6a8	picture	claim.name
fcfcae30-9a6c-42ba-aaef-fe90f62ce6a8	String	jsonType.label
84d1d27a-98fd-4075-8c4f-0faee21ae16f	true	userinfo.token.claim
84d1d27a-98fd-4075-8c4f-0faee21ae16f	website	user.attribute
84d1d27a-98fd-4075-8c4f-0faee21ae16f	true	id.token.claim
84d1d27a-98fd-4075-8c4f-0faee21ae16f	true	access.token.claim
84d1d27a-98fd-4075-8c4f-0faee21ae16f	website	claim.name
84d1d27a-98fd-4075-8c4f-0faee21ae16f	String	jsonType.label
cf68ece2-0280-4311-8b2f-2d565d3e2533	true	userinfo.token.claim
cf68ece2-0280-4311-8b2f-2d565d3e2533	gender	user.attribute
cf68ece2-0280-4311-8b2f-2d565d3e2533	true	id.token.claim
cf68ece2-0280-4311-8b2f-2d565d3e2533	true	access.token.claim
cf68ece2-0280-4311-8b2f-2d565d3e2533	gender	claim.name
cf68ece2-0280-4311-8b2f-2d565d3e2533	String	jsonType.label
1ec3cdc0-aee0-4696-af14-1961d938094d	true	userinfo.token.claim
1ec3cdc0-aee0-4696-af14-1961d938094d	birthdate	user.attribute
1ec3cdc0-aee0-4696-af14-1961d938094d	true	id.token.claim
1ec3cdc0-aee0-4696-af14-1961d938094d	true	access.token.claim
1ec3cdc0-aee0-4696-af14-1961d938094d	birthdate	claim.name
1ec3cdc0-aee0-4696-af14-1961d938094d	String	jsonType.label
9e4120a5-4ce4-44e5-9772-e3a2d3c69416	true	userinfo.token.claim
9e4120a5-4ce4-44e5-9772-e3a2d3c69416	zoneinfo	user.attribute
9e4120a5-4ce4-44e5-9772-e3a2d3c69416	true	id.token.claim
9e4120a5-4ce4-44e5-9772-e3a2d3c69416	true	access.token.claim
9e4120a5-4ce4-44e5-9772-e3a2d3c69416	zoneinfo	claim.name
9e4120a5-4ce4-44e5-9772-e3a2d3c69416	String	jsonType.label
06639d4f-56a6-4da0-ab26-7f5f09c54638	true	userinfo.token.claim
06639d4f-56a6-4da0-ab26-7f5f09c54638	locale	user.attribute
06639d4f-56a6-4da0-ab26-7f5f09c54638	true	id.token.claim
06639d4f-56a6-4da0-ab26-7f5f09c54638	true	access.token.claim
06639d4f-56a6-4da0-ab26-7f5f09c54638	locale	claim.name
06639d4f-56a6-4da0-ab26-7f5f09c54638	String	jsonType.label
b2259e52-9d1f-4e0f-94e9-b611a99c94d1	true	userinfo.token.claim
b2259e52-9d1f-4e0f-94e9-b611a99c94d1	updatedAt	user.attribute
b2259e52-9d1f-4e0f-94e9-b611a99c94d1	true	id.token.claim
b2259e52-9d1f-4e0f-94e9-b611a99c94d1	true	access.token.claim
b2259e52-9d1f-4e0f-94e9-b611a99c94d1	updated_at	claim.name
b2259e52-9d1f-4e0f-94e9-b611a99c94d1	String	jsonType.label
b5736871-d0c6-438f-bc5b-80314222ec4c	true	userinfo.token.claim
b5736871-d0c6-438f-bc5b-80314222ec4c	email	user.attribute
b5736871-d0c6-438f-bc5b-80314222ec4c	true	id.token.claim
b5736871-d0c6-438f-bc5b-80314222ec4c	true	access.token.claim
b5736871-d0c6-438f-bc5b-80314222ec4c	email	claim.name
b5736871-d0c6-438f-bc5b-80314222ec4c	String	jsonType.label
35af1567-7822-4ac7-808b-51cae99e4595	true	userinfo.token.claim
35af1567-7822-4ac7-808b-51cae99e4595	emailVerified	user.attribute
35af1567-7822-4ac7-808b-51cae99e4595	true	id.token.claim
35af1567-7822-4ac7-808b-51cae99e4595	true	access.token.claim
35af1567-7822-4ac7-808b-51cae99e4595	email_verified	claim.name
35af1567-7822-4ac7-808b-51cae99e4595	boolean	jsonType.label
76ada962-16cd-47dc-89c1-34fe41d60910	formatted	user.attribute.formatted
76ada962-16cd-47dc-89c1-34fe41d60910	country	user.attribute.country
76ada962-16cd-47dc-89c1-34fe41d60910	postal_code	user.attribute.postal_code
76ada962-16cd-47dc-89c1-34fe41d60910	true	userinfo.token.claim
76ada962-16cd-47dc-89c1-34fe41d60910	street	user.attribute.street
76ada962-16cd-47dc-89c1-34fe41d60910	true	id.token.claim
76ada962-16cd-47dc-89c1-34fe41d60910	region	user.attribute.region
76ada962-16cd-47dc-89c1-34fe41d60910	true	access.token.claim
76ada962-16cd-47dc-89c1-34fe41d60910	locality	user.attribute.locality
c490c19a-c33e-46db-bc07-415c14c89d63	true	userinfo.token.claim
c490c19a-c33e-46db-bc07-415c14c89d63	phoneNumber	user.attribute
c490c19a-c33e-46db-bc07-415c14c89d63	true	id.token.claim
c490c19a-c33e-46db-bc07-415c14c89d63	true	access.token.claim
c490c19a-c33e-46db-bc07-415c14c89d63	phone_number	claim.name
c490c19a-c33e-46db-bc07-415c14c89d63	String	jsonType.label
4037afa0-dff5-474d-9217-78b4c0ae200d	true	userinfo.token.claim
4037afa0-dff5-474d-9217-78b4c0ae200d	phoneNumberVerified	user.attribute
4037afa0-dff5-474d-9217-78b4c0ae200d	true	id.token.claim
4037afa0-dff5-474d-9217-78b4c0ae200d	true	access.token.claim
4037afa0-dff5-474d-9217-78b4c0ae200d	phone_number_verified	claim.name
4037afa0-dff5-474d-9217-78b4c0ae200d	boolean	jsonType.label
2459ac5e-bfc5-4936-80d5-676ebdc22702	true	multivalued
2459ac5e-bfc5-4936-80d5-676ebdc22702	foo	user.attribute
2459ac5e-bfc5-4936-80d5-676ebdc22702	true	access.token.claim
2459ac5e-bfc5-4936-80d5-676ebdc22702	realm_access.roles	claim.name
2459ac5e-bfc5-4936-80d5-676ebdc22702	String	jsonType.label
2c91e1b6-e48b-4455-8747-de44e27c802b	true	multivalued
2c91e1b6-e48b-4455-8747-de44e27c802b	foo	user.attribute
2c91e1b6-e48b-4455-8747-de44e27c802b	true	access.token.claim
2c91e1b6-e48b-4455-8747-de44e27c802b	resource_access.${client_id}.roles	claim.name
2c91e1b6-e48b-4455-8747-de44e27c802b	String	jsonType.label
562a9e59-1758-4d40-9e94-be8b6095ff27	true	userinfo.token.claim
562a9e59-1758-4d40-9e94-be8b6095ff27	username	user.attribute
562a9e59-1758-4d40-9e94-be8b6095ff27	true	id.token.claim
562a9e59-1758-4d40-9e94-be8b6095ff27	true	access.token.claim
562a9e59-1758-4d40-9e94-be8b6095ff27	upn	claim.name
562a9e59-1758-4d40-9e94-be8b6095ff27	String	jsonType.label
cfbe3068-5c33-4abb-ad85-f47d281c4e50	true	multivalued
cfbe3068-5c33-4abb-ad85-f47d281c4e50	foo	user.attribute
cfbe3068-5c33-4abb-ad85-f47d281c4e50	true	id.token.claim
cfbe3068-5c33-4abb-ad85-f47d281c4e50	true	access.token.claim
cfbe3068-5c33-4abb-ad85-f47d281c4e50	groups	claim.name
cfbe3068-5c33-4abb-ad85-f47d281c4e50	String	jsonType.label
a571a871-f21f-4f85-943b-8bb207002d9d	false	single
a571a871-f21f-4f85-943b-8bb207002d9d	Basic	attribute.nameformat
a571a871-f21f-4f85-943b-8bb207002d9d	Role	attribute.name
225946d3-414a-4a26-bd12-239f5b7154e1	true	userinfo.token.claim
225946d3-414a-4a26-bd12-239f5b7154e1	true	id.token.claim
225946d3-414a-4a26-bd12-239f5b7154e1	true	access.token.claim
601925d1-0803-48c2-bbc9-40476ce74d84	true	userinfo.token.claim
601925d1-0803-48c2-bbc9-40476ce74d84	lastName	user.attribute
601925d1-0803-48c2-bbc9-40476ce74d84	true	id.token.claim
601925d1-0803-48c2-bbc9-40476ce74d84	true	access.token.claim
601925d1-0803-48c2-bbc9-40476ce74d84	family_name	claim.name
601925d1-0803-48c2-bbc9-40476ce74d84	String	jsonType.label
73f081a6-65bf-492b-996f-c249c4f1fe9d	true	userinfo.token.claim
73f081a6-65bf-492b-996f-c249c4f1fe9d	firstName	user.attribute
73f081a6-65bf-492b-996f-c249c4f1fe9d	true	id.token.claim
73f081a6-65bf-492b-996f-c249c4f1fe9d	true	access.token.claim
73f081a6-65bf-492b-996f-c249c4f1fe9d	given_name	claim.name
73f081a6-65bf-492b-996f-c249c4f1fe9d	String	jsonType.label
9137a70a-0bbc-47fc-ae31-f6663db50ac4	true	userinfo.token.claim
9137a70a-0bbc-47fc-ae31-f6663db50ac4	middleName	user.attribute
9137a70a-0bbc-47fc-ae31-f6663db50ac4	true	id.token.claim
9137a70a-0bbc-47fc-ae31-f6663db50ac4	true	access.token.claim
9137a70a-0bbc-47fc-ae31-f6663db50ac4	middle_name	claim.name
9137a70a-0bbc-47fc-ae31-f6663db50ac4	String	jsonType.label
602c096c-d15d-466c-bb08-2549c1b8a36a	true	userinfo.token.claim
602c096c-d15d-466c-bb08-2549c1b8a36a	nickname	user.attribute
602c096c-d15d-466c-bb08-2549c1b8a36a	true	id.token.claim
602c096c-d15d-466c-bb08-2549c1b8a36a	true	access.token.claim
602c096c-d15d-466c-bb08-2549c1b8a36a	nickname	claim.name
602c096c-d15d-466c-bb08-2549c1b8a36a	String	jsonType.label
ec4454f5-78b0-43f7-8118-e5cbbba724cb	true	userinfo.token.claim
ec4454f5-78b0-43f7-8118-e5cbbba724cb	username	user.attribute
ec4454f5-78b0-43f7-8118-e5cbbba724cb	true	id.token.claim
ec4454f5-78b0-43f7-8118-e5cbbba724cb	true	access.token.claim
ec4454f5-78b0-43f7-8118-e5cbbba724cb	preferred_username	claim.name
ec4454f5-78b0-43f7-8118-e5cbbba724cb	String	jsonType.label
0840cac4-9f89-4bee-9da3-b2b1bbb328cc	true	userinfo.token.claim
0840cac4-9f89-4bee-9da3-b2b1bbb328cc	profile	user.attribute
0840cac4-9f89-4bee-9da3-b2b1bbb328cc	true	id.token.claim
0840cac4-9f89-4bee-9da3-b2b1bbb328cc	true	access.token.claim
0840cac4-9f89-4bee-9da3-b2b1bbb328cc	profile	claim.name
0840cac4-9f89-4bee-9da3-b2b1bbb328cc	String	jsonType.label
e5f38051-6014-40d1-abe9-dd3e783beb8f	true	userinfo.token.claim
e5f38051-6014-40d1-abe9-dd3e783beb8f	picture	user.attribute
e5f38051-6014-40d1-abe9-dd3e783beb8f	true	id.token.claim
e5f38051-6014-40d1-abe9-dd3e783beb8f	true	access.token.claim
e5f38051-6014-40d1-abe9-dd3e783beb8f	picture	claim.name
e5f38051-6014-40d1-abe9-dd3e783beb8f	String	jsonType.label
f4c8caf4-5f69-415e-97cc-ad12dfa57539	true	userinfo.token.claim
f4c8caf4-5f69-415e-97cc-ad12dfa57539	website	user.attribute
f4c8caf4-5f69-415e-97cc-ad12dfa57539	true	id.token.claim
f4c8caf4-5f69-415e-97cc-ad12dfa57539	true	access.token.claim
f4c8caf4-5f69-415e-97cc-ad12dfa57539	website	claim.name
f4c8caf4-5f69-415e-97cc-ad12dfa57539	String	jsonType.label
3ee127e0-eb8c-435c-a444-d498495be4c1	true	userinfo.token.claim
3ee127e0-eb8c-435c-a444-d498495be4c1	gender	user.attribute
3ee127e0-eb8c-435c-a444-d498495be4c1	true	id.token.claim
3ee127e0-eb8c-435c-a444-d498495be4c1	true	access.token.claim
3ee127e0-eb8c-435c-a444-d498495be4c1	gender	claim.name
3ee127e0-eb8c-435c-a444-d498495be4c1	String	jsonType.label
7a668605-0f16-4d7f-9797-4ddb6bdec3b4	true	userinfo.token.claim
7a668605-0f16-4d7f-9797-4ddb6bdec3b4	birthdate	user.attribute
7a668605-0f16-4d7f-9797-4ddb6bdec3b4	true	id.token.claim
7a668605-0f16-4d7f-9797-4ddb6bdec3b4	true	access.token.claim
7a668605-0f16-4d7f-9797-4ddb6bdec3b4	birthdate	claim.name
7a668605-0f16-4d7f-9797-4ddb6bdec3b4	String	jsonType.label
b9858f90-a224-49bc-9f08-ffdfb1a9d9e5	true	userinfo.token.claim
b9858f90-a224-49bc-9f08-ffdfb1a9d9e5	zoneinfo	user.attribute
b9858f90-a224-49bc-9f08-ffdfb1a9d9e5	true	id.token.claim
b9858f90-a224-49bc-9f08-ffdfb1a9d9e5	true	access.token.claim
b9858f90-a224-49bc-9f08-ffdfb1a9d9e5	zoneinfo	claim.name
b9858f90-a224-49bc-9f08-ffdfb1a9d9e5	String	jsonType.label
9275441a-d578-4067-b592-2540ddb8cf1e	true	userinfo.token.claim
9275441a-d578-4067-b592-2540ddb8cf1e	locale	user.attribute
9275441a-d578-4067-b592-2540ddb8cf1e	true	id.token.claim
9275441a-d578-4067-b592-2540ddb8cf1e	true	access.token.claim
9275441a-d578-4067-b592-2540ddb8cf1e	locale	claim.name
9275441a-d578-4067-b592-2540ddb8cf1e	String	jsonType.label
b1441678-65f6-4818-818d-6350dcc0443a	true	userinfo.token.claim
b1441678-65f6-4818-818d-6350dcc0443a	updatedAt	user.attribute
b1441678-65f6-4818-818d-6350dcc0443a	true	id.token.claim
b1441678-65f6-4818-818d-6350dcc0443a	true	access.token.claim
b1441678-65f6-4818-818d-6350dcc0443a	updated_at	claim.name
b1441678-65f6-4818-818d-6350dcc0443a	String	jsonType.label
7f5d11d3-fb26-4e90-960b-1b7d217ab518	true	userinfo.token.claim
7f5d11d3-fb26-4e90-960b-1b7d217ab518	email	user.attribute
7f5d11d3-fb26-4e90-960b-1b7d217ab518	true	id.token.claim
7f5d11d3-fb26-4e90-960b-1b7d217ab518	true	access.token.claim
7f5d11d3-fb26-4e90-960b-1b7d217ab518	email	claim.name
7f5d11d3-fb26-4e90-960b-1b7d217ab518	String	jsonType.label
3ebe941b-acd1-4842-b1d6-0a0e304abd3b	true	userinfo.token.claim
3ebe941b-acd1-4842-b1d6-0a0e304abd3b	emailVerified	user.attribute
3ebe941b-acd1-4842-b1d6-0a0e304abd3b	true	id.token.claim
3ebe941b-acd1-4842-b1d6-0a0e304abd3b	true	access.token.claim
3ebe941b-acd1-4842-b1d6-0a0e304abd3b	email_verified	claim.name
3ebe941b-acd1-4842-b1d6-0a0e304abd3b	boolean	jsonType.label
813f2cc6-5b83-4034-89b6-bde9b428af4e	formatted	user.attribute.formatted
813f2cc6-5b83-4034-89b6-bde9b428af4e	country	user.attribute.country
813f2cc6-5b83-4034-89b6-bde9b428af4e	postal_code	user.attribute.postal_code
813f2cc6-5b83-4034-89b6-bde9b428af4e	true	userinfo.token.claim
813f2cc6-5b83-4034-89b6-bde9b428af4e	street	user.attribute.street
813f2cc6-5b83-4034-89b6-bde9b428af4e	true	id.token.claim
813f2cc6-5b83-4034-89b6-bde9b428af4e	region	user.attribute.region
813f2cc6-5b83-4034-89b6-bde9b428af4e	true	access.token.claim
813f2cc6-5b83-4034-89b6-bde9b428af4e	locality	user.attribute.locality
ced6bbdc-db8d-4056-8477-f335e9855bb6	true	userinfo.token.claim
ced6bbdc-db8d-4056-8477-f335e9855bb6	phoneNumber	user.attribute
ced6bbdc-db8d-4056-8477-f335e9855bb6	true	id.token.claim
ced6bbdc-db8d-4056-8477-f335e9855bb6	true	access.token.claim
ced6bbdc-db8d-4056-8477-f335e9855bb6	phone_number	claim.name
ced6bbdc-db8d-4056-8477-f335e9855bb6	String	jsonType.label
e9cb1358-7bbf-4a11-86c3-1b6c34b25d51	true	userinfo.token.claim
e9cb1358-7bbf-4a11-86c3-1b6c34b25d51	phoneNumberVerified	user.attribute
e9cb1358-7bbf-4a11-86c3-1b6c34b25d51	true	id.token.claim
e9cb1358-7bbf-4a11-86c3-1b6c34b25d51	true	access.token.claim
e9cb1358-7bbf-4a11-86c3-1b6c34b25d51	phone_number_verified	claim.name
e9cb1358-7bbf-4a11-86c3-1b6c34b25d51	boolean	jsonType.label
48fcd98c-0119-4c0e-85da-1f54d8012ca6	true	multivalued
48fcd98c-0119-4c0e-85da-1f54d8012ca6	foo	user.attribute
48fcd98c-0119-4c0e-85da-1f54d8012ca6	true	access.token.claim
48fcd98c-0119-4c0e-85da-1f54d8012ca6	realm_access.roles	claim.name
48fcd98c-0119-4c0e-85da-1f54d8012ca6	String	jsonType.label
081bad96-61c7-4121-8c2a-1919a3f1303e	true	multivalued
081bad96-61c7-4121-8c2a-1919a3f1303e	foo	user.attribute
081bad96-61c7-4121-8c2a-1919a3f1303e	true	access.token.claim
081bad96-61c7-4121-8c2a-1919a3f1303e	resource_access.${client_id}.roles	claim.name
081bad96-61c7-4121-8c2a-1919a3f1303e	String	jsonType.label
5188fab5-9c7d-4be8-a937-23155687ba73	true	userinfo.token.claim
5188fab5-9c7d-4be8-a937-23155687ba73	username	user.attribute
5188fab5-9c7d-4be8-a937-23155687ba73	true	id.token.claim
5188fab5-9c7d-4be8-a937-23155687ba73	true	access.token.claim
5188fab5-9c7d-4be8-a937-23155687ba73	upn	claim.name
5188fab5-9c7d-4be8-a937-23155687ba73	String	jsonType.label
f99a6828-bfa1-4d1d-a8e0-03e2be4099b4	true	multivalued
f99a6828-bfa1-4d1d-a8e0-03e2be4099b4	foo	user.attribute
f99a6828-bfa1-4d1d-a8e0-03e2be4099b4	true	id.token.claim
f99a6828-bfa1-4d1d-a8e0-03e2be4099b4	true	access.token.claim
f99a6828-bfa1-4d1d-a8e0-03e2be4099b4	groups	claim.name
f99a6828-bfa1-4d1d-a8e0-03e2be4099b4	String	jsonType.label
c30fed80-0f86-4861-929c-c4fd278448e9	true	userinfo.token.claim
c30fed80-0f86-4861-929c-c4fd278448e9	locale	user.attribute
c30fed80-0f86-4861-929c-c4fd278448e9	true	id.token.claim
c30fed80-0f86-4861-929c-c4fd278448e9	true	access.token.claim
c30fed80-0f86-4861-929c-c4fd278448e9	locale	claim.name
c30fed80-0f86-4861-929c-c4fd278448e9	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
master	60	300	60	\N	\N	\N	t	f	0	theme_dkf	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	d0e6053f-c37b-4aed-ac33-d2b4d96709ab	1800	t	hu	f	f	f	f	0	1	30	6	HmacSHA1	totp	4e8a0590-6aad-4477-9a0a-96aea4dad26a	a861d625-6b3c-44bd-b56b-effc98f526ad	fd73f947-a8aa-421e-82f3-3800e6c94b45	da0dc6b9-80fa-4fb4-8aa8-a4e10128b113	f6bf4820-ee31-470b-8a79-c405e5f0cbe8	2592000	f	900	t	f	12ba5142-fa8f-4411-8414-98b1b53cfbaf	0	f	0	0	e2d30c5e-4b35-4e6a-afa5-6dc5dd2555b6
Store Test Realm	60	300	300	\N	\N	\N	t	f	0	theme_dkf	Store Test Realm	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	9803fcc7-ac4d-496c-b7d2-b9c0d2beaaa2	1800	t	hu	f	f	f	f	0	1	30	6	HmacSHA1	totp	f4accfe6-a96c-4d8c-a4b4-888ec087eec5	52ad4e88-7c84-4ba5-8d6a-2adc5d610fac	180081f1-14b1-4a8c-988c-da581beaa76d	f9e90fea-910c-4472-9c2f-fba5d7694794	116dbcc7-8ab8-4c11-8e09-44cde9ce99d9	2592000	f	900	t	f	babe75aa-d43a-4b22-8568-71adad7ba74d	0	f	0	0	9c290eec-94eb-4a28-9922-4e2b5bea821f
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
oauth2DeviceCodeLifespan	Store Test Realm	600
oauth2DevicePollingInterval	Store Test Realm	5
oauth2DeviceCodeLifespan	master	600
oauth2DevicePollingInterval	master	600
clientSessionIdleTimeout	master	0
clientSessionMaxLifespan	master	0
clientOfflineSessionIdleTimeout	master	0
clientOfflineSessionMaxLifespan	master	0
cibaBackchannelTokenDeliveryMode	master	poll
cibaExpiresIn	master	120
cibaInterval	master	5
cibaAuthRequestedUserHint	master	login_hint
parRequestUriLifespan	master	60
displayName	master	Keycloak
displayNameHtml	master	<div class="kc-logo-text"><span>Keycloak</span></div>
bruteForceProtected	master	false
permanentLockout	master	false
maxFailureWaitSeconds	master	900
minimumQuickLoginWaitSeconds	master	60
waitIncrementSeconds	master	60
quickLoginCheckMilliSeconds	master	1000
maxDeltaTimeSeconds	master	43200
failureFactor	master	30
actionTokenGeneratedByAdminLifespan	master	43200
actionTokenGeneratedByUserLifespan	master	300
defaultSignatureAlgorithm	master	RS256
offlineSessionMaxLifespanEnabled	master	false
offlineSessionMaxLifespan	master	5184000
webAuthnPolicyRpEntityName	master	keycloak
webAuthnPolicySignatureAlgorithms	master	ES256
webAuthnPolicyRpId	master	
webAuthnPolicyAttestationConveyancePreference	master	not specified
webAuthnPolicyAuthenticatorAttachment	master	not specified
webAuthnPolicyRequireResidentKey	master	not specified
webAuthnPolicyUserVerificationRequirement	master	not specified
webAuthnPolicyCreateTimeout	master	0
webAuthnPolicyAvoidSameAuthenticatorRegister	master	false
webAuthnPolicyRpEntityNamePasswordless	master	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	master	ES256
webAuthnPolicyRpIdPasswordless	master	
webAuthnPolicyAttestationConveyancePreferencePasswordless	master	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	master	not specified
webAuthnPolicyRequireResidentKeyPasswordless	master	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	master	not specified
webAuthnPolicyCreateTimeoutPasswordless	master	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	master	false
client-policies.profiles	master	{"profiles":[]}
client-policies.policies	master	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	master	
_browser_header.xContentTypeOptions	master	nosniff
_browser_header.xRobotsTag	master	none
_browser_header.xFrameOptions	master	SAMEORIGIN
_browser_header.contentSecurityPolicy	master	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	master	1; mode=block
_browser_header.strictTransportSecurity	master	max-age=31536000; includeSubDomains
cibaBackchannelTokenDeliveryMode	Store Test Realm	poll
cibaExpiresIn	Store Test Realm	120
cibaInterval	Store Test Realm	5
cibaAuthRequestedUserHint	Store Test Realm	login_hint
parRequestUriLifespan	Store Test Realm	60
clientSessionIdleTimeout	Store Test Realm	0
clientSessionMaxLifespan	Store Test Realm	0
clientOfflineSessionIdleTimeout	Store Test Realm	0
clientOfflineSessionMaxLifespan	Store Test Realm	0
bruteForceProtected	Store Test Realm	false
permanentLockout	Store Test Realm	false
maxFailureWaitSeconds	Store Test Realm	900
minimumQuickLoginWaitSeconds	Store Test Realm	60
waitIncrementSeconds	Store Test Realm	60
quickLoginCheckMilliSeconds	Store Test Realm	1000
maxDeltaTimeSeconds	Store Test Realm	43200
failureFactor	Store Test Realm	30
actionTokenGeneratedByAdminLifespan	Store Test Realm	43200
actionTokenGeneratedByUserLifespan	Store Test Realm	300
defaultSignatureAlgorithm	Store Test Realm	RS256
offlineSessionMaxLifespanEnabled	Store Test Realm	false
offlineSessionMaxLifespan	Store Test Realm	5184000
webAuthnPolicyRpEntityName	Store Test Realm	keycloak
webAuthnPolicySignatureAlgorithms	Store Test Realm	ES256
webAuthnPolicyRpId	Store Test Realm	
webAuthnPolicyAttestationConveyancePreference	Store Test Realm	not specified
webAuthnPolicyAuthenticatorAttachment	Store Test Realm	not specified
webAuthnPolicyRequireResidentKey	Store Test Realm	not specified
webAuthnPolicyUserVerificationRequirement	Store Test Realm	not specified
webAuthnPolicyCreateTimeout	Store Test Realm	0
webAuthnPolicyAvoidSameAuthenticatorRegister	Store Test Realm	false
webAuthnPolicyRpEntityNamePasswordless	Store Test Realm	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	Store Test Realm	ES256
webAuthnPolicyRpIdPasswordless	Store Test Realm	
webAuthnPolicyAttestationConveyancePreferencePasswordless	Store Test Realm	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	Store Test Realm	not specified
webAuthnPolicyRequireResidentKeyPasswordless	Store Test Realm	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	Store Test Realm	not specified
webAuthnPolicyCreateTimeoutPasswordless	Store Test Realm	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	Store Test Realm	false
client-policies.profiles	Store Test Realm	{"profiles":[]}
client-policies.policies	Store Test Realm	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	Store Test Realm	
_browser_header.xContentTypeOptions	Store Test Realm	nosniff
_browser_header.xRobotsTag	Store Test Realm	none
_browser_header.xFrameOptions	Store Test Realm	SAMEORIGIN
_browser_header.contentSecurityPolicy	Store Test Realm	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	Store Test Realm	1; mode=block
_browser_header.strictTransportSecurity	Store Test Realm	max-age=31536000; includeSubDomains
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
master	jboss-logging
Store Test Realm	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	master
password	password	t	t	Store Test Realm
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
master	hu
Store Test Realm	hu
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
3db5e1fc-aaa8-4c2f-871d-20397d651a3d	/realms/master/account/*
213f234c-fd1d-40ed-b307-f005c99e02b9	/realms/master/account/*
5e41cd16-605e-4533-884e-f8f2a4964c50	/admin/master/console/*
d3e7d453-fb9a-4858-8eb4-497eb0fc5db5	/realms/Store Test Realm/account/*
78ab8f12-3588-4892-83f3-f243576852c2	/realms/Store Test Realm/account/*
2931ab87-d448-4787-86d5-9e3ec3a2deaf	/admin/Store Test Realm/console/*
5fab1a22-e6b6-4de7-a907-b12a3a35e691	http://localhost:4200/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
f2026a25-a7b2-4abc-bf01-e754a44101f9	VERIFY_EMAIL	Verify Email	master	t	f	VERIFY_EMAIL	50
938109c3-feb7-46ac-840d-054bbd14a336	UPDATE_PROFILE	Update Profile	master	t	f	UPDATE_PROFILE	40
5b11260d-87fc-486f-8cda-054b15928f45	CONFIGURE_TOTP	Configure OTP	master	t	f	CONFIGURE_TOTP	10
fae67625-a93c-4283-bd66-e174db4165a3	UPDATE_PASSWORD	Update Password	master	t	f	UPDATE_PASSWORD	30
6dd25d9b-508d-4edc-acb1-db7952df4a8f	terms_and_conditions	Terms and Conditions	master	f	f	terms_and_conditions	20
cab256de-8ba1-416e-9a49-5588617b0810	update_user_locale	Update User Locale	master	t	f	update_user_locale	1000
27b69561-9a76-4292-ae7a-c35142ebeae9	delete_account	Delete Account	master	f	f	delete_account	60
bcdcdf68-57e9-43f8-8f02-a7048ab4e0ae	VERIFY_EMAIL	Verify Email	Store Test Realm	t	f	VERIFY_EMAIL	50
135e222e-1d5f-4de0-a2ac-a57c6d50427c	UPDATE_PROFILE	Update Profile	Store Test Realm	t	f	UPDATE_PROFILE	40
a9cbfa66-5af8-4d83-9831-44a8e0d1f7cb	CONFIGURE_TOTP	Configure OTP	Store Test Realm	t	f	CONFIGURE_TOTP	10
2551c89e-a7b5-4b9b-a32b-d77320998ebc	UPDATE_PASSWORD	Update Password	Store Test Realm	t	f	UPDATE_PASSWORD	30
a0deef11-76ca-437f-b0a3-e8cc05977777	terms_and_conditions	Terms and Conditions	Store Test Realm	f	f	terms_and_conditions	20
ebfcd7dd-be89-4aa5-9967-d7e250092856	update_user_locale	Update User Locale	Store Test Realm	t	f	update_user_locale	1000
b4740a27-0a3e-4739-82e9-6d4c98a0389a	delete_account	Delete Account	Store Test Realm	f	f	delete_account	60
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
213f234c-fd1d-40ed-b307-f005c99e02b9	1d2c7675-4774-4b45-8287-3f632edc8297
78ab8f12-3588-4892-83f3-f243576852c2	4c4ea5a1-3ca0-4b12-977f-3214110c6be4
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
a9c36523-f626-457a-836a-7cd7a4c0dc11	\N	f81ee03e-ac79-44bb-be74-99b3c46d8318	f	t	\N	\N	\N	master	user	1638268525959	\N	0
0ac4d063-9901-42b6-bca9-53bdf42139fa	\N	ec3f6899-ef8a-42a3-854e-2ad92a6ef62a	f	t	\N	\N	\N	Store Test Realm	user2	1638476553546	\N	0
566d2571-84cd-4e25-a7d1-37b69e21b8ed	\N	86816977-d858-4e5b-981e-b35ffc57128a	f	t	\N	\N	\N	Store Test Realm	user3	1638476576213	\N	0
e0af645c-63cc-4f1d-b088-8de3d3c3623b	user1@test.com	user1@test.com	f	t	\N	First	User	Store Test Realm	user1	1638476487021	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
0ac4d063-9901-42b6-bca9-53bdf42139fa	UPDATE_PASSWORD
566d2571-84cd-4e25-a7d1-37b69e21b8ed	UPDATE_PASSWORD
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
e2d30c5e-4b35-4e6a-afa5-6dc5dd2555b6	a9c36523-f626-457a-836a-7cd7a4c0dc11
5668cff8-1e06-4063-8e7d-e2e10dced450	a9c36523-f626-457a-836a-7cd7a4c0dc11
9c290eec-94eb-4a28-9922-4e2b5bea821f	e0af645c-63cc-4f1d-b088-8de3d3c3623b
a0de75ff-15d9-487b-8f19-bed0bc2a4995	e0af645c-63cc-4f1d-b088-8de3d3c3623b
9c290eec-94eb-4a28-9922-4e2b5bea821f	0ac4d063-9901-42b6-bca9-53bdf42139fa
7389224e-3b56-41f2-bc8f-3c77fd7b15e2	0ac4d063-9901-42b6-bca9-53bdf42139fa
9c290eec-94eb-4a28-9922-4e2b5bea821f	566d2571-84cd-4e25-a7d1-37b69e21b8ed
7389224e-3b56-41f2-bc8f-3c77fd7b15e2	566d2571-84cd-4e25-a7d1-37b69e21b8ed
a0de75ff-15d9-487b-8f19-bed0bc2a4995	566d2571-84cd-4e25-a7d1-37b69e21b8ed
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
5e41cd16-605e-4533-884e-f8f2a4964c50	+
2931ab87-d448-4787-86d5-9e3ec3a2deaf	+
5fab1a22-e6b6-4de7-a907-b12a3a35e691	+
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: bn_keycloak
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO bn_keycloak;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

