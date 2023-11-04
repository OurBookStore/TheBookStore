--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-2.pgdg120+1)
-- Dumped by pg_dump version 15.3

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

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.admin_event_entity OWNER TO admin;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.associated_policy (
                                          policy_id character varying(36) NOT NULL,
                                          associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO admin;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.authentication_execution OWNER TO admin;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.authentication_flow OWNER TO admin;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.authenticator_config (
                                             id character varying(36) NOT NULL,
                                             alias character varying(255),
                                             realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO admin;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.authenticator_config_entry (
                                                   authenticator_id character varying(36) NOT NULL,
                                                   value text,
                                                   name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO admin;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.broker_link OWNER TO admin;

--
-- Name: client; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.client OWNER TO admin;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_attributes (
                                          client_id character varying(36) NOT NULL,
                                          name character varying(255) NOT NULL,
                                          value text
);


ALTER TABLE public.client_attributes OWNER TO admin;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_auth_flow_bindings (
                                                  client_id character varying(36) NOT NULL,
                                                  flow_id character varying(36),
                                                  binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO admin;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_initial_access (
                                              id character varying(36) NOT NULL,
                                              realm_id character varying(36) NOT NULL,
                                              "timestamp" integer,
                                              expiration integer,
                                              count integer,
                                              remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO admin;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_node_registrations (
                                                  client_id character varying(36) NOT NULL,
                                                  value integer,
                                                  name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO admin;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_scope (
                                     id character varying(36) NOT NULL,
                                     name character varying(255),
                                     realm_id character varying(36),
                                     description character varying(255),
                                     protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO admin;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_scope_attributes (
                                                scope_id character varying(36) NOT NULL,
                                                value character varying(2048),
                                                name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO admin;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_scope_client (
                                            client_id character varying(255) NOT NULL,
                                            scope_id character varying(255) NOT NULL,
                                            default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO admin;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_scope_role_mapping (
                                                  scope_id character varying(36) NOT NULL,
                                                  role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO admin;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.client_session OWNER TO admin;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_session_auth_status (
                                                   authenticator character varying(36) NOT NULL,
                                                   status integer,
                                                   client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO admin;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_session_note (
                                            name character varying(255) NOT NULL,
                                            value character varying(255),
                                            client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO admin;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_session_prot_mapper (
                                                   protocol_mapper_id character varying(36) NOT NULL,
                                                   client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO admin;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_session_role (
                                            role_id character varying(255) NOT NULL,
                                            client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO admin;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_user_session_note (
                                                 name character varying(255) NOT NULL,
                                                 value character varying(2048),
                                                 client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO admin;

--
-- Name: component; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.component OWNER TO admin;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.component_config (
                                         id character varying(36) NOT NULL,
                                         component_id character varying(36) NOT NULL,
                                         name character varying(255) NOT NULL,
                                         value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO admin;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.composite_role (
                                       composite character varying(36) NOT NULL,
                                       child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO admin;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.credential OWNER TO admin;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.databasechangelog OWNER TO admin;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.databasechangeloglock (
                                              id integer NOT NULL,
                                              locked boolean NOT NULL,
                                              lockgranted timestamp without time zone,
                                              lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO admin;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.default_client_scope (
                                             realm_id character varying(36) NOT NULL,
                                             scope_id character varying(36) NOT NULL,
                                             default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO admin;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.event_entity OWNER TO admin;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_attribute (
                                           id character varying(36) NOT NULL,
                                           name character varying(255) NOT NULL,
                                           user_id character varying(255) NOT NULL,
                                           realm_id character varying(36) NOT NULL,
                                           storage_provider_id character varying(36),
                                           value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO admin;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.fed_user_consent OWNER TO admin;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_consent_cl_scope (
                                                  user_consent_id character varying(36) NOT NULL,
                                                  scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO admin;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.fed_user_credential OWNER TO admin;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_group_membership (
                                                  group_id character varying(36) NOT NULL,
                                                  user_id character varying(255) NOT NULL,
                                                  realm_id character varying(36) NOT NULL,
                                                  storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO admin;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_required_action (
                                                 required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
                                                 user_id character varying(255) NOT NULL,
                                                 realm_id character varying(36) NOT NULL,
                                                 storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO admin;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_role_mapping (
                                              role_id character varying(36) NOT NULL,
                                              user_id character varying(255) NOT NULL,
                                              realm_id character varying(36) NOT NULL,
                                              storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO admin;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.federated_identity (
                                           identity_provider character varying(255) NOT NULL,
                                           realm_id character varying(36),
                                           federated_user_id character varying(255),
                                           federated_username character varying(255),
                                           token text,
                                           user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO admin;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.federated_user (
                                       id character varying(255) NOT NULL,
                                       storage_provider_id character varying(255),
                                       realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO admin;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.group_attribute (
                                        id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
                                        name character varying(255) NOT NULL,
                                        value character varying(255),
                                        group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO admin;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.group_role_mapping (
                                           role_id character varying(36) NOT NULL,
                                           group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO admin;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.identity_provider OWNER TO admin;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.identity_provider_config (
                                                 identity_provider_id character varying(36) NOT NULL,
                                                 value text,
                                                 name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO admin;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.identity_provider_mapper (
                                                 id character varying(36) NOT NULL,
                                                 name character varying(255) NOT NULL,
                                                 idp_alias character varying(255) NOT NULL,
                                                 idp_mapper_name character varying(255) NOT NULL,
                                                 realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO admin;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.idp_mapper_config (
                                          idp_mapper_id character varying(36) NOT NULL,
                                          value text,
                                          name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO admin;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.keycloak_group (
                                       id character varying(36) NOT NULL,
                                       name character varying(255),
                                       parent_group character varying(36) NOT NULL,
                                       realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO admin;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.keycloak_role OWNER TO admin;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.migration_model (
                                        id character varying(36) NOT NULL,
                                        version character varying(36),
                                        update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO admin;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.offline_client_session OWNER TO admin;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.offline_user_session OWNER TO admin;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.policy_config (
                                      policy_id character varying(36) NOT NULL,
                                      name character varying(255) NOT NULL,
                                      value text
);


ALTER TABLE public.policy_config OWNER TO admin;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.protocol_mapper (
                                        id character varying(36) NOT NULL,
                                        name character varying(255) NOT NULL,
                                        protocol character varying(255) NOT NULL,
                                        protocol_mapper_name character varying(255) NOT NULL,
                                        client_id character varying(36),
                                        client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO admin;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.protocol_mapper_config (
                                               protocol_mapper_id character varying(36) NOT NULL,
                                               value text,
                                               name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO admin;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.realm OWNER TO admin;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_attribute (
                                        name character varying(255) NOT NULL,
                                        realm_id character varying(36) NOT NULL,
                                        value text
);


ALTER TABLE public.realm_attribute OWNER TO admin;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_default_groups (
                                             realm_id character varying(36) NOT NULL,
                                             group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO admin;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_enabled_event_types (
                                                  realm_id character varying(36) NOT NULL,
                                                  value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO admin;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_events_listeners (
                                               realm_id character varying(36) NOT NULL,
                                               value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO admin;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_localizations (
                                            realm_id character varying(255) NOT NULL,
                                            locale character varying(255) NOT NULL,
                                            texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO admin;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_required_credential (
                                                  type character varying(255) NOT NULL,
                                                  form_label character varying(255),
                                                  input boolean DEFAULT false NOT NULL,
                                                  secret boolean DEFAULT false NOT NULL,
                                                  realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO admin;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_smtp_config (
                                          realm_id character varying(36) NOT NULL,
                                          value character varying(255),
                                          name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO admin;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_supported_locales (
                                                realm_id character varying(36) NOT NULL,
                                                value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO admin;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.redirect_uris (
                                      client_id character varying(36) NOT NULL,
                                      value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO admin;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.required_action_config (
                                               required_action_id character varying(36) NOT NULL,
                                               value text,
                                               name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO admin;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.required_action_provider OWNER TO admin;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_attribute (
                                           id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
                                           name character varying(255) NOT NULL,
                                           value character varying(255),
                                           resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO admin;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_policy (
                                        resource_id character varying(36) NOT NULL,
                                        policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO admin;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_scope (
                                       resource_id character varying(36) NOT NULL,
                                       scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO admin;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server (
                                        id character varying(36) NOT NULL,
                                        allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
                                        policy_enforce_mode smallint NOT NULL,
                                        decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO admin;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.resource_server_perm_ticket OWNER TO admin;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server_policy (
                                               id character varying(36) NOT NULL,
                                               name character varying(255) NOT NULL,
                                               description character varying(255),
                                               type character varying(255) NOT NULL,
                                               decision_strategy smallint,
                                               logic smallint,
                                               resource_server_id character varying(36) NOT NULL,
                                               owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO admin;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.resource_server_resource OWNER TO admin;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server_scope (
                                              id character varying(36) NOT NULL,
                                              name character varying(255) NOT NULL,
                                              icon_uri character varying(255),
                                              resource_server_id character varying(36) NOT NULL,
                                              display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO admin;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_uris (
                                      resource_id character varying(36) NOT NULL,
                                      value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO admin;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.role_attribute (
                                       id character varying(36) NOT NULL,
                                       role_id character varying(36) NOT NULL,
                                       name character varying(255) NOT NULL,
                                       value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO admin;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.scope_mapping (
                                      client_id character varying(36) NOT NULL,
                                      role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO admin;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.scope_policy (
                                     scope_id character varying(36) NOT NULL,
                                     policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO admin;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_attribute (
                                       name character varying(255) NOT NULL,
                                       value character varying(255),
                                       user_id character varying(36) NOT NULL,
                                       id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO admin;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.user_consent OWNER TO admin;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_consent_client_scope (
                                                  user_consent_id character varying(36) NOT NULL,
                                                  scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO admin;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.user_entity OWNER TO admin;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_federation_config (
                                               user_federation_provider_id character varying(36) NOT NULL,
                                               value character varying(255),
                                               name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO admin;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_federation_mapper (
                                               id character varying(36) NOT NULL,
                                               name character varying(255) NOT NULL,
                                               federation_provider_id character varying(36) NOT NULL,
                                               federation_mapper_type character varying(255) NOT NULL,
                                               realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO admin;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_federation_mapper_config (
                                                      user_federation_mapper_id character varying(36) NOT NULL,
                                                      value character varying(255),
                                                      name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO admin;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.user_federation_provider OWNER TO admin;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_group_membership (
                                              group_id character varying(36) NOT NULL,
                                              user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO admin;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_required_action (
                                             user_id character varying(36) NOT NULL,
                                             required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO admin;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_role_mapping (
                                          role_id character varying(255) NOT NULL,
                                          user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO admin;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.user_session OWNER TO admin;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_session_note (
                                          user_session character varying(36) NOT NULL,
                                          name character varying(255) NOT NULL,
                                          value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO admin;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.username_login_failure (
                                               realm_id character varying(36) NOT NULL,
                                               username character varying(255) NOT NULL,
                                               failed_login_not_before integer,
                                               last_failure bigint,
                                               last_ip_failure character varying(255),
                                               num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO admin;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.web_origins (
                                    client_id character varying(36) NOT NULL,
                                    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO admin;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.authentication_execution VALUES ('76c1750b-a285-4c44-942b-1ca12e05baf2', NULL, 'auth-cookie', '4f89db84-b6ab-4c26-9379-2721c83ea282', '5ad2f65b-7df3-4ea3-8275-c632e42c8c9b', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5ac18659-5a04-405a-9587-75357a9eadb5', NULL, 'auth-spnego', '4f89db84-b6ab-4c26-9379-2721c83ea282', '5ad2f65b-7df3-4ea3-8275-c632e42c8c9b', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('72eea282-03a8-4981-9ec3-004767504565', NULL, 'identity-provider-redirector', '4f89db84-b6ab-4c26-9379-2721c83ea282', '5ad2f65b-7df3-4ea3-8275-c632e42c8c9b', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('805c7162-a734-4bf3-9756-0f0b459ae7f7', NULL, NULL, '4f89db84-b6ab-4c26-9379-2721c83ea282', '5ad2f65b-7df3-4ea3-8275-c632e42c8c9b', 2, 30, true, '3f844c20-b1fc-4907-9dab-6fb5c549ac1c', NULL);
INSERT INTO public.authentication_execution VALUES ('12930834-335c-431d-9723-45937364ede0', NULL, 'auth-username-password-form', '4f89db84-b6ab-4c26-9379-2721c83ea282', '3f844c20-b1fc-4907-9dab-6fb5c549ac1c', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e8b82487-3523-4395-a72d-6395d37eb0d8', NULL, NULL, '4f89db84-b6ab-4c26-9379-2721c83ea282', '3f844c20-b1fc-4907-9dab-6fb5c549ac1c', 1, 20, true, '8383cdeb-aee8-445b-8980-f8ef0aacab52', NULL);
INSERT INTO public.authentication_execution VALUES ('45049bfc-ab7e-4a8a-a1cc-662408d76f66', NULL, 'conditional-user-configured', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8383cdeb-aee8-445b-8980-f8ef0aacab52', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('555fe50b-76b2-469a-a6c7-6efc9bf9fba2', NULL, 'auth-otp-form', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8383cdeb-aee8-445b-8980-f8ef0aacab52', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d4ff57be-4bd0-492e-91cf-25aa99b63113', NULL, 'direct-grant-validate-username', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'bc15276d-2c0c-4fac-b15c-5eceea6c3e0a', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ecd20978-5c04-4a90-bb21-e242f36c2b7e', NULL, 'direct-grant-validate-password', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'bc15276d-2c0c-4fac-b15c-5eceea6c3e0a', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b9dfae39-92cc-4369-bf8a-839afa463444', NULL, NULL, '4f89db84-b6ab-4c26-9379-2721c83ea282', 'bc15276d-2c0c-4fac-b15c-5eceea6c3e0a', 1, 30, true, '465c1043-5a11-4a42-a2d2-82cfb97b54e4', NULL);
INSERT INTO public.authentication_execution VALUES ('f7c2e787-7666-4430-ac91-7cd02edc8d57', NULL, 'conditional-user-configured', '4f89db84-b6ab-4c26-9379-2721c83ea282', '465c1043-5a11-4a42-a2d2-82cfb97b54e4', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c2a1f48c-490c-4666-afe3-8fc5bba2e598', NULL, 'direct-grant-validate-otp', '4f89db84-b6ab-4c26-9379-2721c83ea282', '465c1043-5a11-4a42-a2d2-82cfb97b54e4', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('24d35871-1fcf-492c-bd5b-6c671ba14d18', NULL, 'registration-page-form', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'ec76bc03-5b39-4a28-b244-95fdc4f753e1', 0, 10, true, '47500e64-1106-4cac-964b-7b5d1bd58d5f', NULL);
INSERT INTO public.authentication_execution VALUES ('7b1f13ab-9780-4359-87b6-29fb61bfa3ee', NULL, 'registration-user-creation', '4f89db84-b6ab-4c26-9379-2721c83ea282', '47500e64-1106-4cac-964b-7b5d1bd58d5f', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('44da83fc-bddd-4524-bd47-ec8491048fab', NULL, 'registration-profile-action', '4f89db84-b6ab-4c26-9379-2721c83ea282', '47500e64-1106-4cac-964b-7b5d1bd58d5f', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('dc157b73-f8b2-4dfb-ac5b-f50b618da469', NULL, 'registration-password-action', '4f89db84-b6ab-4c26-9379-2721c83ea282', '47500e64-1106-4cac-964b-7b5d1bd58d5f', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('80048c07-bc90-4b93-8aa5-845c684d98ad', NULL, 'registration-recaptcha-action', '4f89db84-b6ab-4c26-9379-2721c83ea282', '47500e64-1106-4cac-964b-7b5d1bd58d5f', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f4562afd-62cb-4ece-94e5-3af40c32fb1e', NULL, 'registration-terms-and-conditions', '4f89db84-b6ab-4c26-9379-2721c83ea282', '47500e64-1106-4cac-964b-7b5d1bd58d5f', 3, 70, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('00e0e26e-1e4d-4304-abf5-1fc400b15f3b', NULL, 'reset-credentials-choose-user', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'fc37e675-cace-4a7c-86a5-f73f97ea55f8', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('9f904dde-0735-46e9-b1e4-445a797722cb', NULL, 'reset-credential-email', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'fc37e675-cace-4a7c-86a5-f73f97ea55f8', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ecf98d48-464b-4718-838f-15bc9e89ffb5', NULL, 'reset-password', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'fc37e675-cace-4a7c-86a5-f73f97ea55f8', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('540b699d-e1b8-4195-9296-da355c28bece', NULL, NULL, '4f89db84-b6ab-4c26-9379-2721c83ea282', 'fc37e675-cace-4a7c-86a5-f73f97ea55f8', 1, 40, true, 'c09c2482-26fa-4e85-86ae-b3cff6773af8', NULL);
INSERT INTO public.authentication_execution VALUES ('cc792644-0128-4175-9e31-550ef1febc02', NULL, 'conditional-user-configured', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'c09c2482-26fa-4e85-86ae-b3cff6773af8', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('0cb2e15d-191d-4f0a-8d74-4fc2a5f55382', NULL, 'reset-otp', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'c09c2482-26fa-4e85-86ae-b3cff6773af8', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a7d3ff99-7e9b-47ef-92b9-47a2af3ae836', NULL, 'client-secret', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'f5ad85e5-09c0-4722-b3b9-f5f405cf04cd', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('0a78fe0b-7eba-4629-95dd-79a5551e50a5', NULL, 'client-jwt', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'f5ad85e5-09c0-4722-b3b9-f5f405cf04cd', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d10be55e-0fb3-478c-93b1-b8f0b30809bf', NULL, 'client-secret-jwt', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'f5ad85e5-09c0-4722-b3b9-f5f405cf04cd', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4032a2e8-0b15-4755-9f19-1629ce58f406', NULL, 'client-x509', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'f5ad85e5-09c0-4722-b3b9-f5f405cf04cd', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('8ea6c871-44b1-43b9-bba7-53516885c94c', NULL, 'idp-review-profile', '4f89db84-b6ab-4c26-9379-2721c83ea282', '5416eef3-8bdc-4d41-9cd7-997097e24875', 0, 10, false, NULL, '13bd9f0a-47db-45c2-ae03-8a2e81392d87');
INSERT INTO public.authentication_execution VALUES ('20bec6de-85fe-4e07-9f0b-1c41b66f29cb', NULL, NULL, '4f89db84-b6ab-4c26-9379-2721c83ea282', '5416eef3-8bdc-4d41-9cd7-997097e24875', 0, 20, true, '38221ea7-4100-4484-b408-ea6fbacf0027', NULL);
INSERT INTO public.authentication_execution VALUES ('a77fcb1a-ad34-4db8-8773-ba22acce33ce', NULL, 'idp-create-user-if-unique', '4f89db84-b6ab-4c26-9379-2721c83ea282', '38221ea7-4100-4484-b408-ea6fbacf0027', 2, 10, false, NULL, '9ece82db-b079-46ac-8ace-6d753248a8dc');
INSERT INTO public.authentication_execution VALUES ('8df5e158-bbbb-4159-aba5-346630266f5b', NULL, NULL, '4f89db84-b6ab-4c26-9379-2721c83ea282', '38221ea7-4100-4484-b408-ea6fbacf0027', 2, 20, true, '03daabd2-d42c-418b-9901-e41732e0bfed', NULL);
INSERT INTO public.authentication_execution VALUES ('825b1721-f99e-41e2-a96a-f64726066750', NULL, 'idp-confirm-link', '4f89db84-b6ab-4c26-9379-2721c83ea282', '03daabd2-d42c-418b-9901-e41732e0bfed', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('610aed81-f08a-4de0-94ce-4fdcd9b720a7', NULL, NULL, '4f89db84-b6ab-4c26-9379-2721c83ea282', '03daabd2-d42c-418b-9901-e41732e0bfed', 0, 20, true, '81b1ee57-42ed-4003-8e7b-a7549357da12', NULL);
INSERT INTO public.authentication_execution VALUES ('459800e7-52c8-4547-9176-f0f9b0edb4c8', NULL, 'idp-email-verification', '4f89db84-b6ab-4c26-9379-2721c83ea282', '81b1ee57-42ed-4003-8e7b-a7549357da12', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('2f683acd-9394-4ace-b5bd-c24e360a282c', NULL, NULL, '4f89db84-b6ab-4c26-9379-2721c83ea282', '81b1ee57-42ed-4003-8e7b-a7549357da12', 2, 20, true, '9c7f4b19-4653-496a-9b51-841fc727f9ab', NULL);
INSERT INTO public.authentication_execution VALUES ('71deb91b-a6bc-4eb7-bf86-5bff86619f18', NULL, 'idp-username-password-form', '4f89db84-b6ab-4c26-9379-2721c83ea282', '9c7f4b19-4653-496a-9b51-841fc727f9ab', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c4f2810e-53ff-40a6-af05-847a95a5dea7', NULL, NULL, '4f89db84-b6ab-4c26-9379-2721c83ea282', '9c7f4b19-4653-496a-9b51-841fc727f9ab', 1, 20, true, '05b988d8-316d-400f-910d-d36d4fc8d475', NULL);
INSERT INTO public.authentication_execution VALUES ('1e3fdfa6-84f5-42ee-af73-24b31a906b57', NULL, 'conditional-user-configured', '4f89db84-b6ab-4c26-9379-2721c83ea282', '05b988d8-316d-400f-910d-d36d4fc8d475', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('55111a3a-5258-4528-84d0-b4f5c3ce297f', NULL, 'auth-otp-form', '4f89db84-b6ab-4c26-9379-2721c83ea282', '05b988d8-316d-400f-910d-d36d4fc8d475', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a2bfaa7e-7a9b-4575-b8f5-9bd5cc855c46', NULL, 'http-basic-authenticator', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'ef33c855-ec86-4ca6-bdcd-2292137029ab', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('be7ac172-0f3c-4f82-a348-75a6aa3bc547', NULL, 'docker-http-basic-authenticator', '4f89db84-b6ab-4c26-9379-2721c83ea282', '70d9b1c5-35e6-42ca-a266-2837be0c900b', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7b35c325-98a8-4e52-a891-0064603286a9', NULL, 'idp-email-verification', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2c212dee-ad76-414c-a0a9-fdfae1dab9e7', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('23d2deb9-0c10-4b4e-94aa-d9f0aa2e5f08', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2c212dee-ad76-414c-a0a9-fdfae1dab9e7', 2, 20, true, '7e683a5b-de1a-4768-a163-457d57458978', NULL);
INSERT INTO public.authentication_execution VALUES ('dc18f1f4-8ac2-4139-ba91-f0811a0fd157', NULL, 'conditional-user-configured', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '1d76af7e-8c7c-46e1-bbc0-3fc0f95ddfda', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('2aa5cc1e-38e8-4dce-9dae-b37d84a2f9f6', NULL, 'auth-otp-form', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '1d76af7e-8c7c-46e1-bbc0-3fc0f95ddfda', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('2f87d1df-1414-4554-8b88-9fc558ba26c0', NULL, 'conditional-user-configured', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '64ef3b81-6e8b-4ad7-a258-29e548388c11', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e7834b14-1df2-46c1-90a7-3ee4c69fc241', NULL, 'direct-grant-validate-otp', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '64ef3b81-6e8b-4ad7-a258-29e548388c11', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('1bbfe18d-f2f1-4613-8808-b9811448a754', NULL, 'conditional-user-configured', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '9d4a44f5-09fc-4a13-8ca5-ca54f4ce38d9', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f19ff8ce-750d-4fc3-a4b1-ec46361026b1', NULL, 'auth-otp-form', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '9d4a44f5-09fc-4a13-8ca5-ca54f4ce38d9', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d34acdaf-7f81-47ef-8ed7-1d172a0477c9', NULL, 'idp-confirm-link', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2457a574-ea6d-4de8-b419-db9876bde108', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e23d511e-872c-4a2f-8203-2d534bdfb7d5', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2457a574-ea6d-4de8-b419-db9876bde108', 0, 20, true, '2c212dee-ad76-414c-a0a9-fdfae1dab9e7', NULL);
INSERT INTO public.authentication_execution VALUES ('758bf246-56c3-4bf2-a760-2ab2390875bc', NULL, 'conditional-user-configured', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '43ccd003-31b8-44da-93f8-6724bcb8b503', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ed218ba3-79f9-4789-a486-588e8336d413', NULL, 'reset-otp', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '43ccd003-31b8-44da-93f8-6724bcb8b503', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c5ebf988-59c6-4058-8e52-1c27ea5540d4', NULL, 'idp-create-user-if-unique', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2cfc1295-cd45-43c7-b8e6-bd14ae5e685e', 2, 10, false, NULL, '9295d203-65a1-4d61-ad4a-081a4dc16aee');
INSERT INTO public.authentication_execution VALUES ('5649626e-bd02-42f8-a431-203d033c9090', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2cfc1295-cd45-43c7-b8e6-bd14ae5e685e', 2, 20, true, '2457a574-ea6d-4de8-b419-db9876bde108', NULL);
INSERT INTO public.authentication_execution VALUES ('7e33cdd7-3309-4860-9ea6-6c768f68cccc', NULL, 'idp-username-password-form', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '7e683a5b-de1a-4768-a163-457d57458978', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('34f60c3b-388c-4323-a817-7b32e793f02e', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '7e683a5b-de1a-4768-a163-457d57458978', 1, 20, true, '9d4a44f5-09fc-4a13-8ca5-ca54f4ce38d9', NULL);
INSERT INTO public.authentication_execution VALUES ('ddbca9e8-d987-41ed-80bf-6ef324276711', NULL, 'auth-cookie', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '520fad15-8981-402d-a4a1-501d74ff1e5d', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e0c18ab6-a4c5-49ad-8559-ba2adcd3185c', NULL, 'auth-spnego', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '520fad15-8981-402d-a4a1-501d74ff1e5d', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('eefc43aa-c889-4f17-b7ab-08f2bfb661a5', NULL, 'identity-provider-redirector', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '520fad15-8981-402d-a4a1-501d74ff1e5d', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('07e08ec3-a20d-4eda-aa1a-8a02375e99bc', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '520fad15-8981-402d-a4a1-501d74ff1e5d', 2, 30, true, '6a6972fe-39d2-46ad-b0c3-675e4c7494f8', NULL);
INSERT INTO public.authentication_execution VALUES ('a9a3c240-1e89-4c82-b8b9-3d95fc45001e', NULL, 'client-secret', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '624a9489-d8ed-4b14-a78f-975f06c16818', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('2e0e99c1-64e6-4c0e-802b-192a38d7af38', NULL, 'client-jwt', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '624a9489-d8ed-4b14-a78f-975f06c16818', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('0abeef0e-e9c8-41b5-bdd1-45417c23fa41', NULL, 'client-secret-jwt', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '624a9489-d8ed-4b14-a78f-975f06c16818', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a5e1d5bd-43db-4c0f-b965-9ba9d7ec6e1e', NULL, 'client-x509', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '624a9489-d8ed-4b14-a78f-975f06c16818', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b8b89667-ab5a-4d91-b7c1-754eae7ff33b', NULL, 'direct-grant-validate-username', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '5f092739-61f4-41c0-bba6-24beb17d3692', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c0eeed48-15bb-46cd-9d72-a650f9c432fe', NULL, 'direct-grant-validate-password', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '5f092739-61f4-41c0-bba6-24beb17d3692', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7e611c17-7b88-49e8-a539-b1b7f329d9af', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '5f092739-61f4-41c0-bba6-24beb17d3692', 1, 30, true, '64ef3b81-6e8b-4ad7-a258-29e548388c11', NULL);
INSERT INTO public.authentication_execution VALUES ('602f2abf-ff1c-44e6-b4c6-e2f96e4aaa04', NULL, 'docker-http-basic-authenticator', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '128ad414-638b-47ef-9596-d9296d7b785d', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5b5ccda6-a487-41ce-8e4b-9dfe2705b6fc', NULL, 'idp-review-profile', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'd31ee24b-2d32-4f28-a496-168400c7c27f', 0, 10, false, NULL, '05f5f1a3-e153-4fc8-af4a-cb39f4a3ffa0');
INSERT INTO public.authentication_execution VALUES ('db8a409f-fc39-492d-a54d-2258b26015ac', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'd31ee24b-2d32-4f28-a496-168400c7c27f', 0, 20, true, '2cfc1295-cd45-43c7-b8e6-bd14ae5e685e', NULL);
INSERT INTO public.authentication_execution VALUES ('45ffedc5-d08a-4577-9902-7bc160271caa', NULL, 'auth-username-password-form', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '6a6972fe-39d2-46ad-b0c3-675e4c7494f8', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ba51babc-c518-42c0-b0b2-7f92b6d42d0f', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '6a6972fe-39d2-46ad-b0c3-675e4c7494f8', 1, 20, true, '1d76af7e-8c7c-46e1-bbc0-3fc0f95ddfda', NULL);
INSERT INTO public.authentication_execution VALUES ('a4953bb9-1e65-47fd-89f8-4d17d33f05f0', NULL, 'registration-page-form', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2702976c-d524-4ac9-aecb-d15bdc2e106c', 0, 10, true, 'e70d46c7-23b9-4274-9211-275c58d18c07', NULL);
INSERT INTO public.authentication_execution VALUES ('ccd32ce6-7115-413c-83be-35fba64ab94d', NULL, 'registration-user-creation', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'e70d46c7-23b9-4274-9211-275c58d18c07', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('1a8c1197-136d-4a6c-82e6-c4e53dc2732c', NULL, 'registration-profile-action', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'e70d46c7-23b9-4274-9211-275c58d18c07', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('bba25a50-8ac3-4ec8-8f5a-a04677168e80', NULL, 'registration-password-action', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'e70d46c7-23b9-4274-9211-275c58d18c07', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e2d4ebc1-2500-441f-919f-8de12aac21e9', NULL, 'registration-recaptcha-action', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'e70d46c7-23b9-4274-9211-275c58d18c07', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('696b050e-4303-48f6-b2d8-2e7d52e4c0d8', NULL, 'reset-credentials-choose-user', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '066486dd-fef3-4290-a604-5a552c223679', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a75fe1ac-4242-4114-b0a4-20288caaa0bd', NULL, 'reset-credential-email', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '066486dd-fef3-4290-a604-5a552c223679', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b8e20384-ce03-4403-ab67-bc01f0440f21', NULL, 'reset-password', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '066486dd-fef3-4290-a604-5a552c223679', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a2971990-6a19-4d71-95ef-aa89acf9b038', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '066486dd-fef3-4290-a604-5a552c223679', 1, 40, true, '43ccd003-31b8-44da-93f8-6724bcb8b503', NULL);
INSERT INTO public.authentication_execution VALUES ('1cf45ae4-0028-4467-ba72-68ed4464dd62', NULL, 'http-basic-authenticator', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'c25faa73-2fa4-4a7b-9c75-9d135ae5b858', 0, 10, false, NULL, NULL);


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.authentication_flow VALUES ('5ad2f65b-7df3-4ea3-8275-c632e42c8c9b', 'browser', 'browser based authentication', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('3f844c20-b1fc-4907-9dab-6fb5c549ac1c', 'forms', 'Username, password, otp and other auth forms.', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('8383cdeb-aee8-445b-8980-f8ef0aacab52', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('bc15276d-2c0c-4fac-b15c-5eceea6c3e0a', 'direct grant', 'OpenID Connect Resource Owner Grant', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('465c1043-5a11-4a42-a2d2-82cfb97b54e4', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('ec76bc03-5b39-4a28-b244-95fdc4f753e1', 'registration', 'registration flow', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('47500e64-1106-4cac-964b-7b5d1bd58d5f', 'registration form', 'registration form', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'form-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('fc37e675-cace-4a7c-86a5-f73f97ea55f8', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('c09c2482-26fa-4e85-86ae-b3cff6773af8', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('f5ad85e5-09c0-4722-b3b9-f5f405cf04cd', 'clients', 'Base authentication for clients', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'client-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('5416eef3-8bdc-4d41-9cd7-997097e24875', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('38221ea7-4100-4484-b408-ea6fbacf0027', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('03daabd2-d42c-418b-9901-e41732e0bfed', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('81b1ee57-42ed-4003-8e7b-a7549357da12', 'Account verification options', 'Method with which to verity the existing account', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('9c7f4b19-4653-496a-9b51-841fc727f9ab', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('05b988d8-316d-400f-910d-d36d4fc8d475', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('ef33c855-ec86-4ca6-bdcd-2292137029ab', 'saml ecp', 'SAML ECP Profile Authentication Flow', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('70d9b1c5-35e6-42ca-a266-2837be0c900b', 'docker auth', 'Used by Docker clients to authenticate against the IDP', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('2c212dee-ad76-414c-a0a9-fdfae1dab9e7', 'Account verification options', 'Method with which to verity the existing account', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('1d76af7e-8c7c-46e1-bbc0-3fc0f95ddfda', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('64ef3b81-6e8b-4ad7-a258-29e548388c11', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('9d4a44f5-09fc-4a13-8ca5-ca54f4ce38d9', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('2457a574-ea6d-4de8-b419-db9876bde108', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('43ccd003-31b8-44da-93f8-6724bcb8b503', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('2cfc1295-cd45-43c7-b8e6-bd14ae5e685e', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('7e683a5b-de1a-4768-a163-457d57458978', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('520fad15-8981-402d-a4a1-501d74ff1e5d', 'browser', 'browser based authentication', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('624a9489-d8ed-4b14-a78f-975f06c16818', 'clients', 'Base authentication for clients', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'client-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('5f092739-61f4-41c0-bba6-24beb17d3692', 'direct grant', 'OpenID Connect Resource Owner Grant', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('128ad414-638b-47ef-9596-d9296d7b785d', 'docker auth', 'Used by Docker clients to authenticate against the IDP', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('d31ee24b-2d32-4f28-a496-168400c7c27f', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('6a6972fe-39d2-46ad-b0c3-675e4c7494f8', 'forms', 'Username, password, otp and other auth forms.', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('2702976c-d524-4ac9-aecb-d15bdc2e106c', 'registration', 'registration flow', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('e70d46c7-23b9-4274-9211-275c58d18c07', 'registration form', 'registration form', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'form-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('066486dd-fef3-4290-a604-5a552c223679', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('c25faa73-2fa4-4a7b-9c75-9d135ae5b858', 'saml ecp', 'SAML ECP Profile Authentication Flow', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'basic-flow', true, true);


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.authenticator_config VALUES ('13bd9f0a-47db-45c2-ae03-8a2e81392d87', 'review profile config', '4f89db84-b6ab-4c26-9379-2721c83ea282');
INSERT INTO public.authenticator_config VALUES ('9ece82db-b079-46ac-8ace-6d753248a8dc', 'create unique user config', '4f89db84-b6ab-4c26-9379-2721c83ea282');
INSERT INTO public.authenticator_config VALUES ('9295d203-65a1-4d61-ad4a-081a4dc16aee', 'create unique user config', '662f6baf-45d0-437d-b002-c3f9ccdcb69d');
INSERT INTO public.authenticator_config VALUES ('05f5f1a3-e153-4fc8-af4a-cb39f4a3ffa0', 'review profile config', '662f6baf-45d0-437d-b002-c3f9ccdcb69d');


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.authenticator_config_entry VALUES ('13bd9f0a-47db-45c2-ae03-8a2e81392d87', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('9ece82db-b079-46ac-8ace-6d753248a8dc', 'false', 'require.password.update.after.registration');
INSERT INTO public.authenticator_config_entry VALUES ('05f5f1a3-e153-4fc8-af4a-cb39f4a3ffa0', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('9295d203-65a1-4d61-ad4a-081a4dc16aee', 'false', 'require.password.update.after.registration');


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.client VALUES ('a2c1b33c-e756-4940-a4f1-61a3731486e5', true, false, 'master-realm', 0, false, NULL, NULL, true, NULL, false, '4f89db84-b6ab-4c26-9379-2721c83ea282', NULL, 0, false, false, 'master Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('4ccb117c-ecb3-4923-b26f-c59e869f7569', true, false, 'account', 0, true, NULL, '/realms/master/account/', false, NULL, false, '4f89db84-b6ab-4c26-9379-2721c83ea282', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('fb633313-8670-4ab9-9b1b-05bf0b2bcc50', true, false, 'account-console', 0, true, NULL, '/realms/master/account/', false, NULL, false, '4f89db84-b6ab-4c26-9379-2721c83ea282', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('eb9a2576-1072-4809-8cdc-e7c669dd2a70', true, false, 'broker', 0, false, NULL, NULL, true, NULL, false, '4f89db84-b6ab-4c26-9379-2721c83ea282', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('be41090f-f94f-4875-81c0-825e3801cc9d', true, false, 'security-admin-console', 0, true, NULL, '/admin/master/console/', false, NULL, false, '4f89db84-b6ab-4c26-9379-2721c83ea282', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('4639c008-0431-4a02-89a9-1613488c55ef', true, false, 'admin-cli', 0, true, NULL, NULL, false, NULL, false, '4f89db84-b6ab-4c26-9379-2721c83ea282', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client VALUES ('3116363e-8efe-4679-a852-89a7bf206afd', true, false, 'admin-cli', 0, true, NULL, NULL, false, NULL, false, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client VALUES ('252223fa-2762-4017-8030-1a29dd200de3', true, false, 'broker', 0, false, NULL, NULL, true, NULL, false, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', true, true, 'my-client', 0, true, NULL, '', false, '', false, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'openid-connect', -1, true, false, '${my_client}', false, 'client-secret', '', '', NULL, false, false, true, true);
INSERT INTO public.client VALUES ('8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, false, 'realm-management', 0, false, NULL, NULL, true, NULL, false, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'openid-connect', 0, false, false, '${client_realm-management}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('a7d51e28-21a4-49e0-9430-d5d9057589ed', true, false, 'security-admin-console', 0, true, NULL, '/admin/book-store/console/', false, NULL, false, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('8ee0d957-5dec-483c-b661-baeb2c562480', true, false, 'book-store-realm', 0, false, NULL, NULL, true, NULL, false, '4f89db84-b6ab-4c26-9379-2721c83ea282', NULL, 0, false, false, 'book-store Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('ba615863-d949-4598-8196-54c21b254108', true, false, 'account', 0, true, NULL, '/realms/book-store/account/', false, NULL, false, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('68386798-a2f4-4e98-8a57-5454fb60df2d', true, false, 'account-console', 0, true, NULL, '/realms/book-store/account/', false, NULL, false, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.client_attributes VALUES ('4ccb117c-ecb3-4923-b26f-c59e869f7569', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes VALUES ('fb633313-8670-4ab9-9b1b-05bf0b2bcc50', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes VALUES ('fb633313-8670-4ab9-9b1b-05bf0b2bcc50', 'pkce.code.challenge.method', 'S256');
INSERT INTO public.client_attributes VALUES ('be41090f-f94f-4875-81c0-825e3801cc9d', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes VALUES ('be41090f-f94f-4875-81c0-825e3801cc9d', 'pkce.code.challenge.method', 'S256');
INSERT INTO public.client_attributes VALUES ('ba615863-d949-4598-8196-54c21b254108', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes VALUES ('68386798-a2f4-4e98-8a57-5454fb60df2d', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes VALUES ('68386798-a2f4-4e98-8a57-5454fb60df2d', 'pkce.code.challenge.method', 'S256');
INSERT INTO public.client_attributes VALUES ('3116363e-8efe-4679-a852-89a7bf206afd', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes VALUES ('252223fa-2762-4017-8030-1a29dd200de3', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', 'client.secret.creation.time', '1694601225');
INSERT INTO public.client_attributes VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', 'oauth2.device.authorization.grant.enabled', 'false');
INSERT INTO public.client_attributes VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', 'backchannel.logout.revoke.offline.tokens', 'false');
INSERT INTO public.client_attributes VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', 'use.refresh.tokens', 'true');
INSERT INTO public.client_attributes VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', 'oidc.ciba.grant.enabled', 'false');
INSERT INTO public.client_attributes VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', 'backchannel.logout.session.required', 'true');
INSERT INTO public.client_attributes VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', 'client_credentials.use_refresh_token', 'false');
INSERT INTO public.client_attributes VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', 'acr.loa.map', '{}');
INSERT INTO public.client_attributes VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', 'require.pushed.authorization.requests', 'false');
INSERT INTO public.client_attributes VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', 'tls.client.certificate.bound.access.tokens', 'false');
INSERT INTO public.client_attributes VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', 'display.on.consent.screen', 'false');
INSERT INTO public.client_attributes VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', 'token.response.type.bearer.lower-case', 'false');
INSERT INTO public.client_attributes VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes VALUES ('8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes VALUES ('a7d51e28-21a4-49e0-9430-d5d9057589ed', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes VALUES ('a7d51e28-21a4-49e0-9430-d5d9057589ed', 'pkce.code.challenge.method', 'S256');


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.client_scope VALUES ('b2bfd369-fe32-4cde-817d-cf934eadd9a3', 'offline_access', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope VALUES ('da530aed-a437-40ee-9836-04da905987fb', 'role_list', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'SAML role list', 'saml');
INSERT INTO public.client_scope VALUES ('851a6fc5-21ad-468f-8ab7-859369f1ef76', 'profile', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope VALUES ('84fb7279-28b6-495e-9497-c0e4d7ebffc7', 'email', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope VALUES ('d419b6f7-25e4-4408-8c0e-1761f745566a', 'address', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope VALUES ('cda3d0bc-338b-4ee3-a245-d38a64e919b0', 'phone', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope VALUES ('c3fe4683-dd46-4922-89f9-8d1d1e147421', 'roles', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('c0741ea9-46c4-4195-90c3-a8caa8139f50', 'web-origins', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('82f849b9-6bf4-4911-9ca3-324ad23b2ac7', 'microprofile-jwt', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope VALUES ('af3b43c7-086b-417d-bb12-f3bfdcbce85f', 'acr', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'OpenID Connect scope for add acr (authentication context class reference) to the token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('a74e7451-421b-4bad-9c82-162e697ff7d2', 'email', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope VALUES ('45aa243d-d9ba-4001-97f7-f4d7b1e4e633', 'microprofile-jwt', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope VALUES ('3f4517ce-ebc1-4861-bbf1-07f04eb6e3a1', 'address', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope VALUES ('be0864bb-8303-4994-911b-ac1a89d71091', 'offline_access', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope VALUES ('bc81bbf6-7a6b-4e63-953c-b0b4b4555a3e', 'phone', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope VALUES ('12fc35b7-afa6-4605-8ec5-9001a0f17249', 'web-origins', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('10b81998-d0dd-43fa-8a0b-ddf2e775091d', 'acr', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'OpenID Connect scope for add acr (authentication context class reference) to the token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('3562dbfe-5f4f-4e89-b933-9d2ff9ec974a', 'profile', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope VALUES ('5ac85481-bd42-4d44-87c3-21dd888a765a', 'role_list', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'SAML role list', 'saml');
INSERT INTO public.client_scope VALUES ('6f55dc1e-f7c5-4024-b51f-a588bd525ad7', 'roles', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.client_scope_attributes VALUES ('b2bfd369-fe32-4cde-817d-cf934eadd9a3', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('b2bfd369-fe32-4cde-817d-cf934eadd9a3', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('da530aed-a437-40ee-9836-04da905987fb', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('da530aed-a437-40ee-9836-04da905987fb', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('851a6fc5-21ad-468f-8ab7-859369f1ef76', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('851a6fc5-21ad-468f-8ab7-859369f1ef76', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('851a6fc5-21ad-468f-8ab7-859369f1ef76', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('84fb7279-28b6-495e-9497-c0e4d7ebffc7', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('84fb7279-28b6-495e-9497-c0e4d7ebffc7', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('84fb7279-28b6-495e-9497-c0e4d7ebffc7', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('d419b6f7-25e4-4408-8c0e-1761f745566a', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('d419b6f7-25e4-4408-8c0e-1761f745566a', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('d419b6f7-25e4-4408-8c0e-1761f745566a', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('cda3d0bc-338b-4ee3-a245-d38a64e919b0', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('cda3d0bc-338b-4ee3-a245-d38a64e919b0', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('cda3d0bc-338b-4ee3-a245-d38a64e919b0', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('c3fe4683-dd46-4922-89f9-8d1d1e147421', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('c3fe4683-dd46-4922-89f9-8d1d1e147421', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('c3fe4683-dd46-4922-89f9-8d1d1e147421', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('c0741ea9-46c4-4195-90c3-a8caa8139f50', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('c0741ea9-46c4-4195-90c3-a8caa8139f50', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('c0741ea9-46c4-4195-90c3-a8caa8139f50', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('82f849b9-6bf4-4911-9ca3-324ad23b2ac7', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('82f849b9-6bf4-4911-9ca3-324ad23b2ac7', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('af3b43c7-086b-417d-bb12-f3bfdcbce85f', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('af3b43c7-086b-417d-bb12-f3bfdcbce85f', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('12fc35b7-afa6-4605-8ec5-9001a0f17249', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('12fc35b7-afa6-4605-8ec5-9001a0f17249', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('12fc35b7-afa6-4605-8ec5-9001a0f17249', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('10b81998-d0dd-43fa-8a0b-ddf2e775091d', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('10b81998-d0dd-43fa-8a0b-ddf2e775091d', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('3562dbfe-5f4f-4e89-b933-9d2ff9ec974a', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('3562dbfe-5f4f-4e89-b933-9d2ff9ec974a', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('3562dbfe-5f4f-4e89-b933-9d2ff9ec974a', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('5ac85481-bd42-4d44-87c3-21dd888a765a', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('5ac85481-bd42-4d44-87c3-21dd888a765a', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('a74e7451-421b-4bad-9c82-162e697ff7d2', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('a74e7451-421b-4bad-9c82-162e697ff7d2', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('a74e7451-421b-4bad-9c82-162e697ff7d2', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('45aa243d-d9ba-4001-97f7-f4d7b1e4e633', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('45aa243d-d9ba-4001-97f7-f4d7b1e4e633', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('3f4517ce-ebc1-4861-bbf1-07f04eb6e3a1', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('3f4517ce-ebc1-4861-bbf1-07f04eb6e3a1', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('3f4517ce-ebc1-4861-bbf1-07f04eb6e3a1', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('be0864bb-8303-4994-911b-ac1a89d71091', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('be0864bb-8303-4994-911b-ac1a89d71091', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('bc81bbf6-7a6b-4e63-953c-b0b4b4555a3e', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('bc81bbf6-7a6b-4e63-953c-b0b4b4555a3e', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('bc81bbf6-7a6b-4e63-953c-b0b4b4555a3e', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('6f55dc1e-f7c5-4024-b51f-a588bd525ad7', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('6f55dc1e-f7c5-4024-b51f-a588bd525ad7', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('6f55dc1e-f7c5-4024-b51f-a588bd525ad7', '${rolesScopeConsentText}', 'consent.screen.text');


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.client_scope_client VALUES ('4ccb117c-ecb3-4923-b26f-c59e869f7569', 'c3fe4683-dd46-4922-89f9-8d1d1e147421', true);
INSERT INTO public.client_scope_client VALUES ('4ccb117c-ecb3-4923-b26f-c59e869f7569', 'c0741ea9-46c4-4195-90c3-a8caa8139f50', true);
INSERT INTO public.client_scope_client VALUES ('4ccb117c-ecb3-4923-b26f-c59e869f7569', '851a6fc5-21ad-468f-8ab7-859369f1ef76', true);
INSERT INTO public.client_scope_client VALUES ('4ccb117c-ecb3-4923-b26f-c59e869f7569', 'af3b43c7-086b-417d-bb12-f3bfdcbce85f', true);
INSERT INTO public.client_scope_client VALUES ('4ccb117c-ecb3-4923-b26f-c59e869f7569', '84fb7279-28b6-495e-9497-c0e4d7ebffc7', true);
INSERT INTO public.client_scope_client VALUES ('4ccb117c-ecb3-4923-b26f-c59e869f7569', 'b2bfd369-fe32-4cde-817d-cf934eadd9a3', false);
INSERT INTO public.client_scope_client VALUES ('4ccb117c-ecb3-4923-b26f-c59e869f7569', 'd419b6f7-25e4-4408-8c0e-1761f745566a', false);
INSERT INTO public.client_scope_client VALUES ('4ccb117c-ecb3-4923-b26f-c59e869f7569', 'cda3d0bc-338b-4ee3-a245-d38a64e919b0', false);
INSERT INTO public.client_scope_client VALUES ('4ccb117c-ecb3-4923-b26f-c59e869f7569', '82f849b9-6bf4-4911-9ca3-324ad23b2ac7', false);
INSERT INTO public.client_scope_client VALUES ('fb633313-8670-4ab9-9b1b-05bf0b2bcc50', 'c3fe4683-dd46-4922-89f9-8d1d1e147421', true);
INSERT INTO public.client_scope_client VALUES ('fb633313-8670-4ab9-9b1b-05bf0b2bcc50', 'c0741ea9-46c4-4195-90c3-a8caa8139f50', true);
INSERT INTO public.client_scope_client VALUES ('fb633313-8670-4ab9-9b1b-05bf0b2bcc50', '851a6fc5-21ad-468f-8ab7-859369f1ef76', true);
INSERT INTO public.client_scope_client VALUES ('fb633313-8670-4ab9-9b1b-05bf0b2bcc50', 'af3b43c7-086b-417d-bb12-f3bfdcbce85f', true);
INSERT INTO public.client_scope_client VALUES ('fb633313-8670-4ab9-9b1b-05bf0b2bcc50', '84fb7279-28b6-495e-9497-c0e4d7ebffc7', true);
INSERT INTO public.client_scope_client VALUES ('fb633313-8670-4ab9-9b1b-05bf0b2bcc50', 'b2bfd369-fe32-4cde-817d-cf934eadd9a3', false);
INSERT INTO public.client_scope_client VALUES ('fb633313-8670-4ab9-9b1b-05bf0b2bcc50', 'd419b6f7-25e4-4408-8c0e-1761f745566a', false);
INSERT INTO public.client_scope_client VALUES ('fb633313-8670-4ab9-9b1b-05bf0b2bcc50', 'cda3d0bc-338b-4ee3-a245-d38a64e919b0', false);
INSERT INTO public.client_scope_client VALUES ('fb633313-8670-4ab9-9b1b-05bf0b2bcc50', '82f849b9-6bf4-4911-9ca3-324ad23b2ac7', false);
INSERT INTO public.client_scope_client VALUES ('4639c008-0431-4a02-89a9-1613488c55ef', 'c3fe4683-dd46-4922-89f9-8d1d1e147421', true);
INSERT INTO public.client_scope_client VALUES ('4639c008-0431-4a02-89a9-1613488c55ef', 'c0741ea9-46c4-4195-90c3-a8caa8139f50', true);
INSERT INTO public.client_scope_client VALUES ('4639c008-0431-4a02-89a9-1613488c55ef', '851a6fc5-21ad-468f-8ab7-859369f1ef76', true);
INSERT INTO public.client_scope_client VALUES ('4639c008-0431-4a02-89a9-1613488c55ef', 'af3b43c7-086b-417d-bb12-f3bfdcbce85f', true);
INSERT INTO public.client_scope_client VALUES ('4639c008-0431-4a02-89a9-1613488c55ef', '84fb7279-28b6-495e-9497-c0e4d7ebffc7', true);
INSERT INTO public.client_scope_client VALUES ('4639c008-0431-4a02-89a9-1613488c55ef', 'b2bfd369-fe32-4cde-817d-cf934eadd9a3', false);
INSERT INTO public.client_scope_client VALUES ('4639c008-0431-4a02-89a9-1613488c55ef', 'd419b6f7-25e4-4408-8c0e-1761f745566a', false);
INSERT INTO public.client_scope_client VALUES ('4639c008-0431-4a02-89a9-1613488c55ef', 'cda3d0bc-338b-4ee3-a245-d38a64e919b0', false);
INSERT INTO public.client_scope_client VALUES ('4639c008-0431-4a02-89a9-1613488c55ef', '82f849b9-6bf4-4911-9ca3-324ad23b2ac7', false);
INSERT INTO public.client_scope_client VALUES ('eb9a2576-1072-4809-8cdc-e7c669dd2a70', 'c3fe4683-dd46-4922-89f9-8d1d1e147421', true);
INSERT INTO public.client_scope_client VALUES ('eb9a2576-1072-4809-8cdc-e7c669dd2a70', 'c0741ea9-46c4-4195-90c3-a8caa8139f50', true);
INSERT INTO public.client_scope_client VALUES ('eb9a2576-1072-4809-8cdc-e7c669dd2a70', '851a6fc5-21ad-468f-8ab7-859369f1ef76', true);
INSERT INTO public.client_scope_client VALUES ('eb9a2576-1072-4809-8cdc-e7c669dd2a70', 'af3b43c7-086b-417d-bb12-f3bfdcbce85f', true);
INSERT INTO public.client_scope_client VALUES ('eb9a2576-1072-4809-8cdc-e7c669dd2a70', '84fb7279-28b6-495e-9497-c0e4d7ebffc7', true);
INSERT INTO public.client_scope_client VALUES ('eb9a2576-1072-4809-8cdc-e7c669dd2a70', 'b2bfd369-fe32-4cde-817d-cf934eadd9a3', false);
INSERT INTO public.client_scope_client VALUES ('eb9a2576-1072-4809-8cdc-e7c669dd2a70', 'd419b6f7-25e4-4408-8c0e-1761f745566a', false);
INSERT INTO public.client_scope_client VALUES ('eb9a2576-1072-4809-8cdc-e7c669dd2a70', 'cda3d0bc-338b-4ee3-a245-d38a64e919b0', false);
INSERT INTO public.client_scope_client VALUES ('eb9a2576-1072-4809-8cdc-e7c669dd2a70', '82f849b9-6bf4-4911-9ca3-324ad23b2ac7', false);
INSERT INTO public.client_scope_client VALUES ('a2c1b33c-e756-4940-a4f1-61a3731486e5', 'c3fe4683-dd46-4922-89f9-8d1d1e147421', true);
INSERT INTO public.client_scope_client VALUES ('a2c1b33c-e756-4940-a4f1-61a3731486e5', 'c0741ea9-46c4-4195-90c3-a8caa8139f50', true);
INSERT INTO public.client_scope_client VALUES ('a2c1b33c-e756-4940-a4f1-61a3731486e5', '851a6fc5-21ad-468f-8ab7-859369f1ef76', true);
INSERT INTO public.client_scope_client VALUES ('a2c1b33c-e756-4940-a4f1-61a3731486e5', 'af3b43c7-086b-417d-bb12-f3bfdcbce85f', true);
INSERT INTO public.client_scope_client VALUES ('a2c1b33c-e756-4940-a4f1-61a3731486e5', '84fb7279-28b6-495e-9497-c0e4d7ebffc7', true);
INSERT INTO public.client_scope_client VALUES ('a2c1b33c-e756-4940-a4f1-61a3731486e5', 'b2bfd369-fe32-4cde-817d-cf934eadd9a3', false);
INSERT INTO public.client_scope_client VALUES ('a2c1b33c-e756-4940-a4f1-61a3731486e5', 'd419b6f7-25e4-4408-8c0e-1761f745566a', false);
INSERT INTO public.client_scope_client VALUES ('a2c1b33c-e756-4940-a4f1-61a3731486e5', 'cda3d0bc-338b-4ee3-a245-d38a64e919b0', false);
INSERT INTO public.client_scope_client VALUES ('a2c1b33c-e756-4940-a4f1-61a3731486e5', '82f849b9-6bf4-4911-9ca3-324ad23b2ac7', false);
INSERT INTO public.client_scope_client VALUES ('be41090f-f94f-4875-81c0-825e3801cc9d', 'c3fe4683-dd46-4922-89f9-8d1d1e147421', true);
INSERT INTO public.client_scope_client VALUES ('be41090f-f94f-4875-81c0-825e3801cc9d', 'c0741ea9-46c4-4195-90c3-a8caa8139f50', true);
INSERT INTO public.client_scope_client VALUES ('be41090f-f94f-4875-81c0-825e3801cc9d', '851a6fc5-21ad-468f-8ab7-859369f1ef76', true);
INSERT INTO public.client_scope_client VALUES ('be41090f-f94f-4875-81c0-825e3801cc9d', 'af3b43c7-086b-417d-bb12-f3bfdcbce85f', true);
INSERT INTO public.client_scope_client VALUES ('be41090f-f94f-4875-81c0-825e3801cc9d', '84fb7279-28b6-495e-9497-c0e4d7ebffc7', true);
INSERT INTO public.client_scope_client VALUES ('be41090f-f94f-4875-81c0-825e3801cc9d', 'b2bfd369-fe32-4cde-817d-cf934eadd9a3', false);
INSERT INTO public.client_scope_client VALUES ('be41090f-f94f-4875-81c0-825e3801cc9d', 'd419b6f7-25e4-4408-8c0e-1761f745566a', false);
INSERT INTO public.client_scope_client VALUES ('be41090f-f94f-4875-81c0-825e3801cc9d', 'cda3d0bc-338b-4ee3-a245-d38a64e919b0', false);
INSERT INTO public.client_scope_client VALUES ('be41090f-f94f-4875-81c0-825e3801cc9d', '82f849b9-6bf4-4911-9ca3-324ad23b2ac7', false);
INSERT INTO public.client_scope_client VALUES ('ba615863-d949-4598-8196-54c21b254108', '12fc35b7-afa6-4605-8ec5-9001a0f17249', true);
INSERT INTO public.client_scope_client VALUES ('ba615863-d949-4598-8196-54c21b254108', '10b81998-d0dd-43fa-8a0b-ddf2e775091d', true);
INSERT INTO public.client_scope_client VALUES ('ba615863-d949-4598-8196-54c21b254108', '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a', true);
INSERT INTO public.client_scope_client VALUES ('ba615863-d949-4598-8196-54c21b254108', '6f55dc1e-f7c5-4024-b51f-a588bd525ad7', true);
INSERT INTO public.client_scope_client VALUES ('ba615863-d949-4598-8196-54c21b254108', 'a74e7451-421b-4bad-9c82-162e697ff7d2', true);
INSERT INTO public.client_scope_client VALUES ('ba615863-d949-4598-8196-54c21b254108', '3f4517ce-ebc1-4861-bbf1-07f04eb6e3a1', false);
INSERT INTO public.client_scope_client VALUES ('ba615863-d949-4598-8196-54c21b254108', 'bc81bbf6-7a6b-4e63-953c-b0b4b4555a3e', false);
INSERT INTO public.client_scope_client VALUES ('ba615863-d949-4598-8196-54c21b254108', 'be0864bb-8303-4994-911b-ac1a89d71091', false);
INSERT INTO public.client_scope_client VALUES ('ba615863-d949-4598-8196-54c21b254108', '45aa243d-d9ba-4001-97f7-f4d7b1e4e633', false);
INSERT INTO public.client_scope_client VALUES ('68386798-a2f4-4e98-8a57-5454fb60df2d', '12fc35b7-afa6-4605-8ec5-9001a0f17249', true);
INSERT INTO public.client_scope_client VALUES ('68386798-a2f4-4e98-8a57-5454fb60df2d', '10b81998-d0dd-43fa-8a0b-ddf2e775091d', true);
INSERT INTO public.client_scope_client VALUES ('68386798-a2f4-4e98-8a57-5454fb60df2d', '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a', true);
INSERT INTO public.client_scope_client VALUES ('68386798-a2f4-4e98-8a57-5454fb60df2d', '6f55dc1e-f7c5-4024-b51f-a588bd525ad7', true);
INSERT INTO public.client_scope_client VALUES ('68386798-a2f4-4e98-8a57-5454fb60df2d', 'a74e7451-421b-4bad-9c82-162e697ff7d2', true);
INSERT INTO public.client_scope_client VALUES ('68386798-a2f4-4e98-8a57-5454fb60df2d', '3f4517ce-ebc1-4861-bbf1-07f04eb6e3a1', false);
INSERT INTO public.client_scope_client VALUES ('68386798-a2f4-4e98-8a57-5454fb60df2d', 'bc81bbf6-7a6b-4e63-953c-b0b4b4555a3e', false);
INSERT INTO public.client_scope_client VALUES ('68386798-a2f4-4e98-8a57-5454fb60df2d', 'be0864bb-8303-4994-911b-ac1a89d71091', false);
INSERT INTO public.client_scope_client VALUES ('68386798-a2f4-4e98-8a57-5454fb60df2d', '45aa243d-d9ba-4001-97f7-f4d7b1e4e633', false);
INSERT INTO public.client_scope_client VALUES ('3116363e-8efe-4679-a852-89a7bf206afd', '12fc35b7-afa6-4605-8ec5-9001a0f17249', true);
INSERT INTO public.client_scope_client VALUES ('3116363e-8efe-4679-a852-89a7bf206afd', '10b81998-d0dd-43fa-8a0b-ddf2e775091d', true);
INSERT INTO public.client_scope_client VALUES ('3116363e-8efe-4679-a852-89a7bf206afd', '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a', true);
INSERT INTO public.client_scope_client VALUES ('3116363e-8efe-4679-a852-89a7bf206afd', '6f55dc1e-f7c5-4024-b51f-a588bd525ad7', true);
INSERT INTO public.client_scope_client VALUES ('3116363e-8efe-4679-a852-89a7bf206afd', 'a74e7451-421b-4bad-9c82-162e697ff7d2', true);
INSERT INTO public.client_scope_client VALUES ('3116363e-8efe-4679-a852-89a7bf206afd', '3f4517ce-ebc1-4861-bbf1-07f04eb6e3a1', false);
INSERT INTO public.client_scope_client VALUES ('3116363e-8efe-4679-a852-89a7bf206afd', 'bc81bbf6-7a6b-4e63-953c-b0b4b4555a3e', false);
INSERT INTO public.client_scope_client VALUES ('3116363e-8efe-4679-a852-89a7bf206afd', 'be0864bb-8303-4994-911b-ac1a89d71091', false);
INSERT INTO public.client_scope_client VALUES ('3116363e-8efe-4679-a852-89a7bf206afd', '45aa243d-d9ba-4001-97f7-f4d7b1e4e633', false);
INSERT INTO public.client_scope_client VALUES ('252223fa-2762-4017-8030-1a29dd200de3', '12fc35b7-afa6-4605-8ec5-9001a0f17249', true);
INSERT INTO public.client_scope_client VALUES ('252223fa-2762-4017-8030-1a29dd200de3', '10b81998-d0dd-43fa-8a0b-ddf2e775091d', true);
INSERT INTO public.client_scope_client VALUES ('252223fa-2762-4017-8030-1a29dd200de3', '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a', true);
INSERT INTO public.client_scope_client VALUES ('252223fa-2762-4017-8030-1a29dd200de3', '6f55dc1e-f7c5-4024-b51f-a588bd525ad7', true);
INSERT INTO public.client_scope_client VALUES ('252223fa-2762-4017-8030-1a29dd200de3', 'a74e7451-421b-4bad-9c82-162e697ff7d2', true);
INSERT INTO public.client_scope_client VALUES ('252223fa-2762-4017-8030-1a29dd200de3', '3f4517ce-ebc1-4861-bbf1-07f04eb6e3a1', false);
INSERT INTO public.client_scope_client VALUES ('252223fa-2762-4017-8030-1a29dd200de3', 'bc81bbf6-7a6b-4e63-953c-b0b4b4555a3e', false);
INSERT INTO public.client_scope_client VALUES ('252223fa-2762-4017-8030-1a29dd200de3', 'be0864bb-8303-4994-911b-ac1a89d71091', false);
INSERT INTO public.client_scope_client VALUES ('252223fa-2762-4017-8030-1a29dd200de3', '45aa243d-d9ba-4001-97f7-f4d7b1e4e633', false);
INSERT INTO public.client_scope_client VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', '12fc35b7-afa6-4605-8ec5-9001a0f17249', true);
INSERT INTO public.client_scope_client VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', '10b81998-d0dd-43fa-8a0b-ddf2e775091d', true);
INSERT INTO public.client_scope_client VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a', true);
INSERT INTO public.client_scope_client VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', '6f55dc1e-f7c5-4024-b51f-a588bd525ad7', true);
INSERT INTO public.client_scope_client VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', 'a74e7451-421b-4bad-9c82-162e697ff7d2', true);
INSERT INTO public.client_scope_client VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', '3f4517ce-ebc1-4861-bbf1-07f04eb6e3a1', false);
INSERT INTO public.client_scope_client VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', 'bc81bbf6-7a6b-4e63-953c-b0b4b4555a3e', false);
INSERT INTO public.client_scope_client VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', 'be0864bb-8303-4994-911b-ac1a89d71091', false);
INSERT INTO public.client_scope_client VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', '45aa243d-d9ba-4001-97f7-f4d7b1e4e633', false);
INSERT INTO public.client_scope_client VALUES ('8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', '12fc35b7-afa6-4605-8ec5-9001a0f17249', true);
INSERT INTO public.client_scope_client VALUES ('8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', '10b81998-d0dd-43fa-8a0b-ddf2e775091d', true);
INSERT INTO public.client_scope_client VALUES ('8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a', true);
INSERT INTO public.client_scope_client VALUES ('8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', '6f55dc1e-f7c5-4024-b51f-a588bd525ad7', true);
INSERT INTO public.client_scope_client VALUES ('8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', 'a74e7451-421b-4bad-9c82-162e697ff7d2', true);
INSERT INTO public.client_scope_client VALUES ('8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', '3f4517ce-ebc1-4861-bbf1-07f04eb6e3a1', false);
INSERT INTO public.client_scope_client VALUES ('8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', 'bc81bbf6-7a6b-4e63-953c-b0b4b4555a3e', false);
INSERT INTO public.client_scope_client VALUES ('8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', 'be0864bb-8303-4994-911b-ac1a89d71091', false);
INSERT INTO public.client_scope_client VALUES ('8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', '45aa243d-d9ba-4001-97f7-f4d7b1e4e633', false);
INSERT INTO public.client_scope_client VALUES ('a7d51e28-21a4-49e0-9430-d5d9057589ed', '12fc35b7-afa6-4605-8ec5-9001a0f17249', true);
INSERT INTO public.client_scope_client VALUES ('a7d51e28-21a4-49e0-9430-d5d9057589ed', '10b81998-d0dd-43fa-8a0b-ddf2e775091d', true);
INSERT INTO public.client_scope_client VALUES ('a7d51e28-21a4-49e0-9430-d5d9057589ed', '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a', true);
INSERT INTO public.client_scope_client VALUES ('a7d51e28-21a4-49e0-9430-d5d9057589ed', '6f55dc1e-f7c5-4024-b51f-a588bd525ad7', true);
INSERT INTO public.client_scope_client VALUES ('a7d51e28-21a4-49e0-9430-d5d9057589ed', 'a74e7451-421b-4bad-9c82-162e697ff7d2', true);
INSERT INTO public.client_scope_client VALUES ('a7d51e28-21a4-49e0-9430-d5d9057589ed', '3f4517ce-ebc1-4861-bbf1-07f04eb6e3a1', false);
INSERT INTO public.client_scope_client VALUES ('a7d51e28-21a4-49e0-9430-d5d9057589ed', 'bc81bbf6-7a6b-4e63-953c-b0b4b4555a3e', false);
INSERT INTO public.client_scope_client VALUES ('a7d51e28-21a4-49e0-9430-d5d9057589ed', 'be0864bb-8303-4994-911b-ac1a89d71091', false);
INSERT INTO public.client_scope_client VALUES ('a7d51e28-21a4-49e0-9430-d5d9057589ed', '45aa243d-d9ba-4001-97f7-f4d7b1e4e633', false);


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.client_scope_role_mapping VALUES ('b2bfd369-fe32-4cde-817d-cf934eadd9a3', '6cd1d71f-8bd3-4ce8-8617-70a2f0d13f2f');
INSERT INTO public.client_scope_role_mapping VALUES ('be0864bb-8303-4994-911b-ac1a89d71091', '3ee02316-c4b1-4356-9228-e93bec6d8d45');


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.component VALUES ('b0e2f376-d0ba-4557-911d-e322b05b4fd3', 'Trusted Hosts', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'anonymous');
INSERT INTO public.component VALUES ('4fca3600-1ae0-42ea-9222-ce1286917327', 'Consent Required', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'anonymous');
INSERT INTO public.component VALUES ('9dac5f67-b3d2-4cb8-a9f0-6488b2bf45ca', 'Full Scope Disabled', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'anonymous');
INSERT INTO public.component VALUES ('325826f0-4ee8-488a-9e71-e3c963f618aa', 'Max Clients Limit', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'anonymous');
INSERT INTO public.component VALUES ('75f75838-224f-47a9-a666-82ea948ce37d', 'Allowed Protocol Mapper Types', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'anonymous');
INSERT INTO public.component VALUES ('b27b0c85-f06f-4d24-a549-75e9f9a89b58', 'Allowed Client Scopes', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'anonymous');
INSERT INTO public.component VALUES ('69857309-9068-45ab-9eb9-6ae3341fe851', 'Allowed Protocol Mapper Types', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'authenticated');
INSERT INTO public.component VALUES ('1a24c727-4595-4959-8dcb-ab577998a213', 'Allowed Client Scopes', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'authenticated');
INSERT INTO public.component VALUES ('ae4c7e65-8c25-42a0-b65d-2361cb4e6e05', 'rsa-generated', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'rsa-generated', 'org.keycloak.keys.KeyProvider', '4f89db84-b6ab-4c26-9379-2721c83ea282', NULL);
INSERT INTO public.component VALUES ('e5b9178b-cb9f-4763-88ac-aae5e6845a4d', 'rsa-enc-generated', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'rsa-enc-generated', 'org.keycloak.keys.KeyProvider', '4f89db84-b6ab-4c26-9379-2721c83ea282', NULL);
INSERT INTO public.component VALUES ('8137902e-42a4-4646-808d-59c92b89e64d', 'hmac-generated', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'hmac-generated', 'org.keycloak.keys.KeyProvider', '4f89db84-b6ab-4c26-9379-2721c83ea282', NULL);
INSERT INTO public.component VALUES ('88512e95-9b61-4379-baba-d28283362d65', 'aes-generated', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'aes-generated', 'org.keycloak.keys.KeyProvider', '4f89db84-b6ab-4c26-9379-2721c83ea282', NULL);
INSERT INTO public.component VALUES ('543ef0e8-1b64-436a-829f-f8d57819eb45', 'Max Clients Limit', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'anonymous');
INSERT INTO public.component VALUES ('3029e4e4-bfbe-490c-af54-65174b5711d6', 'Allowed Protocol Mapper Types', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'authenticated');
INSERT INTO public.component VALUES ('34015fb7-1b62-40f7-b663-fa89661ba939', 'Allowed Client Scopes', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'authenticated');
INSERT INTO public.component VALUES ('11c9bee2-bf75-471c-8de8-286980530d10', 'Trusted Hosts', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'anonymous');
INSERT INTO public.component VALUES ('9c92a5fd-6169-4b1b-af91-f187fae9e4e3', 'Full Scope Disabled', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'anonymous');
INSERT INTO public.component VALUES ('83ddd279-aeea-4cf9-9bff-79f648e75fb7', 'Consent Required', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'anonymous');
INSERT INTO public.component VALUES ('f0f2a0a4-b58a-43ed-8035-158c5120b350', 'Allowed Client Scopes', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'anonymous');
INSERT INTO public.component VALUES ('f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'Allowed Protocol Mapper Types', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'anonymous');
INSERT INTO public.component VALUES ('28c2acd4-f5c7-4e0a-80b8-eac67ea5991c', 'aes-generated', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'aes-generated', 'org.keycloak.keys.KeyProvider', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', NULL);
INSERT INTO public.component VALUES ('ed029d0b-6d80-4bdd-a21a-7c909d87d494', 'hmac-generated', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'hmac-generated', 'org.keycloak.keys.KeyProvider', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', NULL);
INSERT INTO public.component VALUES ('7b62deb1-030d-4800-b41c-bd5398080ed2', 'rsa-generated', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'rsa-generated', 'org.keycloak.keys.KeyProvider', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', NULL);
INSERT INTO public.component VALUES ('1e3a64aa-1eab-42a3-844b-b1aa6799d624', 'rsa-enc-generated', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'rsa-enc-generated', 'org.keycloak.keys.KeyProvider', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', NULL);


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.component_config VALUES ('8cc534f7-b3d6-431d-bf59-458d111fc79a', 'b27b0c85-f06f-4d24-a549-75e9f9a89b58', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('66d5ac87-611f-43c0-b9af-cd7e1a3c38ff', '69857309-9068-45ab-9eb9-6ae3341fe851', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('567d71a4-1855-4586-a963-f211e3e2d28e', '69857309-9068-45ab-9eb9-6ae3341fe851', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('3c398e2e-f863-4904-be4a-b6d9b296ee45', '69857309-9068-45ab-9eb9-6ae3341fe851', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('d68b8c2e-de20-49ed-8702-389ccfa0e436', '69857309-9068-45ab-9eb9-6ae3341fe851', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('c30402a8-4d98-48d5-99e6-d2742ff1451f', '69857309-9068-45ab-9eb9-6ae3341fe851', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('5bf0e491-4958-41d1-bfd7-69479dcf6ed3', '69857309-9068-45ab-9eb9-6ae3341fe851', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('b95c0df9-5bfa-47e7-ba45-c50b949ffb33', '69857309-9068-45ab-9eb9-6ae3341fe851', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('ec600c74-20b3-4a86-b4cf-ef5b5a4d0b86', '69857309-9068-45ab-9eb9-6ae3341fe851', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('3865f9a0-efc6-4989-8962-323b76813f51', 'b0e2f376-d0ba-4557-911d-e322b05b4fd3', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('c1770e2a-314d-48a2-9897-581bae1721c7', 'b0e2f376-d0ba-4557-911d-e322b05b4fd3', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('47058b58-2cd2-451c-9efa-0b7a42a7aa3e', '325826f0-4ee8-488a-9e71-e3c963f618aa', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('b54c378e-e17f-452f-8ce1-fecba601d461', '75f75838-224f-47a9-a666-82ea948ce37d', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('b5079596-e98c-49d4-a167-e7dccd9a3ece', '75f75838-224f-47a9-a666-82ea948ce37d', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('734d9ed0-6e56-49db-a6b7-62a38e042368', '75f75838-224f-47a9-a666-82ea948ce37d', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('0f1dccbd-60cf-4072-b334-cbd698f33a6c', '75f75838-224f-47a9-a666-82ea948ce37d', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('0d489450-ce20-4a9a-8464-0afd61c613b7', '75f75838-224f-47a9-a666-82ea948ce37d', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('fc0e6584-7206-4899-a164-cda4cbd52744', '75f75838-224f-47a9-a666-82ea948ce37d', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('9731b4da-b80e-4740-84a3-09c9ba79f4a8', '75f75838-224f-47a9-a666-82ea948ce37d', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('e47baa18-2d58-43bc-9b4c-60ff79257e8f', '75f75838-224f-47a9-a666-82ea948ce37d', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('5b48cba5-34fc-4bc6-9cd9-1eb36fe46d3f', '1a24c727-4595-4959-8dcb-ab577998a213', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('6c15b9b2-963e-4182-b1c7-362a717dd58b', '8137902e-42a4-4646-808d-59c92b89e64d', 'secret', 'SK3RQGMa2S3vTfSZKsGBa9fu88Oz8W_k9TEUIF-QKvnKdoTBGqsT-1fsRex_xrBKChLZCqPeK9zI6WwZasL2uw');
INSERT INTO public.component_config VALUES ('0b84a21e-5034-4e25-9e76-cdff6a1ead7b', '8137902e-42a4-4646-808d-59c92b89e64d', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('f8bfe7f4-a0cb-4bc6-a07a-74352c96fe46', '8137902e-42a4-4646-808d-59c92b89e64d', 'priority', '100');
INSERT INTO public.component_config VALUES ('bc76a66d-8a50-4093-a643-82b3a8e0aad0', '8137902e-42a4-4646-808d-59c92b89e64d', 'kid', '75ce1c75-47e6-4879-a685-0106a3faf0c1');
INSERT INTO public.component_config VALUES ('4001540a-7fe0-4019-9352-85deedc6b743', 'ae4c7e65-8c25-42a0-b65d-2361cb4e6e05', 'keyUse', 'SIG');
INSERT INTO public.component_config VALUES ('678336d6-7237-448a-b87c-bd830e247daa', 'ae4c7e65-8c25-42a0-b65d-2361cb4e6e05', 'priority', '100');
INSERT INTO public.component_config VALUES ('d7febe0d-f646-433d-a51f-171f1de178e9', 'ae4c7e65-8c25-42a0-b65d-2361cb4e6e05', 'certificate', 'MIICmzCCAYMCBgGLmvGxyzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMTA0MTUyNTEyWhcNMzMxMTA0MTUyNjUyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCrX1Hgnhh8sFN6HzJ5EJo9Gf7FZEiSMKtd/5BAsAQkVY8zo0rDoumaxZemYQTZ15IXKCFC5YPfGlvQV6V+aa/kM6McC97VyBX28USFnTsWzuUm6xMd/PqDW5Ql5vfC1iPt0B9c26E27ZoaJvhicbPmds/rb40vZno0YoRuSWYRzN63NeR59AjJBBmJSTfkErJxk+VWrFotzBw2iUxkmdTUPo6LSy/Vf7t+b3ecvY8n/4qAN0xK0gxVZp31+Sap1/jXRjqMnBsdkbabD9qc+56LgYeqI5C4hCmwYyPNK/xQ5G/ldsBFSh/5lKihj+sQ+sXF6NA2HXLrkqYngds0FzhTAgMBAAEwDQYJKoZIhvcNAQELBQADggEBADOPmXd5DHAZMXgYo/uoRuP7hPzpDfvmag4sqfANVtCIuV/pSyoipuSN0gnk6DnLOA4tJStMfPERo95rUK/p8gip/yhC3TPWkuJTiLRBnavYsxZ64FT36lJ2FAy79aXUE54E1m/iKFXjJEeKF9HgTRSOz/L1HPzos6fhuaZumilIRtAnKOyzilwRnfPGRar1xvEmarUzNhOLHcv3k3F8KUtJjAjjGyXINfk11FFCX8RBm1AtGKJdat+wu45WakjhVsDGczpV+vZrAAcxP/I8Hh8aEBtKc+X8/D2sAYvELL3FrMBi+ED5kG9i1vx3JjO1QXxAxurNOsRw1L65x6F6YNo=');
INSERT INTO public.component_config VALUES ('aaaabef6-51bb-459b-be0a-3f33e3602e6d', 'ae4c7e65-8c25-42a0-b65d-2361cb4e6e05', 'privateKey', 'MIIEpAIBAAKCAQEAq19R4J4YfLBTeh8yeRCaPRn+xWRIkjCrXf+QQLAEJFWPM6NKw6LpmsWXpmEE2deSFyghQuWD3xpb0Felfmmv5DOjHAve1cgV9vFEhZ07Fs7lJusTHfz6g1uUJeb3wtYj7dAfXNuhNu2aGib4YnGz5nbP62+NL2Z6NGKEbklmEczetzXkefQIyQQZiUk35BKycZPlVqxaLcwcNolMZJnU1D6Oi0sv1X+7fm93nL2PJ/+KgDdMStIMVWad9fkmqdf410Y6jJwbHZG2mw/anPuei4GHqiOQuIQpsGMjzSv8UORv5XbARUof+ZSooY/rEPrFxejQNh1y65KmJ4HbNBc4UwIDAQABAoIBADLtfNOXqAdGD0i3hLRdrriBxSi8CKUJOaQRkrjmlhSGKKxb1pgVDf8kwVB8fIiQe6XOEzRiKLJgjvB3W4MZvV+/yLVJAcveTki4onhipXC9w3OxYFkFGR14Vap93RtVsA+4Tdm2m05LhgRHmIEI8UGIBXoeCIMRnTd8H4b24RJgp0D6wE4ZCeMk4FulA4XLGiL/sDUhQWGvR2PvqHziT5VGKulu/epRj8rcSuA+KgXNXNpH37bDRF/K4Yrm/U3aFoBFNpjde9Alq17kR8jkmvsttwS4dKHgl8723KQnODp6JiHDYO3ZGu9bp0Cab361Uxzwrb9SL/Jw16yhn2jS8YECgYEA0lzfIDu5OTvqf2e+6/rGwcJXxWRLDW1G1e20mfxmobeowThpO6Yl2UDQVHttzvxrdkjTZR4PmRCunkerxbmk3N8mgDoaEhIquX2phAM2QKdfvtLBibJyznhAQz27s6qC8HEZfsotJxFtM8KkqgeRoo2jKiFzGjfYPzq/Cxe86wMCgYEA0Iz/UDF9AYzNAM7ezLB6eOKhtws64pynb5Fz8twmNPUTkKePXPRrJ21cZL1mih73yJ1UGoIorB36mNDWtV3iZeox1FIji2pWfFhYAIQNIwHUQaHrIcFHwH1LDTYp7hbQHOznmr3OrI7lYoSRjjSeX+rGiJWxCJDOaAJ1XZ4H1HECgYEAsAsSmwoABvqyUq7Cov856Bq4kzNMb88ccZk9A4Sravik3BZWUpnHoNlRvvGQQqERWWq2pi+TBBhm2YTHJnAmnMSOls6I1MipQpP8EcMSWub3BF2ho5dX5pvRw7Pc6g1vCMLNgEK3qLM3vRJN9RDierOncXGOvskvSjLif+j8q3sCgYBl0tG9V8xO+24EXPzPN8M0ToLimisQBaiCgqP4CaDl7lq1H/qRSg0fXPflf8wW1/PnEVnE75PoJWL7RcvvFX26gNP/dHNCWJMNdxzQc6juVLBLs0DYZEQiKYqBUta6Fo1Z8hlKpi3IdqRsq4ldwzcoYbq5aUzcf8cnZTvkj4oHIQKBgQCxokXGI6NYwDD8Zs9ek1ljT/QwQ00vAa/Lf3p8SglKgDXcgZ4lE8KR/j3RYcSso/UPEiJd3dRBvXgApuz3orgTzf1uLwoquG+Zf8OrIxI5b+l+GBjTSJ/9+1k/E9yjN8k72ELFMQT+wLQug7qlXGLqiT/OPme3sJi8J1TPQtLwjg==');
INSERT INTO public.component_config VALUES ('94e66972-6c6a-42e7-8ba3-30c4eef48c5d', 'e5b9178b-cb9f-4763-88ac-aae5e6845a4d', 'priority', '100');
INSERT INTO public.component_config VALUES ('72acc7bb-aedc-4b29-b269-5c9a47586441', 'e5b9178b-cb9f-4763-88ac-aae5e6845a4d', 'keyUse', 'ENC');
INSERT INTO public.component_config VALUES ('03ed6d3a-dcfa-4a23-b6b6-235546db675d', 'e5b9178b-cb9f-4763-88ac-aae5e6845a4d', 'privateKey', 'MIIEowIBAAKCAQEAnGjyI7+B3uWjpufEKfan9hJ2M5RW7DF9zWvcD7fEMY8lGOoWpvksh8/yc6opDp0NJQ94j9zN8F/6/x4FyWAL37mUqYHAA2AaHYUDQJww71jzUXOZpsGJL5rxgadq8FVMwIQY2nntI6Rvqk07k/JAjlGtA3tkqDF1dkZAqfVg7Yz1VLtYEHscs1GG602x0VQSFWDPtS0xt9gYsD2snNX06M6Isb6k9cf9dQeahsuT8l87uHcPikF1Ig2/S8CrFM5kg9wFfKGi67Unw+PI48iDOmtj9ToSUumwkoFVpMnAieOaKIsu/+rNfeiPlfP/SNtfepCj/qTKVOQ2HhBF+AFtMwIDAQABAoIBAAMLQmR4hbw26M6oWYhj0zMLhyx5kbTtruM2mACKyLc/DofXn2TnIByqJ+yhJ2lawN/O760i/EXQHhk9YmlNk+nFeas35t6uhMOYEkX3Ue3p/BdtOCnnP9B1MxoXFD0euriMWBEZxFFDqnKtP+B2cNoYyVryNQrKLJQGhrQrHgI0irF+4FippQShULz6J68inpNiM8OA1gveFZPPML0gm5GKIpS18XYiXv+z+7/U/kwd+GUJe8PNT6N15MJSqKLDnrUrhiGqIkkzWwllKBIKtOlmyQ6xSWX5Z/ilsDO1+UeKS3gvjs2vtDX4TbK8bI63VbNz2zuvzGf5ERfW9vYlwCECgYEAz3QHFzl1h3R59xRgPeJNlXxtoXRJUoEdfkaA9Pxjtek8CUTXlVXRNEfrzp38Pz2amy2O5u+f1zt8htEM7FQGT7ITzcoMjRqKKP8CviOmBmbnwvFuKBbcStDLppL2DgsT6XHffL4Ub3plwDXIcAIhLK9XuREpdogILUyqqc6yXlMCgYEAwQMM4D3GPuEA/N5QMMGKhyYMSvZFj7vI+FIBCnePbzYrGf7x+Fm5YRAatPlwgZdUObWI+qe10JLwntLMWHZSsZcCBkjJZ6GdETozOgCmv2wRsvbG1f3NuZsWk8r7ouYoqpdHCnW17gE6g8tiPiykVSE510mQggFe24JPIvcqGaECgYEAoMnSMRr0z+7kFS/yxCQhc+pD4m6J4et224dzre3srnK+eISl/vXLtxTDXJowhyeNLBbsemthXOWbR7bBqG4bkit4k/i1L6xRRyMXkh15Md8SZJLRiTrmtQoNveaL1Sia30XGLR36IskgEhDdcIsGAWdJu4Pkuh0HEW0pnYE52EcCgYBN1SkQFFkpahq33f6AasuuDE3QvNb4S0WTvZ3l1qjks/dVmFWDTMtQtOnQKPaRi7DPRMFkMtVCsr6NjXwSAEUAkGCkoB13yNhJ5ipaLYEQmEfa32D3Uk3vlvbXyncHDcFAaZigQy+GNsCd/Ro08FOkcK2ef2/ivSK/aiD3fKxhgQKBgBdobh6OkMlz0F1JcvuyTj3D73aQu/DxsoTHKtm0UK+pcCABIl9RDyyuqET9pjnvBfL41CJVbkeJBVxmph63g3T/WU4gMOmS4Wab2gmz/99feVkUjfuuo11mhzlPfIJx0JmJH+oBX1KssIyaNGEDL5UWyNq4VgGC0Bmhqa1+ya7E');
INSERT INTO public.component_config VALUES ('8b0042b9-9cfa-4fba-b10b-d893df88e006', 'e5b9178b-cb9f-4763-88ac-aae5e6845a4d', 'certificate', 'MIICmzCCAYMCBgGLmvGymDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMTA0MTUyNTEzWhcNMzMxMTA0MTUyNjUzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCcaPIjv4He5aOm58Qp9qf2EnYzlFbsMX3Na9wPt8QxjyUY6ham+SyHz/JzqikOnQ0lD3iP3M3wX/r/HgXJYAvfuZSpgcADYBodhQNAnDDvWPNRc5mmwYkvmvGBp2rwVUzAhBjaee0jpG+qTTuT8kCOUa0De2SoMXV2RkCp9WDtjPVUu1gQexyzUYbrTbHRVBIVYM+1LTG32BiwPayc1fTozoixvqT1x/11B5qGy5PyXzu4dw+KQXUiDb9LwKsUzmSD3AV8oaLrtSfD48jjyIM6a2P1OhJS6bCSgVWkycCJ45ooiy7/6s196I+V8/9I2196kKP+pMpU5DYeEEX4AW0zAgMBAAEwDQYJKoZIhvcNAQELBQADggEBABseiEyHxLTbl7y//gM2irk+deAWm1pmSKRjQ+4zrhhvpBBsAbPqaqfPI1I3x9HAmNtLmGJkVcZF9sYgXage9KJOIjY8AqQjaYd8m2QzHElI+ljCgY5SB8UNJ3tY/M+eWezQgtirhlaWTg9xNy6VmqOzzt4FsCRIIwhNPk16Z2dXKsQFoPCKbGkWMQIDUlgebpdNBSsol1ZddsnVBycKVgT05iFvtZxe3bh6GI9J71Oql7IkyUXhiWcy9fs06jeiFZit7tma/zfZ1vjSrUaT0Rh94YvnEpziLu2Cuuw5JQ7EpFRofLwbh2C22+v6G8EGPAe03BOI1/A6nx7pr7uVEvw=');
INSERT INTO public.component_config VALUES ('1a6ff4fe-f073-444a-9423-5c3b7c2669ca', 'e5b9178b-cb9f-4763-88ac-aae5e6845a4d', 'algorithm', 'RSA-OAEP');
INSERT INTO public.component_config VALUES ('6461f8cb-1f63-44a4-a6d8-f21a0e9d5cc4', '88512e95-9b61-4379-baba-d28283362d65', 'priority', '100');
INSERT INTO public.component_config VALUES ('2b1dcd57-a7fa-40ea-822b-22c47698d708', '88512e95-9b61-4379-baba-d28283362d65', 'kid', '840ed636-7aa9-47f5-b302-8c72d61e8e1c');
INSERT INTO public.component_config VALUES ('cb75edb0-219c-404f-be90-bfc5871d06ef', '88512e95-9b61-4379-baba-d28283362d65', 'secret', 'wKPWm5N5kiFRywLo1ngEEw');
INSERT INTO public.component_config VALUES ('ab309004-c120-4afe-9895-e620446c95ad', '11c9bee2-bf75-471c-8de8-286980530d10', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('d4a14e21-f896-41ee-95b2-fdce9c3ea1ee', '11c9bee2-bf75-471c-8de8-286980530d10', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('249c007d-d833-4fe9-aeed-694bc145229c', '543ef0e8-1b64-436a-829f-f8d57819eb45', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('c2158371-3da2-4bb4-a1a0-67abd220e1da', '28c2acd4-f5c7-4e0a-80b8-eac67ea5991c', 'priority', '100');
INSERT INTO public.component_config VALUES ('089b73f4-888b-446b-84c3-cf2ebd37d46d', '28c2acd4-f5c7-4e0a-80b8-eac67ea5991c', 'kid', '22d961a4-5972-49bd-8056-8c06dd15fc5c');
INSERT INTO public.component_config VALUES ('75c243ad-a738-4efd-bf44-f340cd3a1238', '28c2acd4-f5c7-4e0a-80b8-eac67ea5991c', 'secret', 'nbDdk3F9WOk0gRumM6yJZA');
INSERT INTO public.component_config VALUES ('608f2c3a-0d09-4b46-9781-f6c16ff08a3e', '7b62deb1-030d-4800-b41c-bd5398080ed2', 'privateKey', 'MIIEowIBAAKCAQEAswgLmA5pVF8qy9/BzGfvaQHFwSqQ8Xg2XbniLtgyEerho+XQT3Yo22biowXAt/aVNiB5pJ9+Not1leaR7KDi1OxKzQHMk5FZWUVrxnYYHw6hxMKlt5ltaW/+7ODTJmtKmFXSO7w09G9huklbr/eDN/1OVtriShMT3PdcFRiFxMfRwG5GYWo7JiNrqibVhJ/dLR8MAzZZAxo7b9fK5IPeuU+DxVfzqOodXNXuML47W9YiXPWEmFt+CWR7VV/djGaEeziGmv8L7z5naqcrH1ckEqiX8K/ALd30mQN5+mXJoiFCVnkkeYVgkSv5DjpM8lXqKgTtpwyD5uSEPiLrA1QbewIDAQABAoIBACSvUFjfExwzx/wwpHBzF66nq1LymvKv1EwOS9eXe2MKgyPncnDl4GdcxLHs+tl3UInfy6089UrN9tE5hss7CF/i70zkwnu2e918CSKIjlbG08USsYxWhwHk7hKx2vJzZ7yhUUvmO9+edyMJ5xy+lgfCAuxvO5E8KYTMtvSnqrlwdF8rKJkBNX59lsr7aIIp4aEXLh6KPiifGXJtHWZpPmh/HnE+P0BvebweCHFivZwiQxHrRkgNu9I6oEYd8sOPb3n1XzbFt09BuNSur+2LSg3q5QN+ZjJafQzLa+yUWHzgl6zAgvzxb8T8Ig+YtWt/TpezNklJJ12dZlOPLxwG7ukCgYEA6waiIMKl1W4PtD9tV80eK59Mevs5XYWa6IUz+ilLNyPqVORzZCNP0fEOTkCMRrMvLg0TS2J+ChxP2j5x+8Ah5nacmaHdChugU1BSb/ywk06b3zX6/dAULUYpaJqFtfQfrHM8GOMYFBoTBy/XTsNd+I6ObrGCmjLvZ4A5RZGA5U0CgYEAwwIrnrnIkAuNo7HTmS0P49zEV2Os504LSOX6TvoeHz+U5kdh8vYx/xmB4X0bYoqmKzrP8CKD/dSExMMCOYlGrOYcXtDkR2OLUZL0AvrwFLetuxrVhAjKklKOkFXmbHPwJrRSAC3badCGXee2hxKRzSOim8Xy0w9tYh0azC1Uf+cCgYEAvPyhhExhA2W0VRGnwDGdcCBxZHb9YvmbXhw2dpOb+uPze34UV9KZTc1T3pLC+dr+Nj6nZDf39/NaNrl9+J0/5U09kcB5uLYMTtJI5+o+psVQS8XhZRVcFCfWBloy6OQ8T/R9v9lktE1fPak3rgslVkhzugkdZxdMMWMHKqzdBAUCgYBwfBEDNrEM/c0OzmV65rZSvqZ2riUvKyJxQ08WPUogxkEyb5x9VCvUtTbpBYxFVCqzpvII1zABu5N2F/Jxk9CzrOxSePYkg7P6MuUTzwGrQaQx2DGvPo7yxjI76YDHsDynZr4iIlF9AO5wvlbYJQr7JIIIjq8Ztb1nqdgqTD+AowKBgCcYn3uC8pUhJBqeREEeTUFWnrBcmeFWW2dbieAzyN5xy8+n43Ho3IWa7RIwc1BKUIFxi7/6nQCz+ftDiU+XMCADoh/XYc0EBvt0cmyELf3XdHBUG9f258C+vvemJmXNhX3569s36uPvToa4HgdE7TJ/a5vJFWVi2dZvm+sb6iVO');
INSERT INTO public.component_config VALUES ('da6257df-7b60-4ad8-9ff2-dd0519e67a5c', '7b62deb1-030d-4800-b41c-bd5398080ed2', 'certificate', 'MIICozCCAYsCBgGLmvXflDANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApib29rLXN0b3JlMB4XDTIzMTEwNDE1Mjk0NloXDTMzMTEwNDE1MzEyNlowFTETMBEGA1UEAwwKYm9vay1zdG9yZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALMIC5gOaVRfKsvfwcxn72kBxcEqkPF4Nl254i7YMhHq4aPl0E92KNtm4qMFwLf2lTYgeaSffjaLdZXmkeyg4tTsSs0BzJORWVlFa8Z2GB8OocTCpbeZbWlv/uzg0yZrSphV0ju8NPRvYbpJW6/3gzf9Tlba4koTE9z3XBUYhcTH0cBuRmFqOyYja6om1YSf3S0fDAM2WQMaO2/XyuSD3rlPg8VX86jqHVzV7jC+O1vWIlz1hJhbfglke1Vf3YxmhHs4hpr/C+8+Z2qnKx9XJBKol/CvwC3d9JkDefplyaIhQlZ5JHmFYJEr+Q46TPJV6ioE7acMg+bkhD4i6wNUG3sCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAd+JPjU6NJXy4AvA5lW9uf3PboVTnNinMCTfEALm5f3bdD3yJ7JXczRGn2/3DhF71wocTgbyCBkETcS3YYgwuzjhz97AI3jRKx+yEVt/YXswqdj6Hrn3OPOtBFe9/zRjqPDqGmfatH2Z0tH4M0U2ZdweRU31N3gFJPwu0lGzHcT1rvUX7aWTHqBdEb1LL4BEAprERyyMI2euykP3Hq3lxFDFqiuJc57ClRPHtT3vBJzpUyLUCEotCHz3fRy6tixIVNFIQOrBwWYzGgMoEP1CO2KIu0t0FC6xMLIkdlWY7hQzep10jOGvRJlb3hlsCarEMksx0Lu/X8+4iuMuoxVo1aQ==');
INSERT INTO public.component_config VALUES ('db1896aa-2985-4072-bfa5-54b52bbad26c', '7b62deb1-030d-4800-b41c-bd5398080ed2', 'priority', '100');
INSERT INTO public.component_config VALUES ('ce355a7b-5af8-4a2b-a413-ee753287ef74', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('d62a2625-cad7-4201-9e72-e979c39d15a9', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('4070b6e2-2ae2-4561-bb3e-8862a1ce9b61', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('e674994b-f846-46c3-b29b-d2d490a5c648', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('4cd99a54-6723-4393-a77f-1158294122cc', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('9d285b86-3504-41b3-86b1-2e764b9d7009', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('1316f7e8-d730-4d0c-910b-68737249e203', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('4aa97b83-e6a7-41b6-b510-8f25bf0939e6', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('9dd1a621-4788-421b-91f7-e886d6bdb51e', '34015fb7-1b62-40f7-b663-fa89661ba939', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('adf197bf-a4bc-4d67-ac89-435c4bba4dcf', 'ed029d0b-6d80-4bdd-a21a-7c909d87d494', 'kid', '7f9d195b-6127-4236-a93b-31ab8eb523f6');
INSERT INTO public.component_config VALUES ('184cba68-d769-4d48-b171-62723be3f8fd', 'ed029d0b-6d80-4bdd-a21a-7c909d87d494', 'priority', '100');
INSERT INTO public.component_config VALUES ('bda8c81f-a938-4ca2-84b2-da0faa4fd4c8', 'ed029d0b-6d80-4bdd-a21a-7c909d87d494', 'secret', 'WBk8j6J5IxX4D-jXDBlewHokb802jiFKsLDAtKaguZ5WEUWP_1ySX8zj9udfKz-iuTYxJQUE7LIfUipi7iNb0w');
INSERT INTO public.component_config VALUES ('27baf9cb-1f01-4325-950f-5dfc4a825f54', 'ed029d0b-6d80-4bdd-a21a-7c909d87d494', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('469c3cc6-f4e9-4f3e-877e-b7fbc090391c', 'f0f2a0a4-b58a-43ed-8035-158c5120b350', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('2ec45206-f9f4-445c-acaa-254a14bc4cde', '1e3a64aa-1eab-42a3-844b-b1aa6799d624', 'privateKey', 'MIIEpAIBAAKCAQEAzSOwgYs3o81IMA/juFA6nXoOkMAFYme5tDdBzf+Zfq1NCp2pGuxYhWfNfiFBtoJU1wzq5aiimFj6ymfmVsySl/Rz2glPkSMr9AeI4EV4Je5gzTLFNTaR4Lu5xpgHbL/Lz6jVWnwcK92kdesxpMyQviy/F4ZX1pqwWWSeRRP2x0HoEn+ZsYkl9JtuAx0GNey7xugkG07kpDU9tZGKx/9ZGrC06H74WgKo6dRYi4XjJw0wP2CpYs/qcqhI73kysYu7qmQQslHc2N9v1DQ9/N60fVteJ2FAb31YJWuJMjkCnCCps1u0HfAPyVb2yOiDL9WoV0/78NxYBgV3UmScLuFUcQIDAQABAoIBAB9JISMwo0S1CxxhX/59JeNceRo0Xt3aKeVFRCDxqWw7a/OBhgfYIcv+v8VLtyTpjZzamHx8EogfkegKnoOAYZ8RJhYLs3nUHmDyQTrK/X7zcwn4g0ERWIAowTV7fC5mteOuwRMyuG0sOWfOfdy/YhfO5TnmQEE3iEup38VzPQC4U2+bT5kBNk22HZDsJLq+5CrR6vMOVi8uTBTtup8AaQqvkFnWtvUZU8pviEJ+sjjKVgpkjVWCai2BFdZPfnUxTRuOOyxpj+KXkvKx5d+xeMglwgEyN8U1Ax3dBm6LBioF/Wg+e/BP54R3Kpt3P5pgQfSRceZQB1ON0gc+l8eyM30CgYEA85wHnNMc2FKnEbzK/PtQbTx69N8IHGf2c62rLf3xf79Fm3LkefpYDL7FS5fAstDneRcrHT89jOds0EQm7bjq/3P+ma4eClBaqAH5bsaeoeF+g2Afmns2kgSztz8cW9cgEBlLpyOlc2PQrGixa6P9Uo7EM49RJFMypTTTpICX+tsCgYEA15LAcPAgWndzwF5aStOAzQYvdquVGZgOCpHAuSFeCqjHdVJ8lUa85oCsk8BxflCm4ppz5V9VNcTuZMiWnD33yRLjaPbQTxwqLJnIdZPbMoGsL7YqwFMTNQJCwxRlmq3YLAYz52ivyS8UcJLuqD4dH2Lg6GCsvQT8Uv9aVbKxQaMCgYEAzAtbwPp/BZ4tO8kjSMSDeAuZfXM2Svy1S+0iHTK/zd16wxp3zsdmar57aLah++TIjP9f6G5o8pWA6ey7opApnXAdx8E0fjURyfllYGjSxAqougeQUQd1DNcNZKZi7XYB8BoP6N4Nndn0FgTW3q8L5tOX+QvIziE1oXTe9MGVCtMCgYBdbikhybD8BJGSalJP4+MK+QdRM4Rnl1NemVUh56hOjmAEJUABoqr0bAhf8SQ/Ts1FoRNh8jOIHlYEMDu2c9UUvK77Kx2Va+uLcQtEilSSS0lJVHaq7FaCvvwYeJqgs3/hdL7CKMknNNRzBfuRx3nvxHcdv+id8684eZu5UL0qaQKBgQDS8gHVtYoryAAKALwWHN6pieAc2bIr4yOwmQO9wc10SPw3+cX/u4zE/CalhVUVQ6V3G+VmRPf8bkvoPsJgUbU3zzqR3eJiUt1TLZquQz27odcHFg+xNMFQOwAvVZpmZr4N7Uq+qmFEynIuyWxWp+sYvHgKnk52Dxj/mTwd+AsahA==');
INSERT INTO public.component_config VALUES ('09cebd89-ad82-4ffc-bb3b-659b57c34f41', '1e3a64aa-1eab-42a3-844b-b1aa6799d624', 'priority', '100');
INSERT INTO public.component_config VALUES ('90145515-8056-441e-ad56-2c094b855712', '1e3a64aa-1eab-42a3-844b-b1aa6799d624', 'certificate', 'MIICozCCAYsCBgGLmvXgYzANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApib29rLXN0b3JlMB4XDTIzMTEwNDE1Mjk0NloXDTMzMTEwNDE1MzEyNlowFTETMBEGA1UEAwwKYm9vay1zdG9yZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAM0jsIGLN6PNSDAP47hQOp16DpDABWJnubQ3Qc3/mX6tTQqdqRrsWIVnzX4hQbaCVNcM6uWoophY+spn5lbMkpf0c9oJT5EjK/QHiOBFeCXuYM0yxTU2keC7ucaYB2y/y8+o1Vp8HCvdpHXrMaTMkL4svxeGV9aasFlknkUT9sdB6BJ/mbGJJfSbbgMdBjXsu8boJBtO5KQ1PbWRisf/WRqwtOh++FoCqOnUWIuF4ycNMD9gqWLP6nKoSO95MrGLu6pkELJR3Njfb9Q0PfzetH1bXidhQG99WCVriTI5ApwgqbNbtB3wD8lW9sjogy/VqFdP+/DcWAYFd1JknC7hVHECAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAzJMCax2l5FTpQgkE7YfZGSDhhilSA682voQe+kFenytkFvWRMLrCMCm9JpUuYJ1+qQa1TXAGuqQo+QAepFJrVQmnwaPT/ngFLBVL4f1hgGW/PZiBBgMzFX71EHjgllWdmfxg/g38AJL69J0EuV9o2Bm7mBqTEAEA5ovShhc8kzerNQ10AjIsH7XeekaZHSZA/zV+cExxCg31PxK1BeMieAuYSJZQ7vDd4R4Mg7XWNup3a9dXp3UTOF/AfnH9I8qAsdr5oP0pnRd1CkDL7IrUHW1KELp/WKF2A4vrLMRg7+CwdyuOpHi27WUk4XdMrpBk8fxl8+bvNP6yUn71KSHwnw==');
INSERT INTO public.component_config VALUES ('35e44402-8af3-4a8b-9fc2-2be3c8cf566d', '1e3a64aa-1eab-42a3-844b-b1aa6799d624', 'algorithm', 'RSA-OAEP');
INSERT INTO public.component_config VALUES ('6c5a9602-1566-45ec-bc0f-e441fe5fb824', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('49783fa2-f907-4b59-91a8-7f05fedb784f', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('db1546b3-91b6-4ca3-8d11-7665a13461f9', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('c413e4ef-a658-4582-830e-89b4eab6fd0f', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('f7225c80-887f-4af5-965f-adb810f09acb', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('46ac375b-4e4b-4bb3-897f-86e944156248', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('62c45d5c-9820-4e12-a18c-96cc83118afc', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('b890b1bf-c149-4c27-b2bd-dc96ef65de4b', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', 'd4e4c452-9906-4664-bb07-8bfc419adc31');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', 'e8897997-bd8b-4328-ae34-318f12345dfb');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '5bbc397a-64db-457f-a7c3-aa312c18b62f');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', 'f5908384-8f1f-4646-aa66-6862a2561226');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '59120404-16ed-40a1-abde-6f196bc18d31');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', 'dba239ff-4101-45dd-8778-60262cb11337');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '47d289ce-b978-4fc0-af19-a9f36f4f8f45');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '9603a1b3-0688-4572-83a5-890dbafb6dfb');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '231c9f3f-c7de-48f8-a964-e38fe8986cc5');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '5f394f75-75b2-43c4-b76e-8f3ea81922b7');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '955ef3bb-64e2-4587-b0ad-88affec8aa31');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '5c589d76-94d1-470b-bc30-e4392a21c7e8');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '946df397-507a-4f5e-adf9-2254be5da4fd');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', 'e6efd7d2-83bd-4cbd-a8a2-fd3d9017b482');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '8bc1be71-5298-4106-8636-5dedecd42156');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', 'f7b543e2-4852-435d-8df7-f3cd48e8ed32');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '6a18b443-8bd1-451d-af26-b32c26a697cf');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', 'bb6a9ee5-b6c4-48c1-b2c0-2441cb6b400f');
INSERT INTO public.composite_role VALUES ('59120404-16ed-40a1-abde-6f196bc18d31', 'f7b543e2-4852-435d-8df7-f3cd48e8ed32');
INSERT INTO public.composite_role VALUES ('f5908384-8f1f-4646-aa66-6862a2561226', 'bb6a9ee5-b6c4-48c1-b2c0-2441cb6b400f');
INSERT INTO public.composite_role VALUES ('f5908384-8f1f-4646-aa66-6862a2561226', '8bc1be71-5298-4106-8636-5dedecd42156');
INSERT INTO public.composite_role VALUES ('f5c83ef0-54a2-4cfd-9aef-953eb769bc24', '0849954c-759f-4286-ba61-e7f81b241ed2');
INSERT INTO public.composite_role VALUES ('f5c83ef0-54a2-4cfd-9aef-953eb769bc24', 'f715c4c7-58a5-4621-9668-07a2e7a9b13c');
INSERT INTO public.composite_role VALUES ('f715c4c7-58a5-4621-9668-07a2e7a9b13c', 'b51d07e4-c898-4f7f-a6e9-37415caa7eee');
INSERT INTO public.composite_role VALUES ('b69e49a1-8bbf-47d8-bbac-d44e229dd61d', '3f7607bc-5f44-4617-af35-25e6a107dd97');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', 'b9f3ddba-6c67-4595-83fc-6fd73bcbe6b3');
INSERT INTO public.composite_role VALUES ('f5c83ef0-54a2-4cfd-9aef-953eb769bc24', '6cd1d71f-8bd3-4ce8-8617-70a2f0d13f2f');
INSERT INTO public.composite_role VALUES ('f5c83ef0-54a2-4cfd-9aef-953eb769bc24', '49552b6e-353e-49d6-9523-2a2bf9fb1910');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', 'b6d67654-8192-4fbd-9693-edb0089645bf');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '3e62bc95-fcdb-4560-86dc-1f7492966e58');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', 'db79a392-8f97-4be0-a090-bf04885e4c19');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '2987d87b-d691-4c02-a5f9-356980b00f15');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '70b446d3-d46e-4750-9fbf-d3506a5a4bff');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '6d685d4c-c46d-4cf2-89b9-9a779212feee');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '8c1dd062-7952-41dd-b67e-78c33d002c05');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '02ad528d-b5d8-45db-8f50-beb336236bba');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', 'c9e09ad0-2b56-4f19-a1d6-56f598198df4');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '662013f4-50ea-48f8-8c71-aeaf59a05233');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', 'af71130f-3a73-4189-a270-0c92a1d49f4c');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '9bbeb1c8-455d-4f3c-9e2f-400be7fef098');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '42dc3456-a774-49de-8694-4785fbda47f5');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '9c971d51-2aed-4260-aa20-6008cca90773');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '733e1931-97e9-48a1-93c4-6e4e628222fd');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '662e4b28-ad11-437f-a056-7aba337433c8');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '317d16ec-c3fa-48b2-b087-fe4b5b801736');
INSERT INTO public.composite_role VALUES ('2987d87b-d691-4c02-a5f9-356980b00f15', '733e1931-97e9-48a1-93c4-6e4e628222fd');
INSERT INTO public.composite_role VALUES ('db79a392-8f97-4be0-a090-bf04885e4c19', '317d16ec-c3fa-48b2-b087-fe4b5b801736');
INSERT INTO public.composite_role VALUES ('db79a392-8f97-4be0-a090-bf04885e4c19', '9c971d51-2aed-4260-aa20-6008cca90773');
INSERT INTO public.composite_role VALUES ('1d014aad-d78d-4d6e-a18e-007b4247c731', '518de179-f981-474e-a930-30ff40d71485');
INSERT INTO public.composite_role VALUES ('48da3971-f37a-4003-bcae-67a25accaf33', '1b1241dc-4149-4f47-9716-0bf9164f28bc');
INSERT INTO public.composite_role VALUES ('48da3971-f37a-4003-bcae-67a25accaf33', '3c0778e1-20ac-41dd-a795-2f3ed41bd16d');
INSERT INTO public.composite_role VALUES ('4e302eed-87cf-4d0d-ac6a-b61a8f572869', '7d51f745-ba15-4029-b447-413611d40980');
INSERT INTO public.composite_role VALUES ('80d5ecbf-7ad1-4efe-bb2f-0d7663a9794a', '5ab5252f-0b48-4350-83da-cbfe7bf68216');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', '5ab5252f-0b48-4350-83da-cbfe7bf68216');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', '7cab75de-3140-4516-959e-9ecfe8ce7d08');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', 'bbec352c-a21f-4fb3-a87c-1a6c896f3c68');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', '80d5ecbf-7ad1-4efe-bb2f-0d7663a9794a');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', '61a5a0dc-70ed-4b35-beaa-4f93752b1a4e');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', 'e4de045d-46cc-4a24-afa4-5bbd417184a4');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', '3c0778e1-20ac-41dd-a795-2f3ed41bd16d');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', 'e4af1dd8-2297-4494-8c1c-b82a4f445243');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', '96977b5e-bfcc-4efc-a4b5-a7a6851e61c4');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', '3e63287d-e819-4f2f-9d7b-6f3252c82777');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', '28aab02c-54cf-4cdc-a12f-20c108a261fb');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', '968c1a85-d180-4a25-80e2-41242a29cb8c');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', '0bc58bad-6fa9-4f44-a055-fde93bc3e6f9');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', '41fb88d5-a524-4bf1-9b12-67631dbcf2b9');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', '1b1241dc-4149-4f47-9716-0bf9164f28bc');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', '48da3971-f37a-4003-bcae-67a25accaf33');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', 'f851b627-91a1-4e05-b45f-401642084157');
INSERT INTO public.composite_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', 'e0cfdcc8-0a08-4b43-99f6-4497bef9438d');
INSERT INTO public.composite_role VALUES ('c46a9467-cb5a-4888-b8c1-fd6623005642', '3ee02316-c4b1-4356-9228-e93bec6d8d45');
INSERT INTO public.composite_role VALUES ('c46a9467-cb5a-4888-b8c1-fd6623005642', '40c61ed7-5a24-4dcb-96b1-730cd85f219d');
INSERT INTO public.composite_role VALUES ('c46a9467-cb5a-4888-b8c1-fd6623005642', '1d014aad-d78d-4d6e-a18e-007b4247c731');
INSERT INTO public.composite_role VALUES ('c46a9467-cb5a-4888-b8c1-fd6623005642', 'dcf96f4f-79fc-4394-ac8e-4a516c653ba4');
INSERT INTO public.composite_role VALUES ('c46a9467-cb5a-4888-b8c1-fd6623005642', '7748dc9a-b619-4185-93cc-ef0fcf41ccc8');
INSERT INTO public.composite_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', 'c2c44216-c568-4dd2-b255-096023f36178');


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.credential VALUES ('2f9cb0ec-12bd-4044-85c7-ee5ece111c97', NULL, 'password', 'dfe6cbce-8259-403d-8c56-b0706e742b96', 1699111613618, NULL, '{"value":"lGbS3NcPimsWc+4EvZD83qJm+wl93OtHIk5oSvNSfrY=","salt":"OFBMMTYEHUFbnP7Mc7Z8ww==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('ff88d825-86c2-470a-b014-628ebbc03516', NULL, 'password', '0eaf28c1-4cb9-48c9-bcb7-4f08d454a5e0', 1699111906910, 'My password', '{"value":"tldsAg7JOEP+wtKdYh2CoRPozm7r1POyaRDutm2oR3U=","salt":"SBPXj5Dqe2Z3bjbqGBVL7Q==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('8215fd5b-d42d-4697-9bbd-a83d0d895adc', NULL, 'password', '9093dfb6-921a-4720-9e61-48d9afca806f', 1699112166367, NULL, '{"value":"C7rIDQ/ShE3LYtCuZHGvjkgvRviU18XD91Jz3NKYAfw=","salt":"1tk7bDpjGKUn/Ah7eJpEZQ==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('d065f747-7b00-4c85-ba47-f6cb9cd65b26', NULL, 'password', '311bc161-8782-4ea5-b781-a81bad2fda49', 1699112186337, NULL, '{"value":"xf9cQNGl7oqiH+Z5qXpwsULfmmpL6q0LDdRBmq7ARmk=","salt":"qMtXaJOTYm1AAiDr7J3BHg==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml', '2023-11-04 15:26:49.282605', 1, 'EXECUTED', '8:bda77d94bf90182a1e30c24f1c155ec7', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml', '2023-11-04 15:26:49.287633', 2, 'MARK_RAN', '8:1ecb330f30986693d1cba9ab579fa219', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2023-11-04 15:26:49.333256', 3, 'EXECUTED', '8:cb7ace19bc6d959f305605d255d4c843', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2023-11-04 15:26:49.340177', 4, 'EXECUTED', '8:80230013e961310e6872e871be424a63', 'renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2023-11-04 15:26:49.469876', 5, 'EXECUTED', '8:67f4c20929126adc0c8e9bf48279d244', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2023-11-04 15:26:49.473188', 6, 'MARK_RAN', '8:7311018b0b8179ce14628ab412bb6783', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2023-11-04 15:26:49.569528', 7, 'EXECUTED', '8:037ba1216c3640f8785ee6b8e7c8e3c1', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2023-11-04 15:26:49.575515', 8, 'MARK_RAN', '8:7fe6ffe4af4df289b3157de32c624263', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2023-11-04 15:26:49.582893', 9, 'EXECUTED', '8:9c136bc3187083a98745c7d03bc8a303', 'update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2023-11-04 15:26:49.70136', 10, 'EXECUTED', '8:b5f09474dca81fb56a97cf5b6553d331', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2023-11-04 15:26:49.769643', 11, 'EXECUTED', '8:ca924f31bd2a3b219fdcfe78c82dacf4', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2023-11-04 15:26:49.772465', 12, 'MARK_RAN', '8:8acad7483e106416bcfa6f3b824a16cd', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2023-11-04 15:26:49.795934', 13, 'EXECUTED', '8:9b1266d17f4f87c78226f5055408fd5e', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2023-11-04 15:26:49.842251', 14, 'EXECUTED', '8:d80ec4ab6dbfe573550ff72396c7e910', 'addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2023-11-04 15:26:49.845585', 15, 'MARK_RAN', '8:d86eb172171e7c20b9c849b584d147b2', 'delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2023-11-04 15:26:49.848694', 16, 'MARK_RAN', '8:5735f46f0fa60689deb0ecdc2a0dea22', 'dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2023-11-04 15:26:49.851898', 17, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2023-11-04 15:26:49.89842', 18, 'EXECUTED', '8:5c1a8fd2014ac7fc43b90a700f117b23', 'createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2023-11-04 15:26:49.953527', 19, 'EXECUTED', '8:1f6c2c2dfc362aff4ed75b3f0ef6b331', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2023-11-04 15:26:49.961893', 20, 'EXECUTED', '8:dee9246280915712591f83a127665107', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2023-11-04 15:26:49.964927', 21, 'MARK_RAN', '8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2023-11-04 15:26:49.969447', 22, 'MARK_RAN', '8:dee9246280915712591f83a127665107', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2023-11-04 15:26:49.998343', 23, 'EXECUTED', '8:d9fa18ffa355320395b86270680dd4fe', 'update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2023-11-04 15:26:50.005652', 24, 'EXECUTED', '8:90cff506fedb06141ffc1c71c4a1214c', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2023-11-04 15:26:50.008799', 25, 'MARK_RAN', '8:11a788aed4961d6d29c427c063af828c', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2023-11-04 15:26:50.074308', 26, 'EXECUTED', '8:a4218e51e1faf380518cce2af5d39b43', 'createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2023-11-04 15:26:50.182208', 27, 'EXECUTED', '8:d9e9a1bfaa644da9952456050f07bbdc', 'createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2023-11-04 15:26:50.187356', 28, 'EXECUTED', '8:d1bf991a6163c0acbfe664b615314505', 'update tableName=RESOURCE_SERVER_POLICY', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('2.1.0-KEYCLOAK-5461', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2023-11-04 15:26:50.304443', 29, 'EXECUTED', '8:88a743a1e87ec5e30bf603da68058a8c', 'createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2023-11-04 15:26:50.326391', 30, 'EXECUTED', '8:c5517863c875d325dea463d00ec26d7a', 'addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2023-11-04 15:26:50.347265', 31, 'EXECUTED', '8:ada8b4833b74a498f376d7136bc7d327', 'createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2023-11-04 15:26:50.354322', 32, 'EXECUTED', '8:b9b73c8ea7299457f99fcbb825c263ba', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2023-11-04 15:26:50.366643', 33, 'EXECUTED', '8:07724333e625ccfcfc5adc63d57314f3', 'customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2023-11-04 15:26:50.37012', 34, 'MARK_RAN', '8:8b6fd445958882efe55deb26fc541a7b', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2023-11-04 15:26:50.407638', 35, 'EXECUTED', '8:29b29cfebfd12600897680147277a9d7', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml', '2023-11-04 15:26:50.413594', 36, 'EXECUTED', '8:73ad77ca8fd0410c7f9f15a471fa52bc', 'addColumn tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2023-11-04 15:26:50.424656', 37, 'EXECUTED', '8:64f27a6fdcad57f6f9153210f2ec1bdb', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2023-11-04 15:26:50.432912', 38, 'EXECUTED', '8:27180251182e6c31846c2ddab4bc5781', 'addColumn tableName=FED_USER_CONSENT', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2023-11-04 15:26:50.439276', 39, 'EXECUTED', '8:d56f201bfcfa7a1413eb3e9bc02978f9', 'addColumn tableName=IDENTITY_PROVIDER', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2023-11-04 15:26:50.442105', 40, 'MARK_RAN', '8:91f5522bf6afdc2077dfab57fbd3455c', 'addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2023-11-04 15:26:50.445331', 41, 'MARK_RAN', '8:0f01b554f256c22caeb7d8aee3a1cdc8', 'dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix-offline-sessions', 'hmlnarik', 'META-INF/jpa-changelog-3.2.0.xml', '2023-11-04 15:26:50.451667', 42, 'EXECUTED', '8:ab91cf9cee415867ade0e2df9651a947', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2023-11-04 15:26:50.733117', 43, 'EXECUTED', '8:ceac9b1889e97d602caf373eadb0d4b7', 'addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2023-11-04 15:26:50.740577', 44, 'EXECUTED', '8:84b986e628fe8f7fd8fd3c275c5259f2', 'addColumn tableName=USER_ENTITY', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2023-11-04 15:26:50.748681', 45, 'EXECUTED', '8:a164ae073c56ffdbc98a615493609a52', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2023-11-04 15:26:50.754506', 46, 'EXECUTED', '8:70a2b4f1f4bd4dbf487114bdb1810e64', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2023-11-04 15:26:50.757447', 47, 'MARK_RAN', '8:7be68b71d2f5b94b8df2e824f2860fa2', 'dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2023-11-04 15:26:50.80957', 48, 'EXECUTED', '8:bab7c631093c3861d6cf6144cd944982', 'addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2023-11-04 15:26:50.81536', 49, 'EXECUTED', '8:fa809ac11877d74d76fe40869916daad', 'addColumn tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('3.4.0', 'keycloak', 'META-INF/jpa-changelog-3.4.0.xml', '2023-11-04 15:26:50.895104', 50, 'EXECUTED', '8:fac23540a40208f5f5e326f6ceb4d291', 'addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('3.4.0-KEYCLOAK-5230', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-3.4.0.xml', '2023-11-04 15:26:50.964516', 51, 'EXECUTED', '8:2612d1b8a97e2b5588c346e817307593', 'createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('3.4.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-3.4.1.xml', '2023-11-04 15:26:50.971825', 52, 'EXECUTED', '8:9842f155c5db2206c88bcb5d1046e941', 'modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('3.4.2', 'keycloak', 'META-INF/jpa-changelog-3.4.2.xml', '2023-11-04 15:26:50.977342', 53, 'EXECUTED', '8:2e12e06e45498406db72d5b3da5bbc76', 'update tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('3.4.2-KEYCLOAK-5172', 'mkanis@redhat.com', 'META-INF/jpa-changelog-3.4.2.xml', '2023-11-04 15:26:50.982337', 54, 'EXECUTED', '8:33560e7c7989250c40da3abdabdc75a4', 'update tableName=CLIENT', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-6335', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2023-11-04 15:26:50.995379', 55, 'EXECUTED', '8:87a8d8542046817a9107c7eb9cbad1cd', 'createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('4.0.0-CLEANUP-UNUSED-TABLE', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2023-11-04 15:26:51.003243', 56, 'EXECUTED', '8:3ea08490a70215ed0088c273d776311e', 'dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-6228', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2023-11-04 15:26:51.039196', 57, 'EXECUTED', '8:2d56697c8723d4592ab608ce14b6ed68', 'dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-5579-fixed', 'mposolda@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2023-11-04 15:26:51.174131', 58, 'EXECUTED', '8:3e423e249f6068ea2bbe48bf907f9d86', 'dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('authz-4.0.0.CR1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.CR1.xml', '2023-11-04 15:26:51.219608', 59, 'EXECUTED', '8:15cabee5e5df0ff099510a0fc03e4103', 'createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('authz-4.0.0.Beta3', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.Beta3.xml', '2023-11-04 15:26:51.225321', 60, 'EXECUTED', '8:4b80200af916ac54d2ffbfc47918ab0e', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('authz-4.2.0.Final', 'mhajas@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2023-11-04 15:26:51.234066', 61, 'EXECUTED', '8:66564cd5e168045d52252c5027485bbb', 'createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('authz-4.2.0.Final-KEYCLOAK-9944', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2023-11-04 15:26:51.243613', 62, 'EXECUTED', '8:1c7064fafb030222be2bd16ccf690f6f', 'addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('4.2.0-KEYCLOAK-6313', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.2.0.xml', '2023-11-04 15:26:51.249018', 63, 'EXECUTED', '8:2de18a0dce10cdda5c7e65c9b719b6e5', 'addColumn tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('4.3.0-KEYCLOAK-7984', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.3.0.xml', '2023-11-04 15:26:51.253323', 64, 'EXECUTED', '8:03e413dd182dcbd5c57e41c34d0ef682', 'update tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-7950', 'psilva@redhat.com', 'META-INF/jpa-changelog-4.6.0.xml', '2023-11-04 15:26:51.25924', 65, 'EXECUTED', '8:d27b42bb2571c18fbe3fe4e4fb7582a7', 'update tableName=RESOURCE_SERVER_RESOURCE', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-8377', 'keycloak', 'META-INF/jpa-changelog-4.6.0.xml', '2023-11-04 15:26:51.281991', 66, 'EXECUTED', '8:698baf84d9fd0027e9192717c2154fb8', 'createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-8555', 'gideonray@gmail.com', 'META-INF/jpa-changelog-4.6.0.xml', '2023-11-04 15:26:51.294821', 67, 'EXECUTED', '8:ced8822edf0f75ef26eb51582f9a821a', 'createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('4.7.0-KEYCLOAK-1267', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.7.0.xml', '2023-11-04 15:26:51.30202', 68, 'EXECUTED', '8:f0abba004cf429e8afc43056df06487d', 'addColumn tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('4.7.0-KEYCLOAK-7275', 'keycloak', 'META-INF/jpa-changelog-4.7.0.xml', '2023-11-04 15:26:51.319128', 69, 'EXECUTED', '8:6662f8b0b611caa359fcf13bf63b4e24', 'renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('4.8.0-KEYCLOAK-8835', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.8.0.xml', '2023-11-04 15:26:51.328069', 70, 'EXECUTED', '8:9e6b8009560f684250bdbdf97670d39e', 'addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('authz-7.0.0-KEYCLOAK-10443', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-7.0.0.xml', '2023-11-04 15:26:51.336852', 71, 'EXECUTED', '8:4223f561f3b8dc655846562b57bb502e', 'addColumn tableName=RESOURCE_SERVER', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('8.0.0-adding-credential-columns', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2023-11-04 15:26:51.350323', 72, 'EXECUTED', '8:215a31c398b363ce383a2b301202f29e', 'addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-not-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2023-11-04 15:26:51.358599', 73, 'EXECUTED', '8:83f7a671792ca98b3cbd3a1a34862d3d', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2023-11-04 15:26:51.370636', 74, 'MARK_RAN', '8:f58ad148698cf30707a6efbdf8061aa7', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('8.0.0-credential-cleanup-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2023-11-04 15:26:51.391835', 75, 'EXECUTED', '8:79e4fd6c6442980e58d52ffc3ee7b19c', 'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('8.0.0-resource-tag-support', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2023-11-04 15:26:51.40399', 76, 'EXECUTED', '8:87af6a1e6d241ca4b15801d1f86a297d', 'addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('9.0.0-always-display-client', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2023-11-04 15:26:51.410014', 77, 'EXECUTED', '8:b44f8d9b7b6ea455305a6d72a200ed15', 'addColumn tableName=CLIENT', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('9.0.0-drop-constraints-for-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2023-11-04 15:26:51.412676', 78, 'MARK_RAN', '8:2d8ed5aaaeffd0cb004c046b4a903ac5', 'dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('9.0.0-increase-column-size-federated-fk', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2023-11-04 15:26:51.435094', 79, 'EXECUTED', '8:e290c01fcbc275326c511633f6e2acde', 'modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('9.0.0-recreate-constraints-after-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2023-11-04 15:26:51.437976', 80, 'MARK_RAN', '8:c9db8784c33cea210872ac2d805439f8', 'addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('9.0.1-add-index-to-client.client_id', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2023-11-04 15:26:51.452487', 81, 'EXECUTED', '8:95b676ce8fc546a1fcfb4c92fae4add5', 'createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2023-11-04 15:26:51.455375', 82, 'MARK_RAN', '8:38a6b2a41f5651018b1aca93a41401e5', 'dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-add-not-null-constraint', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2023-11-04 15:26:51.462313', 83, 'EXECUTED', '8:3fb99bcad86a0229783123ac52f7609c', 'addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2023-11-04 15:26:51.464743', 84, 'MARK_RAN', '8:64f27a6fdcad57f6f9153210f2ec1bdb', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('9.0.1-add-index-to-events', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2023-11-04 15:26:51.475962', 85, 'EXECUTED', '8:ab4f863f39adafd4c862f7ec01890abc', 'createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-11.0.0.xml', '2023-11-04 15:26:51.483223', 86, 'EXECUTED', '8:13c419a0eb336e91ee3a3bf8fda6e2a7', 'dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2023-11-04 15:26:51.499569', 87, 'EXECUTED', '8:e3fb1e698e0471487f51af1ed80fe3ac', 'dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('12.1.0-add-realm-localization-table', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2023-11-04 15:26:51.515599', 88, 'EXECUTED', '8:babadb686aab7b56562817e60bf0abd0', 'createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('default-roles', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 15:26:51.525216', 89, 'EXECUTED', '8:72d03345fda8e2f17093d08801947773', 'addColumn tableName=REALM; customChange', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('default-roles-cleanup', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 15:26:51.534795', 90, 'EXECUTED', '8:61c9233951bd96ffecd9ba75f7d978a4', 'dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('13.0.0-KEYCLOAK-16844', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 15:26:51.550799', 91, 'EXECUTED', '8:ea82e6ad945cec250af6372767b25525', 'createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri-13.0.0', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 15:26:51.559704', 92, 'EXECUTED', '8:d3f4a33f41d960ddacd7e2ef30d126b3', 'dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('13.0.0-KEYCLOAK-17992-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 15:26:51.564656', 93, 'MARK_RAN', '8:1284a27fbd049d65831cb6fc07c8a783', 'dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('13.0.0-increase-column-size-federated', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 15:26:51.579337', 94, 'EXECUTED', '8:9d11b619db2ae27c25853b8a37cd0dea', 'modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('13.0.0-KEYCLOAK-17992-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 15:26:51.582906', 95, 'MARK_RAN', '8:3002bb3997451bb9e8bac5c5cd8d6327', 'addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('json-string-accomodation-fixed', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 15:26:51.591419', 96, 'EXECUTED', '8:dfbee0d6237a23ef4ccbb7a4e063c163', 'addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-11019', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 15:26:51.619139', 97, 'EXECUTED', '8:75f3e372df18d38c62734eebb986b960', 'createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 15:26:51.623524', 98, 'MARK_RAN', '8:7fee73eddf84a6035691512c85637eef', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286-revert', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 15:26:51.63527', 99, 'MARK_RAN', '8:7a11134ab12820f999fbf3bb13c3adc8', 'dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286-supported-dbs', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 15:26:51.648071', 100, 'EXECUTED', '8:c0f6eaac1f3be773ffe54cb5b8482b70', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286-unsupported-dbs', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 15:26:51.652119', 101, 'MARK_RAN', '8:18186f0008b86e0f0f49b0c4d0e842ac', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('KEYCLOAK-17267-add-index-to-user-attributes', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 15:26:51.667049', 102, 'EXECUTED', '8:09c2780bcb23b310a7019d217dc7b433', 'createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('KEYCLOAK-18146-add-saml-art-binding-identifier', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 15:26:51.684247', 103, 'EXECUTED', '8:276a44955eab693c970a42880197fff2', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('15.0.0-KEYCLOAK-18467', 'keycloak', 'META-INF/jpa-changelog-15.0.0.xml', '2023-11-04 15:26:51.692546', 104, 'EXECUTED', '8:ba8ee3b694d043f2bfc1a1079d0760d7', 'addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('17.0.0-9562', 'keycloak', 'META-INF/jpa-changelog-17.0.0.xml', '2023-11-04 15:26:51.703122', 105, 'EXECUTED', '8:5e06b1d75f5d17685485e610c2851b17', 'createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('18.0.0-10625-IDX_ADMIN_EVENT_TIME', 'keycloak', 'META-INF/jpa-changelog-18.0.0.xml', '2023-11-04 15:26:51.715044', 106, 'EXECUTED', '8:4b80546c1dc550ac552ee7b24a4ab7c0', 'createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('19.0.0-10135', 'keycloak', 'META-INF/jpa-changelog-19.0.0.xml', '2023-11-04 15:26:51.721792', 107, 'EXECUTED', '8:af510cd1bb2ab6339c45372f3e491696', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('20.0.0-12964-supported-dbs', 'keycloak', 'META-INF/jpa-changelog-20.0.0.xml', '2023-11-04 15:26:51.739225', 108, 'EXECUTED', '8:05c99fc610845ef66ee812b7921af0ef', 'createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('20.0.0-12964-unsupported-dbs', 'keycloak', 'META-INF/jpa-changelog-20.0.0.xml', '2023-11-04 15:26:51.741826', 109, 'MARK_RAN', '8:314e803baf2f1ec315b3464e398b8247', 'createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('client-attributes-string-accomodation-fixed', 'keycloak', 'META-INF/jpa-changelog-20.0.0.xml', '2023-11-04 15:26:51.748984', 110, 'EXECUTED', '8:56e4677e7e12556f70b604c573840100', 'addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('21.0.2-17277', 'keycloak', 'META-INF/jpa-changelog-21.0.2.xml', '2023-11-04 15:26:51.755122', 111, 'EXECUTED', '8:8806cb33d2a546ce770384bf98cf6eac', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('21.1.0-19404', 'keycloak', 'META-INF/jpa-changelog-21.1.0.xml', '2023-11-04 15:26:51.820574', 112, 'EXECUTED', '8:fdb2924649d30555ab3a1744faba4928', 'modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('21.1.0-19404-2', 'keycloak', 'META-INF/jpa-changelog-21.1.0.xml', '2023-11-04 15:26:51.823351', 113, 'MARK_RAN', '8:1c96cc2b10903bd07a03670098d67fd6', 'addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...', '', NULL, '4.20.0', NULL, NULL, '9111608731');
INSERT INTO public.databasechangelog VALUES ('22.0.0-17484', 'keycloak', 'META-INF/jpa-changelog-22.0.0.xml', '2023-11-04 15:26:51.82862', 114, 'EXECUTED', '8:4c3d4e8b142a66fcdf21b89a4dd33301', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9111608731');


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.databasechangeloglock VALUES (1, false, NULL, NULL);
INSERT INTO public.databasechangeloglock VALUES (1000, false, NULL, NULL);
INSERT INTO public.databasechangeloglock VALUES (1001, false, NULL, NULL);


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.default_client_scope VALUES ('4f89db84-b6ab-4c26-9379-2721c83ea282', 'b2bfd369-fe32-4cde-817d-cf934eadd9a3', false);
INSERT INTO public.default_client_scope VALUES ('4f89db84-b6ab-4c26-9379-2721c83ea282', 'da530aed-a437-40ee-9836-04da905987fb', true);
INSERT INTO public.default_client_scope VALUES ('4f89db84-b6ab-4c26-9379-2721c83ea282', '851a6fc5-21ad-468f-8ab7-859369f1ef76', true);
INSERT INTO public.default_client_scope VALUES ('4f89db84-b6ab-4c26-9379-2721c83ea282', '84fb7279-28b6-495e-9497-c0e4d7ebffc7', true);
INSERT INTO public.default_client_scope VALUES ('4f89db84-b6ab-4c26-9379-2721c83ea282', 'd419b6f7-25e4-4408-8c0e-1761f745566a', false);
INSERT INTO public.default_client_scope VALUES ('4f89db84-b6ab-4c26-9379-2721c83ea282', 'cda3d0bc-338b-4ee3-a245-d38a64e919b0', false);
INSERT INTO public.default_client_scope VALUES ('4f89db84-b6ab-4c26-9379-2721c83ea282', 'c3fe4683-dd46-4922-89f9-8d1d1e147421', true);
INSERT INTO public.default_client_scope VALUES ('4f89db84-b6ab-4c26-9379-2721c83ea282', 'c0741ea9-46c4-4195-90c3-a8caa8139f50', true);
INSERT INTO public.default_client_scope VALUES ('4f89db84-b6ab-4c26-9379-2721c83ea282', '82f849b9-6bf4-4911-9ca3-324ad23b2ac7', false);
INSERT INTO public.default_client_scope VALUES ('4f89db84-b6ab-4c26-9379-2721c83ea282', 'af3b43c7-086b-417d-bb12-f3bfdcbce85f', true);
INSERT INTO public.default_client_scope VALUES ('662f6baf-45d0-437d-b002-c3f9ccdcb69d', '5ac85481-bd42-4d44-87c3-21dd888a765a', true);
INSERT INTO public.default_client_scope VALUES ('662f6baf-45d0-437d-b002-c3f9ccdcb69d', '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a', true);
INSERT INTO public.default_client_scope VALUES ('662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'a74e7451-421b-4bad-9c82-162e697ff7d2', true);
INSERT INTO public.default_client_scope VALUES ('662f6baf-45d0-437d-b002-c3f9ccdcb69d', '6f55dc1e-f7c5-4024-b51f-a588bd525ad7', true);
INSERT INTO public.default_client_scope VALUES ('662f6baf-45d0-437d-b002-c3f9ccdcb69d', '12fc35b7-afa6-4605-8ec5-9001a0f17249', true);
INSERT INTO public.default_client_scope VALUES ('662f6baf-45d0-437d-b002-c3f9ccdcb69d', '10b81998-d0dd-43fa-8a0b-ddf2e775091d', true);
INSERT INTO public.default_client_scope VALUES ('662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'be0864bb-8303-4994-911b-ac1a89d71091', false);
INSERT INTO public.default_client_scope VALUES ('662f6baf-45d0-437d-b002-c3f9ccdcb69d', '3f4517ce-ebc1-4861-bbf1-07f04eb6e3a1', false);
INSERT INTO public.default_client_scope VALUES ('662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'bc81bbf6-7a6b-4e63-953c-b0b4b4555a3e', false);
INSERT INTO public.default_client_scope VALUES ('662f6baf-45d0-437d-b002-c3f9ccdcb69d', '45aa243d-d9ba-4001-97f7-f4d7b1e4e633', false);


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.keycloak_role VALUES ('f5c83ef0-54a2-4cfd-9aef-953eb769bc24', '4f89db84-b6ab-4c26-9379-2721c83ea282', false, '${role_default-roles}', 'default-roles-master', '4f89db84-b6ab-4c26-9379-2721c83ea282', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('8ea68742-9f52-4819-9658-4d1689997311', '4f89db84-b6ab-4c26-9379-2721c83ea282', false, '${role_admin}', 'admin', '4f89db84-b6ab-4c26-9379-2721c83ea282', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('d4e4c452-9906-4664-bb07-8bfc419adc31', '4f89db84-b6ab-4c26-9379-2721c83ea282', false, '${role_create-realm}', 'create-realm', '4f89db84-b6ab-4c26-9379-2721c83ea282', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('e8897997-bd8b-4328-ae34-318f12345dfb', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_create-client}', 'create-client', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('5bbc397a-64db-457f-a7c3-aa312c18b62f', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_view-realm}', 'view-realm', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('f5908384-8f1f-4646-aa66-6862a2561226', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_view-users}', 'view-users', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('59120404-16ed-40a1-abde-6f196bc18d31', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_view-clients}', 'view-clients', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('dba239ff-4101-45dd-8778-60262cb11337', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_view-events}', 'view-events', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('47d289ce-b978-4fc0-af19-a9f36f4f8f45', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_view-identity-providers}', 'view-identity-providers', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('9603a1b3-0688-4572-83a5-890dbafb6dfb', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_view-authorization}', 'view-authorization', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('231c9f3f-c7de-48f8-a964-e38fe8986cc5', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_manage-realm}', 'manage-realm', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('5f394f75-75b2-43c4-b76e-8f3ea81922b7', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_manage-users}', 'manage-users', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('955ef3bb-64e2-4587-b0ad-88affec8aa31', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_manage-clients}', 'manage-clients', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('5c589d76-94d1-470b-bc30-e4392a21c7e8', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_manage-events}', 'manage-events', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('946df397-507a-4f5e-adf9-2254be5da4fd', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_manage-identity-providers}', 'manage-identity-providers', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('e6efd7d2-83bd-4cbd-a8a2-fd3d9017b482', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_manage-authorization}', 'manage-authorization', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('8bc1be71-5298-4106-8636-5dedecd42156', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_query-users}', 'query-users', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('f7b543e2-4852-435d-8df7-f3cd48e8ed32', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_query-clients}', 'query-clients', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('6a18b443-8bd1-451d-af26-b32c26a697cf', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_query-realms}', 'query-realms', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('c46a9467-cb5a-4888-b8c1-fd6623005642', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', false, '${role_default-roles}', 'default-roles-book-store', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('b6d67654-8192-4fbd-9693-edb0089645bf', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_create-client}', 'create-client', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);
INSERT INTO public.keycloak_role VALUES ('3e62bc95-fcdb-4560-86dc-1f7492966e58', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_view-realm}', 'view-realm', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);
INSERT INTO public.keycloak_role VALUES ('db79a392-8f97-4be0-a090-bf04885e4c19', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_view-users}', 'view-users', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);
INSERT INTO public.keycloak_role VALUES ('2987d87b-d691-4c02-a5f9-356980b00f15', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_view-clients}', 'view-clients', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);
INSERT INTO public.keycloak_role VALUES ('70b446d3-d46e-4750-9fbf-d3506a5a4bff', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_view-events}', 'view-events', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);
INSERT INTO public.keycloak_role VALUES ('6d685d4c-c46d-4cf2-89b9-9a779212feee', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_view-identity-providers}', 'view-identity-providers', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);
INSERT INTO public.keycloak_role VALUES ('8c1dd062-7952-41dd-b67e-78c33d002c05', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_view-authorization}', 'view-authorization', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);
INSERT INTO public.keycloak_role VALUES ('02ad528d-b5d8-45db-8f50-beb336236bba', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_manage-realm}', 'manage-realm', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);
INSERT INTO public.keycloak_role VALUES ('bb6a9ee5-b6c4-48c1-b2c0-2441cb6b400f', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_query-groups}', 'query-groups', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('0849954c-759f-4286-ba61-e7f81b241ed2', '4ccb117c-ecb3-4923-b26f-c59e869f7569', true, '${role_view-profile}', 'view-profile', '4f89db84-b6ab-4c26-9379-2721c83ea282', '4ccb117c-ecb3-4923-b26f-c59e869f7569', NULL);
INSERT INTO public.keycloak_role VALUES ('f715c4c7-58a5-4621-9668-07a2e7a9b13c', '4ccb117c-ecb3-4923-b26f-c59e869f7569', true, '${role_manage-account}', 'manage-account', '4f89db84-b6ab-4c26-9379-2721c83ea282', '4ccb117c-ecb3-4923-b26f-c59e869f7569', NULL);
INSERT INTO public.keycloak_role VALUES ('b51d07e4-c898-4f7f-a6e9-37415caa7eee', '4ccb117c-ecb3-4923-b26f-c59e869f7569', true, '${role_manage-account-links}', 'manage-account-links', '4f89db84-b6ab-4c26-9379-2721c83ea282', '4ccb117c-ecb3-4923-b26f-c59e869f7569', NULL);
INSERT INTO public.keycloak_role VALUES ('ce57dfa6-e229-49af-9f69-269f86d270e2', '4ccb117c-ecb3-4923-b26f-c59e869f7569', true, '${role_view-applications}', 'view-applications', '4f89db84-b6ab-4c26-9379-2721c83ea282', '4ccb117c-ecb3-4923-b26f-c59e869f7569', NULL);
INSERT INTO public.keycloak_role VALUES ('3f7607bc-5f44-4617-af35-25e6a107dd97', '4ccb117c-ecb3-4923-b26f-c59e869f7569', true, '${role_view-consent}', 'view-consent', '4f89db84-b6ab-4c26-9379-2721c83ea282', '4ccb117c-ecb3-4923-b26f-c59e869f7569', NULL);
INSERT INTO public.keycloak_role VALUES ('b69e49a1-8bbf-47d8-bbac-d44e229dd61d', '4ccb117c-ecb3-4923-b26f-c59e869f7569', true, '${role_manage-consent}', 'manage-consent', '4f89db84-b6ab-4c26-9379-2721c83ea282', '4ccb117c-ecb3-4923-b26f-c59e869f7569', NULL);
INSERT INTO public.keycloak_role VALUES ('31be48c7-defa-455c-80a7-460e99252b58', '4ccb117c-ecb3-4923-b26f-c59e869f7569', true, '${role_view-groups}', 'view-groups', '4f89db84-b6ab-4c26-9379-2721c83ea282', '4ccb117c-ecb3-4923-b26f-c59e869f7569', NULL);
INSERT INTO public.keycloak_role VALUES ('56e178c2-1c34-441b-bcf4-c5fcba4a4381', '4ccb117c-ecb3-4923-b26f-c59e869f7569', true, '${role_delete-account}', 'delete-account', '4f89db84-b6ab-4c26-9379-2721c83ea282', '4ccb117c-ecb3-4923-b26f-c59e869f7569', NULL);
INSERT INTO public.keycloak_role VALUES ('651fdce8-fbb9-4b3e-b945-c89a2601df95', 'eb9a2576-1072-4809-8cdc-e7c669dd2a70', true, '${role_read-token}', 'read-token', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'eb9a2576-1072-4809-8cdc-e7c669dd2a70', NULL);
INSERT INTO public.keycloak_role VALUES ('b9f3ddba-6c67-4595-83fc-6fd73bcbe6b3', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', true, '${role_impersonation}', 'impersonation', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'a2c1b33c-e756-4940-a4f1-61a3731486e5', NULL);
INSERT INTO public.keycloak_role VALUES ('6cd1d71f-8bd3-4ce8-8617-70a2f0d13f2f', '4f89db84-b6ab-4c26-9379-2721c83ea282', false, '${role_offline-access}', 'offline_access', '4f89db84-b6ab-4c26-9379-2721c83ea282', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('49552b6e-353e-49d6-9523-2a2bf9fb1910', '4f89db84-b6ab-4c26-9379-2721c83ea282', false, '${role_uma_authorization}', 'uma_authorization', '4f89db84-b6ab-4c26-9379-2721c83ea282', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('c9e09ad0-2b56-4f19-a1d6-56f598198df4', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_manage-users}', 'manage-users', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);
INSERT INTO public.keycloak_role VALUES ('662013f4-50ea-48f8-8c71-aeaf59a05233', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_manage-clients}', 'manage-clients', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);
INSERT INTO public.keycloak_role VALUES ('af71130f-3a73-4189-a270-0c92a1d49f4c', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_manage-events}', 'manage-events', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);
INSERT INTO public.keycloak_role VALUES ('9bbeb1c8-455d-4f3c-9e2f-400be7fef098', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_manage-identity-providers}', 'manage-identity-providers', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);
INSERT INTO public.keycloak_role VALUES ('42dc3456-a774-49de-8694-4785fbda47f5', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_manage-authorization}', 'manage-authorization', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);
INSERT INTO public.keycloak_role VALUES ('9c971d51-2aed-4260-aa20-6008cca90773', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_query-users}', 'query-users', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);
INSERT INTO public.keycloak_role VALUES ('733e1931-97e9-48a1-93c4-6e4e628222fd', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_query-clients}', 'query-clients', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);
INSERT INTO public.keycloak_role VALUES ('662e4b28-ad11-437f-a056-7aba337433c8', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_query-realms}', 'query-realms', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);
INSERT INTO public.keycloak_role VALUES ('317d16ec-c3fa-48b2-b087-fe4b5b801736', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_query-groups}', 'query-groups', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);
INSERT INTO public.keycloak_role VALUES ('3ee02316-c4b1-4356-9228-e93bec6d8d45', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', false, '${role_offline-access}', 'offline_access', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('9a0fd2dd-9b5b-429c-ab86-3fbf81771d14', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', false, '', 'ROLE_USER', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('47414939-f003-4b0f-8a12-7b2f17f98a37', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', false, '', 'ROLE_ADMIN', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('7748dc9a-b619-4185-93cc-ef0fcf41ccc8', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', false, '${role_uma_authorization}', 'uma_authorization', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('dcf96f4f-79fc-4394-ac8e-4a516c653ba4', '579e5e42-c2b8-4014-a671-36ce67cb0809', true, '', 'ROLE_USER', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '579e5e42-c2b8-4014-a671-36ce67cb0809', NULL);
INSERT INTO public.keycloak_role VALUES ('aa5bd567-3466-41e3-bf8d-a6e1a13f9047', '579e5e42-c2b8-4014-a671-36ce67cb0809', true, '', 'ROLE_ADMIN', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '579e5e42-c2b8-4014-a671-36ce67cb0809', NULL);
INSERT INTO public.keycloak_role VALUES ('5ab5252f-0b48-4350-83da-cbfe7bf68216', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_query-clients}', 'query-clients', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('7cab75de-3140-4516-959e-9ecfe8ce7d08', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_view-authorization}', 'view-authorization', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('bbec352c-a21f-4fb3-a87c-1a6c896f3c68', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_manage-clients}', 'manage-clients', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('80d5ecbf-7ad1-4efe-bb2f-0d7663a9794a', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_view-clients}', 'view-clients', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('61a5a0dc-70ed-4b35-beaa-4f93752b1a4e', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_manage-events}', 'manage-events', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('e4de045d-46cc-4a24-afa4-5bbd417184a4', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_manage-realm}', 'manage-realm', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('3c0778e1-20ac-41dd-a795-2f3ed41bd16d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_query-users}', 'query-users', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('96977b5e-bfcc-4efc-a4b5-a7a6851e61c4', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_impersonation}', 'impersonation', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('e4af1dd8-2297-4494-8c1c-b82a4f445243', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_view-events}', 'view-events', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('3e63287d-e819-4f2f-9d7b-6f3252c82777', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_manage-users}', 'manage-users', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('28aab02c-54cf-4cdc-a12f-20c108a261fb', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_query-realms}', 'query-realms', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('0bc58bad-6fa9-4f44-a055-fde93bc3e6f9', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_manage-identity-providers}', 'manage-identity-providers', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('968c1a85-d180-4a25-80e2-41242a29cb8c', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_view-identity-providers}', 'view-identity-providers', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('41fb88d5-a524-4bf1-9b12-67631dbcf2b9', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_create-client}', 'create-client', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('1b1241dc-4149-4f47-9716-0bf9164f28bc', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_query-groups}', 'query-groups', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('b9bbeaa3-7f82-4e19-a4ae-959904506d8c', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_realm-admin}', 'realm-admin', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('48da3971-f37a-4003-bcae-67a25accaf33', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_view-users}', 'view-users', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('e0cfdcc8-0a08-4b43-99f6-4497bef9438d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_manage-authorization}', 'manage-authorization', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('f851b627-91a1-4e05-b45f-401642084157', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, '${role_view-realm}', 'view-realm', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', NULL);
INSERT INTO public.keycloak_role VALUES ('d4c89bc8-5fea-4ce0-8a46-2be3b895c66c', '252223fa-2762-4017-8030-1a29dd200de3', true, '${role_read-token}', 'read-token', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '252223fa-2762-4017-8030-1a29dd200de3', NULL);
INSERT INTO public.keycloak_role VALUES ('40c61ed7-5a24-4dcb-96b1-730cd85f219d', 'ba615863-d949-4598-8196-54c21b254108', true, '${role_view-profile}', 'view-profile', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'ba615863-d949-4598-8196-54c21b254108', NULL);
INSERT INTO public.keycloak_role VALUES ('84afa104-b2fb-47fe-ba48-b719455896b3', 'ba615863-d949-4598-8196-54c21b254108', true, '${role_view-applications}', 'view-applications', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'ba615863-d949-4598-8196-54c21b254108', NULL);
INSERT INTO public.keycloak_role VALUES ('e9c15a9c-cf20-4253-90d7-171d41c4983e', 'ba615863-d949-4598-8196-54c21b254108', true, '${role_view-groups}', 'view-groups', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'ba615863-d949-4598-8196-54c21b254108', NULL);
INSERT INTO public.keycloak_role VALUES ('1d014aad-d78d-4d6e-a18e-007b4247c731', 'ba615863-d949-4598-8196-54c21b254108', true, '${role_manage-account}', 'manage-account', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'ba615863-d949-4598-8196-54c21b254108', NULL);
INSERT INTO public.keycloak_role VALUES ('518de179-f981-474e-a930-30ff40d71485', 'ba615863-d949-4598-8196-54c21b254108', true, '${role_manage-account-links}', 'manage-account-links', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'ba615863-d949-4598-8196-54c21b254108', NULL);
INSERT INTO public.keycloak_role VALUES ('4e302eed-87cf-4d0d-ac6a-b61a8f572869', 'ba615863-d949-4598-8196-54c21b254108', true, '${role_manage-consent}', 'manage-consent', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'ba615863-d949-4598-8196-54c21b254108', NULL);
INSERT INTO public.keycloak_role VALUES ('7d51f745-ba15-4029-b447-413611d40980', 'ba615863-d949-4598-8196-54c21b254108', true, '${role_view-consent}', 'view-consent', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'ba615863-d949-4598-8196-54c21b254108', NULL);
INSERT INTO public.keycloak_role VALUES ('ef8bd832-9799-4245-8b66-bbce91f69bb2', 'ba615863-d949-4598-8196-54c21b254108', true, '${role_delete-account}', 'delete-account', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'ba615863-d949-4598-8196-54c21b254108', NULL);
INSERT INTO public.keycloak_role VALUES ('c2c44216-c568-4dd2-b255-096023f36178', '8ee0d957-5dec-483c-b661-baeb2c562480', true, '${role_impersonation}', 'impersonation', '4f89db84-b6ab-4c26-9379-2721c83ea282', '8ee0d957-5dec-483c-b661-baeb2c562480', NULL);


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.migration_model VALUES ('dfgee', '22.0.1', 1699111612);


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.protocol_mapper VALUES ('171c1acd-f1e7-4b72-b8d3-b4c2b91d2a68', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', 'fb633313-8670-4ab9-9b1b-05bf0b2bcc50', NULL);
INSERT INTO public.protocol_mapper VALUES ('ef24cbb2-4435-4757-9e21-2084b52d5e7b', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', 'be41090f-f94f-4875-81c0-825e3801cc9d', NULL);
INSERT INTO public.protocol_mapper VALUES ('d3d02fda-761e-4736-9c67-07167d0fd1d2', 'role list', 'saml', 'saml-role-list-mapper', NULL, 'da530aed-a437-40ee-9836-04da905987fb');
INSERT INTO public.protocol_mapper VALUES ('231c8f33-938d-460e-aa04-1087bf1ec3d8', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '851a6fc5-21ad-468f-8ab7-859369f1ef76');
INSERT INTO public.protocol_mapper VALUES ('b71cc2e7-9b27-4fdd-928f-150a2b04499f', 'family name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '851a6fc5-21ad-468f-8ab7-859369f1ef76');
INSERT INTO public.protocol_mapper VALUES ('de7aaf0d-78a2-48d8-804f-24767e7bc254', 'given name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '851a6fc5-21ad-468f-8ab7-859369f1ef76');
INSERT INTO public.protocol_mapper VALUES ('1ec3f486-d2bd-40d4-89f3-cccd544a6bda', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '851a6fc5-21ad-468f-8ab7-859369f1ef76');
INSERT INTO public.protocol_mapper VALUES ('763b1ea8-f216-4138-bbe3-114020a8f7d5', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '851a6fc5-21ad-468f-8ab7-859369f1ef76');
INSERT INTO public.protocol_mapper VALUES ('adddb618-b73b-4fab-afe5-cf2c9d2d9492', 'username', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '851a6fc5-21ad-468f-8ab7-859369f1ef76');
INSERT INTO public.protocol_mapper VALUES ('901afd9a-f116-4372-b119-2dbd3530555c', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '851a6fc5-21ad-468f-8ab7-859369f1ef76');
INSERT INTO public.protocol_mapper VALUES ('80db462a-3a7d-4a8e-99b8-b3b0e00c45b3', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '851a6fc5-21ad-468f-8ab7-859369f1ef76');
INSERT INTO public.protocol_mapper VALUES ('b8859ff3-a3ce-4548-b72e-47a7cbcdfa7d', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '851a6fc5-21ad-468f-8ab7-859369f1ef76');
INSERT INTO public.protocol_mapper VALUES ('95a14c60-71dd-443c-98cd-e645f4d75ef9', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '851a6fc5-21ad-468f-8ab7-859369f1ef76');
INSERT INTO public.protocol_mapper VALUES ('b4bc4923-a792-4a46-ada7-fd31f873fcb1', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '851a6fc5-21ad-468f-8ab7-859369f1ef76');
INSERT INTO public.protocol_mapper VALUES ('7b41d78d-f37d-4924-8410-2f7725640bba', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '851a6fc5-21ad-468f-8ab7-859369f1ef76');
INSERT INTO public.protocol_mapper VALUES ('27297ff4-f106-40b6-8acb-14668bbda693', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '851a6fc5-21ad-468f-8ab7-859369f1ef76');
INSERT INTO public.protocol_mapper VALUES ('8c258493-3fcf-4351-948b-cc5544bceb58', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '851a6fc5-21ad-468f-8ab7-859369f1ef76');
INSERT INTO public.protocol_mapper VALUES ('0a0e0d4e-5d5d-4e45-87c2-158382881208', 'email', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '84fb7279-28b6-495e-9497-c0e4d7ebffc7');
INSERT INTO public.protocol_mapper VALUES ('a254a3be-92c8-4136-8208-a50abc217114', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '84fb7279-28b6-495e-9497-c0e4d7ebffc7');
INSERT INTO public.protocol_mapper VALUES ('52908f79-81f7-45b1-9a3b-9fcb28987d58', 'address', 'openid-connect', 'oidc-address-mapper', NULL, 'd419b6f7-25e4-4408-8c0e-1761f745566a');
INSERT INTO public.protocol_mapper VALUES ('2020f329-1cf8-46a3-b200-13e2b9e90452', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'cda3d0bc-338b-4ee3-a245-d38a64e919b0');
INSERT INTO public.protocol_mapper VALUES ('e25705b3-0439-4222-8265-b2df4ebcdc47', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'cda3d0bc-338b-4ee3-a245-d38a64e919b0');
INSERT INTO public.protocol_mapper VALUES ('3d0ae8e8-64ae-4f83-90c9-779d79cc58a3', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'c3fe4683-dd46-4922-89f9-8d1d1e147421');
INSERT INTO public.protocol_mapper VALUES ('e907df9c-2456-4d87-8290-233070a0cb64', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, 'c3fe4683-dd46-4922-89f9-8d1d1e147421');
INSERT INTO public.protocol_mapper VALUES ('92d4c7c8-0cec-4016-8531-11638ed63ff8', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, 'c3fe4683-dd46-4922-89f9-8d1d1e147421');
INSERT INTO public.protocol_mapper VALUES ('05289397-0eb1-4251-8d5d-06e71b648490', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, 'c0741ea9-46c4-4195-90c3-a8caa8139f50');
INSERT INTO public.protocol_mapper VALUES ('cfe6e278-0350-432c-bf7a-fc9adfc234bb', 'upn', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '82f849b9-6bf4-4911-9ca3-324ad23b2ac7');
INSERT INTO public.protocol_mapper VALUES ('223df5ed-acfe-43bc-a9ad-8429bc33fa94', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '82f849b9-6bf4-4911-9ca3-324ad23b2ac7');
INSERT INTO public.protocol_mapper VALUES ('42ddfd92-236f-4ed4-a9e9-07db7f61e879', 'acr loa level', 'openid-connect', 'oidc-acr-mapper', NULL, 'af3b43c7-086b-417d-bb12-f3bfdcbce85f');
INSERT INTO public.protocol_mapper VALUES ('5be8b70f-4b2e-4e44-a5a2-f64b14302c11', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '12fc35b7-afa6-4605-8ec5-9001a0f17249');
INSERT INTO public.protocol_mapper VALUES ('f14e2104-c8d3-4154-9b8f-adf6d0f34149', 'acr loa level', 'openid-connect', 'oidc-acr-mapper', NULL, '10b81998-d0dd-43fa-8a0b-ddf2e775091d');
INSERT INTO public.protocol_mapper VALUES ('ca3a1fa5-535f-4491-b41a-505cfab96acb', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a');
INSERT INTO public.protocol_mapper VALUES ('a838bcc1-da0b-4be2-8094-c6ca1e5361e0', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a');
INSERT INTO public.protocol_mapper VALUES ('4261c4e6-e9a7-4bb3-ae55-35f31f4345bb', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a');
INSERT INTO public.protocol_mapper VALUES ('dda433b2-d23b-470f-821f-ee7487308126', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a');
INSERT INTO public.protocol_mapper VALUES ('1bc49c35-cec0-49a9-af34-a5a378c319e9', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a');
INSERT INTO public.protocol_mapper VALUES ('005f8131-1642-4c73-b2ac-5a22af3b1f55', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a');
INSERT INTO public.protocol_mapper VALUES ('55090de7-2327-46ab-8c2e-fcb369875461', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a');
INSERT INTO public.protocol_mapper VALUES ('5b372082-ffd6-4c6a-a267-24aa7ffb1eb1', 'given name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a');
INSERT INTO public.protocol_mapper VALUES ('4942ef1b-cc92-4018-bdea-d2fb8d30c70b', 'family name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a');
INSERT INTO public.protocol_mapper VALUES ('210ee943-17f1-4980-a287-b99bab264b13', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a');
INSERT INTO public.protocol_mapper VALUES ('f4c1e366-bf9e-4423-922d-7f61f708e087', 'username', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a');
INSERT INTO public.protocol_mapper VALUES ('d5abefcb-7227-4fcf-b4ac-b7afde2c0dbf', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a');
INSERT INTO public.protocol_mapper VALUES ('8d4d6853-56c7-4ea4-a5b3-2528ccc0ef96', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a');
INSERT INTO public.protocol_mapper VALUES ('a7ec143c-814a-4f00-9248-68443104143b', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '3562dbfe-5f4f-4e89-b933-9d2ff9ec974a');
INSERT INTO public.protocol_mapper VALUES ('bf4db2ac-23e6-438b-bd74-09d23b7ac89a', 'role list', 'saml', 'saml-role-list-mapper', NULL, '5ac85481-bd42-4d44-87c3-21dd888a765a');
INSERT INTO public.protocol_mapper VALUES ('8d7b0b5f-88d0-407f-b4f6-27f43ab90914', 'email', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a74e7451-421b-4bad-9c82-162e697ff7d2');
INSERT INTO public.protocol_mapper VALUES ('c55a54f7-088d-493b-9e2c-4cbfa340bc72', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'a74e7451-421b-4bad-9c82-162e697ff7d2');
INSERT INTO public.protocol_mapper VALUES ('2b02b5d2-8fce-4091-b0f8-d44fd1ede298', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '45aa243d-d9ba-4001-97f7-f4d7b1e4e633');
INSERT INTO public.protocol_mapper VALUES ('87a9459e-4d52-4750-93bd-0b96fed12d65', 'upn', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '45aa243d-d9ba-4001-97f7-f4d7b1e4e633');
INSERT INTO public.protocol_mapper VALUES ('15ea3d31-c700-4a94-9a50-0a5d69f57f7a', 'address', 'openid-connect', 'oidc-address-mapper', NULL, '3f4517ce-ebc1-4861-bbf1-07f04eb6e3a1');
INSERT INTO public.protocol_mapper VALUES ('4a351397-eac2-4349-9d36-327fbf4f27cf', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'bc81bbf6-7a6b-4e63-953c-b0b4b4555a3e');
INSERT INTO public.protocol_mapper VALUES ('ef8e532d-12fa-4f4c-be0d-7114bfbf0746', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'bc81bbf6-7a6b-4e63-953c-b0b4b4555a3e');
INSERT INTO public.protocol_mapper VALUES ('cce81cb4-a374-42d1-8d3f-255a39159de0', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '6f55dc1e-f7c5-4024-b51f-a588bd525ad7');
INSERT INTO public.protocol_mapper VALUES ('7d55d0c4-1dab-45dd-b4aa-7320bdd8f137', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '6f55dc1e-f7c5-4024-b51f-a588bd525ad7');
INSERT INTO public.protocol_mapper VALUES ('03acb789-86cd-425c-9e7b-042a0085d79f', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '6f55dc1e-f7c5-4024-b51f-a588bd525ad7');
INSERT INTO public.protocol_mapper VALUES ('3cac623a-b2f3-493a-846f-9308591ed000', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '68386798-a2f4-4e98-8a57-5454fb60df2d', NULL);
INSERT INTO public.protocol_mapper VALUES ('7f777d33-50e9-46dc-be50-9d3aec16fc5b', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', 'a7d51e28-21a4-49e0-9430-d5d9057589ed', NULL);


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.protocol_mapper_config VALUES ('ef24cbb2-4435-4757-9e21-2084b52d5e7b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ef24cbb2-4435-4757-9e21-2084b52d5e7b', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('ef24cbb2-4435-4757-9e21-2084b52d5e7b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ef24cbb2-4435-4757-9e21-2084b52d5e7b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ef24cbb2-4435-4757-9e21-2084b52d5e7b', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('ef24cbb2-4435-4757-9e21-2084b52d5e7b', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('d3d02fda-761e-4736-9c67-07167d0fd1d2', 'false', 'single');
INSERT INTO public.protocol_mapper_config VALUES ('d3d02fda-761e-4736-9c67-07167d0fd1d2', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config VALUES ('d3d02fda-761e-4736-9c67-07167d0fd1d2', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config VALUES ('1ec3f486-d2bd-40d4-89f3-cccd544a6bda', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1ec3f486-d2bd-40d4-89f3-cccd544a6bda', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('1ec3f486-d2bd-40d4-89f3-cccd544a6bda', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1ec3f486-d2bd-40d4-89f3-cccd544a6bda', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1ec3f486-d2bd-40d4-89f3-cccd544a6bda', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('1ec3f486-d2bd-40d4-89f3-cccd544a6bda', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('231c8f33-938d-460e-aa04-1087bf1ec3d8', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('231c8f33-938d-460e-aa04-1087bf1ec3d8', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('231c8f33-938d-460e-aa04-1087bf1ec3d8', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('27297ff4-f106-40b6-8acb-14668bbda693', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('27297ff4-f106-40b6-8acb-14668bbda693', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('27297ff4-f106-40b6-8acb-14668bbda693', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('27297ff4-f106-40b6-8acb-14668bbda693', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('27297ff4-f106-40b6-8acb-14668bbda693', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('27297ff4-f106-40b6-8acb-14668bbda693', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('763b1ea8-f216-4138-bbe3-114020a8f7d5', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('763b1ea8-f216-4138-bbe3-114020a8f7d5', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('763b1ea8-f216-4138-bbe3-114020a8f7d5', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('763b1ea8-f216-4138-bbe3-114020a8f7d5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('763b1ea8-f216-4138-bbe3-114020a8f7d5', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('763b1ea8-f216-4138-bbe3-114020a8f7d5', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('7b41d78d-f37d-4924-8410-2f7725640bba', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7b41d78d-f37d-4924-8410-2f7725640bba', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('7b41d78d-f37d-4924-8410-2f7725640bba', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7b41d78d-f37d-4924-8410-2f7725640bba', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7b41d78d-f37d-4924-8410-2f7725640bba', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('7b41d78d-f37d-4924-8410-2f7725640bba', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('80db462a-3a7d-4a8e-99b8-b3b0e00c45b3', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('80db462a-3a7d-4a8e-99b8-b3b0e00c45b3', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('80db462a-3a7d-4a8e-99b8-b3b0e00c45b3', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('80db462a-3a7d-4a8e-99b8-b3b0e00c45b3', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('80db462a-3a7d-4a8e-99b8-b3b0e00c45b3', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('80db462a-3a7d-4a8e-99b8-b3b0e00c45b3', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('8c258493-3fcf-4351-948b-cc5544bceb58', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8c258493-3fcf-4351-948b-cc5544bceb58', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('8c258493-3fcf-4351-948b-cc5544bceb58', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8c258493-3fcf-4351-948b-cc5544bceb58', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8c258493-3fcf-4351-948b-cc5544bceb58', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('8c258493-3fcf-4351-948b-cc5544bceb58', 'long', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('901afd9a-f116-4372-b119-2dbd3530555c', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('901afd9a-f116-4372-b119-2dbd3530555c', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('901afd9a-f116-4372-b119-2dbd3530555c', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('901afd9a-f116-4372-b119-2dbd3530555c', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('901afd9a-f116-4372-b119-2dbd3530555c', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('901afd9a-f116-4372-b119-2dbd3530555c', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('95a14c60-71dd-443c-98cd-e645f4d75ef9', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('95a14c60-71dd-443c-98cd-e645f4d75ef9', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('95a14c60-71dd-443c-98cd-e645f4d75ef9', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('95a14c60-71dd-443c-98cd-e645f4d75ef9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('95a14c60-71dd-443c-98cd-e645f4d75ef9', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('95a14c60-71dd-443c-98cd-e645f4d75ef9', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('adddb618-b73b-4fab-afe5-cf2c9d2d9492', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('adddb618-b73b-4fab-afe5-cf2c9d2d9492', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('adddb618-b73b-4fab-afe5-cf2c9d2d9492', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('adddb618-b73b-4fab-afe5-cf2c9d2d9492', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('adddb618-b73b-4fab-afe5-cf2c9d2d9492', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('adddb618-b73b-4fab-afe5-cf2c9d2d9492', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('b4bc4923-a792-4a46-ada7-fd31f873fcb1', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b4bc4923-a792-4a46-ada7-fd31f873fcb1', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('b4bc4923-a792-4a46-ada7-fd31f873fcb1', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b4bc4923-a792-4a46-ada7-fd31f873fcb1', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b4bc4923-a792-4a46-ada7-fd31f873fcb1', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('b4bc4923-a792-4a46-ada7-fd31f873fcb1', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('b71cc2e7-9b27-4fdd-928f-150a2b04499f', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b71cc2e7-9b27-4fdd-928f-150a2b04499f', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('b71cc2e7-9b27-4fdd-928f-150a2b04499f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b71cc2e7-9b27-4fdd-928f-150a2b04499f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b71cc2e7-9b27-4fdd-928f-150a2b04499f', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('b71cc2e7-9b27-4fdd-928f-150a2b04499f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('b8859ff3-a3ce-4548-b72e-47a7cbcdfa7d', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b8859ff3-a3ce-4548-b72e-47a7cbcdfa7d', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('b8859ff3-a3ce-4548-b72e-47a7cbcdfa7d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b8859ff3-a3ce-4548-b72e-47a7cbcdfa7d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b8859ff3-a3ce-4548-b72e-47a7cbcdfa7d', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('b8859ff3-a3ce-4548-b72e-47a7cbcdfa7d', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('de7aaf0d-78a2-48d8-804f-24767e7bc254', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('de7aaf0d-78a2-48d8-804f-24767e7bc254', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('de7aaf0d-78a2-48d8-804f-24767e7bc254', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('de7aaf0d-78a2-48d8-804f-24767e7bc254', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('de7aaf0d-78a2-48d8-804f-24767e7bc254', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('de7aaf0d-78a2-48d8-804f-24767e7bc254', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('0a0e0d4e-5d5d-4e45-87c2-158382881208', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0a0e0d4e-5d5d-4e45-87c2-158382881208', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('0a0e0d4e-5d5d-4e45-87c2-158382881208', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0a0e0d4e-5d5d-4e45-87c2-158382881208', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0a0e0d4e-5d5d-4e45-87c2-158382881208', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('0a0e0d4e-5d5d-4e45-87c2-158382881208', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a254a3be-92c8-4136-8208-a50abc217114', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a254a3be-92c8-4136-8208-a50abc217114', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('a254a3be-92c8-4136-8208-a50abc217114', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a254a3be-92c8-4136-8208-a50abc217114', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a254a3be-92c8-4136-8208-a50abc217114', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('a254a3be-92c8-4136-8208-a50abc217114', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('52908f79-81f7-45b1-9a3b-9fcb28987d58', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config VALUES ('52908f79-81f7-45b1-9a3b-9fcb28987d58', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config VALUES ('52908f79-81f7-45b1-9a3b-9fcb28987d58', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config VALUES ('52908f79-81f7-45b1-9a3b-9fcb28987d58', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('52908f79-81f7-45b1-9a3b-9fcb28987d58', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config VALUES ('52908f79-81f7-45b1-9a3b-9fcb28987d58', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('52908f79-81f7-45b1-9a3b-9fcb28987d58', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config VALUES ('52908f79-81f7-45b1-9a3b-9fcb28987d58', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('52908f79-81f7-45b1-9a3b-9fcb28987d58', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config VALUES ('2020f329-1cf8-46a3-b200-13e2b9e90452', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2020f329-1cf8-46a3-b200-13e2b9e90452', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('2020f329-1cf8-46a3-b200-13e2b9e90452', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2020f329-1cf8-46a3-b200-13e2b9e90452', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2020f329-1cf8-46a3-b200-13e2b9e90452', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('2020f329-1cf8-46a3-b200-13e2b9e90452', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('e25705b3-0439-4222-8265-b2df4ebcdc47', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e25705b3-0439-4222-8265-b2df4ebcdc47', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('e25705b3-0439-4222-8265-b2df4ebcdc47', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e25705b3-0439-4222-8265-b2df4ebcdc47', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e25705b3-0439-4222-8265-b2df4ebcdc47', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('e25705b3-0439-4222-8265-b2df4ebcdc47', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('3d0ae8e8-64ae-4f83-90c9-779d79cc58a3', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('3d0ae8e8-64ae-4f83-90c9-779d79cc58a3', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('3d0ae8e8-64ae-4f83-90c9-779d79cc58a3', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3d0ae8e8-64ae-4f83-90c9-779d79cc58a3', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('3d0ae8e8-64ae-4f83-90c9-779d79cc58a3', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('e907df9c-2456-4d87-8290-233070a0cb64', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('e907df9c-2456-4d87-8290-233070a0cb64', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('e907df9c-2456-4d87-8290-233070a0cb64', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e907df9c-2456-4d87-8290-233070a0cb64', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('e907df9c-2456-4d87-8290-233070a0cb64', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('223df5ed-acfe-43bc-a9ad-8429bc33fa94', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('223df5ed-acfe-43bc-a9ad-8429bc33fa94', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('223df5ed-acfe-43bc-a9ad-8429bc33fa94', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('223df5ed-acfe-43bc-a9ad-8429bc33fa94', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('223df5ed-acfe-43bc-a9ad-8429bc33fa94', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('223df5ed-acfe-43bc-a9ad-8429bc33fa94', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('cfe6e278-0350-432c-bf7a-fc9adfc234bb', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cfe6e278-0350-432c-bf7a-fc9adfc234bb', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('cfe6e278-0350-432c-bf7a-fc9adfc234bb', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cfe6e278-0350-432c-bf7a-fc9adfc234bb', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cfe6e278-0350-432c-bf7a-fc9adfc234bb', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('cfe6e278-0350-432c-bf7a-fc9adfc234bb', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('42ddfd92-236f-4ed4-a9e9-07db7f61e879', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('42ddfd92-236f-4ed4-a9e9-07db7f61e879', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f14e2104-c8d3-4154-9b8f-adf6d0f34149', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f14e2104-c8d3-4154-9b8f-adf6d0f34149', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f14e2104-c8d3-4154-9b8f-adf6d0f34149', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('005f8131-1642-4c73-b2ac-5a22af3b1f55', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('005f8131-1642-4c73-b2ac-5a22af3b1f55', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('005f8131-1642-4c73-b2ac-5a22af3b1f55', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('005f8131-1642-4c73-b2ac-5a22af3b1f55', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('005f8131-1642-4c73-b2ac-5a22af3b1f55', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('005f8131-1642-4c73-b2ac-5a22af3b1f55', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('1bc49c35-cec0-49a9-af34-a5a378c319e9', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1bc49c35-cec0-49a9-af34-a5a378c319e9', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('1bc49c35-cec0-49a9-af34-a5a378c319e9', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1bc49c35-cec0-49a9-af34-a5a378c319e9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1bc49c35-cec0-49a9-af34-a5a378c319e9', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('1bc49c35-cec0-49a9-af34-a5a378c319e9', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('210ee943-17f1-4980-a287-b99bab264b13', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('210ee943-17f1-4980-a287-b99bab264b13', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('210ee943-17f1-4980-a287-b99bab264b13', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('210ee943-17f1-4980-a287-b99bab264b13', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('210ee943-17f1-4980-a287-b99bab264b13', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('210ee943-17f1-4980-a287-b99bab264b13', 'long', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('4261c4e6-e9a7-4bb3-ae55-35f31f4345bb', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4261c4e6-e9a7-4bb3-ae55-35f31f4345bb', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('4261c4e6-e9a7-4bb3-ae55-35f31f4345bb', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4261c4e6-e9a7-4bb3-ae55-35f31f4345bb', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4261c4e6-e9a7-4bb3-ae55-35f31f4345bb', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('4261c4e6-e9a7-4bb3-ae55-35f31f4345bb', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('4942ef1b-cc92-4018-bdea-d2fb8d30c70b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4942ef1b-cc92-4018-bdea-d2fb8d30c70b', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('4942ef1b-cc92-4018-bdea-d2fb8d30c70b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4942ef1b-cc92-4018-bdea-d2fb8d30c70b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4942ef1b-cc92-4018-bdea-d2fb8d30c70b', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('4942ef1b-cc92-4018-bdea-d2fb8d30c70b', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('55090de7-2327-46ab-8c2e-fcb369875461', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('55090de7-2327-46ab-8c2e-fcb369875461', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('55090de7-2327-46ab-8c2e-fcb369875461', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('55090de7-2327-46ab-8c2e-fcb369875461', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('55090de7-2327-46ab-8c2e-fcb369875461', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('55090de7-2327-46ab-8c2e-fcb369875461', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('5b372082-ffd6-4c6a-a267-24aa7ffb1eb1', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5b372082-ffd6-4c6a-a267-24aa7ffb1eb1', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('5b372082-ffd6-4c6a-a267-24aa7ffb1eb1', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5b372082-ffd6-4c6a-a267-24aa7ffb1eb1', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5b372082-ffd6-4c6a-a267-24aa7ffb1eb1', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('5b372082-ffd6-4c6a-a267-24aa7ffb1eb1', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('8d4d6853-56c7-4ea4-a5b3-2528ccc0ef96', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8d4d6853-56c7-4ea4-a5b3-2528ccc0ef96', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('8d4d6853-56c7-4ea4-a5b3-2528ccc0ef96', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8d4d6853-56c7-4ea4-a5b3-2528ccc0ef96', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8d4d6853-56c7-4ea4-a5b3-2528ccc0ef96', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('8d4d6853-56c7-4ea4-a5b3-2528ccc0ef96', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a7ec143c-814a-4f00-9248-68443104143b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a7ec143c-814a-4f00-9248-68443104143b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a7ec143c-814a-4f00-9248-68443104143b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a838bcc1-da0b-4be2-8094-c6ca1e5361e0', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a838bcc1-da0b-4be2-8094-c6ca1e5361e0', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('a838bcc1-da0b-4be2-8094-c6ca1e5361e0', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a838bcc1-da0b-4be2-8094-c6ca1e5361e0', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a838bcc1-da0b-4be2-8094-c6ca1e5361e0', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('a838bcc1-da0b-4be2-8094-c6ca1e5361e0', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('ca3a1fa5-535f-4491-b41a-505cfab96acb', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ca3a1fa5-535f-4491-b41a-505cfab96acb', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('ca3a1fa5-535f-4491-b41a-505cfab96acb', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ca3a1fa5-535f-4491-b41a-505cfab96acb', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ca3a1fa5-535f-4491-b41a-505cfab96acb', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('ca3a1fa5-535f-4491-b41a-505cfab96acb', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('d5abefcb-7227-4fcf-b4ac-b7afde2c0dbf', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('d5abefcb-7227-4fcf-b4ac-b7afde2c0dbf', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('d5abefcb-7227-4fcf-b4ac-b7afde2c0dbf', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('d5abefcb-7227-4fcf-b4ac-b7afde2c0dbf', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('d5abefcb-7227-4fcf-b4ac-b7afde2c0dbf', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('d5abefcb-7227-4fcf-b4ac-b7afde2c0dbf', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('dda433b2-d23b-470f-821f-ee7487308126', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('dda433b2-d23b-470f-821f-ee7487308126', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('dda433b2-d23b-470f-821f-ee7487308126', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('dda433b2-d23b-470f-821f-ee7487308126', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('dda433b2-d23b-470f-821f-ee7487308126', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('dda433b2-d23b-470f-821f-ee7487308126', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f4c1e366-bf9e-4423-922d-7f61f708e087', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f4c1e366-bf9e-4423-922d-7f61f708e087', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f4c1e366-bf9e-4423-922d-7f61f708e087', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f4c1e366-bf9e-4423-922d-7f61f708e087', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f4c1e366-bf9e-4423-922d-7f61f708e087', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f4c1e366-bf9e-4423-922d-7f61f708e087', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('bf4db2ac-23e6-438b-bd74-09d23b7ac89a', 'false', 'single');
INSERT INTO public.protocol_mapper_config VALUES ('bf4db2ac-23e6-438b-bd74-09d23b7ac89a', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config VALUES ('bf4db2ac-23e6-438b-bd74-09d23b7ac89a', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config VALUES ('8d7b0b5f-88d0-407f-b4f6-27f43ab90914', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8d7b0b5f-88d0-407f-b4f6-27f43ab90914', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('8d7b0b5f-88d0-407f-b4f6-27f43ab90914', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8d7b0b5f-88d0-407f-b4f6-27f43ab90914', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8d7b0b5f-88d0-407f-b4f6-27f43ab90914', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('8d7b0b5f-88d0-407f-b4f6-27f43ab90914', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('c55a54f7-088d-493b-9e2c-4cbfa340bc72', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c55a54f7-088d-493b-9e2c-4cbfa340bc72', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('c55a54f7-088d-493b-9e2c-4cbfa340bc72', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c55a54f7-088d-493b-9e2c-4cbfa340bc72', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c55a54f7-088d-493b-9e2c-4cbfa340bc72', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('c55a54f7-088d-493b-9e2c-4cbfa340bc72', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('2b02b5d2-8fce-4091-b0f8-d44fd1ede298', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('2b02b5d2-8fce-4091-b0f8-d44fd1ede298', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2b02b5d2-8fce-4091-b0f8-d44fd1ede298', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('2b02b5d2-8fce-4091-b0f8-d44fd1ede298', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2b02b5d2-8fce-4091-b0f8-d44fd1ede298', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2b02b5d2-8fce-4091-b0f8-d44fd1ede298', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('2b02b5d2-8fce-4091-b0f8-d44fd1ede298', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('87a9459e-4d52-4750-93bd-0b96fed12d65', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('87a9459e-4d52-4750-93bd-0b96fed12d65', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('87a9459e-4d52-4750-93bd-0b96fed12d65', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('87a9459e-4d52-4750-93bd-0b96fed12d65', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('87a9459e-4d52-4750-93bd-0b96fed12d65', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('87a9459e-4d52-4750-93bd-0b96fed12d65', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('15ea3d31-c700-4a94-9a50-0a5d69f57f7a', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config VALUES ('15ea3d31-c700-4a94-9a50-0a5d69f57f7a', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config VALUES ('15ea3d31-c700-4a94-9a50-0a5d69f57f7a', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config VALUES ('15ea3d31-c700-4a94-9a50-0a5d69f57f7a', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('15ea3d31-c700-4a94-9a50-0a5d69f57f7a', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config VALUES ('15ea3d31-c700-4a94-9a50-0a5d69f57f7a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('15ea3d31-c700-4a94-9a50-0a5d69f57f7a', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config VALUES ('15ea3d31-c700-4a94-9a50-0a5d69f57f7a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('15ea3d31-c700-4a94-9a50-0a5d69f57f7a', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config VALUES ('4a351397-eac2-4349-9d36-327fbf4f27cf', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4a351397-eac2-4349-9d36-327fbf4f27cf', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('4a351397-eac2-4349-9d36-327fbf4f27cf', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4a351397-eac2-4349-9d36-327fbf4f27cf', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4a351397-eac2-4349-9d36-327fbf4f27cf', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('4a351397-eac2-4349-9d36-327fbf4f27cf', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('ef8e532d-12fa-4f4c-be0d-7114bfbf0746', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ef8e532d-12fa-4f4c-be0d-7114bfbf0746', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('ef8e532d-12fa-4f4c-be0d-7114bfbf0746', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ef8e532d-12fa-4f4c-be0d-7114bfbf0746', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ef8e532d-12fa-4f4c-be0d-7114bfbf0746', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('ef8e532d-12fa-4f4c-be0d-7114bfbf0746', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('03acb789-86cd-425c-9e7b-042a0085d79f', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('03acb789-86cd-425c-9e7b-042a0085d79f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('03acb789-86cd-425c-9e7b-042a0085d79f', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('03acb789-86cd-425c-9e7b-042a0085d79f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('03acb789-86cd-425c-9e7b-042a0085d79f', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('cce81cb4-a374-42d1-8d3f-255a39159de0', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('cce81cb4-a374-42d1-8d3f-255a39159de0', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cce81cb4-a374-42d1-8d3f-255a39159de0', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('cce81cb4-a374-42d1-8d3f-255a39159de0', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('cce81cb4-a374-42d1-8d3f-255a39159de0', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('7f777d33-50e9-46dc-be50-9d3aec16fc5b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7f777d33-50e9-46dc-be50-9d3aec16fc5b', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('7f777d33-50e9-46dc-be50-9d3aec16fc5b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7f777d33-50e9-46dc-be50-9d3aec16fc5b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7f777d33-50e9-46dc-be50-9d3aec16fc5b', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('7f777d33-50e9-46dc-be50-9d3aec16fc5b', 'String', 'jsonType.label');


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.realm VALUES ('662f6baf-45d0-437d-b002-c3f9ccdcb69d', 60, 300, 300, NULL, NULL, NULL, true, false, 0, NULL, 'book-store', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '8ee0d957-5dec-483c-b661-baeb2c562480', 1800, false, NULL, false, false, false, true, 0, 1, 30, 6, 'HmacSHA1', 'totp', '520fad15-8981-402d-a4a1-501d74ff1e5d', '2702976c-d524-4ac9-aecb-d15bdc2e106c', '5f092739-61f4-41c0-bba6-24beb17d3692', '066486dd-fef3-4290-a604-5a552c223679', '624a9489-d8ed-4b14-a78f-975f06c16818', 2592000, false, 900, true, false, '128ad414-638b-47ef-9596-d9296d7b785d', 0, false, 0, 0, 'c46a9467-cb5a-4888-b8c1-fd6623005642');
INSERT INTO public.realm VALUES ('4f89db84-b6ab-4c26-9379-2721c83ea282', 60, 300, 60, NULL, NULL, NULL, true, false, 0, NULL, 'master', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, 'a2c1b33c-e756-4940-a4f1-61a3731486e5', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', '5ad2f65b-7df3-4ea3-8275-c632e42c8c9b', 'ec76bc03-5b39-4a28-b244-95fdc4f753e1', 'bc15276d-2c0c-4fac-b15c-5eceea6c3e0a', 'fc37e675-cace-4a7c-86a5-f73f97ea55f8', 'f5ad85e5-09c0-4722-b3b9-f5f405cf04cd', 2592000, false, 900, true, false, '70d9b1c5-35e6-42ca-a266-2837be0c900b', 0, false, 0, 0, 'f5c83ef0-54a2-4cfd-9aef-953eb769bc24');


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicyReportOnly', '4f89db84-b6ab-4c26-9379-2721c83ea282', '');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xContentTypeOptions', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'nosniff');
INSERT INTO public.realm_attribute VALUES ('_browser_header.referrerPolicy', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'no-referrer');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xRobotsTag', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'none');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xFrameOptions', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'SAMEORIGIN');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicy', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xXSSProtection', '4f89db84-b6ab-4c26-9379-2721c83ea282', '1; mode=block');
INSERT INTO public.realm_attribute VALUES ('_browser_header.strictTransportSecurity', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'max-age=31536000; includeSubDomains');
INSERT INTO public.realm_attribute VALUES ('bruteForceProtected', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'false');
INSERT INTO public.realm_attribute VALUES ('permanentLockout', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'false');
INSERT INTO public.realm_attribute VALUES ('maxFailureWaitSeconds', '4f89db84-b6ab-4c26-9379-2721c83ea282', '900');
INSERT INTO public.realm_attribute VALUES ('minimumQuickLoginWaitSeconds', '4f89db84-b6ab-4c26-9379-2721c83ea282', '60');
INSERT INTO public.realm_attribute VALUES ('waitIncrementSeconds', '4f89db84-b6ab-4c26-9379-2721c83ea282', '60');
INSERT INTO public.realm_attribute VALUES ('quickLoginCheckMilliSeconds', '4f89db84-b6ab-4c26-9379-2721c83ea282', '1000');
INSERT INTO public.realm_attribute VALUES ('maxDeltaTimeSeconds', '4f89db84-b6ab-4c26-9379-2721c83ea282', '43200');
INSERT INTO public.realm_attribute VALUES ('failureFactor', '4f89db84-b6ab-4c26-9379-2721c83ea282', '30');
INSERT INTO public.realm_attribute VALUES ('realmReusableOtpCode', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'false');
INSERT INTO public.realm_attribute VALUES ('displayName', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'Keycloak');
INSERT INTO public.realm_attribute VALUES ('displayNameHtml', '4f89db84-b6ab-4c26-9379-2721c83ea282', '<div class="kc-logo-text"><span>Keycloak</span></div>');
INSERT INTO public.realm_attribute VALUES ('defaultSignatureAlgorithm', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'RS256');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', '4f89db84-b6ab-4c26-9379-2721c83ea282', 'false');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespan', '4f89db84-b6ab-4c26-9379-2721c83ea282', '5184000');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicyReportOnly', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xContentTypeOptions', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'nosniff');
INSERT INTO public.realm_attribute VALUES ('_browser_header.referrerPolicy', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'no-referrer');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xRobotsTag', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'none');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xFrameOptions', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'SAMEORIGIN');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicy', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xXSSProtection', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '1; mode=block');
INSERT INTO public.realm_attribute VALUES ('_browser_header.strictTransportSecurity', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'max-age=31536000; includeSubDomains');
INSERT INTO public.realm_attribute VALUES ('bruteForceProtected', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'false');
INSERT INTO public.realm_attribute VALUES ('permanentLockout', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'false');
INSERT INTO public.realm_attribute VALUES ('maxFailureWaitSeconds', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '900');
INSERT INTO public.realm_attribute VALUES ('minimumQuickLoginWaitSeconds', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '60');
INSERT INTO public.realm_attribute VALUES ('waitIncrementSeconds', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '60');
INSERT INTO public.realm_attribute VALUES ('quickLoginCheckMilliSeconds', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '1000');
INSERT INTO public.realm_attribute VALUES ('maxDeltaTimeSeconds', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '43200');
INSERT INTO public.realm_attribute VALUES ('failureFactor', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '30');
INSERT INTO public.realm_attribute VALUES ('realmReusableOtpCode', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'false');
INSERT INTO public.realm_attribute VALUES ('displayName', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '');
INSERT INTO public.realm_attribute VALUES ('displayNameHtml', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '');
INSERT INTO public.realm_attribute VALUES ('defaultSignatureAlgorithm', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'RS256');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'false');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespan', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '5184000');
INSERT INTO public.realm_attribute VALUES ('clientSessionIdleTimeout', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '0');
INSERT INTO public.realm_attribute VALUES ('clientSessionMaxLifespan', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '0');
INSERT INTO public.realm_attribute VALUES ('clientOfflineSessionIdleTimeout', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '0');
INSERT INTO public.realm_attribute VALUES ('clientOfflineSessionMaxLifespan', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '0');
INSERT INTO public.realm_attribute VALUES ('actionTokenGeneratedByAdminLifespan', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '43200');
INSERT INTO public.realm_attribute VALUES ('actionTokenGeneratedByUserLifespan', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '300');
INSERT INTO public.realm_attribute VALUES ('oauth2DeviceCodeLifespan', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '600');
INSERT INTO public.realm_attribute VALUES ('oauth2DevicePollingInterval', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '5');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpEntityName', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'keycloak');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithms', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'ES256');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpId', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreference', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachment', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRequireResidentKey', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirement', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyCreateTimeout', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '0');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegister', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'false');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpEntityNamePasswordless', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'keycloak');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithmsPasswordless', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'ES256');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpIdPasswordless', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreferencePasswordless', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachmentPasswordless', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRequireResidentKeyPasswordless', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirementPasswordless', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'not specified');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyCreateTimeoutPasswordless', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '0');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'false');
INSERT INTO public.realm_attribute VALUES ('cibaBackchannelTokenDeliveryMode', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'poll');
INSERT INTO public.realm_attribute VALUES ('cibaExpiresIn', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '120');
INSERT INTO public.realm_attribute VALUES ('cibaInterval', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '5');
INSERT INTO public.realm_attribute VALUES ('cibaAuthRequestedUserHint', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'login_hint');
INSERT INTO public.realm_attribute VALUES ('parRequestUriLifespan', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '60');
INSERT INTO public.realm_attribute VALUES ('frontendUrl', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '');
INSERT INTO public.realm_attribute VALUES ('acr.loa.map', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '{}');
INSERT INTO public.realm_attribute VALUES ('client-policies.profiles', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '{"profiles":[]}');
INSERT INTO public.realm_attribute VALUES ('client-policies.policies', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '{"policies":[]}');


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.realm_events_listeners VALUES ('4f89db84-b6ab-4c26-9379-2721c83ea282', 'jboss-logging');
INSERT INTO public.realm_events_listeners VALUES ('662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'jboss-logging');


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.realm_required_credential VALUES ('password', 'password', true, true, '4f89db84-b6ab-4c26-9379-2721c83ea282');
INSERT INTO public.realm_required_credential VALUES ('password', 'password', true, true, '662f6baf-45d0-437d-b002-c3f9ccdcb69d');


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.redirect_uris VALUES ('4ccb117c-ecb3-4923-b26f-c59e869f7569', '/realms/master/account/*');
INSERT INTO public.redirect_uris VALUES ('fb633313-8670-4ab9-9b1b-05bf0b2bcc50', '/realms/master/account/*');
INSERT INTO public.redirect_uris VALUES ('be41090f-f94f-4875-81c0-825e3801cc9d', '/admin/master/console/*');
INSERT INTO public.redirect_uris VALUES ('ba615863-d949-4598-8196-54c21b254108', '/realms/book-store/account/*');
INSERT INTO public.redirect_uris VALUES ('68386798-a2f4-4e98-8a57-5454fb60df2d', '/realms/book-store/account/*');
INSERT INTO public.redirect_uris VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', '/*');
INSERT INTO public.redirect_uris VALUES ('a7d51e28-21a4-49e0-9430-d5d9057589ed', '/admin/book-store/console/*');


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.required_action_provider VALUES ('93414e0f-819c-4088-848f-ceeb946a60f5', 'VERIFY_EMAIL', 'Verify Email', '4f89db84-b6ab-4c26-9379-2721c83ea282', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('91c3caf7-51a0-4608-93d7-89ea34327acf', 'UPDATE_PROFILE', 'Update Profile', '4f89db84-b6ab-4c26-9379-2721c83ea282', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('e2513ed9-3c23-43e5-abfe-e1af77015ea9', 'CONFIGURE_TOTP', 'Configure OTP', '4f89db84-b6ab-4c26-9379-2721c83ea282', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('03b8cfde-700b-4437-90e8-5eec5b42cc63', 'UPDATE_PASSWORD', 'Update Password', '4f89db84-b6ab-4c26-9379-2721c83ea282', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('10d49b51-9720-4ce4-b737-b85c5e3adaba', 'TERMS_AND_CONDITIONS', 'Terms and Conditions', '4f89db84-b6ab-4c26-9379-2721c83ea282', false, false, 'TERMS_AND_CONDITIONS', 20);
INSERT INTO public.required_action_provider VALUES ('021a9443-98e9-48a2-b6f1-d76ec8689b4d', 'delete_account', 'Delete Account', '4f89db84-b6ab-4c26-9379-2721c83ea282', false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider VALUES ('0cf6bda8-7236-4c3c-a67e-556b806f6cf2', 'update_user_locale', 'Update User Locale', '4f89db84-b6ab-4c26-9379-2721c83ea282', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider VALUES ('725c9ce2-207c-4ae4-b27d-d1889a31262c', 'webauthn-register', 'Webauthn Register', '4f89db84-b6ab-4c26-9379-2721c83ea282', true, false, 'webauthn-register', 70);
INSERT INTO public.required_action_provider VALUES ('847f524a-b78c-437e-98b4-52fba4ad26a3', 'webauthn-register-passwordless', 'Webauthn Register Passwordless', '4f89db84-b6ab-4c26-9379-2721c83ea282', true, false, 'webauthn-register-passwordless', 80);
INSERT INTO public.required_action_provider VALUES ('f7b8a68a-432e-4bb7-ac3f-527f7c471919', 'CONFIGURE_TOTP', 'Configure OTP', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('6426b574-bd38-4a89-b41c-3f07f7a9b37c', 'TERMS_AND_CONDITIONS', 'Terms and Conditions', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', false, false, 'TERMS_AND_CONDITIONS', 20);
INSERT INTO public.required_action_provider VALUES ('573d82cd-fe28-4afd-ad43-320ef9483207', 'UPDATE_PASSWORD', 'Update Password', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('a7b69803-0a38-4736-83aa-73fd29be0eca', 'UPDATE_PROFILE', 'Update Profile', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('f3b68612-8108-4e25-aa7c-8c5b8e59d05a', 'VERIFY_EMAIL', 'Verify Email', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('d041f6df-e49d-4b78-8a70-cb465a85f008', 'delete_account', 'Delete Account', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider VALUES ('fa750e0b-6666-4d7a-ac88-e92a01414b85', 'webauthn-register', 'Webauthn Register', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'webauthn-register', 70);
INSERT INTO public.required_action_provider VALUES ('7e18621b-9f9b-4aea-866b-f9ede4fd275b', 'webauthn-register-passwordless', 'Webauthn Register Passwordless', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'webauthn-register-passwordless', 80);
INSERT INTO public.required_action_provider VALUES ('d112ac83-bab8-450c-a1f4-327a628a81b3', 'update_user_locale', 'Update User Locale', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'update_user_locale', 1000);


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.scope_mapping VALUES ('fb633313-8670-4ab9-9b1b-05bf0b2bcc50', '31be48c7-defa-455c-80a7-460e99252b58');
INSERT INTO public.scope_mapping VALUES ('fb633313-8670-4ab9-9b1b-05bf0b2bcc50', 'f715c4c7-58a5-4621-9668-07a2e7a9b13c');
INSERT INTO public.scope_mapping VALUES ('68386798-a2f4-4e98-8a57-5454fb60df2d', 'e9c15a9c-cf20-4253-90d7-171d41c4983e');
INSERT INTO public.scope_mapping VALUES ('68386798-a2f4-4e98-8a57-5454fb60df2d', '1d014aad-d78d-4d6e-a18e-007b4247c731');


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.user_entity VALUES ('dfe6cbce-8259-403d-8c56-b0706e742b96', NULL, '2ad0ea3f-9cae-4e84-8fe4-629be5252e82', false, true, NULL, NULL, NULL, '4f89db84-b6ab-4c26-9379-2721c83ea282', 'admin', 1699111613516, NULL, 0);
INSERT INTO public.user_entity VALUES ('0eaf28c1-4cb9-48c9-bcb7-4f08d454a5e0', 'denis.gerasimychev@mail.ru', 'denis.gerasimychev@mail.ru', false, true, NULL, '╨Ф╨╡╨╜╨╕╤Б', '╨У╨╡╤А╨░╤Б╨╕╨╝╤Л╤З╨╡╨▓', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'denis.gerasimychev', 1699111894903, NULL, 0);
INSERT INTO public.user_entity VALUES ('9093dfb6-921a-4720-9e61-48d9afca806f', 'user@user', 'user@user', false, true, NULL, NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'user', 1699112166342, NULL, 0);
INSERT INTO public.user_entity VALUES ('311bc161-8782-4ea5-b781-a81bad2fda49', 'admin@admin', 'admin@admin', false, true, NULL, NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'admin', 1699112186314, NULL, 0);


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.user_required_action VALUES ('0eaf28c1-4cb9-48c9-bcb7-4f08d454a5e0', 'UPDATE_PASSWORD');


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.user_role_mapping VALUES ('f5c83ef0-54a2-4cfd-9aef-953eb769bc24', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('8ea68742-9f52-4819-9658-4d1689997311', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('b6d67654-8192-4fbd-9693-edb0089645bf', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('3e62bc95-fcdb-4560-86dc-1f7492966e58', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('db79a392-8f97-4be0-a090-bf04885e4c19', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('2987d87b-d691-4c02-a5f9-356980b00f15', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('70b446d3-d46e-4750-9fbf-d3506a5a4bff', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('6d685d4c-c46d-4cf2-89b9-9a779212feee', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('8c1dd062-7952-41dd-b67e-78c33d002c05', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('02ad528d-b5d8-45db-8f50-beb336236bba', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('c9e09ad0-2b56-4f19-a1d6-56f598198df4', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('662013f4-50ea-48f8-8c71-aeaf59a05233', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('af71130f-3a73-4189-a270-0c92a1d49f4c', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('9bbeb1c8-455d-4f3c-9e2f-400be7fef098', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('42dc3456-a774-49de-8694-4785fbda47f5', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('9c971d51-2aed-4260-aa20-6008cca90773', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('733e1931-97e9-48a1-93c4-6e4e628222fd', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('662e4b28-ad11-437f-a056-7aba337433c8', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('317d16ec-c3fa-48b2-b087-fe4b5b801736', 'dfe6cbce-8259-403d-8c56-b0706e742b96');
INSERT INTO public.user_role_mapping VALUES ('c46a9467-cb5a-4888-b8c1-fd6623005642', '0eaf28c1-4cb9-48c9-bcb7-4f08d454a5e0');
INSERT INTO public.user_role_mapping VALUES ('aa5bd567-3466-41e3-bf8d-a6e1a13f9047', '0eaf28c1-4cb9-48c9-bcb7-4f08d454a5e0');
INSERT INTO public.user_role_mapping VALUES ('c46a9467-cb5a-4888-b8c1-fd6623005642', '9093dfb6-921a-4720-9e61-48d9afca806f');
INSERT INTO public.user_role_mapping VALUES ('c46a9467-cb5a-4888-b8c1-fd6623005642', '311bc161-8782-4ea5-b781-a81bad2fda49');
INSERT INTO public.user_role_mapping VALUES ('47414939-f003-4b0f-8a12-7b2f17f98a37', '311bc161-8782-4ea5-b781-a81bad2fda49');
INSERT INTO public.user_role_mapping VALUES ('aa5bd567-3466-41e3-bf8d-a6e1a13f9047', '311bc161-8782-4ea5-b781-a81bad2fda49');


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.web_origins VALUES ('be41090f-f94f-4875-81c0-825e3801cc9d', '+');
INSERT INTO public.web_origins VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', '/*');
INSERT INTO public.web_origins VALUES ('a7d51e28-21a4-49e0-9430-d5d9057589ed', '+');


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

