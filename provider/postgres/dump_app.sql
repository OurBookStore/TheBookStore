--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
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
-- Name: book_store; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE book_store WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE book_store OWNER TO postgres;

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: app_user_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user_model (
                                       id bigint NOT NULL,
                                       email character varying(255),
                                       keycloak_id character varying(255),
                                       nickname character varying(255),
                                       password character varying(255),
                                       cart_id bigint
);


ALTER TABLE public.app_user_model OWNER TO postgres;

--
-- Name: app_user_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_user_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_model_id_seq OWNER TO postgres;

--
-- Name: app_user_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_user_model_id_seq OWNED BY public.app_user_model.id;


--
-- Name: author_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author_model (
                                     id bigint NOT NULL,
                                     country character varying(255),
                                     date_of_birth date,
                                     full_name character varying(255)
);


ALTER TABLE public.author_model OWNER TO postgres;

--
-- Name: author_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.author_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_model_id_seq OWNER TO postgres;

--
-- Name: author_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.author_model_id_seq OWNED BY public.author_model.id;


--
-- Name: book_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_model (
                                   id bigint NOT NULL,
                                   count integer NOT NULL,
                                   name character varying(255),
                                   price double precision NOT NULL
);


ALTER TABLE public.book_model OWNER TO postgres;

--
-- Name: book_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_model_id_seq OWNER TO postgres;

--
-- Name: book_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_model_id_seq OWNED BY public.book_model.id;


--
-- Name: cart_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_model (
    id bigint NOT NULL
);


ALTER TABLE public.cart_model OWNER TO postgres;

--
-- Name: cart_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_model_id_seq OWNER TO postgres;

--
-- Name: cart_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_model_id_seq OWNED BY public.cart_model.id;


--
-- Name: order_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_model (
                                    id bigint NOT NULL,
                                    address character varying(255),
                                    total_price double precision NOT NULL,
                                    app_user_id bigint
);


ALTER TABLE public.order_model OWNER TO postgres;

--
-- Name: order_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_model_id_seq OWNER TO postgres;

--
-- Name: order_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_model_id_seq OWNED BY public.order_model.id;


--
-- Name: order_position_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_position_model (
                                             id bigint NOT NULL,
                                             count integer NOT NULL,
                                             price double precision NOT NULL,
                                             book_id bigint,
                                             cart_id bigint,
                                             order_id bigint
);


ALTER TABLE public.order_position_model OWNER TO postgres;

--
-- Name: order_position_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_position_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_position_model_id_seq OWNER TO postgres;

--
-- Name: order_position_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_position_model_id_seq OWNED BY public.order_position_model.id;


--
-- Name: order_status_history_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_status_history_model (
                                                   id bigint NOT NULL,
                                                   date_time timestamp(6) without time zone,
                                                   is_actual boolean NOT NULL,
                                                   status character varying(255),
                                                   order_id bigint
);


ALTER TABLE public.order_status_history_model OWNER TO postgres;

--
-- Name: order_status_history_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_status_history_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_status_history_model_id_seq OWNER TO postgres;

--
-- Name: order_status_history_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_status_history_model_id_seq OWNED BY public.order_status_history_model.id;


--
-- Name: app_user_model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_model ALTER COLUMN id SET DEFAULT nextval('public.app_user_model_id_seq'::regclass);


--
-- Name: author_model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author_model ALTER COLUMN id SET DEFAULT nextval('public.author_model_id_seq'::regclass);


--
-- Name: book_model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_model ALTER COLUMN id SET DEFAULT nextval('public.book_model_id_seq'::regclass);


--
-- Name: cart_model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_model ALTER COLUMN id SET DEFAULT nextval('public.cart_model_id_seq'::regclass);


--
-- Name: order_model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_model ALTER COLUMN id SET DEFAULT nextval('public.order_model_id_seq'::regclass);


--
-- Name: order_position_model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_position_model ALTER COLUMN id SET DEFAULT nextval('public.order_position_model_id_seq'::regclass);


--
-- Name: order_status_history_model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_history_model ALTER COLUMN id SET DEFAULT nextval('public.order_status_history_model_id_seq'::regclass);


--
-- Data for Name: app_user_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.app_user_model VALUES (1, 'admin@admin', 'e5110ac9-e1a4-467d-82ba-55a8e7991688', 'admin', 'admin', 1);
INSERT INTO public.app_user_model VALUES (2, 'user@user', '8a398506-63bd-403b-9ce7-3b2dc1678001', 'user', 'user', 2);


--
-- Data for Name: author_model; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: book_model; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: cart_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cart_model VALUES (1);
INSERT INTO public.cart_model VALUES (2);


--
-- Data for Name: order_model; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: order_position_model; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: order_status_history_model; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: app_user_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_user_model_id_seq', 2, true);


--
-- Name: author_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.author_model_id_seq', 1, false);


--
-- Name: book_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_model_id_seq', 1, false);


--
-- Name: cart_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_model_id_seq', 2, true);


--
-- Name: order_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_model_id_seq', 1, false);


--
-- Name: order_position_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_position_model_id_seq', 1, false);


--
-- Name: order_status_history_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_status_history_model_id_seq', 1, false);


--
-- Name: app_user_model app_user_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_model
    ADD CONSTRAINT app_user_model_pkey PRIMARY KEY (id);


--
-- Name: author_model author_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author_model
    ADD CONSTRAINT author_model_pkey PRIMARY KEY (id);


--
-- Name: book_model book_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_model
    ADD CONSTRAINT book_model_pkey PRIMARY KEY (id);


--
-- Name: cart_model cart_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_model
    ADD CONSTRAINT cart_model_pkey PRIMARY KEY (id);


--
-- Name: order_model order_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_model
    ADD CONSTRAINT order_model_pkey PRIMARY KEY (id);


--
-- Name: order_position_model order_position_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_position_model
    ADD CONSTRAINT order_position_model_pkey PRIMARY KEY (id);


--
-- Name: order_status_history_model order_status_history_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_history_model
    ADD CONSTRAINT order_status_history_model_pkey PRIMARY KEY (id);


--
-- Name: app_user_model uk_91d0708apcws8l9ymel9cktju; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_model
    ADD CONSTRAINT uk_91d0708apcws8l9ymel9cktju UNIQUE (keycloak_id);


--
-- Name: order_status_history_model ukh0a02jy038c5hi701gt0205lp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_history_model
    ADD CONSTRAINT ukh0a02jy038c5hi701gt0205lp UNIQUE (order_id, status);


--
-- Name: idx7998rlv3aq5q68hhiuudkktlg; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx7998rlv3aq5q68hhiuudkktlg ON public.order_model USING btree (app_user_id);


--
-- Name: idx91d0708apcws8l9ymel9cktju; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx91d0708apcws8l9ymel9cktju ON public.app_user_model USING btree (keycloak_id);


--
-- Name: order_model fk67x3rqt5g0e5ksdtbnuahy8p1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_model
    ADD CONSTRAINT fk67x3rqt5g0e5ksdtbnuahy8p1 FOREIGN KEY (app_user_id) REFERENCES public.app_user_model(id);


--
-- Name: order_position_model fkaabd4q0h6x4daywnj4mbc4ebr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_position_model
    ADD CONSTRAINT fkaabd4q0h6x4daywnj4mbc4ebr FOREIGN KEY (book_id) REFERENCES public.book_model(id);


--
-- Name: order_position_model fkbei934attcbj7udts8we6sov0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_position_model
    ADD CONSTRAINT fkbei934attcbj7udts8we6sov0 FOREIGN KEY (cart_id) REFERENCES public.cart_model(id);


--
-- Name: order_position_model fkelu1l2yurfuvq7ah979q5ot2h; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_position_model
    ADD CONSTRAINT fkelu1l2yurfuvq7ah979q5ot2h FOREIGN KEY (order_id) REFERENCES public.order_model(id);


--
-- Name: app_user_model fkp04njt87rh9c5muq69y6ey5kk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_model
    ADD CONSTRAINT fkp04njt87rh9c5muq69y6ey5kk FOREIGN KEY (cart_id) REFERENCES public.cart_model(id);


--
-- Name: order_status_history_model fkybgu7daw3vh3qdj59c6pqxse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status_history_model
    ADD CONSTRAINT fkybgu7daw3vh3qdj59c6pqxse FOREIGN KEY (order_id) REFERENCES public.order_model(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

