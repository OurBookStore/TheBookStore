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

--
-- Name: book-store-db; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE "book-store-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "book-store-db" OWNER TO admin;

\connect -reuse-previous=on "dbname='book-store-db'"

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

INSERT INTO public.authentication_execution VALUES ('7224e571-b0df-4862-8701-f4f34f968c18', NULL, 'auth-cookie', '22037ef2-30b3-470d-85d6-637d3c8b987f', '939b4814-33da-4863-8614-148695102913', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('fda5ebd0-e2b0-4701-8283-f62a01becd16', NULL, 'auth-spnego', '22037ef2-30b3-470d-85d6-637d3c8b987f', '939b4814-33da-4863-8614-148695102913', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7fa412b8-00a3-4cff-94f3-097309ada738', NULL, 'identity-provider-redirector', '22037ef2-30b3-470d-85d6-637d3c8b987f', '939b4814-33da-4863-8614-148695102913', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('69e2d88b-2c8e-4a39-9a80-274112c8626c', NULL, NULL, '22037ef2-30b3-470d-85d6-637d3c8b987f', '939b4814-33da-4863-8614-148695102913', 2, 30, true, '1bef60df-5a43-4fae-9b4d-0cd5772f7825', NULL);
INSERT INTO public.authentication_execution VALUES ('1031a3aa-6185-452e-b293-2230dd489a94', NULL, 'auth-username-password-form', '22037ef2-30b3-470d-85d6-637d3c8b987f', '1bef60df-5a43-4fae-9b4d-0cd5772f7825', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('6e162f87-3755-44b0-bb7f-4316186d2d77', NULL, NULL, '22037ef2-30b3-470d-85d6-637d3c8b987f', '1bef60df-5a43-4fae-9b4d-0cd5772f7825', 1, 20, true, '78cb7b46-0d41-4ee0-8c58-9a78d88eb22e', NULL);
INSERT INTO public.authentication_execution VALUES ('df93ef79-992a-42d2-a4ba-77f196af9a5b', NULL, 'conditional-user-configured', '22037ef2-30b3-470d-85d6-637d3c8b987f', '78cb7b46-0d41-4ee0-8c58-9a78d88eb22e', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c2e4ce8a-87a7-4b85-a813-cf560cd4a6a5', NULL, 'auth-otp-form', '22037ef2-30b3-470d-85d6-637d3c8b987f', '78cb7b46-0d41-4ee0-8c58-9a78d88eb22e', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('2de2cbbd-4de1-4993-80fc-5362a7d4e719', NULL, 'direct-grant-validate-username', '22037ef2-30b3-470d-85d6-637d3c8b987f', '8b22fc3b-9675-4f23-85c9-51a2c27cd948', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b2cd00bb-ebe6-4414-a7b3-ed47ce5cfd94', NULL, 'direct-grant-validate-password', '22037ef2-30b3-470d-85d6-637d3c8b987f', '8b22fc3b-9675-4f23-85c9-51a2c27cd948', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7d6765e5-03f3-4caf-9564-27f9bbf0677f', NULL, NULL, '22037ef2-30b3-470d-85d6-637d3c8b987f', '8b22fc3b-9675-4f23-85c9-51a2c27cd948', 1, 30, true, 'ec3912e5-b896-4c68-82ca-f7a1d14998c9', NULL);
INSERT INTO public.authentication_execution VALUES ('0ef06034-2e79-4dde-8149-c3f6921f3dc6', NULL, 'conditional-user-configured', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'ec3912e5-b896-4c68-82ca-f7a1d14998c9', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('533fa689-56d0-49a3-aa83-79b5e2ccf54a', NULL, 'direct-grant-validate-otp', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'ec3912e5-b896-4c68-82ca-f7a1d14998c9', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('3b372838-2f21-434e-8297-bd843fa119ef', NULL, 'registration-page-form', '22037ef2-30b3-470d-85d6-637d3c8b987f', '634c1c33-d32b-44f1-b594-8ad69f8a9874', 0, 10, true, '32289ba9-06b5-489a-889b-49abad42dfbf', NULL);
INSERT INTO public.authentication_execution VALUES ('9d692706-c520-4a60-898c-b153c8e31c65', NULL, 'registration-user-creation', '22037ef2-30b3-470d-85d6-637d3c8b987f', '32289ba9-06b5-489a-889b-49abad42dfbf', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7b04ec98-0e8e-476c-9d38-f747cddf51d6', NULL, 'registration-profile-action', '22037ef2-30b3-470d-85d6-637d3c8b987f', '32289ba9-06b5-489a-889b-49abad42dfbf', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('0d2375bb-6217-4c57-8854-1fc1fb7b85d8', NULL, 'registration-password-action', '22037ef2-30b3-470d-85d6-637d3c8b987f', '32289ba9-06b5-489a-889b-49abad42dfbf', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b6126e40-16eb-4ff8-9a5b-1d95e79394ab', NULL, 'registration-recaptcha-action', '22037ef2-30b3-470d-85d6-637d3c8b987f', '32289ba9-06b5-489a-889b-49abad42dfbf', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7b1b5db7-0887-4df1-a0f4-fdee5e3dc1dc', NULL, 'registration-terms-and-conditions', '22037ef2-30b3-470d-85d6-637d3c8b987f', '32289ba9-06b5-489a-889b-49abad42dfbf', 3, 70, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('8a46c4c1-038a-4ff5-8e88-e86bc2b1748c', NULL, 'reset-credentials-choose-user', '22037ef2-30b3-470d-85d6-637d3c8b987f', '524ab0a5-b0f6-472a-a792-4780f4189f3d', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4892f640-a46b-4df1-b72d-7a02bf726448', NULL, 'reset-credential-email', '22037ef2-30b3-470d-85d6-637d3c8b987f', '524ab0a5-b0f6-472a-a792-4780f4189f3d', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('afa9e217-bdea-4686-a8ce-277cd1b25031', NULL, 'reset-password', '22037ef2-30b3-470d-85d6-637d3c8b987f', '524ab0a5-b0f6-472a-a792-4780f4189f3d', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('2dd9a1e9-c91f-4b8c-9088-477d0cdcb337', NULL, NULL, '22037ef2-30b3-470d-85d6-637d3c8b987f', '524ab0a5-b0f6-472a-a792-4780f4189f3d', 1, 40, true, '5809c4c0-80a4-4925-9cad-43540b837924', NULL);
INSERT INTO public.authentication_execution VALUES ('2542e01e-c8c4-4b1a-8286-e181b4de9074', NULL, 'conditional-user-configured', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5809c4c0-80a4-4925-9cad-43540b837924', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f79c63d0-e028-4f43-978a-9aa22d1c3be7', NULL, 'reset-otp', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5809c4c0-80a4-4925-9cad-43540b837924', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('9640249d-2065-41ce-a070-5db3bdfb2bd3', NULL, 'client-secret', '22037ef2-30b3-470d-85d6-637d3c8b987f', '33952e99-a84e-4c60-b590-4cb507237dd4', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('321dde1e-cdcc-4708-81c7-c4d3d94db52c', NULL, 'client-jwt', '22037ef2-30b3-470d-85d6-637d3c8b987f', '33952e99-a84e-4c60-b590-4cb507237dd4', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7f29861a-fae5-4f85-a780-59d05ffc72cd', NULL, 'client-secret-jwt', '22037ef2-30b3-470d-85d6-637d3c8b987f', '33952e99-a84e-4c60-b590-4cb507237dd4', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4d0bc112-fc09-40a1-b9cd-6bfee851f272', NULL, 'client-x509', '22037ef2-30b3-470d-85d6-637d3c8b987f', '33952e99-a84e-4c60-b590-4cb507237dd4', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a57c878f-dfa1-4088-bb6e-e5ecd6de7f3d', NULL, 'idp-review-profile', '22037ef2-30b3-470d-85d6-637d3c8b987f', '8e1a8fab-8003-4d35-ace4-f2efc6e5c1a4', 0, 10, false, NULL, 'a7398ce0-07a0-4117-8767-8c66c2b160b8');
INSERT INTO public.authentication_execution VALUES ('f68cf80a-9960-4370-96b6-7a8bb4622a79', NULL, NULL, '22037ef2-30b3-470d-85d6-637d3c8b987f', '8e1a8fab-8003-4d35-ace4-f2efc6e5c1a4', 0, 20, true, '6867cc25-0c1f-42c2-9bfb-a662e86378fe', NULL);
INSERT INTO public.authentication_execution VALUES ('64261b7b-170f-4d19-88b8-cd48b4a47a73', NULL, 'idp-create-user-if-unique', '22037ef2-30b3-470d-85d6-637d3c8b987f', '6867cc25-0c1f-42c2-9bfb-a662e86378fe', 2, 10, false, NULL, 'd81ffc4b-143c-4f70-a0cd-550b697f3f90');
INSERT INTO public.authentication_execution VALUES ('61704913-6ef7-4eee-a628-ec8e16367b6c', NULL, NULL, '22037ef2-30b3-470d-85d6-637d3c8b987f', '6867cc25-0c1f-42c2-9bfb-a662e86378fe', 2, 20, true, '83dfbb4a-4f61-4661-ac16-c16d9996e26e', NULL);
INSERT INTO public.authentication_execution VALUES ('9e63d596-16b3-4b40-9b2c-d328ff1ccd02', NULL, 'idp-confirm-link', '22037ef2-30b3-470d-85d6-637d3c8b987f', '83dfbb4a-4f61-4661-ac16-c16d9996e26e', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('fd1850c8-e8d4-4049-9e60-2158f1a25024', NULL, NULL, '22037ef2-30b3-470d-85d6-637d3c8b987f', '83dfbb4a-4f61-4661-ac16-c16d9996e26e', 0, 20, true, '4fca0cb7-8131-4178-acc9-f150c9d80762', NULL);
INSERT INTO public.authentication_execution VALUES ('f1b8fc3a-786b-4c19-82d7-07059742955b', NULL, 'idp-email-verification', '22037ef2-30b3-470d-85d6-637d3c8b987f', '4fca0cb7-8131-4178-acc9-f150c9d80762', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a8a029f0-ce3b-42b7-b19a-18f23878e5d1', NULL, NULL, '22037ef2-30b3-470d-85d6-637d3c8b987f', '4fca0cb7-8131-4178-acc9-f150c9d80762', 2, 20, true, '248f3627-cd0a-4159-9260-4e2f63d48415', NULL);
INSERT INTO public.authentication_execution VALUES ('993622d2-e0b6-4504-9870-4ba38cefe45a', NULL, 'idp-username-password-form', '22037ef2-30b3-470d-85d6-637d3c8b987f', '248f3627-cd0a-4159-9260-4e2f63d48415', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('61673f8e-6b6b-44c9-9f8b-e0fcb674d5f1', NULL, NULL, '22037ef2-30b3-470d-85d6-637d3c8b987f', '248f3627-cd0a-4159-9260-4e2f63d48415', 1, 20, true, 'c2331f94-cafd-4790-942d-bf4ba34441bc', NULL);
INSERT INTO public.authentication_execution VALUES ('19e3e702-635b-483a-8395-efe9ea2d1fad', NULL, 'conditional-user-configured', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'c2331f94-cafd-4790-942d-bf4ba34441bc', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('0a62ee40-1ea1-4606-be16-9abf73d731d5', NULL, 'auth-otp-form', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'c2331f94-cafd-4790-942d-bf4ba34441bc', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e95e1d2b-1328-4a86-9a16-528301c549a3', NULL, 'http-basic-authenticator', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'cb45feeb-4741-45e7-afdd-5b524c6b26e4', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7528e8ca-9a15-4839-9ea1-e82772176be7', NULL, 'docker-http-basic-authenticator', '22037ef2-30b3-470d-85d6-637d3c8b987f', '1315e749-e301-4c8e-ba1d-ff0a753e7bca', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('72ce7bcb-2c46-4047-bf85-2c5553b1493e', NULL, 'idp-email-verification', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2c212dee-ad76-414c-a0a9-fdfae1dab9e7', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('62f171e5-1f8a-4cec-b811-bd13e976c922', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2c212dee-ad76-414c-a0a9-fdfae1dab9e7', 2, 20, true, '7e683a5b-de1a-4768-a163-457d57458978', NULL);
INSERT INTO public.authentication_execution VALUES ('b37f31d1-43a5-4a2a-9d4c-9a4765795d68', NULL, 'conditional-user-configured', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '1d76af7e-8c7c-46e1-bbc0-3fc0f95ddfda', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('763cfe15-f095-4438-aaca-039fe694bdc9', NULL, 'auth-otp-form', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '1d76af7e-8c7c-46e1-bbc0-3fc0f95ddfda', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('899e994a-4c78-45c2-bc9b-530a163ad29f', NULL, 'conditional-user-configured', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '64ef3b81-6e8b-4ad7-a258-29e548388c11', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('90861955-05a7-472e-ba84-8d5e27e04796', NULL, 'direct-grant-validate-otp', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '64ef3b81-6e8b-4ad7-a258-29e548388c11', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4e377a9b-b314-4719-b141-2eeae7361583', NULL, 'conditional-user-configured', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '9d4a44f5-09fc-4a13-8ca5-ca54f4ce38d9', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('af855296-83a4-4202-8552-8b6d398e10e6', NULL, 'auth-otp-form', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '9d4a44f5-09fc-4a13-8ca5-ca54f4ce38d9', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f50bd3f2-fe1b-4655-b4cf-fa9d10165211', NULL, 'idp-confirm-link', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2457a574-ea6d-4de8-b419-db9876bde108', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f2d7518d-d388-47f2-b914-851af881a697', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2457a574-ea6d-4de8-b419-db9876bde108', 0, 20, true, '2c212dee-ad76-414c-a0a9-fdfae1dab9e7', NULL);
INSERT INTO public.authentication_execution VALUES ('ae8a9962-cb8f-4242-ac63-7dfb82b729fe', NULL, 'conditional-user-configured', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '43ccd003-31b8-44da-93f8-6724bcb8b503', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c19c6061-946e-4125-bdce-398d4edf9484', NULL, 'reset-otp', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '43ccd003-31b8-44da-93f8-6724bcb8b503', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('0a4d9a5a-2666-4b07-8667-d51a64c88008', NULL, 'idp-create-user-if-unique', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2cfc1295-cd45-43c7-b8e6-bd14ae5e685e', 2, 10, false, NULL, '9295d203-65a1-4d61-ad4a-081a4dc16aee');
INSERT INTO public.authentication_execution VALUES ('33617fec-94a5-4b94-bde1-3ce813920f70', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2cfc1295-cd45-43c7-b8e6-bd14ae5e685e', 2, 20, true, '2457a574-ea6d-4de8-b419-db9876bde108', NULL);
INSERT INTO public.authentication_execution VALUES ('02ca5f4e-14b8-4c01-a686-8f25a3e40d2b', NULL, 'idp-username-password-form', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '7e683a5b-de1a-4768-a163-457d57458978', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4728e30a-c39c-4c82-8e68-0a61b0fddf8c', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '7e683a5b-de1a-4768-a163-457d57458978', 1, 20, true, '9d4a44f5-09fc-4a13-8ca5-ca54f4ce38d9', NULL);
INSERT INTO public.authentication_execution VALUES ('f91f66a4-bfee-4091-b6e8-31b7e107706e', NULL, 'auth-cookie', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '520fad15-8981-402d-a4a1-501d74ff1e5d', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e0742228-b70c-4ba5-82d6-ce739ed9b9cd', NULL, 'auth-spnego', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '520fad15-8981-402d-a4a1-501d74ff1e5d', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5143d505-aa09-4c88-ba45-a1bd14d68b75', NULL, 'identity-provider-redirector', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '520fad15-8981-402d-a4a1-501d74ff1e5d', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('cb2a3b58-c4e1-4fb3-a708-ea121c8cfbb9', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '520fad15-8981-402d-a4a1-501d74ff1e5d', 2, 30, true, '6a6972fe-39d2-46ad-b0c3-675e4c7494f8', NULL);
INSERT INTO public.authentication_execution VALUES ('e347f297-84b3-4ef5-ac45-c7119c643380', NULL, 'client-secret', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '624a9489-d8ed-4b14-a78f-975f06c16818', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('fa09fe83-687d-4441-9e84-5539c5741536', NULL, 'client-jwt', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '624a9489-d8ed-4b14-a78f-975f06c16818', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4bb03b38-11bb-436d-8d74-a1d7f459612d', NULL, 'client-secret-jwt', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '624a9489-d8ed-4b14-a78f-975f06c16818', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4d03dabd-feef-4e56-8a35-8906ac19972c', NULL, 'client-x509', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '624a9489-d8ed-4b14-a78f-975f06c16818', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c2f39aaf-9e4e-4897-ae67-4d99564b59ef', NULL, 'direct-grant-validate-username', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '5f092739-61f4-41c0-bba6-24beb17d3692', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('dfca1109-5aff-451b-ab11-7f33dbeb94fc', NULL, 'direct-grant-validate-password', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '5f092739-61f4-41c0-bba6-24beb17d3692', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('0644d8a6-ae92-4a6b-9185-e638a900e3b6', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '5f092739-61f4-41c0-bba6-24beb17d3692', 1, 30, true, '64ef3b81-6e8b-4ad7-a258-29e548388c11', NULL);
INSERT INTO public.authentication_execution VALUES ('70e2eba1-6fa1-4dd5-9539-5ab0e99bf7b9', NULL, 'docker-http-basic-authenticator', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '128ad414-638b-47ef-9596-d9296d7b785d', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('15f8201e-bf51-44a0-9701-e5e13ba535ed', NULL, 'idp-review-profile', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'd31ee24b-2d32-4f28-a496-168400c7c27f', 0, 10, false, NULL, '05f5f1a3-e153-4fc8-af4a-cb39f4a3ffa0');
INSERT INTO public.authentication_execution VALUES ('ca72f9e0-6b72-405b-b5b3-07a28be7049a', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'd31ee24b-2d32-4f28-a496-168400c7c27f', 0, 20, true, '2cfc1295-cd45-43c7-b8e6-bd14ae5e685e', NULL);
INSERT INTO public.authentication_execution VALUES ('3ce6cb98-5c7d-4dc8-ab39-95ab1f660954', NULL, 'auth-username-password-form', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '6a6972fe-39d2-46ad-b0c3-675e4c7494f8', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('95ad9a19-9958-4333-bd8b-fd70f98062f6', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '6a6972fe-39d2-46ad-b0c3-675e4c7494f8', 1, 20, true, '1d76af7e-8c7c-46e1-bbc0-3fc0f95ddfda', NULL);
INSERT INTO public.authentication_execution VALUES ('feb9d62f-41cd-4a9b-9a33-b04b56d2eb21', NULL, 'registration-page-form', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2702976c-d524-4ac9-aecb-d15bdc2e106c', 0, 10, true, 'e70d46c7-23b9-4274-9211-275c58d18c07', NULL);
INSERT INTO public.authentication_execution VALUES ('32116033-05c3-4f67-a1dc-a43482ead171', NULL, 'registration-user-creation', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'e70d46c7-23b9-4274-9211-275c58d18c07', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ead5b8f0-c85d-4220-94c1-ec503991a905', NULL, 'registration-profile-action', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'e70d46c7-23b9-4274-9211-275c58d18c07', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e2ec38f1-a799-47fa-ac48-dc49d823582b', NULL, 'registration-password-action', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'e70d46c7-23b9-4274-9211-275c58d18c07', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c7c747eb-baa0-47d4-8b47-5a3478099e53', NULL, 'registration-recaptcha-action', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'e70d46c7-23b9-4274-9211-275c58d18c07', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ce2a67ef-2958-4bab-958b-e2b88122e499', NULL, 'reset-credentials-choose-user', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '066486dd-fef3-4290-a604-5a552c223679', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('af63fe0c-45fd-4cbf-8c2b-cb24209bbad0', NULL, 'reset-credential-email', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '066486dd-fef3-4290-a604-5a552c223679', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('bbcb8529-7dcc-497b-bccc-3c800caefdf9', NULL, 'reset-password', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '066486dd-fef3-4290-a604-5a552c223679', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('38e51a77-ecf6-459a-b9d2-b22eca15e6d5', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '066486dd-fef3-4290-a604-5a552c223679', 1, 40, true, '43ccd003-31b8-44da-93f8-6724bcb8b503', NULL);
INSERT INTO public.authentication_execution VALUES ('61db0574-b89b-44f1-b015-f67de21385b3', NULL, 'http-basic-authenticator', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'c25faa73-2fa4-4a7b-9c75-9d135ae5b858', 0, 10, false, NULL, NULL);


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.authentication_flow VALUES ('939b4814-33da-4863-8614-148695102913', 'browser', 'browser based authentication', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('1bef60df-5a43-4fae-9b4d-0cd5772f7825', 'forms', 'Username, password, otp and other auth forms.', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('78cb7b46-0d41-4ee0-8c58-9a78d88eb22e', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('8b22fc3b-9675-4f23-85c9-51a2c27cd948', 'direct grant', 'OpenID Connect Resource Owner Grant', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('ec3912e5-b896-4c68-82ca-f7a1d14998c9', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('634c1c33-d32b-44f1-b594-8ad69f8a9874', 'registration', 'registration flow', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('32289ba9-06b5-489a-889b-49abad42dfbf', 'registration form', 'registration form', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'form-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('524ab0a5-b0f6-472a-a792-4780f4189f3d', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('5809c4c0-80a4-4925-9cad-43540b837924', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('33952e99-a84e-4c60-b590-4cb507237dd4', 'clients', 'Base authentication for clients', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'client-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('8e1a8fab-8003-4d35-ace4-f2efc6e5c1a4', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('6867cc25-0c1f-42c2-9bfb-a662e86378fe', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('83dfbb4a-4f61-4661-ac16-c16d9996e26e', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('4fca0cb7-8131-4178-acc9-f150c9d80762', 'Account verification options', 'Method with which to verity the existing account', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('248f3627-cd0a-4159-9260-4e2f63d48415', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('c2331f94-cafd-4790-942d-bf4ba34441bc', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('cb45feeb-4741-45e7-afdd-5b524c6b26e4', 'saml ecp', 'SAML ECP Profile Authentication Flow', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('1315e749-e301-4c8e-ba1d-ff0a753e7bca', 'docker auth', 'Used by Docker clients to authenticate against the IDP', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'basic-flow', true, true);
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

INSERT INTO public.authenticator_config VALUES ('a7398ce0-07a0-4117-8767-8c66c2b160b8', 'review profile config', '22037ef2-30b3-470d-85d6-637d3c8b987f');
INSERT INTO public.authenticator_config VALUES ('d81ffc4b-143c-4f70-a0cd-550b697f3f90', 'create unique user config', '22037ef2-30b3-470d-85d6-637d3c8b987f');
INSERT INTO public.authenticator_config VALUES ('9295d203-65a1-4d61-ad4a-081a4dc16aee', 'create unique user config', '662f6baf-45d0-437d-b002-c3f9ccdcb69d');
INSERT INTO public.authenticator_config VALUES ('05f5f1a3-e153-4fc8-af4a-cb39f4a3ffa0', 'review profile config', '662f6baf-45d0-437d-b002-c3f9ccdcb69d');


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.authenticator_config_entry VALUES ('a7398ce0-07a0-4117-8767-8c66c2b160b8', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('d81ffc4b-143c-4f70-a0cd-550b697f3f90', 'false', 'require.password.update.after.registration');
INSERT INTO public.authenticator_config_entry VALUES ('05f5f1a3-e153-4fc8-af4a-cb39f4a3ffa0', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('9295d203-65a1-4d61-ad4a-081a4dc16aee', 'false', 'require.password.update.after.registration');


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.client VALUES ('109f3c90-f5d8-49f4-ac95-17874d87788a', true, false, 'master-realm', 0, false, NULL, NULL, true, NULL, false, '22037ef2-30b3-470d-85d6-637d3c8b987f', NULL, 0, false, false, 'master Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('afd73214-e3a5-4289-ae35-0732685112b0', true, false, 'account', 0, true, NULL, '/realms/master/account/', false, NULL, false, '22037ef2-30b3-470d-85d6-637d3c8b987f', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('4a2dc3f0-8d1e-4947-a648-f2f935a8cd20', true, false, 'account-console', 0, true, NULL, '/realms/master/account/', false, NULL, false, '22037ef2-30b3-470d-85d6-637d3c8b987f', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('fca6f700-c50c-4d30-927b-341e1106aa38', true, false, 'broker', 0, false, NULL, NULL, true, NULL, false, '22037ef2-30b3-470d-85d6-637d3c8b987f', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('3289e176-4211-420c-8a77-40debd6547e8', true, false, 'security-admin-console', 0, true, NULL, '/admin/master/console/', false, NULL, false, '22037ef2-30b3-470d-85d6-637d3c8b987f', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('430a97dc-5aa9-4b96-a3e9-e1141eed1aae', true, false, 'admin-cli', 0, true, NULL, NULL, false, NULL, false, '22037ef2-30b3-470d-85d6-637d3c8b987f', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client VALUES ('5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, false, 'book-store-realm', 0, false, NULL, NULL, true, NULL, false, '22037ef2-30b3-470d-85d6-637d3c8b987f', NULL, 0, false, false, 'book-store Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('ba615863-d949-4598-8196-54c21b254108', true, false, 'account', 0, true, NULL, '/realms/book-store/account/', false, NULL, false, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('68386798-a2f4-4e98-8a57-5454fb60df2d', true, false, 'account-console', 0, true, NULL, '/realms/book-store/account/', false, NULL, false, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('3116363e-8efe-4679-a852-89a7bf206afd', true, false, 'admin-cli', 0, true, NULL, NULL, false, NULL, false, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client VALUES ('252223fa-2762-4017-8030-1a29dd200de3', true, false, 'broker', 0, false, NULL, NULL, true, NULL, false, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('579e5e42-c2b8-4014-a671-36ce67cb0809', true, true, 'my-client', 0, true, NULL, '', false, '', false, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'openid-connect', -1, true, false, '${my_client}', false, 'client-secret', '', '', NULL, false, false, true, true);
INSERT INTO public.client VALUES ('8ad65de2-9c9b-4fcc-96df-3cf8979fbfa9', true, false, 'realm-management', 0, false, NULL, NULL, true, NULL, false, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'openid-connect', 0, false, false, '${client_realm-management}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('a7d51e28-21a4-49e0-9430-d5d9057589ed', true, false, 'security-admin-console', 0, true, NULL, '/admin/book-store/console/', false, NULL, false, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.client_attributes VALUES ('afd73214-e3a5-4289-ae35-0732685112b0', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes VALUES ('4a2dc3f0-8d1e-4947-a648-f2f935a8cd20', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes VALUES ('4a2dc3f0-8d1e-4947-a648-f2f935a8cd20', 'pkce.code.challenge.method', 'S256');
INSERT INTO public.client_attributes VALUES ('3289e176-4211-420c-8a77-40debd6547e8', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes VALUES ('3289e176-4211-420c-8a77-40debd6547e8', 'pkce.code.challenge.method', 'S256');
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

INSERT INTO public.client_scope VALUES ('d4b83deb-5e20-4c07-859e-bf61986ca0b3', 'offline_access', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope VALUES ('7be9df09-0869-4fa5-a827-aed8f1774836', 'role_list', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'SAML role list', 'saml');
INSERT INTO public.client_scope VALUES ('2e7104a4-61bc-49eb-9275-b00a23e94785', 'profile', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope VALUES ('0a720260-d8b4-4f87-92bf-0189e5c50f6e', 'email', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope VALUES ('b46b5dd5-cfb8-40d3-814d-6b1962f165df', 'address', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope VALUES ('a2afbdf1-3bf7-4d41-8622-36160bd08504', 'phone', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope VALUES ('582567ed-3b58-4b1e-bf91-3540c389b1c1', 'roles', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('105b96cb-1aea-4e1f-88eb-4fa290fe1987', 'web-origins', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('94ee8b1b-a58f-437a-a3b8-ca7920f6ffcb', 'microprofile-jwt', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope VALUES ('399fe0b7-d548-4fb1-a429-6780db1c0762', 'acr', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'OpenID Connect scope for add acr (authentication context class reference) to the token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('12fc35b7-afa6-4605-8ec5-9001a0f17249', 'web-origins', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('10b81998-d0dd-43fa-8a0b-ddf2e775091d', 'acr', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'OpenID Connect scope for add acr (authentication context class reference) to the token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('3562dbfe-5f4f-4e89-b933-9d2ff9ec974a', 'profile', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope VALUES ('5ac85481-bd42-4d44-87c3-21dd888a765a', 'role_list', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'SAML role list', 'saml');
INSERT INTO public.client_scope VALUES ('a74e7451-421b-4bad-9c82-162e697ff7d2', 'email', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope VALUES ('45aa243d-d9ba-4001-97f7-f4d7b1e4e633', 'microprofile-jwt', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope VALUES ('3f4517ce-ebc1-4861-bbf1-07f04eb6e3a1', 'address', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope VALUES ('be0864bb-8303-4994-911b-ac1a89d71091', 'offline_access', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope VALUES ('bc81bbf6-7a6b-4e63-953c-b0b4b4555a3e', 'phone', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope VALUES ('6f55dc1e-f7c5-4024-b51f-a588bd525ad7', 'roles', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.client_scope_attributes VALUES ('d4b83deb-5e20-4c07-859e-bf61986ca0b3', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('d4b83deb-5e20-4c07-859e-bf61986ca0b3', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('7be9df09-0869-4fa5-a827-aed8f1774836', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('7be9df09-0869-4fa5-a827-aed8f1774836', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('2e7104a4-61bc-49eb-9275-b00a23e94785', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('2e7104a4-61bc-49eb-9275-b00a23e94785', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('2e7104a4-61bc-49eb-9275-b00a23e94785', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('0a720260-d8b4-4f87-92bf-0189e5c50f6e', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('0a720260-d8b4-4f87-92bf-0189e5c50f6e', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('0a720260-d8b4-4f87-92bf-0189e5c50f6e', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('b46b5dd5-cfb8-40d3-814d-6b1962f165df', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('b46b5dd5-cfb8-40d3-814d-6b1962f165df', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('b46b5dd5-cfb8-40d3-814d-6b1962f165df', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('a2afbdf1-3bf7-4d41-8622-36160bd08504', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('a2afbdf1-3bf7-4d41-8622-36160bd08504', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('a2afbdf1-3bf7-4d41-8622-36160bd08504', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('582567ed-3b58-4b1e-bf91-3540c389b1c1', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('582567ed-3b58-4b1e-bf91-3540c389b1c1', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('582567ed-3b58-4b1e-bf91-3540c389b1c1', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('105b96cb-1aea-4e1f-88eb-4fa290fe1987', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('105b96cb-1aea-4e1f-88eb-4fa290fe1987', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('105b96cb-1aea-4e1f-88eb-4fa290fe1987', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('94ee8b1b-a58f-437a-a3b8-ca7920f6ffcb', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('94ee8b1b-a58f-437a-a3b8-ca7920f6ffcb', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('399fe0b7-d548-4fb1-a429-6780db1c0762', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('399fe0b7-d548-4fb1-a429-6780db1c0762', 'false', 'include.in.token.scope');
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

INSERT INTO public.client_scope_client VALUES ('afd73214-e3a5-4289-ae35-0732685112b0', '582567ed-3b58-4b1e-bf91-3540c389b1c1', true);
INSERT INTO public.client_scope_client VALUES ('afd73214-e3a5-4289-ae35-0732685112b0', '2e7104a4-61bc-49eb-9275-b00a23e94785', true);
INSERT INTO public.client_scope_client VALUES ('afd73214-e3a5-4289-ae35-0732685112b0', '105b96cb-1aea-4e1f-88eb-4fa290fe1987', true);
INSERT INTO public.client_scope_client VALUES ('afd73214-e3a5-4289-ae35-0732685112b0', '0a720260-d8b4-4f87-92bf-0189e5c50f6e', true);
INSERT INTO public.client_scope_client VALUES ('afd73214-e3a5-4289-ae35-0732685112b0', '399fe0b7-d548-4fb1-a429-6780db1c0762', true);
INSERT INTO public.client_scope_client VALUES ('afd73214-e3a5-4289-ae35-0732685112b0', 'd4b83deb-5e20-4c07-859e-bf61986ca0b3', false);
INSERT INTO public.client_scope_client VALUES ('afd73214-e3a5-4289-ae35-0732685112b0', 'b46b5dd5-cfb8-40d3-814d-6b1962f165df', false);
INSERT INTO public.client_scope_client VALUES ('afd73214-e3a5-4289-ae35-0732685112b0', '94ee8b1b-a58f-437a-a3b8-ca7920f6ffcb', false);
INSERT INTO public.client_scope_client VALUES ('afd73214-e3a5-4289-ae35-0732685112b0', 'a2afbdf1-3bf7-4d41-8622-36160bd08504', false);
INSERT INTO public.client_scope_client VALUES ('4a2dc3f0-8d1e-4947-a648-f2f935a8cd20', '582567ed-3b58-4b1e-bf91-3540c389b1c1', true);
INSERT INTO public.client_scope_client VALUES ('4a2dc3f0-8d1e-4947-a648-f2f935a8cd20', '2e7104a4-61bc-49eb-9275-b00a23e94785', true);
INSERT INTO public.client_scope_client VALUES ('4a2dc3f0-8d1e-4947-a648-f2f935a8cd20', '105b96cb-1aea-4e1f-88eb-4fa290fe1987', true);
INSERT INTO public.client_scope_client VALUES ('4a2dc3f0-8d1e-4947-a648-f2f935a8cd20', '0a720260-d8b4-4f87-92bf-0189e5c50f6e', true);
INSERT INTO public.client_scope_client VALUES ('4a2dc3f0-8d1e-4947-a648-f2f935a8cd20', '399fe0b7-d548-4fb1-a429-6780db1c0762', true);
INSERT INTO public.client_scope_client VALUES ('4a2dc3f0-8d1e-4947-a648-f2f935a8cd20', 'd4b83deb-5e20-4c07-859e-bf61986ca0b3', false);
INSERT INTO public.client_scope_client VALUES ('4a2dc3f0-8d1e-4947-a648-f2f935a8cd20', 'b46b5dd5-cfb8-40d3-814d-6b1962f165df', false);
INSERT INTO public.client_scope_client VALUES ('4a2dc3f0-8d1e-4947-a648-f2f935a8cd20', '94ee8b1b-a58f-437a-a3b8-ca7920f6ffcb', false);
INSERT INTO public.client_scope_client VALUES ('4a2dc3f0-8d1e-4947-a648-f2f935a8cd20', 'a2afbdf1-3bf7-4d41-8622-36160bd08504', false);
INSERT INTO public.client_scope_client VALUES ('430a97dc-5aa9-4b96-a3e9-e1141eed1aae', '582567ed-3b58-4b1e-bf91-3540c389b1c1', true);
INSERT INTO public.client_scope_client VALUES ('430a97dc-5aa9-4b96-a3e9-e1141eed1aae', '2e7104a4-61bc-49eb-9275-b00a23e94785', true);
INSERT INTO public.client_scope_client VALUES ('430a97dc-5aa9-4b96-a3e9-e1141eed1aae', '105b96cb-1aea-4e1f-88eb-4fa290fe1987', true);
INSERT INTO public.client_scope_client VALUES ('430a97dc-5aa9-4b96-a3e9-e1141eed1aae', '0a720260-d8b4-4f87-92bf-0189e5c50f6e', true);
INSERT INTO public.client_scope_client VALUES ('430a97dc-5aa9-4b96-a3e9-e1141eed1aae', '399fe0b7-d548-4fb1-a429-6780db1c0762', true);
INSERT INTO public.client_scope_client VALUES ('430a97dc-5aa9-4b96-a3e9-e1141eed1aae', 'd4b83deb-5e20-4c07-859e-bf61986ca0b3', false);
INSERT INTO public.client_scope_client VALUES ('430a97dc-5aa9-4b96-a3e9-e1141eed1aae', 'b46b5dd5-cfb8-40d3-814d-6b1962f165df', false);
INSERT INTO public.client_scope_client VALUES ('430a97dc-5aa9-4b96-a3e9-e1141eed1aae', '94ee8b1b-a58f-437a-a3b8-ca7920f6ffcb', false);
INSERT INTO public.client_scope_client VALUES ('430a97dc-5aa9-4b96-a3e9-e1141eed1aae', 'a2afbdf1-3bf7-4d41-8622-36160bd08504', false);
INSERT INTO public.client_scope_client VALUES ('fca6f700-c50c-4d30-927b-341e1106aa38', '582567ed-3b58-4b1e-bf91-3540c389b1c1', true);
INSERT INTO public.client_scope_client VALUES ('fca6f700-c50c-4d30-927b-341e1106aa38', '2e7104a4-61bc-49eb-9275-b00a23e94785', true);
INSERT INTO public.client_scope_client VALUES ('fca6f700-c50c-4d30-927b-341e1106aa38', '105b96cb-1aea-4e1f-88eb-4fa290fe1987', true);
INSERT INTO public.client_scope_client VALUES ('fca6f700-c50c-4d30-927b-341e1106aa38', '0a720260-d8b4-4f87-92bf-0189e5c50f6e', true);
INSERT INTO public.client_scope_client VALUES ('fca6f700-c50c-4d30-927b-341e1106aa38', '399fe0b7-d548-4fb1-a429-6780db1c0762', true);
INSERT INTO public.client_scope_client VALUES ('fca6f700-c50c-4d30-927b-341e1106aa38', 'd4b83deb-5e20-4c07-859e-bf61986ca0b3', false);
INSERT INTO public.client_scope_client VALUES ('fca6f700-c50c-4d30-927b-341e1106aa38', 'b46b5dd5-cfb8-40d3-814d-6b1962f165df', false);
INSERT INTO public.client_scope_client VALUES ('fca6f700-c50c-4d30-927b-341e1106aa38', '94ee8b1b-a58f-437a-a3b8-ca7920f6ffcb', false);
INSERT INTO public.client_scope_client VALUES ('fca6f700-c50c-4d30-927b-341e1106aa38', 'a2afbdf1-3bf7-4d41-8622-36160bd08504', false);
INSERT INTO public.client_scope_client VALUES ('109f3c90-f5d8-49f4-ac95-17874d87788a', '582567ed-3b58-4b1e-bf91-3540c389b1c1', true);
INSERT INTO public.client_scope_client VALUES ('109f3c90-f5d8-49f4-ac95-17874d87788a', '2e7104a4-61bc-49eb-9275-b00a23e94785', true);
INSERT INTO public.client_scope_client VALUES ('109f3c90-f5d8-49f4-ac95-17874d87788a', '105b96cb-1aea-4e1f-88eb-4fa290fe1987', true);
INSERT INTO public.client_scope_client VALUES ('109f3c90-f5d8-49f4-ac95-17874d87788a', '0a720260-d8b4-4f87-92bf-0189e5c50f6e', true);
INSERT INTO public.client_scope_client VALUES ('109f3c90-f5d8-49f4-ac95-17874d87788a', '399fe0b7-d548-4fb1-a429-6780db1c0762', true);
INSERT INTO public.client_scope_client VALUES ('109f3c90-f5d8-49f4-ac95-17874d87788a', 'd4b83deb-5e20-4c07-859e-bf61986ca0b3', false);
INSERT INTO public.client_scope_client VALUES ('109f3c90-f5d8-49f4-ac95-17874d87788a', 'b46b5dd5-cfb8-40d3-814d-6b1962f165df', false);
INSERT INTO public.client_scope_client VALUES ('109f3c90-f5d8-49f4-ac95-17874d87788a', '94ee8b1b-a58f-437a-a3b8-ca7920f6ffcb', false);
INSERT INTO public.client_scope_client VALUES ('109f3c90-f5d8-49f4-ac95-17874d87788a', 'a2afbdf1-3bf7-4d41-8622-36160bd08504', false);
INSERT INTO public.client_scope_client VALUES ('3289e176-4211-420c-8a77-40debd6547e8', '582567ed-3b58-4b1e-bf91-3540c389b1c1', true);
INSERT INTO public.client_scope_client VALUES ('3289e176-4211-420c-8a77-40debd6547e8', '2e7104a4-61bc-49eb-9275-b00a23e94785', true);
INSERT INTO public.client_scope_client VALUES ('3289e176-4211-420c-8a77-40debd6547e8', '105b96cb-1aea-4e1f-88eb-4fa290fe1987', true);
INSERT INTO public.client_scope_client VALUES ('3289e176-4211-420c-8a77-40debd6547e8', '0a720260-d8b4-4f87-92bf-0189e5c50f6e', true);
INSERT INTO public.client_scope_client VALUES ('3289e176-4211-420c-8a77-40debd6547e8', '399fe0b7-d548-4fb1-a429-6780db1c0762', true);
INSERT INTO public.client_scope_client VALUES ('3289e176-4211-420c-8a77-40debd6547e8', 'd4b83deb-5e20-4c07-859e-bf61986ca0b3', false);
INSERT INTO public.client_scope_client VALUES ('3289e176-4211-420c-8a77-40debd6547e8', 'b46b5dd5-cfb8-40d3-814d-6b1962f165df', false);
INSERT INTO public.client_scope_client VALUES ('3289e176-4211-420c-8a77-40debd6547e8', '94ee8b1b-a58f-437a-a3b8-ca7920f6ffcb', false);
INSERT INTO public.client_scope_client VALUES ('3289e176-4211-420c-8a77-40debd6547e8', 'a2afbdf1-3bf7-4d41-8622-36160bd08504', false);
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

INSERT INTO public.client_scope_role_mapping VALUES ('d4b83deb-5e20-4c07-859e-bf61986ca0b3', '6794f26e-1c71-40f8-9b18-478c68d317b1');
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

INSERT INTO public.component VALUES ('804dae5a-81c0-4082-af74-d4e99bff5656', 'Trusted Hosts', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'anonymous');
INSERT INTO public.component VALUES ('43570547-7f17-4cf6-9da1-0c67a5d7d838', 'Consent Required', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'anonymous');
INSERT INTO public.component VALUES ('2732b7e6-0999-4a35-8279-26d483780535', 'Full Scope Disabled', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'anonymous');
INSERT INTO public.component VALUES ('e71e6d1e-07aa-4d50-8818-2ddcaa4c9679', 'Max Clients Limit', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'anonymous');
INSERT INTO public.component VALUES ('2aedf753-dcbb-4705-917a-e6440077bbf5', 'Allowed Protocol Mapper Types', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'anonymous');
INSERT INTO public.component VALUES ('caebd116-4eda-43bb-aae7-66ef4e6e37cd', 'Allowed Client Scopes', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'anonymous');
INSERT INTO public.component VALUES ('fe81dcdb-d245-4dc2-ab01-533d1410394a', 'Allowed Protocol Mapper Types', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'authenticated');
INSERT INTO public.component VALUES ('80364555-4f90-42a0-bae3-cc0c8c0f9940', 'Allowed Client Scopes', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'authenticated');
INSERT INTO public.component VALUES ('87b928a5-8d16-4877-9563-78c8999fcb11', 'rsa-generated', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'rsa-generated', 'org.keycloak.keys.KeyProvider', '22037ef2-30b3-470d-85d6-637d3c8b987f', NULL);
INSERT INTO public.component VALUES ('c0c100d7-14a5-4ee6-8d1b-bf67756950ff', 'rsa-enc-generated', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'rsa-enc-generated', 'org.keycloak.keys.KeyProvider', '22037ef2-30b3-470d-85d6-637d3c8b987f', NULL);
INSERT INTO public.component VALUES ('40e9a121-4139-4416-ad38-51be92051e29', 'hmac-generated', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'hmac-generated', 'org.keycloak.keys.KeyProvider', '22037ef2-30b3-470d-85d6-637d3c8b987f', NULL);
INSERT INTO public.component VALUES ('fbc9ea9e-82e3-4ef9-85c8-e799bba71513', 'aes-generated', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'aes-generated', 'org.keycloak.keys.KeyProvider', '22037ef2-30b3-470d-85d6-637d3c8b987f', NULL);
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

INSERT INTO public.component_config VALUES ('0eff51f5-dd8d-4c4c-893d-a7cbffcea0d4', '2aedf753-dcbb-4705-917a-e6440077bbf5', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('c71207ab-ab2a-4bde-95a7-f0406804ee4a', '2aedf753-dcbb-4705-917a-e6440077bbf5', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('3f0f3aaa-3377-4634-a4f5-91dc305a68b0', '2aedf753-dcbb-4705-917a-e6440077bbf5', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('3430aba6-94c8-4067-8f90-f305079f1f08', '2aedf753-dcbb-4705-917a-e6440077bbf5', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('80aeb213-8d38-4461-a6ed-05b8297d3e02', '2aedf753-dcbb-4705-917a-e6440077bbf5', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('d76f9873-3af3-4c89-b5ad-6ce5df653fb2', '2aedf753-dcbb-4705-917a-e6440077bbf5', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('0283923f-4c21-4177-a038-a43bc5dbcf64', '2aedf753-dcbb-4705-917a-e6440077bbf5', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('785cbd29-cf84-474a-85d7-0d4905c68462', '2aedf753-dcbb-4705-917a-e6440077bbf5', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('671db608-f429-4594-a7e4-3ec94e9fa5f2', 'e71e6d1e-07aa-4d50-8818-2ddcaa4c9679', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('40938482-ef78-4d5a-9a03-2fc4c5b0748c', '804dae5a-81c0-4082-af74-d4e99bff5656', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('aaf1c8dd-3460-4b91-8059-723060c63b4a', '804dae5a-81c0-4082-af74-d4e99bff5656', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('4f4bd398-34ce-4557-a81d-f49697d0c05e', 'caebd116-4eda-43bb-aae7-66ef4e6e37cd', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('0024b3cb-0ed5-4f93-bc76-d8658622dcad', '80364555-4f90-42a0-bae3-cc0c8c0f9940', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('45248f30-da99-4621-b7a3-d2b03594ff18', 'fe81dcdb-d245-4dc2-ab01-533d1410394a', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('12be58eb-ef34-4d93-86d9-427c8cf3ab08', 'fe81dcdb-d245-4dc2-ab01-533d1410394a', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('e8e89b24-0d37-4a50-a182-2b0f00318702', 'fe81dcdb-d245-4dc2-ab01-533d1410394a', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('c4bcadda-9cd2-4768-872a-4a651bdff680', 'fe81dcdb-d245-4dc2-ab01-533d1410394a', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('e61c026f-33ed-4964-9ce5-a088ae0e04ee', 'fe81dcdb-d245-4dc2-ab01-533d1410394a', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('30d456c3-4db0-4432-a034-877144b02f07', 'fe81dcdb-d245-4dc2-ab01-533d1410394a', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('82855807-b9b4-4681-9ef2-a5e72773522f', 'fe81dcdb-d245-4dc2-ab01-533d1410394a', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('2ef78156-f426-47bc-a979-229d15a484c3', 'fe81dcdb-d245-4dc2-ab01-533d1410394a', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('c4355a4d-bb37-481c-80d8-c851f44d24d4', 'fbc9ea9e-82e3-4ef9-85c8-e799bba71513', 'secret', 'J_LWc86wyyvyaPzKpRN9gg');
INSERT INTO public.component_config VALUES ('0c728987-69ce-407d-86ea-c6ce09229090', 'fbc9ea9e-82e3-4ef9-85c8-e799bba71513', 'kid', 'df35751e-6da5-4f6d-99e1-396db8918e6d');
INSERT INTO public.component_config VALUES ('8869bebf-0bf8-4236-b667-33a2659fad72', 'fbc9ea9e-82e3-4ef9-85c8-e799bba71513', 'priority', '100');
INSERT INTO public.component_config VALUES ('752cf1d8-cbaf-4e7a-abac-4118a95eb255', 'c0c100d7-14a5-4ee6-8d1b-bf67756950ff', 'priority', '100');
INSERT INTO public.component_config VALUES ('98f7fd11-b9d7-4da2-9486-fe02bfd81084', 'c0c100d7-14a5-4ee6-8d1b-bf67756950ff', 'privateKey', 'MIIEogIBAAKCAQEAwIcQ7xlNYlP2lNT8qVkJkdg86qgb3MPBF7+aL5BSPJ8jCaZ2s/OyXMmBwwAJWP+5a35JY1PHBDl8pVsPi+G+/eMRLX1sRgJ5caSYfVoX+e/hMzvJAswnGJH9RxusbuILi6JoClygVwV5ZLtZ5mv7B7oCdryZQRXmUqlQHNswhSHvNW4+9hbKKW0JW6nLSPqcnO+MVWQ2paTudkZUFpifjXYV38gdaWtIxnU6jed24rh/G7aL8AZbqXVcpqCC4NMBLrinLRwlOjpK1B1egpUcOfwCWI713/qStcf+MPdPOMyZuJwDwAS27GTBvUbQw7J+ORizDbpTxmUiCCkwheGPdQIDAQABAoIBADqsTtxXDS7EoNaNrCxd7p0sVbA7qDYY0C1RHoeVR4KjCtYDjZRc1cQSQwHu7mpZkKPyOiJTo0ilzldET5IVK5QLEa6X1Rnm4iTggPperQTl9m8bLrC0D8wcnaAAjoXCTLtytJtHzDOI/wxUTlr7GGcr6FlQM7JSnr0dTUVmBTzk6O4zjhZrM7aQSF1/6gsCXqAkk9ZYLMRweQud9npz++8fRC3M9zLrjnO36b5Wo01APYJusqu/gdUKXt2papXAMJUpoy+XjWzZmw4OMN9fELReG9vCGp8i/vT7jXJclwGGj+yml07ZY35wvR0wlylhZ1rJ+aIKB7y4xOcdqdbYkhcCgYEA+ChBfroMbPsB+EIPCaXgmqsE48waL+ksk9B2wwcnowaxEb1y9L11hT89152xGo19Ii1JM3qpuzgpES+Ft7EQ1B0n9j2IpoKUqSaqa5DHVdzxl5jE2lh6L687+BpQXblyj3+M9GmW2QFKr6dyme8NhIVmcnQuzyyI/5xRQQLn7KMCgYEAxpy7fZ2CJj98Ja52/qMdk1kToVCGsnV4YUKsO8+2bWdLGPL2mMucIBfywut9lh9kEynpO6OCZ9iCZIyGlJGKZvyoJju/jIeUnGhNGxuXDjG7egx4rb/qsesXbDoRFnmOqc/5LKIQPhdYZUkO8knsw47NjgzTGdIQqngQcvZv/QcCgYBeBPJ7jwWyLI+cfXqxDxW/w9fAbs3lJRTsk+jLD2TnEVv4+qwZKcbiywklLeuxwbWNQ1cel/TCqA53ImgpJn7XvowrcTjazVKBm9KpmlrLn0AxTYIXr7nrYxr3bxDP0bkjwRGocHDkmuavEmQLClU2xkwARSCPAbKOFa17UhyIvQKBgGHYCM3DcMCi+egeYOTlOsbCVVddMl5sXJednvgARiDziB2MZEu10v5EjgXUuZPhdw2x0gLddHrwQJyEVjCO2p4NzlC3kpAKov3CrGm0V+BYQ8HGrxT5vQdVh757hLuLuuqRWHHSjSnpmlSbf0+Bd7CHg2B9lOndgPRaHdBk85q1AoGARjzhJH/DXeI3G1+9k1Q/wNwB+WnBsojODLzMPs9lUncRuGoKIBJq9To1JzOc9f9OfRHmx565v5tGWOhcZ41ItaNALNMLAJ2vAw8xKpdFfNRzbEyukMS+jR0NkCCIN9ZPTShLnYMyizBuzMeFYPOGrYophQYbmdKvpU6/4YTGoOk=');
INSERT INTO public.component_config VALUES ('c6c2409c-39fc-42d2-b017-d1d0649806c9', 'c0c100d7-14a5-4ee6-8d1b-bf67756950ff', 'certificate', 'MIICmzCCAYMCBgGLmzwyYjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMTA0MTY0NjM1WhcNMzMxMTA0MTY0ODE1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDAhxDvGU1iU/aU1PypWQmR2DzqqBvcw8EXv5ovkFI8nyMJpnaz87JcyYHDAAlY/7lrfkljU8cEOXylWw+L4b794xEtfWxGAnlxpJh9Whf57+EzO8kCzCcYkf1HG6xu4guLomgKXKBXBXlku1nma/sHugJ2vJlBFeZSqVAc2zCFIe81bj72FsopbQlbqctI+pyc74xVZDalpO52RlQWmJ+NdhXfyB1pa0jGdTqN53biuH8btovwBlupdVymoILg0wEuuKctHCU6OkrUHV6ClRw5/AJYjvXf+pK1x/4w9084zJm4nAPABLbsZMG9RtDDsn45GLMNulPGZSIIKTCF4Y91AgMBAAEwDQYJKoZIhvcNAQELBQADggEBADUeLrmFbFCTRk/1qV8R3LD65OwPGmKS8kyV+KX/NLRmY4ju2tm8h5pI2QFR/quRoEQcwpesbkyap+hjMzIrNdYaYmP4wntrlKaybRsKKNAxvvzZ14eiy68fB3ftEYy0ScR/a5VdVZGoHUqjGvwEJ6h+hWpXDpivFBB6hvAoyO7HTFgcNwLZX+FAlzw0vHoMdpiqNriM2WMdhyzhe8+vcPFeO4fWrZO0q6NjYTeoa/O50qsIBYNfiZd+bZjS8T039nuz0e069lwLkezLs7lz77HaZ+UDfrTyldrVr1/b/HHED7apW4R3Bcvb6fNlvNAJzNPmQ7dLxKBJotleQL1p6iw=');
INSERT INTO public.component_config VALUES ('8d1df3a0-ddb2-456c-b606-8260a1e49a84', 'c0c100d7-14a5-4ee6-8d1b-bf67756950ff', 'algorithm', 'RSA-OAEP');
INSERT INTO public.component_config VALUES ('c17435fa-aa17-47aa-a87b-aaa3ad713403', 'c0c100d7-14a5-4ee6-8d1b-bf67756950ff', 'keyUse', 'ENC');
INSERT INTO public.component_config VALUES ('02d223c8-99ec-448d-bcff-338e147b7024', '40e9a121-4139-4416-ad38-51be92051e29', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('f5ec1da9-959f-4d10-a87c-5be094cc2d7a', '40e9a121-4139-4416-ad38-51be92051e29', 'priority', '100');
INSERT INTO public.component_config VALUES ('0882811f-6dec-4cf1-be2f-f0d59bf1ae0a', '40e9a121-4139-4416-ad38-51be92051e29', 'secret', 'kyCIaDwSzbMb60JgTBEDOV4xa0r-rro1nrhcIMimjrdWJqmmBiX7-jPdusdgylGUeSIzsy2YZvgkLnRARfTKew');
INSERT INTO public.component_config VALUES ('1562fa4d-b692-4299-bb44-06927b472e60', '40e9a121-4139-4416-ad38-51be92051e29', 'kid', '4b6f4e20-3dac-4d2c-b540-4de6334084da');
INSERT INTO public.component_config VALUES ('d37dd430-02ce-4f07-be15-af95516d6ab9', 'ed029d0b-6d80-4bdd-a21a-7c909d87d494', 'secret', 'JgmLzYrUuqlS6oq2l3pq_YQAwEvNbC3JbR2y1EOD6dUHpaULqiNh7RE2FZGOYIGDRyiHO6LNZEUhrWnBZ1zyfw');
INSERT INTO public.component_config VALUES ('46a63b00-b3ea-4631-9b87-3dc5ed404937', 'ed029d0b-6d80-4bdd-a21a-7c909d87d494', 'priority', '100');
INSERT INTO public.component_config VALUES ('bb0284d0-575c-444b-beae-750efaf896b7', 'ed029d0b-6d80-4bdd-a21a-7c909d87d494', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('fa1846f0-0c7b-4700-aa74-b74628acc635', 'ed029d0b-6d80-4bdd-a21a-7c909d87d494', 'kid', 'e24dad49-b2b8-4b41-8a2a-095a9426bf84');
INSERT INTO public.component_config VALUES ('d2243211-28e2-4b7c-bf49-993f5b9a8e7b', 'f0f2a0a4-b58a-43ed-8035-158c5120b350', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('393badf6-eaf5-4669-a22a-818597040367', '1e3a64aa-1eab-42a3-844b-b1aa6799d624', 'algorithm', 'RSA-OAEP');
INSERT INTO public.component_config VALUES ('0bd88ec8-3734-424f-a162-3febf3c2f8da', '87b928a5-8d16-4877-9563-78c8999fcb11', 'certificate', 'MIICmzCCAYMCBgGLmzwxnDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMTA0MTY0NjM1WhcNMzMxMTA0MTY0ODE1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCwFD0/OIHET/UO3fmpHsg7UjWd1HXOo82/3QtNO5QAAJmlPy3RuaJddhTzGFGzif5lUZuB5q69diz6wdK+c8t9ZEBAbx8anRaa9qLMT4h7pUbu5kjFJ53++yWaf8WvIeq4/oNIg3Fl/ldPZc0ghsJUOml43oEl8nik3edkGvuJR6jN7L6HGW5W7Dn7kP5a3xPprOE9g6xcoY8ijo/o+KTk146IM9bZZ7jdIyqEaYXLbjJN3W+ZfrO2kpcmyUljIhTKu19GP/wDM0WEB+T+eaCpvpnXTn1UJ0tUOuzBzFz/5CLa4l97SO4Vuao0+CrAEGU3U/itMVyJ1KSyjliAGGyHAgMBAAEwDQYJKoZIhvcNAQELBQADggEBABFdNbjU9+k1clqZ/DtK4wnq1pqAz3LPtoO79M3Et3FEq7KRo/cSyCySfRj1JIwjtjsJoPHSxoS8sORAC3d+Iy2KXWEQ22euTEkKeWoJk4BuUp+fzrvZdKSzhBohUfkdJ+AGdnnWLKG+79t5WakTJFSlTeNMYPZbj39CKZO3RBJVh3tyeJ0YN87V20CbsvXHs1+7aBqJXw+fZTSX3HUXzg4MtMWRB131tlg4jOgk/pn5RPmomNkGbL3JXs51HADdiLOXEUnQ968ErSTeNc/6jFXm/L9gRhZmjnRtvymB2Br2LZLsdPxx2D4Zqsyrj7fDX1HAWr5F+waxWFWScPCuXWs=');
INSERT INTO public.component_config VALUES ('ce30ab66-e37c-4978-bfb1-40ddcb3aa788', '87b928a5-8d16-4877-9563-78c8999fcb11', 'priority', '100');
INSERT INTO public.component_config VALUES ('e5e805dc-d759-46a0-91bd-3ddf4a715a0c', '87b928a5-8d16-4877-9563-78c8999fcb11', 'keyUse', 'SIG');
INSERT INTO public.component_config VALUES ('e3937c07-a1e2-4199-9aec-b63addf81593', '87b928a5-8d16-4877-9563-78c8999fcb11', 'privateKey', 'MIIEpAIBAAKCAQEAsBQ9PziBxE/1Dt35qR7IO1I1ndR1zqPNv90LTTuUAACZpT8t0bmiXXYU8xhRs4n+ZVGbgeauvXYs+sHSvnPLfWRAQG8fGp0WmvaizE+Ie6VG7uZIxSed/vslmn/FryHquP6DSINxZf5XT2XNIIbCVDppeN6BJfJ4pN3nZBr7iUeozey+hxluVuw5+5D+Wt8T6azhPYOsXKGPIo6P6Pik5NeOiDPW2We43SMqhGmFy24yTd1vmX6ztpKXJslJYyIUyrtfRj/8AzNFhAfk/nmgqb6Z1059VCdLVDrswcxc/+Qi2uJfe0juFbmqNPgqwBBlN1P4rTFcidSkso5YgBhshwIDAQABAoIBADDmRgYfMsaqr/NjiRjDIDd9Qr+kx9zN1++POzrFL3p6sDDYpWhnpeRPzUyftdznF1va+JVwU5nxTleLaXQT43Dc3Q0n7xrsgmEh2p9j/RLdmR/ym0YJlRLBe7V3A5b6E94xbJNAUcdSBbxamMeONTzABheXr4Uy2/dpWwANkEqUwpXsfh9FLu9dCBky+YqcZttL4OObyZ0E6BXyEhtxn9u3mL3gDf6dytOExAm8K97szlYvcy8D37lj0ixRMwIdrgld2/RbHOLOC2yQj7/q8u56sD3hrKzhxF77FfVhKqlS9ktu/UEo4vITalIIBRbrlgBCd00MDdKPRQUzLI2Lm10CgYEA3Gq9MlSdIDnlAVFEMyY9/SjCeMsQqJsw95oKjhqzLVV6Gvo/8jmd8qGf0KAxugpkxiGO1XBxpRm2XtJWgkVNdOBs0tJ+6JaesCISLKrF01O+I5pTP1UGtftWSt3Le08lVzeYzUgS+WeLi8gOH29voNhK6RzD3DZFpunN1GWZpD0CgYEAzIEhU6SaIqEMQ66uLFdPBFFhLMRiuUDNlba/NUys2DTlZT5Cmw8Xg/OEbSWu35P9SY7Rb0n/rWi39xeIQiLrbgf4+CYnVDmrzz8tCt0nthuSY4l9/NgcOf67yXGFrk8g76d1+vx8nNIKzwpNjJlqLDnzuPZgenk5jI6Uyir97BMCgYEAslzptxXDhHV0/Ejv4Fg852SZYjgoxde3m1Wa3v16KuA1jCkfn/rB9rqVYbSQKNUKUU6Mj+mK/Sg+bKLXAFnmYQLO7RcLPVnNFgisHlse9HCat6LFZMWARbkaTkEGzUTxmY9S5iNBv3Lr+HQuAYAim80LaXIuiD+ew4AFYK/K0Z0CgYBwQgYQSw/NKIh58r5rWrXmUeG82ES1Gmx/3WQSlvdea5Lsw4N+aIdpCFjOLVxUIIFuSnaO15kBELXDbmh+nXqM2NWDKjZ2ln3Icw5/oyy0W2g9OXEuRVchQsLEbouKRqd2xn8N+mFRGD+UrTwqjOBqTJmME7qcIEVF8dKdM4JVfwKBgQC4M7P+LYjsUJIjPeqbJqfMI0zL0U/CqqwZF1ZTtQAOPPj/N84R4TJNLCnqHp6jLXoin9B9qxYJyVth+eOl6hE6MkR7g1o+vtZeHFgIwKcUM3x6BYY4ft5iMiJjh+mDMG1EUsnooR8Nyqu7i/fDCRtEmSOyBbNPEkoPz+KkAVEn4g==');
INSERT INTO public.component_config VALUES ('bb3b3c32-1b69-4a80-9c4d-e16c510b4e5c', '11c9bee2-bf75-471c-8de8-286980530d10', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('cd1387ff-cd52-466d-b343-a69d196c85b3', '11c9bee2-bf75-471c-8de8-286980530d10', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('ed79ca33-062f-4bc2-8901-f55440bf53b2', '543ef0e8-1b64-436a-829f-f8d57819eb45', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('97cce6f3-2c61-4727-b970-5dbeed5f40ff', '28c2acd4-f5c7-4e0a-80b8-eac67ea5991c', 'kid', '56879d5b-bf74-40e3-b7d4-f55e152b1355');
INSERT INTO public.component_config VALUES ('1020217a-6fd9-493b-b7e6-2a5859183f1f', '28c2acd4-f5c7-4e0a-80b8-eac67ea5991c', 'secret', 'iYPZ8Vk7_fONuyNMXraFoA');
INSERT INTO public.component_config VALUES ('6b397098-277e-4585-84a5-5897458d4843', '28c2acd4-f5c7-4e0a-80b8-eac67ea5991c', 'priority', '100');
INSERT INTO public.component_config VALUES ('8e6e6942-279d-44de-a3b9-42b6618f7bc7', '7b62deb1-030d-4800-b41c-bd5398080ed2', 'certificate', 'MIICozCCAYsCBgGLm3ievjANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApib29rLXN0b3JlMB4XDTIzMTEwNDE3NTIzNVoXDTMzMTEwNDE3NTQxNVowFTETMBEGA1UEAwwKYm9vay1zdG9yZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMrVqlHIxiMjITXOm3uwV4iuC6KORu/vFrvXnk2UPgIOCtZwfazaAGlNLle/6E5WC4GADGUU0ZeUnp5sQA2UCr4A3YyB/ZFM6eE9VApkLu2CrpPFEMs0St/aYRupSoN+3KbXPPivWVhKlMHOSGK6GIJhxuWsEJDVwdOEn6yH2jVOmTVFjfn+DJ+gNC9bX7Zbm4DtpYnv5lFJZJUuQIii6l4GO/bmWCc2S6Kjk3HXoFEPxBbvpScKdnPRcpmU5XZS/CL8YeCXg29xoUqq7eChieMzI0IdjVaK40tqMvr5e2jaAoppsDbhtGPaj2+3oFkUUrczelV9ekrqzmzBaYmovMUCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAM3u5zxKxvAX5nHhcsIs9GEv0tR54+s4XAouvfKqV3ruL4+TA1lzIue94T2Tch/UcAucMNV04qPdbrO32pj+bHdyAxo0mvA3qaezQO30HZXk5ovkcn7l9gW3axrRfKm2qcf3IpMv6GyG6+QLETaDANrwSWKgmFjA0UwOd+Nk2Nx9j24GJbaW9OMad73FzgX+/yCe8q19PPjFu/RMt5iPsvUoHVzHXhqZjqx00iBJMuGrAZ5l/Qn96NpRN0BRGLGh5IC1yPpHuCTEYeIBPdZwXApq3tKfVZIq/9PK1ZkDYrLjPQITdN/TaA9mzFqDa7R29brlPBFQk7nsov8f7JWNCGg==');
INSERT INTO public.component_config VALUES ('1538fff7-03c6-4097-a530-743186727d78', '7b62deb1-030d-4800-b41c-bd5398080ed2', 'priority', '100');
INSERT INTO public.component_config VALUES ('323c7dee-1b26-4a2d-b57c-2973ac5609c3', '7b62deb1-030d-4800-b41c-bd5398080ed2', 'privateKey', 'MIIEpAIBAAKCAQEAytWqUcjGIyMhNc6be7BXiK4Loo5G7+8Wu9eeTZQ+Ag4K1nB9rNoAaU0uV7/oTlYLgYAMZRTRl5SenmxADZQKvgDdjIH9kUzp4T1UCmQu7YKuk8UQyzRK39phG6lKg37cptc8+K9ZWEqUwc5IYroYgmHG5awQkNXB04SfrIfaNU6ZNUWN+f4Mn6A0L1tftlubgO2lie/mUUlklS5AiKLqXgY79uZYJzZLoqOTcdegUQ/EFu+lJwp2c9FymZTldlL8Ivxh4JeDb3GhSqrt4KGJ4zMjQh2NVorjS2oy+vl7aNoCimmwNuG0Y9qPb7egWRRStzN6VX16SurObMFpiai8xQIDAQABAoIBACtdEKOZc9qxOPli6VTBN4WOCAjBuCK1j7uq9joJtlQEIocD16prlOjuSjkSWxzcQmt2L7AwijqI2HxwEiWU/9LtJnBSnh5BPkMcNGpgTrQSWzZWTCfVTyiabGZYhAimx4+Xtn5IJqa8kx739fu9Y14Ef1w8s/Hy8RRCZ0ygYqNAf7vSsCEYZuT7JAn4r+HOxIu9HGrWLRwAEu5Ict5R3RvNQhbjiPKjZDk02sftGvqE5i1b9+rRhLUUSF4ijuoGVfEZekElaUkyCslqvqt2At91HjsE3xXbU4FKw3VYaMQopLhqFIu1/5hNsNMi5LaVK2Jd/qz6+FZzhrbc+03JMOECgYEA9tYP95+r7n0Yg8PnNSe46ufmukQeCXNkcsj0Myxu3SqnELh/6QChUTNDazHYx1SrTH+w+mG26FFqVaKZfMbDV8OiX8NKkYsC4GnGHtUf7KCjnNb0qNKB1JqhPc86s4dd03LargAtKf2X6vWsIFRsPzVJl81yO5YHpz/1XyqgBK0CgYEA0l1pORmKAo5wpgogk9Pj7i5m0pIg3n1dBnAYfCTF3hER2LWXUCQb7tu92lz5184dA29fwF8XFe85kp/rnx+wF7YrX4+hbHtnInUZ8Lcd4hRjmz7U4QfpGBt3b3o0ckA28A4GTZY8eVQX50etCjbLmKjJw1e4/+/Qn3K+zxpqg3kCgYEA8J040Wzfv8pH9GIqZuGC29IVUyuFkDbhCxejHKNKquOiGaWQYoSPvETZiov7wkth9F9hGKHaF9sNac7oCf8DevEkvm7zqK62riXN0E53IUZyVzgfJNaXYrUdStBQa6MgLjf+vbFEVXNz/MFg+d7x6ie6xnSpzzXv3fR17z/w3r0CgYEAoJo0JSW8WatJkVoV+QZB86t1ULnDYlkvViTqbIzei2VYzKwGc2a99KPK1BU7oWh4ehDjd0ihpVtYBvsUtg1JMTEg9/n98YZc/M+OGFqU8+9BBFr5xzt017TQgEk6FSe1SZxLb5yNWsu63BW6pBulYE0sjHhCgxMhoTnHNvIh83ECgYAY5rw2EsPed9q1VXZeGVT+QyEeAVyNSd52CVyHuX0K9pMMYUw5MAN3UMYLd9RenxB/GZbKrHkZ337BgYodymoULYXt+5ueoscpW29WOeKHrnxVSLwd1mW8foHo0/x2KxH3BjrC+9Jkxs5tCxIQrizcpmG84C4mg0N+TBdxU4T8FA==');
INSERT INTO public.component_config VALUES ('7b89dab9-a492-4193-866d-fb6e7f1e21b5', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('7328f0e1-333e-4a09-81a4-2749164167ef', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('1fb7241e-981d-4803-a96f-1b9ac76cf974', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('89ccf213-d87e-40ee-b5c7-e66a3d68d0b4', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('ff7fcca7-fbf6-48a5-a6db-408f93b1c12c', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('5422e8b2-bcf0-4ba1-aebb-e19800266d1e', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('32b1d9a1-c591-4ba6-8914-4c58461fc175', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('dfa2476b-3e0b-429e-95b0-6e47c6304658', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('d2897c0c-58ed-4838-aa8f-e839a4691cf6', '34015fb7-1b62-40f7-b663-fa89661ba939', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('0faec5bb-d9fa-4b40-81c0-3d6804ba5d0a', '1e3a64aa-1eab-42a3-844b-b1aa6799d624', 'certificate', 'MIICozCCAYsCBgGLm3ifCjANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApib29rLXN0b3JlMB4XDTIzMTEwNDE3NTIzNVoXDTMzMTEwNDE3NTQxNVowFTETMBEGA1UEAwwKYm9vay1zdG9yZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL2IFt4yDPM47fBkRmXGq2BoC911XKwbtizweZfS9vudy9GttuJUcymExLxqFt9fGyADthYJ7oxP8Ozdq1WWS95myrv/Yh5fAxWTrhRxMGmKc/8XP9xAOsMu4sDKTxd1sGzB+dhuW8Jn7LHuquhgKoPp9D2QrpnGC66dFzFrGVm5PYb5xcDKqu8UORwJG52kfJlKq2rlez+0r8EAqhdQ1J+KqjRRgFhuBdnh3l1AX7cROwGlh1BygOIkGbOmz+hh6Fb5wdDxZFwj21JQMdtXA7o0OPJsfFXhrb22T9K9xX+vJ5lNAGF2KcStAgXHw9zgLoH1VEQPmtAts3FQU2bHNV8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEApD404FOmT77eqHZ5eKXWHvvmEvwIHAhdhOQLU0zygf7p6FtcrY1VjLMjfLtju09H3mLkLYGqAZeeKXqe5xULCXlVsaQjNUji0xm5B1La3jFgH3gkWTBL08gJwsV19aBD+uL7VmtSI67lP+ooaMucCG+mBoGunh+sffiQKSBKA2DBzuz9baRdtMEcwgVdRaEFy3uo3MLVaQYjhe6e1XzRgJwwXGi9dzDkPqE/Ot/yZtkv3DG4mhvTGRbq9lLDSvonJWT62rZnpFZDtWAzdDL004nHGyOcn116IofhYuPfUaemDk/mOJJrHB9QYCR/LtyaJ57YL9laHEVwvamu35fw/w==');
INSERT INTO public.component_config VALUES ('380141cb-7b3e-4259-82a4-ac99627b0c0e', '1e3a64aa-1eab-42a3-844b-b1aa6799d624', 'priority', '100');
INSERT INTO public.component_config VALUES ('803e4f3c-e2ec-4586-9d1d-6dcd6073aafd', '1e3a64aa-1eab-42a3-844b-b1aa6799d624', 'privateKey', 'MIIEoQIBAAKCAQEAvYgW3jIM8zjt8GRGZcarYGgL3XVcrBu2LPB5l9L2+53L0a224lRzKYTEvGoW318bIAO2FgnujE/w7N2rVZZL3mbKu/9iHl8DFZOuFHEwaYpz/xc/3EA6wy7iwMpPF3WwbMH52G5bwmfsse6q6GAqg+n0PZCumcYLrp0XMWsZWbk9hvnFwMqq7xQ5HAkbnaR8mUqrauV7P7SvwQCqF1DUn4qqNFGAWG4F2eHeXUBftxE7AaWHUHKA4iQZs6bP6GHoVvnB0PFkXCPbUlAx21cDujQ48mx8VeGtvbZP0r3Ff68nmU0AYXYpxK0CBcfD3OAugfVURA+a0C2zcVBTZsc1XwIDAQABAoH/U76c0kIj2Sz1zjhZChWNQVC37WdaWhQzTR4vYMi5ChIvGmzsRItHHEKEDdA0/EKxEi9WilKxvCZbV9euDhlQ4sLrDIjVFtFuWjfc0MkLQoNW+LhW/z+w3qEKGhHAVuI9Q1rBFHRMUi2s+940L+86PF4F5fL99/QxcE6qSXCczMKhJPX2HHFB1mgHkiV69W9gSMY4g1hM+fqZS45XH1RNFk8l8wA8K4KEaTMv50BBj4O3Cw30b48MsQ6KYzeaJk3QEKNNP5l/vl6Mt7ATohPdbKTnqITPpCWx3qsQcnvPoHyMu4vHxpe1kU1HXnkZECUZk8HuF6WGeIb/AhxHzf05AoGBAPo7uJ4Ptbp9Xh1mCpjfwP/r82YdN2pH/3hMLOxprksTinB58Yk/MBfEHuQBQwPtu85+u1thXvvu+MTemINB5V5coic269K8dB0nE2u/k6yR5VOjR7+cg9kusMr9jpNI5z9nGzjLv3zjgMrk6vddhdR/xjUXgD+FpMgE7u0BLAMHAoGBAMHmQHsBYZN0piGudUxy34Iv1Ffj28BVK8aihg0YUQ/fZtdkNfDK9NLYVqVX85jL2tmJGCLQ7YODP97swhIyO4Oot+qXojZoMEEP+iCxTkTfmtZZadVYDqRiVEUdlaxZcqNeoccH2y5jdEnN8qKMCMUBuSi9k/cCsMYsrunEIuzpAoGAfE8gxrzNLajMEVS43PsDGN/xWYAYIF9GBU/qXUOex0Mc2gVqPSE71gKiyefqj9ARJWMF1j6H/iXYRYzDPSmGNZtVHqAFBPqDwFvCJRvV07viresGYKTzRvgP8beGlZp47qFc/5kQNo2aVLDmHR7Dti4HnCZhmqzckFULEIgtgg8CgYBEKSq1ktC4QyM7Z9Z4H1GOtD2S/9h6DfarhupUpB2q1L+UK/gCQ3Y4wDAFQ5uwNMkj+1tusb8sofDL7rJyLxJYv/CXGOK++XUtCe7Fm06GS4xkmV3oz2GmS6KQAUxiH7d60oNQMeTMs81nPGx004Epr+dk+O+Qv3Ng1shOCNK2MQKBgQCJfFajzVKXAUZisC+9U3K9MMRSpTg3qbP4ZbG/tR2XuPvX/NXRFIUwei44UXcHylKvAU3pUJxOuyR48INNLCwZCakTJ1gKw37Wxp4WECEixRSjmUsV35HMykzO/tllGXqeyqVvgrnlGwTHiWOEbJ8r4MHxokpL7GAK0A0cNjLxOA==');
INSERT INTO public.component_config VALUES ('99101461-e48a-4707-9731-cfa4d77355ee', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('aaf8d17d-3ee9-45f9-b3a9-f36d07d72c4c', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('3481f009-d9cd-4fd5-9fa6-db31402fe68a', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('67ff608d-8811-4225-8f95-3f54595e2d08', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('ba346ddd-9bdb-4393-b1c5-3f4ea5b31602', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('57ac7fe7-f547-4b1b-b779-7914bf3760c1', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('bfd079b9-0c35-439e-b526-5cf36c4e25c0', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('8b1415d0-b8f8-455f-90bb-67fda772c682', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '4438a6c4-891a-44af-86b0-53dc1c123202');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '934e267a-92c7-4c8a-a588-7f106351d1da');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '74579ac2-00ca-4a28-a5e6-6a6a4b1a45f1');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '4141d215-5e0b-4573-970a-f487506112c6');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '4c3319ab-b450-4664-bd75-b871fc041600');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', 'c32cae05-8ccc-40d2-b5cc-2ee6173bb61a');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '2bd52e70-24c1-45da-bbf5-da6617a22a92');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', 'ad3a971d-98d6-476c-bb87-9f1653c57ec2');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '8013d27b-9adc-4010-a239-d097c10f2aa9');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '9afa2539-1885-4f8b-acdf-723477403615');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '506a9841-92b6-49d2-9212-8130919b2941');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '2fc4f1dd-1938-4194-b5ee-84006a5b2a93');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '7c4438ff-948c-411e-80e3-aed319474e95');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '1353c3ee-d8ef-428f-ad33-4bac7a8bf4b8');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', 'aad26624-9a3c-4825-9e66-27acdef35aad');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '2d99ba7d-5e75-4093-b5ed-1d770b957dd8');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', 'ed3ec168-037c-402e-8a7b-8d1a57be8210');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', 'e6acef16-0296-4c32-a386-87aa8aa51da2');
INSERT INTO public.composite_role VALUES ('4141d215-5e0b-4573-970a-f487506112c6', 'aad26624-9a3c-4825-9e66-27acdef35aad');
INSERT INTO public.composite_role VALUES ('4141d215-5e0b-4573-970a-f487506112c6', 'e6acef16-0296-4c32-a386-87aa8aa51da2');
INSERT INTO public.composite_role VALUES ('4c3319ab-b450-4664-bd75-b871fc041600', '2d99ba7d-5e75-4093-b5ed-1d770b957dd8');
INSERT INTO public.composite_role VALUES ('9a58b231-4246-48c3-a17a-78ff6a190d66', 'a5573fc0-d8ea-43b6-9e90-a019b3bf6a8a');
INSERT INTO public.composite_role VALUES ('9a58b231-4246-48c3-a17a-78ff6a190d66', 'a23fa89b-e7d6-431f-ba88-a2f91b11a09c');
INSERT INTO public.composite_role VALUES ('a23fa89b-e7d6-431f-ba88-a2f91b11a09c', 'e49305ef-cd61-4a98-9990-4c150be498fc');
INSERT INTO public.composite_role VALUES ('80ff1fd1-261d-406e-bfc1-a6c67823f29a', '4fdf48f8-81c7-4e92-ba21-a31c85027b19');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', 'fab7c2ee-42d6-4277-99e5-d1c810ed2b33');
INSERT INTO public.composite_role VALUES ('9a58b231-4246-48c3-a17a-78ff6a190d66', '6794f26e-1c71-40f8-9b18-478c68d317b1');
INSERT INTO public.composite_role VALUES ('9a58b231-4246-48c3-a17a-78ff6a190d66', 'e59a2816-4f2a-4ae1-815d-7a60f6a07dab');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '070cd1c5-7b8f-4032-8ba7-35b905452829');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', 'fe311841-151d-4c2f-ac0e-17382c8350d2');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '96cab5c8-b0c7-4f3b-b91b-10b9bf7441ba');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '82fe19c4-1c3f-4a76-8438-1d3a5fca1567');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', 'f2ce2915-586a-4675-b95f-e828271ff787');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', 'a5f12f4e-4818-41b6-80c9-0a966c680bf9');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '79bc9c93-0a08-4ecf-b85e-1e6982247021');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '34ef8271-8fc2-454d-809c-98fcb0624199');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', 'ac06a77a-edba-4137-8928-bc0c23ae37b9');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '48f2cca3-6345-4d7d-a3bd-a28ee780c4df');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '3f29b93a-5c9e-44a6-8895-28190ddebabd');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '189666e9-38c9-46e3-a26e-7f03a6246a22');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', 'ff16c40f-d986-440d-970e-3716ea2b67b3');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', 'f6910dc0-be78-4a5a-9035-d579731dd7aa');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', 'ba2cac72-872f-4e55-b92a-0a5da78854cf');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', 'b2abba9b-7f22-4104-b8a1-f00b76b5fab6');
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', 'de06cc42-d894-4996-a174-b320704c47f4');
INSERT INTO public.composite_role VALUES ('82fe19c4-1c3f-4a76-8438-1d3a5fca1567', 'ba2cac72-872f-4e55-b92a-0a5da78854cf');
INSERT INTO public.composite_role VALUES ('96cab5c8-b0c7-4f3b-b91b-10b9bf7441ba', 'f6910dc0-be78-4a5a-9035-d579731dd7aa');
INSERT INTO public.composite_role VALUES ('96cab5c8-b0c7-4f3b-b91b-10b9bf7441ba', 'de06cc42-d894-4996-a174-b320704c47f4');
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
INSERT INTO public.composite_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', 'fc60c2a5-f923-42c6-adc4-79bb96e255df');


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.credential VALUES ('95c0b516-bef6-425e-a1b0-003b20903c55', NULL, 'password', '45858445-1bbb-4611-b3f2-a3386db59829', 1699116495996, NULL, '{"value":"q388yB5a5GGVkLzumJucG7sk1ZnlF8egcmQzalgd5JA=","salt":"boWECNxbEbWc4n+wqJBxLA==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('b577e996-6fbb-45a9-82b0-5fd21c7761bd', NULL, 'password', '39bde318-96a2-4cd0-acdb-dd92b27d8e43', 1699120716697, NULL, '{"value":"s13wsaeTE+rSegKbppimA5IbVsZlz7fEKjX5wdb9sII=","salt":"aa5PcYPpjM0CECa7+ZF6vA==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('72810ac7-8032-449a-997d-8e8f9f45c290', NULL, 'password', '061f3c22-945c-4d74-bfbf-0446a21c0744', 1699120724374, NULL, '{"value":"2maS1meUKOYrTDyWjoFFwCDihWnadu7ApPpMiMg3zkY=","salt":"+pyp3yYZHLUQdsBu4Qay4g==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml', '2023-11-04 16:48:11.541861', 1, 'EXECUTED', '8:bda77d94bf90182a1e30c24f1c155ec7', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml', '2023-11-04 16:48:11.548558', 2, 'MARK_RAN', '8:1ecb330f30986693d1cba9ab579fa219', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2023-11-04 16:48:11.603606', 3, 'EXECUTED', '8:cb7ace19bc6d959f305605d255d4c843', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2023-11-04 16:48:11.610552', 4, 'EXECUTED', '8:80230013e961310e6872e871be424a63', 'renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2023-11-04 16:48:11.737165', 5, 'EXECUTED', '8:67f4c20929126adc0c8e9bf48279d244', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2023-11-04 16:48:11.740686', 6, 'MARK_RAN', '8:7311018b0b8179ce14628ab412bb6783', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2023-11-04 16:48:11.845855', 7, 'EXECUTED', '8:037ba1216c3640f8785ee6b8e7c8e3c1', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2023-11-04 16:48:11.849565', 8, 'MARK_RAN', '8:7fe6ffe4af4df289b3157de32c624263', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2023-11-04 16:48:11.85636', 9, 'EXECUTED', '8:9c136bc3187083a98745c7d03bc8a303', 'update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2023-11-04 16:48:11.979866', 10, 'EXECUTED', '8:b5f09474dca81fb56a97cf5b6553d331', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2023-11-04 16:48:12.039615', 11, 'EXECUTED', '8:ca924f31bd2a3b219fdcfe78c82dacf4', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2023-11-04 16:48:12.042626', 12, 'MARK_RAN', '8:8acad7483e106416bcfa6f3b824a16cd', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2023-11-04 16:48:12.061045', 13, 'EXECUTED', '8:9b1266d17f4f87c78226f5055408fd5e', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2023-11-04 16:48:12.094292', 14, 'EXECUTED', '8:d80ec4ab6dbfe573550ff72396c7e910', 'addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2023-11-04 16:48:12.09803', 15, 'MARK_RAN', '8:d86eb172171e7c20b9c849b584d147b2', 'delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2023-11-04 16:48:12.101349', 16, 'MARK_RAN', '8:5735f46f0fa60689deb0ecdc2a0dea22', 'dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2023-11-04 16:48:12.104963', 17, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2023-11-04 16:48:12.154518', 18, 'EXECUTED', '8:5c1a8fd2014ac7fc43b90a700f117b23', 'createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2023-11-04 16:48:12.204137', 19, 'EXECUTED', '8:1f6c2c2dfc362aff4ed75b3f0ef6b331', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2023-11-04 16:48:12.214525', 20, 'EXECUTED', '8:dee9246280915712591f83a127665107', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2023-11-04 16:48:12.218612', 21, 'MARK_RAN', '8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2023-11-04 16:48:12.222495', 22, 'MARK_RAN', '8:dee9246280915712591f83a127665107', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2023-11-04 16:48:12.25223', 23, 'EXECUTED', '8:d9fa18ffa355320395b86270680dd4fe', 'update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2023-11-04 16:48:12.25962', 24, 'EXECUTED', '8:90cff506fedb06141ffc1c71c4a1214c', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2023-11-04 16:48:12.262471', 25, 'MARK_RAN', '8:11a788aed4961d6d29c427c063af828c', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2023-11-04 16:48:12.326589', 26, 'EXECUTED', '8:a4218e51e1faf380518cce2af5d39b43', 'createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2023-11-04 16:48:12.441239', 27, 'EXECUTED', '8:d9e9a1bfaa644da9952456050f07bbdc', 'createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2023-11-04 16:48:12.445694', 28, 'EXECUTED', '8:d1bf991a6163c0acbfe664b615314505', 'update tableName=RESOURCE_SERVER_POLICY', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('2.1.0-KEYCLOAK-5461', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2023-11-04 16:48:12.561228', 29, 'EXECUTED', '8:88a743a1e87ec5e30bf603da68058a8c', 'createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2023-11-04 16:48:12.581752', 30, 'EXECUTED', '8:c5517863c875d325dea463d00ec26d7a', 'addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2023-11-04 16:48:12.606763', 31, 'EXECUTED', '8:ada8b4833b74a498f376d7136bc7d327', 'createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2023-11-04 16:48:12.613014', 32, 'EXECUTED', '8:b9b73c8ea7299457f99fcbb825c263ba', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2023-11-04 16:48:12.627914', 33, 'EXECUTED', '8:07724333e625ccfcfc5adc63d57314f3', 'customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2023-11-04 16:48:12.631434', 34, 'MARK_RAN', '8:8b6fd445958882efe55deb26fc541a7b', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2023-11-04 16:48:12.665851', 35, 'EXECUTED', '8:29b29cfebfd12600897680147277a9d7', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml', '2023-11-04 16:48:12.672145', 36, 'EXECUTED', '8:73ad77ca8fd0410c7f9f15a471fa52bc', 'addColumn tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2023-11-04 16:48:12.68285', 37, 'EXECUTED', '8:64f27a6fdcad57f6f9153210f2ec1bdb', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2023-11-04 16:48:12.688878', 38, 'EXECUTED', '8:27180251182e6c31846c2ddab4bc5781', 'addColumn tableName=FED_USER_CONSENT', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2023-11-04 16:48:12.694963', 39, 'EXECUTED', '8:d56f201bfcfa7a1413eb3e9bc02978f9', 'addColumn tableName=IDENTITY_PROVIDER', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2023-11-04 16:48:12.699262', 40, 'MARK_RAN', '8:91f5522bf6afdc2077dfab57fbd3455c', 'addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2023-11-04 16:48:12.702755', 41, 'MARK_RAN', '8:0f01b554f256c22caeb7d8aee3a1cdc8', 'dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix-offline-sessions', 'hmlnarik', 'META-INF/jpa-changelog-3.2.0.xml', '2023-11-04 16:48:12.708838', 42, 'EXECUTED', '8:ab91cf9cee415867ade0e2df9651a947', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2023-11-04 16:48:13.016256', 43, 'EXECUTED', '8:ceac9b1889e97d602caf373eadb0d4b7', 'addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2023-11-04 16:48:13.024239', 44, 'EXECUTED', '8:84b986e628fe8f7fd8fd3c275c5259f2', 'addColumn tableName=USER_ENTITY', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2023-11-04 16:48:13.032875', 45, 'EXECUTED', '8:a164ae073c56ffdbc98a615493609a52', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2023-11-04 16:48:13.04019', 46, 'EXECUTED', '8:70a2b4f1f4bd4dbf487114bdb1810e64', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2023-11-04 16:48:13.043647', 47, 'MARK_RAN', '8:7be68b71d2f5b94b8df2e824f2860fa2', 'dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2023-11-04 16:48:13.090411', 48, 'EXECUTED', '8:bab7c631093c3861d6cf6144cd944982', 'addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2023-11-04 16:48:13.096413', 49, 'EXECUTED', '8:fa809ac11877d74d76fe40869916daad', 'addColumn tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('3.4.0', 'keycloak', 'META-INF/jpa-changelog-3.4.0.xml', '2023-11-04 16:48:13.184524', 50, 'EXECUTED', '8:fac23540a40208f5f5e326f6ceb4d291', 'addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('3.4.0-KEYCLOAK-5230', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-3.4.0.xml', '2023-11-04 16:48:13.263789', 51, 'EXECUTED', '8:2612d1b8a97e2b5588c346e817307593', 'createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('3.4.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-3.4.1.xml', '2023-11-04 16:48:13.271074', 52, 'EXECUTED', '8:9842f155c5db2206c88bcb5d1046e941', 'modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('3.4.2', 'keycloak', 'META-INF/jpa-changelog-3.4.2.xml', '2023-11-04 16:48:13.276526', 53, 'EXECUTED', '8:2e12e06e45498406db72d5b3da5bbc76', 'update tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('3.4.2-KEYCLOAK-5172', 'mkanis@redhat.com', 'META-INF/jpa-changelog-3.4.2.xml', '2023-11-04 16:48:13.282318', 54, 'EXECUTED', '8:33560e7c7989250c40da3abdabdc75a4', 'update tableName=CLIENT', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-6335', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2023-11-04 16:48:13.297408', 55, 'EXECUTED', '8:87a8d8542046817a9107c7eb9cbad1cd', 'createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('4.0.0-CLEANUP-UNUSED-TABLE', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2023-11-04 16:48:13.307888', 56, 'EXECUTED', '8:3ea08490a70215ed0088c273d776311e', 'dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-6228', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2023-11-04 16:48:13.355748', 57, 'EXECUTED', '8:2d56697c8723d4592ab608ce14b6ed68', 'dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-5579-fixed', 'mposolda@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2023-11-04 16:48:13.501043', 58, 'EXECUTED', '8:3e423e249f6068ea2bbe48bf907f9d86', 'dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('authz-4.0.0.CR1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.CR1.xml', '2023-11-04 16:48:13.540345', 59, 'EXECUTED', '8:15cabee5e5df0ff099510a0fc03e4103', 'createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('authz-4.0.0.Beta3', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.Beta3.xml', '2023-11-04 16:48:13.549471', 60, 'EXECUTED', '8:4b80200af916ac54d2ffbfc47918ab0e', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('authz-4.2.0.Final', 'mhajas@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2023-11-04 16:48:13.564621', 61, 'EXECUTED', '8:66564cd5e168045d52252c5027485bbb', 'createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('authz-4.2.0.Final-KEYCLOAK-9944', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2023-11-04 16:48:13.575727', 62, 'EXECUTED', '8:1c7064fafb030222be2bd16ccf690f6f', 'addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('4.2.0-KEYCLOAK-6313', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.2.0.xml', '2023-11-04 16:48:13.582581', 63, 'EXECUTED', '8:2de18a0dce10cdda5c7e65c9b719b6e5', 'addColumn tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('4.3.0-KEYCLOAK-7984', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.3.0.xml', '2023-11-04 16:48:13.58731', 64, 'EXECUTED', '8:03e413dd182dcbd5c57e41c34d0ef682', 'update tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-7950', 'psilva@redhat.com', 'META-INF/jpa-changelog-4.6.0.xml', '2023-11-04 16:48:13.591419', 65, 'EXECUTED', '8:d27b42bb2571c18fbe3fe4e4fb7582a7', 'update tableName=RESOURCE_SERVER_RESOURCE', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-8377', 'keycloak', 'META-INF/jpa-changelog-4.6.0.xml', '2023-11-04 16:48:13.619322', 66, 'EXECUTED', '8:698baf84d9fd0027e9192717c2154fb8', 'createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-8555', 'gideonray@gmail.com', 'META-INF/jpa-changelog-4.6.0.xml', '2023-11-04 16:48:13.637346', 67, 'EXECUTED', '8:ced8822edf0f75ef26eb51582f9a821a', 'createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('4.7.0-KEYCLOAK-1267', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.7.0.xml', '2023-11-04 16:48:13.646002', 68, 'EXECUTED', '8:f0abba004cf429e8afc43056df06487d', 'addColumn tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('4.7.0-KEYCLOAK-7275', 'keycloak', 'META-INF/jpa-changelog-4.7.0.xml', '2023-11-04 16:48:13.661954', 69, 'EXECUTED', '8:6662f8b0b611caa359fcf13bf63b4e24', 'renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('4.8.0-KEYCLOAK-8835', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.8.0.xml', '2023-11-04 16:48:13.669014', 70, 'EXECUTED', '8:9e6b8009560f684250bdbdf97670d39e', 'addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('authz-7.0.0-KEYCLOAK-10443', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-7.0.0.xml', '2023-11-04 16:48:13.675087', 71, 'EXECUTED', '8:4223f561f3b8dc655846562b57bb502e', 'addColumn tableName=RESOURCE_SERVER', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('8.0.0-adding-credential-columns', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2023-11-04 16:48:13.682049', 72, 'EXECUTED', '8:215a31c398b363ce383a2b301202f29e', 'addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-not-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2023-11-04 16:48:13.687612', 73, 'EXECUTED', '8:83f7a671792ca98b3cbd3a1a34862d3d', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2023-11-04 16:48:13.69025', 74, 'MARK_RAN', '8:f58ad148698cf30707a6efbdf8061aa7', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('8.0.0-credential-cleanup-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2023-11-04 16:48:13.705095', 75, 'EXECUTED', '8:79e4fd6c6442980e58d52ffc3ee7b19c', 'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('8.0.0-resource-tag-support', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2023-11-04 16:48:13.715669', 76, 'EXECUTED', '8:87af6a1e6d241ca4b15801d1f86a297d', 'addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('9.0.0-always-display-client', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2023-11-04 16:48:13.723335', 77, 'EXECUTED', '8:b44f8d9b7b6ea455305a6d72a200ed15', 'addColumn tableName=CLIENT', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('9.0.0-drop-constraints-for-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2023-11-04 16:48:13.725979', 78, 'MARK_RAN', '8:2d8ed5aaaeffd0cb004c046b4a903ac5', 'dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('9.0.0-increase-column-size-federated-fk', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2023-11-04 16:48:13.745651', 79, 'EXECUTED', '8:e290c01fcbc275326c511633f6e2acde', 'modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('9.0.0-recreate-constraints-after-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2023-11-04 16:48:13.748452', 80, 'MARK_RAN', '8:c9db8784c33cea210872ac2d805439f8', 'addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('9.0.1-add-index-to-client.client_id', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2023-11-04 16:48:13.758677', 81, 'EXECUTED', '8:95b676ce8fc546a1fcfb4c92fae4add5', 'createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2023-11-04 16:48:13.761279', 82, 'MARK_RAN', '8:38a6b2a41f5651018b1aca93a41401e5', 'dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-add-not-null-constraint', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2023-11-04 16:48:13.767132', 83, 'EXECUTED', '8:3fb99bcad86a0229783123ac52f7609c', 'addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2023-11-04 16:48:13.769749', 84, 'MARK_RAN', '8:64f27a6fdcad57f6f9153210f2ec1bdb', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('9.0.1-add-index-to-events', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2023-11-04 16:48:13.780118', 85, 'EXECUTED', '8:ab4f863f39adafd4c862f7ec01890abc', 'createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-11.0.0.xml', '2023-11-04 16:48:13.787412', 86, 'EXECUTED', '8:13c419a0eb336e91ee3a3bf8fda6e2a7', 'dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2023-11-04 16:48:13.796293', 87, 'EXECUTED', '8:e3fb1e698e0471487f51af1ed80fe3ac', 'dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('12.1.0-add-realm-localization-table', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2023-11-04 16:48:13.814952', 88, 'EXECUTED', '8:babadb686aab7b56562817e60bf0abd0', 'createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('default-roles', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 16:48:13.830803', 89, 'EXECUTED', '8:72d03345fda8e2f17093d08801947773', 'addColumn tableName=REALM; customChange', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('default-roles-cleanup', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 16:48:13.841812', 90, 'EXECUTED', '8:61c9233951bd96ffecd9ba75f7d978a4', 'dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('13.0.0-KEYCLOAK-16844', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 16:48:13.856315', 91, 'EXECUTED', '8:ea82e6ad945cec250af6372767b25525', 'createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri-13.0.0', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 16:48:13.865397', 92, 'EXECUTED', '8:d3f4a33f41d960ddacd7e2ef30d126b3', 'dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('13.0.0-KEYCLOAK-17992-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 16:48:13.868483', 93, 'MARK_RAN', '8:1284a27fbd049d65831cb6fc07c8a783', 'dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('13.0.0-increase-column-size-federated', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 16:48:13.882512', 94, 'EXECUTED', '8:9d11b619db2ae27c25853b8a37cd0dea', 'modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('13.0.0-KEYCLOAK-17992-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 16:48:13.886241', 95, 'MARK_RAN', '8:3002bb3997451bb9e8bac5c5cd8d6327', 'addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('json-string-accomodation-fixed', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 16:48:13.896945', 96, 'EXECUTED', '8:dfbee0d6237a23ef4ccbb7a4e063c163', 'addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-11019', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 16:48:13.924284', 97, 'EXECUTED', '8:75f3e372df18d38c62734eebb986b960', 'createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 16:48:13.928514', 98, 'MARK_RAN', '8:7fee73eddf84a6035691512c85637eef', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286-revert', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 16:48:13.940707', 99, 'MARK_RAN', '8:7a11134ab12820f999fbf3bb13c3adc8', 'dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286-supported-dbs', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 16:48:13.955475', 100, 'EXECUTED', '8:c0f6eaac1f3be773ffe54cb5b8482b70', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286-unsupported-dbs', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 16:48:13.959447', 101, 'MARK_RAN', '8:18186f0008b86e0f0f49b0c4d0e842ac', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('KEYCLOAK-17267-add-index-to-user-attributes', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 16:48:13.973534', 102, 'EXECUTED', '8:09c2780bcb23b310a7019d217dc7b433', 'createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('KEYCLOAK-18146-add-saml-art-binding-identifier', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 16:48:13.986736', 103, 'EXECUTED', '8:276a44955eab693c970a42880197fff2', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('15.0.0-KEYCLOAK-18467', 'keycloak', 'META-INF/jpa-changelog-15.0.0.xml', '2023-11-04 16:48:13.998087', 104, 'EXECUTED', '8:ba8ee3b694d043f2bfc1a1079d0760d7', 'addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('17.0.0-9562', 'keycloak', 'META-INF/jpa-changelog-17.0.0.xml', '2023-11-04 16:48:14.01156', 105, 'EXECUTED', '8:5e06b1d75f5d17685485e610c2851b17', 'createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('18.0.0-10625-IDX_ADMIN_EVENT_TIME', 'keycloak', 'META-INF/jpa-changelog-18.0.0.xml', '2023-11-04 16:48:14.025825', 106, 'EXECUTED', '8:4b80546c1dc550ac552ee7b24a4ab7c0', 'createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('19.0.0-10135', 'keycloak', 'META-INF/jpa-changelog-19.0.0.xml', '2023-11-04 16:48:14.037477', 107, 'EXECUTED', '8:af510cd1bb2ab6339c45372f3e491696', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('20.0.0-12964-supported-dbs', 'keycloak', 'META-INF/jpa-changelog-20.0.0.xml', '2023-11-04 16:48:14.052379', 108, 'EXECUTED', '8:05c99fc610845ef66ee812b7921af0ef', 'createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('20.0.0-12964-unsupported-dbs', 'keycloak', 'META-INF/jpa-changelog-20.0.0.xml', '2023-11-04 16:48:14.056654', 109, 'MARK_RAN', '8:314e803baf2f1ec315b3464e398b8247', 'createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('client-attributes-string-accomodation-fixed', 'keycloak', 'META-INF/jpa-changelog-20.0.0.xml', '2023-11-04 16:48:14.068375', 110, 'EXECUTED', '8:56e4677e7e12556f70b604c573840100', 'addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('21.0.2-17277', 'keycloak', 'META-INF/jpa-changelog-21.0.2.xml', '2023-11-04 16:48:14.078997', 111, 'EXECUTED', '8:8806cb33d2a546ce770384bf98cf6eac', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('21.1.0-19404', 'keycloak', 'META-INF/jpa-changelog-21.1.0.xml', '2023-11-04 16:48:14.133181', 112, 'EXECUTED', '8:fdb2924649d30555ab3a1744faba4928', 'modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('21.1.0-19404-2', 'keycloak', 'META-INF/jpa-changelog-21.1.0.xml', '2023-11-04 16:48:14.13678', 113, 'MARK_RAN', '8:1c96cc2b10903bd07a03670098d67fd6', 'addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...', '', NULL, '4.20.0', NULL, NULL, '9116490955');
INSERT INTO public.databasechangelog VALUES ('22.0.0-17484', 'keycloak', 'META-INF/jpa-changelog-22.0.0.xml', '2023-11-04 16:48:14.142479', 114, 'EXECUTED', '8:4c3d4e8b142a66fcdf21b89a4dd33301', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9116490955');


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.databasechangeloglock VALUES (1, false, NULL, NULL);
INSERT INTO public.databasechangeloglock VALUES (1000, false, NULL, NULL);
INSERT INTO public.databasechangeloglock VALUES (1001, false, NULL, NULL);


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.default_client_scope VALUES ('22037ef2-30b3-470d-85d6-637d3c8b987f', 'd4b83deb-5e20-4c07-859e-bf61986ca0b3', false);
INSERT INTO public.default_client_scope VALUES ('22037ef2-30b3-470d-85d6-637d3c8b987f', '7be9df09-0869-4fa5-a827-aed8f1774836', true);
INSERT INTO public.default_client_scope VALUES ('22037ef2-30b3-470d-85d6-637d3c8b987f', '2e7104a4-61bc-49eb-9275-b00a23e94785', true);
INSERT INTO public.default_client_scope VALUES ('22037ef2-30b3-470d-85d6-637d3c8b987f', '0a720260-d8b4-4f87-92bf-0189e5c50f6e', true);
INSERT INTO public.default_client_scope VALUES ('22037ef2-30b3-470d-85d6-637d3c8b987f', 'b46b5dd5-cfb8-40d3-814d-6b1962f165df', false);
INSERT INTO public.default_client_scope VALUES ('22037ef2-30b3-470d-85d6-637d3c8b987f', 'a2afbdf1-3bf7-4d41-8622-36160bd08504', false);
INSERT INTO public.default_client_scope VALUES ('22037ef2-30b3-470d-85d6-637d3c8b987f', '582567ed-3b58-4b1e-bf91-3540c389b1c1', true);
INSERT INTO public.default_client_scope VALUES ('22037ef2-30b3-470d-85d6-637d3c8b987f', '105b96cb-1aea-4e1f-88eb-4fa290fe1987', true);
INSERT INTO public.default_client_scope VALUES ('22037ef2-30b3-470d-85d6-637d3c8b987f', '94ee8b1b-a58f-437a-a3b8-ca7920f6ffcb', false);
INSERT INTO public.default_client_scope VALUES ('22037ef2-30b3-470d-85d6-637d3c8b987f', '399fe0b7-d548-4fb1-a429-6780db1c0762', true);
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

INSERT INTO public.keycloak_role VALUES ('9a58b231-4246-48c3-a17a-78ff6a190d66', '22037ef2-30b3-470d-85d6-637d3c8b987f', false, '${role_default-roles}', 'default-roles-master', '22037ef2-30b3-470d-85d6-637d3c8b987f', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('4438a6c4-891a-44af-86b0-53dc1c123202', '22037ef2-30b3-470d-85d6-637d3c8b987f', false, '${role_create-realm}', 'create-realm', '22037ef2-30b3-470d-85d6-637d3c8b987f', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '22037ef2-30b3-470d-85d6-637d3c8b987f', false, '${role_admin}', 'admin', '22037ef2-30b3-470d-85d6-637d3c8b987f', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('934e267a-92c7-4c8a-a588-7f106351d1da', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_create-client}', 'create-client', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('74579ac2-00ca-4a28-a5e6-6a6a4b1a45f1', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_view-realm}', 'view-realm', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('4141d215-5e0b-4573-970a-f487506112c6', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_view-users}', 'view-users', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('4c3319ab-b450-4664-bd75-b871fc041600', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_view-clients}', 'view-clients', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('c32cae05-8ccc-40d2-b5cc-2ee6173bb61a', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_view-events}', 'view-events', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('2bd52e70-24c1-45da-bbf5-da6617a22a92', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_view-identity-providers}', 'view-identity-providers', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('ad3a971d-98d6-476c-bb87-9f1653c57ec2', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_view-authorization}', 'view-authorization', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('8013d27b-9adc-4010-a239-d097c10f2aa9', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_manage-realm}', 'manage-realm', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('9afa2539-1885-4f8b-acdf-723477403615', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_manage-users}', 'manage-users', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('506a9841-92b6-49d2-9212-8130919b2941', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_manage-clients}', 'manage-clients', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('2fc4f1dd-1938-4194-b5ee-84006a5b2a93', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_manage-events}', 'manage-events', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('7c4438ff-948c-411e-80e3-aed319474e95', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_manage-identity-providers}', 'manage-identity-providers', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('1353c3ee-d8ef-428f-ad33-4bac7a8bf4b8', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_manage-authorization}', 'manage-authorization', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('aad26624-9a3c-4825-9e66-27acdef35aad', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_query-users}', 'query-users', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('2d99ba7d-5e75-4093-b5ed-1d770b957dd8', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_query-clients}', 'query-clients', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('ed3ec168-037c-402e-8a7b-8d1a57be8210', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_query-realms}', 'query-realms', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('e6acef16-0296-4c32-a386-87aa8aa51da2', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_query-groups}', 'query-groups', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('a5573fc0-d8ea-43b6-9e90-a019b3bf6a8a', 'afd73214-e3a5-4289-ae35-0732685112b0', true, '${role_view-profile}', 'view-profile', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'afd73214-e3a5-4289-ae35-0732685112b0', NULL);
INSERT INTO public.keycloak_role VALUES ('a23fa89b-e7d6-431f-ba88-a2f91b11a09c', 'afd73214-e3a5-4289-ae35-0732685112b0', true, '${role_manage-account}', 'manage-account', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'afd73214-e3a5-4289-ae35-0732685112b0', NULL);
INSERT INTO public.keycloak_role VALUES ('e49305ef-cd61-4a98-9990-4c150be498fc', 'afd73214-e3a5-4289-ae35-0732685112b0', true, '${role_manage-account-links}', 'manage-account-links', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'afd73214-e3a5-4289-ae35-0732685112b0', NULL);
INSERT INTO public.keycloak_role VALUES ('24c2d26c-2e52-419f-90d8-7208bbcc8287', 'afd73214-e3a5-4289-ae35-0732685112b0', true, '${role_view-applications}', 'view-applications', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'afd73214-e3a5-4289-ae35-0732685112b0', NULL);
INSERT INTO public.keycloak_role VALUES ('4fdf48f8-81c7-4e92-ba21-a31c85027b19', 'afd73214-e3a5-4289-ae35-0732685112b0', true, '${role_view-consent}', 'view-consent', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'afd73214-e3a5-4289-ae35-0732685112b0', NULL);
INSERT INTO public.keycloak_role VALUES ('80ff1fd1-261d-406e-bfc1-a6c67823f29a', 'afd73214-e3a5-4289-ae35-0732685112b0', true, '${role_manage-consent}', 'manage-consent', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'afd73214-e3a5-4289-ae35-0732685112b0', NULL);
INSERT INTO public.keycloak_role VALUES ('b739f236-9ee2-461f-8ae8-db538e5a37e8', 'afd73214-e3a5-4289-ae35-0732685112b0', true, '${role_view-groups}', 'view-groups', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'afd73214-e3a5-4289-ae35-0732685112b0', NULL);
INSERT INTO public.keycloak_role VALUES ('3b593f6f-34d6-442c-b630-ff7842222b69', 'afd73214-e3a5-4289-ae35-0732685112b0', true, '${role_delete-account}', 'delete-account', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'afd73214-e3a5-4289-ae35-0732685112b0', NULL);
INSERT INTO public.keycloak_role VALUES ('5eee80b4-4a39-4180-9a14-499fbc31da0a', 'fca6f700-c50c-4d30-927b-341e1106aa38', true, '${role_read-token}', 'read-token', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'fca6f700-c50c-4d30-927b-341e1106aa38', NULL);
INSERT INTO public.keycloak_role VALUES ('fab7c2ee-42d6-4277-99e5-d1c810ed2b33', '109f3c90-f5d8-49f4-ac95-17874d87788a', true, '${role_impersonation}', 'impersonation', '22037ef2-30b3-470d-85d6-637d3c8b987f', '109f3c90-f5d8-49f4-ac95-17874d87788a', NULL);
INSERT INTO public.keycloak_role VALUES ('6794f26e-1c71-40f8-9b18-478c68d317b1', '22037ef2-30b3-470d-85d6-637d3c8b987f', false, '${role_offline-access}', 'offline_access', '22037ef2-30b3-470d-85d6-637d3c8b987f', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('e59a2816-4f2a-4ae1-815d-7a60f6a07dab', '22037ef2-30b3-470d-85d6-637d3c8b987f', false, '${role_uma_authorization}', 'uma_authorization', '22037ef2-30b3-470d-85d6-637d3c8b987f', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('c46a9467-cb5a-4888-b8c1-fd6623005642', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', false, '${role_default-roles}', 'default-roles-book-store', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('070cd1c5-7b8f-4032-8ba7-35b905452829', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_create-client}', 'create-client', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);
INSERT INTO public.keycloak_role VALUES ('fe311841-151d-4c2f-ac0e-17382c8350d2', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_view-realm}', 'view-realm', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);
INSERT INTO public.keycloak_role VALUES ('96cab5c8-b0c7-4f3b-b91b-10b9bf7441ba', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_view-users}', 'view-users', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);
INSERT INTO public.keycloak_role VALUES ('82fe19c4-1c3f-4a76-8438-1d3a5fca1567', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_view-clients}', 'view-clients', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);
INSERT INTO public.keycloak_role VALUES ('f2ce2915-586a-4675-b95f-e828271ff787', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_view-events}', 'view-events', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);
INSERT INTO public.keycloak_role VALUES ('a5f12f4e-4818-41b6-80c9-0a966c680bf9', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_view-identity-providers}', 'view-identity-providers', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);
INSERT INTO public.keycloak_role VALUES ('79bc9c93-0a08-4ecf-b85e-1e6982247021', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_view-authorization}', 'view-authorization', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);
INSERT INTO public.keycloak_role VALUES ('34ef8271-8fc2-454d-809c-98fcb0624199', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_manage-realm}', 'manage-realm', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);
INSERT INTO public.keycloak_role VALUES ('ac06a77a-edba-4137-8928-bc0c23ae37b9', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_manage-users}', 'manage-users', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);
INSERT INTO public.keycloak_role VALUES ('48f2cca3-6345-4d7d-a3bd-a28ee780c4df', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_manage-clients}', 'manage-clients', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);
INSERT INTO public.keycloak_role VALUES ('3f29b93a-5c9e-44a6-8895-28190ddebabd', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_manage-events}', 'manage-events', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);
INSERT INTO public.keycloak_role VALUES ('189666e9-38c9-46e3-a26e-7f03a6246a22', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_manage-identity-providers}', 'manage-identity-providers', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);
INSERT INTO public.keycloak_role VALUES ('ff16c40f-d986-440d-970e-3716ea2b67b3', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_manage-authorization}', 'manage-authorization', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);
INSERT INTO public.keycloak_role VALUES ('f6910dc0-be78-4a5a-9035-d579731dd7aa', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_query-users}', 'query-users', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);
INSERT INTO public.keycloak_role VALUES ('ba2cac72-872f-4e55-b92a-0a5da78854cf', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_query-clients}', 'query-clients', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);
INSERT INTO public.keycloak_role VALUES ('b2abba9b-7f22-4104-b8a1-f00b76b5fab6', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_query-realms}', 'query-realms', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);
INSERT INTO public.keycloak_role VALUES ('de06cc42-d894-4996-a174-b320704c47f4', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_query-groups}', 'query-groups', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);
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
INSERT INTO public.keycloak_role VALUES ('fc60c2a5-f923-42c6-adc4-79bb96e255df', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', true, '${role_impersonation}', 'impersonation', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', NULL);


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.migration_model VALUES ('8hsc0', '22.0.1', 1699116494);


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

INSERT INTO public.protocol_mapper VALUES ('23987810-a097-486a-8fc9-67be3a0b1107', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '4a2dc3f0-8d1e-4947-a648-f2f935a8cd20', NULL);
INSERT INTO public.protocol_mapper VALUES ('e73cebd2-0e33-4a67-8988-7c5b6d768dfc', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '3289e176-4211-420c-8a77-40debd6547e8', NULL);
INSERT INTO public.protocol_mapper VALUES ('82c09aeb-ad1a-4fbe-a6ab-e89d2e85339f', 'role list', 'saml', 'saml-role-list-mapper', NULL, '7be9df09-0869-4fa5-a827-aed8f1774836');
INSERT INTO public.protocol_mapper VALUES ('b5cf6e56-4ce1-4805-8828-5407166c7ffb', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '2e7104a4-61bc-49eb-9275-b00a23e94785');
INSERT INTO public.protocol_mapper VALUES ('49eefb91-ed6f-44cb-a18c-e76e29e0a96b', 'family name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2e7104a4-61bc-49eb-9275-b00a23e94785');
INSERT INTO public.protocol_mapper VALUES ('18c493e6-305d-47cb-a697-52b3d719dc74', 'given name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2e7104a4-61bc-49eb-9275-b00a23e94785');
INSERT INTO public.protocol_mapper VALUES ('5af41557-d67f-46ec-93e0-80ca1d28bf00', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2e7104a4-61bc-49eb-9275-b00a23e94785');
INSERT INTO public.protocol_mapper VALUES ('b37763d8-5c88-406a-aa67-12fad63b0e32', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2e7104a4-61bc-49eb-9275-b00a23e94785');
INSERT INTO public.protocol_mapper VALUES ('48a9015e-0c19-47e7-af26-a0b9dcab50cd', 'username', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2e7104a4-61bc-49eb-9275-b00a23e94785');
INSERT INTO public.protocol_mapper VALUES ('dc756db1-9ea9-4b96-abb2-110c021e8356', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2e7104a4-61bc-49eb-9275-b00a23e94785');
INSERT INTO public.protocol_mapper VALUES ('02dac232-345b-42dc-aa6f-6c5466f65594', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2e7104a4-61bc-49eb-9275-b00a23e94785');
INSERT INTO public.protocol_mapper VALUES ('f9340fdc-c3da-4cf8-9ab6-fbe4805b6d3a', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2e7104a4-61bc-49eb-9275-b00a23e94785');
INSERT INTO public.protocol_mapper VALUES ('30f9962e-0621-4281-82bb-43fa9e88af8b', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2e7104a4-61bc-49eb-9275-b00a23e94785');
INSERT INTO public.protocol_mapper VALUES ('f653353f-dc75-4b31-9d64-c8c65d5a106d', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2e7104a4-61bc-49eb-9275-b00a23e94785');
INSERT INTO public.protocol_mapper VALUES ('f7ee21ad-c3c1-4a31-a320-e6374aa9848e', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2e7104a4-61bc-49eb-9275-b00a23e94785');
INSERT INTO public.protocol_mapper VALUES ('bb2c8d22-e2a5-48c5-8dcc-f838a8896c60', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2e7104a4-61bc-49eb-9275-b00a23e94785');
INSERT INTO public.protocol_mapper VALUES ('52714136-94fd-4d24-80ec-7509ed3b39a9', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2e7104a4-61bc-49eb-9275-b00a23e94785');
INSERT INTO public.protocol_mapper VALUES ('b88f2c0f-e38c-47d1-bb03-d83ee30ddef2', 'email', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '0a720260-d8b4-4f87-92bf-0189e5c50f6e');
INSERT INTO public.protocol_mapper VALUES ('51f82e0b-b86f-45a9-9e19-6025d30773c7', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '0a720260-d8b4-4f87-92bf-0189e5c50f6e');
INSERT INTO public.protocol_mapper VALUES ('16412bdd-5913-4ec8-a2cb-6eab0d5f9d52', 'address', 'openid-connect', 'oidc-address-mapper', NULL, 'b46b5dd5-cfb8-40d3-814d-6b1962f165df');
INSERT INTO public.protocol_mapper VALUES ('36bc0d3f-52eb-452b-a174-56de62b13b23', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a2afbdf1-3bf7-4d41-8622-36160bd08504');
INSERT INTO public.protocol_mapper VALUES ('e732a4bd-e06f-4b91-bb7f-47d8397e4a77', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a2afbdf1-3bf7-4d41-8622-36160bd08504');
INSERT INTO public.protocol_mapper VALUES ('a1ff96b1-d8d2-429d-a0c4-f43971043cb9', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '582567ed-3b58-4b1e-bf91-3540c389b1c1');
INSERT INTO public.protocol_mapper VALUES ('50a817ac-acfb-4b96-ba86-4c97d6297685', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '582567ed-3b58-4b1e-bf91-3540c389b1c1');
INSERT INTO public.protocol_mapper VALUES ('463345c1-0493-4f8e-8af4-0f5b3082545c', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '582567ed-3b58-4b1e-bf91-3540c389b1c1');
INSERT INTO public.protocol_mapper VALUES ('5bcf8da1-4cc2-4a5d-862f-0bb31bcddfdb', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '105b96cb-1aea-4e1f-88eb-4fa290fe1987');
INSERT INTO public.protocol_mapper VALUES ('0eb2d79f-e3c8-4bd9-8df6-c934a17a1629', 'upn', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '94ee8b1b-a58f-437a-a3b8-ca7920f6ffcb');
INSERT INTO public.protocol_mapper VALUES ('9f37912f-2e7c-42fe-85c9-1547baa56121', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '94ee8b1b-a58f-437a-a3b8-ca7920f6ffcb');
INSERT INTO public.protocol_mapper VALUES ('e572a668-96f7-4648-96c3-e61eeb786223', 'acr loa level', 'openid-connect', 'oidc-acr-mapper', NULL, '399fe0b7-d548-4fb1-a429-6780db1c0762');
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

INSERT INTO public.protocol_mapper_config VALUES ('e73cebd2-0e33-4a67-8988-7c5b6d768dfc', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e73cebd2-0e33-4a67-8988-7c5b6d768dfc', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('e73cebd2-0e33-4a67-8988-7c5b6d768dfc', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e73cebd2-0e33-4a67-8988-7c5b6d768dfc', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e73cebd2-0e33-4a67-8988-7c5b6d768dfc', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('e73cebd2-0e33-4a67-8988-7c5b6d768dfc', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('82c09aeb-ad1a-4fbe-a6ab-e89d2e85339f', 'false', 'single');
INSERT INTO public.protocol_mapper_config VALUES ('82c09aeb-ad1a-4fbe-a6ab-e89d2e85339f', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config VALUES ('82c09aeb-ad1a-4fbe-a6ab-e89d2e85339f', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config VALUES ('02dac232-345b-42dc-aa6f-6c5466f65594', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('02dac232-345b-42dc-aa6f-6c5466f65594', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('02dac232-345b-42dc-aa6f-6c5466f65594', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('02dac232-345b-42dc-aa6f-6c5466f65594', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('02dac232-345b-42dc-aa6f-6c5466f65594', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('02dac232-345b-42dc-aa6f-6c5466f65594', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('18c493e6-305d-47cb-a697-52b3d719dc74', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('18c493e6-305d-47cb-a697-52b3d719dc74', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('18c493e6-305d-47cb-a697-52b3d719dc74', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('18c493e6-305d-47cb-a697-52b3d719dc74', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('18c493e6-305d-47cb-a697-52b3d719dc74', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('18c493e6-305d-47cb-a697-52b3d719dc74', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('30f9962e-0621-4281-82bb-43fa9e88af8b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('30f9962e-0621-4281-82bb-43fa9e88af8b', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('30f9962e-0621-4281-82bb-43fa9e88af8b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('30f9962e-0621-4281-82bb-43fa9e88af8b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('30f9962e-0621-4281-82bb-43fa9e88af8b', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('30f9962e-0621-4281-82bb-43fa9e88af8b', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('48a9015e-0c19-47e7-af26-a0b9dcab50cd', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('48a9015e-0c19-47e7-af26-a0b9dcab50cd', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('48a9015e-0c19-47e7-af26-a0b9dcab50cd', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('48a9015e-0c19-47e7-af26-a0b9dcab50cd', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('48a9015e-0c19-47e7-af26-a0b9dcab50cd', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('48a9015e-0c19-47e7-af26-a0b9dcab50cd', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('49eefb91-ed6f-44cb-a18c-e76e29e0a96b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('49eefb91-ed6f-44cb-a18c-e76e29e0a96b', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('49eefb91-ed6f-44cb-a18c-e76e29e0a96b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('49eefb91-ed6f-44cb-a18c-e76e29e0a96b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('49eefb91-ed6f-44cb-a18c-e76e29e0a96b', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('49eefb91-ed6f-44cb-a18c-e76e29e0a96b', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('52714136-94fd-4d24-80ec-7509ed3b39a9', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('52714136-94fd-4d24-80ec-7509ed3b39a9', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('52714136-94fd-4d24-80ec-7509ed3b39a9', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('52714136-94fd-4d24-80ec-7509ed3b39a9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('52714136-94fd-4d24-80ec-7509ed3b39a9', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('52714136-94fd-4d24-80ec-7509ed3b39a9', 'long', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('5af41557-d67f-46ec-93e0-80ca1d28bf00', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5af41557-d67f-46ec-93e0-80ca1d28bf00', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('5af41557-d67f-46ec-93e0-80ca1d28bf00', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5af41557-d67f-46ec-93e0-80ca1d28bf00', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5af41557-d67f-46ec-93e0-80ca1d28bf00', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('5af41557-d67f-46ec-93e0-80ca1d28bf00', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('b37763d8-5c88-406a-aa67-12fad63b0e32', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b37763d8-5c88-406a-aa67-12fad63b0e32', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('b37763d8-5c88-406a-aa67-12fad63b0e32', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b37763d8-5c88-406a-aa67-12fad63b0e32', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b37763d8-5c88-406a-aa67-12fad63b0e32', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('b37763d8-5c88-406a-aa67-12fad63b0e32', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('b5cf6e56-4ce1-4805-8828-5407166c7ffb', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b5cf6e56-4ce1-4805-8828-5407166c7ffb', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b5cf6e56-4ce1-4805-8828-5407166c7ffb', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bb2c8d22-e2a5-48c5-8dcc-f838a8896c60', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bb2c8d22-e2a5-48c5-8dcc-f838a8896c60', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('bb2c8d22-e2a5-48c5-8dcc-f838a8896c60', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bb2c8d22-e2a5-48c5-8dcc-f838a8896c60', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('bb2c8d22-e2a5-48c5-8dcc-f838a8896c60', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('bb2c8d22-e2a5-48c5-8dcc-f838a8896c60', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('dc756db1-9ea9-4b96-abb2-110c021e8356', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('dc756db1-9ea9-4b96-abb2-110c021e8356', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('dc756db1-9ea9-4b96-abb2-110c021e8356', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('dc756db1-9ea9-4b96-abb2-110c021e8356', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('dc756db1-9ea9-4b96-abb2-110c021e8356', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('dc756db1-9ea9-4b96-abb2-110c021e8356', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f653353f-dc75-4b31-9d64-c8c65d5a106d', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f653353f-dc75-4b31-9d64-c8c65d5a106d', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f653353f-dc75-4b31-9d64-c8c65d5a106d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f653353f-dc75-4b31-9d64-c8c65d5a106d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f653353f-dc75-4b31-9d64-c8c65d5a106d', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f653353f-dc75-4b31-9d64-c8c65d5a106d', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f7ee21ad-c3c1-4a31-a320-e6374aa9848e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f7ee21ad-c3c1-4a31-a320-e6374aa9848e', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f7ee21ad-c3c1-4a31-a320-e6374aa9848e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f7ee21ad-c3c1-4a31-a320-e6374aa9848e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f7ee21ad-c3c1-4a31-a320-e6374aa9848e', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f7ee21ad-c3c1-4a31-a320-e6374aa9848e', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f9340fdc-c3da-4cf8-9ab6-fbe4805b6d3a', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f9340fdc-c3da-4cf8-9ab6-fbe4805b6d3a', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f9340fdc-c3da-4cf8-9ab6-fbe4805b6d3a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f9340fdc-c3da-4cf8-9ab6-fbe4805b6d3a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f9340fdc-c3da-4cf8-9ab6-fbe4805b6d3a', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f9340fdc-c3da-4cf8-9ab6-fbe4805b6d3a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('51f82e0b-b86f-45a9-9e19-6025d30773c7', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('51f82e0b-b86f-45a9-9e19-6025d30773c7', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('51f82e0b-b86f-45a9-9e19-6025d30773c7', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('51f82e0b-b86f-45a9-9e19-6025d30773c7', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('51f82e0b-b86f-45a9-9e19-6025d30773c7', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('51f82e0b-b86f-45a9-9e19-6025d30773c7', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('b88f2c0f-e38c-47d1-bb03-d83ee30ddef2', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b88f2c0f-e38c-47d1-bb03-d83ee30ddef2', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('b88f2c0f-e38c-47d1-bb03-d83ee30ddef2', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b88f2c0f-e38c-47d1-bb03-d83ee30ddef2', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b88f2c0f-e38c-47d1-bb03-d83ee30ddef2', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('b88f2c0f-e38c-47d1-bb03-d83ee30ddef2', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('16412bdd-5913-4ec8-a2cb-6eab0d5f9d52', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config VALUES ('16412bdd-5913-4ec8-a2cb-6eab0d5f9d52', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config VALUES ('16412bdd-5913-4ec8-a2cb-6eab0d5f9d52', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config VALUES ('16412bdd-5913-4ec8-a2cb-6eab0d5f9d52', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('16412bdd-5913-4ec8-a2cb-6eab0d5f9d52', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config VALUES ('16412bdd-5913-4ec8-a2cb-6eab0d5f9d52', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('16412bdd-5913-4ec8-a2cb-6eab0d5f9d52', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config VALUES ('16412bdd-5913-4ec8-a2cb-6eab0d5f9d52', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('16412bdd-5913-4ec8-a2cb-6eab0d5f9d52', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config VALUES ('36bc0d3f-52eb-452b-a174-56de62b13b23', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('36bc0d3f-52eb-452b-a174-56de62b13b23', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('36bc0d3f-52eb-452b-a174-56de62b13b23', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('36bc0d3f-52eb-452b-a174-56de62b13b23', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('36bc0d3f-52eb-452b-a174-56de62b13b23', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('36bc0d3f-52eb-452b-a174-56de62b13b23', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('e732a4bd-e06f-4b91-bb7f-47d8397e4a77', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e732a4bd-e06f-4b91-bb7f-47d8397e4a77', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('e732a4bd-e06f-4b91-bb7f-47d8397e4a77', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e732a4bd-e06f-4b91-bb7f-47d8397e4a77', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e732a4bd-e06f-4b91-bb7f-47d8397e4a77', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('e732a4bd-e06f-4b91-bb7f-47d8397e4a77', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('50a817ac-acfb-4b96-ba86-4c97d6297685', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('50a817ac-acfb-4b96-ba86-4c97d6297685', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('50a817ac-acfb-4b96-ba86-4c97d6297685', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('50a817ac-acfb-4b96-ba86-4c97d6297685', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('50a817ac-acfb-4b96-ba86-4c97d6297685', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a1ff96b1-d8d2-429d-a0c4-f43971043cb9', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('a1ff96b1-d8d2-429d-a0c4-f43971043cb9', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('a1ff96b1-d8d2-429d-a0c4-f43971043cb9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a1ff96b1-d8d2-429d-a0c4-f43971043cb9', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('a1ff96b1-d8d2-429d-a0c4-f43971043cb9', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('0eb2d79f-e3c8-4bd9-8df6-c934a17a1629', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0eb2d79f-e3c8-4bd9-8df6-c934a17a1629', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('0eb2d79f-e3c8-4bd9-8df6-c934a17a1629', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0eb2d79f-e3c8-4bd9-8df6-c934a17a1629', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0eb2d79f-e3c8-4bd9-8df6-c934a17a1629', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('0eb2d79f-e3c8-4bd9-8df6-c934a17a1629', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('9f37912f-2e7c-42fe-85c9-1547baa56121', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('9f37912f-2e7c-42fe-85c9-1547baa56121', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('9f37912f-2e7c-42fe-85c9-1547baa56121', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9f37912f-2e7c-42fe-85c9-1547baa56121', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9f37912f-2e7c-42fe-85c9-1547baa56121', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('9f37912f-2e7c-42fe-85c9-1547baa56121', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('e572a668-96f7-4648-96c3-e61eeb786223', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e572a668-96f7-4648-96c3-e61eeb786223', 'true', 'access.token.claim');
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

INSERT INTO public.realm VALUES ('662f6baf-45d0-437d-b002-c3f9ccdcb69d', 60, 300, 300, NULL, NULL, NULL, true, false, 0, NULL, 'book-store', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '5a3433aa-cbcb-47ec-85ca-0842bbd5889f', 1800, false, NULL, false, false, false, true, 0, 1, 30, 6, 'HmacSHA1', 'totp', '520fad15-8981-402d-a4a1-501d74ff1e5d', '2702976c-d524-4ac9-aecb-d15bdc2e106c', '5f092739-61f4-41c0-bba6-24beb17d3692', '066486dd-fef3-4290-a604-5a552c223679', '624a9489-d8ed-4b14-a78f-975f06c16818', 2592000, false, 900, true, false, '128ad414-638b-47ef-9596-d9296d7b785d', 0, false, 0, 0, 'c46a9467-cb5a-4888-b8c1-fd6623005642');
INSERT INTO public.realm VALUES ('22037ef2-30b3-470d-85d6-637d3c8b987f', 60, 300, 60, NULL, NULL, NULL, true, false, 0, NULL, 'master', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '109f3c90-f5d8-49f4-ac95-17874d87788a', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', '939b4814-33da-4863-8614-148695102913', '634c1c33-d32b-44f1-b594-8ad69f8a9874', '8b22fc3b-9675-4f23-85c9-51a2c27cd948', '524ab0a5-b0f6-472a-a792-4780f4189f3d', '33952e99-a84e-4c60-b590-4cb507237dd4', 2592000, false, 900, true, false, '1315e749-e301-4c8e-ba1d-ff0a753e7bca', 0, false, 0, 0, '9a58b231-4246-48c3-a17a-78ff6a190d66');


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicyReportOnly', '22037ef2-30b3-470d-85d6-637d3c8b987f', '');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xContentTypeOptions', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'nosniff');
INSERT INTO public.realm_attribute VALUES ('_browser_header.referrerPolicy', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'no-referrer');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xRobotsTag', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'none');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xFrameOptions', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'SAMEORIGIN');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicy', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xXSSProtection', '22037ef2-30b3-470d-85d6-637d3c8b987f', '1; mode=block');
INSERT INTO public.realm_attribute VALUES ('_browser_header.strictTransportSecurity', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'max-age=31536000; includeSubDomains');
INSERT INTO public.realm_attribute VALUES ('bruteForceProtected', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'false');
INSERT INTO public.realm_attribute VALUES ('permanentLockout', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'false');
INSERT INTO public.realm_attribute VALUES ('maxFailureWaitSeconds', '22037ef2-30b3-470d-85d6-637d3c8b987f', '900');
INSERT INTO public.realm_attribute VALUES ('minimumQuickLoginWaitSeconds', '22037ef2-30b3-470d-85d6-637d3c8b987f', '60');
INSERT INTO public.realm_attribute VALUES ('waitIncrementSeconds', '22037ef2-30b3-470d-85d6-637d3c8b987f', '60');
INSERT INTO public.realm_attribute VALUES ('quickLoginCheckMilliSeconds', '22037ef2-30b3-470d-85d6-637d3c8b987f', '1000');
INSERT INTO public.realm_attribute VALUES ('maxDeltaTimeSeconds', '22037ef2-30b3-470d-85d6-637d3c8b987f', '43200');
INSERT INTO public.realm_attribute VALUES ('failureFactor', '22037ef2-30b3-470d-85d6-637d3c8b987f', '30');
INSERT INTO public.realm_attribute VALUES ('realmReusableOtpCode', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'false');
INSERT INTO public.realm_attribute VALUES ('displayName', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'Keycloak');
INSERT INTO public.realm_attribute VALUES ('displayNameHtml', '22037ef2-30b3-470d-85d6-637d3c8b987f', '<div class="kc-logo-text"><span>Keycloak</span></div>');
INSERT INTO public.realm_attribute VALUES ('defaultSignatureAlgorithm', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'RS256');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', '22037ef2-30b3-470d-85d6-637d3c8b987f', 'false');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespan', '22037ef2-30b3-470d-85d6-637d3c8b987f', '5184000');
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

INSERT INTO public.realm_events_listeners VALUES ('22037ef2-30b3-470d-85d6-637d3c8b987f', 'jboss-logging');
INSERT INTO public.realm_events_listeners VALUES ('662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'jboss-logging');


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.realm_required_credential VALUES ('password', 'password', true, true, '22037ef2-30b3-470d-85d6-637d3c8b987f');
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

INSERT INTO public.redirect_uris VALUES ('afd73214-e3a5-4289-ae35-0732685112b0', '/realms/master/account/*');
INSERT INTO public.redirect_uris VALUES ('4a2dc3f0-8d1e-4947-a648-f2f935a8cd20', '/realms/master/account/*');
INSERT INTO public.redirect_uris VALUES ('3289e176-4211-420c-8a77-40debd6547e8', '/admin/master/console/*');
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

INSERT INTO public.required_action_provider VALUES ('f6e38af8-54f0-4520-a03b-ee241f95a41c', 'VERIFY_EMAIL', 'Verify Email', '22037ef2-30b3-470d-85d6-637d3c8b987f', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('281374e6-6037-44ed-a66b-59253b2a0b1b', 'UPDATE_PROFILE', 'Update Profile', '22037ef2-30b3-470d-85d6-637d3c8b987f', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('a90af697-5d8a-444e-b624-ec413ed34ef2', 'CONFIGURE_TOTP', 'Configure OTP', '22037ef2-30b3-470d-85d6-637d3c8b987f', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('01e6cc55-147a-471e-92e1-779d02fceb93', 'UPDATE_PASSWORD', 'Update Password', '22037ef2-30b3-470d-85d6-637d3c8b987f', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('247aebe5-70c1-4181-9c05-7d0610835b7a', 'TERMS_AND_CONDITIONS', 'Terms and Conditions', '22037ef2-30b3-470d-85d6-637d3c8b987f', false, false, 'TERMS_AND_CONDITIONS', 20);
INSERT INTO public.required_action_provider VALUES ('ef9640f1-abd9-463f-929e-22f47595b2e7', 'delete_account', 'Delete Account', '22037ef2-30b3-470d-85d6-637d3c8b987f', false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider VALUES ('5051e4e8-59bb-43b1-b6c2-9622bf297689', 'update_user_locale', 'Update User Locale', '22037ef2-30b3-470d-85d6-637d3c8b987f', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider VALUES ('1333ab21-cdbd-4aee-90ba-1c4313065845', 'webauthn-register', 'Webauthn Register', '22037ef2-30b3-470d-85d6-637d3c8b987f', true, false, 'webauthn-register', 70);
INSERT INTO public.required_action_provider VALUES ('24b49cb5-d08d-4248-9466-fd844eea74c8', 'webauthn-register-passwordless', 'Webauthn Register Passwordless', '22037ef2-30b3-470d-85d6-637d3c8b987f', true, false, 'webauthn-register-passwordless', 80);
INSERT INTO public.required_action_provider VALUES ('4cbc487d-6f08-49bb-997e-8c95a8e6da08', 'CONFIGURE_TOTP', 'Configure OTP', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('06ae8390-5e63-451e-8e5a-cd79825edd10', 'TERMS_AND_CONDITIONS', 'Terms and Conditions', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', false, false, 'TERMS_AND_CONDITIONS', 20);
INSERT INTO public.required_action_provider VALUES ('930609a5-14d7-45b7-ba5d-ac4fe04333d4', 'UPDATE_PASSWORD', 'Update Password', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('7ce1f22b-2e07-4791-84e4-297521ed6c66', 'UPDATE_PROFILE', 'Update Profile', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('5aa23214-2b8c-4812-a788-aa4124f0bc1b', 'VERIFY_EMAIL', 'Verify Email', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('94fb8b24-aeab-49c3-8874-bb6bee36504b', 'delete_account', 'Delete Account', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider VALUES ('f5c90863-8031-49f6-b0fe-ab9fba0fccc4', 'webauthn-register', 'Webauthn Register', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'webauthn-register', 70);
INSERT INTO public.required_action_provider VALUES ('212097cd-dbbe-418c-b847-55e7897a6eca', 'webauthn-register-passwordless', 'Webauthn Register Passwordless', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'webauthn-register-passwordless', 80);
INSERT INTO public.required_action_provider VALUES ('10002273-6e86-4802-b527-e92af4577b08', 'update_user_locale', 'Update User Locale', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'update_user_locale', 1000);


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

INSERT INTO public.scope_mapping VALUES ('4a2dc3f0-8d1e-4947-a648-f2f935a8cd20', 'b739f236-9ee2-461f-8ae8-db538e5a37e8');
INSERT INTO public.scope_mapping VALUES ('4a2dc3f0-8d1e-4947-a648-f2f935a8cd20', 'a23fa89b-e7d6-431f-ba88-a2f91b11a09c');
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

INSERT INTO public.user_entity VALUES ('45858445-1bbb-4611-b3f2-a3386db59829', NULL, 'd0219bef-c614-4dee-b582-74bf3905e265', false, true, NULL, NULL, NULL, '22037ef2-30b3-470d-85d6-637d3c8b987f', 'admin', 1699116495885, NULL, 0);
INSERT INTO public.user_entity VALUES ('39bde318-96a2-4cd0-acdb-dd92b27d8e43', 'admin@admin', 'admin@admin', false, true, NULL, NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'admin', 1699120716672, NULL, 0);
INSERT INTO public.user_entity VALUES ('061f3c22-945c-4d74-bfbf-0446a21c0744', 'user@user', 'user@user', false, true, NULL, NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'user', 1699120724354, NULL, 0);


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



--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.user_role_mapping VALUES ('9a58b231-4246-48c3-a17a-78ff6a190d66', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('cf889cc4-c918-4a43-a4f6-eea1cb248f6c', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('070cd1c5-7b8f-4032-8ba7-35b905452829', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('fe311841-151d-4c2f-ac0e-17382c8350d2', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('96cab5c8-b0c7-4f3b-b91b-10b9bf7441ba', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('82fe19c4-1c3f-4a76-8438-1d3a5fca1567', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('f2ce2915-586a-4675-b95f-e828271ff787', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('a5f12f4e-4818-41b6-80c9-0a966c680bf9', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('79bc9c93-0a08-4ecf-b85e-1e6982247021', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('34ef8271-8fc2-454d-809c-98fcb0624199', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('ac06a77a-edba-4137-8928-bc0c23ae37b9', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('48f2cca3-6345-4d7d-a3bd-a28ee780c4df', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('3f29b93a-5c9e-44a6-8895-28190ddebabd', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('189666e9-38c9-46e3-a26e-7f03a6246a22', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('ff16c40f-d986-440d-970e-3716ea2b67b3', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('f6910dc0-be78-4a5a-9035-d579731dd7aa', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('ba2cac72-872f-4e55-b92a-0a5da78854cf', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('b2abba9b-7f22-4104-b8a1-f00b76b5fab6', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('de06cc42-d894-4996-a174-b320704c47f4', '45858445-1bbb-4611-b3f2-a3386db59829');
INSERT INTO public.user_role_mapping VALUES ('c46a9467-cb5a-4888-b8c1-fd6623005642', '39bde318-96a2-4cd0-acdb-dd92b27d8e43');
INSERT INTO public.user_role_mapping VALUES ('c46a9467-cb5a-4888-b8c1-fd6623005642', '061f3c22-945c-4d74-bfbf-0446a21c0744');
INSERT INTO public.user_role_mapping VALUES ('aa5bd567-3466-41e3-bf8d-a6e1a13f9047', '39bde318-96a2-4cd0-acdb-dd92b27d8e43');


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

INSERT INTO public.web_origins VALUES ('3289e176-4211-420c-8a77-40debd6547e8', '+');
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

