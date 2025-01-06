SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

GRANT USAGE ON SCHEMA public TO postgres;
GRANT CREATE ON SCHEMA public TO postgres;



CREATE TABLE public.check_ins
(
    user_id bigint NOT NULL,
    gym_id  bigint NOT NULL,
    date    text   NOT NULL
);


ALTER TABLE public.check_ins
    OWNER TO postgres;

CREATE TABLE public.gym_signup
(
    user_id bigint NOT NULL,
    gym_id  bigint NOT NULL,
    month   text   NOT NULL
);


ALTER TABLE public.gym_signup
    OWNER TO postgres;

CREATE TABLE public.gyms
(
    id              bigint  NOT NULL,
    name            text    NOT NULL,
    address         text    NOT NULL,
    latitude        numeric NOT NULL,
    longitude       numeric NOT NULL,
    phone_number    text    NOT NULL,
    working_hours   text    NOT NULL,
    gym_description text
);


ALTER TABLE public.gyms
    OWNER TO postgres;


CREATE SEQUENCE public.gyms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gyms_id_seq OWNER TO postgres;

ALTER SEQUENCE public.gyms_id_seq OWNED BY public.gyms.id;

CREATE TABLE public.pool_cards
(
    id         bigint NOT NULL,
    card_numbr text   NOT NULL
);


ALTER TABLE public.pool_cards
    OWNER TO postgres;


CREATE SEQUENCE public.pool_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pool_cards_id_seq OWNER TO postgres;

ALTER SEQUENCE public.pool_cards_id_seq OWNED BY public.pool_cards.id;

CREATE TABLE public.refresh_tokens
(
    id         bigint                   NOT NULL,
    user_id    bigint                   NOT NULL,
    token      text                     NOT NULL,
    expires_at timestamp with time zone NOT NULL
);


ALTER TABLE public.refresh_tokens
    OWNER TO postgres;

CREATE SEQUENCE public.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.refresh_tokens_id_seq OWNER TO postgres;


ALTER SEQUENCE public.refresh_tokens_id_seq OWNED BY public.refresh_tokens.id;


CREATE TABLE public.roles
(
    id   bigint NOT NULL,
    role text   NOT NULL
);


ALTER TABLE public.roles
    OWNER TO postgres;

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;

CREATE TABLE public.user_pool_cards
(
    id           bigint NOT NULL,
    user_id      bigint NOT NULL,
    pool_card_id bigint NOT NULL,
    date         date
);


ALTER TABLE public.user_pool_cards
    OWNER TO postgres;

CREATE SEQUENCE public.user_pool_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_pool_cards_id_seq OWNER TO postgres;

ALTER SEQUENCE public.user_pool_cards_id_seq OWNED BY public.user_pool_cards.id;

CREATE TABLE public.users
(
    id                   bigint                                                                               NOT NULL,
    first_name           text                                                                                 NOT NULL,
    last_name            text                                                                                 NOT NULL,
    email                text                                                                                 NOT NULL,
    phone_number         text                                                                                 NOT NULL,
    role_id              bigint  DEFAULT 1                                                                    NOT NULL,
    must_change_password boolean DEFAULT true                                                                 NOT NULL,
    password_hash        text    DEFAULT '$2a$13$OkAffWf0IE0FtwUaV7A4vuIU.VBsbMrrgazybOsiSN.Y5oIZ7LIw2'::text NOT NULL
);


ALTER TABLE public.users
    OWNER TO postgres;

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;

ALTER TABLE ONLY public.gyms
    ALTER COLUMN id SET DEFAULT nextval('public.gyms_id_seq'::regclass);


ALTER TABLE ONLY public.pool_cards
    ALTER COLUMN id SET DEFAULT nextval('public.pool_cards_id_seq'::regclass);

ALTER TABLE ONLY public.refresh_tokens
    ALTER COLUMN id SET DEFAULT nextval('public.refresh_tokens_id_seq'::regclass);

ALTER TABLE ONLY public.roles
    ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);

ALTER TABLE ONLY public.user_pool_cards
    ALTER COLUMN id SET DEFAULT nextval('public.user_pool_cards_id_seq'::regclass);

ALTER TABLE ONLY public.users
    ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);

SELECT pg_catalog.setval('public.gyms_id_seq', 27, true);

SELECT pg_catalog.setval('public.pool_cards_id_seq', 1, false);

SELECT pg_catalog.setval('public.refresh_tokens_id_seq', 38, true);

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);

SELECT pg_catalog.setval('public.user_pool_cards_id_seq', 1, false);

SELECT pg_catalog.setval('public.users_id_seq', 23, true);

ALTER TABLE ONLY public.gyms
    ADD CONSTRAINT gyms_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.check_ins
    ADD CONSTRAINT pk_user_gym_date PRIMARY KEY (user_id, gym_id, date);

ALTER TABLE ONLY public.pool_cards
    ADD CONSTRAINT pool_cards_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id, role);

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "unique" UNIQUE (email);

ALTER TABLE ONLY public.gym_signup
    ADD CONSTRAINT user_gym_unique_key UNIQUE (user_id, gym_id, month);

ALTER TABLE ONLY public.user_pool_cards
    ADD CONSTRAINT user_pool_cards_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.gym_signup
    ADD CONSTRAINT gym_fkey FOREIGN KEY (gym_id) REFERENCES public.gyms (id) NOT VALID;

ALTER TABLE ONLY public.check_ins
    ADD CONSTRAINT gym_fkey FOREIGN KEY (gym_id) REFERENCES public.gyms (id);

ALTER TABLE ONLY public.user_pool_cards
    ADD CONSTRAINT pool_cards_fkey FOREIGN KEY (pool_card_id) REFERENCES public.pool_cards (id) NOT VALID;

ALTER TABLE ONLY public.gym_signup
    ADD CONSTRAINT user_fkey FOREIGN KEY (user_id) REFERENCES public.users (id) NOT VALID;

ALTER TABLE ONLY public.check_ins
    ADD CONSTRAINT user_fkey FOREIGN KEY (user_id) REFERENCES public.users (id);

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT user_fkey FOREIGN KEY (user_id) REFERENCES public.users (id);

ALTER TABLE ONLY public.user_pool_cards
    ADD CONSTRAINT users_fkey FOREIGN KEY (user_id) REFERENCES public.users (id) NOT VALID;