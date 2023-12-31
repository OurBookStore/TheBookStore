--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE admin;
ALTER ROLE admin WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:l54qkNoSt2BVS7mXnj4SRQ==$X6MORVjih6JlVw9G0l3fZApPhcQRR/peM+7BjeMWyc8=:tBW4w28ol4qWaD1Jzn7BTdhijZZK47QgZdp403IyBEg=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

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
-- PostgreSQL database dump complete
--

--
-- Database "admin" dump
--

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
-- Name: admin; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE admin WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE admin OWNER TO admin;

\connect admin

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
-- PostgreSQL database dump complete
--

--
-- Database "book_store" dump
--

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
-- Name: book_store; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE book_store WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE book_store OWNER TO admin;

\connect book_store

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
-- Name: app_user_model; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.app_user_model (
                                       id bigint NOT NULL,
                                       email character varying(255),
                                       keycloak_id character varying(255),
                                       nickname character varying(255),
                                       password character varying(255),
                                       cart_id bigint
);


ALTER TABLE public.app_user_model OWNER TO admin;

--
-- Name: app_user_model_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.app_user_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_model_id_seq OWNER TO admin;

--
-- Name: app_user_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.app_user_model_id_seq OWNED BY public.app_user_model.id;


--
-- Name: author_model; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.author_model (
                                     id bigint NOT NULL,
                                     country character varying(255),
                                     date_of_birth date,
                                     full_name character varying(255)
);


ALTER TABLE public.author_model OWNER TO admin;

--
-- Name: author_model_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.author_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_model_id_seq OWNER TO admin;

--
-- Name: author_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.author_model_id_seq OWNED BY public.author_model.id;


--
-- Name: book_model; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.book_model (
                                   id bigint NOT NULL,
                                   count integer NOT NULL,
                                   image character varying(255),
                                   name character varying(255),
                                   price double precision NOT NULL
);


ALTER TABLE public.book_model OWNER TO admin;

--
-- Name: book_model_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.book_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_model_id_seq OWNER TO admin;

--
-- Name: book_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.book_model_id_seq OWNED BY public.book_model.id;


--
-- Name: cart_model; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.cart_model (
    id bigint NOT NULL
);


ALTER TABLE public.cart_model OWNER TO admin;

--
-- Name: cart_model_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.cart_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_model_id_seq OWNER TO admin;

--
-- Name: cart_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.cart_model_id_seq OWNED BY public.cart_model.id;


--
-- Name: order_model; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.order_model (
                                    id bigint NOT NULL,
                                    address character varying(255),
                                    total_price double precision NOT NULL,
                                    app_user_id bigint
);


ALTER TABLE public.order_model OWNER TO admin;

--
-- Name: order_model_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.order_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_model_id_seq OWNER TO admin;

--
-- Name: order_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.order_model_id_seq OWNED BY public.order_model.id;


--
-- Name: order_position_model; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.order_position_model (
                                             id bigint NOT NULL,
                                             count integer NOT NULL,
                                             price double precision NOT NULL,
                                             book_id bigint,
                                             cart_id bigint,
                                             order_id bigint
);


ALTER TABLE public.order_position_model OWNER TO admin;

--
-- Name: order_position_model_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.order_position_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_position_model_id_seq OWNER TO admin;

--
-- Name: order_position_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.order_position_model_id_seq OWNED BY public.order_position_model.id;


--
-- Name: order_status_history_model; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.order_status_history_model (
                                                   id bigint NOT NULL,
                                                   date_time timestamp(6) without time zone,
                                                   is_actual boolean NOT NULL,
                                                   status character varying(255),
                                                   order_id bigint
);


ALTER TABLE public.order_status_history_model OWNER TO admin;

--
-- Name: order_status_history_model_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.order_status_history_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_status_history_model_id_seq OWNER TO admin;

--
-- Name: order_status_history_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.order_status_history_model_id_seq OWNED BY public.order_status_history_model.id;


--
-- Name: app_user_model id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_user_model ALTER COLUMN id SET DEFAULT nextval('public.app_user_model_id_seq'::regclass);


--
-- Name: author_model id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.author_model ALTER COLUMN id SET DEFAULT nextval('public.author_model_id_seq'::regclass);


--
-- Name: book_model id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.book_model ALTER COLUMN id SET DEFAULT nextval('public.book_model_id_seq'::regclass);


--
-- Name: cart_model id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cart_model ALTER COLUMN id SET DEFAULT nextval('public.cart_model_id_seq'::regclass);


--
-- Name: order_model id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_model ALTER COLUMN id SET DEFAULT nextval('public.order_model_id_seq'::regclass);


--
-- Name: order_position_model id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_position_model ALTER COLUMN id SET DEFAULT nextval('public.order_position_model_id_seq'::regclass);


--
-- Name: order_status_history_model id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_status_history_model ALTER COLUMN id SET DEFAULT nextval('public.order_status_history_model_id_seq'::regclass);


--
-- Data for Name: app_user_model; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.app_user_model VALUES (1, 'user@user', 'b387010c-2582-48ce-aab7-f28371cd9fee', 'user', 'user', 1);
INSERT INTO public.app_user_model VALUES (2, 'admin@admin', '24756198-f4c1-4899-8a0d-1bcadd115f33', 'admin', 'admin', 2);


--
-- Data for Name: author_model; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: book_model; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.book_model VALUES (1, 5, '', 'book1', 100);
INSERT INTO public.book_model VALUES (2, 17, '', 'book2', 90);
INSERT INTO public.book_model VALUES (3, 1, '', 'book3', 130);

--
-- Data for Name: cart_model; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.cart_model VALUES (1);
INSERT INTO public.cart_model VALUES (2);


--
-- Data for Name: order_model; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: order_position_model; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: order_status_history_model; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Name: app_user_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.app_user_model_id_seq', 2, true);


--
-- Name: author_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.author_model_id_seq', 1, false);


--
-- Name: book_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.book_model_id_seq', 1, false);


--
-- Name: cart_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.cart_model_id_seq', 2, true);


--
-- Name: order_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.order_model_id_seq', 1, false);


--
-- Name: order_position_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.order_position_model_id_seq', 1, false);


--
-- Name: order_status_history_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.order_status_history_model_id_seq', 1, false);


--
-- Name: app_user_model app_user_model_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_user_model
    ADD CONSTRAINT app_user_model_pkey PRIMARY KEY (id);


--
-- Name: author_model author_model_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.author_model
    ADD CONSTRAINT author_model_pkey PRIMARY KEY (id);


--
-- Name: book_model book_model_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.book_model
    ADD CONSTRAINT book_model_pkey PRIMARY KEY (id);


--
-- Name: cart_model cart_model_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cart_model
    ADD CONSTRAINT cart_model_pkey PRIMARY KEY (id);


--
-- Name: order_model order_model_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_model
    ADD CONSTRAINT order_model_pkey PRIMARY KEY (id);


--
-- Name: order_position_model order_position_model_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_position_model
    ADD CONSTRAINT order_position_model_pkey PRIMARY KEY (id);


--
-- Name: order_status_history_model order_status_history_model_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_status_history_model
    ADD CONSTRAINT order_status_history_model_pkey PRIMARY KEY (id);


--
-- Name: app_user_model uk_91d0708apcws8l9ymel9cktju; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_user_model
    ADD CONSTRAINT uk_91d0708apcws8l9ymel9cktju UNIQUE (keycloak_id);


--
-- Name: order_status_history_model ukh0a02jy038c5hi701gt0205lp; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_status_history_model
    ADD CONSTRAINT ukh0a02jy038c5hi701gt0205lp UNIQUE (order_id, status);


--
-- Name: idx7998rlv3aq5q68hhiuudkktlg; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx7998rlv3aq5q68hhiuudkktlg ON public.order_model USING btree (app_user_id);


--
-- Name: idx91d0708apcws8l9ymel9cktju; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx91d0708apcws8l9ymel9cktju ON public.app_user_model USING btree (keycloak_id);


--
-- Name: order_model fk67x3rqt5g0e5ksdtbnuahy8p1; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_model
    ADD CONSTRAINT fk67x3rqt5g0e5ksdtbnuahy8p1 FOREIGN KEY (app_user_id) REFERENCES public.app_user_model(id);


--
-- Name: order_position_model fkaabd4q0h6x4daywnj4mbc4ebr; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_position_model
    ADD CONSTRAINT fkaabd4q0h6x4daywnj4mbc4ebr FOREIGN KEY (book_id) REFERENCES public.book_model(id);


--
-- Name: order_position_model fkbei934attcbj7udts8we6sov0; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_position_model
    ADD CONSTRAINT fkbei934attcbj7udts8we6sov0 FOREIGN KEY (cart_id) REFERENCES public.cart_model(id);


--
-- Name: order_position_model fkelu1l2yurfuvq7ah979q5ot2h; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_position_model
    ADD CONSTRAINT fkelu1l2yurfuvq7ah979q5ot2h FOREIGN KEY (order_id) REFERENCES public.order_model(id);


--
-- Name: app_user_model fkp04njt87rh9c5muq69y6ey5kk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.app_user_model
    ADD CONSTRAINT fkp04njt87rh9c5muq69y6ey5kk FOREIGN KEY (cart_id) REFERENCES public.cart_model(id);


--
-- Name: order_status_history_model fkybgu7daw3vh3qdj59c6pqxse; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.order_status_history_model
    ADD CONSTRAINT fkybgu7daw3vh3qdj59c6pqxse FOREIGN KEY (order_id) REFERENCES public.order_model(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "book_store_keycloak" dump
--

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
-- Name: book_store_keycloak; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE book_store_keycloak WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE book_store_keycloak OWNER TO admin;

\connect book_store_keycloak

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

INSERT INTO public.authentication_execution VALUES ('b607d2a6-c446-4039-8541-4c32721a9b7b', NULL, 'auth-cookie', '546da6ad-8f65-4ce7-ba91-1346136c584b', '1831a8a7-b095-47cb-af32-34358c910c23', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('61f0c7f8-1469-4841-b78c-727c21649e74', NULL, 'auth-spnego', '546da6ad-8f65-4ce7-ba91-1346136c584b', '1831a8a7-b095-47cb-af32-34358c910c23', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e8f8bb40-a016-4007-a69a-472ebc3a2633', NULL, 'identity-provider-redirector', '546da6ad-8f65-4ce7-ba91-1346136c584b', '1831a8a7-b095-47cb-af32-34358c910c23', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('288f4d73-1057-40ca-a668-f6614a686746', NULL, NULL, '546da6ad-8f65-4ce7-ba91-1346136c584b', '1831a8a7-b095-47cb-af32-34358c910c23', 2, 30, true, '8854db31-b2bc-4e56-9711-e0c8d67d24da', NULL);
INSERT INTO public.authentication_execution VALUES ('81ab87ac-8ad7-4c54-944b-79e2c91b3bdd', NULL, 'auth-username-password-form', '546da6ad-8f65-4ce7-ba91-1346136c584b', '8854db31-b2bc-4e56-9711-e0c8d67d24da', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ccdcbfc7-1a41-4c77-a530-371964a78724', NULL, NULL, '546da6ad-8f65-4ce7-ba91-1346136c584b', '8854db31-b2bc-4e56-9711-e0c8d67d24da', 1, 20, true, 'bbf5022a-fc0d-4eb7-bef5-cb2ad59b0314', NULL);
INSERT INTO public.authentication_execution VALUES ('b148408d-0431-49e2-9987-bddfcc6b6bd4', NULL, 'conditional-user-configured', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'bbf5022a-fc0d-4eb7-bef5-cb2ad59b0314', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('68e4593f-caec-402f-b4ce-0320c7428ea4', NULL, 'auth-otp-form', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'bbf5022a-fc0d-4eb7-bef5-cb2ad59b0314', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f58c5160-f704-4fb9-8aa8-dfede82ec5cc', NULL, 'direct-grant-validate-username', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'eb488667-0489-455d-a132-6495674e968d', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b1988703-7e4f-4084-a949-925abf8e9f20', NULL, 'direct-grant-validate-password', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'eb488667-0489-455d-a132-6495674e968d', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('381addc9-3a93-4c3d-96a5-86627943b64c', NULL, NULL, '546da6ad-8f65-4ce7-ba91-1346136c584b', 'eb488667-0489-455d-a132-6495674e968d', 1, 30, true, '32a73661-dc51-461b-88d0-302739cf7aa6', NULL);
INSERT INTO public.authentication_execution VALUES ('8c2cbd04-8213-4a4a-8af3-9891b0c8f656', NULL, 'conditional-user-configured', '546da6ad-8f65-4ce7-ba91-1346136c584b', '32a73661-dc51-461b-88d0-302739cf7aa6', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('223dae35-0fd3-43c5-b145-c1c58579d5c5', NULL, 'direct-grant-validate-otp', '546da6ad-8f65-4ce7-ba91-1346136c584b', '32a73661-dc51-461b-88d0-302739cf7aa6', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('178f13b2-caaf-4bf3-910b-71610936230e', NULL, 'registration-page-form', '546da6ad-8f65-4ce7-ba91-1346136c584b', '9c2febd6-149f-4fb8-8894-5c6c672bb61a', 0, 10, true, 'f4d19d2b-72b6-48d1-8fad-d866d3e10b31', NULL);
INSERT INTO public.authentication_execution VALUES ('f1db0b6f-6974-4446-9ba4-2e11a9ef0346', NULL, 'registration-user-creation', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'f4d19d2b-72b6-48d1-8fad-d866d3e10b31', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f96aa456-7ef3-4f07-9eeb-7a7349c85c9b', NULL, 'registration-profile-action', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'f4d19d2b-72b6-48d1-8fad-d866d3e10b31', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7bf70f59-6c1a-4c57-819b-014a4b83e52b', NULL, 'registration-password-action', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'f4d19d2b-72b6-48d1-8fad-d866d3e10b31', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('abe892dc-20a1-43f5-b3a4-d5f5ab7cfbcf', NULL, 'registration-recaptcha-action', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'f4d19d2b-72b6-48d1-8fad-d866d3e10b31', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('89749c3f-aca7-4928-813f-f4c0b0abbb91', NULL, 'registration-terms-and-conditions', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'f4d19d2b-72b6-48d1-8fad-d866d3e10b31', 3, 70, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('3c4ac9f1-2dd0-4d9e-b06a-7cd1cc8477e0', NULL, 'reset-credentials-choose-user', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'd74d02e8-2af3-43b9-9f80-031307f593a8', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('8179c7bb-046f-4764-a51c-5c4fc3f11e27', NULL, 'reset-credential-email', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'd74d02e8-2af3-43b9-9f80-031307f593a8', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('921b546f-1b7f-4e60-b205-f0da55b4ae11', NULL, 'reset-password', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'd74d02e8-2af3-43b9-9f80-031307f593a8', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('143db70b-aab9-47dc-8dbf-06602aeee0ce', NULL, NULL, '546da6ad-8f65-4ce7-ba91-1346136c584b', 'd74d02e8-2af3-43b9-9f80-031307f593a8', 1, 40, true, '5a411131-bdf5-482f-a77e-8eb82136f1e6', NULL);
INSERT INTO public.authentication_execution VALUES ('638c9bb1-918b-48e6-8ec0-c746ee17f8cf', NULL, 'conditional-user-configured', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5a411131-bdf5-482f-a77e-8eb82136f1e6', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('18aab01f-beac-4516-9c9a-a800e180daac', NULL, 'reset-otp', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5a411131-bdf5-482f-a77e-8eb82136f1e6', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('80a16829-d019-47fe-990c-a2da89265f97', NULL, 'client-secret', '546da6ad-8f65-4ce7-ba91-1346136c584b', '87347a35-0c82-4c71-933f-620d48e892cc', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('25d653b9-eaed-40c5-842a-670ca843764d', NULL, 'client-jwt', '546da6ad-8f65-4ce7-ba91-1346136c584b', '87347a35-0c82-4c71-933f-620d48e892cc', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('3cb85582-e5f0-4766-8cdc-00a3488e3599', NULL, 'client-secret-jwt', '546da6ad-8f65-4ce7-ba91-1346136c584b', '87347a35-0c82-4c71-933f-620d48e892cc', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('1f84856b-40ea-45a9-a060-3844d4375e38', NULL, 'client-x509', '546da6ad-8f65-4ce7-ba91-1346136c584b', '87347a35-0c82-4c71-933f-620d48e892cc', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('05f2d85b-d679-4fe4-ae39-0f14b56c9727', NULL, 'idp-review-profile', '546da6ad-8f65-4ce7-ba91-1346136c584b', '8adc6aa2-a108-49eb-ac19-f3fd8503329a', 0, 10, false, NULL, '5a8f8abf-fcde-4558-9aa3-557f9617bd53');
INSERT INTO public.authentication_execution VALUES ('3ce38104-8f1d-4156-a5ed-40a5d9e8dd61', NULL, NULL, '546da6ad-8f65-4ce7-ba91-1346136c584b', '8adc6aa2-a108-49eb-ac19-f3fd8503329a', 0, 20, true, '9c5e6fcf-7127-4f4e-9167-d756b9c0a511', NULL);
INSERT INTO public.authentication_execution VALUES ('b1255128-ff07-4de7-8bcb-5a8cfb964357', NULL, 'idp-create-user-if-unique', '546da6ad-8f65-4ce7-ba91-1346136c584b', '9c5e6fcf-7127-4f4e-9167-d756b9c0a511', 2, 10, false, NULL, '3e692b0d-860d-4a4c-9ccb-e53256019298');
INSERT INTO public.authentication_execution VALUES ('d6ac7780-847a-46db-a277-5bb0a349bf01', NULL, NULL, '546da6ad-8f65-4ce7-ba91-1346136c584b', '9c5e6fcf-7127-4f4e-9167-d756b9c0a511', 2, 20, true, '5a83dac7-d0f3-4404-882d-0259e4f03689', NULL);
INSERT INTO public.authentication_execution VALUES ('83b3ec03-b57d-4f0d-8a8e-660adfcd7a39', NULL, 'idp-confirm-link', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5a83dac7-d0f3-4404-882d-0259e4f03689', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5ff6e323-4834-4f3b-981a-b5c641b6610b', NULL, NULL, '546da6ad-8f65-4ce7-ba91-1346136c584b', '5a83dac7-d0f3-4404-882d-0259e4f03689', 0, 20, true, 'd18a8e6c-c27b-4bb0-bae4-e49c67c50a93', NULL);
INSERT INTO public.authentication_execution VALUES ('463ca8c2-b640-4dd9-9e10-90d9b1ceecf7', NULL, 'idp-email-verification', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'd18a8e6c-c27b-4bb0-bae4-e49c67c50a93', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f7d242e9-ffd5-485b-a316-60af3322babf', NULL, NULL, '546da6ad-8f65-4ce7-ba91-1346136c584b', 'd18a8e6c-c27b-4bb0-bae4-e49c67c50a93', 2, 20, true, '88603a14-b067-4f20-8675-d56c30e21410', NULL);
INSERT INTO public.authentication_execution VALUES ('b7ad71fc-888f-4f5e-844b-6a5ca7676673', NULL, 'idp-username-password-form', '546da6ad-8f65-4ce7-ba91-1346136c584b', '88603a14-b067-4f20-8675-d56c30e21410', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('fec21900-6300-40f3-b196-4c2412d9eebd', NULL, NULL, '546da6ad-8f65-4ce7-ba91-1346136c584b', '88603a14-b067-4f20-8675-d56c30e21410', 1, 20, true, '37abbb43-a790-42f3-ad41-23ca25248d16', NULL);
INSERT INTO public.authentication_execution VALUES ('34d672f3-5f18-4da8-8833-242f809147d1', NULL, 'conditional-user-configured', '546da6ad-8f65-4ce7-ba91-1346136c584b', '37abbb43-a790-42f3-ad41-23ca25248d16', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('bc4f99c3-9caf-4ef2-9354-443acdd1bc21', NULL, 'auth-otp-form', '546da6ad-8f65-4ce7-ba91-1346136c584b', '37abbb43-a790-42f3-ad41-23ca25248d16', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('2807cc37-903a-4d33-a8c7-424de7aef0bb', NULL, 'http-basic-authenticator', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'c1a4df24-f7c9-49c3-9890-c732400c9eb2', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('1905ddcb-1a11-4bc5-9d8e-63709ad74535', NULL, 'docker-http-basic-authenticator', '546da6ad-8f65-4ce7-ba91-1346136c584b', '8e153df5-1eb8-4a51-964c-d232169522e8', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5244ea5d-5182-4fa3-8347-7651baa5602b', NULL, 'idp-email-verification', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2c212dee-ad76-414c-a0a9-fdfae1dab9e7', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('214760f4-6df9-4db5-bb72-be6cf611186d', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2c212dee-ad76-414c-a0a9-fdfae1dab9e7', 2, 20, true, '7e683a5b-de1a-4768-a163-457d57458978', NULL);
INSERT INTO public.authentication_execution VALUES ('a81387cf-3ee9-4036-8c07-16b4916c2c64', NULL, 'conditional-user-configured', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '1d76af7e-8c7c-46e1-bbc0-3fc0f95ddfda', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('bc5a135b-7b4a-4474-a782-838d9a079629', NULL, 'auth-otp-form', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '1d76af7e-8c7c-46e1-bbc0-3fc0f95ddfda', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ebf23f53-023f-4b8d-a2f9-c0b6adff862f', NULL, 'conditional-user-configured', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '64ef3b81-6e8b-4ad7-a258-29e548388c11', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('8606363f-514c-4bce-a853-73dcda73c51a', NULL, 'direct-grant-validate-otp', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '64ef3b81-6e8b-4ad7-a258-29e548388c11', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('3c39d26c-a0f4-41c0-9317-2b85df626068', NULL, 'conditional-user-configured', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '9d4a44f5-09fc-4a13-8ca5-ca54f4ce38d9', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f348ea3a-75fc-4e48-92ae-92d33297c09c', NULL, 'auth-otp-form', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '9d4a44f5-09fc-4a13-8ca5-ca54f4ce38d9', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('8377ac9e-8de9-4b5b-a9f5-0ec49326a914', NULL, 'idp-confirm-link', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2457a574-ea6d-4de8-b419-db9876bde108', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e21908f2-7ad5-4445-a0dd-2194b52bb86c', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2457a574-ea6d-4de8-b419-db9876bde108', 0, 20, true, '2c212dee-ad76-414c-a0a9-fdfae1dab9e7', NULL);
INSERT INTO public.authentication_execution VALUES ('3e3884ba-b4db-4103-99f8-c62b2ac13219', NULL, 'conditional-user-configured', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '43ccd003-31b8-44da-93f8-6724bcb8b503', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('bb5e89a6-a878-413d-a966-9eced5fc0d9b', NULL, 'reset-otp', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '43ccd003-31b8-44da-93f8-6724bcb8b503', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f1cdf5d0-176f-47b5-9ef5-29303585b130', NULL, 'idp-create-user-if-unique', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2cfc1295-cd45-43c7-b8e6-bd14ae5e685e', 2, 10, false, NULL, '9295d203-65a1-4d61-ad4a-081a4dc16aee');
INSERT INTO public.authentication_execution VALUES ('0c0a2eba-14a5-48f7-a0d6-43d53c6dc380', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2cfc1295-cd45-43c7-b8e6-bd14ae5e685e', 2, 20, true, '2457a574-ea6d-4de8-b419-db9876bde108', NULL);
INSERT INTO public.authentication_execution VALUES ('961d89b9-cdfe-42f8-b8c6-db068d61cd3c', NULL, 'idp-username-password-form', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '7e683a5b-de1a-4768-a163-457d57458978', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('0990ef53-74e1-48ee-83dc-22d0e6bdd8a0', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '7e683a5b-de1a-4768-a163-457d57458978', 1, 20, true, '9d4a44f5-09fc-4a13-8ca5-ca54f4ce38d9', NULL);
INSERT INTO public.authentication_execution VALUES ('8a65a385-8aad-4dfe-ac1f-f0eea5f6d267', NULL, 'auth-cookie', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '520fad15-8981-402d-a4a1-501d74ff1e5d', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4d1e8920-6b31-4708-ae4f-b4a1be4da3f1', NULL, 'auth-spnego', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '520fad15-8981-402d-a4a1-501d74ff1e5d', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('69f2fdad-48f2-434d-9832-275dc82a20c5', NULL, 'identity-provider-redirector', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '520fad15-8981-402d-a4a1-501d74ff1e5d', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ba813c6c-b789-4347-84ac-79c610df1c4d', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '520fad15-8981-402d-a4a1-501d74ff1e5d', 2, 30, true, '6a6972fe-39d2-46ad-b0c3-675e4c7494f8', NULL);
INSERT INTO public.authentication_execution VALUES ('6215c865-3a16-4e23-81b1-2023ec59f682', NULL, 'client-secret', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '624a9489-d8ed-4b14-a78f-975f06c16818', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c192c26e-a9dd-4ea5-880f-44ef88b88ccf', NULL, 'client-jwt', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '624a9489-d8ed-4b14-a78f-975f06c16818', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('704eb5ab-83b2-4b36-82fb-5e65cdcf95f9', NULL, 'client-secret-jwt', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '624a9489-d8ed-4b14-a78f-975f06c16818', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('0b6d8870-6a68-4645-9ee2-71847750432a', NULL, 'client-x509', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '624a9489-d8ed-4b14-a78f-975f06c16818', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b639823a-c417-4e5b-97e1-4beba67e0cab', NULL, 'direct-grant-validate-username', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '5f092739-61f4-41c0-bba6-24beb17d3692', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e810e226-003a-45b6-a3be-e457e5e92c93', NULL, 'direct-grant-validate-password', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '5f092739-61f4-41c0-bba6-24beb17d3692', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c7679986-cfce-4266-939e-0da2215d6a5c', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '5f092739-61f4-41c0-bba6-24beb17d3692', 1, 30, true, '64ef3b81-6e8b-4ad7-a258-29e548388c11', NULL);
INSERT INTO public.authentication_execution VALUES ('09b1a5b2-c21e-46c2-bcc8-5da9435fae56', NULL, 'docker-http-basic-authenticator', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '128ad414-638b-47ef-9596-d9296d7b785d', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('34d75142-6385-4772-b276-c12f5f3527b1', NULL, 'idp-review-profile', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'd31ee24b-2d32-4f28-a496-168400c7c27f', 0, 10, false, NULL, '05f5f1a3-e153-4fc8-af4a-cb39f4a3ffa0');
INSERT INTO public.authentication_execution VALUES ('129c5d82-03a8-4ca7-b2e8-2885048de9b5', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'd31ee24b-2d32-4f28-a496-168400c7c27f', 0, 20, true, '2cfc1295-cd45-43c7-b8e6-bd14ae5e685e', NULL);
INSERT INTO public.authentication_execution VALUES ('df95c1e9-65bb-45e1-bdf1-98efb860befc', NULL, 'auth-username-password-form', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '6a6972fe-39d2-46ad-b0c3-675e4c7494f8', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('185b6220-5fc9-477e-b103-fd9ab2f83e52', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '6a6972fe-39d2-46ad-b0c3-675e4c7494f8', 1, 20, true, '1d76af7e-8c7c-46e1-bbc0-3fc0f95ddfda', NULL);
INSERT INTO public.authentication_execution VALUES ('ecfe11be-bd3b-4d93-ab4f-af4d0b128221', NULL, 'registration-page-form', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '2702976c-d524-4ac9-aecb-d15bdc2e106c', 0, 10, true, 'e70d46c7-23b9-4274-9211-275c58d18c07', NULL);
INSERT INTO public.authentication_execution VALUES ('01428909-5bfa-4979-829f-3d788e79de73', NULL, 'registration-user-creation', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'e70d46c7-23b9-4274-9211-275c58d18c07', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('be74e6ad-13aa-48f4-a6ca-1f0ee2bdb3fa', NULL, 'registration-profile-action', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'e70d46c7-23b9-4274-9211-275c58d18c07', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('01f4537c-0d54-4b6a-8148-bcb7c506f00a', NULL, 'registration-password-action', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'e70d46c7-23b9-4274-9211-275c58d18c07', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a95db29c-e05e-4ac3-a64a-0f1f6efeee8d', NULL, 'registration-recaptcha-action', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'e70d46c7-23b9-4274-9211-275c58d18c07', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b71c04ae-6ec1-4bd8-993b-e519a7e5f0d2', NULL, 'reset-credentials-choose-user', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '066486dd-fef3-4290-a604-5a552c223679', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('9ec1d67b-9e46-42aa-8bde-78db1ceae090', NULL, 'reset-credential-email', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '066486dd-fef3-4290-a604-5a552c223679', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('63beb180-1338-4fd2-b4f1-86fd5060a6e0', NULL, 'reset-password', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '066486dd-fef3-4290-a604-5a552c223679', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d85ce12d-613b-478b-b990-9bc6498d1f5d', NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', '066486dd-fef3-4290-a604-5a552c223679', 1, 40, true, '43ccd003-31b8-44da-93f8-6724bcb8b503', NULL);
INSERT INTO public.authentication_execution VALUES ('8b5d1087-b946-4c84-b1ca-b0cf1060f834', NULL, 'http-basic-authenticator', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'c25faa73-2fa4-4a7b-9c75-9d135ae5b858', 0, 10, false, NULL, NULL);


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.authentication_flow VALUES ('1831a8a7-b095-47cb-af32-34358c910c23', 'browser', 'browser based authentication', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('8854db31-b2bc-4e56-9711-e0c8d67d24da', 'forms', 'Username, password, otp and other auth forms.', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('bbf5022a-fc0d-4eb7-bef5-cb2ad59b0314', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('eb488667-0489-455d-a132-6495674e968d', 'direct grant', 'OpenID Connect Resource Owner Grant', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('32a73661-dc51-461b-88d0-302739cf7aa6', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('9c2febd6-149f-4fb8-8894-5c6c672bb61a', 'registration', 'registration flow', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('f4d19d2b-72b6-48d1-8fad-d866d3e10b31', 'registration form', 'registration form', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'form-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('d74d02e8-2af3-43b9-9f80-031307f593a8', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('5a411131-bdf5-482f-a77e-8eb82136f1e6', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('87347a35-0c82-4c71-933f-620d48e892cc', 'clients', 'Base authentication for clients', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'client-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('8adc6aa2-a108-49eb-ac19-f3fd8503329a', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('9c5e6fcf-7127-4f4e-9167-d756b9c0a511', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('5a83dac7-d0f3-4404-882d-0259e4f03689', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('d18a8e6c-c27b-4bb0-bae4-e49c67c50a93', 'Account verification options', 'Method with which to verity the existing account', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('88603a14-b067-4f20-8675-d56c30e21410', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('37abbb43-a790-42f3-ad41-23ca25248d16', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('c1a4df24-f7c9-49c3-9890-c732400c9eb2', 'saml ecp', 'SAML ECP Profile Authentication Flow', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('8e153df5-1eb8-4a51-964c-d232169522e8', 'docker auth', 'Used by Docker clients to authenticate against the IDP', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'basic-flow', true, true);
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

INSERT INTO public.authenticator_config VALUES ('5a8f8abf-fcde-4558-9aa3-557f9617bd53', 'review profile config', '546da6ad-8f65-4ce7-ba91-1346136c584b');
INSERT INTO public.authenticator_config VALUES ('3e692b0d-860d-4a4c-9ccb-e53256019298', 'create unique user config', '546da6ad-8f65-4ce7-ba91-1346136c584b');
INSERT INTO public.authenticator_config VALUES ('9295d203-65a1-4d61-ad4a-081a4dc16aee', 'create unique user config', '662f6baf-45d0-437d-b002-c3f9ccdcb69d');
INSERT INTO public.authenticator_config VALUES ('05f5f1a3-e153-4fc8-af4a-cb39f4a3ffa0', 'review profile config', '662f6baf-45d0-437d-b002-c3f9ccdcb69d');


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.authenticator_config_entry VALUES ('3e692b0d-860d-4a4c-9ccb-e53256019298', 'false', 'require.password.update.after.registration');
INSERT INTO public.authenticator_config_entry VALUES ('5a8f8abf-fcde-4558-9aa3-557f9617bd53', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('05f5f1a3-e153-4fc8-af4a-cb39f4a3ffa0', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('9295d203-65a1-4d61-ad4a-081a4dc16aee', 'false', 'require.password.update.after.registration');


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.client VALUES ('15d3b017-9733-4647-9d40-09228e5022ce', true, false, 'master-realm', 0, false, NULL, NULL, true, NULL, false, '546da6ad-8f65-4ce7-ba91-1346136c584b', NULL, 0, false, false, 'master Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('cb62ec47-aa85-4d1e-9187-3f8218923968', true, false, 'account', 0, true, NULL, '/realms/master/account/', false, NULL, false, '546da6ad-8f65-4ce7-ba91-1346136c584b', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('effe1a3e-a1ce-4c4f-80ce-cebeca28c9fe', true, false, 'account-console', 0, true, NULL, '/realms/master/account/', false, NULL, false, '546da6ad-8f65-4ce7-ba91-1346136c584b', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('a73d5d17-836e-426e-8c1e-cee828e18977', true, false, 'broker', 0, false, NULL, NULL, true, NULL, false, '546da6ad-8f65-4ce7-ba91-1346136c584b', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('5d42a7c4-7ab0-4d78-9aec-481ac699856e', true, false, 'security-admin-console', 0, true, NULL, '/admin/master/console/', false, NULL, false, '546da6ad-8f65-4ce7-ba91-1346136c584b', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('c2ee8c08-60c9-4aa0-bfad-70b01bda16e2', true, false, 'admin-cli', 0, true, NULL, NULL, false, NULL, false, '546da6ad-8f65-4ce7-ba91-1346136c584b', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client VALUES ('5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, false, 'book-store-realm', 0, false, NULL, NULL, true, NULL, false, '546da6ad-8f65-4ce7-ba91-1346136c584b', NULL, 0, false, false, 'book-store Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
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

INSERT INTO public.client_attributes VALUES ('cb62ec47-aa85-4d1e-9187-3f8218923968', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes VALUES ('effe1a3e-a1ce-4c4f-80ce-cebeca28c9fe', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes VALUES ('effe1a3e-a1ce-4c4f-80ce-cebeca28c9fe', 'pkce.code.challenge.method', 'S256');
INSERT INTO public.client_attributes VALUES ('5d42a7c4-7ab0-4d78-9aec-481ac699856e', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes VALUES ('5d42a7c4-7ab0-4d78-9aec-481ac699856e', 'pkce.code.challenge.method', 'S256');
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

INSERT INTO public.client_scope VALUES ('56c0fbee-c694-4365-b572-85ef06172931', 'offline_access', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope VALUES ('3fc1c611-b6f3-4b9b-ae80-473d70f0e704', 'role_list', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'SAML role list', 'saml');
INSERT INTO public.client_scope VALUES ('3f25582f-18eb-4043-85b6-e35d3dc3ebcb', 'profile', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope VALUES ('23f79b31-a24e-4376-b70a-b3f54004122a', 'email', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope VALUES ('a03445b7-d0d9-438f-ac78-aed73cc6720c', 'address', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope VALUES ('588e4ed0-ad19-45f7-89f6-74ace21372e8', 'phone', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope VALUES ('3794702d-a4a4-465c-a39f-d4d13e74f446', 'roles', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('28086f97-41df-44ab-aa26-f2f377823664', 'web-origins', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('3b6d04fe-1f5f-4414-b9df-76e6b032bb78', 'microprofile-jwt', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope VALUES ('24add800-76ab-4a04-9d30-bdc31fc532a0', 'acr', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'OpenID Connect scope for add acr (authentication context class reference) to the token', 'openid-connect');
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

INSERT INTO public.client_scope_attributes VALUES ('56c0fbee-c694-4365-b572-85ef06172931', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('56c0fbee-c694-4365-b572-85ef06172931', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('3fc1c611-b6f3-4b9b-ae80-473d70f0e704', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('3fc1c611-b6f3-4b9b-ae80-473d70f0e704', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('3f25582f-18eb-4043-85b6-e35d3dc3ebcb', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('3f25582f-18eb-4043-85b6-e35d3dc3ebcb', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('3f25582f-18eb-4043-85b6-e35d3dc3ebcb', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('23f79b31-a24e-4376-b70a-b3f54004122a', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('23f79b31-a24e-4376-b70a-b3f54004122a', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('23f79b31-a24e-4376-b70a-b3f54004122a', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('a03445b7-d0d9-438f-ac78-aed73cc6720c', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('a03445b7-d0d9-438f-ac78-aed73cc6720c', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('a03445b7-d0d9-438f-ac78-aed73cc6720c', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('588e4ed0-ad19-45f7-89f6-74ace21372e8', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('588e4ed0-ad19-45f7-89f6-74ace21372e8', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('588e4ed0-ad19-45f7-89f6-74ace21372e8', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('3794702d-a4a4-465c-a39f-d4d13e74f446', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('3794702d-a4a4-465c-a39f-d4d13e74f446', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('3794702d-a4a4-465c-a39f-d4d13e74f446', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('28086f97-41df-44ab-aa26-f2f377823664', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('28086f97-41df-44ab-aa26-f2f377823664', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('28086f97-41df-44ab-aa26-f2f377823664', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('3b6d04fe-1f5f-4414-b9df-76e6b032bb78', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('3b6d04fe-1f5f-4414-b9df-76e6b032bb78', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('24add800-76ab-4a04-9d30-bdc31fc532a0', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('24add800-76ab-4a04-9d30-bdc31fc532a0', 'false', 'include.in.token.scope');
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

INSERT INTO public.client_scope_client VALUES ('cb62ec47-aa85-4d1e-9187-3f8218923968', '3f25582f-18eb-4043-85b6-e35d3dc3ebcb', true);
INSERT INTO public.client_scope_client VALUES ('cb62ec47-aa85-4d1e-9187-3f8218923968', '3794702d-a4a4-465c-a39f-d4d13e74f446', true);
INSERT INTO public.client_scope_client VALUES ('cb62ec47-aa85-4d1e-9187-3f8218923968', '24add800-76ab-4a04-9d30-bdc31fc532a0', true);
INSERT INTO public.client_scope_client VALUES ('cb62ec47-aa85-4d1e-9187-3f8218923968', '28086f97-41df-44ab-aa26-f2f377823664', true);
INSERT INTO public.client_scope_client VALUES ('cb62ec47-aa85-4d1e-9187-3f8218923968', '23f79b31-a24e-4376-b70a-b3f54004122a', true);
INSERT INTO public.client_scope_client VALUES ('cb62ec47-aa85-4d1e-9187-3f8218923968', 'a03445b7-d0d9-438f-ac78-aed73cc6720c', false);
INSERT INTO public.client_scope_client VALUES ('cb62ec47-aa85-4d1e-9187-3f8218923968', '56c0fbee-c694-4365-b572-85ef06172931', false);
INSERT INTO public.client_scope_client VALUES ('cb62ec47-aa85-4d1e-9187-3f8218923968', '588e4ed0-ad19-45f7-89f6-74ace21372e8', false);
INSERT INTO public.client_scope_client VALUES ('cb62ec47-aa85-4d1e-9187-3f8218923968', '3b6d04fe-1f5f-4414-b9df-76e6b032bb78', false);
INSERT INTO public.client_scope_client VALUES ('effe1a3e-a1ce-4c4f-80ce-cebeca28c9fe', '3f25582f-18eb-4043-85b6-e35d3dc3ebcb', true);
INSERT INTO public.client_scope_client VALUES ('effe1a3e-a1ce-4c4f-80ce-cebeca28c9fe', '3794702d-a4a4-465c-a39f-d4d13e74f446', true);
INSERT INTO public.client_scope_client VALUES ('effe1a3e-a1ce-4c4f-80ce-cebeca28c9fe', '24add800-76ab-4a04-9d30-bdc31fc532a0', true);
INSERT INTO public.client_scope_client VALUES ('effe1a3e-a1ce-4c4f-80ce-cebeca28c9fe', '28086f97-41df-44ab-aa26-f2f377823664', true);
INSERT INTO public.client_scope_client VALUES ('effe1a3e-a1ce-4c4f-80ce-cebeca28c9fe', '23f79b31-a24e-4376-b70a-b3f54004122a', true);
INSERT INTO public.client_scope_client VALUES ('effe1a3e-a1ce-4c4f-80ce-cebeca28c9fe', 'a03445b7-d0d9-438f-ac78-aed73cc6720c', false);
INSERT INTO public.client_scope_client VALUES ('effe1a3e-a1ce-4c4f-80ce-cebeca28c9fe', '56c0fbee-c694-4365-b572-85ef06172931', false);
INSERT INTO public.client_scope_client VALUES ('effe1a3e-a1ce-4c4f-80ce-cebeca28c9fe', '588e4ed0-ad19-45f7-89f6-74ace21372e8', false);
INSERT INTO public.client_scope_client VALUES ('effe1a3e-a1ce-4c4f-80ce-cebeca28c9fe', '3b6d04fe-1f5f-4414-b9df-76e6b032bb78', false);
INSERT INTO public.client_scope_client VALUES ('c2ee8c08-60c9-4aa0-bfad-70b01bda16e2', '3f25582f-18eb-4043-85b6-e35d3dc3ebcb', true);
INSERT INTO public.client_scope_client VALUES ('c2ee8c08-60c9-4aa0-bfad-70b01bda16e2', '3794702d-a4a4-465c-a39f-d4d13e74f446', true);
INSERT INTO public.client_scope_client VALUES ('c2ee8c08-60c9-4aa0-bfad-70b01bda16e2', '24add800-76ab-4a04-9d30-bdc31fc532a0', true);
INSERT INTO public.client_scope_client VALUES ('c2ee8c08-60c9-4aa0-bfad-70b01bda16e2', '28086f97-41df-44ab-aa26-f2f377823664', true);
INSERT INTO public.client_scope_client VALUES ('c2ee8c08-60c9-4aa0-bfad-70b01bda16e2', '23f79b31-a24e-4376-b70a-b3f54004122a', true);
INSERT INTO public.client_scope_client VALUES ('c2ee8c08-60c9-4aa0-bfad-70b01bda16e2', 'a03445b7-d0d9-438f-ac78-aed73cc6720c', false);
INSERT INTO public.client_scope_client VALUES ('c2ee8c08-60c9-4aa0-bfad-70b01bda16e2', '56c0fbee-c694-4365-b572-85ef06172931', false);
INSERT INTO public.client_scope_client VALUES ('c2ee8c08-60c9-4aa0-bfad-70b01bda16e2', '588e4ed0-ad19-45f7-89f6-74ace21372e8', false);
INSERT INTO public.client_scope_client VALUES ('c2ee8c08-60c9-4aa0-bfad-70b01bda16e2', '3b6d04fe-1f5f-4414-b9df-76e6b032bb78', false);
INSERT INTO public.client_scope_client VALUES ('a73d5d17-836e-426e-8c1e-cee828e18977', '3f25582f-18eb-4043-85b6-e35d3dc3ebcb', true);
INSERT INTO public.client_scope_client VALUES ('a73d5d17-836e-426e-8c1e-cee828e18977', '3794702d-a4a4-465c-a39f-d4d13e74f446', true);
INSERT INTO public.client_scope_client VALUES ('a73d5d17-836e-426e-8c1e-cee828e18977', '24add800-76ab-4a04-9d30-bdc31fc532a0', true);
INSERT INTO public.client_scope_client VALUES ('a73d5d17-836e-426e-8c1e-cee828e18977', '28086f97-41df-44ab-aa26-f2f377823664', true);
INSERT INTO public.client_scope_client VALUES ('a73d5d17-836e-426e-8c1e-cee828e18977', '23f79b31-a24e-4376-b70a-b3f54004122a', true);
INSERT INTO public.client_scope_client VALUES ('a73d5d17-836e-426e-8c1e-cee828e18977', 'a03445b7-d0d9-438f-ac78-aed73cc6720c', false);
INSERT INTO public.client_scope_client VALUES ('a73d5d17-836e-426e-8c1e-cee828e18977', '56c0fbee-c694-4365-b572-85ef06172931', false);
INSERT INTO public.client_scope_client VALUES ('a73d5d17-836e-426e-8c1e-cee828e18977', '588e4ed0-ad19-45f7-89f6-74ace21372e8', false);
INSERT INTO public.client_scope_client VALUES ('a73d5d17-836e-426e-8c1e-cee828e18977', '3b6d04fe-1f5f-4414-b9df-76e6b032bb78', false);
INSERT INTO public.client_scope_client VALUES ('15d3b017-9733-4647-9d40-09228e5022ce', '3f25582f-18eb-4043-85b6-e35d3dc3ebcb', true);
INSERT INTO public.client_scope_client VALUES ('15d3b017-9733-4647-9d40-09228e5022ce', '3794702d-a4a4-465c-a39f-d4d13e74f446', true);
INSERT INTO public.client_scope_client VALUES ('15d3b017-9733-4647-9d40-09228e5022ce', '24add800-76ab-4a04-9d30-bdc31fc532a0', true);
INSERT INTO public.client_scope_client VALUES ('15d3b017-9733-4647-9d40-09228e5022ce', '28086f97-41df-44ab-aa26-f2f377823664', true);
INSERT INTO public.client_scope_client VALUES ('15d3b017-9733-4647-9d40-09228e5022ce', '23f79b31-a24e-4376-b70a-b3f54004122a', true);
INSERT INTO public.client_scope_client VALUES ('15d3b017-9733-4647-9d40-09228e5022ce', 'a03445b7-d0d9-438f-ac78-aed73cc6720c', false);
INSERT INTO public.client_scope_client VALUES ('15d3b017-9733-4647-9d40-09228e5022ce', '56c0fbee-c694-4365-b572-85ef06172931', false);
INSERT INTO public.client_scope_client VALUES ('15d3b017-9733-4647-9d40-09228e5022ce', '588e4ed0-ad19-45f7-89f6-74ace21372e8', false);
INSERT INTO public.client_scope_client VALUES ('15d3b017-9733-4647-9d40-09228e5022ce', '3b6d04fe-1f5f-4414-b9df-76e6b032bb78', false);
INSERT INTO public.client_scope_client VALUES ('5d42a7c4-7ab0-4d78-9aec-481ac699856e', '3f25582f-18eb-4043-85b6-e35d3dc3ebcb', true);
INSERT INTO public.client_scope_client VALUES ('5d42a7c4-7ab0-4d78-9aec-481ac699856e', '3794702d-a4a4-465c-a39f-d4d13e74f446', true);
INSERT INTO public.client_scope_client VALUES ('5d42a7c4-7ab0-4d78-9aec-481ac699856e', '24add800-76ab-4a04-9d30-bdc31fc532a0', true);
INSERT INTO public.client_scope_client VALUES ('5d42a7c4-7ab0-4d78-9aec-481ac699856e', '28086f97-41df-44ab-aa26-f2f377823664', true);
INSERT INTO public.client_scope_client VALUES ('5d42a7c4-7ab0-4d78-9aec-481ac699856e', '23f79b31-a24e-4376-b70a-b3f54004122a', true);
INSERT INTO public.client_scope_client VALUES ('5d42a7c4-7ab0-4d78-9aec-481ac699856e', 'a03445b7-d0d9-438f-ac78-aed73cc6720c', false);
INSERT INTO public.client_scope_client VALUES ('5d42a7c4-7ab0-4d78-9aec-481ac699856e', '56c0fbee-c694-4365-b572-85ef06172931', false);
INSERT INTO public.client_scope_client VALUES ('5d42a7c4-7ab0-4d78-9aec-481ac699856e', '588e4ed0-ad19-45f7-89f6-74ace21372e8', false);
INSERT INTO public.client_scope_client VALUES ('5d42a7c4-7ab0-4d78-9aec-481ac699856e', '3b6d04fe-1f5f-4414-b9df-76e6b032bb78', false);
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

INSERT INTO public.client_scope_role_mapping VALUES ('56c0fbee-c694-4365-b572-85ef06172931', 'b4f9d5f9-b59b-4453-b09d-7f26b8003a53');
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

INSERT INTO public.component VALUES ('d82a9fa7-50b4-4120-a599-fbdfaf7cc1b9', 'Trusted Hosts', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'anonymous');
INSERT INTO public.component VALUES ('0c9574c4-a09b-402a-96ce-8aa9d5bba743', 'Consent Required', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'anonymous');
INSERT INTO public.component VALUES ('26d1fc72-3b7e-44ff-9e6d-e97c369df15a', 'Full Scope Disabled', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'anonymous');
INSERT INTO public.component VALUES ('2e9405ad-7590-49bd-af7e-b4200d698337', 'Max Clients Limit', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'anonymous');
INSERT INTO public.component VALUES ('06fa2ebd-e1c0-4c1a-a1d5-0c57c8aec034', 'Allowed Protocol Mapper Types', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'anonymous');
INSERT INTO public.component VALUES ('ae05b2bb-25f9-42a2-b004-be17fbf98246', 'Allowed Client Scopes', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'anonymous');
INSERT INTO public.component VALUES ('7dca7697-7792-4828-8c0f-c7fffdc02892', 'Allowed Protocol Mapper Types', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'authenticated');
INSERT INTO public.component VALUES ('7ce6a42c-4754-4777-8757-efe01caba328', 'Allowed Client Scopes', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'authenticated');
INSERT INTO public.component VALUES ('afc9e206-9253-4e58-bf87-7a3f352a8de7', 'rsa-generated', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'rsa-generated', 'org.keycloak.keys.KeyProvider', '546da6ad-8f65-4ce7-ba91-1346136c584b', NULL);
INSERT INTO public.component VALUES ('fda9c1ea-c3e6-4534-bf88-bf9c8990b62b', 'rsa-enc-generated', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'rsa-enc-generated', 'org.keycloak.keys.KeyProvider', '546da6ad-8f65-4ce7-ba91-1346136c584b', NULL);
INSERT INTO public.component VALUES ('c255f096-9069-4fb7-8577-780adec7781a', 'hmac-generated', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'hmac-generated', 'org.keycloak.keys.KeyProvider', '546da6ad-8f65-4ce7-ba91-1346136c584b', NULL);
INSERT INTO public.component VALUES ('ac6399ee-17df-4eae-b500-fdfd673df4ac', 'aes-generated', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'aes-generated', 'org.keycloak.keys.KeyProvider', '546da6ad-8f65-4ce7-ba91-1346136c584b', NULL);
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

INSERT INTO public.component_config VALUES ('f4a09700-7573-47c9-ade7-f99cfc87ec71', 'ae05b2bb-25f9-42a2-b004-be17fbf98246', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('5e19939d-3bc0-473e-81ad-1fdcdf93640d', '2e9405ad-7590-49bd-af7e-b4200d698337', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('a594e01f-e15e-4e94-8945-ccd2ec381a30', '7dca7697-7792-4828-8c0f-c7fffdc02892', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('e365a84b-3199-4791-8867-ff79ef412896', '7dca7697-7792-4828-8c0f-c7fffdc02892', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('0e1ef949-e8f9-41f0-9469-c5dcd2627659', '7dca7697-7792-4828-8c0f-c7fffdc02892', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('c73e0ce1-9aa2-4303-a861-88a5fa9d449f', '7dca7697-7792-4828-8c0f-c7fffdc02892', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('8f4a5126-fa11-4bef-a625-65afd1474e40', '7dca7697-7792-4828-8c0f-c7fffdc02892', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('a2c61485-96a3-48bd-86f2-9a991923dd25', '7dca7697-7792-4828-8c0f-c7fffdc02892', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('d201fca0-2a28-48e5-9160-d9443551efc3', '7dca7697-7792-4828-8c0f-c7fffdc02892', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('af30a007-ee97-4fff-bad2-1f158800f868', '7dca7697-7792-4828-8c0f-c7fffdc02892', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('c1e5c241-f0bd-4fd7-8b44-faea29141a98', '06fa2ebd-e1c0-4c1a-a1d5-0c57c8aec034', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('7e256959-8abf-47a9-8d65-3f97cca6645e', '06fa2ebd-e1c0-4c1a-a1d5-0c57c8aec034', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('9063a687-6c56-43c6-9bc6-3c69860b9ad9', '06fa2ebd-e1c0-4c1a-a1d5-0c57c8aec034', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('4f2100fd-80b7-4e70-a137-5f0e8825e903', '06fa2ebd-e1c0-4c1a-a1d5-0c57c8aec034', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('cf7bb2a8-54a2-41da-8f7d-8c0173c72175', '06fa2ebd-e1c0-4c1a-a1d5-0c57c8aec034', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('a723127e-981e-4d5c-b09c-c42d64b8ce81', '06fa2ebd-e1c0-4c1a-a1d5-0c57c8aec034', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('6392c41f-6222-4934-b5e3-0c8103a53050', '06fa2ebd-e1c0-4c1a-a1d5-0c57c8aec034', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('b61f57f4-150f-47db-8265-ee3bd83cdec7', '06fa2ebd-e1c0-4c1a-a1d5-0c57c8aec034', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('bc902934-dfa1-4fd2-b3cc-1a1e593a441f', '7ce6a42c-4754-4777-8757-efe01caba328', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('0605b9c3-4ae2-49f7-bd72-a0e1d97b0f52', 'd82a9fa7-50b4-4120-a599-fbdfaf7cc1b9', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('50ab50ba-688b-4c69-bcff-1b77edeef6fd', 'd82a9fa7-50b4-4120-a599-fbdfaf7cc1b9', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('dc700eed-e287-4825-9947-47bb088b0d73', 'afc9e206-9253-4e58-bf87-7a3f352a8de7', 'certificate', 'MIICmzCCAYMCBgGLnDBcfjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMTA0MjExMzE3WhcNMzMxMTA0MjExNDU3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDB+g5wiH7lRyUCtrOdtRkoQ8GDcSZoHKY3MjyRs7LTVohBsrQF1110xraqc8l/L2uH326ANUF+4dug+VBFK4Dq7WeCpoXH+PH9Qn1lsv0808qT3BVRF93jBGtnR7tff3Ebyr54CKWh2iC4UABune94/4PtzTD3dlPiPo6rqQrq9JlFshTV7FeF+94rXHaa1yXGYgzWke6oG6l1mq8jfqHisJL3BVJ0i7gvGGduiBmYfHrDk1D3H8YzwDoVT/mgf56a4ZhrW4MtT4+ScmgT231xSKcw36hgJ4JAsnge5Gjb/lbBJWthNzxWUJXtIdonjIC2m9JJvJ+T4L6ItG4p8empAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFHA3Pw7Sb2fvY7LndJiJ9dmrVst2e5V3R48NA+nvnKsiKzz5xa/Ac3zF03qCNAEDhEZS8Xpw4zweOpAW+0+oeRVdBp8EvcqqNCeU7HxmVd9VslqXGIYW4Jghza0+jHoKSLxdxZQ+4gedIqI/2/t5i3MXZ2SVvUHy+hPrd0W54e68Ro8VCnySKMcF71Rxj5GFxAzgzAdgarZPnrWeaTs4XZKh2D2IIF88KLBu2uIP7YP4kptw/WmnrUsgrE1SgipX98OgKl4EmpSBqPl2vFYmPp/tD7sbGqDqCyqXMCiFAEAI6/LCPftcAP8csxxqGZlkRoF4A5H0zVL0f9fYceIT68=');
INSERT INTO public.component_config VALUES ('fac97060-ad9a-4be2-bee2-e102ee7f5ec0', 'afc9e206-9253-4e58-bf87-7a3f352a8de7', 'privateKey', 'MIIEpAIBAAKCAQEAwfoOcIh+5UclAraznbUZKEPBg3EmaBymNzI8kbOy01aIQbK0BddddMa2qnPJfy9rh99ugDVBfuHboPlQRSuA6u1ngqaFx/jx/UJ9ZbL9PNPKk9wVURfd4wRrZ0e7X39xG8q+eAilodoguFAAbp3veP+D7c0w93ZT4j6Oq6kK6vSZRbIU1exXhfveK1x2mtclxmIM1pHuqBupdZqvI36h4rCS9wVSdIu4LxhnbogZmHx6w5NQ9x/GM8A6FU/5oH+emuGYa1uDLU+PknJoE9t9cUinMN+oYCeCQLJ4HuRo2/5WwSVrYTc8VlCV7SHaJ4yAtpvSSbyfk+C+iLRuKfHpqQIDAQABAoIBAEVEUGSx8TJZeediq3gdA6tDqrYPsSnLVTVvnH5g/3IFO+nN8QgG9EnvbaonZ6QhoFHoINLqcYVoDKAKdzYEB2ictvJKGYqjpHIODK5EwLY4YOX02K3ZCnR3Dw1V6Zx76z2D5AkD+XV26Wk3tDfL8QgxogBIXfx4BhNLyHGXDx1/9G7sOSoFD7AD9nIle68iQceQIIdIZFj/AGPDqIK2cM7tgeft9NXUL3M8AtncyaO8ge9J1aIkK7Cm9RHwp0gqbN2GtzkR/EUUVvmeIsBP793eZUt4I6RmxNfVnLkfS2Uqt4iWnZsUnoxVKgTgNckw4pzta4GvwLhl9lPDYRLItHMCgYEA6Pa3DjYaxecev6UI7g915yEeFon4XDR2rK4YaJl2a9DyFQD16VkAyKxjsTJNLPc8RMEIp+f5LJAaKl02LyFMSvnE5Q6zMhStrq5S0z/JyDdf5TzWIeTzQAmwPMs8v5MN5GhdxGiaN8Cr7eK+qH3e34gF2sptEX82e089b3LJ/38CgYEA1ShrO1NkDP1i0lVXnCmKxSXl8iNOV9d/UfmPTQcFird9COzsEx+4n++Icj1kxuVByi+45RqHjIUVX89nYmc/TfamFLGtuO8Z6Vu9efJFCu4Q9OibTuTvn+rQRzWdwXzl9Z3wqngv32MR4ku5P9XagOiTacrUrwWZnzVEeDJeqtcCgYEA4nSA+SWK3PmPoEdy6MbKm4RL1SkE7cxp1+3b+EHFJYUU7WnjoZNM+cTpm6QD9UPXqBXkriMGylTBupClTScXHIKy7N5fPr1vH7CA/qyxHxkE9Lcwh/4gnw1L7ay6PpdaF7+D9pqf3rZB6ppRL0Q71BpLZqUDZNC+Sxt54s44oU0CgYAcCiYY9r5JiydtvbY5n6lWh8a41HYgzgM8mFSGcG8FMV/sRaZEWb7ioxLS3Eqec1f1LdPnp1a/YF5QbSsPYb+NFO4B+OF+W02QSfYhzYHRj0GBxftwJGN1KOFfDKmE41Youi8Hban2e8TFfOqQgCQvIukJWJojr9vmeo5YNWAInwKBgQCWLgEKPBk92p57+mG6Y2m8DecTeTnOXq6rCAl/V3lVCKxzifd3LR7yd8KjRQaq9PfzXzd8uVq59HSa0DXg/ktrs477rZ0cRGYVMYP9MXq8uvo92hLGtH/+6r8qQL8/0Ij+pJlsVOf6Usm7y80gT5b6KDEkOZ5jrzcFbZQuk/naQA==');
INSERT INTO public.component_config VALUES ('81e68a58-1d81-4182-bb0d-0007e2f733f6', 'afc9e206-9253-4e58-bf87-7a3f352a8de7', 'priority', '100');
INSERT INTO public.component_config VALUES ('eba5c949-ef63-4c32-aa45-dd4dded74345', 'afc9e206-9253-4e58-bf87-7a3f352a8de7', 'keyUse', 'SIG');
INSERT INTO public.component_config VALUES ('e5ce6e8f-364d-4e73-a6ad-4d066bc50166', 'c255f096-9069-4fb7-8577-780adec7781a', 'priority', '100');
INSERT INTO public.component_config VALUES ('c513e95c-6b6a-4756-8600-0b0b91150580', 'c255f096-9069-4fb7-8577-780adec7781a', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('269b8d59-370c-4bb8-af87-7f3819558b72', 'c255f096-9069-4fb7-8577-780adec7781a', 'kid', '6ae9dd6d-8b3b-49f9-ad55-d5626558ae19');
INSERT INTO public.component_config VALUES ('1a17315f-63f7-41f6-a868-fe5105a9f5c1', 'c255f096-9069-4fb7-8577-780adec7781a', 'secret', 's7IXgyMVQiVqN3JRQ-WL_PBYONzwtU4MiKMYc2FpCXu2PM0HuHSWK8MQsH7PdrMqRgIsAb5phwc0HgPNaK7rPw');
INSERT INTO public.component_config VALUES ('af275135-f05f-42d9-9cc3-8c6bca06152d', 'ac6399ee-17df-4eae-b500-fdfd673df4ac', 'secret', 'cMKy9FVQSlOikpD-L0f5Sg');
INSERT INTO public.component_config VALUES ('d18543e3-1137-4178-937d-a4babedaf0bc', 'ac6399ee-17df-4eae-b500-fdfd673df4ac', 'kid', 'ccefa1a1-53d4-4408-9eb3-67150c388562');
INSERT INTO public.component_config VALUES ('9681d82e-5b09-4ba1-a473-53ac4fd65de1', 'ac6399ee-17df-4eae-b500-fdfd673df4ac', 'priority', '100');
INSERT INTO public.component_config VALUES ('3bcef24b-eeaa-49b9-9afd-9cdc37aef876', 'fda9c1ea-c3e6-4534-bf88-bf9c8990b62b', 'algorithm', 'RSA-OAEP');
INSERT INTO public.component_config VALUES ('334e124a-9b66-4548-bb78-603213f4b82b', 'fda9c1ea-c3e6-4534-bf88-bf9c8990b62b', 'priority', '100');
INSERT INTO public.component_config VALUES ('703999f8-a307-46f6-9407-693ca967d3b1', 'fda9c1ea-c3e6-4534-bf88-bf9c8990b62b', 'keyUse', 'ENC');
INSERT INTO public.component_config VALUES ('899cc192-3d5d-44e6-bd49-0d394126d2fa', 'ed029d0b-6d80-4bdd-a21a-7c909d87d494', 'priority', '100');
INSERT INTO public.component_config VALUES ('b74becc2-acca-4233-9cea-ba674aa8762f', 'ed029d0b-6d80-4bdd-a21a-7c909d87d494', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('db652d98-3f60-4597-a12f-1c2e0f8eca5e', 'f0f2a0a4-b58a-43ed-8035-158c5120b350', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('1a607c80-8851-4c97-ab33-3332afcdbf3e', 'fda9c1ea-c3e6-4534-bf88-bf9c8990b62b', 'certificate', 'MIICmzCCAYMCBgGLnDBeYDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMTA0MjExMzE3WhcNMzMxMTA0MjExNDU3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCKomm8gH+bUDtQDxct4H1OuwNBlY/TFMiFWAqFnOL0v3T6TvX124AxDch/hwSXTKIWMTVXSg2USLVNm3wgzvUMab1MdFVOgSqQrXLFm1wC4Up+71DWsC1mSfeG2Es40yLTvAG4ldSf+fuNQEG/wuLZcHfdOxoVyaD2C8+8Tg8q4oyo+I1VkUgD35UPSSLq4ltoaa+B2y3d0/jDaawXNis327/2Bc/qPdP1cZKCOzhbRxp6RwvOudQMqedzhu7jm22gg+unTbT1Hu32xA4wafoIa8NtH/w6ifw1JE9IPAj3nNd3qlWjEmMTess5NiCswgUIOiJj/e+iQtBa3qcZY3tlAgMBAAEwDQYJKoZIhvcNAQELBQADggEBABK2TaDjZVGvZ+hvybvwy5hwBb1hgAY9V2sieCLtRuDi0UuEmVybVucvpQY7QafD5Zqy/+AelgjlOqYTOqiJeZmI/6cZuzIeDuqLpPfxl7y6140IIDnaAJ7ztFqULANC/hOdFs2lu+XjKdxPqmqdtgnAEMw988C14t3pDrgKM4ry17DJ7LJW6dx79dYnObTPQN6Xs6ocFHA9pjQqAguIHL7ePTlNytiyDWZgQj1RIVbHtwqxuZtzXISivd3LDUpSFromwY02CyMHv5hJFUe+wNUGLWK4Z9qrhnHU2io4HUsglM0dJYBc0WT4HSiRk4SVdi61zYt+4zgE22jwnrq9Xxg=');
INSERT INTO public.component_config VALUES ('e45c2330-8c15-4bd7-9541-db78d5ae7e02', 'fda9c1ea-c3e6-4534-bf88-bf9c8990b62b', 'privateKey', 'MIIEpAIBAAKCAQEAiqJpvIB/m1A7UA8XLeB9TrsDQZWP0xTIhVgKhZzi9L90+k719duAMQ3If4cEl0yiFjE1V0oNlEi1TZt8IM71DGm9THRVToEqkK1yxZtcAuFKfu9Q1rAtZkn3hthLONMi07wBuJXUn/n7jUBBv8Li2XB33TsaFcmg9gvPvE4PKuKMqPiNVZFIA9+VD0ki6uJbaGmvgdst3dP4w2msFzYrN9u/9gXP6j3T9XGSgjs4W0caekcLzrnUDKnnc4bu45ttoIPrp0209R7t9sQOMGn6CGvDbR/8Oon8NSRPSDwI95zXd6pVoxJjE3rLOTYgrMIFCDoiY/3vokLQWt6nGWN7ZQIDAQABAoIBAAPu+sgN71D1VFF/tB0pnvSSatO8DiIjl1LtPhMvceMW4ZdOkT0CFt+NcBBqQM+YLYsqp0RMRhlcfMRwcnOt25cYEvZt4JPDJ3WGbli8AT7VrJrwaF9HDWq3E45gabX5i6XtUjEuEyPc4G3QEm2B9pTL06LTz/gpSedhS2og3t5NF5aRY1ex+c3HqnjggcXQiipDLIsPi+U9YDsfYBIjm3dHCsY73L4N+OqMgU9r2UKP/zZrKqEflB7+A2/lrdELeDVEKHqgZ+BQ2TtT4ba4UcMDlE65Px82iehoo2ctR0hmgE5OWS9rSXvull5XsBsejrXs4XdRg+w6GopehrmNqLsCgYEAvvyc2M1coFTTT9NnWVgZ/F020z0d1fVGXZAR726fbzkyMRz9LrIA0Hop176KaDIpTZy1EanUN+hfAzj9aWsDthitkrliMNRo3wyKRT8N4XsDeDLWdYmVacgxzwAoOABLt+XYWdjWVQMnf4u7xxASMKhy8Jb0vMFDG1uIbUCbDzcCgYEAudOZDNY4t2l1jesj/JruXxIsWQkL9bWTzjVBaFU0SOrWKAnAJicjNEh9gneJWGYRyPQYnPgxo8XU2Rbu4w6L16T5JPzxKQcSxf5hA/1mxJiDBtUFvoXF9BxVlOONYrxJHCeEROzufYwmphGOqeapqGP26aI5AaDFgQe5v9vlgEMCgYEArMLv0sH5vuLcf4IZI92pK/raBD1txsRnkW0ofDDSMhdICttRPzMvv2YygYFPzC9L43QU6tR4LtaZU93yhbCTG9647FebtdX+w32hekAuez/+hHVgP9Rj/ttkCv72YqoJ1GEq0yNtxlrjGOI6yzgDbFaEGpRC8JfV72JeR43AdgMCgYEAok8zIKZAddt0ZVhcX3iH+pxqBf7D5oMKLhQQJGw/te0Az4nsvqZytmkWz41Pdtn4cNjcYsbavNzAVDoWwFZlSR78yxTwI9Dc0fmljZGZYOCBmccZNFeuFtFk4x560SH6jc/qVTXJ/fkbjPRK8xXZXI6sDVe3iTd/K3uu/+i3JfcCgYAD/I1zj6PL4wAla5e3dOJR2Yrlmra/gCfklOPiKMEiMmAR3h+P+I3OQJ1aw+OgNAe8HwwrCMzbBjka9Luam1EcQewExRN0OGO+euswd1WZc2jlVd8p8Iu2oGXR8yGPzIzuj5uzxtNZCgIYeuBe/HD9TGbb/lqjlJ7lUD9MC/n3Uw==');
INSERT INTO public.component_config VALUES ('745a9e65-e3a6-484d-adf4-f48c42838a2c', '11c9bee2-bf75-471c-8de8-286980530d10', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('be5434e2-2123-4ac1-9f31-62e09765b30f', '11c9bee2-bf75-471c-8de8-286980530d10', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('8e2b103f-7ae5-405c-8aa6-e90d87130568', '543ef0e8-1b64-436a-829f-f8d57819eb45', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('4b17ad6c-9d2a-4331-abe1-df5f978e1092', '28c2acd4-f5c7-4e0a-80b8-eac67ea5991c', 'priority', '100');
INSERT INTO public.component_config VALUES ('09ee6f0e-17a9-4a99-acf3-bcfb0bcb8e4c', '28c2acd4-f5c7-4e0a-80b8-eac67ea5991c', 'kid', '27939b55-bf2f-423a-84e0-6d5dcee3e844');
INSERT INTO public.component_config VALUES ('88940582-8afc-4ff2-9fb8-c12cd8a3a1a5', '28c2acd4-f5c7-4e0a-80b8-eac67ea5991c', 'secret', 'bmskxKbjyZ202xmgiRy9mw');
INSERT INTO public.component_config VALUES ('97708705-4fa2-4736-9018-8c79951677e5', '7b62deb1-030d-4800-b41c-bd5398080ed2', 'privateKey', 'MIIEpAIBAAKCAQEAtQzoqUraZB+6FaYncaTSCZq5GCVBldoedwfGTgJVpiRSHCMz6mZiNg8xiPk4P9c46OYxTfde02BTBShLNnuu2+Cnfg5XSmhbUPzPoPRCxoCPP0ZRJOfascDmlyO4rRlL4d3HjlVmnKDp+79f3dfe3Op/wTvPeojph20BMfftGA0zpI16/dZCvF8P9xOdFK+66W1GG3A37UFPWNfZYG9XS2sI69h9pASFczHbjSZegKJCe7zx/CanJNOXb736K2q8Y17yETnos6d9jbQ7xges++rvFlk45zHIdcnXjna2OJ/7RBSbPYimgWQelbuORfcdFjUDi+gpOImaewAXKAe/QQIDAQABAoIBAAXoeQ6uNkR6axGCCas6Fk8RLR1aOOLNmn0mpCxfQ+F/Ma1AolTxuJ58PjDytgjSSoWCHoWFbyMdc3QZgaPSYy1CbmDNEcDoOSOiTlm5otS0tQf68NKwHLk8euHffOssJkdle/m7dHTjxOLt1rBn9xo1LkxVWfLNFTbRwi5Z4XMti9kbwhV6r0XYXlv6oViZAvh9mKGCME9cfw+ZbV7JkQGglxlm4AVzz6qtV33lHEI0d9LgoQurSQDH7DMnZoA8/hdOCf/NohKEMB0NUE6wYU63em1oAXm4BoDQkqMjSpVuoZCRjIwDyanx4HtwdhtrLRcliOoBSrB+38pQArhdD+ECgYEA/+hBfAjAmp9NQp4ezohPYqgNA+x4JwVCaDTzFEhshtiiu93YeP7GDpI84KBSNiGeO56O425sIbTRayJ9YbWvFzkWVJqUHYH1xUA9Y1xwBAC2pPVXC0or5GMKe1+Xdqaeya7UHC0ekYei4HxMFoYip+PA5FuUDVjpfOM3gYZ4whECgYEAtR21HfoYTgxiSv597sQde34h3RySQBfa8QEXZJo17Bdv+lc/GI1DekbWldZjHBQslndgyk1ZPewHnzFN+9d8fggT8HOYJcLz4p5sEu6XDAn35abrW+WIddxc//TibIHN12hhLSoj8cj0vRTZPB8jtxHox7nXvniCM1ObReEG+jECgYAtmJdaX0DaC/o7HWtFx1nFrUWsZky+Pxym7pBFE+ZqXF0adhuk61gkrn+0Ujxzsqe73bN96GXR16LcoOeQKkwJKj3FU0mCvG4q+Bg4BPdcbzgbyi75Lv0FE3SBqPWWyXdPXhwi7RMeQPmPX/Y6qSmxmk37IioN+sKXYvC33lrT0QKBgQCmzx2o5lbMS4ucFphV+DpPKvR1eYMZlN8JaT/qYD2ZnFx97S0np7OmQugQSMwvaEVIr9pteJ/g8Cp07Cwu72Cxky8KHuzampuU9OQE68oiRGwVD49lrBnqs3LUKu7/kO3Mn04hEtbYMYV3QGRzgxqZ2dzTVs7llogUTcSMr5yFgQKBgQDzd2vQeHoRyM24VdnRbanPD457pChBrkGvOe/CabMnae7C7wiD1CVyB+OwVLCjb03uSNFZQJmcgaOWQYkf+49QvcpaxXI0X7PninA37Q87NsBUoEIormyUyr/eS1+kKh+yhTQfz+F2QIpKlYgAB3xPfMH2MNbdGdD8g6k+nxEr4A==');
INSERT INTO public.component_config VALUES ('3f9a2389-82d4-4a36-a1f6-0fc24b4ceb0d', '7b62deb1-030d-4800-b41c-bd5398080ed2', 'priority', '100');
INSERT INTO public.component_config VALUES ('169da592-c220-4d37-a678-4e55c7808e72', '7b62deb1-030d-4800-b41c-bd5398080ed2', 'certificate', 'MIICozCCAYsCBgGLnDi6rzANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApib29rLXN0b3JlMB4XDTIzMTEwNDIxMjIyNVoXDTMzMTEwNDIxMjQwNVowFTETMBEGA1UEAwwKYm9vay1zdG9yZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALUM6KlK2mQfuhWmJ3Gk0gmauRglQZXaHncHxk4CVaYkUhwjM+pmYjYPMYj5OD/XOOjmMU33XtNgUwUoSzZ7rtvgp34OV0poW1D8z6D0QsaAjz9GUSTn2rHA5pcjuK0ZS+Hdx45VZpyg6fu/X93X3tzqf8E7z3qI6YdtATH37RgNM6SNev3WQrxfD/cTnRSvuultRhtwN+1BT1jX2WBvV0trCOvYfaQEhXMx240mXoCiQnu88fwmpyTTl2+9+itqvGNe8hE56LOnfY20O8YHrPvq7xZZOOcxyHXJ1452tjif+0QUmz2IpoFkHpW7jkX3HRY1A4voKTiJmnsAFygHv0ECAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAVByiv1H6E6Dxq3DyJLzg7N/5hwYAHOugxEw2gnIzCSBsh6nQeKcqXLigDS8MpkhVnnguFgkGRQzDvjvKXtx5YgHLIw4V7qJdCi9ulZEVpmKbzYt/Dh/Ejf27e5JuMNfm0/o7enbb5KTmT2RQGoFIZOTP1O8/2cz464e55HyVhOVJWGMqNxyhrVRJfmY7OUEAGQSRzoTEtpfe26NeOas9B50O9Cl7B7gDwEDy9riaq5BR5EXOlTYuyYN+yR+4fqJafH0v9STmxpAQG5QqRbayqXmW2tWjucsDuDCncv6J6jmI88mzwXygA6l12+i9ToTvq5J2o/eEOfQ4LevD9VH21Q==');
INSERT INTO public.component_config VALUES ('7cf1db76-0066-480d-9541-fc7789ebbf4b', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('0c490980-d145-4d13-8ff9-d5daf762e73b', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('d175184c-54c2-4273-b12b-48d2be02c2d1', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('aa25410c-920e-43f8-baec-f712c4813c12', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('c3b51f34-ee87-43ac-8c9b-3b72290791e2', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('9f126046-6163-484b-bbbd-26363e04229b', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('81817029-4b95-47db-98f3-1dcd00cd3bbf', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('c11d3380-e91e-47d0-9142-4332df4e4dbd', '3029e4e4-bfbe-490c-af54-65174b5711d6', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('ce260ad9-1d0f-4075-b09f-d560bdd04fad', '34015fb7-1b62-40f7-b663-fa89661ba939', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('537016e6-2d91-4ce9-9eb3-7194b571f511', 'ed029d0b-6d80-4bdd-a21a-7c909d87d494', 'secret', '5KmtbnhM5ohR2BIsyX-GE7OUUKEz3K0XLMeKYsBQPDe98pDPOR5QYbfzDw98KD2ypsfDwk_e6eW9-xAhI1RJtg');
INSERT INTO public.component_config VALUES ('0ade4590-4639-4d70-8aee-78b49fa54691', 'ed029d0b-6d80-4bdd-a21a-7c909d87d494', 'kid', 'cc18bff0-c834-4866-974d-0f67d01d8311');
INSERT INTO public.component_config VALUES ('86d44aee-19b8-474c-99b2-ce23467b0838', '1e3a64aa-1eab-42a3-844b-b1aa6799d624', 'certificate', 'MIICozCCAYsCBgGLnDi7bzANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApib29rLXN0b3JlMB4XDTIzMTEwNDIxMjIyNVoXDTMzMTEwNDIxMjQwNVowFTETMBEGA1UEAwwKYm9vay1zdG9yZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANU65gUotrCPvl1f3w8Ymf98aaWTWYZsDzTQGQB01EyiakemFiDV/LunD2bI6FGkogKruYq14t013h8kQFnK6SGbsZ5dSQk2m6dDU7k4qSRFQlbuS8gSM0LEfR0CaAd6Iw50pGSdxNch+lE3Gn1kGEBjsttJ92A3Hjg/QFTgrcfY8AC+AjEQSg9oUeY6g+JJbvtrm33pKxMGm2WCusWyLxA4pTUWHobJa9uAih03tKwcYcS4wdRw8vWV0+51L+MgXUPgtTRhglDZ4F/t7KJh/UKAoUghNftIMZGGtOyq7FtQIr1W5rSZGFTDJIlbK1CGyUvsKvqC67UgIiTJBrsgvg8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAkCxGuqRyC7kleLMTVSraxoEnIaIL7aY1IdckRGR8UID7sLZ7fLi3iZX8Cs2CG3QmER5WaI3zEJThcFkY8CPVNqD6ZYXOCR81Gay3NuXePjuNF0Ugx7IYMwRpZH9AA6BMKX3q9sPOvKohrUz0A98IOdDgTHokPJzKJo9cUjsaC5xX+jeAbMzEdnKDK5txRCqaCZDcgNlMzG5rPSspHhSFf50MEN7KIIzVYAE4BajJlPCNuPhtyyKGZ6YB2fnehY/kCgPMD8O0OoUf0+tDCsVlbaLnpuUiuzrxktnMb54aO9Yfbg4E0/pkT6KHvALr8MJp4Z1dviZD0lNuvvTn0OfXeg==');
INSERT INTO public.component_config VALUES ('743bd792-48ff-47bf-9b0f-5df6544f7b64', '1e3a64aa-1eab-42a3-844b-b1aa6799d624', 'priority', '100');
INSERT INTO public.component_config VALUES ('48b4c432-4fcf-480d-a06d-860b79f02ac8', '1e3a64aa-1eab-42a3-844b-b1aa6799d624', 'privateKey', 'MIIEpAIBAAKCAQEA1TrmBSi2sI++XV/fDxiZ/3xppZNZhmwPNNAZAHTUTKJqR6YWINX8u6cPZsjoUaSiAqu5irXi3TXeHyRAWcrpIZuxnl1JCTabp0NTuTipJEVCVu5LyBIzQsR9HQJoB3ojDnSkZJ3E1yH6UTcafWQYQGOy20n3YDceOD9AVOCtx9jwAL4CMRBKD2hR5jqD4klu+2ubfekrEwabZYK6xbIvEDilNRYehslr24CKHTe0rBxhxLjB1HDy9ZXT7nUv4yBdQ+C1NGGCUNngX+3somH9QoChSCE1+0gxkYa07KrsW1AivVbmtJkYVMMkiVsrUIbJS+wq+oLrtSAiJMkGuyC+DwIDAQABAoIBABqNTIes7l7lxLs6N9EDQRNENKBLzR9E2nnlmzoS0j2UEJmecBf4/ZEyeDkA4JO2D/82z2fF8XDsBx5SnyQZ9SuHCI2jU80ZZzWOAowd0aDKHRItIfOmdzVOZBQA24ppe5m5DaAtLeM/gGes7cKv0aicTEaBRel4bkNry5YmKjhTLCFM4LN+0kgz9rUH+2FXdBdUo+MzOPf8zf7iyP23UHLoZGPxZUpwartl4QWrbo46wNuYhEqehsiFfjr+EmspY4AIYmLAHz8qrbrbYKIm4964G7bE5acWIMDxMFdLV4BCtwkcAiRY7JMIXz3JzzC976YG1jyAN8Zl9ph8UYFB72ECgYEA+LSnEzuhNQNqDnzK3XXTsWpe+Ip1ufj5uMNkKPm0in5H2dzQSBbuCPPzV4R12LHhiGOO2uUDBGof7Sk7jpU+vly4hMQsLzf649+4vb3WXHCglvNsU8c6Di71c2boHBb+9iEfLAPTD+HRk3LCL2QMYZPhJW9s7sp8WDqHDJla+W8CgYEA23viwXYi61B8Vux7GkliPcemoduqD51r+2NfNbz8ljjbTVw4undE8a1rsUUTZEBUpyVyE3cLeMMHJOHVvhAFlKHINkd8RDa7VUUMCY/zt1rzDWH+RPhhxh8sE2D0K07VsKOL2UZh4jNevpBFwFy5Ye60YGIxMTSjSXmSPw2f9WECgYEA9e2FTKJpTUe8BullnMnXdBdQJAqeUTCelxI3J8GLwmsO16LfHnn2FUpNdVwZQBbdgoWYDGHqsuHSAi0EpIB2E70SBM8LNgHwCIcAYjenEa+ZTMsWcl2Nzdqngd7fZG9k3LNx5I8/lPPizh/rXvtatt6JAwCEwjfd70yooE/AwucCgYEAloH8vCeTyIPX0A+4Vw1Nhgn71XB5zN1pp+i76HDhUO5KTGFaMVwKdiQy/kvdAVkv87K06G4w+q3an0sSNJRuDz9luPsKVwilK9L+byw8t1Zx55J0N72P5rmHkv5gUbZsyQVNqEAgbWpGpSzv9/pd0a9MF/AdxZ1P/9mTFRP1xeECgYByLz4lG0bap2Ngr8S7xP7YoCOoyVzeTa4krlqyl+jRWsQfMbNTH1NurZXuBGOmSlhz8WqWM7CYUMCR5P2fLphWgbPsl0Q5DnROUUaKel1xonG6Cn7HWLDBqFKRGa+RGYm5aSbpWJjJPMcJ1J+Oq5q6ctbUvjCWujoy8e+Q90+/SA==');
INSERT INTO public.component_config VALUES ('c85a3b3c-6756-4d90-b311-10b12cbeadc6', '1e3a64aa-1eab-42a3-844b-b1aa6799d624', 'algorithm', 'RSA-OAEP');
INSERT INTO public.component_config VALUES ('3f087420-7be1-4e7a-9c55-50c63a862db9', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('a5edb197-b053-4700-8ed2-1d36f7d8c049', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('03447924-80fa-49a7-9247-745d3b4feaad', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('ab330155-ae44-4de5-bca4-f532a775b4da', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('10a3d4ed-18ef-48b7-9f54-92905cf60ea4', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('e1f94aee-5c73-402f-a7c3-abfef5641930', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('387ed6a5-e33a-40f4-b30d-b7bf5cb3cd7a', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('4724733a-8066-485c-9ae6-e8577625478a', 'f42a7f45-5d7a-4136-94b0-7ee3e9f9afdc', 'allowed-protocol-mapper-types', 'oidc-address-mapper');


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', 'e7471fa1-1493-4675-b4d4-6c03e61ae366');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '5c881acd-cb04-46fe-8042-28407e2b5365');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '27acfca3-f982-4852-b4ac-4b7b73dc1267');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '55e9a720-73a1-4431-ae20-6b7f4950dc3e');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', 'e4f5339e-4f22-45bf-b635-914bbb8e9e5f');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', 'f9cdb87a-4712-4934-96ef-9b1a797af93e');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '804dca97-7f86-4e09-84c2-a7288bc88a9a');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '70b928bd-2a8b-4d19-8eec-e13a2337c72d');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '3fe8df04-5155-46a4-8ea9-5d15b29aa3b0');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '87881619-6bee-4be6-8521-7fdc261f4ec5');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '1260f0cd-6bf2-4736-9600-31e8ff273341');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '38f672dd-b24d-409b-8cf3-7e34c2398c19');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '14b8312e-4382-42c0-994c-804742d22fdc');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '7bf0fe1f-3ea2-4b81-838f-7916ba1129a6');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '019f4159-66cc-4107-9f42-430f03dddf7d');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '48737183-9d4c-4c1f-8cf0-7995e3bce826');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', 'd5f4aa1b-ef47-432a-993f-02f41ebc09bc');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '984504f2-23a4-40be-b1f0-0f4adcd4c1ce');
INSERT INTO public.composite_role VALUES ('55e9a720-73a1-4431-ae20-6b7f4950dc3e', '984504f2-23a4-40be-b1f0-0f4adcd4c1ce');
INSERT INTO public.composite_role VALUES ('55e9a720-73a1-4431-ae20-6b7f4950dc3e', '019f4159-66cc-4107-9f42-430f03dddf7d');
INSERT INTO public.composite_role VALUES ('e4f5339e-4f22-45bf-b635-914bbb8e9e5f', '48737183-9d4c-4c1f-8cf0-7995e3bce826');
INSERT INTO public.composite_role VALUES ('ed7bfe44-f63b-42ef-894f-e49a118089d6', 'f544e943-7407-4de0-8067-bd9900093d90');
INSERT INTO public.composite_role VALUES ('ed7bfe44-f63b-42ef-894f-e49a118089d6', '77f21941-b7c0-460a-afa4-ae801a05fe47');
INSERT INTO public.composite_role VALUES ('77f21941-b7c0-460a-afa4-ae801a05fe47', 'f9c0d923-fd73-44f2-b978-e5abf4ac83a5');
INSERT INTO public.composite_role VALUES ('154dd43a-8d39-4582-9b54-d591bbfe4d22', '2e300919-d025-491f-a658-fb84f1a1fe4f');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', 'e220814d-7387-4e98-874f-6c4fd6566de0');
INSERT INTO public.composite_role VALUES ('ed7bfe44-f63b-42ef-894f-e49a118089d6', 'b4f9d5f9-b59b-4453-b09d-7f26b8003a53');
INSERT INTO public.composite_role VALUES ('ed7bfe44-f63b-42ef-894f-e49a118089d6', '2e275ccc-5d53-42e3-a125-61dc186cffe6');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', 'd2ebfafb-641f-4dd6-972c-7bbdb71b71e4');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', 'c93eacb1-bf51-4372-b250-e514649bcbd1');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '51f0857f-2a96-4984-8f09-c064f653368a');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', 'de4415f6-fda7-4241-aa87-dd2cc2a5e683');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '418f5a42-0a71-4209-812b-eb2dd0fe0f7d');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', 'b901ff2b-408c-47e0-8b7f-f29106146a0f');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '08ab57b3-ac92-4b74-aa30-d82909469454');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '0fafc8bc-e8b1-42bf-b089-634bbee5055f');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '5cc4a296-42d3-4377-9a94-dfddb13e441c');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '6337858a-9ab1-4f3e-8cfe-14256e8090f3');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', 'fbc8294d-c65f-400c-9bd7-ef42f0f43f9f');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '6680516d-c60b-41c5-95e1-6eb0d586bb00');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '8f06512f-a50f-4314-8257-da64532ab1f5');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '565e62fd-ce4d-4670-b6d3-9d798d646e41');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', 'e11cbc99-7792-41e7-b115-df473bbb7c35');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '12453ae0-1687-4908-82cd-81067fdf95d2');
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '4e4ed502-f778-4a9d-ae43-701798885cbd');
INSERT INTO public.composite_role VALUES ('51f0857f-2a96-4984-8f09-c064f653368a', '4e4ed502-f778-4a9d-ae43-701798885cbd');
INSERT INTO public.composite_role VALUES ('51f0857f-2a96-4984-8f09-c064f653368a', '565e62fd-ce4d-4670-b6d3-9d798d646e41');
INSERT INTO public.composite_role VALUES ('de4415f6-fda7-4241-aa87-dd2cc2a5e683', 'e11cbc99-7792-41e7-b115-df473bbb7c35');
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
INSERT INTO public.composite_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', 'a62e8a4d-c450-48a9-b2ab-1376bef00a04');


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.credential VALUES ('75887596-636e-42fc-9a12-6f97330090d7', NULL, 'password', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9', 1699132498037, NULL, '{"value":"FZ7jswL+m1s9/DZgR3kpeCytB6CbYYnRXoQpOy+UmNc=","salt":"oCnOaTd116IaS69KQWVsvA==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('1a790cbf-5a20-46ca-a491-95c6d015bb3a', NULL, 'password', 'b387010c-2582-48ce-aab7-f28371cd9fee', 1699133057182, NULL, '{"value":"83c/5+U9AgsrTZbuQGWDLdAEy6a1SoqkOW8c6eOWY1w=","salt":"m93BaUC5DunjfxmDusgegw==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential VALUES ('64a50b47-0eb5-4876-a64b-1d99ee48f39b', NULL, 'password', '24756198-f4c1-4899-8a0d-1bcadd115f33', 1699133075884, NULL, '{"value":"zH+zBtLbQnWPyCyXO00xLv0lH6rfVd9j8rHDVJHrSgI=","salt":"NKtK88OW4Vxgghce/KHMFA==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml', '2023-11-04 21:14:52.994727', 1, 'EXECUTED', '8:bda77d94bf90182a1e30c24f1c155ec7', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml', '2023-11-04 21:14:53.000877', 2, 'MARK_RAN', '8:1ecb330f30986693d1cba9ab579fa219', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2023-11-04 21:14:53.070544', 3, 'EXECUTED', '8:cb7ace19bc6d959f305605d255d4c843', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2023-11-04 21:14:53.08155', 4, 'EXECUTED', '8:80230013e961310e6872e871be424a63', 'renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2023-11-04 21:14:53.254918', 5, 'EXECUTED', '8:67f4c20929126adc0c8e9bf48279d244', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2023-11-04 21:14:53.259707', 6, 'MARK_RAN', '8:7311018b0b8179ce14628ab412bb6783', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2023-11-04 21:14:53.411073', 7, 'EXECUTED', '8:037ba1216c3640f8785ee6b8e7c8e3c1', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2023-11-04 21:14:53.415794', 8, 'MARK_RAN', '8:7fe6ffe4af4df289b3157de32c624263', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2023-11-04 21:14:53.425986', 9, 'EXECUTED', '8:9c136bc3187083a98745c7d03bc8a303', 'update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2023-11-04 21:14:53.607428', 10, 'EXECUTED', '8:b5f09474dca81fb56a97cf5b6553d331', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2023-11-04 21:14:53.704772', 11, 'EXECUTED', '8:ca924f31bd2a3b219fdcfe78c82dacf4', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2023-11-04 21:14:53.71027', 12, 'MARK_RAN', '8:8acad7483e106416bcfa6f3b824a16cd', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2023-11-04 21:14:53.731695', 13, 'EXECUTED', '8:9b1266d17f4f87c78226f5055408fd5e', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2023-11-04 21:14:53.773294', 14, 'EXECUTED', '8:d80ec4ab6dbfe573550ff72396c7e910', 'addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2023-11-04 21:14:53.776378', 15, 'MARK_RAN', '8:d86eb172171e7c20b9c849b584d147b2', 'delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2023-11-04 21:14:53.779763', 16, 'MARK_RAN', '8:5735f46f0fa60689deb0ecdc2a0dea22', 'dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2023-11-04 21:14:53.783643', 17, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2023-11-04 21:14:53.843801', 18, 'EXECUTED', '8:5c1a8fd2014ac7fc43b90a700f117b23', 'createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2023-11-04 21:14:53.912966', 19, 'EXECUTED', '8:1f6c2c2dfc362aff4ed75b3f0ef6b331', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2023-11-04 21:14:53.925522', 20, 'EXECUTED', '8:dee9246280915712591f83a127665107', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2023-11-04 21:14:53.930164', 21, 'MARK_RAN', '8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2023-11-04 21:14:53.936824', 22, 'MARK_RAN', '8:dee9246280915712591f83a127665107', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2023-11-04 21:14:53.966723', 23, 'EXECUTED', '8:d9fa18ffa355320395b86270680dd4fe', 'update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2023-11-04 21:14:53.977635', 24, 'EXECUTED', '8:90cff506fedb06141ffc1c71c4a1214c', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2023-11-04 21:14:53.981091', 25, 'MARK_RAN', '8:11a788aed4961d6d29c427c063af828c', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2023-11-04 21:14:54.067975', 26, 'EXECUTED', '8:a4218e51e1faf380518cce2af5d39b43', 'createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2023-11-04 21:14:54.20244', 27, 'EXECUTED', '8:d9e9a1bfaa644da9952456050f07bbdc', 'createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2023-11-04 21:14:54.207185', 28, 'EXECUTED', '8:d1bf991a6163c0acbfe664b615314505', 'update tableName=RESOURCE_SERVER_POLICY', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('2.1.0-KEYCLOAK-5461', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2023-11-04 21:14:54.333075', 29, 'EXECUTED', '8:88a743a1e87ec5e30bf603da68058a8c', 'createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2023-11-04 21:14:54.359114', 30, 'EXECUTED', '8:c5517863c875d325dea463d00ec26d7a', 'addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2023-11-04 21:14:54.380225', 31, 'EXECUTED', '8:ada8b4833b74a498f376d7136bc7d327', 'createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2023-11-04 21:14:54.388349', 32, 'EXECUTED', '8:b9b73c8ea7299457f99fcbb825c263ba', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2023-11-04 21:14:54.397147', 33, 'EXECUTED', '8:07724333e625ccfcfc5adc63d57314f3', 'customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2023-11-04 21:14:54.39995', 34, 'MARK_RAN', '8:8b6fd445958882efe55deb26fc541a7b', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2023-11-04 21:14:54.441587', 35, 'EXECUTED', '8:29b29cfebfd12600897680147277a9d7', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml', '2023-11-04 21:14:54.448283', 36, 'EXECUTED', '8:73ad77ca8fd0410c7f9f15a471fa52bc', 'addColumn tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2023-11-04 21:14:54.462293', 37, 'EXECUTED', '8:64f27a6fdcad57f6f9153210f2ec1bdb', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2023-11-04 21:14:54.47315', 38, 'EXECUTED', '8:27180251182e6c31846c2ddab4bc5781', 'addColumn tableName=FED_USER_CONSENT', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2023-11-04 21:14:54.482361', 39, 'EXECUTED', '8:d56f201bfcfa7a1413eb3e9bc02978f9', 'addColumn tableName=IDENTITY_PROVIDER', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2023-11-04 21:14:54.485773', 40, 'MARK_RAN', '8:91f5522bf6afdc2077dfab57fbd3455c', 'addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2023-11-04 21:14:54.489447', 41, 'MARK_RAN', '8:0f01b554f256c22caeb7d8aee3a1cdc8', 'dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix-offline-sessions', 'hmlnarik', 'META-INF/jpa-changelog-3.2.0.xml', '2023-11-04 21:14:54.497149', 42, 'EXECUTED', '8:ab91cf9cee415867ade0e2df9651a947', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2023-11-04 21:14:54.834974', 43, 'EXECUTED', '8:ceac9b1889e97d602caf373eadb0d4b7', 'addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2023-11-04 21:14:54.844053', 44, 'EXECUTED', '8:84b986e628fe8f7fd8fd3c275c5259f2', 'addColumn tableName=USER_ENTITY', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2023-11-04 21:14:54.855222', 45, 'EXECUTED', '8:a164ae073c56ffdbc98a615493609a52', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2023-11-04 21:14:54.868177', 46, 'EXECUTED', '8:70a2b4f1f4bd4dbf487114bdb1810e64', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2023-11-04 21:14:54.872003', 47, 'MARK_RAN', '8:7be68b71d2f5b94b8df2e824f2860fa2', 'dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2023-11-04 21:14:54.954144', 48, 'EXECUTED', '8:bab7c631093c3861d6cf6144cd944982', 'addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2023-11-04 21:14:54.966923', 49, 'EXECUTED', '8:fa809ac11877d74d76fe40869916daad', 'addColumn tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('3.4.0', 'keycloak', 'META-INF/jpa-changelog-3.4.0.xml', '2023-11-04 21:14:55.073611', 50, 'EXECUTED', '8:fac23540a40208f5f5e326f6ceb4d291', 'addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('3.4.0-KEYCLOAK-5230', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-3.4.0.xml', '2023-11-04 21:14:55.158467', 51, 'EXECUTED', '8:2612d1b8a97e2b5588c346e817307593', 'createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('3.4.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-3.4.1.xml', '2023-11-04 21:14:55.166989', 52, 'EXECUTED', '8:9842f155c5db2206c88bcb5d1046e941', 'modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('3.4.2', 'keycloak', 'META-INF/jpa-changelog-3.4.2.xml', '2023-11-04 21:14:55.172944', 53, 'EXECUTED', '8:2e12e06e45498406db72d5b3da5bbc76', 'update tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('3.4.2-KEYCLOAK-5172', 'mkanis@redhat.com', 'META-INF/jpa-changelog-3.4.2.xml', '2023-11-04 21:14:55.179189', 54, 'EXECUTED', '8:33560e7c7989250c40da3abdabdc75a4', 'update tableName=CLIENT', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-6335', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2023-11-04 21:14:55.190976', 55, 'EXECUTED', '8:87a8d8542046817a9107c7eb9cbad1cd', 'createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('4.0.0-CLEANUP-UNUSED-TABLE', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2023-11-04 21:14:55.19801', 56, 'EXECUTED', '8:3ea08490a70215ed0088c273d776311e', 'dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-6228', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2023-11-04 21:14:55.231888', 57, 'EXECUTED', '8:2d56697c8723d4592ab608ce14b6ed68', 'dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-5579-fixed', 'mposolda@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2023-11-04 21:14:55.353172', 58, 'EXECUTED', '8:3e423e249f6068ea2bbe48bf907f9d86', 'dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('authz-4.0.0.CR1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.CR1.xml', '2023-11-04 21:14:55.387761', 59, 'EXECUTED', '8:15cabee5e5df0ff099510a0fc03e4103', 'createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('authz-4.0.0.Beta3', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.Beta3.xml', '2023-11-04 21:14:55.395288', 60, 'EXECUTED', '8:4b80200af916ac54d2ffbfc47918ab0e', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('authz-4.2.0.Final', 'mhajas@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2023-11-04 21:14:55.406919', 61, 'EXECUTED', '8:66564cd5e168045d52252c5027485bbb', 'createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('authz-4.2.0.Final-KEYCLOAK-9944', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2023-11-04 21:14:55.41745', 62, 'EXECUTED', '8:1c7064fafb030222be2bd16ccf690f6f', 'addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('4.2.0-KEYCLOAK-6313', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.2.0.xml', '2023-11-04 21:14:55.424424', 63, 'EXECUTED', '8:2de18a0dce10cdda5c7e65c9b719b6e5', 'addColumn tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('4.3.0-KEYCLOAK-7984', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.3.0.xml', '2023-11-04 21:14:55.428762', 64, 'EXECUTED', '8:03e413dd182dcbd5c57e41c34d0ef682', 'update tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-7950', 'psilva@redhat.com', 'META-INF/jpa-changelog-4.6.0.xml', '2023-11-04 21:14:55.43306', 65, 'EXECUTED', '8:d27b42bb2571c18fbe3fe4e4fb7582a7', 'update tableName=RESOURCE_SERVER_RESOURCE', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-8377', 'keycloak', 'META-INF/jpa-changelog-4.6.0.xml', '2023-11-04 21:14:55.460064', 66, 'EXECUTED', '8:698baf84d9fd0027e9192717c2154fb8', 'createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-8555', 'gideonray@gmail.com', 'META-INF/jpa-changelog-4.6.0.xml', '2023-11-04 21:14:55.472102', 67, 'EXECUTED', '8:ced8822edf0f75ef26eb51582f9a821a', 'createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('4.7.0-KEYCLOAK-1267', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.7.0.xml', '2023-11-04 21:14:55.479126', 68, 'EXECUTED', '8:f0abba004cf429e8afc43056df06487d', 'addColumn tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('4.7.0-KEYCLOAK-7275', 'keycloak', 'META-INF/jpa-changelog-4.7.0.xml', '2023-11-04 21:14:55.500181', 69, 'EXECUTED', '8:6662f8b0b611caa359fcf13bf63b4e24', 'renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('4.8.0-KEYCLOAK-8835', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.8.0.xml', '2023-11-04 21:14:55.507962', 70, 'EXECUTED', '8:9e6b8009560f684250bdbdf97670d39e', 'addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('authz-7.0.0-KEYCLOAK-10443', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-7.0.0.xml', '2023-11-04 21:14:55.514791', 71, 'EXECUTED', '8:4223f561f3b8dc655846562b57bb502e', 'addColumn tableName=RESOURCE_SERVER', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('8.0.0-adding-credential-columns', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2023-11-04 21:14:55.523894', 72, 'EXECUTED', '8:215a31c398b363ce383a2b301202f29e', 'addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-not-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2023-11-04 21:14:55.531027', 73, 'EXECUTED', '8:83f7a671792ca98b3cbd3a1a34862d3d', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2023-11-04 21:14:55.534914', 74, 'MARK_RAN', '8:f58ad148698cf30707a6efbdf8061aa7', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('8.0.0-credential-cleanup-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2023-11-04 21:14:55.551815', 75, 'EXECUTED', '8:79e4fd6c6442980e58d52ffc3ee7b19c', 'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('8.0.0-resource-tag-support', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2023-11-04 21:14:55.564745', 76, 'EXECUTED', '8:87af6a1e6d241ca4b15801d1f86a297d', 'addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('9.0.0-always-display-client', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2023-11-04 21:14:55.597988', 77, 'EXECUTED', '8:b44f8d9b7b6ea455305a6d72a200ed15', 'addColumn tableName=CLIENT', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('9.0.0-drop-constraints-for-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2023-11-04 21:14:55.60146', 78, 'MARK_RAN', '8:2d8ed5aaaeffd0cb004c046b4a903ac5', 'dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('9.0.0-increase-column-size-federated-fk', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2023-11-04 21:14:55.626452', 79, 'EXECUTED', '8:e290c01fcbc275326c511633f6e2acde', 'modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('9.0.0-recreate-constraints-after-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2023-11-04 21:14:55.629872', 80, 'MARK_RAN', '8:c9db8784c33cea210872ac2d805439f8', 'addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('9.0.1-add-index-to-client.client_id', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2023-11-04 21:14:55.642058', 81, 'EXECUTED', '8:95b676ce8fc546a1fcfb4c92fae4add5', 'createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2023-11-04 21:14:55.645421', 82, 'MARK_RAN', '8:38a6b2a41f5651018b1aca93a41401e5', 'dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-add-not-null-constraint', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2023-11-04 21:14:55.653269', 83, 'EXECUTED', '8:3fb99bcad86a0229783123ac52f7609c', 'addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2023-11-04 21:14:55.656443', 84, 'MARK_RAN', '8:64f27a6fdcad57f6f9153210f2ec1bdb', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('9.0.1-add-index-to-events', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2023-11-04 21:14:55.667962', 85, 'EXECUTED', '8:ab4f863f39adafd4c862f7ec01890abc', 'createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-11.0.0.xml', '2023-11-04 21:14:55.674896', 86, 'EXECUTED', '8:13c419a0eb336e91ee3a3bf8fda6e2a7', 'dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2023-11-04 21:14:55.683768', 87, 'EXECUTED', '8:e3fb1e698e0471487f51af1ed80fe3ac', 'dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('12.1.0-add-realm-localization-table', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2023-11-04 21:14:55.700253', 88, 'EXECUTED', '8:babadb686aab7b56562817e60bf0abd0', 'createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('default-roles', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 21:14:55.710445', 89, 'EXECUTED', '8:72d03345fda8e2f17093d08801947773', 'addColumn tableName=REALM; customChange', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('default-roles-cleanup', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 21:14:55.718087', 90, 'EXECUTED', '8:61c9233951bd96ffecd9ba75f7d978a4', 'dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('13.0.0-KEYCLOAK-16844', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 21:14:55.729414', 91, 'EXECUTED', '8:ea82e6ad945cec250af6372767b25525', 'createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri-13.0.0', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 21:14:55.73795', 92, 'EXECUTED', '8:d3f4a33f41d960ddacd7e2ef30d126b3', 'dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('13.0.0-KEYCLOAK-17992-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 21:14:55.740864', 93, 'MARK_RAN', '8:1284a27fbd049d65831cb6fc07c8a783', 'dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('13.0.0-increase-column-size-federated', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 21:14:55.75396', 94, 'EXECUTED', '8:9d11b619db2ae27c25853b8a37cd0dea', 'modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('13.0.0-KEYCLOAK-17992-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 21:14:55.75721', 95, 'MARK_RAN', '8:3002bb3997451bb9e8bac5c5cd8d6327', 'addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('json-string-accomodation-fixed', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2023-11-04 21:14:55.765111', 96, 'EXECUTED', '8:dfbee0d6237a23ef4ccbb7a4e063c163', 'addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-11019', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 21:14:55.785823', 97, 'EXECUTED', '8:75f3e372df18d38c62734eebb986b960', 'createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 21:14:55.790313', 98, 'MARK_RAN', '8:7fee73eddf84a6035691512c85637eef', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286-revert', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 21:14:55.799276', 99, 'MARK_RAN', '8:7a11134ab12820f999fbf3bb13c3adc8', 'dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286-supported-dbs', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 21:14:55.811457', 100, 'EXECUTED', '8:c0f6eaac1f3be773ffe54cb5b8482b70', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('14.0.0-KEYCLOAK-18286-unsupported-dbs', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 21:14:55.81478', 101, 'MARK_RAN', '8:18186f0008b86e0f0f49b0c4d0e842ac', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('KEYCLOAK-17267-add-index-to-user-attributes', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 21:14:55.827078', 102, 'EXECUTED', '8:09c2780bcb23b310a7019d217dc7b433', 'createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('KEYCLOAK-18146-add-saml-art-binding-identifier', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2023-11-04 21:14:55.834405', 103, 'EXECUTED', '8:276a44955eab693c970a42880197fff2', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('15.0.0-KEYCLOAK-18467', 'keycloak', 'META-INF/jpa-changelog-15.0.0.xml', '2023-11-04 21:14:55.841658', 104, 'EXECUTED', '8:ba8ee3b694d043f2bfc1a1079d0760d7', 'addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('17.0.0-9562', 'keycloak', 'META-INF/jpa-changelog-17.0.0.xml', '2023-11-04 21:14:55.852781', 105, 'EXECUTED', '8:5e06b1d75f5d17685485e610c2851b17', 'createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('18.0.0-10625-IDX_ADMIN_EVENT_TIME', 'keycloak', 'META-INF/jpa-changelog-18.0.0.xml', '2023-11-04 21:14:55.863436', 106, 'EXECUTED', '8:4b80546c1dc550ac552ee7b24a4ab7c0', 'createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('19.0.0-10135', 'keycloak', 'META-INF/jpa-changelog-19.0.0.xml', '2023-11-04 21:14:55.870244', 107, 'EXECUTED', '8:af510cd1bb2ab6339c45372f3e491696', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('20.0.0-12964-supported-dbs', 'keycloak', 'META-INF/jpa-changelog-20.0.0.xml', '2023-11-04 21:14:55.880698', 108, 'EXECUTED', '8:05c99fc610845ef66ee812b7921af0ef', 'createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('20.0.0-12964-unsupported-dbs', 'keycloak', 'META-INF/jpa-changelog-20.0.0.xml', '2023-11-04 21:14:55.883581', 109, 'MARK_RAN', '8:314e803baf2f1ec315b3464e398b8247', 'createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('client-attributes-string-accomodation-fixed', 'keycloak', 'META-INF/jpa-changelog-20.0.0.xml', '2023-11-04 21:14:55.891638', 110, 'EXECUTED', '8:56e4677e7e12556f70b604c573840100', 'addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('21.0.2-17277', 'keycloak', 'META-INF/jpa-changelog-21.0.2.xml', '2023-11-04 21:14:55.898961', 111, 'EXECUTED', '8:8806cb33d2a546ce770384bf98cf6eac', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('21.1.0-19404', 'keycloak', 'META-INF/jpa-changelog-21.1.0.xml', '2023-11-04 21:14:55.951329', 112, 'EXECUTED', '8:fdb2924649d30555ab3a1744faba4928', 'modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('21.1.0-19404-2', 'keycloak', 'META-INF/jpa-changelog-21.1.0.xml', '2023-11-04 21:14:55.954509', 113, 'MARK_RAN', '8:1c96cc2b10903bd07a03670098d67fd6', 'addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...', '', NULL, '4.20.0', NULL, NULL, '9132492396');
INSERT INTO public.databasechangelog VALUES ('22.0.0-17484', 'keycloak', 'META-INF/jpa-changelog-22.0.0.xml', '2023-11-04 21:14:55.961203', 114, 'EXECUTED', '8:4c3d4e8b142a66fcdf21b89a4dd33301', 'customChange', '', NULL, '4.20.0', NULL, NULL, '9132492396');


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.databasechangeloglock VALUES (1, false, NULL, NULL);
INSERT INTO public.databasechangeloglock VALUES (1000, false, NULL, NULL);
INSERT INTO public.databasechangeloglock VALUES (1001, false, NULL, NULL);


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.default_client_scope VALUES ('546da6ad-8f65-4ce7-ba91-1346136c584b', '56c0fbee-c694-4365-b572-85ef06172931', false);
INSERT INTO public.default_client_scope VALUES ('546da6ad-8f65-4ce7-ba91-1346136c584b', '3fc1c611-b6f3-4b9b-ae80-473d70f0e704', true);
INSERT INTO public.default_client_scope VALUES ('546da6ad-8f65-4ce7-ba91-1346136c584b', '3f25582f-18eb-4043-85b6-e35d3dc3ebcb', true);
INSERT INTO public.default_client_scope VALUES ('546da6ad-8f65-4ce7-ba91-1346136c584b', '23f79b31-a24e-4376-b70a-b3f54004122a', true);
INSERT INTO public.default_client_scope VALUES ('546da6ad-8f65-4ce7-ba91-1346136c584b', 'a03445b7-d0d9-438f-ac78-aed73cc6720c', false);
INSERT INTO public.default_client_scope VALUES ('546da6ad-8f65-4ce7-ba91-1346136c584b', '588e4ed0-ad19-45f7-89f6-74ace21372e8', false);
INSERT INTO public.default_client_scope VALUES ('546da6ad-8f65-4ce7-ba91-1346136c584b', '3794702d-a4a4-465c-a39f-d4d13e74f446', true);
INSERT INTO public.default_client_scope VALUES ('546da6ad-8f65-4ce7-ba91-1346136c584b', '28086f97-41df-44ab-aa26-f2f377823664', true);
INSERT INTO public.default_client_scope VALUES ('546da6ad-8f65-4ce7-ba91-1346136c584b', '3b6d04fe-1f5f-4414-b9df-76e6b032bb78', false);
INSERT INTO public.default_client_scope VALUES ('546da6ad-8f65-4ce7-ba91-1346136c584b', '24add800-76ab-4a04-9d30-bdc31fc532a0', true);
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

INSERT INTO public.keycloak_role VALUES ('ed7bfe44-f63b-42ef-894f-e49a118089d6', '546da6ad-8f65-4ce7-ba91-1346136c584b', false, '${role_default-roles}', 'default-roles-master', '546da6ad-8f65-4ce7-ba91-1346136c584b', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '546da6ad-8f65-4ce7-ba91-1346136c584b', false, '${role_admin}', 'admin', '546da6ad-8f65-4ce7-ba91-1346136c584b', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('e7471fa1-1493-4675-b4d4-6c03e61ae366', '546da6ad-8f65-4ce7-ba91-1346136c584b', false, '${role_create-realm}', 'create-realm', '546da6ad-8f65-4ce7-ba91-1346136c584b', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('5c881acd-cb04-46fe-8042-28407e2b5365', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_create-client}', 'create-client', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('27acfca3-f982-4852-b4ac-4b7b73dc1267', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_view-realm}', 'view-realm', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('55e9a720-73a1-4431-ae20-6b7f4950dc3e', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_view-users}', 'view-users', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('e4f5339e-4f22-45bf-b635-914bbb8e9e5f', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_view-clients}', 'view-clients', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('f9cdb87a-4712-4934-96ef-9b1a797af93e', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_view-events}', 'view-events', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('804dca97-7f86-4e09-84c2-a7288bc88a9a', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_view-identity-providers}', 'view-identity-providers', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('70b928bd-2a8b-4d19-8eec-e13a2337c72d', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_view-authorization}', 'view-authorization', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('3fe8df04-5155-46a4-8ea9-5d15b29aa3b0', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_manage-realm}', 'manage-realm', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('87881619-6bee-4be6-8521-7fdc261f4ec5', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_manage-users}', 'manage-users', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('1260f0cd-6bf2-4736-9600-31e8ff273341', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_manage-clients}', 'manage-clients', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('38f672dd-b24d-409b-8cf3-7e34c2398c19', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_manage-events}', 'manage-events', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('14b8312e-4382-42c0-994c-804742d22fdc', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_manage-identity-providers}', 'manage-identity-providers', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('7bf0fe1f-3ea2-4b81-838f-7916ba1129a6', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_manage-authorization}', 'manage-authorization', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('019f4159-66cc-4107-9f42-430f03dddf7d', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_query-users}', 'query-users', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('48737183-9d4c-4c1f-8cf0-7995e3bce826', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_query-clients}', 'query-clients', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('d5f4aa1b-ef47-432a-993f-02f41ebc09bc', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_query-realms}', 'query-realms', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('984504f2-23a4-40be-b1f0-0f4adcd4c1ce', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_query-groups}', 'query-groups', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('f544e943-7407-4de0-8067-bd9900093d90', 'cb62ec47-aa85-4d1e-9187-3f8218923968', true, '${role_view-profile}', 'view-profile', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'cb62ec47-aa85-4d1e-9187-3f8218923968', NULL);
INSERT INTO public.keycloak_role VALUES ('77f21941-b7c0-460a-afa4-ae801a05fe47', 'cb62ec47-aa85-4d1e-9187-3f8218923968', true, '${role_manage-account}', 'manage-account', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'cb62ec47-aa85-4d1e-9187-3f8218923968', NULL);
INSERT INTO public.keycloak_role VALUES ('f9c0d923-fd73-44f2-b978-e5abf4ac83a5', 'cb62ec47-aa85-4d1e-9187-3f8218923968', true, '${role_manage-account-links}', 'manage-account-links', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'cb62ec47-aa85-4d1e-9187-3f8218923968', NULL);
INSERT INTO public.keycloak_role VALUES ('db378c06-73a3-4187-a350-968716e81eac', 'cb62ec47-aa85-4d1e-9187-3f8218923968', true, '${role_view-applications}', 'view-applications', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'cb62ec47-aa85-4d1e-9187-3f8218923968', NULL);
INSERT INTO public.keycloak_role VALUES ('2e300919-d025-491f-a658-fb84f1a1fe4f', 'cb62ec47-aa85-4d1e-9187-3f8218923968', true, '${role_view-consent}', 'view-consent', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'cb62ec47-aa85-4d1e-9187-3f8218923968', NULL);
INSERT INTO public.keycloak_role VALUES ('154dd43a-8d39-4582-9b54-d591bbfe4d22', 'cb62ec47-aa85-4d1e-9187-3f8218923968', true, '${role_manage-consent}', 'manage-consent', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'cb62ec47-aa85-4d1e-9187-3f8218923968', NULL);
INSERT INTO public.keycloak_role VALUES ('22c25144-3a27-450f-9886-cb5d0cdcca0c', 'cb62ec47-aa85-4d1e-9187-3f8218923968', true, '${role_view-groups}', 'view-groups', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'cb62ec47-aa85-4d1e-9187-3f8218923968', NULL);
INSERT INTO public.keycloak_role VALUES ('ada2fbbb-84e6-42a0-84d5-b5c407ebc38b', 'cb62ec47-aa85-4d1e-9187-3f8218923968', true, '${role_delete-account}', 'delete-account', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'cb62ec47-aa85-4d1e-9187-3f8218923968', NULL);
INSERT INTO public.keycloak_role VALUES ('4999c838-7c9b-4695-bfa1-3ba0b03e24fa', 'a73d5d17-836e-426e-8c1e-cee828e18977', true, '${role_read-token}', 'read-token', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'a73d5d17-836e-426e-8c1e-cee828e18977', NULL);
INSERT INTO public.keycloak_role VALUES ('e220814d-7387-4e98-874f-6c4fd6566de0', '15d3b017-9733-4647-9d40-09228e5022ce', true, '${role_impersonation}', 'impersonation', '546da6ad-8f65-4ce7-ba91-1346136c584b', '15d3b017-9733-4647-9d40-09228e5022ce', NULL);
INSERT INTO public.keycloak_role VALUES ('b4f9d5f9-b59b-4453-b09d-7f26b8003a53', '546da6ad-8f65-4ce7-ba91-1346136c584b', false, '${role_offline-access}', 'offline_access', '546da6ad-8f65-4ce7-ba91-1346136c584b', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('2e275ccc-5d53-42e3-a125-61dc186cffe6', '546da6ad-8f65-4ce7-ba91-1346136c584b', false, '${role_uma_authorization}', 'uma_authorization', '546da6ad-8f65-4ce7-ba91-1346136c584b', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('c46a9467-cb5a-4888-b8c1-fd6623005642', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', false, '${role_default-roles}', 'default-roles-book-store', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', NULL, NULL);
INSERT INTO public.keycloak_role VALUES ('d2ebfafb-641f-4dd6-972c-7bbdb71b71e4', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_create-client}', 'create-client', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);
INSERT INTO public.keycloak_role VALUES ('c93eacb1-bf51-4372-b250-e514649bcbd1', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_view-realm}', 'view-realm', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);
INSERT INTO public.keycloak_role VALUES ('51f0857f-2a96-4984-8f09-c064f653368a', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_view-users}', 'view-users', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);
INSERT INTO public.keycloak_role VALUES ('de4415f6-fda7-4241-aa87-dd2cc2a5e683', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_view-clients}', 'view-clients', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);
INSERT INTO public.keycloak_role VALUES ('418f5a42-0a71-4209-812b-eb2dd0fe0f7d', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_view-events}', 'view-events', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);
INSERT INTO public.keycloak_role VALUES ('b901ff2b-408c-47e0-8b7f-f29106146a0f', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_view-identity-providers}', 'view-identity-providers', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);
INSERT INTO public.keycloak_role VALUES ('08ab57b3-ac92-4b74-aa30-d82909469454', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_view-authorization}', 'view-authorization', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);
INSERT INTO public.keycloak_role VALUES ('0fafc8bc-e8b1-42bf-b089-634bbee5055f', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_manage-realm}', 'manage-realm', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);
INSERT INTO public.keycloak_role VALUES ('5cc4a296-42d3-4377-9a94-dfddb13e441c', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_manage-users}', 'manage-users', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);
INSERT INTO public.keycloak_role VALUES ('6337858a-9ab1-4f3e-8cfe-14256e8090f3', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_manage-clients}', 'manage-clients', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);
INSERT INTO public.keycloak_role VALUES ('fbc8294d-c65f-400c-9bd7-ef42f0f43f9f', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_manage-events}', 'manage-events', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);
INSERT INTO public.keycloak_role VALUES ('6680516d-c60b-41c5-95e1-6eb0d586bb00', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_manage-identity-providers}', 'manage-identity-providers', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);
INSERT INTO public.keycloak_role VALUES ('8f06512f-a50f-4314-8257-da64532ab1f5', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_manage-authorization}', 'manage-authorization', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);
INSERT INTO public.keycloak_role VALUES ('565e62fd-ce4d-4670-b6d3-9d798d646e41', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_query-users}', 'query-users', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);
INSERT INTO public.keycloak_role VALUES ('e11cbc99-7792-41e7-b115-df473bbb7c35', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_query-clients}', 'query-clients', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);
INSERT INTO public.keycloak_role VALUES ('12453ae0-1687-4908-82cd-81067fdf95d2', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_query-realms}', 'query-realms', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);
INSERT INTO public.keycloak_role VALUES ('4e4ed502-f778-4a9d-ae43-701798885cbd', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_query-groups}', 'query-groups', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);
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
INSERT INTO public.keycloak_role VALUES ('a62e8a4d-c450-48a9-b2ab-1376bef00a04', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', true, '${role_impersonation}', 'impersonation', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', NULL);


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.migration_model VALUES ('4oulj', '22.0.1', 1699132496);


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

INSERT INTO public.protocol_mapper VALUES ('037a61ec-3bbe-4f34-8bec-96f3ce40415f', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', 'effe1a3e-a1ce-4c4f-80ce-cebeca28c9fe', NULL);
INSERT INTO public.protocol_mapper VALUES ('809e6027-4d59-4f28-ba16-1e60f8f60fb5', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '5d42a7c4-7ab0-4d78-9aec-481ac699856e', NULL);
INSERT INTO public.protocol_mapper VALUES ('730594df-cf1f-4dd0-bbd4-a8c8bfbde0c3', 'role list', 'saml', 'saml-role-list-mapper', NULL, '3fc1c611-b6f3-4b9b-ae80-473d70f0e704');
INSERT INTO public.protocol_mapper VALUES ('944e6cb1-221d-4dd7-8592-63d9996b13d6', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '3f25582f-18eb-4043-85b6-e35d3dc3ebcb');
INSERT INTO public.protocol_mapper VALUES ('139333b8-c64c-40f6-8971-9568b243bacd', 'family name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3f25582f-18eb-4043-85b6-e35d3dc3ebcb');
INSERT INTO public.protocol_mapper VALUES ('2dc58c6c-1c96-4193-a08e-2c65147954e4', 'given name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3f25582f-18eb-4043-85b6-e35d3dc3ebcb');
INSERT INTO public.protocol_mapper VALUES ('532fea33-01e7-4e11-b36d-2c6c87b7c2f0', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3f25582f-18eb-4043-85b6-e35d3dc3ebcb');
INSERT INTO public.protocol_mapper VALUES ('19d887c0-da12-48d9-80bf-86faa6c5ca7b', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3f25582f-18eb-4043-85b6-e35d3dc3ebcb');
INSERT INTO public.protocol_mapper VALUES ('c72eec94-821c-4690-b712-d3922346a152', 'username', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3f25582f-18eb-4043-85b6-e35d3dc3ebcb');
INSERT INTO public.protocol_mapper VALUES ('4184157e-aabb-4c0e-bd62-a7d58320a360', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3f25582f-18eb-4043-85b6-e35d3dc3ebcb');
INSERT INTO public.protocol_mapper VALUES ('9fbc6e13-9961-44d1-aaad-943a563280ca', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3f25582f-18eb-4043-85b6-e35d3dc3ebcb');
INSERT INTO public.protocol_mapper VALUES ('09931430-bc9e-4cde-a703-7008b41a1d8f', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3f25582f-18eb-4043-85b6-e35d3dc3ebcb');
INSERT INTO public.protocol_mapper VALUES ('6964e7bd-9c16-4429-b211-fb6e3530660a', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3f25582f-18eb-4043-85b6-e35d3dc3ebcb');
INSERT INTO public.protocol_mapper VALUES ('f994ad7c-29cb-45a4-aad8-22dda11212f1', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3f25582f-18eb-4043-85b6-e35d3dc3ebcb');
INSERT INTO public.protocol_mapper VALUES ('527ca52c-0d91-48e1-bcca-9a219cbba826', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3f25582f-18eb-4043-85b6-e35d3dc3ebcb');
INSERT INTO public.protocol_mapper VALUES ('49fd5c71-3074-43a4-a98c-14ee66a479d4', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3f25582f-18eb-4043-85b6-e35d3dc3ebcb');
INSERT INTO public.protocol_mapper VALUES ('7ca4bbc2-2aed-4f10-8ba6-5ef091f031bd', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3f25582f-18eb-4043-85b6-e35d3dc3ebcb');
INSERT INTO public.protocol_mapper VALUES ('3521606d-93ae-412a-b8ea-b47c13e268a5', 'email', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '23f79b31-a24e-4376-b70a-b3f54004122a');
INSERT INTO public.protocol_mapper VALUES ('5582546e-58c4-4024-a655-4b2ce5447be5', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '23f79b31-a24e-4376-b70a-b3f54004122a');
INSERT INTO public.protocol_mapper VALUES ('a06590af-c70a-46f6-b7b7-0db4ce63c9bf', 'address', 'openid-connect', 'oidc-address-mapper', NULL, 'a03445b7-d0d9-438f-ac78-aed73cc6720c');
INSERT INTO public.protocol_mapper VALUES ('3e42b64f-129a-4056-a5ad-b0eb31ececbb', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '588e4ed0-ad19-45f7-89f6-74ace21372e8');
INSERT INTO public.protocol_mapper VALUES ('3c9452c5-574b-4b30-a131-de2cb7aea0a9', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '588e4ed0-ad19-45f7-89f6-74ace21372e8');
INSERT INTO public.protocol_mapper VALUES ('c3daecce-91bd-4a86-a2e8-0ab299352db9', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '3794702d-a4a4-465c-a39f-d4d13e74f446');
INSERT INTO public.protocol_mapper VALUES ('4410df26-8a03-4029-982c-3d70316c3993', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '3794702d-a4a4-465c-a39f-d4d13e74f446');
INSERT INTO public.protocol_mapper VALUES ('ca941124-0cbe-4e46-a19d-b96e9f0ae7c4', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '3794702d-a4a4-465c-a39f-d4d13e74f446');
INSERT INTO public.protocol_mapper VALUES ('006aae27-4f3e-4bac-97c8-e220106f2450', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '28086f97-41df-44ab-aa26-f2f377823664');
INSERT INTO public.protocol_mapper VALUES ('a6041752-f8f2-4448-a751-05c5899b0fd0', 'upn', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3b6d04fe-1f5f-4414-b9df-76e6b032bb78');
INSERT INTO public.protocol_mapper VALUES ('a2518a92-92e7-427a-9051-906b81ac588b', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '3b6d04fe-1f5f-4414-b9df-76e6b032bb78');
INSERT INTO public.protocol_mapper VALUES ('97dc6582-84a9-4c0f-a58b-5d9d42843226', 'acr loa level', 'openid-connect', 'oidc-acr-mapper', NULL, '24add800-76ab-4a04-9d30-bdc31fc532a0');
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

INSERT INTO public.protocol_mapper_config VALUES ('809e6027-4d59-4f28-ba16-1e60f8f60fb5', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('809e6027-4d59-4f28-ba16-1e60f8f60fb5', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('809e6027-4d59-4f28-ba16-1e60f8f60fb5', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('809e6027-4d59-4f28-ba16-1e60f8f60fb5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('809e6027-4d59-4f28-ba16-1e60f8f60fb5', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('809e6027-4d59-4f28-ba16-1e60f8f60fb5', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('730594df-cf1f-4dd0-bbd4-a8c8bfbde0c3', 'false', 'single');
INSERT INTO public.protocol_mapper_config VALUES ('730594df-cf1f-4dd0-bbd4-a8c8bfbde0c3', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config VALUES ('730594df-cf1f-4dd0-bbd4-a8c8bfbde0c3', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config VALUES ('09931430-bc9e-4cde-a703-7008b41a1d8f', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('09931430-bc9e-4cde-a703-7008b41a1d8f', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('09931430-bc9e-4cde-a703-7008b41a1d8f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('09931430-bc9e-4cde-a703-7008b41a1d8f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('09931430-bc9e-4cde-a703-7008b41a1d8f', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('09931430-bc9e-4cde-a703-7008b41a1d8f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('139333b8-c64c-40f6-8971-9568b243bacd', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('139333b8-c64c-40f6-8971-9568b243bacd', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('139333b8-c64c-40f6-8971-9568b243bacd', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('139333b8-c64c-40f6-8971-9568b243bacd', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('139333b8-c64c-40f6-8971-9568b243bacd', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('139333b8-c64c-40f6-8971-9568b243bacd', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('19d887c0-da12-48d9-80bf-86faa6c5ca7b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('19d887c0-da12-48d9-80bf-86faa6c5ca7b', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('19d887c0-da12-48d9-80bf-86faa6c5ca7b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('19d887c0-da12-48d9-80bf-86faa6c5ca7b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('19d887c0-da12-48d9-80bf-86faa6c5ca7b', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('19d887c0-da12-48d9-80bf-86faa6c5ca7b', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('2dc58c6c-1c96-4193-a08e-2c65147954e4', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2dc58c6c-1c96-4193-a08e-2c65147954e4', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('2dc58c6c-1c96-4193-a08e-2c65147954e4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2dc58c6c-1c96-4193-a08e-2c65147954e4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2dc58c6c-1c96-4193-a08e-2c65147954e4', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('2dc58c6c-1c96-4193-a08e-2c65147954e4', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('4184157e-aabb-4c0e-bd62-a7d58320a360', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4184157e-aabb-4c0e-bd62-a7d58320a360', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('4184157e-aabb-4c0e-bd62-a7d58320a360', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4184157e-aabb-4c0e-bd62-a7d58320a360', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4184157e-aabb-4c0e-bd62-a7d58320a360', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('4184157e-aabb-4c0e-bd62-a7d58320a360', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('49fd5c71-3074-43a4-a98c-14ee66a479d4', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('49fd5c71-3074-43a4-a98c-14ee66a479d4', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('49fd5c71-3074-43a4-a98c-14ee66a479d4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('49fd5c71-3074-43a4-a98c-14ee66a479d4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('49fd5c71-3074-43a4-a98c-14ee66a479d4', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('49fd5c71-3074-43a4-a98c-14ee66a479d4', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('527ca52c-0d91-48e1-bcca-9a219cbba826', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('527ca52c-0d91-48e1-bcca-9a219cbba826', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('527ca52c-0d91-48e1-bcca-9a219cbba826', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('527ca52c-0d91-48e1-bcca-9a219cbba826', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('527ca52c-0d91-48e1-bcca-9a219cbba826', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('527ca52c-0d91-48e1-bcca-9a219cbba826', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('532fea33-01e7-4e11-b36d-2c6c87b7c2f0', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('532fea33-01e7-4e11-b36d-2c6c87b7c2f0', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('532fea33-01e7-4e11-b36d-2c6c87b7c2f0', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('532fea33-01e7-4e11-b36d-2c6c87b7c2f0', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('532fea33-01e7-4e11-b36d-2c6c87b7c2f0', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('532fea33-01e7-4e11-b36d-2c6c87b7c2f0', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('6964e7bd-9c16-4429-b211-fb6e3530660a', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6964e7bd-9c16-4429-b211-fb6e3530660a', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('6964e7bd-9c16-4429-b211-fb6e3530660a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6964e7bd-9c16-4429-b211-fb6e3530660a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6964e7bd-9c16-4429-b211-fb6e3530660a', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('6964e7bd-9c16-4429-b211-fb6e3530660a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('7ca4bbc2-2aed-4f10-8ba6-5ef091f031bd', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7ca4bbc2-2aed-4f10-8ba6-5ef091f031bd', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('7ca4bbc2-2aed-4f10-8ba6-5ef091f031bd', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7ca4bbc2-2aed-4f10-8ba6-5ef091f031bd', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7ca4bbc2-2aed-4f10-8ba6-5ef091f031bd', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('7ca4bbc2-2aed-4f10-8ba6-5ef091f031bd', 'long', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('944e6cb1-221d-4dd7-8592-63d9996b13d6', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('944e6cb1-221d-4dd7-8592-63d9996b13d6', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('944e6cb1-221d-4dd7-8592-63d9996b13d6', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9fbc6e13-9961-44d1-aaad-943a563280ca', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9fbc6e13-9961-44d1-aaad-943a563280ca', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('9fbc6e13-9961-44d1-aaad-943a563280ca', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9fbc6e13-9961-44d1-aaad-943a563280ca', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9fbc6e13-9961-44d1-aaad-943a563280ca', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('9fbc6e13-9961-44d1-aaad-943a563280ca', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('c72eec94-821c-4690-b712-d3922346a152', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c72eec94-821c-4690-b712-d3922346a152', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('c72eec94-821c-4690-b712-d3922346a152', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c72eec94-821c-4690-b712-d3922346a152', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c72eec94-821c-4690-b712-d3922346a152', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('c72eec94-821c-4690-b712-d3922346a152', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f994ad7c-29cb-45a4-aad8-22dda11212f1', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f994ad7c-29cb-45a4-aad8-22dda11212f1', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f994ad7c-29cb-45a4-aad8-22dda11212f1', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f994ad7c-29cb-45a4-aad8-22dda11212f1', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f994ad7c-29cb-45a4-aad8-22dda11212f1', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f994ad7c-29cb-45a4-aad8-22dda11212f1', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('3521606d-93ae-412a-b8ea-b47c13e268a5', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3521606d-93ae-412a-b8ea-b47c13e268a5', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('3521606d-93ae-412a-b8ea-b47c13e268a5', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3521606d-93ae-412a-b8ea-b47c13e268a5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3521606d-93ae-412a-b8ea-b47c13e268a5', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('3521606d-93ae-412a-b8ea-b47c13e268a5', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('5582546e-58c4-4024-a655-4b2ce5447be5', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5582546e-58c4-4024-a655-4b2ce5447be5', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('5582546e-58c4-4024-a655-4b2ce5447be5', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5582546e-58c4-4024-a655-4b2ce5447be5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('5582546e-58c4-4024-a655-4b2ce5447be5', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('5582546e-58c4-4024-a655-4b2ce5447be5', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a06590af-c70a-46f6-b7b7-0db4ce63c9bf', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config VALUES ('a06590af-c70a-46f6-b7b7-0db4ce63c9bf', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config VALUES ('a06590af-c70a-46f6-b7b7-0db4ce63c9bf', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config VALUES ('a06590af-c70a-46f6-b7b7-0db4ce63c9bf', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a06590af-c70a-46f6-b7b7-0db4ce63c9bf', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config VALUES ('a06590af-c70a-46f6-b7b7-0db4ce63c9bf', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a06590af-c70a-46f6-b7b7-0db4ce63c9bf', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config VALUES ('a06590af-c70a-46f6-b7b7-0db4ce63c9bf', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a06590af-c70a-46f6-b7b7-0db4ce63c9bf', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config VALUES ('3c9452c5-574b-4b30-a131-de2cb7aea0a9', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3c9452c5-574b-4b30-a131-de2cb7aea0a9', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('3c9452c5-574b-4b30-a131-de2cb7aea0a9', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3c9452c5-574b-4b30-a131-de2cb7aea0a9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3c9452c5-574b-4b30-a131-de2cb7aea0a9', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('3c9452c5-574b-4b30-a131-de2cb7aea0a9', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('3e42b64f-129a-4056-a5ad-b0eb31ececbb', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3e42b64f-129a-4056-a5ad-b0eb31ececbb', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('3e42b64f-129a-4056-a5ad-b0eb31ececbb', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3e42b64f-129a-4056-a5ad-b0eb31ececbb', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3e42b64f-129a-4056-a5ad-b0eb31ececbb', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('3e42b64f-129a-4056-a5ad-b0eb31ececbb', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('4410df26-8a03-4029-982c-3d70316c3993', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('4410df26-8a03-4029-982c-3d70316c3993', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('4410df26-8a03-4029-982c-3d70316c3993', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4410df26-8a03-4029-982c-3d70316c3993', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('4410df26-8a03-4029-982c-3d70316c3993', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('c3daecce-91bd-4a86-a2e8-0ab299352db9', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('c3daecce-91bd-4a86-a2e8-0ab299352db9', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('c3daecce-91bd-4a86-a2e8-0ab299352db9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c3daecce-91bd-4a86-a2e8-0ab299352db9', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('c3daecce-91bd-4a86-a2e8-0ab299352db9', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a2518a92-92e7-427a-9051-906b81ac588b', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('a2518a92-92e7-427a-9051-906b81ac588b', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('a2518a92-92e7-427a-9051-906b81ac588b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a2518a92-92e7-427a-9051-906b81ac588b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a2518a92-92e7-427a-9051-906b81ac588b', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('a2518a92-92e7-427a-9051-906b81ac588b', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a6041752-f8f2-4448-a751-05c5899b0fd0', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a6041752-f8f2-4448-a751-05c5899b0fd0', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('a6041752-f8f2-4448-a751-05c5899b0fd0', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a6041752-f8f2-4448-a751-05c5899b0fd0', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a6041752-f8f2-4448-a751-05c5899b0fd0', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('a6041752-f8f2-4448-a751-05c5899b0fd0', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('97dc6582-84a9-4c0f-a58b-5d9d42843226', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('97dc6582-84a9-4c0f-a58b-5d9d42843226', 'true', 'access.token.claim');
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

INSERT INTO public.realm VALUES ('662f6baf-45d0-437d-b002-c3f9ccdcb69d', 60, 300, 300, NULL, NULL, NULL, true, false, 0, NULL, 'book-store', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '5c7a7da9-bf8d-4b3d-b0a0-d4d7aada00ea', 1800, false, NULL, false, false, false, true, 0, 1, 30, 6, 'HmacSHA1', 'totp', '520fad15-8981-402d-a4a1-501d74ff1e5d', '2702976c-d524-4ac9-aecb-d15bdc2e106c', '5f092739-61f4-41c0-bba6-24beb17d3692', '066486dd-fef3-4290-a604-5a552c223679', '624a9489-d8ed-4b14-a78f-975f06c16818', 2592000, false, 900, true, false, '128ad414-638b-47ef-9596-d9296d7b785d', 0, false, 0, 0, 'c46a9467-cb5a-4888-b8c1-fd6623005642');
INSERT INTO public.realm VALUES ('546da6ad-8f65-4ce7-ba91-1346136c584b', 60, 300, 60, NULL, NULL, NULL, true, false, 0, NULL, 'master', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '15d3b017-9733-4647-9d40-09228e5022ce', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', '1831a8a7-b095-47cb-af32-34358c910c23', '9c2febd6-149f-4fb8-8894-5c6c672bb61a', 'eb488667-0489-455d-a132-6495674e968d', 'd74d02e8-2af3-43b9-9f80-031307f593a8', '87347a35-0c82-4c71-933f-620d48e892cc', 2592000, false, 900, true, false, '8e153df5-1eb8-4a51-964c-d232169522e8', 0, false, 0, 0, 'ed7bfe44-f63b-42ef-894f-e49a118089d6');


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicyReportOnly', '546da6ad-8f65-4ce7-ba91-1346136c584b', '');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xContentTypeOptions', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'nosniff');
INSERT INTO public.realm_attribute VALUES ('_browser_header.referrerPolicy', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'no-referrer');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xRobotsTag', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'none');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xFrameOptions', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'SAMEORIGIN');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicy', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xXSSProtection', '546da6ad-8f65-4ce7-ba91-1346136c584b', '1; mode=block');
INSERT INTO public.realm_attribute VALUES ('_browser_header.strictTransportSecurity', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'max-age=31536000; includeSubDomains');
INSERT INTO public.realm_attribute VALUES ('bruteForceProtected', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'false');
INSERT INTO public.realm_attribute VALUES ('permanentLockout', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'false');
INSERT INTO public.realm_attribute VALUES ('maxFailureWaitSeconds', '546da6ad-8f65-4ce7-ba91-1346136c584b', '900');
INSERT INTO public.realm_attribute VALUES ('minimumQuickLoginWaitSeconds', '546da6ad-8f65-4ce7-ba91-1346136c584b', '60');
INSERT INTO public.realm_attribute VALUES ('waitIncrementSeconds', '546da6ad-8f65-4ce7-ba91-1346136c584b', '60');
INSERT INTO public.realm_attribute VALUES ('quickLoginCheckMilliSeconds', '546da6ad-8f65-4ce7-ba91-1346136c584b', '1000');
INSERT INTO public.realm_attribute VALUES ('maxDeltaTimeSeconds', '546da6ad-8f65-4ce7-ba91-1346136c584b', '43200');
INSERT INTO public.realm_attribute VALUES ('failureFactor', '546da6ad-8f65-4ce7-ba91-1346136c584b', '30');
INSERT INTO public.realm_attribute VALUES ('realmReusableOtpCode', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'false');
INSERT INTO public.realm_attribute VALUES ('displayName', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'Keycloak');
INSERT INTO public.realm_attribute VALUES ('displayNameHtml', '546da6ad-8f65-4ce7-ba91-1346136c584b', '<div class="kc-logo-text"><span>Keycloak</span></div>');
INSERT INTO public.realm_attribute VALUES ('defaultSignatureAlgorithm', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'RS256');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', '546da6ad-8f65-4ce7-ba91-1346136c584b', 'false');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespan', '546da6ad-8f65-4ce7-ba91-1346136c584b', '5184000');
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

INSERT INTO public.realm_events_listeners VALUES ('546da6ad-8f65-4ce7-ba91-1346136c584b', 'jboss-logging');
INSERT INTO public.realm_events_listeners VALUES ('662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'jboss-logging');


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.realm_required_credential VALUES ('password', 'password', true, true, '546da6ad-8f65-4ce7-ba91-1346136c584b');
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

INSERT INTO public.redirect_uris VALUES ('cb62ec47-aa85-4d1e-9187-3f8218923968', '/realms/master/account/*');
INSERT INTO public.redirect_uris VALUES ('effe1a3e-a1ce-4c4f-80ce-cebeca28c9fe', '/realms/master/account/*');
INSERT INTO public.redirect_uris VALUES ('5d42a7c4-7ab0-4d78-9aec-481ac699856e', '/admin/master/console/*');
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

INSERT INTO public.required_action_provider VALUES ('fbe7b766-cc9b-42fe-bc4f-47b3fd0cc165', 'VERIFY_EMAIL', 'Verify Email', '546da6ad-8f65-4ce7-ba91-1346136c584b', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('051f44a1-d64a-4552-aaa5-7c4a89ab8ece', 'UPDATE_PROFILE', 'Update Profile', '546da6ad-8f65-4ce7-ba91-1346136c584b', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('9c70f3f6-50ff-400a-9a95-c2aceb44b30b', 'CONFIGURE_TOTP', 'Configure OTP', '546da6ad-8f65-4ce7-ba91-1346136c584b', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('f4b39413-0a16-40ea-a15b-d29c4f55cbcd', 'UPDATE_PASSWORD', 'Update Password', '546da6ad-8f65-4ce7-ba91-1346136c584b', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('f89cd7ed-e93c-4d27-98be-6c3c8265f690', 'TERMS_AND_CONDITIONS', 'Terms and Conditions', '546da6ad-8f65-4ce7-ba91-1346136c584b', false, false, 'TERMS_AND_CONDITIONS', 20);
INSERT INTO public.required_action_provider VALUES ('6eaf156f-9a78-4790-8fa5-aaa52639065e', 'delete_account', 'Delete Account', '546da6ad-8f65-4ce7-ba91-1346136c584b', false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider VALUES ('d55c635b-641a-42f8-bdb1-49f117816542', 'update_user_locale', 'Update User Locale', '546da6ad-8f65-4ce7-ba91-1346136c584b', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider VALUES ('653d1c24-d3a6-4b4b-89c5-8983105964c4', 'webauthn-register', 'Webauthn Register', '546da6ad-8f65-4ce7-ba91-1346136c584b', true, false, 'webauthn-register', 70);
INSERT INTO public.required_action_provider VALUES ('0ad52dab-e5c2-4fcd-88f8-e9205161c060', 'webauthn-register-passwordless', 'Webauthn Register Passwordless', '546da6ad-8f65-4ce7-ba91-1346136c584b', true, false, 'webauthn-register-passwordless', 80);
INSERT INTO public.required_action_provider VALUES ('991354a0-5eac-4c05-95c7-54ec40256254', 'CONFIGURE_TOTP', 'Configure OTP', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('d03fd41e-21c3-4fdf-bf6d-f4ec43d4803d', 'TERMS_AND_CONDITIONS', 'Terms and Conditions', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', false, false, 'TERMS_AND_CONDITIONS', 20);
INSERT INTO public.required_action_provider VALUES ('780df1a0-4ad0-4b09-9c97-ae07e982d15a', 'UPDATE_PASSWORD', 'Update Password', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('f8dfb286-a8ed-4ab9-afe2-7516e5dcdc5b', 'UPDATE_PROFILE', 'Update Profile', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('bb4e1d67-7f4f-4630-ad9f-7be2c1c9f01e', 'VERIFY_EMAIL', 'Verify Email', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('3b596529-e29d-4421-b794-ac797fcf99f5', 'delete_account', 'Delete Account', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider VALUES ('56983e40-c8bc-4e22-a31d-1fcdee855875', 'webauthn-register', 'Webauthn Register', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'webauthn-register', 70);
INSERT INTO public.required_action_provider VALUES ('8b832579-9fd4-4ce7-87cd-9e9d03972be5', 'webauthn-register-passwordless', 'Webauthn Register Passwordless', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'webauthn-register-passwordless', 80);
INSERT INTO public.required_action_provider VALUES ('5097b605-930f-44cb-b38f-8ee7016cf6a9', 'update_user_locale', 'Update User Locale', '662f6baf-45d0-437d-b002-c3f9ccdcb69d', true, false, 'update_user_locale', 1000);


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

INSERT INTO public.scope_mapping VALUES ('effe1a3e-a1ce-4c4f-80ce-cebeca28c9fe', '22c25144-3a27-450f-9886-cb5d0cdcca0c');
INSERT INTO public.scope_mapping VALUES ('effe1a3e-a1ce-4c4f-80ce-cebeca28c9fe', '77f21941-b7c0-460a-afa4-ae801a05fe47');
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

INSERT INTO public.user_entity VALUES ('07fd4473-eadd-4c02-ad9a-80f3fc54afb9', NULL, '069a209f-a511-4f0e-b8f8-ab15d3509b5a', false, true, NULL, NULL, NULL, '546da6ad-8f65-4ce7-ba91-1346136c584b', 'admin', 1699132497923, NULL, 0);
INSERT INTO public.user_entity VALUES ('b387010c-2582-48ce-aab7-f28371cd9fee', 'user@user', 'user@user', false, true, NULL, NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'user', 1699133057153, NULL, 0);
INSERT INTO public.user_entity VALUES ('24756198-f4c1-4899-8a0d-1bcadd115f33', 'admin@admin', 'admin@admin', false, true, NULL, NULL, NULL, '662f6baf-45d0-437d-b002-c3f9ccdcb69d', 'admin', 1699133075857, NULL, 0);


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

INSERT INTO public.user_role_mapping VALUES ('ed7bfe44-f63b-42ef-894f-e49a118089d6', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('04fc7638-765a-44b3-8d78-8a7be531c2ae', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('d2ebfafb-641f-4dd6-972c-7bbdb71b71e4', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('c93eacb1-bf51-4372-b250-e514649bcbd1', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('51f0857f-2a96-4984-8f09-c064f653368a', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('de4415f6-fda7-4241-aa87-dd2cc2a5e683', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('418f5a42-0a71-4209-812b-eb2dd0fe0f7d', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('b901ff2b-408c-47e0-8b7f-f29106146a0f', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('08ab57b3-ac92-4b74-aa30-d82909469454', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('0fafc8bc-e8b1-42bf-b089-634bbee5055f', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('5cc4a296-42d3-4377-9a94-dfddb13e441c', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('6337858a-9ab1-4f3e-8cfe-14256e8090f3', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('fbc8294d-c65f-400c-9bd7-ef42f0f43f9f', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('6680516d-c60b-41c5-95e1-6eb0d586bb00', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('8f06512f-a50f-4314-8257-da64532ab1f5', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('565e62fd-ce4d-4670-b6d3-9d798d646e41', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('e11cbc99-7792-41e7-b115-df473bbb7c35', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('12453ae0-1687-4908-82cd-81067fdf95d2', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('4e4ed502-f778-4a9d-ae43-701798885cbd', '07fd4473-eadd-4c02-ad9a-80f3fc54afb9');
INSERT INTO public.user_role_mapping VALUES ('c46a9467-cb5a-4888-b8c1-fd6623005642', 'b387010c-2582-48ce-aab7-f28371cd9fee');
INSERT INTO public.user_role_mapping VALUES ('c46a9467-cb5a-4888-b8c1-fd6623005642', '24756198-f4c1-4899-8a0d-1bcadd115f33');
INSERT INTO public.user_role_mapping VALUES ('aa5bd567-3466-41e3-bf8d-a6e1a13f9047', '24756198-f4c1-4899-8a0d-1bcadd115f33');


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

INSERT INTO public.web_origins VALUES ('5d42a7c4-7ab0-4d78-9aec-481ac699856e', '+');
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

--
-- Database "postgres" dump
--

\connect postgres

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
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--