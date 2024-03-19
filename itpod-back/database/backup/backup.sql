--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    city character varying(255),
    mail character varying(255),
    phone character varying(255),
    address character varying(255),
    hours character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    map text
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.addresses_id_seq OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: addresses_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses_localizations_links (
    id integer NOT NULL,
    address_id integer,
    inv_address_id integer,
    address_order double precision
);


ALTER TABLE public.addresses_localizations_links OWNER TO postgres;

--
-- Name: addresses_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addresses_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.addresses_localizations_links_id_seq OWNER TO postgres;

--
-- Name: addresses_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addresses_localizations_links_id_seq OWNED BY public.addresses_localizations_links.id;


--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_permissions OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_id_seq OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);


ALTER TABLE public.admin_permissions_role_links OWNER TO postgres;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNER TO postgres;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNED BY public.admin_permissions_role_links.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_roles OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_roles_id_seq OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_id_seq OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users_roles_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_order double precision,
    user_order double precision
);


ALTER TABLE public.admin_users_roles_links OWNER TO postgres;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_roles_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNER TO postgres;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNED BY public.admin_users_roles_links.id;


--
-- Name: audience; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audience (
    id integer NOT NULL,
    name character varying(255),
    key character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.audience OWNER TO postgres;

--
-- Name: audience_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audience_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audience_id_seq OWNER TO postgres;

--
-- Name: audience_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audience_id_seq OWNED BY public.audience.id;


--
-- Name: components_page_components_cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_page_components_cards (
    id integer NOT NULL,
    nums_in_row integer
);


ALTER TABLE public.components_page_components_cards OWNER TO postgres;

--
-- Name: components_page_components_cards_components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_page_components_cards_components (
    id integer NOT NULL,
    entity_id integer,
    component_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_page_components_cards_components OWNER TO postgres;

--
-- Name: components_page_components_cards_components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_page_components_cards_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_page_components_cards_components_id_seq OWNER TO postgres;

--
-- Name: components_page_components_cards_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_page_components_cards_components_id_seq OWNED BY public.components_page_components_cards_components.id;


--
-- Name: components_page_components_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_page_components_cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_page_components_cards_id_seq OWNER TO postgres;

--
-- Name: components_page_components_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_page_components_cards_id_seq OWNED BY public.components_page_components_cards.id;


--
-- Name: components_page_components_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_page_components_pages (
    id integer NOT NULL
);


ALTER TABLE public.components_page_components_pages OWNER TO postgres;

--
-- Name: components_page_components_pages_components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_page_components_pages_components (
    id integer NOT NULL,
    entity_id integer,
    component_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_page_components_pages_components OWNER TO postgres;

--
-- Name: components_page_components_pages_components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_page_components_pages_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_page_components_pages_components_id_seq OWNER TO postgres;

--
-- Name: components_page_components_pages_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_page_components_pages_components_id_seq OWNED BY public.components_page_components_pages_components.id;


--
-- Name: components_page_components_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_page_components_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_page_components_pages_id_seq OWNER TO postgres;

--
-- Name: components_page_components_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_page_components_pages_id_seq OWNED BY public.components_page_components_pages.id;


--
-- Name: components_page_components_partners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_page_components_partners (
    id integer NOT NULL,
    form_description character varying(255)
);


ALTER TABLE public.components_page_components_partners OWNER TO postgres;

--
-- Name: components_page_components_partners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_page_components_partners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_page_components_partners_id_seq OWNER TO postgres;

--
-- Name: components_page_components_partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_page_components_partners_id_seq OWNED BY public.components_page_components_partners.id;


--
-- Name: components_page_components_servers_sliders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_page_components_servers_sliders (
    id integer NOT NULL
);


ALTER TABLE public.components_page_components_servers_sliders OWNER TO postgres;

--
-- Name: components_page_components_servers_sliders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_page_components_servers_sliders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_page_components_servers_sliders_id_seq OWNER TO postgres;

--
-- Name: components_page_components_servers_sliders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_page_components_servers_sliders_id_seq OWNED BY public.components_page_components_servers_sliders.id;


--
-- Name: components_page_components_servers_sliders_servers_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_page_components_servers_sliders_servers_links (
    id integer NOT NULL,
    servers_slider_id integer,
    server_id integer,
    server_order double precision
);


ALTER TABLE public.components_page_components_servers_sliders_servers_links OWNER TO postgres;

--
-- Name: components_page_components_servers_sliders_servers_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_page_components_servers_sliders_servers_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_page_components_servers_sliders_servers_links_id_seq OWNER TO postgres;

--
-- Name: components_page_components_servers_sliders_servers_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_page_components_servers_sliders_servers_links_id_seq OWNED BY public.components_page_components_servers_sliders_servers_links.id;


--
-- Name: components_utils_components_block_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_utils_components_block_settings (
    id integer NOT NULL,
    background character varying(255),
    layout character varying(255),
    title character varying(255),
    description character varying(255),
    padding character varying(255),
    merge_text boolean
);


ALTER TABLE public.components_utils_components_block_settings OWNER TO postgres;

--
-- Name: components_utils_components_block_settings_components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_utils_components_block_settings_components (
    id integer NOT NULL,
    entity_id integer,
    component_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_utils_components_block_settings_components OWNER TO postgres;

--
-- Name: components_utils_components_block_settings_components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_utils_components_block_settings_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_utils_components_block_settings_components_id_seq OWNER TO postgres;

--
-- Name: components_utils_components_block_settings_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_utils_components_block_settings_components_id_seq OWNED BY public.components_utils_components_block_settings_components.id;


--
-- Name: components_utils_components_block_settings_form_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_utils_components_block_settings_form_links (
    id integer NOT NULL,
    block_settings_id integer,
    form_id integer
);


ALTER TABLE public.components_utils_components_block_settings_form_links OWNER TO postgres;

--
-- Name: components_utils_components_block_settings_form_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_utils_components_block_settings_form_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_utils_components_block_settings_form_links_id_seq OWNER TO postgres;

--
-- Name: components_utils_components_block_settings_form_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_utils_components_block_settings_form_links_id_seq OWNED BY public.components_utils_components_block_settings_form_links.id;


--
-- Name: components_utils_components_block_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_utils_components_block_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_utils_components_block_settings_id_seq OWNER TO postgres;

--
-- Name: components_utils_components_block_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_utils_components_block_settings_id_seq OWNED BY public.components_utils_components_block_settings.id;


--
-- Name: components_utils_components_cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_utils_components_cards (
    id integer NOT NULL,
    title character varying(255),
    description character varying(255)
);


ALTER TABLE public.components_utils_components_cards OWNER TO postgres;

--
-- Name: components_utils_components_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_utils_components_cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_utils_components_cards_id_seq OWNER TO postgres;

--
-- Name: components_utils_components_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_utils_components_cards_id_seq OWNED BY public.components_utils_components_cards.id;


--
-- Name: components_utils_components_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_utils_components_links (
    id integer NOT NULL,
    link_text character varying(255),
    url character varying(255)
);


ALTER TABLE public.components_utils_components_links OWNER TO postgres;

--
-- Name: components_utils_components_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_utils_components_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_utils_components_links_id_seq OWNER TO postgres;

--
-- Name: components_utils_components_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_utils_components_links_id_seq OWNED BY public.components_utils_components_links.id;


--
-- Name: components_utils_components_page_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_utils_components_page_links (
    id integer NOT NULL,
    image character varying(255),
    disabled boolean
);


ALTER TABLE public.components_utils_components_page_links OWNER TO postgres;

--
-- Name: components_utils_components_page_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_utils_components_page_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_utils_components_page_links_id_seq OWNER TO postgres;

--
-- Name: components_utils_components_page_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_utils_components_page_links_id_seq OWNED BY public.components_utils_components_page_links.id;


--
-- Name: components_utils_components_page_links_product_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components_utils_components_page_links_product_links (
    id integer NOT NULL,
    page_link_id integer,
    product_id integer
);


ALTER TABLE public.components_utils_components_page_links_product_links OWNER TO postgres;

--
-- Name: components_utils_components_page_links_product_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_utils_components_page_links_product_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_utils_components_page_links_product_links_id_seq OWNER TO postgres;

--
-- Name: components_utils_components_page_links_product_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_utils_components_page_links_product_links_id_seq OWNED BY public.components_utils_components_page_links_product_links.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    type character varying(255),
    register character varying(255),
    time_start timestamp(6) without time zone,
    time_end timestamp(6) without time zone,
    content text,
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    title character varying(255)
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: events_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events_localizations_links (
    id integer NOT NULL,
    event_id integer,
    inv_event_id integer,
    event_order double precision
);


ALTER TABLE public.events_localizations_links OWNER TO postgres;

--
-- Name: events_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_localizations_links_id_seq OWNER TO postgres;

--
-- Name: events_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_localizations_links_id_seq OWNED BY public.events_localizations_links.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: files_folder_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_folder_links (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_order double precision
);


ALTER TABLE public.files_folder_links OWNER TO postgres;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_folder_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_folder_links_id_seq OWNER TO postgres;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_folder_links_id_seq OWNED BY public.files_folder_links.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_morphs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_related_morphs (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.files_related_morphs OWNER TO postgres;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_related_morphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_related_morphs_id_seq OWNER TO postgres;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_related_morphs_id_seq OWNED BY public.files_related_morphs.id;


--
-- Name: form_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form_fields (
    id integer NOT NULL,
    name character varying(255),
    placeholder character varying(255),
    required boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    type character varying(255)
);


ALTER TABLE public.form_fields OWNER TO postgres;

--
-- Name: form_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.form_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.form_fields_id_seq OWNER TO postgres;

--
-- Name: form_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.form_fields_id_seq OWNED BY public.form_fields.id;


--
-- Name: form_fields_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form_fields_localizations_links (
    id integer NOT NULL,
    form_field_id integer,
    inv_form_field_id integer,
    form_field_order double precision
);


ALTER TABLE public.form_fields_localizations_links OWNER TO postgres;

--
-- Name: form_fields_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.form_fields_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.form_fields_localizations_links_id_seq OWNER TO postgres;

--
-- Name: form_fields_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.form_fields_localizations_links_id_seq OWNED BY public.form_fields_localizations_links.id;


--
-- Name: forms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forms (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    send_text character varying(255),
    privacy boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    success_message text
);


ALTER TABLE public.forms OWNER TO postgres;

--
-- Name: forms_form_fields_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forms_form_fields_links (
    id integer NOT NULL,
    form_id integer,
    form_field_id integer,
    form_field_order double precision
);


ALTER TABLE public.forms_form_fields_links OWNER TO postgres;

--
-- Name: forms_form_fields_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forms_form_fields_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forms_form_fields_links_id_seq OWNER TO postgres;

--
-- Name: forms_form_fields_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forms_form_fields_links_id_seq OWNED BY public.forms_form_fields_links.id;


--
-- Name: forms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forms_id_seq OWNER TO postgres;

--
-- Name: forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forms_id_seq OWNED BY public.forms.id;


--
-- Name: forms_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forms_localizations_links (
    id integer NOT NULL,
    form_id integer,
    inv_form_id integer,
    form_order double precision
);


ALTER TABLE public.forms_localizations_links OWNER TO postgres;

--
-- Name: forms_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forms_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forms_localizations_links_id_seq OWNER TO postgres;

--
-- Name: forms_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forms_localizations_links_id_seq OWNED BY public.forms_localizations_links.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.i18n_locale OWNER TO postgres;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.i18n_locale_id_seq OWNER TO postgres;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_items (
    id integer NOT NULL,
    "order" integer,
    title character varying(255),
    url character varying(255),
    target character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.menu_items OWNER TO postgres;

--
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_items_id_seq OWNER TO postgres;

--
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_items_id_seq OWNED BY public.menu_items.id;


--
-- Name: menu_items_parent_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_items_parent_links (
    id integer NOT NULL,
    menu_item_id integer,
    inv_menu_item_id integer
);


ALTER TABLE public.menu_items_parent_links OWNER TO postgres;

--
-- Name: menu_items_parent_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_items_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_items_parent_links_id_seq OWNER TO postgres;

--
-- Name: menu_items_parent_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_items_parent_links_id_seq OWNED BY public.menu_items_parent_links.id;


--
-- Name: menu_items_root_menu_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_items_root_menu_links (
    id integer NOT NULL,
    menu_item_id integer,
    menu_id integer,
    menu_item_order double precision
);


ALTER TABLE public.menu_items_root_menu_links OWNER TO postgres;

--
-- Name: menu_items_root_menu_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_items_root_menu_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_items_root_menu_links_id_seq OWNER TO postgres;

--
-- Name: menu_items_root_menu_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_items_root_menu_links_id_seq OWNED BY public.menu_items_root_menu_links.id;


--
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menus (
    id integer NOT NULL,
    title character varying(255),
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.menus OWNER TO postgres;

--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menus_id_seq OWNER TO postgres;

--
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;


--
-- Name: navigations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.navigations (
    id integer NOT NULL,
    name text,
    slug character varying(255),
    visible boolean,
    locale_code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.navigations OWNER TO postgres;

--
-- Name: navigations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.navigations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navigations_id_seq OWNER TO postgres;

--
-- Name: navigations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.navigations_id_seq OWNED BY public.navigations.id;


--
-- Name: navigations_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.navigations_items (
    id integer NOT NULL,
    title text,
    type character varying(255),
    path text,
    external_path text,
    ui_router_key character varying(255),
    menu_attached boolean,
    "order" integer,
    collapsed boolean,
    additional_fields jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.navigations_items OWNER TO postgres;

--
-- Name: navigations_items_audience_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.navigations_items_audience_links (
    id integer NOT NULL,
    navigation_item_id integer,
    audience_id integer,
    audience_order double precision
);


ALTER TABLE public.navigations_items_audience_links OWNER TO postgres;

--
-- Name: navigations_items_audience_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.navigations_items_audience_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navigations_items_audience_links_id_seq OWNER TO postgres;

--
-- Name: navigations_items_audience_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.navigations_items_audience_links_id_seq OWNED BY public.navigations_items_audience_links.id;


--
-- Name: navigations_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.navigations_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navigations_items_id_seq OWNER TO postgres;

--
-- Name: navigations_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.navigations_items_id_seq OWNED BY public.navigations_items.id;


--
-- Name: navigations_items_master_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.navigations_items_master_links (
    id integer NOT NULL,
    navigation_item_id integer,
    navigation_id integer,
    navigation_item_order double precision
);


ALTER TABLE public.navigations_items_master_links OWNER TO postgres;

--
-- Name: navigations_items_master_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.navigations_items_master_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navigations_items_master_links_id_seq OWNER TO postgres;

--
-- Name: navigations_items_master_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.navigations_items_master_links_id_seq OWNED BY public.navigations_items_master_links.id;


--
-- Name: navigations_items_parent_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.navigations_items_parent_links (
    id integer NOT NULL,
    navigation_item_id integer,
    inv_navigation_item_id integer
);


ALTER TABLE public.navigations_items_parent_links OWNER TO postgres;

--
-- Name: navigations_items_parent_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.navigations_items_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navigations_items_parent_links_id_seq OWNER TO postgres;

--
-- Name: navigations_items_parent_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.navigations_items_parent_links_id_seq OWNED BY public.navigations_items_parent_links.id;


--
-- Name: navigations_items_related; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.navigations_items_related (
    id integer NOT NULL,
    related_id character varying(255),
    related_type character varying(255),
    field character varying(255),
    "order" integer,
    master character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.navigations_items_related OWNER TO postgres;

--
-- Name: navigations_items_related_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.navigations_items_related_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navigations_items_related_id_seq OWNER TO postgres;

--
-- Name: navigations_items_related_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.navigations_items_related_id_seq OWNED BY public.navigations_items_related.id;


--
-- Name: navigations_items_related_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.navigations_items_related_links (
    id integer NOT NULL,
    navigation_item_id integer,
    navigations_items_related_id integer
);


ALTER TABLE public.navigations_items_related_links OWNER TO postgres;

--
-- Name: navigations_items_related_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.navigations_items_related_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navigations_items_related_links_id_seq OWNER TO postgres;

--
-- Name: navigations_items_related_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.navigations_items_related_links_id_seq OWNED BY public.navigations_items_related_links.id;


--
-- Name: navigations_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.navigations_localizations_links (
    id integer NOT NULL,
    navigation_id integer,
    inv_navigation_id integer,
    navigation_order double precision
);


ALTER TABLE public.navigations_localizations_links OWNER TO postgres;

--
-- Name: navigations_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.navigations_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navigations_localizations_links_id_seq OWNER TO postgres;

--
-- Name: navigations_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.navigations_localizations_links_id_seq OWNED BY public.navigations_localizations_links.id;


--
-- Name: news_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news_tags (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.news_tags OWNER TO postgres;

--
-- Name: news_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_tags_id_seq OWNER TO postgres;

--
-- Name: news_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_tags_id_seq OWNED BY public.news_tags.id;


--
-- Name: news_tags_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news_tags_localizations_links (
    id integer NOT NULL,
    news_tag_id integer,
    inv_news_tag_id integer,
    news_tag_order double precision
);


ALTER TABLE public.news_tags_localizations_links OWNER TO postgres;

--
-- Name: news_tags_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_tags_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_tags_localizations_links_id_seq OWNER TO postgres;

--
-- Name: news_tags_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_tags_localizations_links_id_seq OWNED BY public.news_tags_localizations_links.id;


--
-- Name: newsletters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.newsletters (
    id integer NOT NULL,
    content text,
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    title character varying(255)
);


ALTER TABLE public.newsletters OWNER TO postgres;

--
-- Name: newsletters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.newsletters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.newsletters_id_seq OWNER TO postgres;

--
-- Name: newsletters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.newsletters_id_seq OWNED BY public.newsletters.id;


--
-- Name: newsletters_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.newsletters_localizations_links (
    id integer NOT NULL,
    newsletter_id integer,
    inv_newsletter_id integer,
    newsletter_order double precision
);


ALTER TABLE public.newsletters_localizations_links OWNER TO postgres;

--
-- Name: newsletters_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.newsletters_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.newsletters_localizations_links_id_seq OWNER TO postgres;

--
-- Name: newsletters_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.newsletters_localizations_links_id_seq OWNED BY public.newsletters_localizations_links.id;


--
-- Name: newsletters_news_tags_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.newsletters_news_tags_links (
    id integer NOT NULL,
    newsletter_id integer,
    news_tag_id integer,
    news_tag_order double precision,
    newsletter_order double precision
);


ALTER TABLE public.newsletters_news_tags_links OWNER TO postgres;

--
-- Name: newsletters_news_tags_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.newsletters_news_tags_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.newsletters_news_tags_links_id_seq OWNER TO postgres;

--
-- Name: newsletters_news_tags_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.newsletters_news_tags_links_id_seq OWNED BY public.newsletters_news_tags_links.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    title character varying(255),
    locale character varying(255),
    description character varying(255)
);


ALTER TABLE public.pages OWNER TO postgres;

--
-- Name: pages_components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages_components (
    id integer NOT NULL,
    entity_id integer,
    component_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.pages_components OWNER TO postgres;

--
-- Name: pages_components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_components_id_seq OWNER TO postgres;

--
-- Name: pages_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_components_id_seq OWNED BY public.pages_components.id;


--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_id_seq OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: pages_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages_localizations_links (
    id integer NOT NULL,
    page_id integer,
    inv_page_id integer,
    page_order double precision
);


ALTER TABLE public.pages_localizations_links OWNER TO postgres;

--
-- Name: pages_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_localizations_links_id_seq OWNER TO postgres;

--
-- Name: pages_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_localizations_links_id_seq OWNED BY public.pages_localizations_links.id;


--
-- Name: partners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partners (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    link character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.partners OWNER TO postgres;

--
-- Name: partners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.partners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.partners_id_seq OWNER TO postgres;

--
-- Name: partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.partners_id_seq OWNED BY public.partners.id;


--
-- Name: partners_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partners_localizations_links (
    id integer NOT NULL,
    partner_id integer,
    inv_partner_id integer,
    partner_order double precision
);


ALTER TABLE public.partners_localizations_links OWNER TO postgres;

--
-- Name: partners_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.partners_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.partners_localizations_links_id_seq OWNER TO postgres;

--
-- Name: partners_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.partners_localizations_links_id_seq OWNED BY public.partners_localizations_links.id;


--
-- Name: partners_partners_type_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partners_partners_type_links (
    id integer NOT NULL,
    partner_id integer,
    partners_type_id integer,
    partner_order double precision
);


ALTER TABLE public.partners_partners_type_links OWNER TO postgres;

--
-- Name: partners_partners_type_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.partners_partners_type_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.partners_partners_type_links_id_seq OWNER TO postgres;

--
-- Name: partners_partners_type_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.partners_partners_type_links_id_seq OWNED BY public.partners_partners_type_links.id;


--
-- Name: partners_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partners_types (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.partners_types OWNER TO postgres;

--
-- Name: partners_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.partners_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.partners_types_id_seq OWNER TO postgres;

--
-- Name: partners_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.partners_types_id_seq OWNED BY public.partners_types.id;


--
-- Name: partners_types_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partners_types_localizations_links (
    id integer NOT NULL,
    partners_type_id integer,
    inv_partners_type_id integer,
    partners_type_order double precision
);


ALTER TABLE public.partners_types_localizations_links OWNER TO postgres;

--
-- Name: partners_types_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.partners_types_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.partners_types_localizations_links_id_seq OWNER TO postgres;

--
-- Name: partners_types_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.partners_types_localizations_links_id_seq OWNED BY public.partners_types_localizations_links.id;


--
-- Name: privacy_policies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privacy_policies (
    id integer NOT NULL,
    privacy text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.privacy_policies OWNER TO postgres;

--
-- Name: privacy_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.privacy_policies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.privacy_policies_id_seq OWNER TO postgres;

--
-- Name: privacy_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.privacy_policies_id_seq OWNED BY public.privacy_policies.id;


--
-- Name: privacy_policies_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privacy_policies_localizations_links (
    id integer NOT NULL,
    privacy_policy_id integer,
    inv_privacy_policy_id integer,
    privacy_policy_order double precision
);


ALTER TABLE public.privacy_policies_localizations_links OWNER TO postgres;

--
-- Name: privacy_policies_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.privacy_policies_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.privacy_policies_localizations_links_id_seq OWNER TO postgres;

--
-- Name: privacy_policies_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.privacy_policies_localizations_links_id_seq OWNED BY public.privacy_policies_localizations_links.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    disabled boolean,
    slug character varying(255),
    title character varying(255)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: products_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_localizations_links (
    id integer NOT NULL,
    product_id integer,
    inv_product_id integer,
    product_order double precision
);


ALTER TABLE public.products_localizations_links OWNER TO postgres;

--
-- Name: products_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_localizations_links_id_seq OWNER TO postgres;

--
-- Name: products_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_localizations_links_id_seq OWNED BY public.products_localizations_links.id;


--
-- Name: server_processors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.server_processors (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.server_processors OWNER TO postgres;

--
-- Name: server_processors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.server_processors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.server_processors_id_seq OWNER TO postgres;

--
-- Name: server_processors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.server_processors_id_seq OWNED BY public.server_processors.id;


--
-- Name: server_series; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.server_series (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    title character varying(255),
    slug character varying(255)
);


ALTER TABLE public.server_series OWNER TO postgres;

--
-- Name: server_series_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.server_series_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.server_series_id_seq OWNER TO postgres;

--
-- Name: server_series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.server_series_id_seq OWNED BY public.server_series.id;


--
-- Name: server_sizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.server_sizes (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.server_sizes OWNER TO postgres;

--
-- Name: server_sizes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.server_sizes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.server_sizes_id_seq OWNER TO postgres;

--
-- Name: server_sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.server_sizes_id_seq OWNED BY public.server_sizes.id;


--
-- Name: server_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.server_types (
    id integer NOT NULL,
    description text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    title character varying(255),
    slug character varying(255)
);


ALTER TABLE public.server_types OWNER TO postgres;

--
-- Name: server_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.server_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.server_types_id_seq OWNER TO postgres;

--
-- Name: server_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.server_types_id_seq OWNED BY public.server_types.id;


--
-- Name: server_types_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.server_types_localizations_links (
    id integer NOT NULL,
    server_type_id integer,
    inv_server_type_id integer,
    server_type_order double precision
);


ALTER TABLE public.server_types_localizations_links OWNER TO postgres;

--
-- Name: server_types_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.server_types_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.server_types_localizations_links_id_seq OWNER TO postgres;

--
-- Name: server_types_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.server_types_localizations_links_id_seq OWNED BY public.server_types_localizations_links.id;


--
-- Name: server_types_server_processors_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.server_types_server_processors_links (
    id integer NOT NULL,
    server_type_id integer,
    server_processor_id integer,
    server_processor_order double precision,
    server_type_order double precision
);


ALTER TABLE public.server_types_server_processors_links OWNER TO postgres;

--
-- Name: server_types_server_processors_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.server_types_server_processors_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.server_types_server_processors_links_id_seq OWNER TO postgres;

--
-- Name: server_types_server_processors_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.server_types_server_processors_links_id_seq OWNED BY public.server_types_server_processors_links.id;


--
-- Name: server_types_server_series_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.server_types_server_series_links (
    id integer NOT NULL,
    server_type_id integer,
    server_serieses_id integer,
    server_serieses_order double precision,
    server_type_order double precision
);


ALTER TABLE public.server_types_server_series_links OWNER TO postgres;

--
-- Name: server_types_server_series_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.server_types_server_series_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.server_types_server_series_links_id_seq OWNER TO postgres;

--
-- Name: server_types_server_series_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.server_types_server_series_links_id_seq OWNED BY public.server_types_server_series_links.id;


--
-- Name: servers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servers (
    id integer NOT NULL,
    doc_link character varying(255),
    support_link character varying(255),
    specs text,
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    title character varying(255)
);


ALTER TABLE public.servers OWNER TO postgres;

--
-- Name: servers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servers_id_seq OWNER TO postgres;

--
-- Name: servers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servers_id_seq OWNED BY public.servers.id;


--
-- Name: servers_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servers_localizations_links (
    id integer NOT NULL,
    server_id integer,
    inv_server_id integer,
    server_order double precision
);


ALTER TABLE public.servers_localizations_links OWNER TO postgres;

--
-- Name: servers_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servers_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servers_localizations_links_id_seq OWNER TO postgres;

--
-- Name: servers_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servers_localizations_links_id_seq OWNED BY public.servers_localizations_links.id;


--
-- Name: servers_server_processor_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servers_server_processor_links (
    id integer NOT NULL,
    server_id integer,
    server_processor_id integer,
    server_order double precision
);


ALTER TABLE public.servers_server_processor_links OWNER TO postgres;

--
-- Name: servers_server_processor_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servers_server_processor_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servers_server_processor_links_id_seq OWNER TO postgres;

--
-- Name: servers_server_processor_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servers_server_processor_links_id_seq OWNED BY public.servers_server_processor_links.id;


--
-- Name: servers_server_series_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servers_server_series_links (
    id integer NOT NULL,
    server_id integer,
    server_serieses_id integer,
    server_order double precision
);


ALTER TABLE public.servers_server_series_links OWNER TO postgres;

--
-- Name: servers_server_series_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servers_server_series_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servers_server_series_links_id_seq OWNER TO postgres;

--
-- Name: servers_server_series_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servers_server_series_links_id_seq OWNED BY public.servers_server_series_links.id;


--
-- Name: servers_server_size_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servers_server_size_links (
    id integer NOT NULL,
    server_id integer,
    server_size_id integer,
    server_order double precision
);


ALTER TABLE public.servers_server_size_links OWNER TO postgres;

--
-- Name: servers_server_size_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servers_server_size_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servers_server_size_links_id_seq OWNER TO postgres;

--
-- Name: servers_server_size_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servers_server_size_links_id_seq OWNED BY public.servers_server_size_links.id;


--
-- Name: site_contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site_contacts (
    id integer NOT NULL,
    phone character varying(255),
    email character varying(255),
    address character varying(255),
    "time" character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.site_contacts OWNER TO postgres;

--
-- Name: site_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.site_contacts_id_seq OWNER TO postgres;

--
-- Name: site_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.site_contacts_id_seq OWNED BY public.site_contacts.id;


--
-- Name: site_contacts_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site_contacts_localizations_links (
    id integer NOT NULL,
    site_contact_id integer,
    inv_site_contact_id integer,
    site_contact_order double precision
);


ALTER TABLE public.site_contacts_localizations_links OWNER TO postgres;

--
-- Name: site_contacts_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_contacts_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.site_contacts_localizations_links_id_seq OWNER TO postgres;

--
-- Name: site_contacts_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.site_contacts_localizations_links_id_seq OWNED BY public.site_contacts_localizations_links.id;


--
-- Name: site_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site_settings (
    id integer NOT NULL,
    response_email character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.site_settings OWNER TO postgres;

--
-- Name: site_settings_footer_form_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site_settings_footer_form_links (
    id integer NOT NULL,
    site_setting_id integer,
    form_id integer
);


ALTER TABLE public.site_settings_footer_form_links OWNER TO postgres;

--
-- Name: site_settings_footer_form_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_settings_footer_form_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.site_settings_footer_form_links_id_seq OWNER TO postgres;

--
-- Name: site_settings_footer_form_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.site_settings_footer_form_links_id_seq OWNED BY public.site_settings_footer_form_links.id;


--
-- Name: site_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.site_settings_id_seq OWNER TO postgres;

--
-- Name: site_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.site_settings_id_seq OWNED BY public.site_settings.id;


--
-- Name: slugs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.slugs (
    id integer NOT NULL,
    slug text,
    count integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.slugs OWNER TO postgres;

--
-- Name: slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.slugs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.slugs_id_seq OWNER TO postgres;

--
-- Name: slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.slugs_id_seq OWNED BY public.slugs.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions_token_links (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_order double precision
);


ALTER TABLE public.strapi_api_token_permissions_token_links OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNED BY public.strapi_api_token_permissions_token_links.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_tokens OWNER TO postgres;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNER TO postgres;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO postgres;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNER TO postgres;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO postgres;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_database_schema_id_seq OWNER TO postgres;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO postgres;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_migrations_id_seq OWNER TO postgres;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_token_permissions OWNER TO postgres;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNER TO postgres;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- Name: strapi_transfer_token_permissions_token_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_token_permissions_token_links (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_order double precision
);


ALTER TABLE public.strapi_transfer_token_permissions_token_links OWNER TO postgres;

--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq OWNER TO postgres;

--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq OWNED BY public.strapi_transfer_token_permissions_token_links.id;


--
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_tokens OWNER TO postgres;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNER TO postgres;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO postgres;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_webhooks_id_seq OWNER TO postgres;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tests (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.tests OWNER TO postgres;

--
-- Name: tests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tests_id_seq OWNER TO postgres;

--
-- Name: tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tests_id_seq OWNED BY public.tests.id;


--
-- Name: tests_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tests_localizations_links (
    id integer NOT NULL,
    test_id integer,
    inv_test_id integer,
    test_order double precision
);


ALTER TABLE public.tests_localizations_links OWNER TO postgres;

--
-- Name: tests_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tests_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tests_localizations_links_id_seq OWNER TO postgres;

--
-- Name: tests_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tests_localizations_links_id_seq OWNED BY public.tests_localizations_links.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_permissions OWNER TO postgres;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_id_seq OWNER TO postgres;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);


ALTER TABLE public.up_permissions_role_links OWNER TO postgres;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNER TO postgres;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNED BY public.up_permissions_role_links.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_roles OWNER TO postgres;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_roles_id_seq OWNER TO postgres;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_users OWNER TO postgres;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_id_seq OWNER TO postgres;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users_role_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_order double precision
);


ALTER TABLE public.up_users_role_links OWNER TO postgres;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_role_links_id_seq OWNER TO postgres;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_role_links_id_seq OWNED BY public.up_users_role_links.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.upload_folders OWNER TO postgres;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_id_seq OWNER TO postgres;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders_parent_links (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_order double precision
);


ALTER TABLE public.upload_folders_parent_links OWNER TO postgres;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNER TO postgres;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNED BY public.upload_folders_parent_links.id;


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: addresses_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.addresses_localizations_links_id_seq'::regclass);


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_links_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_links_id_seq'::regclass);


--
-- Name: audience id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audience ALTER COLUMN id SET DEFAULT nextval('public.audience_id_seq'::regclass);


--
-- Name: components_page_components_cards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_cards ALTER COLUMN id SET DEFAULT nextval('public.components_page_components_cards_id_seq'::regclass);


--
-- Name: components_page_components_cards_components id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_cards_components ALTER COLUMN id SET DEFAULT nextval('public.components_page_components_cards_components_id_seq'::regclass);


--
-- Name: components_page_components_pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_pages ALTER COLUMN id SET DEFAULT nextval('public.components_page_components_pages_id_seq'::regclass);


--
-- Name: components_page_components_pages_components id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_pages_components ALTER COLUMN id SET DEFAULT nextval('public.components_page_components_pages_components_id_seq'::regclass);


--
-- Name: components_page_components_partners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_partners ALTER COLUMN id SET DEFAULT nextval('public.components_page_components_partners_id_seq'::regclass);


--
-- Name: components_page_components_servers_sliders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_servers_sliders ALTER COLUMN id SET DEFAULT nextval('public.components_page_components_servers_sliders_id_seq'::regclass);


--
-- Name: components_page_components_servers_sliders_servers_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_servers_sliders_servers_links ALTER COLUMN id SET DEFAULT nextval('public.components_page_components_servers_sliders_servers_links_id_seq'::regclass);


--
-- Name: components_utils_components_block_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_block_settings ALTER COLUMN id SET DEFAULT nextval('public.components_utils_components_block_settings_id_seq'::regclass);


--
-- Name: components_utils_components_block_settings_components id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_block_settings_components ALTER COLUMN id SET DEFAULT nextval('public.components_utils_components_block_settings_components_id_seq'::regclass);


--
-- Name: components_utils_components_block_settings_form_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_block_settings_form_links ALTER COLUMN id SET DEFAULT nextval('public.components_utils_components_block_settings_form_links_id_seq'::regclass);


--
-- Name: components_utils_components_cards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_cards ALTER COLUMN id SET DEFAULT nextval('public.components_utils_components_cards_id_seq'::regclass);


--
-- Name: components_utils_components_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_links ALTER COLUMN id SET DEFAULT nextval('public.components_utils_components_links_id_seq'::regclass);


--
-- Name: components_utils_components_page_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_page_links ALTER COLUMN id SET DEFAULT nextval('public.components_utils_components_page_links_id_seq'::regclass);


--
-- Name: components_utils_components_page_links_product_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_page_links_product_links ALTER COLUMN id SET DEFAULT nextval('public.components_utils_components_page_links_product_links_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: events_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.events_localizations_links_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links ALTER COLUMN id SET DEFAULT nextval('public.files_folder_links_id_seq'::regclass);


--
-- Name: files_related_morphs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs ALTER COLUMN id SET DEFAULT nextval('public.files_related_morphs_id_seq'::regclass);


--
-- Name: form_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_fields ALTER COLUMN id SET DEFAULT nextval('public.form_fields_id_seq'::regclass);


--
-- Name: form_fields_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_fields_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.form_fields_localizations_links_id_seq'::regclass);


--
-- Name: forms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms ALTER COLUMN id SET DEFAULT nextval('public.forms_id_seq'::regclass);


--
-- Name: forms_form_fields_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_form_fields_links ALTER COLUMN id SET DEFAULT nextval('public.forms_form_fields_links_id_seq'::regclass);


--
-- Name: forms_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.forms_localizations_links_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: menu_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items ALTER COLUMN id SET DEFAULT nextval('public.menu_items_id_seq'::regclass);


--
-- Name: menu_items_parent_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_parent_links ALTER COLUMN id SET DEFAULT nextval('public.menu_items_parent_links_id_seq'::regclass);


--
-- Name: menu_items_root_menu_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_root_menu_links ALTER COLUMN id SET DEFAULT nextval('public.menu_items_root_menu_links_id_seq'::regclass);


--
-- Name: menus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);


--
-- Name: navigations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations ALTER COLUMN id SET DEFAULT nextval('public.navigations_id_seq'::regclass);


--
-- Name: navigations_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items ALTER COLUMN id SET DEFAULT nextval('public.navigations_items_id_seq'::regclass);


--
-- Name: navigations_items_audience_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_audience_links ALTER COLUMN id SET DEFAULT nextval('public.navigations_items_audience_links_id_seq'::regclass);


--
-- Name: navigations_items_master_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_master_links ALTER COLUMN id SET DEFAULT nextval('public.navigations_items_master_links_id_seq'::regclass);


--
-- Name: navigations_items_parent_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_parent_links ALTER COLUMN id SET DEFAULT nextval('public.navigations_items_parent_links_id_seq'::regclass);


--
-- Name: navigations_items_related id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_related ALTER COLUMN id SET DEFAULT nextval('public.navigations_items_related_id_seq'::regclass);


--
-- Name: navigations_items_related_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_related_links ALTER COLUMN id SET DEFAULT nextval('public.navigations_items_related_links_id_seq'::regclass);


--
-- Name: navigations_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.navigations_localizations_links_id_seq'::regclass);


--
-- Name: news_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_tags ALTER COLUMN id SET DEFAULT nextval('public.news_tags_id_seq'::regclass);


--
-- Name: news_tags_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_tags_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.news_tags_localizations_links_id_seq'::regclass);


--
-- Name: newsletters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletters ALTER COLUMN id SET DEFAULT nextval('public.newsletters_id_seq'::regclass);


--
-- Name: newsletters_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletters_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.newsletters_localizations_links_id_seq'::regclass);


--
-- Name: newsletters_news_tags_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletters_news_tags_links ALTER COLUMN id SET DEFAULT nextval('public.newsletters_news_tags_links_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: pages_components id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_components ALTER COLUMN id SET DEFAULT nextval('public.pages_components_id_seq'::regclass);


--
-- Name: pages_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.pages_localizations_links_id_seq'::regclass);


--
-- Name: partners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners ALTER COLUMN id SET DEFAULT nextval('public.partners_id_seq'::regclass);


--
-- Name: partners_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.partners_localizations_links_id_seq'::regclass);


--
-- Name: partners_partners_type_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_partners_type_links ALTER COLUMN id SET DEFAULT nextval('public.partners_partners_type_links_id_seq'::regclass);


--
-- Name: partners_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_types ALTER COLUMN id SET DEFAULT nextval('public.partners_types_id_seq'::regclass);


--
-- Name: partners_types_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_types_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.partners_types_localizations_links_id_seq'::regclass);


--
-- Name: privacy_policies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privacy_policies ALTER COLUMN id SET DEFAULT nextval('public.privacy_policies_id_seq'::regclass);


--
-- Name: privacy_policies_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privacy_policies_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.privacy_policies_localizations_links_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.products_localizations_links_id_seq'::regclass);


--
-- Name: server_processors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_processors ALTER COLUMN id SET DEFAULT nextval('public.server_processors_id_seq'::regclass);


--
-- Name: server_series id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_series ALTER COLUMN id SET DEFAULT nextval('public.server_series_id_seq'::regclass);


--
-- Name: server_sizes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_sizes ALTER COLUMN id SET DEFAULT nextval('public.server_sizes_id_seq'::regclass);


--
-- Name: server_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types ALTER COLUMN id SET DEFAULT nextval('public.server_types_id_seq'::regclass);


--
-- Name: server_types_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.server_types_localizations_links_id_seq'::regclass);


--
-- Name: server_types_server_processors_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types_server_processors_links ALTER COLUMN id SET DEFAULT nextval('public.server_types_server_processors_links_id_seq'::regclass);


--
-- Name: server_types_server_series_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types_server_series_links ALTER COLUMN id SET DEFAULT nextval('public.server_types_server_series_links_id_seq'::regclass);


--
-- Name: servers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers ALTER COLUMN id SET DEFAULT nextval('public.servers_id_seq'::regclass);


--
-- Name: servers_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.servers_localizations_links_id_seq'::regclass);


--
-- Name: servers_server_processor_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_server_processor_links ALTER COLUMN id SET DEFAULT nextval('public.servers_server_processor_links_id_seq'::regclass);


--
-- Name: servers_server_series_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_server_series_links ALTER COLUMN id SET DEFAULT nextval('public.servers_server_series_links_id_seq'::regclass);


--
-- Name: servers_server_size_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_server_size_links ALTER COLUMN id SET DEFAULT nextval('public.servers_server_size_links_id_seq'::regclass);


--
-- Name: site_contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_contacts ALTER COLUMN id SET DEFAULT nextval('public.site_contacts_id_seq'::regclass);


--
-- Name: site_contacts_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_contacts_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.site_contacts_localizations_links_id_seq'::regclass);


--
-- Name: site_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings ALTER COLUMN id SET DEFAULT nextval('public.site_settings_id_seq'::regclass);


--
-- Name: site_settings_footer_form_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings_footer_form_links ALTER COLUMN id SET DEFAULT nextval('public.site_settings_footer_form_links_id_seq'::regclass);


--
-- Name: slugs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slugs ALTER COLUMN id SET DEFAULT nextval('public.slugs_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: tests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests ALTER COLUMN id SET DEFAULT nextval('public.tests_id_seq'::regclass);


--
-- Name: tests_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.tests_localizations_links_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_links_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_links_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_links_id_seq'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (id, city, mail, phone, address, hours, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, map) FROM stdin;
2	Moskow	example@gmail.com	+7 999 678-23-45	Moscow, Leninskaya Sloboda str. 26	09:00-18:00	2023-12-22 12:28:44.075	2023-12-22 12:28:44.075	\N	1	1	en-US	\N
1	Москва	example@gmail.com	+7 999 678-23-45	Москва, ул. Ленинская слобода, д. 26	09:00-18:00	2023-12-22 12:28:18.819	2023-12-22 12:28:44.118	2023-12-22 12:28:20.056	1	1	ru-RU	\N
3	Санкт-Петербург	\N	\N	\N	\N	2023-12-22 12:31:12.639	2023-12-22 12:31:13.853	2023-12-22 12:31:13.844	1	1	ru-RU	\N
4	Севастополь	\N	\N	\N	09:00-18:00	2023-12-22 12:31:30.622	2023-12-22 12:31:31.721	2023-12-22 12:31:31.714	1	1	ru-RU	\N
5	Алматы	\N	\N	\N	09:00-18:00	2023-12-22 12:31:39.952	2023-12-22 12:31:47.94	2023-12-22 12:31:47.934	1	1	ru-RU	\N
7	Минск	example@gmail.com	+7 999 678-23-45	Minsk address	09:00-18:00	2023-12-22 12:32:33.875	2023-12-22 12:32:34.937	2023-12-22 12:32:34.931	1	1	en-US	\N
6	Минск	example@gmail.com	+7 999 678-23-45	Москва, ул. Ленинская слобода, д. 26	09:00-18:00	2023-12-22 12:32:05.047	2023-12-22 12:32:34.953	2023-12-22 12:32:13.941	1	1	ru-RU	\N
\.


--
-- Data for Name: addresses_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses_localizations_links (id, address_id, inv_address_id, address_order) FROM stdin;
1	2	1	1
2	1	2	1
3	7	6	1
4	6	7	1
\.


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions (id, action, action_parameters, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::content-manager.explorer.create	{}	plugin::navigation.audience	{"fields": ["name", "key"]}	[]	2023-12-21 13:11:38.685	2023-12-21 13:11:38.685	\N	\N
3	plugin::content-manager.explorer.create	{}	api::news-tag.news-tag	{"fields": ["name", "newsletters"]}	[]	2023-12-21 13:11:38.703	2023-12-21 13:11:38.703	\N	\N
5	plugin::content-manager.explorer.create	{}	api::partner.partner	{"fields": ["name", "description", "logo", "link", "partners_type"]}	[]	2023-12-21 13:11:38.712	2023-12-21 13:11:38.712	\N	\N
6	plugin::content-manager.explorer.create	{}	api::partners-type.partners-type	{"fields": ["name", "partners"]}	[]	2023-12-21 13:11:38.72	2023-12-21 13:11:38.72	\N	\N
8	plugin::content-manager.explorer.create	{}	api::server-processor.server-processor	{"fields": ["name", "servers"]}	[]	2023-12-21 13:11:38.737	2023-12-21 13:11:38.737	\N	\N
10	plugin::content-manager.explorer.create	{}	api::server-size.server-size	{"fields": ["name", "servers"]}	[]	2023-12-21 13:11:38.751	2023-12-21 13:11:38.751	\N	\N
11	plugin::content-manager.explorer.create	{}	api::site-contact.site-contact	{"fields": ["phone", "email", "address", "time"]}	[]	2023-12-21 13:11:38.758	2023-12-21 13:11:38.758	\N	\N
12	plugin::content-manager.explorer.read	{}	plugin::navigation.audience	{"fields": ["name", "key"]}	[]	2023-12-21 13:11:38.763	2023-12-21 13:11:38.763	\N	\N
14	plugin::content-manager.explorer.read	{}	api::news-tag.news-tag	{"fields": ["name", "newsletters"]}	[]	2023-12-21 13:11:38.777	2023-12-21 13:11:38.777	\N	\N
16	plugin::content-manager.explorer.read	{}	api::partner.partner	{"fields": ["name", "description", "logo", "link", "partners_type"]}	[]	2023-12-21 13:11:38.793	2023-12-21 13:11:38.793	\N	\N
17	plugin::content-manager.explorer.read	{}	api::partners-type.partners-type	{"fields": ["name", "partners"]}	[]	2023-12-21 13:11:38.805	2023-12-21 13:11:38.805	\N	\N
19	plugin::content-manager.explorer.read	{}	api::server-processor.server-processor	{"fields": ["name", "servers"]}	[]	2023-12-21 13:11:38.82	2023-12-21 13:11:38.82	\N	\N
21	plugin::content-manager.explorer.read	{}	api::server-size.server-size	{"fields": ["name", "servers"]}	[]	2023-12-21 13:11:38.834	2023-12-21 13:11:38.834	\N	\N
22	plugin::content-manager.explorer.read	{}	api::site-contact.site-contact	{"fields": ["phone", "email", "address", "time"]}	[]	2023-12-21 13:11:38.841	2023-12-21 13:11:38.841	\N	\N
23	plugin::content-manager.explorer.update	{}	plugin::navigation.audience	{"fields": ["name", "key"]}	[]	2023-12-21 13:11:38.847	2023-12-21 13:11:38.847	\N	\N
25	plugin::content-manager.explorer.update	{}	api::news-tag.news-tag	{"fields": ["name", "newsletters"]}	[]	2023-12-21 13:11:38.859	2023-12-21 13:11:38.859	\N	\N
27	plugin::content-manager.explorer.update	{}	api::partner.partner	{"fields": ["name", "description", "logo", "link", "partners_type"]}	[]	2023-12-21 13:11:38.871	2023-12-21 13:11:38.871	\N	\N
28	plugin::content-manager.explorer.update	{}	api::partners-type.partners-type	{"fields": ["name", "partners"]}	[]	2023-12-21 13:11:38.88	2023-12-21 13:11:38.88	\N	\N
30	plugin::content-manager.explorer.update	{}	api::server-processor.server-processor	{"fields": ["name", "servers"]}	[]	2023-12-21 13:11:38.895	2023-12-21 13:11:38.895	\N	\N
32	plugin::content-manager.explorer.update	{}	api::server-size.server-size	{"fields": ["name", "servers"]}	[]	2023-12-21 13:11:38.91	2023-12-21 13:11:38.91	\N	\N
33	plugin::content-manager.explorer.update	{}	api::site-contact.site-contact	{"fields": ["phone", "email", "address", "time"]}	[]	2023-12-21 13:11:38.918	2023-12-21 13:11:38.918	\N	\N
34	plugin::content-manager.explorer.delete	{}	plugin::navigation.audience	{}	[]	2023-12-21 13:11:38.923	2023-12-21 13:11:38.923	\N	\N
223	plugin::content-manager.explorer.create	{}	api::server-processor.server-processor	{"fields": ["name", "servers", "server_types"]}	[]	2023-12-21 13:59:18.509	2023-12-21 13:59:18.509	\N	\N
226	plugin::content-manager.explorer.read	{}	api::server-processor.server-processor	{"fields": ["name", "servers", "server_types"]}	[]	2023-12-21 13:59:18.54	2023-12-21 13:59:18.54	\N	\N
2	plugin::content-manager.explorer.create	{}	api::event.event	{"fields": ["type", "register", "time_start", "time_end", "content", "slug", "title"]}	[]	2023-12-21 13:11:38.697	2023-12-22 10:09:01.496	\N	\N
13	plugin::content-manager.explorer.read	{}	api::event.event	{"fields": ["type", "register", "time_start", "time_end", "content", "slug", "title"]}	[]	2023-12-21 13:11:38.771	2023-12-22 10:09:01.496	\N	\N
41	plugin::content-manager.explorer.delete	{}	api::server-processor.server-processor	{}	[]	2023-12-21 13:11:38.969	2023-12-21 13:11:38.969	\N	\N
42	plugin::content-manager.explorer.delete	{}	api::server-serieses.server-serieses	{}	[]	2023-12-21 13:11:38.973	2023-12-21 13:11:38.973	\N	\N
43	plugin::content-manager.explorer.delete	{}	api::server-size.server-size	{}	[]	2023-12-21 13:11:38.977	2023-12-21 13:11:38.977	\N	\N
24	plugin::content-manager.explorer.update	{}	api::event.event	{"fields": ["type", "register", "time_start", "time_end", "content", "slug", "title"]}	[]	2023-12-21 13:11:38.853	2023-12-22 10:09:01.496	\N	\N
7	plugin::content-manager.explorer.create	{}	api::server.server	{"fields": ["imgs", "doc_link", "support_link", "specs", "server_series", "server_processor", "server_size", "slug", "title"]}	[]	2023-12-21 13:11:38.726	2023-12-22 11:05:09.274	\N	\N
29	plugin::content-manager.explorer.update	{}	api::server.server	{"fields": ["imgs", "doc_link", "support_link", "specs", "server_series", "server_processor", "server_size", "slug", "title"]}	[]	2023-12-21 13:11:38.89	2023-12-22 11:05:09.274	\N	\N
9	plugin::content-manager.explorer.create	{}	api::server-serieses.server-serieses	{"fields": ["servers"]}	[]	2023-12-21 13:11:38.744	2023-12-22 11:19:55.83	\N	\N
31	plugin::content-manager.explorer.update	{}	api::server-serieses.server-serieses	{"fields": ["servers"]}	[]	2023-12-21 13:11:38.904	2023-12-22 11:19:55.83	\N	\N
20	plugin::content-manager.explorer.read	{}	api::server-serieses.server-serieses	{"fields": ["servers"]}	[]	2023-12-21 13:11:38.827	2023-12-22 11:19:55.83	\N	\N
229	plugin::content-manager.explorer.update	{}	api::server-processor.server-processor	{"fields": ["name", "servers", "server_types"]}	[]	2023-12-21 13:59:18.561	2023-12-21 13:59:18.561	\N	\N
63	plugin::content-manager.explorer.create	{}	api::newsletter.newsletter	{"fields": ["news_tags", "content", "slug", "title"]}	["admin::is-creator"]	2023-12-21 13:11:39.092	2023-12-22 10:08:37.687	\N	\N
72	plugin::content-manager.explorer.read	{}	api::event.event	{"fields": ["type", "register", "time_start", "time_end", "content", "slug", "title"]}	["admin::is-creator"]	2023-12-21 13:11:39.143	2023-12-22 10:09:01.496	\N	\N
50	plugin::content-manager.explorer.publish	{}	api::server-processor.server-processor	{}	[]	2023-12-21 13:11:39.017	2023-12-21 13:11:39.017	\N	\N
51	plugin::content-manager.explorer.publish	{}	api::server-serieses.server-serieses	{}	[]	2023-12-21 13:11:39.021	2023-12-21 13:11:39.021	\N	\N
52	plugin::content-manager.explorer.publish	{}	api::server-size.server-size	{}	[]	2023-12-21 13:11:39.025	2023-12-21 13:11:39.025	\N	\N
61	plugin::content-manager.explorer.create	{}	api::event.event	{"fields": ["type", "register", "time_start", "time_end", "content", "slug", "title"]}	["admin::is-creator"]	2023-12-21 13:11:39.08	2023-12-22 10:09:01.496	\N	\N
54	plugin::upload.read	{}	\N	{}	[]	2023-12-21 13:11:39.035	2023-12-21 13:11:39.035	\N	\N
55	plugin::upload.configure-view	{}	\N	{}	[]	2023-12-21 13:11:39.04	2023-12-21 13:11:39.04	\N	\N
56	plugin::upload.assets.create	{}	\N	{}	[]	2023-12-21 13:11:39.044	2023-12-21 13:11:39.044	\N	\N
57	plugin::upload.assets.update	{}	\N	{}	[]	2023-12-21 13:11:39.051	2023-12-21 13:11:39.051	\N	\N
58	plugin::upload.assets.download	{}	\N	{}	[]	2023-12-21 13:11:39.056	2023-12-21 13:11:39.056	\N	\N
59	plugin::upload.assets.copy-link	{}	\N	{}	[]	2023-12-21 13:11:39.06	2023-12-21 13:11:39.06	\N	\N
60	plugin::content-manager.explorer.create	{}	plugin::navigation.audience	{"fields": ["name", "key"]}	["admin::is-creator"]	2023-12-21 13:11:39.073	2023-12-21 13:11:39.073	\N	\N
62	plugin::content-manager.explorer.create	{}	api::news-tag.news-tag	{"fields": ["name", "newsletters"]}	["admin::is-creator"]	2023-12-21 13:11:39.087	2023-12-21 13:11:39.087	\N	\N
64	plugin::content-manager.explorer.create	{}	api::partner.partner	{"fields": ["name", "description", "logo", "link", "partners_type"]}	["admin::is-creator"]	2023-12-21 13:11:39.096	2023-12-21 13:11:39.096	\N	\N
65	plugin::content-manager.explorer.create	{}	api::partners-type.partners-type	{"fields": ["name", "partners"]}	["admin::is-creator"]	2023-12-21 13:11:39.102	2023-12-21 13:11:39.102	\N	\N
67	plugin::content-manager.explorer.create	{}	api::server-processor.server-processor	{"fields": ["name", "servers"]}	["admin::is-creator"]	2023-12-21 13:11:39.112	2023-12-21 13:11:39.112	\N	\N
69	plugin::content-manager.explorer.create	{}	api::server-size.server-size	{"fields": ["name", "servers"]}	["admin::is-creator"]	2023-12-21 13:11:39.128	2023-12-21 13:11:39.128	\N	\N
70	plugin::content-manager.explorer.create	{}	api::site-contact.site-contact	{"fields": ["phone", "email", "address", "time"]}	["admin::is-creator"]	2023-12-21 13:11:39.134	2023-12-21 13:11:39.134	\N	\N
71	plugin::content-manager.explorer.read	{}	plugin::navigation.audience	{"fields": ["name", "key"]}	["admin::is-creator"]	2023-12-21 13:11:39.139	2023-12-21 13:11:39.139	\N	\N
73	plugin::content-manager.explorer.read	{}	api::news-tag.news-tag	{"fields": ["name", "newsletters"]}	["admin::is-creator"]	2023-12-21 13:11:39.149	2023-12-21 13:11:39.149	\N	\N
75	plugin::content-manager.explorer.read	{}	api::partner.partner	{"fields": ["name", "description", "logo", "link", "partners_type"]}	["admin::is-creator"]	2023-12-21 13:11:39.159	2023-12-21 13:11:39.159	\N	\N
76	plugin::content-manager.explorer.read	{}	api::partners-type.partners-type	{"fields": ["name", "partners"]}	["admin::is-creator"]	2023-12-21 13:11:39.165	2023-12-21 13:11:39.165	\N	\N
78	plugin::content-manager.explorer.read	{}	api::server-processor.server-processor	{"fields": ["name", "servers"]}	["admin::is-creator"]	2023-12-21 13:11:39.179	2023-12-21 13:11:39.179	\N	\N
80	plugin::content-manager.explorer.read	{}	api::server-size.server-size	{"fields": ["name", "servers"]}	["admin::is-creator"]	2023-12-21 13:11:39.193	2023-12-21 13:11:39.193	\N	\N
81	plugin::content-manager.explorer.read	{}	api::site-contact.site-contact	{"fields": ["phone", "email", "address", "time"]}	["admin::is-creator"]	2023-12-21 13:11:39.2	2023-12-21 13:11:39.2	\N	\N
82	plugin::content-manager.explorer.update	{}	plugin::navigation.audience	{"fields": ["name", "key"]}	["admin::is-creator"]	2023-12-21 13:11:39.205	2023-12-21 13:11:39.205	\N	\N
84	plugin::content-manager.explorer.update	{}	api::news-tag.news-tag	{"fields": ["name", "newsletters"]}	["admin::is-creator"]	2023-12-21 13:11:39.22	2023-12-21 13:11:39.22	\N	\N
86	plugin::content-manager.explorer.update	{}	api::partner.partner	{"fields": ["name", "description", "logo", "link", "partners_type"]}	["admin::is-creator"]	2023-12-21 13:11:39.229	2023-12-21 13:11:39.229	\N	\N
176	plugin::upload.assets.copy-link	{}	\N	{}	[]	2023-12-21 13:11:39.741	2023-12-21 13:11:39.741	\N	\N
83	plugin::content-manager.explorer.update	{}	api::event.event	{"fields": ["type", "register", "time_start", "time_end", "content", "slug", "title"]}	["admin::is-creator"]	2023-12-21 13:11:39.212	2023-12-22 10:09:01.496	\N	\N
66	plugin::content-manager.explorer.create	{}	api::server.server	{"fields": ["imgs", "doc_link", "support_link", "specs", "server_series", "server_processor", "server_size", "slug", "title"]}	["admin::is-creator"]	2023-12-21 13:11:39.106	2023-12-22 11:05:09.274	\N	\N
77	plugin::content-manager.explorer.read	{}	api::server.server	{"fields": ["imgs", "doc_link", "support_link", "specs", "server_series", "server_processor", "server_size", "slug", "title"]}	["admin::is-creator"]	2023-12-21 13:11:39.171	2023-12-22 11:05:09.274	\N	\N
68	plugin::content-manager.explorer.create	{}	api::server-serieses.server-serieses	{"fields": ["servers"]}	["admin::is-creator"]	2023-12-21 13:11:39.121	2023-12-22 11:19:55.83	\N	\N
79	plugin::content-manager.explorer.read	{}	api::server-serieses.server-serieses	{"fields": ["servers"]}	["admin::is-creator"]	2023-12-21 13:11:39.186	2023-12-22 11:19:55.83	\N	\N
87	plugin::content-manager.explorer.update	{}	api::partners-type.partners-type	{"fields": ["name", "partners"]}	["admin::is-creator"]	2023-12-21 13:11:39.234	2023-12-21 13:11:39.234	\N	\N
89	plugin::content-manager.explorer.update	{}	api::server-processor.server-processor	{"fields": ["name", "servers"]}	["admin::is-creator"]	2023-12-21 13:11:39.243	2023-12-21 13:11:39.243	\N	\N
91	plugin::content-manager.explorer.update	{}	api::server-size.server-size	{"fields": ["name", "servers"]}	["admin::is-creator"]	2023-12-21 13:11:39.253	2023-12-21 13:11:39.253	\N	\N
92	plugin::content-manager.explorer.update	{}	api::site-contact.site-contact	{"fields": ["phone", "email", "address", "time"]}	["admin::is-creator"]	2023-12-21 13:11:39.257	2023-12-21 13:11:39.257	\N	\N
93	plugin::content-manager.explorer.delete	{}	plugin::navigation.audience	{}	["admin::is-creator"]	2023-12-21 13:11:39.264	2023-12-21 13:11:39.264	\N	\N
232	plugin::content-manager.explorer.delete	{}	api::server-type.server-type	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:59:18.577	2023-12-21 13:59:18.577	\N	\N
233	plugin::content-manager.explorer.publish	{}	api::server-type.server-type	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:59:18.582	2023-12-21 13:59:18.582	\N	\N
247	plugin::content-manager.explorer.delete	{}	api::product.product	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 14:53:54.12	2023-12-21 14:53:54.12	\N	\N
100	plugin::content-manager.explorer.delete	{}	api::server-processor.server-processor	{}	["admin::is-creator"]	2023-12-21 13:11:39.311	2023-12-21 13:11:39.311	\N	\N
101	plugin::content-manager.explorer.delete	{}	api::server-serieses.server-serieses	{}	["admin::is-creator"]	2023-12-21 13:11:39.318	2023-12-21 13:11:39.318	\N	\N
102	plugin::content-manager.explorer.delete	{}	api::server-size.server-size	{}	["admin::is-creator"]	2023-12-21 13:11:39.323	2023-12-21 13:11:39.323	\N	\N
248	plugin::content-manager.explorer.publish	{}	api::product.product	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 14:53:54.124	2023-12-21 14:53:54.124	\N	\N
104	plugin::upload.read	{}	\N	{}	["admin::is-creator"]	2023-12-21 13:11:39.334	2023-12-21 13:11:39.334	\N	\N
105	plugin::upload.configure-view	{}	\N	{}	[]	2023-12-21 13:11:39.338	2023-12-21 13:11:39.338	\N	\N
106	plugin::upload.assets.create	{}	\N	{}	[]	2023-12-21 13:11:39.343	2023-12-21 13:11:39.343	\N	\N
107	plugin::upload.assets.update	{}	\N	{}	["admin::is-creator"]	2023-12-21 13:11:39.349	2023-12-21 13:11:39.349	\N	\N
108	plugin::upload.assets.download	{}	\N	{}	[]	2023-12-21 13:11:39.353	2023-12-21 13:11:39.353	\N	\N
109	plugin::upload.assets.copy-link	{}	\N	{}	[]	2023-12-21 13:11:39.357	2023-12-21 13:11:39.357	\N	\N
110	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2023-12-21 13:11:39.409	2023-12-21 13:11:39.409	\N	\N
111	plugin::content-manager.explorer.create	{}	plugin::navigation.audience	{"fields": ["name", "key"]}	[]	2023-12-21 13:11:39.415	2023-12-21 13:11:39.415	\N	\N
260	plugin::content-manager.explorer.delete	{}	api::form-field.form-field	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 15:49:39.829	2023-12-21 15:49:39.829	\N	\N
269	plugin::content-manager.explorer.create	{}	api::form-field.form-field	{"fields": ["name", "placeholder", "type", "required"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 15:55:30.155	2023-12-21 15:55:30.155	\N	\N
270	plugin::content-manager.explorer.read	{}	api::form-field.form-field	{"fields": ["name", "placeholder", "type", "required"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 15:55:30.165	2023-12-21 15:55:30.165	\N	\N
120	plugin::content-manager.explorer.create	{}	api::server-size.server-size	{"fields": ["name", "servers"]}	[]	2023-12-21 13:11:39.471	2023-12-21 13:11:39.471	\N	\N
271	plugin::content-manager.explorer.update	{}	api::form-field.form-field	{"fields": ["name", "placeholder", "type", "required"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 15:55:30.169	2023-12-21 15:55:30.169	\N	\N
122	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2023-12-21 13:11:39.48	2023-12-21 13:11:39.48	\N	\N
123	plugin::content-manager.explorer.read	{}	plugin::navigation.audience	{"fields": ["name", "key"]}	[]	2023-12-21 13:11:39.486	2023-12-21 13:11:39.486	\N	\N
279	plugin::content-manager.explorer.create	{}	api::newsletter.newsletter	{"fields": ["title", "news_tags", "content", "slug"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 10:08:37.575	2023-12-22 10:08:37.575	\N	\N
280	plugin::content-manager.explorer.read	{}	api::newsletter.newsletter	{"fields": ["title", "news_tags", "content", "slug"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 10:08:37.59	2023-12-22 10:08:37.59	\N	\N
281	plugin::content-manager.explorer.update	{}	api::newsletter.newsletter	{"fields": ["title", "news_tags", "content", "slug"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 10:08:37.594	2023-12-22 10:08:37.594	\N	\N
4	plugin::content-manager.explorer.create	{}	api::newsletter.newsletter	{"fields": ["news_tags", "content", "slug", "title"]}	[]	2023-12-21 13:11:38.708	2023-12-22 10:08:37.686	\N	\N
85	plugin::content-manager.explorer.update	{}	api::newsletter.newsletter	{"fields": ["news_tags", "content", "slug", "title"]}	["admin::is-creator"]	2023-12-21 13:11:39.225	2023-12-22 10:08:37.687	\N	\N
283	plugin::content-manager.explorer.read	{}	api::event.event	{"fields": ["title", "type", "register", "time_start", "time_end", "content", "slug"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 10:09:01.406	2023-12-22 10:09:01.406	\N	\N
284	plugin::content-manager.explorer.update	{}	api::event.event	{"fields": ["title", "type", "register", "time_start", "time_end", "content", "slug"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 10:09:01.411	2023-12-22 10:09:01.411	\N	\N
90	plugin::content-manager.explorer.update	{}	api::server-serieses.server-serieses	{"fields": ["servers"]}	["admin::is-creator"]	2023-12-21 13:11:39.248	2023-12-22 11:19:55.83	\N	\N
132	plugin::content-manager.explorer.read	{}	api::server-size.server-size	{"fields": ["name", "servers"]}	[]	2023-12-21 13:11:39.524	2023-12-21 13:11:39.524	\N	\N
134	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2023-12-21 13:11:39.534	2023-12-21 13:11:39.534	\N	\N
135	plugin::content-manager.explorer.update	{}	plugin::navigation.audience	{"fields": ["name", "key"]}	[]	2023-12-21 13:11:39.539	2023-12-21 13:11:39.539	\N	\N
144	plugin::content-manager.explorer.update	{}	api::server-size.server-size	{"fields": ["name", "servers"]}	[]	2023-12-21 13:11:39.587	2023-12-21 13:11:39.587	\N	\N
146	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2023-12-21 13:11:39.595	2023-12-21 13:11:39.595	\N	\N
147	plugin::content-manager.explorer.delete	{}	plugin::navigation.audience	{}	[]	2023-12-21 13:11:39.602	2023-12-21 13:11:39.602	\N	\N
272	plugin::content-manager.explorer.create	{}	api::form.form	{"fields": ["name", "description", "send_text", "privacy", "form_fields", "success_message"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 16:29:30.834	2023-12-21 16:29:30.834	\N	\N
273	plugin::content-manager.explorer.read	{}	api::form.form	{"fields": ["name", "description", "send_text", "privacy", "form_fields", "success_message"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 16:29:30.846	2023-12-21 16:29:30.846	\N	\N
274	plugin::content-manager.explorer.update	{}	api::form.form	{"fields": ["name", "description", "send_text", "privacy", "form_fields", "success_message"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 16:29:30.849	2023-12-21 16:29:30.849	\N	\N
15	plugin::content-manager.explorer.read	{}	api::newsletter.newsletter	{"fields": ["news_tags", "content", "slug", "title"]}	[]	2023-12-21 13:11:38.785	2023-12-22 10:08:37.687	\N	\N
154	plugin::content-manager.explorer.delete	{}	api::server-processor.server-processor	{}	[]	2023-12-21 13:11:39.635	2023-12-21 13:11:39.635	\N	\N
155	plugin::content-manager.explorer.delete	{}	api::server-serieses.server-serieses	{}	[]	2023-12-21 13:11:39.639	2023-12-21 13:11:39.639	\N	\N
156	plugin::content-manager.explorer.delete	{}	api::server-size.server-size	{}	[]	2023-12-21 13:11:39.646	2023-12-21 13:11:39.646	\N	\N
74	plugin::content-manager.explorer.read	{}	api::newsletter.newsletter	{"fields": ["news_tags", "content", "slug", "title"]}	["admin::is-creator"]	2023-12-21 13:11:39.155	2023-12-22 10:08:37.687	\N	\N
291	plugin::content-manager.explorer.delete	{}	api::page.page	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-22 10:24:11.945	2023-12-22 10:24:11.945	\N	\N
292	plugin::content-manager.explorer.publish	{}	api::page.page	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-22 10:24:11.95	2023-12-22 10:24:11.95	\N	\N
163	plugin::content-manager.explorer.publish	{}	api::server-processor.server-processor	{}	[]	2023-12-21 13:11:39.678	2023-12-21 13:11:39.678	\N	\N
164	plugin::content-manager.explorer.publish	{}	api::server-serieses.server-serieses	{}	[]	2023-12-21 13:11:39.684	2023-12-21 13:11:39.684	\N	\N
165	plugin::content-manager.explorer.publish	{}	api::server-size.server-size	{}	[]	2023-12-21 13:11:39.688	2023-12-21 13:11:39.688	\N	\N
167	plugin::content-manager.single-types.configure-view	{}	\N	{}	[]	2023-12-21 13:11:39.698	2023-12-21 13:11:39.698	\N	\N
168	plugin::content-manager.collection-types.configure-view	{}	\N	{}	[]	2023-12-21 13:11:39.704	2023-12-21 13:11:39.704	\N	\N
169	plugin::content-manager.components.configure-layout	{}	\N	{}	[]	2023-12-21 13:11:39.707	2023-12-21 13:11:39.707	\N	\N
170	plugin::content-type-builder.read	{}	\N	{}	[]	2023-12-21 13:11:39.711	2023-12-21 13:11:39.711	\N	\N
171	plugin::email.settings.read	{}	\N	{}	[]	2023-12-21 13:11:39.716	2023-12-21 13:11:39.716	\N	\N
172	plugin::upload.read	{}	\N	{}	[]	2023-12-21 13:11:39.721	2023-12-21 13:11:39.721	\N	\N
173	plugin::upload.assets.create	{}	\N	{}	[]	2023-12-21 13:11:39.725	2023-12-21 13:11:39.725	\N	\N
174	plugin::upload.assets.update	{}	\N	{}	[]	2023-12-21 13:11:39.73	2023-12-21 13:11:39.73	\N	\N
175	plugin::upload.assets.download	{}	\N	{}	[]	2023-12-21 13:11:39.736	2023-12-21 13:11:39.736	\N	\N
296	plugin::content-manager.explorer.create	{}	api::product.product	{"fields": ["title", "description", "disabled", "slug"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 11:00:58.103	2023-12-22 11:00:58.103	\N	\N
297	plugin::content-manager.explorer.read	{}	api::product.product	{"fields": ["title", "description", "disabled", "slug"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 11:00:58.115	2023-12-22 11:00:58.115	\N	\N
298	plugin::content-manager.explorer.update	{}	api::product.product	{"fields": ["title", "description", "disabled", "slug"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 11:00:58.118	2023-12-22 11:00:58.118	\N	\N
299	plugin::content-manager.explorer.create	{}	api::server.server	{"fields": ["title", "imgs", "doc_link", "support_link", "specs", "server_series", "server_processor", "server_size", "slug"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 11:05:09.122	2023-12-22 11:05:09.122	\N	\N
300	plugin::content-manager.explorer.read	{}	api::server.server	{"fields": ["title", "imgs", "doc_link", "support_link", "specs", "server_series", "server_processor", "server_size", "slug"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 11:05:09.168	2023-12-22 11:05:09.168	\N	\N
301	plugin::content-manager.explorer.update	{}	api::server.server	{"fields": ["title", "imgs", "doc_link", "support_link", "specs", "server_series", "server_processor", "server_size", "slug"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 11:05:09.173	2023-12-22 11:05:09.173	\N	\N
18	plugin::content-manager.explorer.read	{}	api::server.server	{"fields": ["imgs", "doc_link", "support_link", "specs", "server_series", "server_processor", "server_size", "slug", "title"]}	[]	2023-12-21 13:11:38.812	2023-12-22 11:05:09.274	\N	\N
88	plugin::content-manager.explorer.update	{}	api::server.server	{"fields": ["imgs", "doc_link", "support_link", "specs", "server_series", "server_processor", "server_size", "slug", "title"]}	["admin::is-creator"]	2023-12-21 13:11:39.239	2023-12-22 11:05:09.274	\N	\N
302	plugin::content-manager.explorer.create	{}	api::server-serieses.server-serieses	{"fields": ["title", "servers", "server_types", "slug"]}	[]	2023-12-22 11:19:55.706	2023-12-22 11:19:55.706	\N	\N
303	plugin::content-manager.explorer.read	{}	api::server-serieses.server-serieses	{"fields": ["title", "servers", "server_types", "slug"]}	[]	2023-12-22 11:19:55.72	2023-12-22 11:19:55.72	\N	\N
304	plugin::content-manager.explorer.update	{}	api::server-serieses.server-serieses	{"fields": ["title", "servers", "server_types", "slug"]}	[]	2023-12-22 11:19:55.725	2023-12-22 11:19:55.725	\N	\N
305	plugin::content-manager.explorer.create	{}	api::server-type.server-type	{"fields": ["title", "description", "server_series", "server_processors", "slug"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 11:21:53.506	2023-12-22 11:21:53.506	\N	\N
306	plugin::content-manager.explorer.read	{}	api::server-type.server-type	{"fields": ["title", "description", "server_series", "server_processors", "slug"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 11:21:53.515	2023-12-22 11:21:53.515	\N	\N
177	plugin::upload.configure-view	{}	\N	{}	[]	2023-12-21 13:11:39.745	2023-12-21 13:11:39.745	\N	\N
178	plugin::upload.settings.read	{}	\N	{}	[]	2023-12-21 13:11:39.75	2023-12-21 13:11:39.75	\N	\N
179	plugin::i18n.locale.create	{}	\N	{}	[]	2023-12-21 13:11:39.754	2023-12-21 13:11:39.754	\N	\N
180	plugin::i18n.locale.read	{}	\N	{}	[]	2023-12-21 13:11:39.76	2023-12-21 13:11:39.76	\N	\N
181	plugin::i18n.locale.update	{}	\N	{}	[]	2023-12-21 13:11:39.767	2023-12-21 13:11:39.767	\N	\N
182	plugin::i18n.locale.delete	{}	\N	{}	[]	2023-12-21 13:11:39.772	2023-12-21 13:11:39.772	\N	\N
183	plugin::users-permissions.roles.create	{}	\N	{}	[]	2023-12-21 13:11:39.777	2023-12-21 13:11:39.777	\N	\N
184	plugin::users-permissions.roles.read	{}	\N	{}	[]	2023-12-21 13:11:39.781	2023-12-21 13:11:39.781	\N	\N
185	plugin::users-permissions.roles.update	{}	\N	{}	[]	2023-12-21 13:11:39.787	2023-12-21 13:11:39.787	\N	\N
186	plugin::users-permissions.roles.delete	{}	\N	{}	[]	2023-12-21 13:11:39.791	2023-12-21 13:11:39.791	\N	\N
187	plugin::users-permissions.providers.read	{}	\N	{}	[]	2023-12-21 13:11:39.795	2023-12-21 13:11:39.795	\N	\N
188	plugin::users-permissions.providers.update	{}	\N	{}	[]	2023-12-21 13:11:39.8	2023-12-21 13:11:39.8	\N	\N
189	plugin::users-permissions.email-templates.read	{}	\N	{}	[]	2023-12-21 13:11:39.804	2023-12-21 13:11:39.804	\N	\N
190	plugin::users-permissions.email-templates.update	{}	\N	{}	[]	2023-12-21 13:11:39.808	2023-12-21 13:11:39.808	\N	\N
191	plugin::users-permissions.advanced-settings.read	{}	\N	{}	[]	2023-12-21 13:11:39.812	2023-12-21 13:11:39.812	\N	\N
192	plugin::users-permissions.advanced-settings.update	{}	\N	{}	[]	2023-12-21 13:11:39.817	2023-12-21 13:11:39.817	\N	\N
193	plugin::navigation.read	{}	\N	{}	[]	2023-12-21 13:11:39.821	2023-12-21 13:11:39.821	\N	\N
194	plugin::navigation.update	{}	\N	{}	[]	2023-12-21 13:11:39.826	2023-12-21 13:11:39.826	\N	\N
195	plugin::navigation.settings	{}	\N	{}	[]	2023-12-21 13:11:39.83	2023-12-21 13:11:39.83	\N	\N
196	admin::marketplace.read	{}	\N	{}	[]	2023-12-21 13:11:39.835	2023-12-21 13:11:39.835	\N	\N
197	admin::webhooks.create	{}	\N	{}	[]	2023-12-21 13:11:39.84	2023-12-21 13:11:39.84	\N	\N
198	admin::webhooks.read	{}	\N	{}	[]	2023-12-21 13:11:39.845	2023-12-21 13:11:39.845	\N	\N
199	admin::webhooks.update	{}	\N	{}	[]	2023-12-21 13:11:39.852	2023-12-21 13:11:39.852	\N	\N
200	admin::webhooks.delete	{}	\N	{}	[]	2023-12-21 13:11:39.856	2023-12-21 13:11:39.856	\N	\N
201	admin::users.create	{}	\N	{}	[]	2023-12-21 13:11:39.861	2023-12-21 13:11:39.861	\N	\N
202	admin::users.read	{}	\N	{}	[]	2023-12-21 13:11:39.866	2023-12-21 13:11:39.866	\N	\N
203	admin::users.update	{}	\N	{}	[]	2023-12-21 13:11:39.872	2023-12-21 13:11:39.872	\N	\N
204	admin::users.delete	{}	\N	{}	[]	2023-12-21 13:11:39.877	2023-12-21 13:11:39.877	\N	\N
205	admin::roles.create	{}	\N	{}	[]	2023-12-21 13:11:39.883	2023-12-21 13:11:39.883	\N	\N
206	admin::roles.read	{}	\N	{}	[]	2023-12-21 13:11:39.891	2023-12-21 13:11:39.891	\N	\N
207	admin::roles.update	{}	\N	{}	[]	2023-12-21 13:11:39.896	2023-12-21 13:11:39.896	\N	\N
208	admin::roles.delete	{}	\N	{}	[]	2023-12-21 13:11:39.903	2023-12-21 13:11:39.903	\N	\N
209	admin::api-tokens.access	{}	\N	{}	[]	2023-12-21 13:11:39.907	2023-12-21 13:11:39.907	\N	\N
210	admin::api-tokens.create	{}	\N	{}	[]	2023-12-21 13:11:39.911	2023-12-21 13:11:39.911	\N	\N
211	admin::api-tokens.read	{}	\N	{}	[]	2023-12-21 13:11:39.916	2023-12-21 13:11:39.916	\N	\N
212	admin::api-tokens.update	{}	\N	{}	[]	2023-12-21 13:11:39.921	2023-12-21 13:11:39.921	\N	\N
213	admin::api-tokens.regenerate	{}	\N	{}	[]	2023-12-21 13:11:39.925	2023-12-21 13:11:39.925	\N	\N
214	admin::api-tokens.delete	{}	\N	{}	[]	2023-12-21 13:11:39.929	2023-12-21 13:11:39.929	\N	\N
215	admin::project-settings.update	{}	\N	{}	[]	2023-12-21 13:11:39.936	2023-12-21 13:11:39.936	\N	\N
216	admin::project-settings.read	{}	\N	{}	[]	2023-12-21 13:11:39.939	2023-12-21 13:11:39.939	\N	\N
217	admin::transfer.tokens.access	{}	\N	{}	[]	2023-12-21 13:11:39.943	2023-12-21 13:11:39.943	\N	\N
218	admin::transfer.tokens.create	{}	\N	{}	[]	2023-12-21 13:11:39.946	2023-12-21 13:11:39.946	\N	\N
219	admin::transfer.tokens.read	{}	\N	{}	[]	2023-12-21 13:11:39.952	2023-12-21 13:11:39.952	\N	\N
220	admin::transfer.tokens.update	{}	\N	{}	[]	2023-12-21 13:11:39.955	2023-12-21 13:11:39.955	\N	\N
221	admin::transfer.tokens.regenerate	{}	\N	{}	[]	2023-12-21 13:11:39.959	2023-12-21 13:11:39.959	\N	\N
222	admin::transfer.tokens.delete	{}	\N	{}	[]	2023-12-21 13:11:39.962	2023-12-21 13:11:39.962	\N	\N
255	plugin::content-manager.explorer.delete	{}	api::privacy-policy.privacy-policy	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 15:34:19.323	2023-12-21 15:34:19.323	\N	\N
256	plugin::content-manager.explorer.publish	{}	api::privacy-policy.privacy-policy	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 15:34:19.328	2023-12-21 15:34:19.328	\N	\N
267	plugin::content-manager.explorer.delete	{}	api::form.form	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 15:54:31.154	2023-12-21 15:54:31.154	\N	\N
268	plugin::content-manager.explorer.publish	{}	api::form.form	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 15:54:31.161	2023-12-21 15:54:31.161	\N	\N
275	plugin::content-manager.explorer.create	{}	api::site-setting.site-setting	{"fields": ["response_email", "footer_form"]}	[]	2023-12-21 17:37:28.267	2023-12-21 17:37:28.267	\N	\N
276	plugin::content-manager.explorer.read	{}	api::site-setting.site-setting	{"fields": ["response_email", "footer_form"]}	[]	2023-12-21 17:37:28.297	2023-12-21 17:37:28.297	\N	\N
277	plugin::content-manager.explorer.update	{}	api::site-setting.site-setting	{"fields": ["response_email", "footer_form"]}	[]	2023-12-21 17:37:28.304	2023-12-21 17:37:28.304	\N	\N
278	plugin::content-manager.explorer.delete	{}	api::site-setting.site-setting	{}	[]	2023-12-21 17:37:28.31	2023-12-21 17:37:28.31	\N	\N
26	plugin::content-manager.explorer.update	{}	api::newsletter.newsletter	{"fields": ["news_tags", "content", "slug", "title"]}	[]	2023-12-21 13:11:38.865	2023-12-22 10:08:37.687	\N	\N
282	plugin::content-manager.explorer.create	{}	api::event.event	{"fields": ["title", "type", "register", "time_start", "time_end", "content", "slug"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 10:09:01.395	2023-12-22 10:09:01.395	\N	\N
139	plugin::content-manager.explorer.update	{}	api::partner.partner	{"fields": ["name", "description", "logo", "link", "partners_type"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.129	2023-12-21 13:31:44.129	\N	\N
151	plugin::content-manager.explorer.delete	{}	api::partner.partner	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.133	2023-12-21 13:31:44.133	\N	\N
162	plugin::content-manager.explorer.publish	{}	api::server.server	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.148	2023-12-21 13:31:44.148	\N	\N
153	plugin::content-manager.explorer.delete	{}	api::server.server	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.156	2023-12-21 13:31:44.156	\N	\N
140	plugin::content-manager.explorer.update	{}	api::partners-type.partners-type	{"fields": ["name", "partners"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.16	2023-12-21 13:31:44.16	\N	\N
150	plugin::content-manager.explorer.delete	{}	api::newsletter.newsletter	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.164	2023-12-21 13:31:44.164	\N	\N
125	plugin::content-manager.explorer.read	{}	api::news-tag.news-tag	{"fields": ["name", "newsletters"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.177	2023-12-21 13:31:44.177	\N	\N
158	plugin::content-manager.explorer.publish	{}	api::event.event	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.181	2023-12-21 13:31:44.181	\N	\N
161	plugin::content-manager.explorer.publish	{}	api::partner.partner	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.186	2023-12-21 13:31:44.186	\N	\N
160	plugin::content-manager.explorer.publish	{}	api::newsletter.newsletter	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.192	2023-12-21 13:31:44.192	\N	\N
127	plugin::content-manager.explorer.read	{}	api::partner.partner	{"fields": ["name", "description", "logo", "link", "partners_type"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.196	2023-12-21 13:31:44.196	\N	\N
149	plugin::content-manager.explorer.delete	{}	api::news-tag.news-tag	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.201	2023-12-21 13:31:44.201	\N	\N
128	plugin::content-manager.explorer.read	{}	api::partners-type.partners-type	{"fields": ["name", "partners"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.214	2023-12-21 13:31:44.214	\N	\N
148	plugin::content-manager.explorer.delete	{}	api::event.event	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.225	2023-12-21 13:31:44.225	\N	\N
166	plugin::content-manager.explorer.publish	{}	api::site-contact.site-contact	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.233	2023-12-21 13:31:44.233	\N	\N
145	plugin::content-manager.explorer.update	{}	api::site-contact.site-contact	{"fields": ["phone", "email", "address", "time"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.241	2023-12-21 13:31:44.241	\N	\N
159	plugin::content-manager.explorer.publish	{}	api::news-tag.news-tag	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.245	2023-12-21 13:31:44.245	\N	\N
116	plugin::content-manager.explorer.create	{}	api::partners-type.partners-type	{"fields": ["name", "partners"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.261	2023-12-21 13:31:44.261	\N	\N
121	plugin::content-manager.explorer.create	{}	api::site-contact.site-contact	{"fields": ["phone", "email", "address", "time"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.265	2023-12-21 13:31:44.265	\N	\N
113	plugin::content-manager.explorer.create	{}	api::news-tag.news-tag	{"fields": ["name", "newsletters"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.272	2023-12-21 13:31:44.272	\N	\N
133	plugin::content-manager.explorer.read	{}	api::site-contact.site-contact	{"fields": ["phone", "email", "address", "time"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.281	2023-12-21 13:31:44.281	\N	\N
137	plugin::content-manager.explorer.update	{}	api::news-tag.news-tag	{"fields": ["name", "newsletters"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.292	2023-12-21 13:31:44.292	\N	\N
152	plugin::content-manager.explorer.delete	{}	api::partners-type.partners-type	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.295	2023-12-21 13:31:44.295	\N	\N
115	plugin::content-manager.explorer.create	{}	api::partner.partner	{"fields": ["name", "description", "logo", "link", "partners_type"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.299	2023-12-21 13:31:44.299	\N	\N
157	plugin::content-manager.explorer.delete	{}	api::site-contact.site-contact	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-21 13:31:44.308	2023-12-21 13:31:44.308	\N	\N
307	plugin::content-manager.explorer.update	{}	api::server-type.server-type	{"fields": ["title", "description", "server_series", "server_processors", "slug"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 11:21:53.524	2023-12-22 11:21:53.524	\N	\N
311	plugin::content-manager.explorer.delete	{}	api::address.address	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-22 12:17:16.295	2023-12-22 12:17:16.295	\N	\N
312	plugin::content-manager.explorer.publish	{}	api::address.address	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-22 12:17:16.299	2023-12-22 12:17:16.299	\N	\N
313	plugin::content-manager.explorer.create	{}	api::address.address	{"fields": ["city", "mail", "phone", "address", "hours", "map"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 12:18:09.864	2023-12-22 12:18:09.864	\N	\N
314	plugin::content-manager.explorer.read	{}	api::address.address	{"fields": ["city", "mail", "phone", "address", "hours", "map"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 12:18:09.874	2023-12-22 12:18:09.874	\N	\N
315	plugin::content-manager.explorer.update	{}	api::address.address	{"fields": ["city", "mail", "phone", "address", "hours", "map"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 12:18:09.878	2023-12-22 12:18:09.878	\N	\N
316	plugin::content-manager.explorer.create	{}	api::test.test	{"fields": [], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 16:35:42.555	2023-12-22 16:35:42.555	\N	\N
317	plugin::content-manager.explorer.read	{}	api::test.test	{"fields": [], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 16:35:42.567	2023-12-22 16:35:42.567	\N	\N
318	plugin::content-manager.explorer.update	{}	api::test.test	{"fields": [], "locales": ["en-US", "ru-RU"]}	[]	2023-12-22 16:35:42.572	2023-12-22 16:35:42.572	\N	\N
319	plugin::content-manager.explorer.delete	{}	api::test.test	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-22 16:35:42.579	2023-12-22 16:35:42.579	\N	\N
320	plugin::content-manager.explorer.publish	{}	api::test.test	{"locales": ["en-US", "ru-RU"]}	[]	2023-12-22 16:35:42.584	2023-12-22 16:35:42.584	\N	\N
327	plugin::content-manager.explorer.create	{}	api::privacy-policy.privacy-policy	{"fields": ["privacy"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-28 13:43:07.749	2023-12-28 13:43:07.749	\N	\N
328	plugin::content-manager.explorer.read	{}	api::privacy-policy.privacy-policy	{"fields": ["privacy"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-28 13:43:07.76	2023-12-28 13:43:07.76	\N	\N
329	plugin::content-manager.explorer.update	{}	api::privacy-policy.privacy-policy	{"fields": ["privacy"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-28 13:43:07.766	2023-12-28 13:43:07.766	\N	\N
336	plugin::content-manager.explorer.create	{}	api::page.page	{"fields": ["title", "slug", "description", "block1", "block2"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-28 15:01:27.654	2023-12-28 15:01:27.654	\N	\N
337	plugin::content-manager.explorer.read	{}	api::page.page	{"fields": ["title", "slug", "description", "block1", "block2"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-28 15:01:27.668	2023-12-28 15:01:27.668	\N	\N
338	plugin::content-manager.explorer.update	{}	api::page.page	{"fields": ["title", "slug", "description", "block1", "block2"], "locales": ["en-US", "ru-RU"]}	[]	2023-12-28 15:01:27.673	2023-12-28 15:01:27.673	\N	\N
\.


--
-- Data for Name: admin_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
1	1	2	1
2	2	2	2
3	3	2	3
4	4	2	4
5	5	2	5
6	6	2	6
7	7	2	7
8	8	2	8
9	9	2	9
10	10	2	10
11	11	2	11
12	12	2	12
13	13	2	13
14	14	2	14
15	15	2	15
16	16	2	16
17	17	2	17
18	18	2	18
19	19	2	19
20	20	2	20
21	21	2	21
22	22	2	22
23	23	2	23
24	24	2	24
25	25	2	25
26	26	2	26
27	27	2	27
28	28	2	28
29	29	2	29
30	30	2	30
31	31	2	31
32	32	2	32
33	33	2	33
34	34	2	34
325	223	1	148
328	226	1	151
41	41	2	41
42	42	2	42
43	43	2	43
331	229	1	154
334	232	1	157
335	233	1	158
50	50	2	50
51	51	2	51
52	52	2	52
54	54	2	54
55	55	2	55
56	56	2	56
57	57	2	57
58	58	2	58
59	59	2	59
60	60	3	1
61	61	3	2
62	62	3	3
63	63	3	4
64	64	3	5
65	65	3	6
66	66	3	7
67	67	3	8
68	68	3	9
69	69	3	10
70	70	3	11
71	71	3	12
72	72	3	13
73	73	3	14
74	74	3	15
75	75	3	16
76	76	3	17
77	77	3	18
78	78	3	19
79	79	3	20
80	80	3	21
81	81	3	22
82	82	3	23
83	83	3	24
84	84	3	25
85	85	3	26
86	86	3	27
87	87	3	28
88	88	3	29
89	89	3	30
90	90	3	31
91	91	3	32
92	92	3	33
93	93	3	34
100	100	3	41
101	101	3	42
102	102	3	43
104	104	3	45
105	105	3	46
106	106	3	47
107	107	3	48
108	108	3	49
109	109	3	50
110	110	1	1
111	111	1	2
362	260	1	180
120	120	1	11
369	267	1	187
122	122	1	13
123	123	1	14
370	268	1	188
374	272	1	192
375	273	1	193
376	274	1	194
381	279	1	199
382	280	1	200
132	132	1	23
383	281	1	201
134	134	1	25
135	135	1	26
144	144	1	35
401	299	1	213
146	146	1	37
147	147	1	38
402	300	1	214
403	301	1	215
407	305	1	219
408	306	1	220
409	307	1	221
415	313	1	227
154	154	1	45
155	155	1	46
156	156	1	47
416	314	1	228
417	315	1	229
429	327	1	238
430	328	1	239
431	329	1	240
163	163	1	54
164	164	1	55
165	165	1	56
167	167	1	58
168	168	1	59
169	169	1	60
170	170	1	61
171	171	1	62
172	172	1	63
173	173	1	64
174	174	1	65
175	175	1	66
176	176	1	67
177	177	1	68
178	178	1	69
179	179	1	70
180	180	1	71
181	181	1	72
182	182	1	73
183	183	1	74
184	184	1	75
185	185	1	76
186	186	1	77
187	187	1	78
188	188	1	79
189	189	1	80
190	190	1	81
191	191	1	82
192	192	1	83
193	193	1	84
194	194	1	85
195	195	1	86
196	196	1	87
197	197	1	88
198	198	1	89
199	199	1	90
200	200	1	91
201	201	1	92
202	202	1	93
203	203	1	94
204	204	1	95
205	205	1	96
206	206	1	97
207	207	1	98
208	208	1	99
209	209	1	100
210	210	1	101
211	211	1	102
212	212	1	103
213	213	1	104
214	214	1	105
215	215	1	106
216	216	1	107
217	217	1	108
218	218	1	109
219	219	1	110
220	220	1	111
221	221	1	112
222	222	1	113
349	247	1	167
350	248	1	168
357	255	1	175
358	256	1	176
371	269	1	189
372	270	1	190
373	271	1	191
377	275	1	195
378	276	1	196
379	277	1	197
380	278	1	198
384	282	1	202
385	283	1	203
386	284	1	204
393	291	1	208
394	292	1	209
398	296	1	210
399	297	1	211
400	298	1	212
404	302	1	216
405	303	1	217
406	304	1	218
413	311	1	225
414	312	1	226
418	316	1	230
419	317	1	231
420	318	1	232
421	319	1	233
422	320	1	234
438	336	1	241
439	337	1	242
440	338	1	243
291	139	1	114
292	151	1	115
295	162	1	118
296	153	1	119
297	140	1	120
298	150	1	121
300	125	1	123
301	158	1	124
302	161	1	125
303	160	1	126
304	127	1	127
305	149	1	128
307	128	1	130
309	148	1	132
311	166	1	134
312	145	1	135
313	159	1	136
316	116	1	139
317	121	1	140
318	113	1	141
320	133	1	143
321	137	1	144
322	152	1	145
323	115	1	146
324	157	1	147
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2023-12-21 13:11:38.646	2023-12-21 13:11:38.646	\N	\N
2	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2023-12-21 13:11:38.658	2023-12-21 13:11:38.658	\N	\N
3	Author	strapi-author	Authors can manage the content they have created.	2023-12-21 13:11:38.661	2023-12-21 13:11:38.661	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Andrey	Savilov	\N	andrey.savilov@drozd.red	$2a$10$RGHp/x7LKR2gLsV./7FUJOwkUIlT1H6A4TM3nxccpjQWAn7GrjXTK	\N	\N	t	f	\N	2023-12-21 13:12:19.429	2023-12-21 13:12:19.429	\N	\N
\.


--
-- Data for Name: admin_users_roles_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users_roles_links (id, user_id, role_id, role_order, user_order) FROM stdin;
1	1	1	1	1
\.


--
-- Data for Name: audience; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audience (id, name, key, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: components_page_components_cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_page_components_cards (id, nums_in_row) FROM stdin;
\.


--
-- Data for Name: components_page_components_cards_components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_page_components_cards_components (id, entity_id, component_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: components_page_components_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_page_components_pages (id) FROM stdin;
\.


--
-- Data for Name: components_page_components_pages_components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_page_components_pages_components (id, entity_id, component_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: components_page_components_partners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_page_components_partners (id, form_description) FROM stdin;
\.


--
-- Data for Name: components_page_components_servers_sliders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_page_components_servers_sliders (id) FROM stdin;
\.


--
-- Data for Name: components_page_components_servers_sliders_servers_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_page_components_servers_sliders_servers_links (id, servers_slider_id, server_id, server_order) FROM stdin;
\.


--
-- Data for Name: components_utils_components_block_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_utils_components_block_settings (id, background, layout, title, description, padding, merge_text) FROM stdin;
\.


--
-- Data for Name: components_utils_components_block_settings_components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_utils_components_block_settings_components (id, entity_id, component_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: components_utils_components_block_settings_form_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_utils_components_block_settings_form_links (id, block_settings_id, form_id) FROM stdin;
\.


--
-- Data for Name: components_utils_components_cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_utils_components_cards (id, title, description) FROM stdin;
\.


--
-- Data for Name: components_utils_components_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_utils_components_links (id, link_text, url) FROM stdin;
\.


--
-- Data for Name: components_utils_components_page_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_utils_components_page_links (id, image, disabled) FROM stdin;
\.


--
-- Data for Name: components_utils_components_page_links_product_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components_utils_components_page_links_product_links (id, page_link_id, product_id) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, type, register, time_start, time_end, content, slug, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, title) FROM stdin;
1	online	open	2023-11-12 17:00:00	2023-11-14 17:00:00	<p><img src="http://localhost:1337/uploads/test_img_ba6b85e8ae.png" alt="test_img.png"></p><p>С&nbsp;20&nbsp;по&nbsp;23&nbsp;сентября в&nbsp;подмосковье пройдёт Multiservice – ежегодный форум операторов связи и&nbsp;вещателей. На&nbsp;мероприятии традиционно будут проведены панельные дискуссии и&nbsp;круглые столы, на&nbsp;которых участники смогут обсудить новинки рынка телекоммуникаций, текущие тенденции и&nbsp;проблематику.</p><p>На&nbsp;Технической секции команду VAS Experts представит Иван Сапунов с&nbsp;докладом на&nbsp;тему «Универсальный сервисный шлюз СКАТ. Практика импортозамещения».</p><h2>Мы&nbsp;обсудим</h2><p>Это&nbsp;огромный шаг&nbsp;вперёд в&nbsp;наших исследованиях. GPU серверы помогают обрабатывать огромные наборы данных, что&nbsp;раньше занимало&nbsp;бы&nbsp;много времени. Благодаря скорости и&nbsp;эффективности, GPU серверы становятся неотъемлемой частью вычислительной инфраструктуры. GPU серверы не&nbsp;только ускоряют процессы, но&nbsp;и&nbsp;значительно снижают затраты на&nbsp;обработку данных.</p><ol><li>Изменения требований к&nbsp;BRAS, CG-NAT, DPI, QoE в&nbsp;сетях операторов связи</li><li>Универсальный сервисный шлюз СКАТ в&nbsp;ядре сети</li><li>Тренд на&nbsp;виртуализацию ключевых сервисов</li><li>ТОРП и&nbsp;ПО&nbsp;— анализируем взаимосвязь понятий.</li></ol>	gpu-servers-are-an-evolutionary-shift-in-the-world-of-computer-systems-redefining-computing-standards	2023-12-21 13:52:29.853	2023-12-22 10:18:28.815	2023-12-21 13:52:31.988	1	1	ru-RU	GPU серверы — это эволюционный переход в мире компьютерных систем, переопределяющий стандарты вычислений
2	online	open	2023-11-12 17:00:00	2023-11-12 17:00:00	<p><img src="http://localhost:1337/uploads/test_img_ba6b85e8ae.png" alt="test_img.png"></p><p>Multiservice, an annual forum of telecom operators and broadcasters, will be held in the Moscow region from September 20 to 23. The event will traditionally feature panel discussions and round tables where participants will be able to discuss telecommunications market novelties, current trends and issues.</p><p>The VAS Experts team will be represented at the Technical Section by Ivan Sapunov with a report on "Universal Service Gateway SKAT. Import substitution practice".</p><h2>We'll discuss</h2><p>This is a huge step forward in our research. GPU servers help process huge datasets, which would have taken a lot of time before. With speed and efficiency, GPU servers are becoming an integral part of the computing infrastructure. GPU servers not only speed up processes, but also significantly reduce the cost of data processing.</p><ol><li>Changes in requirements for BRAS, CG-NAT, DPI, QoE in telecom operators' networks</li><li>Universal service gateway SCAT in the network core</li><li>Trend towards virtualization of key services</li><li>TORP and software - analyze the relationship between the concepts.</li></ol>	gpu-servers-are-an-evolutionary-shift-in-the-world-of-computer-systems-redefining-computing-standards	2023-12-21 13:55:16.812	2023-12-22 10:18:28.801	2023-12-21 13:55:19.335	1	1	en-US	GPU servers are an evolutionary shift in the world of computer systems, redefining computing standards
\.


--
-- Data for Name: events_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events_localizations_links (id, event_id, inv_event_id, event_order) FROM stdin;
1	2	1	1
2	1	2	1
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
2	vstack.svg	\N	\N	101	26	\N	vstack_e76234a127	.svg	image/svg+xml	4.44	/uploads/vstack_e76234a127.svg	\N	local	\N	/	2023-12-21 13:34:58.424	2023-12-21 13:34:58.424	1	1
1	itglobal.svg	\N	\N	182	24	\N	itglobal_23aa25c677	.svg	image/svg+xml	11.02	/uploads/itglobal_23aa25c677.svg	\N	local	\N	/	2023-12-21 13:34:58.421	2023-12-21 13:34:58.421	1	1
3	vase.svg	\N	\N	157	49	\N	vase_534b3bd17a	.svg	image/svg+xml	7.76	/uploads/vase_534b3bd17a.svg	\N	local	\N	/	2023-12-21 13:34:58.425	2023-12-21 13:36:32.779	1	1
4	test_img.png	\N	\N	884	471	{"small": {"ext": ".png", "url": "/uploads/small_test_img_ba6b85e8ae.png", "hash": "small_test_img_ba6b85e8ae", "mime": "image/png", "name": "small_test_img.png", "path": null, "size": 265.74, "width": 500, "height": 266}, "medium": {"ext": ".png", "url": "/uploads/medium_test_img_ba6b85e8ae.png", "hash": "medium_test_img_ba6b85e8ae", "mime": "image/png", "name": "medium_test_img.png", "path": null, "size": 552.12, "width": 750, "height": 400}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_test_img_ba6b85e8ae.png", "hash": "thumbnail_test_img_ba6b85e8ae", "mime": "image/png", "name": "thumbnail_test_img.png", "path": null, "size": 76.17, "width": 245, "height": 131}}	test_img_ba6b85e8ae	.png	image/png	172.57	/uploads/test_img_ba6b85e8ae.png	\N	local	\N	/	2023-12-21 13:43:54.853	2023-12-21 13:43:54.853	1	1
5	4.png	\N	\N	91	91	\N	4_482de06aba	.png	image/png	2.00	/uploads/4_482de06aba.png	\N	local	\N	/	2023-12-22 11:07:47.255	2023-12-22 11:07:47.255	1	1
6	3.png	\N	\N	91	91	\N	3_369a4b83c3	.png	image/png	2.27	/uploads/3_369a4b83c3.png	\N	local	\N	/	2023-12-22 11:07:47.259	2023-12-22 11:07:47.259	1	1
7	2.png	\N	\N	91	91	\N	2_b97f511309	.png	image/png	2.51	/uploads/2_b97f511309.png	\N	local	\N	/	2023-12-22 11:07:47.263	2023-12-22 11:07:47.263	1	1
8	5.png	\N	\N	91	91	\N	5_ac9d9f9bc8	.png	image/png	5.90	/uploads/5_ac9d9f9bc8.png	\N	local	\N	/	2023-12-22 11:07:47.319	2023-12-22 11:07:47.319	1	1
9	1.png	\N	\N	488	185	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_1_0fad2a6271.png", "hash": "thumbnail_1_0fad2a6271", "mime": "image/png", "name": "thumbnail_1.png", "path": null, "size": 29.66, "width": 245, "height": 93}}	1_0fad2a6271	.png	image/png	23.00	/uploads/1_0fad2a6271.png	\N	local	\N	/	2023-12-22 11:07:47.369	2023-12-22 11:07:47.369	1	1
\.


--
-- Data for Name: files_folder_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_folder_links (id, file_id, folder_id, file_order) FROM stdin;
\.


--
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_related_morphs (id, file_id, related_id, related_type, field, "order") FROM stdin;
2	2	2	api::partner.partner	logo	1
4	2	1	api::partner.partner	logo	1
6	3	4	api::partner.partner	logo	1
8	3	3	api::partner.partner	logo	1
10	1	6	api::partner.partner	logo	1
12	1	5	api::partner.partner	logo	1
\.


--
-- Data for Name: form_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_fields (id, name, placeholder, required, created_at, updated_at, created_by_id, updated_by_id, locale, type) FROM stdin;
2	name	Name	f	2023-12-21 15:58:06.816	2023-12-21 15:58:06.816	1	1	en-US	text
1	name	Имя	f	2023-12-21 15:57:51.796	2023-12-21 15:58:06.85	1	1	ru-RU	text
4	email	Email	t	2023-12-21 15:58:46.194	2023-12-21 15:58:46.194	1	1	en-US	email
3	email	Email	t	2023-12-21 15:58:30.326	2023-12-21 15:58:46.22	1	1	ru-RU	email
6	phone	Phone	t	2023-12-21 15:59:52.996	2023-12-21 15:59:52.996	1	1	en-US	tel
5	phone	Телефон	t	2023-12-21 15:59:10.738	2023-12-21 15:59:53.034	1	1	ru-RU	tel
8	company	Company	t	2023-12-21 16:00:33.841	2023-12-21 16:00:33.841	1	1	en-US	text
7	company	Компания	t	2023-12-21 16:00:17.788	2023-12-21 16:00:33.878	1	1	ru-RU	text
10	message	Message	f	2023-12-21 16:01:17.853	2023-12-21 16:01:17.853	1	1	en-US	text
9	message	Комментарий	f	2023-12-21 16:01:01.069	2023-12-21 16:01:17.877	1	1	ru-RU	text
\.


--
-- Data for Name: form_fields_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_fields_localizations_links (id, form_field_id, inv_form_field_id, form_field_order) FROM stdin;
1	2	1	1
2	1	2	1
3	4	3	1
4	3	4	1
5	6	5	1
6	5	6	1
7	8	7	1
8	7	8	1
9	10	9	1
10	9	10	1
\.


--
-- Data for Name: forms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forms (id, name, description, send_text, privacy, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, success_message) FROM stdin;
1	Отправьте заявку на консультацию	Наши специалисты проконсультируют по конфигурациям и рассчитают стоимость	Отправить запрос	t	2023-12-21 16:02:24.081	2023-12-21 16:30:16.177	2023-12-21 16:02:25.945	1	1	ru-RU	<p>Спасибо за вашу заявку!<br>Мы свяжемся с вами в ближайшее время</p>
2	Send a request	Our experts will advise on configurations and calculate the cost	Send	t	2023-12-21 16:03:40.706	2023-12-21 16:30:31.732	2023-12-21 16:03:41.983	1	1	en-US	<p>Thank you for your application!<br>We will contact you shortly</p>
\.


--
-- Data for Name: forms_form_fields_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forms_form_fields_links (id, form_id, form_field_id, form_field_order) FROM stdin;
1	1	9	4
2	1	7	3
3	1	5	2
4	1	3	1
5	1	1	0
6	2	10	4
7	2	8	3
8	2	6	2
9	2	4	1
10	2	2	0
\.


--
-- Data for Name: forms_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forms_localizations_links (id, form_id, inv_form_id, form_order) FROM stdin;
1	2	1	1
2	1	2	1
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
3	English (United States) (en-US)	en-US	2023-12-21 13:31:31.771	2023-12-21 13:31:31.771	1	1
2	Russian (Russia) (ru-RU)	ru-RU	2023-12-21 13:31:00.693	2023-12-21 13:31:38.965	1	1
\.


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_items (id, "order", title, url, target, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	0	Продукты	/products	\N	2023-12-21 14:49:33.009	2023-12-21 14:49:33.009	\N	\N
\.


--
-- Data for Name: menu_items_parent_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_items_parent_links (id, menu_item_id, inv_menu_item_id) FROM stdin;
\.


--
-- Data for Name: menu_items_root_menu_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_items_root_menu_links (id, menu_item_id, menu_id, menu_item_order) FROM stdin;
1	1	1	1
\.


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menus (id, title, slug, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	main	menu	2023-12-21 14:48:24.442	2023-12-21 14:49:33.024	\N	\N
\.


--
-- Data for Name: navigations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.navigations (id, name, slug, visible, locale_code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Main navigation	main-navigation	t	en	2023-12-21 13:11:38.612	2023-12-21 13:11:38.612	\N	\N
3	Navigation	navigation-en-US	t	en-US	2023-12-21 14:36:37.252	2023-12-28 15:18:33.146	\N	\N
2	Navigation	navigation	t	ru-RU	2023-12-21 14:36:37.218	2023-12-28 15:18:33.163	\N	\N
\.


--
-- Data for Name: navigations_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.navigations_items (id, title, type, path, external_path, ui_router_key, menu_attached, "order", collapsed, additional_fields, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
5	Продукты	WRAPPER	products	\N	produkty	f	1	f	{}	2023-12-21 15:05:40.934	2023-12-21 15:05:40.934	\N	\N
6	Программно-аппаратные комплексы	INTERNAL	hardware-and-software-complexes	\N	programmno-apparatnye-kompleksy	f	1	f	{}	2023-12-21 15:08:02.294	2023-12-21 15:08:02.294	\N	\N
7	Сетевое оборудование	INTERNAL	network-equipment	\N	setevoe-oborudovanie	f	4	f	{}	2023-12-21 15:08:02.295	2023-12-21 15:08:02.295	\N	\N
8	Серверное оборудование	INTERNAL	server-equipment	\N	servernoe-oborudovanie	f	2	f	{}	2023-12-21 15:08:02.297	2023-12-21 15:08:02.297	\N	\N
9	Системы хранения данных	INTERNAL	data-storage-systems	\N	sistemy-hraneniya-dannyh	f	3	f	{}	2023-12-21 15:08:02.299	2023-12-21 15:08:02.299	\N	\N
10	Партнерам	INTERNAL	partners	\N	partneram	f	2	f	{}	2023-12-21 15:10:41.132	2023-12-21 15:10:41.132	\N	\N
12	О нас	WRAPPER	/	\N	o-nas	t	4	f	{}	2023-12-21 15:24:34.502	2023-12-21 15:24:34.502	\N	\N
13	О компании	INTERNAL	about	\N	o-kompanii	f	1	f	{}	2023-12-21 15:24:34.543	2023-12-21 15:24:34.543	\N	\N
14	Контакты	INTERNAL	contacts	\N	kontakty	f	2	f	{}	2023-12-21 15:24:34.544	2023-12-21 15:24:34.544	\N	\N
15	Мероприятия	INTERNAL	events	\N	meropriyatiya	f	4	f	{}	2023-12-21 15:24:34.546	2023-12-21 15:24:34.546	\N	\N
16	Новости	INTERNAL	news	\N	novosti	f	3	f	{}	2023-12-21 15:24:34.55	2023-12-21 15:24:34.55	\N	\N
18	Products	WRAPPER	products	\N	products	f	1	f	{}	2023-12-21 15:25:02.169	2023-12-21 15:27:27.363	\N	\N
17	About us	WRAPPER	/	\N	about-us	t	4	f	{}	2023-12-21 15:25:02.169	2023-12-21 15:27:27.363	\N	\N
19	Partners	INTERNAL	partners	\N	partners	f	2	f	{}	2023-12-21 15:25:02.187	2023-12-21 15:27:27.468	\N	\N
25	Hardware and software complexes	INTERNAL	hardware-and-software-complexes	\N	hardware-and-software-complexes	f	1	f	{}	2023-12-21 15:25:02.416	2023-12-21 15:27:27.531	\N	\N
28	Data storage systems	INTERNAL	data-storage-systems	\N	data-storage-systems	f	3	f	{}	2023-12-21 15:25:02.418	2023-12-21 15:27:27.58	\N	\N
27	Server hardware	INTERNAL	server-equipment	\N	server-hardware	f	2	f	{}	2023-12-21 15:25:02.417	2023-12-21 15:27:27.585	\N	\N
26	Network equipment	INTERNAL	network-equipment	\N	network-equipment	f	4	f	{}	2023-12-21 15:25:02.417	2023-12-21 15:27:27.584	\N	\N
24	Contacts	INTERNAL	contacts	\N	contacts	f	2	f	{}	2023-12-21 15:25:02.408	2023-12-21 15:27:27.586	\N	\N
22	Company	INTERNAL	about	\N	company	f	1	f	{}	2023-12-21 15:25:02.406	2023-12-21 15:27:27.585	\N	\N
21	Events	INTERNAL	events	\N	events	f	4	f	{}	2023-12-21 15:25:02.405	2023-12-21 15:27:27.718	\N	\N
23	News	INTERNAL	news	\N	news	f	3	f	{}	2023-12-21 15:25:02.407	2023-12-21 15:27:27.586	\N	\N
11	Поддержка	INTERNAL	support	\N	podderzhka-1	f	3	f	{"footer_name": "Сервисный центр и поддержка"}	2023-12-21 15:10:41.132	2023-12-21 16:25:12.39	\N	\N
20	Support	INTERNAL	support	\N	support-1	f	3	f	{"footer_name": "Service center and support"}	2023-12-21 15:25:02.191	2023-12-21 16:25:39.403	\N	\N
\.


--
-- Data for Name: navigations_items_audience_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.navigations_items_audience_links (id, navigation_item_id, audience_id, audience_order) FROM stdin;
\.


--
-- Data for Name: navigations_items_master_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.navigations_items_master_links (id, navigation_item_id, navigation_id, navigation_item_order) FROM stdin;
6	5	2	5
7	6	2	6
8	8	2	7
9	7	2	7
10	9	2	8
11	10	2	9
12	11	2	9
13	12	2	10
14	13	2	11
15	14	2	11
16	15	2	12
17	16	2	12
18	17	3	1
19	18	3	1
20	19	3	2
21	20	3	2
22	21	3	3
23	26	3	3
24	25	3	4
25	23	3	4
26	22	3	4
27	24	3	4
28	28	3	4
29	27	3	4
\.


--
-- Data for Name: navigations_items_parent_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.navigations_items_parent_links (id, navigation_item_id, inv_navigation_item_id) FROM stdin;
1	6	5
2	7	5
3	8	5
4	9	5
5	13	12
6	14	12
7	15	12
8	16	12
9	21	17
10	23	17
11	22	17
12	24	17
14	26	18
13	25	18
15	28	18
16	27	18
\.


--
-- Data for Name: navigations_items_related; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.navigations_items_related (id, related_id, related_type, field, "order", master, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
5	1	api::product.product	navigation	1	2	2023-12-21 15:08:02.274	2023-12-21 15:08:02.274	\N	\N
6	5	api::product.product	navigation	1	2	2023-12-21 15:08:02.275	2023-12-21 15:08:02.275	\N	\N
7	7	api::product.product	navigation	1	2	2023-12-21 15:08:02.276	2023-12-21 15:08:02.276	\N	\N
8	3	api::product.product	navigation	1	2	2023-12-21 15:08:02.278	2023-12-21 15:08:02.278	\N	\N
9	1	api::page.page	navigation	1	2	2023-12-21 15:10:41.126	2023-12-21 15:10:41.126	\N	\N
10	2	api::page.page	navigation	1	2	2023-12-21 15:10:41.126	2023-12-21 15:10:41.126	\N	\N
11	3	api::page.page	navigation	1	2	2023-12-21 15:24:34.535	2023-12-21 15:24:34.535	\N	\N
12	5	api::page.page	navigation	1	2	2023-12-21 15:24:34.536	2023-12-21 15:24:34.536	\N	\N
13	4	api::page.page	navigation	1	2	2023-12-21 15:24:34.536	2023-12-21 15:24:34.536	\N	\N
14	6	api::page.page	navigation	1	2	2023-12-21 15:24:34.537	2023-12-21 15:24:34.537	\N	\N
15	1	api::page.page	\N	1	3	2023-12-21 15:25:02.172	2023-12-21 15:25:02.172	\N	\N
16	2	api::page.page	\N	1	3	2023-12-21 15:25:02.175	2023-12-21 15:25:02.175	\N	\N
17	3	api::page.page	\N	1	3	2023-12-21 15:25:02.238	2023-12-21 15:25:02.238	\N	\N
18	4	api::page.page	\N	1	3	2023-12-21 15:25:02.239	2023-12-21 15:25:02.239	\N	\N
19	5	api::page.page	\N	1	3	2023-12-21 15:25:02.24	2023-12-21 15:25:02.24	\N	\N
20	6	api::page.page	\N	1	3	2023-12-21 15:25:02.27	2023-12-21 15:25:02.27	\N	\N
21	2	api::product.product	\N	1	3	2023-12-21 15:25:02.388	2023-12-21 15:25:02.388	\N	\N
22	8	api::product.product	\N	1	3	2023-12-21 15:25:02.39	2023-12-21 15:25:02.39	\N	\N
23	4	api::product.product	\N	1	3	2023-12-21 15:25:02.39	2023-12-21 15:25:02.39	\N	\N
24	6	api::product.product	\N	1	3	2023-12-21 15:25:02.391	2023-12-21 15:25:02.391	\N	\N
25	1	api::page.page	navigation	1	3	2023-12-21 15:27:27.365	2023-12-21 15:27:27.365	\N	\N
26	2	api::page.page	navigation	1	3	2023-12-21 15:27:27.366	2023-12-21 15:27:27.366	\N	\N
27	2	api::product.product	navigation	1	3	2023-12-21 15:27:27.475	2023-12-21 15:27:27.475	\N	\N
28	6	api::product.product	navigation	1	3	2023-12-21 15:27:27.481	2023-12-21 15:27:27.481	\N	\N
29	4	api::product.product	navigation	1	3	2023-12-21 15:27:27.482	2023-12-21 15:27:27.482	\N	\N
30	8	api::product.product	navigation	1	3	2023-12-21 15:27:27.484	2023-12-21 15:27:27.484	\N	\N
31	3	api::page.page	navigation	1	3	2023-12-21 15:27:27.487	2023-12-21 15:27:27.487	\N	\N
32	4	api::page.page	navigation	1	3	2023-12-21 15:27:27.489	2023-12-21 15:27:27.489	\N	\N
33	5	api::page.page	navigation	1	3	2023-12-21 15:27:27.491	2023-12-21 15:27:27.491	\N	\N
34	6	api::page.page	navigation	1	3	2023-12-21 15:27:27.493	2023-12-21 15:27:27.493	\N	\N
\.


--
-- Data for Name: navigations_items_related_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.navigations_items_related_links (id, navigation_item_id, navigations_items_related_id) FROM stdin;
6	6	5
7	7	7
8	8	8
9	9	6
10	10	9
11	11	10
12	13	11
13	14	13
14	15	14
15	16	12
26	19	25
27	20	26
28	28	28
29	25	27
30	27	29
31	26	30
32	24	32
33	22	31
34	21	34
35	23	33
\.


--
-- Data for Name: navigations_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.navigations_localizations_links (id, navigation_id, inv_navigation_id, navigation_order) FROM stdin;
1	3	2	1
2	2	3	1
\.


--
-- Data for Name: news_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news_tags (id, name, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	IT Оборудование	2023-12-21 13:40:38.994	2023-12-21 13:40:49.461	2023-12-21 13:40:39.907	1	1	ru-RU
2	IT Equipment	2023-12-21 13:40:49.448	2023-12-21 13:40:50.288	2023-12-21 13:40:50.283	1	1	en-US
\.


--
-- Data for Name: news_tags_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news_tags_localizations_links (id, news_tag_id, inv_news_tag_id, news_tag_order) FROM stdin;
1	2	1	1
2	1	2	1
\.


--
-- Data for Name: newsletters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsletters (id, content, slug, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, title) FROM stdin;
1	<p>GPU серверы&nbsp;— это&nbsp;эволюционный переход в&nbsp;мире компьютерных систем, переопределяющий стандарты вычислений. GPU — это&nbsp;инструмент для&nbsp;расчёта, который превращает идеи в&nbsp;образы. Выводит числа за&nbsp;рамки их&nbsp;стандартного назначения. Эти&nbsp;серверы оборудованы графическими процессорами, специально разработанными для&nbsp;параллельной обработки задач. GPU серверы могут обрабатывать огромные объёмы данных и&nbsp;выполнять сложные вычисления за&nbsp;считанные миллисекунды, что&nbsp;ускоряет научные и&nbsp;коммерческие исследования. Эффективность GPU серверов проявляется в&nbsp;различных областях, от&nbsp;глубокого обучения до&nbsp;<a href="google.com">медицинских исследований</a>.</p><h4>Использование GPU серверов в&nbsp;машинном обучении позволяет ускорить обучение моделей и&nbsp;улучшить точность результатов.</h4><p>GPU серверы привлекательны своей способностью эффективно решать задачи, требующие высокой графической мощности. С&nbsp;помощью GPU серверов можно создавать потрясающие визуальные эффекты, анимации и&nbsp;игры с&nbsp;потрясающей детализацией и&nbsp;реалистичностью.</p><h2>Компании в&nbsp;сфере научных исследований</h2><p>Это&nbsp;огромный шаг&nbsp;вперёд в&nbsp;наших исследованиях. GPU серверы помогают обрабатывать огромные наборы данных, что&nbsp;раньше занимало&nbsp;бы&nbsp;много времени. Благодаря скорости и&nbsp;эффективности, GPU серверы становятся неотъемлемой частью вычислительной инфраструктуры. GPU серверы не&nbsp;только ускоряют процессы, но&nbsp;и&nbsp;значительно снижают затраты на&nbsp;обработку данных.</p><p>Благодаря скорости и&nbsp;эффективности, GPU серверы становятся неотъемлемой частью вычислительной инфраструктуры. GPU серверы не&nbsp;только ускоряют процессы, но&nbsp;и&nbsp;значительно снижают затраты на&nbsp;обработку данных.</p><h4>«Использование GPU серверов в&nbsp;машинном обучении позволяет ускорить обучение моделей и&nbsp;улучшить точность результатов».</h4><p>—&nbsp;Анна&nbsp;Ли, исследователь в&nbsp;области искусственного интеллекта</p><p>Эти&nbsp;инновационные серверы открывают новые перспективы в&nbsp;области исследований и&nbsp;разработок, что&nbsp;приводит к&nbsp;появлению новых технологий и&nbsp;решений. GPU серверы являются катализатором для&nbsp;новаторских идей и&nbsp;создания инновационных продуктов.</p><p>Исследования показывают, что&nbsp;применение GPU серверов может существенно ускорить решение сложных задач. Мы&nbsp;смогли ускорить обработку данных в&nbsp;несколько раз, переведя наши вычисления на&nbsp;GPU серверы.</p><p><img src="http://localhost:1337/uploads/test_img_ba6b85e8ae.png" alt="test_img.png"></p><h4>GPU серверы помогают обрабатывать огромные наборы данных</h4><p>Это&nbsp;огромный шаг&nbsp;вперёд в&nbsp;наших исследованиях. GPU серверы помогают обрабатывать огромные наборы данных, что&nbsp;раньше занимало&nbsp;бы&nbsp;много времени. Благодаря скорости и&nbsp;эффективности, GPU серверы становятся неотъемлемой частью вычислительной инфраструктуры. GPU серверы не&nbsp;только ускоряют процессы, но&nbsp;и&nbsp;значительно снижают затраты на&nbsp;обработку данных.</p><ol><li>Эти&nbsp;инновационные серверы открывают новые перспективы в&nbsp;области исследований и&nbsp;разработок, что&nbsp;приводит к&nbsp;появлению новых технологий и&nbsp;решений. GPU серверы являются катализатором для&nbsp;новаторских идей и&nbsp;создания инновационных продуктов.</li><li>Благодаря скорости и&nbsp;эффективности, GPU серверы становятся неотъемлемой частью вычислительной инфраструктуры. GPU серверы не&nbsp;только ускоряют процессы, но&nbsp;и&nbsp;значительно снижают затраты на&nbsp;обработку данных.</li></ol>	gpu-servers-news	2023-12-21 13:44:51.291	2023-12-22 10:19:58.127	2023-12-21 13:44:52.743	1	1	ru-RU	GPU серверы — это эволюционный переход в мире компьютерных систем, переопределяющий стандарты вычислений
3	<p>фвфывфывфывфыв</p>	testovaya-novost-ru	2023-12-22 13:36:49.699	2023-12-22 13:36:51.056	2023-12-22 13:36:51.049	1	1	ru-RU	тестовая новость ру
2	<p>GPU servers are an evolutionary shift in the world of computer systems, redefining computing standards. The GPU is a computational tool that turns ideas into images. Taking numbers beyond their standard purpose. These servers are equipped with graphics processing units specifically designed for parallel processing tasks. GPU servers can process huge amounts of data and perform complex calculations in a matter of milliseconds, which accelerates scientific and commercial research. The efficiency of GPU servers can be seen in fields ranging from deep learning to <a href="google.com">medical research</a>.</p><h4>The use of GPU servers in machine learning can speed up model training and improve the accuracy of results.</h4><p>GPU servers are attractive because of their ability to efficiently handle tasks that require high graphics power. GPU servers can be used to create stunning visual effects, animations and games with amazing detail and realism.</p><h2>Companies in the field of scientific research</h2><p>This is a huge step forward in our research. GPU servers help process huge datasets, which would have taken a lot of time before. With speed and efficiency, GPU servers are becoming an integral part of the computing infrastructure. GPU servers not only speed up processes, but also significantly reduce the cost of data processing.</p><p>With speed and efficiency, GPU servers are becoming an integral part of the computing infrastructure. GPU servers not only speed up processes, but also significantly reduce the cost of data processing.</p><h4>"Using GPU servers in machine learning can speed up model training and improve the accuracy of results."</h4><p>- Anna Lee, artificial intelligence researcher</p><p>These innovative servers open up new perspectives in research and development, leading to new technologies and solutions. GPU servers are a catalyst for pioneering ideas and creating innovative products.</p><p>Research shows that using GPU servers can significantly speed up the solution of complex tasks. We were able to speed up data processing by several times by transferring our calculations to GPU servers.</p><h2>GPU servers help process huge data sets</h2><p>This is a huge step forward in our research. GPU servers help process huge datasets, which would have taken a lot of time before. With speed and efficiency, GPU servers are becoming an integral part of the computing infrastructure. GPU servers not only speed up processes, but also significantly reduce the cost of data processing.</p><ol><li>These innovative servers open up new perspectives in research and development, leading to new technologies and solutions. GPU servers are a catalyst for pioneering ideas and creating innovative products.</li><li>GPU servers are becoming an integral part of the computing infrastructure due to their speed and efficiency. GPU servers not only speed up processes, but also significantly reduce data processing costs.</li></ol>	gpu-servers-news	2023-12-21 13:49:56.028	2023-12-22 10:19:58.112	2023-12-21 13:49:57.584	1	1	en-US	GPU servers news
4	<p>sadasdasdasd</p>	test-news-en	2023-12-22 13:37:17.408	2023-12-22 13:37:18.514	2023-12-22 13:37:18.509	1	1	en-US	test news en
\.


--
-- Data for Name: newsletters_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsletters_localizations_links (id, newsletter_id, inv_newsletter_id, newsletter_order) FROM stdin;
1	2	1	1
2	1	2	1
\.


--
-- Data for Name: newsletters_news_tags_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsletters_news_tags_links (id, newsletter_id, news_tag_id, news_tag_order, newsletter_order) FROM stdin;
1	1	1	0	1
2	2	2	0	1
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages (id, slug, created_at, updated_at, published_at, created_by_id, updated_by_id, title, locale, description) FROM stdin;
13	it-solutions-and-equipment-for-the-russian-market	2023-12-28 13:19:06.715	2023-12-28 13:19:49.02	2023-12-28 13:19:08.609	1	1	IT-решения  и оборудование для российского рынка	ru-RU	Лучшее оборудование в своём классе Комплексные IT-решения Сервисный центр
7	partners	2023-12-22 10:25:24.059	2023-12-22 10:25:25.119	2023-12-22 10:25:25.114	1	1	Partners	en-US	\N
1	partners	2023-12-21 14:39:50.299	2023-12-22 10:25:25.133	2023-12-21 14:39:51.451	1	1	Партнерам	ru-RU	\N
8	support	2023-12-22 10:25:45.847	2023-12-22 10:25:46.859	2023-12-22 10:25:46.853	1	1	Support	en-US	\N
2	support	2023-12-21 14:41:29.079	2023-12-22 10:25:46.871	2023-12-21 14:45:14.844	1	1	Поддержка	ru-RU	\N
9	about	2023-12-22 10:26:05.084	2023-12-22 10:26:06.105	2023-12-22 10:26:06.1	1	1	About	en-US	\N
3	about	2023-12-21 15:21:10.378	2023-12-22 10:26:06.116	2023-12-21 15:21:11.458	1	1	О компании	ru-RU	\N
10	contacts	2023-12-22 10:26:24.675	2023-12-22 10:26:25.626	2023-12-22 10:26:25.619	1	1	Contacts	en-US	\N
4	contacts	2023-12-21 15:21:25.438	2023-12-22 10:26:25.636	2023-12-21 15:21:26.509	1	1	Контакты	ru-RU	\N
11	news	2023-12-22 10:26:48.314	2023-12-22 10:26:49.491	2023-12-22 10:26:49.484	1	1	News	en-US	\N
5	news	2023-12-21 15:21:40.254	2023-12-22 10:26:49.5	2023-12-21 15:21:47.196	1	1	Новости	ru-RU	\N
12	events	2023-12-22 10:27:12.117	2023-12-22 10:27:13.407	2023-12-22 10:27:13.403	1	1	Events	en-US	\N
6	events	2023-12-21 15:22:05.246	2023-12-22 10:27:13.416	2023-12-21 15:22:06.423	1	1	Мероприятия	ru-RU	\N
14	it-solutions-and-equipment-for-the-russian-market	2023-12-28 13:19:47.743	2023-12-28 13:19:49.006	2023-12-28 13:19:49	1	1	IT solutions and equipment for the Russian market	en-US	Best-in-class equipment Comprehensive IT solutions Service Center
\.


--
-- Data for Name: pages_components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages_components (id, entity_id, component_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: pages_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages_localizations_links (id, page_id, inv_page_id, page_order) FROM stdin;
1	7	1	1
2	1	7	1
3	8	2	1
4	2	8	1
5	9	3	1
6	3	9	1
7	10	4	1
8	4	10	1
9	11	5	1
10	5	11	1
11	12	6	1
12	6	12	1
13	14	13	1
14	13	14	1
\.


--
-- Data for Name: partners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partners (id, name, description, link, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
2	vstack	Develops a hyperconverged platform for data storage and virtualization. The platform allows to create a fully managed virtual data center based on standard server equipment	ru.vstack.com	2023-12-21 13:35:43.871	2023-12-21 13:35:44.87	2023-12-21 13:35:44.865	1	1	en-US
1	vstack	Разрабатывает гиперконвергентную платформу для хранения данных и виртуализации. Платформа позволяет создать полностью управляемый виртуальный ЦОД на базе стандартного серверного оборудования	ru.vstack.com	2023-12-21 13:33:20.551	2023-12-21 13:35:44.889	2023-12-21 13:35:04.812	1	1	ru-RU
4	vase	Specializes in the creation and implementation of services for traffic control and analysis	vasexperts.ru	2023-12-21 13:36:49.887	2023-12-21 13:36:50.881	2023-12-21 13:36:50.876	1	1	en-US
3	vase	Специализируется на создании и внедрении сервисов для контроля и анализа трафика	vasexperts.ru	2023-12-21 13:36:20.911	2023-12-21 13:36:50.903	2023-12-21 13:36:21.917	1	1	ru-RU
6	itglobal	International group of companies, provider of IT services, products and services, developer of proprietary software products	itglobal.com	2023-12-21 13:37:50.922	2023-12-21 13:37:52.17	2023-12-21 13:37:52.166	1	1	en-US
5	itglobal	Международная группа компаний, поставщик IT-услуг, продуктов и сервисов, разработчик собственных программных продуктов	itglobal.com	2023-12-21 13:37:27.428	2023-12-21 13:37:52.189	2023-12-21 13:37:28.542	1	1	ru-RU
\.


--
-- Data for Name: partners_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partners_localizations_links (id, partner_id, inv_partner_id, partner_order) FROM stdin;
1	2	1	1
2	1	2	1
3	4	3	1
4	3	4	1
5	6	5	1
6	5	6	1
\.


--
-- Data for Name: partners_partners_type_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partners_partners_type_links (id, partner_id, partners_type_id, partner_order) FROM stdin;
1	1	1	1
2	2	2	1
3	3	1	2
4	4	2	2
5	5	3	1
6	6	4	1
\.


--
-- Data for Name: partners_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partners_types (id, name, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
2	Technological	2023-12-21 13:32:31.37	2023-12-21 13:32:31.37	1	1	en-US
1	Технологические	2023-12-21 13:32:11.485	2023-12-21 13:32:31.388	1	1	ru-RU
4	Integration	2023-12-21 13:32:51.813	2023-12-21 13:32:51.813	1	1	en-US
3	Интеграционные	2023-12-21 13:32:47.005	2023-12-21 13:32:51.824	1	1	ru-RU
\.


--
-- Data for Name: partners_types_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partners_types_localizations_links (id, partners_type_id, inv_partners_type_id, partners_type_order) FROM stdin;
1	2	1	1
2	1	2	1
3	4	3	1
4	3	4	1
\.


--
-- Data for Name: privacy_policies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privacy_policies (id, privacy, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	<p>ITGLOBAL.COM&nbsp;— международная группа компаний&nbsp;— глобальный поставщик комплексных технологических&nbsp;<br>ИТ-услуг, решений и&nbsp;сервисов с&nbsp;головным офисом в&nbsp;США. Более чем&nbsp;10-ти летний опыт работы с&nbsp;крупнейшими компаниями, представляющими широкий спектр отраслей экономики, позволил накопить опыт и&nbsp;компетенции, востребованные в&nbsp;Европе, Америке и&nbsp;Азии. Опираясь на&nbsp;многолетний опыт и&nbsp;компетенции, ITGLOBAL.COM превратился в&nbsp;мощного интегратора международного уровня, способного вывести бизнес клиентов на&nbsp;качественно новую ступень развития. В&nbsp;частности, группа компаний обеспечивает весь комплекс ИТ-услуг, направленных на&nbsp;развитие ИТ-инфраструктуры заказчика, его&nbsp;бизнеса в&nbsp;целом. В&nbsp;своей работе ITGLOBAL.COM использует лучшие решения от&nbsp;мировых производителей, имеет собственные площадки для&nbsp;хостинга инфраструктуры заказчика по&nbsp;всему миру, инвестирует и&nbsp;разрабатывает собственные ИТ-решения (RnD).</p><h2>1. Общие положения</h2><p>Настоящая политика обработки персональных данных составлена в&nbsp;соответствии с&nbsp;требованиями Федерального закона от&nbsp;27.07.2006 №&nbsp;152-ФЗ «О&nbsp;персональных данных» и&nbsp;определяет порядок обработки персональных данных и&nbsp;меры по&nbsp;обеспечению безопасности персональных данных в&nbsp;ООО&nbsp;«ИТГЛОБАЛКОМ РУС» (далее&nbsp;— Оператор).</p><ol><li>Оператор ставит своей важнейшей целью и&nbsp;условием осуществления своей деятельности соблюдение прав и&nbsp;свобод человека и&nbsp;гражданина при&nbsp;обработке его&nbsp;персональных данных, в&nbsp;том&nbsp;числе защиты прав на&nbsp;неприкосновенность частной жизни, личную и&nbsp;семейную тайну.</li><li>Настоящая политика Оператора в&nbsp;отношении обработки персональных данных (далее&nbsp;— Политика) применяется ко&nbsp;всей информации, которую Оператор может получить о&nbsp;посетителях веб-сайта  https://itpod.com.</li></ol><h2>2. Основные понятия, используемые в&nbsp;Политике</h2><ol><li>Автоматизированная обработка персональных данных&nbsp;— обработка персональных данных с&nbsp;помощью средств вычислительной техники;</li><li>Блокирование персональных данных&nbsp;— временное прекращение обработки персональных данных (за&nbsp;исключением случаев, если&nbsp;обработка необходима для&nbsp;уточнения персональных данных);</li><li>Веб-сайт&nbsp;— совокупность графических и&nbsp;информационных материалов, а&nbsp;также программ для&nbsp;ЭВМ&nbsp;и&nbsp;баз&nbsp;данных, обеспечивающих их&nbsp;доступность в&nbsp;сети интернет по&nbsp;сетевому адресу  https://itpod.com;</li></ol>	2023-12-21 15:35:59.089	2023-12-21 15:45:16.318	\N	1	1	ru-RU
2	<p>ITGLOBAL.COM is an international group of companies - a global provider of integrated technology services.&nbsp;<br>IT services, solutions and services with headquarters in the USA. More than 10 years of experience working with major companies representing a wide range of industries has allowed us to accumulate experience and competencies in demand in Europe, America and Asia. Relying on many years of experience and competence, ITGLOBAL.COM has become a powerful integrator of international level, capable of bringing the business of clients to a qualitatively new stage of development. In particular, the group of companies provides a full range of IT services aimed at the development of the customer's IT infrastructure and business as a whole. In its work ITGLOBAL.COM uses the best solutions from global manufacturers, has its own sites for hosting the customer's infrastructure worldwide, invests and develops its own IT solutions (RnD).</p><h2>1. General provisions</h2><p>This policy of personal data processing is drawn up in accordance with the requirements of the Federal Law dated 27.07.2006 No. 152-FZ "On Personal Data" and determines the order of personal data processing and measures to ensure the security of personal data in LLC "ITGLOBALCOM RUS" (hereinafter - the Operator).</p><ol><li>Оператор ставит своей важнейшей целью и&nbsp;условием осуществления своей деятельности соблюдение прав и&nbsp;свобод человека и&nbsp;гражданина при&nbsp;обработке его&nbsp;персональных данных, в&nbsp;том&nbsp;числе защиты прав на&nbsp;неприкосновенность частной жизни, личную и&nbsp;семейную тайну.</li><li>Настоящая политика Оператора в&nbsp;отношении обработки персональных данных (далее&nbsp;— Политика) применяется ко&nbsp;всей информации, которую Оператор может получить о&nbsp;посетителях веб-сайта  https://itpod.com.</li></ol><h2>2. Основные понятия, используемые в&nbsp;Политике</h2><ol><li>Автоматизированная обработка персональных данных&nbsp;— обработка персональных данных с&nbsp;помощью средств вычислительной техники;</li><li>Блокирование персональных данных&nbsp;— временное прекращение обработки персональных данных (за&nbsp;исключением случаев, если&nbsp;обработка необходима для&nbsp;уточнения персональных данных);</li><li>Веб-сайт&nbsp;— совокупность графических и&nbsp;информационных материалов, а&nbsp;также программ для&nbsp;ЭВМ&nbsp;и&nbsp;баз&nbsp;данных, обеспечивающих их&nbsp;доступность в&nbsp;сети интернет по&nbsp;сетевому адресу  https://itpod.com;</li></ol>	2023-12-21 15:45:16.287	2023-12-21 15:45:17.775	2023-12-21 15:45:17.767	1	1	en-US
\.


--
-- Data for Name: privacy_policies_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privacy_policies_localizations_links (id, privacy_policy_id, inv_privacy_policy_id, privacy_policy_order) FROM stdin;
1	2	1	1
2	1	2	1
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, disabled, slug, title) FROM stdin;
8	\N	2023-12-21 14:58:51.664	2023-12-22 11:02:23.762	2023-12-21 14:58:52.568	1	1	en-US	t	server-equipment	Server equipment
7	\N	2023-12-21 14:58:37.375	2023-12-22 11:02:23.777	2023-12-21 14:58:38.423	1	1	ru-RU	t	server-equipment	Сетевое оборудование
6	\N	2023-12-21 14:58:21.487	2023-12-22 11:02:55.354	2023-12-21 14:58:22.376	1	1	en-US	t	data-storage-systems	Data storage systems
5	\N	2023-12-21 14:58:07.169	2023-12-22 11:02:55.371	2023-12-21 14:58:08.156	1	1	ru-RU	t	data-storage-systems	Системы хранения данных
2	A set of systems with unified support for different tasks	2023-12-21 14:57:01.806	2023-12-22 11:03:33.06	2023-12-21 14:57:04.111	1	1	en-US	f	hardware-and-software-complexes	Hardware and software complexes
1	Комплекс систем с единой поддержкой для различных задач 	2023-12-21 14:56:28.747	2023-12-22 11:03:33.081	2023-12-21 14:56:29.695	1	1	ru-RU	f	hardware-and-software-complexes	Программно-аппаратные комплексы
4	High-performance servers for a variety of applications	2023-12-21 14:57:54.442	2023-12-22 11:04:17.456	2023-12-21 14:57:55.511	1	1	en-US	f	server-equipment	Server equipment
3	Высокопроизводительные серверы для решения различных задач	2023-12-21 14:57:28.018	2023-12-22 11:04:17.484	2023-12-21 14:57:29.05	1	1	ru-RU	f	server-equipment	Серверное оборудование
\.


--
-- Data for Name: products_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_localizations_links (id, product_id, inv_product_id, product_order) FROM stdin;
1	2	1	1
2	1	2	1
3	4	3	1
4	3	4	1
5	6	5	1
6	5	6	1
7	8	7	1
8	7	8	1
\.


--
-- Data for Name: server_processors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.server_processors (id, name, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
1	AMD EPYC	2023-12-21 13:27:31.295	2023-12-21 13:27:32.342	2023-12-21 13:27:32.338	1	1
2	Intel Xeon	2023-12-21 13:27:52.565	2023-12-21 13:27:53.416	2023-12-21 13:27:53.413	1	1
\.


--
-- Data for Name: server_series; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.server_series (id, created_at, updated_at, published_at, created_by_id, updated_by_id, title, slug) FROM stdin;
1	2023-12-21 13:27:15.393	2023-12-22 11:20:57.134	2023-12-21 13:27:16.362	1	1	vStack-R	vstack-r
\.


--
-- Data for Name: server_sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.server_sizes (id, name, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
1	1U	2023-12-21 13:25:48.809	2023-12-21 13:25:51.755	2023-12-21 13:25:51.741	1	1
4	4U	2023-12-21 13:26:11.145	2023-12-21 13:26:13.302	2023-12-21 13:26:13.298	1	1
2	2U	2023-12-21 13:25:57.695	2023-12-21 13:26:17.416	2023-12-21 13:26:17.412	1	1
3	3U	2023-12-21 13:26:05.449	2023-12-21 13:26:21.426	2023-12-21 13:26:21.421	1	1
5	Серверы 2U (Gen4)	2023-12-21 13:26:45.047	2023-12-21 13:26:46.062	2023-12-21 13:26:46.058	1	1
6	Серверы 2U Network appliance	2023-12-21 13:26:57.638	2023-12-21 13:26:58.975	2023-12-21 13:26:58.972	1	1
\.


--
-- Data for Name: server_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.server_types (id, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, title, slug) FROM stdin;
4	<p>vStack-R GPU servers with support for NVIDIA graphics adapters for deep learning and machine learning technologies.&nbsp;<br>and machine learning, artificial intelligence&nbsp;<br>and high-performance computing. We control every step of the journey, from factory production to shipping to the customer</p>	2023-12-22 11:28:09.465	2023-12-22 11:28:15.385	2023-12-22 11:28:11.521	1	1	en-US	GPU Computing	gpu-computing
3	<p>GPU-серверы vStack-R с&nbsp;поддержкой графических адаптеров NVIDIA для&nbsp;работы с&nbsp;технологиями глубокого&nbsp;<br>и&nbsp;машинного обучения, искусственного интеллекта&nbsp;<br>и&nbsp;высокопроизводительными вычислениями. Мы&nbsp;контролируем все&nbsp;этапы пути, от&nbsp;производства на&nbsp;заводе до&nbsp;отправки товара заказчику</p>	2023-12-22 11:27:44.696	2023-12-22 11:28:15.412	2023-12-22 11:27:46.122	1	1	ru-RU	GPU Computing	gpu-computing
2	<p>Reliable and productive servers under ITPOD brand on Intel and AMD processors. We control all stages of the journey, from production at the factory to the shipment of goods to the customer</p>	2023-12-21 14:07:01.32	2023-12-22 11:25:47.974	2023-12-21 14:07:02.67	1	1	en-US	General computing	general-computing
1	<p>Надёжные и&nbsp;производительные серверы под&nbsp;брендом ITPOD на&nbsp;процессорах Intel и&nbsp;AMD. Мы&nbsp;контролируем все&nbsp;этапы пути, от&nbsp;производства на заводе до&nbsp;отправки товара заказчику</p>	2023-12-21 14:01:14.962	2023-12-22 11:25:48.021	2023-12-21 14:01:16.394	1	1	ru-RU	General computing	general-computing
6	<p>Servers are used to create software-defined storage, media and backup storage or analytics solutions. We control every step of the journey, from factory production to shipping to the customer</p>	2023-12-22 12:07:55.387	2023-12-22 12:07:56.937	2023-12-22 12:07:56.931	1	1	en-US	Storage servers	storage-servers
5	<p>Серверы используются для&nbsp;создания программно-определяемых хранилищ, хранения мультимедиа и&nbsp;бэкапов или&nbsp;решений для&nbsp;аналитики. Мы&nbsp;контролируем все&nbsp;этапы пути, от&nbsp;производства на заводе до&nbsp;отправки товара заказчику</p>	2023-12-22 12:07:24.956	2023-12-22 12:10:20.873	2023-12-22 12:07:26.443	1	1	ru-RU	Storage серверы	storage
\.


--
-- Data for Name: server_types_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.server_types_localizations_links (id, server_type_id, inv_server_type_id, server_type_order) FROM stdin;
1	2	1	1
2	1	2	1
3	4	3	1
4	3	4	1
5	6	5	1
6	5	6	1
\.


--
-- Data for Name: server_types_server_processors_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.server_types_server_processors_links (id, server_type_id, server_processor_id, server_processor_order, server_type_order) FROM stdin;
1	1	1	1	1
2	1	2	0	1
3	2	2	1	2
4	2	1	0	2
5	3	2	1	3
6	3	1	0	3
7	4	2	1	4
8	4	1	0	4
9	5	2	1	5
10	5	1	0	5
11	6	2	1	6
12	6	1	0	6
\.


--
-- Data for Name: server_types_server_series_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.server_types_server_series_links (id, server_type_id, server_serieses_id, server_serieses_order, server_type_order) FROM stdin;
1	1	1	0	1
3	3	1	0	2
4	4	1	0	3
5	5	1	0	4
6	6	1	0	5
\.


--
-- Data for Name: servers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servers (id, doc_link, support_link, specs, slug, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, title) FROM stdin;
2	\N	\N	<figure class="table" style="width:97.57%;"><table class="ck-table-resized"><colgroup><col style="width:21.55%;"><col style="width:78.45%;"></colgroup><tbody><tr><td>Processor</td><td>2 x Intel Xeon Scalable 1st and 2nd generation (TDP up to 205 W)</td></tr><tr><td>Form factor</td><td>4U</td></tr><tr><td>RAM</td><td>24 slots DDR4 RDIMM/LRDIMM 2666/2933MHz</td></tr><tr><td>Storage subsystem</td><td><p>36 universal slots for 2.5" and 3.5" front-facing SATA/SAS drives with hot-swap support.</p><p>2 M.2 NVMe slots (2280 only)</p></td></tr><tr><td>Ethernet interfaces</td><td>2 x 1GbE RJ45 (Marvell 88E1512, built-in)</td></tr><tr><td>Expansion slots</td><td><p>1 OCP 3.0 slot (PCIe 3.0)</p><p>Riser 1: 3 full height PCIe 3.0 slots (x16 and 2x8)</p><p>Riser 2: 3 full height PCIe 3.0 slots (x16 and 2x8)</p><p>Riser 3: 2 half height PCIe 3.0 slots (2 x8) or 2.5" Rear Module (2 SATA/NVMe U.2 drives)</p><p>Riser 4: 2 half height PCIe 3.0 (2 x8) slots or 2.5" Rear Module (2 SATA/NVMe U.2 drives)</p></td></tr></tbody></table></figure>	sr401-d36re	2023-12-22 11:15:50.722	2023-12-22 11:15:52.555	2023-12-22 11:15:52.545	1	1	en-US	SR401–D36RE
1	\N	\N	<figure class="table" style="width:98%;"><table class="ck-table-resized"><colgroup><col style="width:22.54%;"><col style="width:77.46%;"></colgroup><tbody><tr><td>Процессор</td><td>2&nbsp;х&nbsp;Intel Xeon Scalable 1-го и&nbsp;2-го поколений&nbsp;(TDP до&nbsp;205&nbsp;Вт)</td></tr><tr><td>Форм-фактор</td><td>4U</td></tr><tr><td>Оперативная память</td><td>24&nbsp;слота DDR4&nbsp;RDIMM/LRDIMM 2666/2933MHz</td></tr><tr><td>Подсистема хранения</td><td><p>36&nbsp;универсальных слотов под&nbsp;2.5» и&nbsp;3.5» накопители SATA/SAS с&nbsp;фронтальной стороны и&nbsp;поддержкой горячей замены.</p><p>2&nbsp;слота M.2&nbsp;NVMe (2280&nbsp;only)</p></td></tr><tr><td>Ethernet интерфейсы</td><td>2&nbsp;x 1GbE RJ45 (Marvell 88E1512, встроенные)</td></tr><tr><td>Слоты расширения</td><td><p>1&nbsp;слот OCP 3.0 (PCIe 3.0)</p><p>Riser 1: 3&nbsp;full height слота PCIe 3.0 (x16&nbsp;и&nbsp;2x8)</p><p>Riser 2: 3&nbsp;full height слота PCIe 3.0 (x16&nbsp;и&nbsp;2x8)</p><p>Riser 3: 2&nbsp;half height слота PCIe 3.0 (2&nbsp;x8)&nbsp;или&nbsp;2.5» Rear Module (2&nbsp;накопителя SATA/NVMe U.2)</p><p>Riser 4: 2&nbsp;half height слота PCIe 3.0 (2&nbsp;x8)&nbsp;или&nbsp;2.5» Rear Module (2&nbsp;накопителя SATA/NVMe U.2)</p></td></tr></tbody></table></figure>	sr401-d36re	2023-12-22 11:10:47.079	2023-12-22 11:15:52.598	2023-12-22 11:10:49.154	1	1	ru-RU	SR401–D36RE
\.


--
-- Data for Name: servers_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servers_localizations_links (id, server_id, inv_server_id, server_order) FROM stdin;
1	2	1	1
2	1	2	1
\.


--
-- Data for Name: servers_server_processor_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servers_server_processor_links (id, server_id, server_processor_id, server_order) FROM stdin;
1	1	2	1
2	2	2	2
\.


--
-- Data for Name: servers_server_series_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servers_server_series_links (id, server_id, server_serieses_id, server_order) FROM stdin;
1	1	1	1
2	2	1	2
\.


--
-- Data for Name: servers_server_size_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servers_server_size_links (id, server_id, server_size_id, server_order) FROM stdin;
1	1	4	1
2	2	4	2
\.


--
-- Data for Name: site_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.site_contacts (id, phone, email, address, "time", created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	+7 812 313-88-54	itpod@gmail.com	Ленинская слобода, д. 26, здание 5,  офис 5519, Москва, 115280	09:00-18:00	2023-12-22 12:11:39.504	2023-12-22 12:12:08.351	2023-12-22 12:11:41.741	1	1	ru-RU
2	+7 000 000-00-00	itpod@gmail.com	Leninskaya Sloboda, 26, building 5,  office 5519, Moscow, 115280	09:00-18:00	2023-12-22 12:12:08.337	2023-12-22 12:12:10.105	2023-12-22 12:12:10.095	1	1	en-US
\.


--
-- Data for Name: site_contacts_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.site_contacts_localizations_links (id, site_contact_id, inv_site_contact_id, site_contact_order) FROM stdin;
1	2	1	1
2	1	2	1
\.


--
-- Data for Name: site_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.site_settings (id, response_email, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	andrey.savilov@drozd.red	2023-12-22 10:50:50.188	2023-12-22 12:11:14.315	1	1
\.


--
-- Data for Name: site_settings_footer_form_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.site_settings_footer_form_links (id, site_setting_id, form_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: slugs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.slugs (id, slug, count, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	api::address.address.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
2	api::address.address.findOne	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
3	api::event.event.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
4	api::event.event.findOne	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
5	api::form.form.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
6	api::form.form.findOne	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
7	api::form-field.form-field.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
8	api::form-field.form-field.findOne	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
9	api::news-tag.news-tag.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
10	api::news-tag.news-tag.findOne	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
11	api::newsletter.newsletter.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
12	api::newsletter.newsletter.findOne	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
13	api::page.page.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
14	api::page.page.findOne	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
15	api::partner.partner.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
16	api::partner.partner.findOne	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
17	api::partners-type.partners-type.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
18	api::partners-type.partners-type.findOne	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
19	api::privacy-policy.privacy-policy.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
20	api::product.product.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
21	api::product.product.findOne	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
22	api::server.server.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
23	api::server.server.findOne	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
24	api::server-processor.server-processor.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
25	api::server-processor.server-processor.findOne	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
26	api::server-serieses.server-serieses.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
27	api::server-serieses.server-serieses.findOne	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
28	api::server-size.server-size.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
29	api::server-size.server-size.findOne	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
30	api::server-type.server-type.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
31	api::server-type.server-type.findOne	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
32	api::site-contact.site-contact.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
33	api::site-setting.site-setting.find	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
34	plugin::navigation.client.readAll	2023-12-22 15:48:53.295	2023-12-22 15:48:53.295	\N	\N
35	plugin::navigation.client.render	2023-12-22 15:50:04.469	2023-12-22 15:50:04.469	\N	\N
36	plugin::navigation.client.renderChild	2023-12-22 15:50:04.469	2023-12-22 15:50:04.469	\N	\N
37	plugin::email.email.send	2023-12-27 16:26:57.907	2023-12-27 16:26:57.907	\N	\N
\.


--
-- Data for Name: strapi_api_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_token_permissions_token_links (id, api_token_permission_id, api_token_id, api_token_permission_order) FROM stdin;
1	2	1	1
2	1	1	1
3	3	1	2
4	5	1	2
5	4	1	2
6	6	1	2
7	7	1	2
8	8	1	2
9	9	1	2
10	10	1	3
11	11	1	3
12	12	1	3
13	13	1	3
14	14	1	3
15	16	1	3
16	15	1	3
17	17	1	3
18	18	1	4
19	19	1	4
20	20	1	4
21	21	1	5
22	22	1	5
23	23	1	5
24	27	1	5
25	24	1	5
26	25	1	5
27	26	1	5
28	28	1	5
29	29	1	6
30	30	1	6
31	31	1	6
32	32	1	6
33	33	1	6
34	34	1	6
35	35	1	7
36	36	1	7
37	37	1	8
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_tokens (id, name, description, type, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	api	token for nextjs api	custom	299042c6f82467506d2ce04e7a8149279cfafe5b48ecfe38d41ea65a807b80a11cb00fc107c522ed931fa9ec4300f2dba6f7cf35e948231be1ebb42512559e7e	\N	\N	\N	2023-12-21 16:32:58.643	2023-12-27 16:26:57.897	\N	\N
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
2	plugin_content_manager_configuration_content_types::admin::permission	{"uid":"admin::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6}],[{"name":"actionParameters","size":12}],[{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]}}	object	\N	\N
3	plugin_content_manager_configuration_content_types::admin::role	{"uid":"admin::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]}}	object	\N	\N
4	plugin_content_manager_configuration_content_types::admin::api-token	{"uid":"admin::api-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"permissions","size":6}],[{"name":"expiresAt","size":6},{"name":"lifespan","size":4}]]}}	object	\N	\N
5	plugin_content_manager_configuration_content_types::admin::user	{"uid":"admin::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]}}	object	\N	\N
6	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"uid":"admin::api-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]}}	object	\N	\N
7	plugin_content_manager_configuration_content_types::admin::transfer-token	{"uid":"admin::transfer-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]}}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::upload.file	{"uid":"plugin::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]}}	object	\N	\N
8	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"uid":"admin::transfer-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]}}	object	\N	\N
1	strapi_content_types_schema	{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token-permission","connection":"default","uid":"admin::api-token-permission","plugin":"admin","globalId":"AdminApiTokenPermission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token","connection":"default","uid":"admin::transfer-token","plugin":"admin","globalId":"AdminTransferToken"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token-permission","connection":"default","uid":"admin::transfer-token-permission","plugin":"admin","globalId":"AdminTransferTokenPermission"},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"folder","connection":"default","uid":"plugin::upload.folder","plugin":"upload","globalId":"UploadFolder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"},"plugin::menus.menu":{"kind":"collectionType","collectionName":"menus","info":{"name":"Menu","displayName":"Menu","singularName":"menu","pluralName":"menus","tableName":"menus"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"title":{"type":"string","required":true},"slug":{"type":"uid","targetField":"title","required":true},"items":{"type":"relation","relation":"oneToMany","target":"plugin::menus.menu-item","mappedBy":"root_menu"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"menus","info":{"name":"Menu","displayName":"Menu","singularName":"menu","pluralName":"menus","tableName":"menus"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"title":{"type":"string","required":true},"slug":{"type":"uid","targetField":"title","required":true},"items":{"type":"relation","relation":"oneToMany","target":"plugin::menus.menu-item","mappedBy":"root_menu"}},"kind":"collectionType"},"modelType":"contentType","modelName":"menu","connection":"default","uid":"plugin::menus.menu","plugin":"menus","globalId":"MenusMenu"},"plugin::menus.menu-item":{"kind":"collectionType","collectionName":"menu_items","info":{"name":"MenuItem","displayName":"Menu Item","singularName":"menu-item","pluralName":"menu-items","tableName":"menu_items"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"order":{"type":"integer"},"title":{"type":"string","required":true},"url":{"type":"string"},"target":{"type":"enumeration","enum":["_blank","_parent","_self","_top"]},"root_menu":{"type":"relation","relation":"manyToOne","target":"plugin::menus.menu","inversedBy":"items","required":true},"parent":{"type":"relation","relation":"oneToOne","target":"plugin::menus.menu-item"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"menu_items","info":{"name":"MenuItem","displayName":"Menu Item","singularName":"menu-item","pluralName":"menu-items","tableName":"menu_items"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"order":{"type":"integer"},"title":{"type":"string","required":true},"url":{"type":"string"},"target":{"type":"enumeration","enum":["_blank","_parent","_self","_top"]},"root_menu":{"type":"relation","relation":"manyToOne","target":"plugin::menus.menu","inversedBy":"items","required":true},"parent":{"type":"relation","relation":"oneToOne","target":"plugin::menus.menu-item"}},"kind":"collectionType"},"modelType":"contentType","modelName":"menu-item","connection":"default","uid":"plugin::menus.menu-item","plugin":"menus","globalId":"MenusMenuItem"},"plugin::navigation.audience":{"collectionName":"audience","info":{"singularName":"audience","pluralName":"audiences","displayName":"Audience","name":"audience"},"options":{"increments":true,"comment":"Audience"},"attributes":{"name":{"type":"string","required":true},"key":{"type":"uid","targetField":"name"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"audience","info":{"singularName":"audience","pluralName":"audiences","displayName":"Audience","name":"audience"},"options":{"increments":true,"comment":"Audience"},"attributes":{"name":{"type":"string","required":true},"key":{"type":"uid","targetField":"name"}},"kind":"collectionType"},"modelType":"contentType","modelName":"audience","connection":"default","uid":"plugin::navigation.audience","plugin":"navigation","globalId":"NavigationAudience"},"plugin::navigation.navigation":{"collectionName":"navigations","info":{"singularName":"navigation","pluralName":"navigations","displayName":"Navigation","name":"navigation"},"options":{"increments":true,"comment":""},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"text","configurable":false,"required":true},"slug":{"type":"uid","target":"name","configurable":false,"required":true},"visible":{"type":"boolean","default":false,"configurable":false},"items":{"type":"relation","relation":"oneToMany","target":"plugin::navigation.navigation-item","configurable":false,"mappedBy":"master"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::navigation.navigation"},"localeCode":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"navigations","info":{"singularName":"navigation","pluralName":"navigations","displayName":"Navigation","name":"navigation"},"options":{"increments":true,"comment":""},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"text","configurable":false,"required":true},"slug":{"type":"uid","target":"name","configurable":false,"required":true},"visible":{"type":"boolean","default":false,"configurable":false},"items":{"type":"relation","relation":"oneToMany","target":"plugin::navigation.navigation-item","configurable":false,"mappedBy":"master"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::navigation.navigation"},"localeCode":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"navigation","connection":"default","uid":"plugin::navigation.navigation","plugin":"navigation","globalId":"NavigationNavigation"},"plugin::navigation.navigation-item":{"collectionName":"navigations_items","info":{"singularName":"navigation-item","pluralName":"navigation-items","displayName":"Navigation Item","name":"navigation-item"},"options":{"increments":true,"timestamps":true,"comment":"Navigation Item"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false},"i18n":{"localized":false}},"attributes":{"title":{"type":"text","configurable":false,"required":true,"pluginOptions":{"i18n":{"localized":false}}},"type":{"type":"enumeration","enum":["INTERNAL","EXTERNAL","WRAPPER"],"default":"INTERNAL","configurable":false},"path":{"type":"text","targetField":"title","configurable":false},"externalPath":{"type":"text","configurable":false},"uiRouterKey":{"type":"string","configurable":false},"menuAttached":{"type":"boolean","default":false,"configurable":false},"order":{"type":"integer","default":0,"configurable":false},"collapsed":{"type":"boolean","default":false,"configurable":false},"related":{"type":"relation","relation":"oneToOne","target":"plugin::navigation.navigations-items-related","configurable":false},"parent":{"type":"relation","relation":"oneToOne","target":"plugin::navigation.navigation-item","configurable":false,"default":null},"master":{"type":"relation","relation":"manyToOne","target":"plugin::navigation.navigation","configurable":false,"inversedBy":"items"},"audience":{"type":"relation","relation":"oneToMany","target":"plugin::navigation.audience"},"additionalFields":{"type":"json","require":false,"default":{}},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"navigations_items","info":{"singularName":"navigation-item","pluralName":"navigation-items","displayName":"Navigation Item","name":"navigation-item"},"options":{"increments":true,"timestamps":true,"comment":"Navigation Item"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false},"i18n":{"localized":false}},"attributes":{"title":{"type":"text","configurable":false,"required":true,"pluginOptions":{"i18n":{"localized":false}}},"type":{"type":"enumeration","enum":["INTERNAL","EXTERNAL","WRAPPER"],"default":"INTERNAL","configurable":false},"path":{"type":"text","targetField":"title","configurable":false},"externalPath":{"type":"text","configurable":false},"uiRouterKey":{"type":"string","configurable":false},"menuAttached":{"type":"boolean","default":false,"configurable":false},"order":{"type":"integer","default":0,"configurable":false},"collapsed":{"type":"boolean","default":false,"configurable":false},"related":{"type":"relation","relation":"oneToOne","target":"plugin::navigation.navigations-items-related","configurable":false},"parent":{"type":"relation","relation":"oneToOne","target":"plugin::navigation.navigation-item","configurable":false,"default":null},"master":{"type":"relation","relation":"manyToOne","target":"plugin::navigation.navigation","configurable":false,"inversedBy":"items"},"audience":{"type":"relation","relation":"oneToMany","target":"plugin::navigation.audience"},"additionalFields":{"type":"json","require":false,"default":{}}},"kind":"collectionType"},"modelType":"contentType","modelName":"navigation-item","connection":"default","uid":"plugin::navigation.navigation-item","plugin":"navigation","globalId":"NavigationNavigationItem"},"plugin::navigation.navigations-items-related":{"collectionName":"navigations_items_related","info":{"singularName":"navigations-items-related","pluralName":"navigations-items-relateds","displayName":"Navigations Items Related","name":"navigations_items_related"},"options":{"increments":true,"timestamps":false,"populateCreatorFields":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false},"i18n":{"localized":false}},"attributes":{"related_id":{"type":"string","required":true},"related_type":{"type":"string","required":true},"field":{"type":"string","required":true},"order":{"type":"integer","required":true},"master":{"type":"string","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"navigations_items_related","info":{"singularName":"navigations-items-related","pluralName":"navigations-items-relateds","displayName":"Navigations Items Related","name":"navigations_items_related"},"options":{"increments":true,"timestamps":false,"populateCreatorFields":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false},"i18n":{"localized":false}},"attributes":{"related_id":{"type":"string","required":true},"related_type":{"type":"string","required":true},"field":{"type":"string","required":true},"order":{"type":"integer","required":true},"master":{"type":"string","required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"navigations-items-related","connection":"default","uid":"plugin::navigation.navigations-items-related","plugin":"navigation","globalId":"NavigationNavigationsItemsRelated"},"plugin::slugify.slug":{"kind":"collectionType","collectionName":"slugs","info":{"singularName":"slug","pluralName":"slugs","displayName":"slug"},"options":{"draftAndPublish":false,"comment":""},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"slug":{"type":"text"},"count":{"type":"integer"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"slugs","info":{"singularName":"slug","pluralName":"slugs","displayName":"slug"},"options":{"draftAndPublish":false,"comment":""},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"slug":{"type":"text"},"count":{"type":"integer"}},"kind":"collectionType"},"modelType":"contentType","modelName":"slug","connection":"default","uid":"plugin::slugify.slug","plugin":"slugify","globalId":"SlugifySlug"},"api::address.address":{"kind":"collectionType","collectionName":"addresses","info":{"singularName":"address","pluralName":"addresses","displayName":"address","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"city":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"mail":{"pluginOptions":{"i18n":{"localized":false}},"type":"email"},"phone":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"address":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"hours":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","default":"09:00-18:00"},"map":{"pluginOptions":{"i18n":{"localized":false}},"type":"richtext","options":{"output":"HTML","preset":"light"},"customField":"plugin::ckeditor.CKEditor"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::address.address"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"addresses","info":{"singularName":"address","pluralName":"addresses","displayName":"address","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"city":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"mail":{"pluginOptions":{"i18n":{"localized":false}},"type":"email"},"phone":{"pluginOptions":{"i18n":{"localized":false}},"type":"string"},"address":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"hours":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","default":"09:00-18:00"},"map":{"pluginOptions":{"i18n":{"localized":false}},"type":"customField","options":{"output":"HTML","preset":"light"},"customField":"plugin::ckeditor.CKEditor"}},"kind":"collectionType"},"modelType":"contentType","modelName":"address","connection":"default","uid":"api::address.address","apiName":"address","globalId":"Address","actions":{},"lifecycles":{}},"api::event.event":{"kind":"collectionType","collectionName":"events","info":{"singularName":"event","pluralName":"events","displayName":"event","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"type":{"pluginOptions":{"i18n":{"localized":true}},"type":"enumeration","enum":["online","offline"]},"register":{"pluginOptions":{"i18n":{"localized":false}},"type":"enumeration","enum":["closed","open"],"default":"closed"},"time_start":{"pluginOptions":{"i18n":{"localized":true}},"type":"datetime"},"time_end":{"pluginOptions":{"i18n":{"localized":true}},"type":"datetime"},"content":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext","options":{"output":"HTML","preset":"rich"},"customField":"plugin::ckeditor.CKEditor"},"slug":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","options":{"pattern":"title"},"customField":"plugin::slug.slug"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::event.event"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"events","info":{"singularName":"event","pluralName":"events","displayName":"event","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"type":{"pluginOptions":{"i18n":{"localized":true}},"type":"enumeration","enum":["online","offline"]},"register":{"pluginOptions":{"i18n":{"localized":false}},"type":"enumeration","enum":["closed","open"],"default":"closed"},"time_start":{"pluginOptions":{"i18n":{"localized":true}},"type":"datetime"},"time_end":{"pluginOptions":{"i18n":{"localized":true}},"type":"datetime"},"content":{"pluginOptions":{"i18n":{"localized":true}},"type":"customField","options":{"output":"HTML","preset":"rich"},"customField":"plugin::ckeditor.CKEditor"},"slug":{"pluginOptions":{"i18n":{"localized":false}},"type":"customField","options":{"pattern":"title"},"customField":"plugin::slug.slug"}},"kind":"collectionType"},"modelType":"contentType","modelName":"event","connection":"default","uid":"api::event.event","apiName":"event","globalId":"Event","actions":{},"lifecycles":{}},"api::form.form":{"kind":"collectionType","collectionName":"forms","info":{"singularName":"form","pluralName":"forms","displayName":"form","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"send_text":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"privacy":{"pluginOptions":{"i18n":{"localized":true}},"type":"boolean"},"form_fields":{"type":"relation","relation":"oneToMany","target":"api::form-field.form-field"},"success_message":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext","options":{"output":"HTML","preset":"standard"},"customField":"plugin::ckeditor.CKEditor"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::form.form"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"forms","info":{"singularName":"form","pluralName":"forms","displayName":"form","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"send_text":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"privacy":{"pluginOptions":{"i18n":{"localized":true}},"type":"boolean"},"form_fields":{"type":"relation","relation":"oneToMany","target":"api::form-field.form-field"},"success_message":{"pluginOptions":{"i18n":{"localized":true}},"type":"customField","options":{"output":"HTML","preset":"standard"},"customField":"plugin::ckeditor.CKEditor"}},"kind":"collectionType"},"modelType":"contentType","modelName":"form","connection":"default","uid":"api::form.form","apiName":"form","globalId":"Form","actions":{},"lifecycles":{}},"api::form-field.form-field":{"kind":"collectionType","collectionName":"form_fields","info":{"singularName":"form-field","pluralName":"form-fields","displayName":"form_field","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","required":true},"placeholder":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"type":{"pluginOptions":{"i18n":{"localized":false}},"type":"enumeration","enum":["text","tel","textarea","email"],"default":"text"},"required":{"pluginOptions":{"i18n":{"localized":false}},"type":"boolean","default":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::form-field.form-field"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"form_fields","info":{"singularName":"form-field","pluralName":"form-fields","displayName":"form_field","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","required":true},"placeholder":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"type":{"pluginOptions":{"i18n":{"localized":false}},"type":"enumeration","enum":["text","tel","textarea","email"],"default":"text"},"required":{"pluginOptions":{"i18n":{"localized":false}},"type":"boolean","default":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"form-field","connection":"default","uid":"api::form-field.form-field","apiName":"form-field","globalId":"FormField","actions":{},"lifecycles":{}},"api::news-tag.news-tag":{"kind":"collectionType","collectionName":"news_tags","info":{"singularName":"news-tag","pluralName":"news-tags","displayName":"News_tag","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"newsletters":{"type":"relation","relation":"manyToMany","target":"api::newsletter.newsletter","mappedBy":"news_tags"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::news-tag.news-tag"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"news_tags","info":{"singularName":"news-tag","pluralName":"news-tags","displayName":"News_tag","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"newsletters":{"type":"relation","relation":"manyToMany","target":"api::newsletter.newsletter","mappedBy":"news_tags"}},"kind":"collectionType"},"modelType":"contentType","modelName":"news-tag","connection":"default","uid":"api::news-tag.news-tag","apiName":"news-tag","globalId":"NewsTag","actions":{},"lifecycles":{}},"api::newsletter.newsletter":{"kind":"collectionType","collectionName":"newsletters","info":{"singularName":"newsletter","pluralName":"newsletters","displayName":"newsletter","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"news_tags":{"type":"relation","relation":"manyToMany","target":"api::news-tag.news-tag","inversedBy":"newsletters"},"content":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext","options":{"output":"HTML","preset":"standard"},"customField":"plugin::ckeditor.CKEditor"},"slug":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","options":{"pattern":"title"},"customField":"plugin::slug.slug"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::newsletter.newsletter"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"newsletters","info":{"singularName":"newsletter","pluralName":"newsletters","displayName":"newsletter","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"news_tags":{"type":"relation","relation":"manyToMany","target":"api::news-tag.news-tag","inversedBy":"newsletters"},"content":{"pluginOptions":{"i18n":{"localized":true}},"type":"customField","options":{"output":"HTML","preset":"standard"},"customField":"plugin::ckeditor.CKEditor"},"slug":{"pluginOptions":{"i18n":{"localized":false}},"type":"customField","options":{"pattern":"title"},"customField":"plugin::slug.slug"}},"kind":"collectionType"},"modelType":"contentType","modelName":"newsletter","connection":"default","uid":"api::newsletter.newsletter","apiName":"newsletter","globalId":"Newsletter","actions":{},"lifecycles":{}},"api::page.page":{"kind":"collectionType","collectionName":"pages","info":{"singularName":"page","pluralName":"pages","displayName":"page","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"slug":{"type":"string","options":{"pattern":"title"},"customField":"plugin::slug.slug"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"block1":{"pluginOptions":{"i18n":{"localized":true}},"type":"dynamiczone","components":["page-components.cards"],"required":true},"block2":{"pluginOptions":{"i18n":{"localized":true}},"type":"dynamiczone","components":["page-components.cards"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::page.page"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"pages","info":{"singularName":"page","pluralName":"pages","displayName":"page","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"slug":{"type":"customField","options":{"pattern":"title"},"customField":"plugin::slug.slug"},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"block1":{"pluginOptions":{"i18n":{"localized":true}},"type":"dynamiczone","components":["page-components.cards"],"required":true},"block2":{"pluginOptions":{"i18n":{"localized":true}},"type":"dynamiczone","components":["page-components.cards"]}},"kind":"collectionType"},"modelType":"contentType","modelName":"page","connection":"default","uid":"api::page.page","apiName":"page","globalId":"Page","actions":{},"lifecycles":{}},"api::partner.partner":{"kind":"collectionType","collectionName":"partners","info":{"singularName":"partner","pluralName":"partners","displayName":"Partner"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","required":true},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"logo":{"allowedTypes":["images"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}}},"link":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","default":"itpod.ru","required":true},"partners_type":{"type":"relation","relation":"manyToOne","target":"api::partners-type.partners-type","inversedBy":"partners"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::partner.partner"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"partners","info":{"singularName":"partner","pluralName":"partners","displayName":"Partner"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","required":true},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"logo":{"allowedTypes":["images"],"type":"media","multiple":false,"pluginOptions":{"i18n":{"localized":false}}},"link":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","default":"itpod.ru","required":true},"partners_type":{"type":"relation","relation":"manyToOne","target":"api::partners-type.partners-type","inversedBy":"partners"}},"kind":"collectionType"},"modelType":"contentType","modelName":"partner","connection":"default","uid":"api::partner.partner","apiName":"partner","globalId":"Partner","actions":{},"lifecycles":{}},"api::partners-type.partners-type":{"kind":"collectionType","collectionName":"partners_types","info":{"singularName":"partners-type","pluralName":"partners-types","displayName":"partners_type"},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"partners":{"type":"relation","relation":"oneToMany","target":"api::partner.partner","mappedBy":"partners_type"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::partners-type.partners-type"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"partners_types","info":{"singularName":"partners-type","pluralName":"partners-types","displayName":"partners_type"},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"partners":{"type":"relation","relation":"oneToMany","target":"api::partner.partner","mappedBy":"partners_type"}},"kind":"collectionType"},"modelType":"contentType","modelName":"partners-type","connection":"default","uid":"api::partners-type.partners-type","apiName":"partners-type","globalId":"PartnersType","actions":{},"lifecycles":{}},"api::privacy-policy.privacy-policy":{"kind":"singleType","collectionName":"privacy_policies","info":{"singularName":"privacy-policy","pluralName":"privacy-policies","displayName":"privacy_policy","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"privacy":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext","options":{"output":"HTML","preset":"standard"},"customField":"plugin::ckeditor.CKEditor"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::privacy-policy.privacy-policy"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"privacy_policies","info":{"singularName":"privacy-policy","pluralName":"privacy-policies","displayName":"privacy_policy","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"privacy":{"pluginOptions":{"i18n":{"localized":true}},"type":"customField","options":{"output":"HTML","preset":"standard"},"customField":"plugin::ckeditor.CKEditor"}},"kind":"singleType"},"modelType":"contentType","modelName":"privacy-policy","connection":"default","uid":"api::privacy-policy.privacy-policy","apiName":"privacy-policy","globalId":"PrivacyPolicy","actions":{},"lifecycles":{}},"api::product.product":{"kind":"collectionType","collectionName":"products","info":{"singularName":"product","pluralName":"products","displayName":"product","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"disabled":{"pluginOptions":{"i18n":{"localized":true}},"type":"boolean","default":false},"slug":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","options":{"pattern":"title"},"customField":"plugin::slug.slug"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::product.product"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"products","info":{"singularName":"product","pluralName":"products","displayName":"product","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"disabled":{"pluginOptions":{"i18n":{"localized":true}},"type":"boolean","default":false},"slug":{"pluginOptions":{"i18n":{"localized":false}},"type":"customField","options":{"pattern":"title"},"customField":"plugin::slug.slug"}},"kind":"collectionType"},"modelType":"contentType","modelName":"product","connection":"default","uid":"api::product.product","apiName":"product","globalId":"Product","actions":{},"lifecycles":{}},"api::server.server":{"kind":"collectionType","collectionName":"servers","info":{"singularName":"server","pluralName":"servers","displayName":"server","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","required":true},"imgs":{"type":"media","multiple":true,"required":false,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"doc_link":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"support_link":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"specs":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext","options":{"output":"HTML","preset":"standard"},"customField":"plugin::ckeditor.CKEditor"},"server_series":{"type":"relation","relation":"manyToOne","target":"api::server-serieses.server-serieses","inversedBy":"servers"},"server_processor":{"type":"relation","relation":"manyToOne","target":"api::server-processor.server-processor","inversedBy":"servers"},"server_size":{"type":"relation","relation":"manyToOne","target":"api::server-size.server-size","inversedBy":"servers"},"slug":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","options":{"pattern":"title"},"customField":"plugin::slug.slug"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::server.server"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"servers","info":{"singularName":"server","pluralName":"servers","displayName":"server","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","required":true},"imgs":{"type":"media","multiple":true,"required":false,"allowedTypes":["images"],"pluginOptions":{"i18n":{"localized":false}}},"doc_link":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"support_link":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"specs":{"pluginOptions":{"i18n":{"localized":true}},"type":"customField","options":{"output":"HTML","preset":"standard"},"customField":"plugin::ckeditor.CKEditor"},"server_series":{"type":"relation","relation":"manyToOne","target":"api::server-serieses.server-serieses","inversedBy":"servers"},"server_processor":{"type":"relation","relation":"manyToOne","target":"api::server-processor.server-processor","inversedBy":"servers"},"server_size":{"type":"relation","relation":"manyToOne","target":"api::server-size.server-size","inversedBy":"servers"},"slug":{"pluginOptions":{"i18n":{"localized":false}},"type":"customField","options":{"pattern":"title"},"customField":"plugin::slug.slug"}},"kind":"collectionType"},"modelType":"contentType","modelName":"server","connection":"default","uid":"api::server.server","apiName":"server","globalId":"Server","actions":{},"lifecycles":{}},"api::server-processor.server-processor":{"kind":"collectionType","collectionName":"server_processors","info":{"singularName":"server-processor","pluralName":"server-processors","displayName":"server_processor"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"servers":{"type":"relation","relation":"oneToMany","target":"api::server.server","mappedBy":"server_processor"},"server_types":{"type":"relation","relation":"manyToMany","target":"api::server-type.server-type","mappedBy":"server_processors"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"server_processors","info":{"singularName":"server-processor","pluralName":"server-processors","displayName":"server_processor"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"servers":{"type":"relation","relation":"oneToMany","target":"api::server.server","mappedBy":"server_processor"},"server_types":{"type":"relation","relation":"manyToMany","target":"api::server-type.server-type","mappedBy":"server_processors"}},"kind":"collectionType"},"modelType":"contentType","modelName":"server-processor","connection":"default","uid":"api::server-processor.server-processor","apiName":"server-processor","globalId":"ServerProcessor","actions":{},"lifecycles":{}},"api::server-serieses.server-serieses":{"kind":"collectionType","collectionName":"server_series","info":{"singularName":"server-serieses","pluralName":"server-series","displayName":"server_series","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"servers":{"type":"relation","relation":"oneToMany","target":"api::server.server","mappedBy":"server_series"},"server_types":{"type":"relation","relation":"manyToMany","target":"api::server-type.server-type","mappedBy":"server_series"},"slug":{"type":"string","options":{"pattern":"title"},"customField":"plugin::slug.slug"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"server_series","info":{"singularName":"server-serieses","pluralName":"server-series","displayName":"server_series","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string"},"servers":{"type":"relation","relation":"oneToMany","target":"api::server.server","mappedBy":"server_series"},"server_types":{"type":"relation","relation":"manyToMany","target":"api::server-type.server-type","mappedBy":"server_series"},"slug":{"type":"customField","options":{"pattern":"title"},"customField":"plugin::slug.slug"}},"kind":"collectionType"},"modelType":"contentType","modelName":"server-serieses","connection":"default","uid":"api::server-serieses.server-serieses","apiName":"server-serieses","globalId":"ServerSerieses","actions":{},"lifecycles":{}},"api::server-size.server-size":{"kind":"collectionType","collectionName":"server_sizes","info":{"singularName":"server-size","pluralName":"server-sizes","displayName":"server_size"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"servers":{"type":"relation","relation":"oneToMany","target":"api::server.server","mappedBy":"server_size"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"server_sizes","info":{"singularName":"server-size","pluralName":"server-sizes","displayName":"server_size"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"servers":{"type":"relation","relation":"oneToMany","target":"api::server.server","mappedBy":"server_size"}},"kind":"collectionType"},"modelType":"contentType","modelName":"server-size","connection":"default","uid":"api::server-size.server-size","apiName":"server-size","globalId":"ServerSize","actions":{},"lifecycles":{}},"api::server-type.server-type":{"kind":"collectionType","collectionName":"server_types","info":{"singularName":"server-type","pluralName":"server-types","displayName":"server_type","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"richtext","options":{"output":"HTML","preset":"light"},"customField":"plugin::ckeditor.CKEditor"},"server_series":{"type":"relation","relation":"manyToMany","target":"api::server-serieses.server-serieses","inversedBy":"server_types"},"server_processors":{"type":"relation","relation":"manyToMany","target":"api::server-processor.server-processor","inversedBy":"server_types"},"slug":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","options":{"pattern":"title"},"customField":"plugin::slug.slug"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::server-type.server-type"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"server_types","info":{"singularName":"server-type","pluralName":"server-types","displayName":"server_type","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"customField","options":{"output":"HTML","preset":"light"},"customField":"plugin::ckeditor.CKEditor"},"server_series":{"type":"relation","relation":"manyToMany","target":"api::server-serieses.server-serieses","inversedBy":"server_types"},"server_processors":{"type":"relation","relation":"manyToMany","target":"api::server-processor.server-processor","inversedBy":"server_types"},"slug":{"pluginOptions":{"i18n":{"localized":true}},"type":"customField","options":{"pattern":"title"},"customField":"plugin::slug.slug"}},"kind":"collectionType"},"modelType":"contentType","modelName":"server-type","connection":"default","uid":"api::server-type.server-type","apiName":"server-type","globalId":"ServerType","actions":{},"lifecycles":{}},"api::site-contact.site-contact":{"kind":"singleType","collectionName":"site_contacts","info":{"singularName":"site-contact","pluralName":"site-contacts","displayName":"Site_contact"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"phone":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","default":"+7 000 000-00-00"},"email":{"pluginOptions":{"i18n":{"localized":true}},"type":"email","default":"itpod@gmail.com"},"address":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"time":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","default":"09:00-18:00"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::site-contact.site-contact"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"site_contacts","info":{"singularName":"site-contact","pluralName":"site-contacts","displayName":"Site_contact"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"phone":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","default":"+7 000 000-00-00"},"email":{"pluginOptions":{"i18n":{"localized":true}},"type":"email","default":"itpod@gmail.com"},"address":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"time":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","default":"09:00-18:00"}},"kind":"singleType"},"modelType":"contentType","modelName":"site-contact","connection":"default","uid":"api::site-contact.site-contact","apiName":"site-contact","globalId":"SiteContact","actions":{},"lifecycles":{}},"api::site-setting.site-setting":{"kind":"singleType","collectionName":"site_settings","info":{"singularName":"site-setting","pluralName":"site-settings","displayName":"site_setting"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"response_email":{"type":"email"},"footer_form":{"type":"relation","relation":"oneToOne","target":"api::form.form"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"site_settings","info":{"singularName":"site-setting","pluralName":"site-settings","displayName":"site_setting"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"response_email":{"type":"email"},"footer_form":{"type":"relation","relation":"oneToOne","target":"api::form.form"}},"kind":"singleType"},"modelType":"contentType","modelName":"site-setting","connection":"default","uid":"api::site-setting.site-setting","apiName":"site-setting","globalId":"SiteSetting","actions":{},"lifecycles":{}},"api::test.test":{"kind":"collectionType","collectionName":"tests","info":{"singularName":"test","pluralName":"tests","displayName":"test"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::test.test"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"tests","info":{"singularName":"test","pluralName":"tests","displayName":"test"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{},"kind":"collectionType"},"modelType":"contentType","modelName":"test","connection":"default","uid":"api::test.test","apiName":"test","globalId":"Test","actions":{},"lifecycles":{}}}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"uid":"plugin::upload.folder","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]}}	object	\N	\N
34	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"enabled":false,"icon":"","key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]}}	object	\N	\N
35	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
36	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
33	plugin_i18n_default_locale	"ru-RU"	string	\N	\N
20	plugin_content_manager_configuration_content_types::api::news-tag.news-tag	{"uid":"api::news-tag.news-tag","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"newsletters":{"edit":{"label":"newsletters","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"newsletters","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","newsletters","createdAt"],"edit":[[{"name":"name","size":6},{"name":"newsletters","size":6}]]}}	object	\N	\N
11	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"uid":"plugin::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}	object	\N	\N
12	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"uid":"plugin::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]}}	object	\N	\N
22	plugin_content_manager_configuration_content_types::api::partner.partner	{"uid":"api::partner.partner","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"logo":{"edit":{"label":"logo","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"logo","searchable":false,"sortable":false}},"link":{"edit":{"label":"link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"link","searchable":true,"sortable":true}},"partners_type":{"edit":{"label":"partners_type","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"partners_type","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","logo"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"logo","size":6},{"name":"link","size":6}],[{"name":"partners_type","size":6}]]}}	object	\N	\N
29	plugin_content_manager_configuration_content_types::api::site-contact.site-contact	{"uid":"api::site-contact.site-contact","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"phone","defaultSortBy":"phone","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"phone":{"edit":{"label":"phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"phone","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"address":{"edit":{"label":"address","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"address","searchable":true,"sortable":true}},"time":{"edit":{"label":"time","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"time","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","phone","email","address"],"edit":[[{"name":"phone","size":6},{"name":"email","size":6}],[{"name":"address","size":6},{"name":"time","size":6}]]}}	object	\N	\N
13	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"uid":"plugin::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]}}	object	\N	\N
23	plugin_content_manager_configuration_content_types::plugin::navigation.navigation	{"uid":"plugin::navigation.navigation","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"localeCode","defaultSortBy":"localeCode","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"visible":{"edit":{"label":"visible","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"visible","searchable":true,"sortable":true}},"items":{"edit":{"label":"items","description":"","placeholder":"","visible":true,"editable":true,"mainField":"uiRouterKey"},"list":{"label":"items","searchable":false,"sortable":false}},"localizations":{"edit":{"label":"localizations","description":"","placeholder":"","visible":true,"editable":true,"mainField":"localeCode"},"list":{"label":"localizations","searchable":false,"sortable":false}},"localeCode":{"edit":{"label":"localeCode","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"localeCode","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","slug","visible"],"edit":[[{"name":"name","size":6},{"name":"slug","size":6}],[{"name":"visible","size":4},{"name":"items","size":6}],[{"name":"localizations","size":6},{"name":"localeCode","size":6}]]}}	object	\N	\N
14	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"uid":"plugin::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]}}	object	\N	\N
24	plugin_content_manager_configuration_content_types::api::partners-type.partners-type	{"uid":"api::partners-type.partners-type","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"partners":{"edit":{"label":"partners","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"partners","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","partners","createdAt"],"edit":[[{"name":"name","size":6},{"name":"partners","size":6}]]}}	object	\N	\N
15	plugin_content_manager_configuration_content_types::plugin::navigation.audience	{"uid":"plugin::navigation.audience","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"key":{"edit":{"label":"key","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"key","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","key","createdAt"],"edit":[[{"name":"name","size":6},{"name":"key","size":6}]]}}	object	\N	\N
25	plugin_content_manager_configuration_content_types::api::server.server	{"uid":"api::server.server","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"imgs":{"edit":{"label":"imgs","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"imgs","searchable":false,"sortable":false}},"doc_link":{"edit":{"label":"doc_link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"doc_link","searchable":true,"sortable":true}},"support_link":{"edit":{"label":"support_link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"support_link","searchable":true,"sortable":true}},"specs":{"edit":{"label":"specs","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"specs","searchable":false,"sortable":false}},"server_series":{"edit":{"label":"server_series","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"server_series","searchable":true,"sortable":true}},"server_processor":{"edit":{"label":"server_processor","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"server_processor","searchable":true,"sortable":true}},"server_size":{"edit":{"label":"server_size","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"server_size","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","imgs","doc_link","title"],"edit":[[{"name":"imgs","size":6}],[{"name":"doc_link","size":6},{"name":"support_link","size":6}],[{"name":"specs","size":12}],[{"name":"server_series","size":6},{"name":"server_processor","size":6}],[{"name":"server_size","size":6},{"name":"slug","size":6}],[{"name":"title","size":6}]]}}	object	\N	\N
16	plugin_content_manager_configuration_content_types::plugin::navigation.navigation-item	{"uid":"plugin::navigation.navigation-item","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"uiRouterKey","defaultSortBy":"uiRouterKey","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"externalPath":{"edit":{"label":"externalPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"externalPath","searchable":true,"sortable":true}},"uiRouterKey":{"edit":{"label":"uiRouterKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"uiRouterKey","searchable":true,"sortable":true}},"menuAttached":{"edit":{"label":"menuAttached","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"menuAttached","searchable":true,"sortable":true}},"order":{"edit":{"label":"order","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"order","searchable":true,"sortable":true}},"collapsed":{"edit":{"label":"collapsed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"collapsed","searchable":true,"sortable":true}},"related":{"edit":{"label":"related","description":"","placeholder":"","visible":true,"editable":true,"mainField":"related_id"},"list":{"label":"related","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"uiRouterKey"},"list":{"label":"parent","searchable":true,"sortable":true}},"master":{"edit":{"label":"master","description":"","placeholder":"","visible":true,"editable":true,"mainField":"localeCode"},"list":{"label":"master","searchable":true,"sortable":true}},"audience":{"edit":{"label":"audience","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"audience","searchable":false,"sortable":false}},"additionalFields":{"edit":{"label":"additionalFields","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"additionalFields","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","type","path"],"edit":[[{"name":"title","size":6},{"name":"type","size":6}],[{"name":"path","size":6},{"name":"externalPath","size":6}],[{"name":"uiRouterKey","size":6},{"name":"menuAttached","size":4}],[{"name":"order","size":4},{"name":"collapsed","size":4}],[{"name":"related","size":6},{"name":"parent","size":6}],[{"name":"master","size":6},{"name":"audience","size":6}],[{"name":"additionalFields","size":12}]]}}	object	\N	\N
17	plugin_content_manager_configuration_content_types::plugin::navigation.navigations-items-related	{"uid":"plugin::navigation.navigations-items-related","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"related_id","defaultSortBy":"related_id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"related_id":{"edit":{"label":"related_id","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"related_id","searchable":true,"sortable":true}},"related_type":{"edit":{"label":"related_type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"related_type","searchable":true,"sortable":true}},"field":{"edit":{"label":"field","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"field","searchable":true,"sortable":true}},"order":{"edit":{"label":"order","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"order","searchable":true,"sortable":true}},"master":{"edit":{"label":"master","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"master","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","related_id","related_type","field"],"edit":[[{"name":"related_id","size":6},{"name":"related_type","size":6}],[{"name":"field","size":6},{"name":"order","size":4}],[{"name":"master","size":6}]]}}	object	\N	\N
26	plugin_content_manager_configuration_content_types::api::server-processor.server-processor	{"uid":"api::server-processor.server-processor","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"servers":{"edit":{"label":"servers","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"servers","searchable":false,"sortable":false}},"server_types":{"edit":{"label":"server_types","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"server_types","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","servers","createdAt"],"edit":[[{"name":"name","size":6},{"name":"servers","size":6}],[{"name":"server_types","size":6}]]}}	object	\N	\N
18	plugin_content_manager_configuration_content_types::plugin::slugify.slug	{"uid":"plugin::slugify.slug","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"count":{"edit":{"label":"count","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"count","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","slug","count","createdAt"],"edit":[[{"name":"slug","size":6},{"name":"count","size":4}]]}}	object	\N	\N
30	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}	object	\N	\N
31	plugin_upload_view_configuration	{"pageSize":10,"sort":"createdAt:DESC"}	object	\N	\N
28	plugin_content_manager_configuration_content_types::api::server-size.server-size	{"uid":"api::server-size.server-size","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"servers":{"edit":{"label":"servers","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"servers","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","servers","createdAt"],"edit":[[{"name":"name","size":6},{"name":"servers","size":6}]]}}	object	\N	\N
32	plugin_upload_metrics	{"weeklySchedule":"38 16 13 * * 4","lastWeeklyUpdate":1703758598451}	object	\N	\N
41	plugin_content_manager_configuration_content_types::plugin::menus.menu	{"uid":"plugin::menus.menu","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"items":{"edit":{"label":"items","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"items","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","slug","items"],"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"items","size":6}]]}}	object	\N	\N
19	plugin_content_manager_configuration_content_types::api::event.event	{"uid":"api::event.event","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"register":{"edit":{"label":"register","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"register","searchable":true,"sortable":true}},"time_start":{"edit":{"label":"time_start","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"time_start","searchable":true,"sortable":true}},"time_end":{"edit":{"label":"time_end","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"time_end","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","register","title"],"edit":[[{"name":"type","size":6}],[{"name":"register","size":6},{"name":"time_start","size":6}],[{"name":"time_end","size":6}],[{"name":"content","size":12}],[{"name":"slug","size":6},{"name":"title","size":6}]]}}	object	\N	\N
27	plugin_content_manager_configuration_content_types::api::server-serieses.server-serieses	{"uid":"api::server-serieses.server-serieses","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"servers":{"edit":{"label":"servers","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"servers","searchable":false,"sortable":false}},"server_types":{"edit":{"label":"server_types","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"server_types","searchable":false,"sortable":false}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","servers","createdAt","title"],"edit":[[{"name":"servers","size":6}],[{"name":"server_types","size":6},{"name":"title","size":6}],[{"name":"slug","size":6}]]}}	object	\N	\N
39	plugin_content_manager_configuration_content_types::api::server-type.server-type	{"uid":"api::server-type.server-type","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":false,"sortable":false}},"server_series":{"edit":{"label":"server_series","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"server_series","searchable":false,"sortable":false}},"server_processors":{"edit":{"label":"server_processors","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"server_processors","searchable":false,"sortable":false}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","server_series","server_processors","title"],"edit":[[{"name":"description","size":12}],[{"name":"server_series","size":6},{"name":"server_processors","size":6}],[{"name":"title","size":6},{"name":"slug","size":6}]]}}	object	\N	\N
37	plugin_navigation_config	{"additionalFields":[{"name":"footer_name","label":"Название для футера","type":"string","required":false,"multi":false,"options":[],"enabled":true}],"contentTypes":["api::page.page","api::product.product"],"contentTypesNameFields":{"default":["title","subject","name"]},"contentTypesPopulate":{},"allowedLevels":2,"gql":{"navigationItemRelated":["Page","Product"]},"i18nEnabled":true,"pruneObsoleteI18nNavigations":false,"pathDefaultFields":{},"cascadeMenuAttached":false}	object	\N	\N
38	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}	object	\N	\N
42	plugin_content_manager_configuration_content_types::plugin::menus.menu-item	{"uid":"plugin::menus.menu-item","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"order":{"edit":{"label":"order","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"order","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"target":{"edit":{"label":"target","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"target","searchable":true,"sortable":true}},"root_menu":{"edit":{"label":"root_menu","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"root_menu","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"parent","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","order","title","url"],"edit":[[{"name":"order","size":4},{"name":"title","size":6}],[{"name":"url","size":6},{"name":"target","size":6}],[{"name":"root_menu","size":6},{"name":"parent","size":6}]]}}	object	\N	\N
44	plugin_content_manager_configuration_content_types::api::privacy-policy.privacy-policy	{"uid":"api::privacy-policy.privacy-policy","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"privacy":{"edit":{"label":"privacy","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"privacy","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","createdAt","updatedAt","createdBy"],"edit":[[{"name":"privacy","size":12}]]}}	object	\N	\N
43	plugin_content_manager_configuration_content_types::api::product.product	{"uid":"api::product.product","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"disabled":{"edit":{"label":"disabled","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"disabled","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","description","createdAt","title"],"edit":[[{"name":"description","size":6}],[{"name":"disabled","size":6},{"name":"slug","size":6}],[{"name":"title","size":6}]]}}	object	\N	\N
45	plugin_content_manager_configuration_content_types::api::form-field.form-field	{"uid":"api::form-field.form-field","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"placeholder":{"edit":{"label":"placeholder","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"placeholder","searchable":true,"sortable":true}},"required":{"edit":{"label":"required","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"required","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","placeholder","required"],"edit":[[{"name":"name","size":6},{"name":"placeholder","size":6}],[{"name":"required","size":6},{"name":"type","size":6}]]}}	object	\N	\N
46	plugin_content_manager_configuration_content_types::api::form.form	{"uid":"api::form.form","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"send_text":{"edit":{"label":"send_text","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"send_text","searchable":true,"sortable":true}},"privacy":{"edit":{"label":"privacy","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"privacy","searchable":true,"sortable":true}},"form_fields":{"edit":{"label":"form_fields","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"form_fields","searchable":false,"sortable":false}},"success_message":{"edit":{"label":"success_message","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"success_message","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","send_text"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"send_text","size":6},{"name":"privacy","size":4}],[{"name":"form_fields","size":6}],[{"name":"success_message","size":12}]]}}	object	\N	\N
47	plugin_content_manager_configuration_content_types::api::site-setting.site-setting	{"uid":"api::site-setting.site-setting","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"response_email":{"edit":{"label":"response_email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"response_email","searchable":true,"sortable":true}},"footer_form":{"edit":{"label":"footer_form","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"footer_form","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","response_email","footer_form","createdAt"],"edit":[[{"name":"response_email","size":6},{"name":"footer_form","size":6}]]}}	object	\N	\N
21	plugin_content_manager_configuration_content_types::api::newsletter.newsletter	{"uid":"api::newsletter.newsletter","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"news_tags":{"edit":{"label":"news_tags","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"news_tags","searchable":false,"sortable":false}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","news_tags","slug","title"],"edit":[[{"name":"news_tags","size":6}],[{"name":"content","size":12}],[{"name":"slug","size":6},{"name":"title","size":6}]]}}	object	\N	\N
48	plugin_content_manager_configuration_content_types::api::address.address	{"uid":"api::address.address","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"city","defaultSortBy":"city","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"city":{"edit":{"label":"city","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"city","searchable":true,"sortable":true}},"mail":{"edit":{"label":"mail","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mail","searchable":true,"sortable":true}},"phone":{"edit":{"label":"phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"phone","searchable":true,"sortable":true}},"address":{"edit":{"label":"address","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"address","searchable":true,"sortable":true}},"hours":{"edit":{"label":"hours","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hours","searchable":true,"sortable":true}},"map":{"edit":{"label":"map","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"map","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","city","mail","phone"],"edit":[[{"name":"city","size":6},{"name":"mail","size":6}],[{"name":"phone","size":6},{"name":"address","size":6}],[{"name":"hours","size":6}],[{"name":"map","size":12}]]}}	object	\N	\N
49	plugin_content_manager_configuration_content_types::api::test.test	{"uid":"api::test.test","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","createdAt","updatedAt","createdBy"],"edit":[]}}	object	\N	\N
51	plugin_content_manager_configuration_components::utils-components.card	{"uid":"utils-components.card","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"img":{"edit":{"label":"img","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"img","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","description","img"],"edit":[[{"name":"title","size":6},{"name":"description","size":6}],[{"name":"img","size":6}]]},"isComponent":true}	object	\N	\N
53	plugin_content_manager_configuration_components::utils-components.block-settings	{"uid":"utils-components.block-settings","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"background":{"edit":{"label":"background","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"background","searchable":true,"sortable":true}},"custom_background":{"edit":{"label":"custom_background","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"custom_background","searchable":false,"sortable":false}},"layout":{"edit":{"label":"layout","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"layout","searchable":true,"sortable":true}},"form":{"edit":{"label":"form","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"form","searchable":true,"sortable":true}},"link":{"edit":{"label":"link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"link","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"padding":{"edit":{"label":"padding","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"padding","searchable":true,"sortable":true}},"merge_text":{"edit":{"label":"merge_text","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"merge_text","searchable":true,"sortable":true}}},"layouts":{"list":["id","background","custom_background","layout"],"edit":[[{"name":"background","size":6},{"name":"custom_background","size":6}],[{"name":"layout","size":6},{"name":"form","size":6}],[{"name":"link","size":12}],[{"name":"title","size":6},{"name":"description","size":6}],[{"name":"padding","size":6},{"name":"merge_text","size":4}]]},"isComponent":true}	object	\N	\N
54	plugin_content_manager_configuration_components::utils-components.link	{"uid":"utils-components.link","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"link_text","defaultSortBy":"link_text","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"link_text":{"edit":{"label":"link_text","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"link_text","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}}},"layouts":{"list":["id","link_text","url"],"edit":[[{"name":"link_text","size":6},{"name":"url","size":6}]]},"isComponent":true}	object	\N	\N
55	plugin_content_manager_configuration_components::page-components.cards	{"uid":"page-components.cards","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"base":{"edit":{"label":"base","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"base","searchable":false,"sortable":false}},"nums_in_row":{"edit":{"label":"nums_in_row","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"nums_in_row","searchable":true,"sortable":true}},"cards":{"edit":{"label":"cards","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cards","searchable":false,"sortable":false}}},"layouts":{"list":["id","nums_in_row","cards","base"],"edit":[[{"name":"nums_in_row","size":4}],[{"name":"cards","size":12}],[{"name":"base","size":12}]]},"isComponent":true}	object	\N	\N
40	plugin_content_manager_configuration_content_types::api::page.page	{"uid":"api::page.page","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"block1":{"edit":{"label":"block1","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"block1","searchable":false,"sortable":false}},"block2":{"edit":{"label":"block2","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"block2","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","slug","createdAt","title"],"edit":[[{"name":"slug","size":6},{"name":"title","size":6}],[{"name":"description","size":6}],[{"name":"block1","size":12}],[{"name":"block2","size":12}]]}}	object	\N	\N
57	plugin_content_manager_configuration_components::page-components.pages	{"uid":"page-components.pages","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"pageLink":{"edit":{"label":"pageLink","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pageLink","searchable":false,"sortable":false}}},"layouts":{"list":["id","pageLink"],"edit":[[{"name":"pageLink","size":12}]]},"isComponent":true}	object	\N	\N
58	plugin_content_manager_configuration_components::utils-components.page-link	{"uid":"utils-components.page-link","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"product":{"edit":{"label":"product","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"product","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":true,"sortable":true}},"disabled":{"edit":{"label":"disabled","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"disabled","searchable":true,"sortable":true}}},"layouts":{"list":["id","product","image","disabled"],"edit":[[{"name":"product","size":6},{"name":"image","size":6}],[{"name":"disabled","size":4}]]},"isComponent":true}	object	\N	\N
59	plugin_content_manager_configuration_components::page-components.partners	{"uid":"page-components.partners","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"form_description","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"form_description":{"edit":{"label":"form_description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"form_description","searchable":true,"sortable":true}}},"layouts":{"list":["id","form_description"],"edit":[[{"name":"form_description","size":6}]]},"isComponent":true}	object	\N	\N
60	plugin_content_manager_configuration_components::page-components.servers-slider	{"uid":"page-components.servers-slider","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"servers":{"edit":{"label":"servers","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"servers","searchable":false,"sortable":false}}},"layouts":{"list":["id","servers"],"edit":[[{"name":"servers","size":6}]]},"isComponent":true}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
51	{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"menus","indexes":[{"type":"unique","name":"menus_slug_unique","columns":["slug"]},{"name":"menus_created_by_id_fk","columns":["created_by_id"]},{"name":"menus_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"menus_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"menus_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"menu_items","indexes":[{"name":"menu_items_created_by_id_fk","columns":["created_by_id"]},{"name":"menu_items_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"menu_items_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"menu_items_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"target","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"audience","indexes":[{"type":"unique","name":"audience_key_unique","columns":["key"]},{"name":"audience_created_by_id_fk","columns":["created_by_id"]},{"name":"audience_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"audience_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"audience_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"navigations","indexes":[{"type":"unique","name":"navigations_slug_unique","columns":["slug"]},{"name":"navigations_created_by_id_fk","columns":["created_by_id"]},{"name":"navigations_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"navigations_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"navigations_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"visible","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale_code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"navigations_items","indexes":[{"name":"navigations_items_created_by_id_fk","columns":["created_by_id"]},{"name":"navigations_items_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"navigations_items_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"navigations_items_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"external_path","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ui_router_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"menu_attached","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"collapsed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"additional_fields","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"navigations_items_related","indexes":[{"name":"navigations_items_related_created_by_id_fk","columns":["created_by_id"]},{"name":"navigations_items_related_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"navigations_items_related_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"navigations_items_related_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"related_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"master","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"slugs","indexes":[{"name":"slugs_created_by_id_fk","columns":["created_by_id"]},{"name":"slugs_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"slugs_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"slugs_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"slug","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"count","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"addresses","indexes":[{"name":"addresses_created_by_id_fk","columns":["created_by_id"]},{"name":"addresses_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"addresses_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"addresses_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"city","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mail","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"address","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hours","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"map","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"events","indexes":[{"name":"events_created_by_id_fk","columns":["created_by_id"]},{"name":"events_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"events_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"events_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"register","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"time_start","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"time_end","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"forms","indexes":[{"name":"forms_created_by_id_fk","columns":["created_by_id"]},{"name":"forms_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"forms_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"forms_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"send_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"privacy","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"success_message","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"form_fields","indexes":[{"name":"form_fields_created_by_id_fk","columns":["created_by_id"]},{"name":"form_fields_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"form_fields_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"form_fields_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"placeholder","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"required","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"news_tags","indexes":[{"name":"news_tags_created_by_id_fk","columns":["created_by_id"]},{"name":"news_tags_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"news_tags_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"news_tags_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"newsletters","indexes":[{"name":"newsletters_created_by_id_fk","columns":["created_by_id"]},{"name":"newsletters_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"newsletters_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"newsletters_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"pages","indexes":[{"name":"pages_created_by_id_fk","columns":["created_by_id"]},{"name":"pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"partners","indexes":[{"name":"partners_created_by_id_fk","columns":["created_by_id"]},{"name":"partners_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"partners_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"partners_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"partners_types","indexes":[{"name":"partners_types_created_by_id_fk","columns":["created_by_id"]},{"name":"partners_types_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"partners_types_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"partners_types_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"privacy_policies","indexes":[{"name":"privacy_policies_created_by_id_fk","columns":["created_by_id"]},{"name":"privacy_policies_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"privacy_policies_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"privacy_policies_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"privacy","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"products","indexes":[{"name":"products_created_by_id_fk","columns":["created_by_id"]},{"name":"products_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"products_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"products_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"disabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"servers","indexes":[{"name":"servers_created_by_id_fk","columns":["created_by_id"]},{"name":"servers_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"servers_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"servers_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"doc_link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"support_link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"specs","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"server_processors","indexes":[{"name":"server_processors_created_by_id_fk","columns":["created_by_id"]},{"name":"server_processors_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"server_processors_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"server_processors_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"server_series","indexes":[{"name":"server_series_created_by_id_fk","columns":["created_by_id"]},{"name":"server_series_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"server_series_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"server_series_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"server_sizes","indexes":[{"name":"server_sizes_created_by_id_fk","columns":["created_by_id"]},{"name":"server_sizes_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"server_sizes_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"server_sizes_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"server_types","indexes":[{"name":"server_types_created_by_id_fk","columns":["created_by_id"]},{"name":"server_types_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"server_types_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"server_types_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"site_contacts","indexes":[{"name":"site_contacts_created_by_id_fk","columns":["created_by_id"]},{"name":"site_contacts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"site_contacts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"site_contacts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"address","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"time","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"site_settings","indexes":[{"name":"site_settings_created_by_id_fk","columns":["created_by_id"]},{"name":"site_settings_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"site_settings_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"site_settings_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"response_email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"tests","indexes":[{"name":"tests_created_by_id_fk","columns":["created_by_id"]},{"name":"tests_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"tests_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"tests_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_page_components_cards","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"nums_in_row","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_page_components_pages","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false}]},{"name":"components_page_components_partners","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"form_description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_page_components_servers_sliders","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false}]},{"name":"components_utils_components_block_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"background","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"layout","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"padding","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"merge_text","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_utils_components_cards","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_utils_components_links","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"link_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_utils_components_page_links","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"image","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"disabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"admin_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]},{"name":"admin_users_roles_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_links_order_fk","columns":["role_order"]},{"name":"admin_users_roles_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_links","indexes":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_links_unique","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_links_order_inv_fk","columns":["api_token_permission_order"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_links","indexes":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_links_unique","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_links_order_inv_fk","columns":["transfer_token_permission_order"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]},{"name":"files_related_morphs_order_index","columns":["order"]},{"name":"files_related_morphs_id_column_index","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_links","indexes":[{"name":"files_folder_links_fk","columns":["file_id"]},{"name":"files_folder_links_inv_fk","columns":["folder_id"]},{"name":"files_folder_links_unique","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_links_order_inv_fk","columns":["file_order"]}],"foreignKeys":[{"name":"files_folder_links_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_links_inv_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_links","indexes":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"]},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_links_unique","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_links_order_inv_fk","columns":["folder_order"]}],"foreignKeys":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"up_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]},{"name":"up_users_role_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"menu_items_root_menu_links","indexes":[{"name":"menu_items_root_menu_links_fk","columns":["menu_item_id"]},{"name":"menu_items_root_menu_links_inv_fk","columns":["menu_id"]},{"name":"menu_items_root_menu_links_unique","columns":["menu_item_id","menu_id"],"type":"unique"},{"name":"menu_items_root_menu_links_order_inv_fk","columns":["menu_item_order"]}],"foreignKeys":[{"name":"menu_items_root_menu_links_fk","columns":["menu_item_id"],"referencedColumns":["id"],"referencedTable":"menu_items","onDelete":"CASCADE"},{"name":"menu_items_root_menu_links_inv_fk","columns":["menu_id"],"referencedColumns":["id"],"referencedTable":"menus","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"menu_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"menu_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"menu_item_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"menu_items_parent_links","indexes":[{"name":"menu_items_parent_links_fk","columns":["menu_item_id"]},{"name":"menu_items_parent_links_inv_fk","columns":["inv_menu_item_id"]},{"name":"menu_items_parent_links_unique","columns":["menu_item_id","inv_menu_item_id"],"type":"unique"}],"foreignKeys":[{"name":"menu_items_parent_links_fk","columns":["menu_item_id"],"referencedColumns":["id"],"referencedTable":"menu_items","onDelete":"CASCADE"},{"name":"menu_items_parent_links_inv_fk","columns":["inv_menu_item_id"],"referencedColumns":["id"],"referencedTable":"menu_items","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"menu_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_menu_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"navigations_localizations_links","indexes":[{"name":"navigations_localizations_links_fk","columns":["navigation_id"]},{"name":"navigations_localizations_links_inv_fk","columns":["inv_navigation_id"]},{"name":"navigations_localizations_links_unique","columns":["navigation_id","inv_navigation_id"],"type":"unique"},{"name":"navigations_localizations_links_order_fk","columns":["navigation_order"]}],"foreignKeys":[{"name":"navigations_localizations_links_fk","columns":["navigation_id"],"referencedColumns":["id"],"referencedTable":"navigations","onDelete":"CASCADE"},{"name":"navigations_localizations_links_inv_fk","columns":["inv_navigation_id"],"referencedColumns":["id"],"referencedTable":"navigations","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"navigation_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_navigation_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"navigation_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"navigations_items_related_links","indexes":[{"name":"navigations_items_related_links_fk","columns":["navigation_item_id"]},{"name":"navigations_items_related_links_inv_fk","columns":["navigations_items_related_id"]},{"name":"navigations_items_related_links_unique","columns":["navigation_item_id","navigations_items_related_id"],"type":"unique"}],"foreignKeys":[{"name":"navigations_items_related_links_fk","columns":["navigation_item_id"],"referencedColumns":["id"],"referencedTable":"navigations_items","onDelete":"CASCADE"},{"name":"navigations_items_related_links_inv_fk","columns":["navigations_items_related_id"],"referencedColumns":["id"],"referencedTable":"navigations_items_related","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"navigation_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"navigations_items_related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"navigations_items_parent_links","indexes":[{"name":"navigations_items_parent_links_fk","columns":["navigation_item_id"]},{"name":"navigations_items_parent_links_inv_fk","columns":["inv_navigation_item_id"]},{"name":"navigations_items_parent_links_unique","columns":["navigation_item_id","inv_navigation_item_id"],"type":"unique"}],"foreignKeys":[{"name":"navigations_items_parent_links_fk","columns":["navigation_item_id"],"referencedColumns":["id"],"referencedTable":"navigations_items","onDelete":"CASCADE"},{"name":"navigations_items_parent_links_inv_fk","columns":["inv_navigation_item_id"],"referencedColumns":["id"],"referencedTable":"navigations_items","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"navigation_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_navigation_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"navigations_items_master_links","indexes":[{"name":"navigations_items_master_links_fk","columns":["navigation_item_id"]},{"name":"navigations_items_master_links_inv_fk","columns":["navigation_id"]},{"name":"navigations_items_master_links_unique","columns":["navigation_item_id","navigation_id"],"type":"unique"},{"name":"navigations_items_master_links_order_inv_fk","columns":["navigation_item_order"]}],"foreignKeys":[{"name":"navigations_items_master_links_fk","columns":["navigation_item_id"],"referencedColumns":["id"],"referencedTable":"navigations_items","onDelete":"CASCADE"},{"name":"navigations_items_master_links_inv_fk","columns":["navigation_id"],"referencedColumns":["id"],"referencedTable":"navigations","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"navigation_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"navigation_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"navigation_item_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"navigations_items_audience_links","indexes":[{"name":"navigations_items_audience_links_fk","columns":["navigation_item_id"]},{"name":"navigations_items_audience_links_inv_fk","columns":["audience_id"]},{"name":"navigations_items_audience_links_unique","columns":["navigation_item_id","audience_id"],"type":"unique"},{"name":"navigations_items_audience_links_order_fk","columns":["audience_order"]}],"foreignKeys":[{"name":"navigations_items_audience_links_fk","columns":["navigation_item_id"],"referencedColumns":["id"],"referencedTable":"navigations_items","onDelete":"CASCADE"},{"name":"navigations_items_audience_links_inv_fk","columns":["audience_id"],"referencedColumns":["id"],"referencedTable":"audience","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"navigation_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"audience_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"audience_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"addresses_localizations_links","indexes":[{"name":"addresses_localizations_links_fk","columns":["address_id"]},{"name":"addresses_localizations_links_inv_fk","columns":["inv_address_id"]},{"name":"addresses_localizations_links_unique","columns":["address_id","inv_address_id"],"type":"unique"},{"name":"addresses_localizations_links_order_fk","columns":["address_order"]}],"foreignKeys":[{"name":"addresses_localizations_links_fk","columns":["address_id"],"referencedColumns":["id"],"referencedTable":"addresses","onDelete":"CASCADE"},{"name":"addresses_localizations_links_inv_fk","columns":["inv_address_id"],"referencedColumns":["id"],"referencedTable":"addresses","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"address_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_address_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"address_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"events_localizations_links","indexes":[{"name":"events_localizations_links_fk","columns":["event_id"]},{"name":"events_localizations_links_inv_fk","columns":["inv_event_id"]},{"name":"events_localizations_links_unique","columns":["event_id","inv_event_id"],"type":"unique"},{"name":"events_localizations_links_order_fk","columns":["event_order"]}],"foreignKeys":[{"name":"events_localizations_links_fk","columns":["event_id"],"referencedColumns":["id"],"referencedTable":"events","onDelete":"CASCADE"},{"name":"events_localizations_links_inv_fk","columns":["inv_event_id"],"referencedColumns":["id"],"referencedTable":"events","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"event_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_event_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"event_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"forms_form_fields_links","indexes":[{"name":"forms_form_fields_links_fk","columns":["form_id"]},{"name":"forms_form_fields_links_inv_fk","columns":["form_field_id"]},{"name":"forms_form_fields_links_unique","columns":["form_id","form_field_id"],"type":"unique"},{"name":"forms_form_fields_links_order_fk","columns":["form_field_order"]}],"foreignKeys":[{"name":"forms_form_fields_links_fk","columns":["form_id"],"referencedColumns":["id"],"referencedTable":"forms","onDelete":"CASCADE"},{"name":"forms_form_fields_links_inv_fk","columns":["form_field_id"],"referencedColumns":["id"],"referencedTable":"form_fields","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"form_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"form_field_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"form_field_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"forms_localizations_links","indexes":[{"name":"forms_localizations_links_fk","columns":["form_id"]},{"name":"forms_localizations_links_inv_fk","columns":["inv_form_id"]},{"name":"forms_localizations_links_unique","columns":["form_id","inv_form_id"],"type":"unique"},{"name":"forms_localizations_links_order_fk","columns":["form_order"]}],"foreignKeys":[{"name":"forms_localizations_links_fk","columns":["form_id"],"referencedColumns":["id"],"referencedTable":"forms","onDelete":"CASCADE"},{"name":"forms_localizations_links_inv_fk","columns":["inv_form_id"],"referencedColumns":["id"],"referencedTable":"forms","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"form_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_form_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"form_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"form_fields_localizations_links","indexes":[{"name":"form_fields_localizations_links_fk","columns":["form_field_id"]},{"name":"form_fields_localizations_links_inv_fk","columns":["inv_form_field_id"]},{"name":"form_fields_localizations_links_unique","columns":["form_field_id","inv_form_field_id"],"type":"unique"},{"name":"form_fields_localizations_links_order_fk","columns":["form_field_order"]}],"foreignKeys":[{"name":"form_fields_localizations_links_fk","columns":["form_field_id"],"referencedColumns":["id"],"referencedTable":"form_fields","onDelete":"CASCADE"},{"name":"form_fields_localizations_links_inv_fk","columns":["inv_form_field_id"],"referencedColumns":["id"],"referencedTable":"form_fields","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"form_field_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_form_field_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"form_field_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"news_tags_localizations_links","indexes":[{"name":"news_tags_localizations_links_fk","columns":["news_tag_id"]},{"name":"news_tags_localizations_links_inv_fk","columns":["inv_news_tag_id"]},{"name":"news_tags_localizations_links_unique","columns":["news_tag_id","inv_news_tag_id"],"type":"unique"},{"name":"news_tags_localizations_links_order_fk","columns":["news_tag_order"]}],"foreignKeys":[{"name":"news_tags_localizations_links_fk","columns":["news_tag_id"],"referencedColumns":["id"],"referencedTable":"news_tags","onDelete":"CASCADE"},{"name":"news_tags_localizations_links_inv_fk","columns":["inv_news_tag_id"],"referencedColumns":["id"],"referencedTable":"news_tags","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"news_tag_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_news_tag_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"news_tag_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"newsletters_news_tags_links","indexes":[{"name":"newsletters_news_tags_links_fk","columns":["newsletter_id"]},{"name":"newsletters_news_tags_links_inv_fk","columns":["news_tag_id"]},{"name":"newsletters_news_tags_links_unique","columns":["newsletter_id","news_tag_id"],"type":"unique"},{"name":"newsletters_news_tags_links_order_fk","columns":["news_tag_order"]},{"name":"newsletters_news_tags_links_order_inv_fk","columns":["newsletter_order"]}],"foreignKeys":[{"name":"newsletters_news_tags_links_fk","columns":["newsletter_id"],"referencedColumns":["id"],"referencedTable":"newsletters","onDelete":"CASCADE"},{"name":"newsletters_news_tags_links_inv_fk","columns":["news_tag_id"],"referencedColumns":["id"],"referencedTable":"news_tags","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"newsletter_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"news_tag_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"news_tag_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"newsletter_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"newsletters_localizations_links","indexes":[{"name":"newsletters_localizations_links_fk","columns":["newsletter_id"]},{"name":"newsletters_localizations_links_inv_fk","columns":["inv_newsletter_id"]},{"name":"newsletters_localizations_links_unique","columns":["newsletter_id","inv_newsletter_id"],"type":"unique"},{"name":"newsletters_localizations_links_order_fk","columns":["newsletter_order"]}],"foreignKeys":[{"name":"newsletters_localizations_links_fk","columns":["newsletter_id"],"referencedColumns":["id"],"referencedTable":"newsletters","onDelete":"CASCADE"},{"name":"newsletters_localizations_links_inv_fk","columns":["inv_newsletter_id"],"referencedColumns":["id"],"referencedTable":"newsletters","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"newsletter_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_newsletter_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"newsletter_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"pages_components","indexes":[{"name":"pages_field_index","columns":["field"]},{"name":"pages_component_type_index","columns":["component_type"]},{"name":"pages_entity_fk","columns":["entity_id"]},{"name":"pages_unique","columns":["entity_id","component_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"pages_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"pages_localizations_links","indexes":[{"name":"pages_localizations_links_fk","columns":["page_id"]},{"name":"pages_localizations_links_inv_fk","columns":["inv_page_id"]},{"name":"pages_localizations_links_unique","columns":["page_id","inv_page_id"],"type":"unique"},{"name":"pages_localizations_links_order_fk","columns":["page_order"]}],"foreignKeys":[{"name":"pages_localizations_links_fk","columns":["page_id"],"referencedColumns":["id"],"referencedTable":"pages","onDelete":"CASCADE"},{"name":"pages_localizations_links_inv_fk","columns":["inv_page_id"],"referencedColumns":["id"],"referencedTable":"pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"page_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"partners_partners_type_links","indexes":[{"name":"partners_partners_type_links_fk","columns":["partner_id"]},{"name":"partners_partners_type_links_inv_fk","columns":["partners_type_id"]},{"name":"partners_partners_type_links_unique","columns":["partner_id","partners_type_id"],"type":"unique"},{"name":"partners_partners_type_links_order_inv_fk","columns":["partner_order"]}],"foreignKeys":[{"name":"partners_partners_type_links_fk","columns":["partner_id"],"referencedColumns":["id"],"referencedTable":"partners","onDelete":"CASCADE"},{"name":"partners_partners_type_links_inv_fk","columns":["partners_type_id"],"referencedColumns":["id"],"referencedTable":"partners_types","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"partner_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"partners_type_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"partner_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"partners_localizations_links","indexes":[{"name":"partners_localizations_links_fk","columns":["partner_id"]},{"name":"partners_localizations_links_inv_fk","columns":["inv_partner_id"]},{"name":"partners_localizations_links_unique","columns":["partner_id","inv_partner_id"],"type":"unique"},{"name":"partners_localizations_links_order_fk","columns":["partner_order"]}],"foreignKeys":[{"name":"partners_localizations_links_fk","columns":["partner_id"],"referencedColumns":["id"],"referencedTable":"partners","onDelete":"CASCADE"},{"name":"partners_localizations_links_inv_fk","columns":["inv_partner_id"],"referencedColumns":["id"],"referencedTable":"partners","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"partner_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_partner_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"partner_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"partners_types_localizations_links","indexes":[{"name":"partners_types_localizations_links_fk","columns":["partners_type_id"]},{"name":"partners_types_localizations_links_inv_fk","columns":["inv_partners_type_id"]},{"name":"partners_types_localizations_links_unique","columns":["partners_type_id","inv_partners_type_id"],"type":"unique"},{"name":"partners_types_localizations_links_order_fk","columns":["partners_type_order"]}],"foreignKeys":[{"name":"partners_types_localizations_links_fk","columns":["partners_type_id"],"referencedColumns":["id"],"referencedTable":"partners_types","onDelete":"CASCADE"},{"name":"partners_types_localizations_links_inv_fk","columns":["inv_partners_type_id"],"referencedColumns":["id"],"referencedTable":"partners_types","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"partners_type_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_partners_type_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"partners_type_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"privacy_policies_localizations_links","indexes":[{"name":"privacy_policies_localizations_links_fk","columns":["privacy_policy_id"]},{"name":"privacy_policies_localizations_links_inv_fk","columns":["inv_privacy_policy_id"]},{"name":"privacy_policies_localizations_links_unique","columns":["privacy_policy_id","inv_privacy_policy_id"],"type":"unique"},{"name":"privacy_policies_localizations_links_order_fk","columns":["privacy_policy_order"]}],"foreignKeys":[{"name":"privacy_policies_localizations_links_fk","columns":["privacy_policy_id"],"referencedColumns":["id"],"referencedTable":"privacy_policies","onDelete":"CASCADE"},{"name":"privacy_policies_localizations_links_inv_fk","columns":["inv_privacy_policy_id"],"referencedColumns":["id"],"referencedTable":"privacy_policies","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"privacy_policy_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_privacy_policy_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"privacy_policy_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"products_localizations_links","indexes":[{"name":"products_localizations_links_fk","columns":["product_id"]},{"name":"products_localizations_links_inv_fk","columns":["inv_product_id"]},{"name":"products_localizations_links_unique","columns":["product_id","inv_product_id"],"type":"unique"},{"name":"products_localizations_links_order_fk","columns":["product_order"]}],"foreignKeys":[{"name":"products_localizations_links_fk","columns":["product_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"},{"name":"products_localizations_links_inv_fk","columns":["inv_product_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"servers_server_series_links","indexes":[{"name":"servers_server_series_links_fk","columns":["server_id"]},{"name":"servers_server_series_links_inv_fk","columns":["server_serieses_id"]},{"name":"servers_server_series_links_unique","columns":["server_id","server_serieses_id"],"type":"unique"},{"name":"servers_server_series_links_order_inv_fk","columns":["server_order"]}],"foreignKeys":[{"name":"servers_server_series_links_fk","columns":["server_id"],"referencedColumns":["id"],"referencedTable":"servers","onDelete":"CASCADE"},{"name":"servers_server_series_links_inv_fk","columns":["server_serieses_id"],"referencedColumns":["id"],"referencedTable":"server_series","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"server_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"server_serieses_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"server_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"servers_server_processor_links","indexes":[{"name":"servers_server_processor_links_fk","columns":["server_id"]},{"name":"servers_server_processor_links_inv_fk","columns":["server_processor_id"]},{"name":"servers_server_processor_links_unique","columns":["server_id","server_processor_id"],"type":"unique"},{"name":"servers_server_processor_links_order_inv_fk","columns":["server_order"]}],"foreignKeys":[{"name":"servers_server_processor_links_fk","columns":["server_id"],"referencedColumns":["id"],"referencedTable":"servers","onDelete":"CASCADE"},{"name":"servers_server_processor_links_inv_fk","columns":["server_processor_id"],"referencedColumns":["id"],"referencedTable":"server_processors","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"server_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"server_processor_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"server_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"servers_server_size_links","indexes":[{"name":"servers_server_size_links_fk","columns":["server_id"]},{"name":"servers_server_size_links_inv_fk","columns":["server_size_id"]},{"name":"servers_server_size_links_unique","columns":["server_id","server_size_id"],"type":"unique"},{"name":"servers_server_size_links_order_inv_fk","columns":["server_order"]}],"foreignKeys":[{"name":"servers_server_size_links_fk","columns":["server_id"],"referencedColumns":["id"],"referencedTable":"servers","onDelete":"CASCADE"},{"name":"servers_server_size_links_inv_fk","columns":["server_size_id"],"referencedColumns":["id"],"referencedTable":"server_sizes","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"server_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"server_size_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"server_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"servers_localizations_links","indexes":[{"name":"servers_localizations_links_fk","columns":["server_id"]},{"name":"servers_localizations_links_inv_fk","columns":["inv_server_id"]},{"name":"servers_localizations_links_unique","columns":["server_id","inv_server_id"],"type":"unique"},{"name":"servers_localizations_links_order_fk","columns":["server_order"]}],"foreignKeys":[{"name":"servers_localizations_links_fk","columns":["server_id"],"referencedColumns":["id"],"referencedTable":"servers","onDelete":"CASCADE"},{"name":"servers_localizations_links_inv_fk","columns":["inv_server_id"],"referencedColumns":["id"],"referencedTable":"servers","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"server_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_server_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"server_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"server_types_server_series_links","indexes":[{"name":"server_types_server_series_links_fk","columns":["server_type_id"]},{"name":"server_types_server_series_links_inv_fk","columns":["server_serieses_id"]},{"name":"server_types_server_series_links_unique","columns":["server_type_id","server_serieses_id"],"type":"unique"},{"name":"server_types_server_series_links_order_fk","columns":["server_serieses_order"]},{"name":"server_types_server_series_links_order_inv_fk","columns":["server_type_order"]}],"foreignKeys":[{"name":"server_types_server_series_links_fk","columns":["server_type_id"],"referencedColumns":["id"],"referencedTable":"server_types","onDelete":"CASCADE"},{"name":"server_types_server_series_links_inv_fk","columns":["server_serieses_id"],"referencedColumns":["id"],"referencedTable":"server_series","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"server_type_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"server_serieses_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"server_serieses_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"server_type_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"server_types_server_processors_links","indexes":[{"name":"server_types_server_processors_links_fk","columns":["server_type_id"]},{"name":"server_types_server_processors_links_inv_fk","columns":["server_processor_id"]},{"name":"server_types_server_processors_links_unique","columns":["server_type_id","server_processor_id"],"type":"unique"},{"name":"server_types_server_processors_links_order_fk","columns":["server_processor_order"]},{"name":"server_types_server_processors_links_order_inv_fk","columns":["server_type_order"]}],"foreignKeys":[{"name":"server_types_server_processors_links_fk","columns":["server_type_id"],"referencedColumns":["id"],"referencedTable":"server_types","onDelete":"CASCADE"},{"name":"server_types_server_processors_links_inv_fk","columns":["server_processor_id"],"referencedColumns":["id"],"referencedTable":"server_processors","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"server_type_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"server_processor_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"server_processor_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"server_type_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"server_types_localizations_links","indexes":[{"name":"server_types_localizations_links_fk","columns":["server_type_id"]},{"name":"server_types_localizations_links_inv_fk","columns":["inv_server_type_id"]},{"name":"server_types_localizations_links_unique","columns":["server_type_id","inv_server_type_id"],"type":"unique"},{"name":"server_types_localizations_links_order_fk","columns":["server_type_order"]}],"foreignKeys":[{"name":"server_types_localizations_links_fk","columns":["server_type_id"],"referencedColumns":["id"],"referencedTable":"server_types","onDelete":"CASCADE"},{"name":"server_types_localizations_links_inv_fk","columns":["inv_server_type_id"],"referencedColumns":["id"],"referencedTable":"server_types","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"server_type_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_server_type_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"server_type_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"site_contacts_localizations_links","indexes":[{"name":"site_contacts_localizations_links_fk","columns":["site_contact_id"]},{"name":"site_contacts_localizations_links_inv_fk","columns":["inv_site_contact_id"]},{"name":"site_contacts_localizations_links_unique","columns":["site_contact_id","inv_site_contact_id"],"type":"unique"},{"name":"site_contacts_localizations_links_order_fk","columns":["site_contact_order"]}],"foreignKeys":[{"name":"site_contacts_localizations_links_fk","columns":["site_contact_id"],"referencedColumns":["id"],"referencedTable":"site_contacts","onDelete":"CASCADE"},{"name":"site_contacts_localizations_links_inv_fk","columns":["inv_site_contact_id"],"referencedColumns":["id"],"referencedTable":"site_contacts","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"site_contact_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_site_contact_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"site_contact_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"site_settings_footer_form_links","indexes":[{"name":"site_settings_footer_form_links_fk","columns":["site_setting_id"]},{"name":"site_settings_footer_form_links_inv_fk","columns":["form_id"]},{"name":"site_settings_footer_form_links_unique","columns":["site_setting_id","form_id"],"type":"unique"}],"foreignKeys":[{"name":"site_settings_footer_form_links_fk","columns":["site_setting_id"],"referencedColumns":["id"],"referencedTable":"site_settings","onDelete":"CASCADE"},{"name":"site_settings_footer_form_links_inv_fk","columns":["form_id"],"referencedColumns":["id"],"referencedTable":"forms","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"site_setting_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"form_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"tests_localizations_links","indexes":[{"name":"tests_localizations_links_fk","columns":["test_id"]},{"name":"tests_localizations_links_inv_fk","columns":["inv_test_id"]},{"name":"tests_localizations_links_unique","columns":["test_id","inv_test_id"],"type":"unique"},{"name":"tests_localizations_links_order_fk","columns":["test_order"]}],"foreignKeys":[{"name":"tests_localizations_links_fk","columns":["test_id"],"referencedColumns":["id"],"referencedTable":"tests","onDelete":"CASCADE"},{"name":"tests_localizations_links_inv_fk","columns":["inv_test_id"],"referencedColumns":["id"],"referencedTable":"tests","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"test_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_test_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"test_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_page_components_cards_components","indexes":[{"name":"components_page_components_cards_field_index","columns":["field"]},{"name":"components_page_components_cards_component_type_index","columns":["component_type"]},{"name":"components_page_components_cards_entity_fk","columns":["entity_id"]},{"name":"components_page_components_cards_unique","columns":["entity_id","component_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_page_components_cards_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_page_components_cards","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_page_components_pages_components","indexes":[{"name":"components_page_components_pages_field_index","columns":["field"]},{"name":"components_page_components_pages_component_type_index","columns":["component_type"]},{"name":"components_page_components_pages_entity_fk","columns":["entity_id"]},{"name":"components_page_components_pages_unique","columns":["entity_id","component_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_page_components_pages_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_page_components_pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_page_components_servers_sliders_servers_links","indexes":[{"name":"components_page_components_servers_sliders_servers_links_fk","columns":["servers_slider_id"]},{"name":"components_page_components_servers_sliders_servers_links_inv_fk","columns":["server_id"]},{"name":"components_page_components_servers_sliders_servers_links_unique","columns":["servers_slider_id","server_id"],"type":"unique"},{"name":"components_page_components_servers_sliders_servers_links_order_fk","columns":["server_order"]}],"foreignKeys":[{"name":"components_page_components_servers_sliders_servers_links_fk","columns":["servers_slider_id"],"referencedColumns":["id"],"referencedTable":"components_page_components_servers_sliders","onDelete":"CASCADE"},{"name":"components_page_components_servers_sliders_servers_links_inv_fk","columns":["server_id"],"referencedColumns":["id"],"referencedTable":"servers","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"servers_slider_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"server_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"server_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_utils_components_block_settings_components","indexes":[{"name":"components_utils_components_block_settings_field_index","columns":["field"]},{"name":"components_utils_components_block_settings_component_type_index","columns":["component_type"]},{"name":"components_utils_components_block_settings_entity_fk","columns":["entity_id"]},{"name":"components_utils_components_block_settings_unique","columns":["entity_id","component_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_utils_components_block_settings_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_utils_components_block_settings","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_utils_components_block_settings_form_links","indexes":[{"name":"components_utils_components_block_settings_form_links_fk","columns":["block_settings_id"]},{"name":"components_utils_components_block_settings_form_links_inv_fk","columns":["form_id"]},{"name":"components_utils_components_block_settings_form_links_unique","columns":["block_settings_id","form_id"],"type":"unique"}],"foreignKeys":[{"name":"components_utils_components_block_settings_form_links_fk","columns":["block_settings_id"],"referencedColumns":["id"],"referencedTable":"components_utils_components_block_settings","onDelete":"CASCADE"},{"name":"components_utils_components_block_settings_form_links_inv_fk","columns":["form_id"],"referencedColumns":["id"],"referencedTable":"forms","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"block_settings_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"form_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_utils_components_page_links_product_links","indexes":[{"name":"components_utils_components_page_links_product_links_fk","columns":["page_link_id"]},{"name":"components_utils_components_page_links_product_links_inv_fk","columns":["product_id"]},{"name":"components_utils_components_page_links_product_links_unique","columns":["page_link_id","product_id"],"type":"unique"}],"foreignKeys":[{"name":"components_utils_components_page_links_product_links_fk","columns":["page_link_id"],"referencedColumns":["id"],"referencedTable":"components_utils_components_page_links","onDelete":"CASCADE"},{"name":"components_utils_components_page_links_product_links_inv_fk","columns":["product_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"page_link_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2023-12-28 15:18:32.313	3530fe09d9ad1b6f7f2d4e3bcc2642c9
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_token_permissions_token_links (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_order) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_tokens (id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: tests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tests (id, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: tests_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tests_localizations_links (id, test_id, inv_test_id, test_order) FROM stdin;
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::users-permissions.user.me	2023-12-21 13:11:38.53	2023-12-21 13:11:38.53	\N	\N
2	plugin::users-permissions.auth.changePassword	2023-12-21 13:11:38.53	2023-12-21 13:11:38.53	\N	\N
3	plugin::users-permissions.auth.callback	2023-12-21 13:11:38.552	2023-12-21 13:11:38.552	\N	\N
4	plugin::users-permissions.auth.connect	2023-12-21 13:11:38.552	2023-12-21 13:11:38.552	\N	\N
5	plugin::users-permissions.auth.resetPassword	2023-12-21 13:11:38.552	2023-12-21 13:11:38.552	\N	\N
6	plugin::users-permissions.auth.forgotPassword	2023-12-21 13:11:38.552	2023-12-21 13:11:38.552	\N	\N
9	plugin::users-permissions.auth.sendEmailConfirmation	2023-12-21 13:11:38.552	2023-12-21 13:11:38.552	\N	\N
7	plugin::users-permissions.auth.register	2023-12-21 13:11:38.552	2023-12-21 13:11:38.552	\N	\N
8	plugin::users-permissions.auth.emailConfirmation	2023-12-21 13:11:38.552	2023-12-21 13:11:38.552	\N	\N
\.


--
-- Data for Name: up_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
1	2	1	1
2	1	1	1
3	3	2	1
4	4	2	1
5	5	2	2
6	6	2	2
7	7	2	2
8	9	2	2
9	8	2	2
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Authenticated	Default role given to authenticated user.	authenticated	2023-12-21 13:11:38.519	2023-12-21 13:11:38.519	\N	\N
2	Public	Default role given to unauthenticated user.	public	2023-12-21 13:11:38.521	2023-12-21 13:11:38.521	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users (id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: up_users_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users_role_links (id, user_id, role_id, user_order) FROM stdin;
\.


--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: upload_folders_parent_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upload_folders_parent_links (id, folder_id, inv_folder_id, folder_order) FROM stdin;
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_id_seq', 7, true);


--
-- Name: addresses_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_localizations_links_id_seq', 4, true);


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 338, true);


--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 440, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_roles_links_id_seq', 1, true);


--
-- Name: audience_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audience_id_seq', 1, false);


--
-- Name: components_page_components_cards_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_page_components_cards_components_id_seq', 1, false);


--
-- Name: components_page_components_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_page_components_cards_id_seq', 1, false);


--
-- Name: components_page_components_pages_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_page_components_pages_components_id_seq', 1, false);


--
-- Name: components_page_components_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_page_components_pages_id_seq', 1, false);


--
-- Name: components_page_components_partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_page_components_partners_id_seq', 1, false);


--
-- Name: components_page_components_servers_sliders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_page_components_servers_sliders_id_seq', 1, false);


--
-- Name: components_page_components_servers_sliders_servers_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_page_components_servers_sliders_servers_links_id_seq', 1, false);


--
-- Name: components_utils_components_block_settings_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_utils_components_block_settings_components_id_seq', 1, false);


--
-- Name: components_utils_components_block_settings_form_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_utils_components_block_settings_form_links_id_seq', 1, false);


--
-- Name: components_utils_components_block_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_utils_components_block_settings_id_seq', 1, false);


--
-- Name: components_utils_components_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_utils_components_cards_id_seq', 1, false);


--
-- Name: components_utils_components_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_utils_components_links_id_seq', 1, false);


--
-- Name: components_utils_components_page_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_utils_components_page_links_id_seq', 1, false);


--
-- Name: components_utils_components_page_links_product_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_utils_components_page_links_product_links_id_seq', 1, false);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 2, true);


--
-- Name: events_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_localizations_links_id_seq', 2, true);


--
-- Name: files_folder_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_folder_links_id_seq', 1, false);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 9, true);


--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 17, true);


--
-- Name: form_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.form_fields_id_seq', 10, true);


--
-- Name: form_fields_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.form_fields_localizations_links_id_seq', 10, true);


--
-- Name: forms_form_fields_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forms_form_fields_links_id_seq', 10, true);


--
-- Name: forms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forms_id_seq', 2, true);


--
-- Name: forms_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forms_localizations_links_id_seq', 2, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 3, true);


--
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_items_id_seq', 1, true);


--
-- Name: menu_items_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_items_parent_links_id_seq', 1, false);


--
-- Name: menu_items_root_menu_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_items_root_menu_links_id_seq', 1, true);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menus_id_seq', 1, true);


--
-- Name: navigations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.navigations_id_seq', 3, true);


--
-- Name: navigations_items_audience_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.navigations_items_audience_links_id_seq', 1, false);


--
-- Name: navigations_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.navigations_items_id_seq', 28, true);


--
-- Name: navigations_items_master_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.navigations_items_master_links_id_seq', 43, true);


--
-- Name: navigations_items_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.navigations_items_parent_links_id_seq', 24, true);


--
-- Name: navigations_items_related_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.navigations_items_related_id_seq', 34, true);


--
-- Name: navigations_items_related_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.navigations_items_related_links_id_seq', 37, true);


--
-- Name: navigations_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.navigations_localizations_links_id_seq', 170, true);


--
-- Name: news_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_tags_id_seq', 2, true);


--
-- Name: news_tags_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_tags_localizations_links_id_seq', 2, true);


--
-- Name: newsletters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsletters_id_seq', 5, true);


--
-- Name: newsletters_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsletters_localizations_links_id_seq', 2, true);


--
-- Name: newsletters_news_tags_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsletters_news_tags_links_id_seq', 2, true);


--
-- Name: pages_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_components_id_seq', 1, false);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_id_seq', 14, true);


--
-- Name: pages_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_localizations_links_id_seq', 14, true);


--
-- Name: partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partners_id_seq', 6, true);


--
-- Name: partners_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partners_localizations_links_id_seq', 6, true);


--
-- Name: partners_partners_type_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partners_partners_type_links_id_seq', 6, true);


--
-- Name: partners_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partners_types_id_seq', 4, true);


--
-- Name: partners_types_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partners_types_localizations_links_id_seq', 4, true);


--
-- Name: privacy_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.privacy_policies_id_seq', 2, true);


--
-- Name: privacy_policies_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.privacy_policies_localizations_links_id_seq', 2, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 8, true);


--
-- Name: products_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_localizations_links_id_seq', 8, true);


--
-- Name: server_processors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.server_processors_id_seq', 2, true);


--
-- Name: server_series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.server_series_id_seq', 1, true);


--
-- Name: server_sizes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.server_sizes_id_seq', 6, true);


--
-- Name: server_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.server_types_id_seq', 6, true);


--
-- Name: server_types_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.server_types_localizations_links_id_seq', 6, true);


--
-- Name: server_types_server_processors_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.server_types_server_processors_links_id_seq', 12, true);


--
-- Name: server_types_server_series_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.server_types_server_series_links_id_seq', 6, true);


--
-- Name: servers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servers_id_seq', 2, true);


--
-- Name: servers_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servers_localizations_links_id_seq', 2, true);


--
-- Name: servers_server_processor_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servers_server_processor_links_id_seq', 2, true);


--
-- Name: servers_server_series_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servers_server_series_links_id_seq', 2, true);


--
-- Name: servers_server_size_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servers_server_size_links_id_seq', 2, true);


--
-- Name: site_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_contacts_id_seq', 2, true);


--
-- Name: site_contacts_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_contacts_localizations_links_id_seq', 2, true);


--
-- Name: site_settings_footer_form_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_settings_footer_form_links_id_seq', 1, true);


--
-- Name: site_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_settings_id_seq', 1, true);


--
-- Name: slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.slugs_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 37, true);


--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_links_id_seq', 37, true);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, true);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 60, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 51, true);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_links_id_seq', 1, false);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tests_id_seq', 1, false);


--
-- Name: tests_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tests_localizations_links_id_seq', 1, false);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 9, true);


--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 9, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_id_seq', 1, false);


--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_role_links_id_seq', 1, false);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);


--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);


--
-- Name: addresses_localizations_links addresses_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses_localizations_links
    ADD CONSTRAINT addresses_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: addresses_localizations_links addresses_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses_localizations_links
    ADD CONSTRAINT addresses_localizations_links_unique UNIQUE (address_id, inv_address_id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_unique UNIQUE (user_id, role_id);


--
-- Name: audience audience_key_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audience
    ADD CONSTRAINT audience_key_unique UNIQUE (key);


--
-- Name: audience audience_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audience
    ADD CONSTRAINT audience_pkey PRIMARY KEY (id);


--
-- Name: components_page_components_cards_components components_page_components_cards_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_cards_components
    ADD CONSTRAINT components_page_components_cards_components_pkey PRIMARY KEY (id);


--
-- Name: components_page_components_cards components_page_components_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_cards
    ADD CONSTRAINT components_page_components_cards_pkey PRIMARY KEY (id);


--
-- Name: components_page_components_cards_components components_page_components_cards_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_cards_components
    ADD CONSTRAINT components_page_components_cards_unique UNIQUE (entity_id, component_id, field, component_type);


--
-- Name: components_page_components_pages_components components_page_components_pages_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_pages_components
    ADD CONSTRAINT components_page_components_pages_components_pkey PRIMARY KEY (id);


--
-- Name: components_page_components_pages components_page_components_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_pages
    ADD CONSTRAINT components_page_components_pages_pkey PRIMARY KEY (id);


--
-- Name: components_page_components_pages_components components_page_components_pages_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_pages_components
    ADD CONSTRAINT components_page_components_pages_unique UNIQUE (entity_id, component_id, field, component_type);


--
-- Name: components_page_components_partners components_page_components_partners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_partners
    ADD CONSTRAINT components_page_components_partners_pkey PRIMARY KEY (id);


--
-- Name: components_page_components_servers_sliders components_page_components_servers_sliders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_servers_sliders
    ADD CONSTRAINT components_page_components_servers_sliders_pkey PRIMARY KEY (id);


--
-- Name: components_page_components_servers_sliders_servers_links components_page_components_servers_sliders_servers_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_servers_sliders_servers_links
    ADD CONSTRAINT components_page_components_servers_sliders_servers_links_pkey PRIMARY KEY (id);


--
-- Name: components_page_components_servers_sliders_servers_links components_page_components_servers_sliders_servers_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_servers_sliders_servers_links
    ADD CONSTRAINT components_page_components_servers_sliders_servers_links_unique UNIQUE (servers_slider_id, server_id);


--
-- Name: components_utils_components_block_settings_components components_utils_components_block_settings_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_block_settings_components
    ADD CONSTRAINT components_utils_components_block_settings_components_pkey PRIMARY KEY (id);


--
-- Name: components_utils_components_block_settings_form_links components_utils_components_block_settings_form_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_block_settings_form_links
    ADD CONSTRAINT components_utils_components_block_settings_form_links_pkey PRIMARY KEY (id);


--
-- Name: components_utils_components_block_settings_form_links components_utils_components_block_settings_form_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_block_settings_form_links
    ADD CONSTRAINT components_utils_components_block_settings_form_links_unique UNIQUE (block_settings_id, form_id);


--
-- Name: components_utils_components_block_settings components_utils_components_block_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_block_settings
    ADD CONSTRAINT components_utils_components_block_settings_pkey PRIMARY KEY (id);


--
-- Name: components_utils_components_block_settings_components components_utils_components_block_settings_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_block_settings_components
    ADD CONSTRAINT components_utils_components_block_settings_unique UNIQUE (entity_id, component_id, field, component_type);


--
-- Name: components_utils_components_cards components_utils_components_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_cards
    ADD CONSTRAINT components_utils_components_cards_pkey PRIMARY KEY (id);


--
-- Name: components_utils_components_links components_utils_components_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_links
    ADD CONSTRAINT components_utils_components_links_pkey PRIMARY KEY (id);


--
-- Name: components_utils_components_page_links components_utils_components_page_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_page_links
    ADD CONSTRAINT components_utils_components_page_links_pkey PRIMARY KEY (id);


--
-- Name: components_utils_components_page_links_product_links components_utils_components_page_links_product_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_page_links_product_links
    ADD CONSTRAINT components_utils_components_page_links_product_links_pkey PRIMARY KEY (id);


--
-- Name: components_utils_components_page_links_product_links components_utils_components_page_links_product_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_page_links_product_links
    ADD CONSTRAINT components_utils_components_page_links_product_links_unique UNIQUE (page_link_id, product_id);


--
-- Name: events_localizations_links events_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_localizations_links
    ADD CONSTRAINT events_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: events_localizations_links events_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_localizations_links
    ADD CONSTRAINT events_localizations_links_unique UNIQUE (event_id, inv_event_id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: files_folder_links files_folder_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_pkey PRIMARY KEY (id);


--
-- Name: files_folder_links files_folder_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_unique UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_morphs files_related_morphs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_pkey PRIMARY KEY (id);


--
-- Name: form_fields_localizations_links form_fields_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_fields_localizations_links
    ADD CONSTRAINT form_fields_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: form_fields_localizations_links form_fields_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_fields_localizations_links
    ADD CONSTRAINT form_fields_localizations_links_unique UNIQUE (form_field_id, inv_form_field_id);


--
-- Name: form_fields form_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_fields
    ADD CONSTRAINT form_fields_pkey PRIMARY KEY (id);


--
-- Name: forms_form_fields_links forms_form_fields_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_form_fields_links
    ADD CONSTRAINT forms_form_fields_links_pkey PRIMARY KEY (id);


--
-- Name: forms_form_fields_links forms_form_fields_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_form_fields_links
    ADD CONSTRAINT forms_form_fields_links_unique UNIQUE (form_id, form_field_id);


--
-- Name: forms_localizations_links forms_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_localizations_links
    ADD CONSTRAINT forms_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: forms_localizations_links forms_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_localizations_links
    ADD CONSTRAINT forms_localizations_links_unique UNIQUE (form_id, inv_form_id);


--
-- Name: forms forms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: menu_items_parent_links menu_items_parent_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_parent_links
    ADD CONSTRAINT menu_items_parent_links_pkey PRIMARY KEY (id);


--
-- Name: menu_items_parent_links menu_items_parent_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_parent_links
    ADD CONSTRAINT menu_items_parent_links_unique UNIQUE (menu_item_id, inv_menu_item_id);


--
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- Name: menu_items_root_menu_links menu_items_root_menu_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_root_menu_links
    ADD CONSTRAINT menu_items_root_menu_links_pkey PRIMARY KEY (id);


--
-- Name: menu_items_root_menu_links menu_items_root_menu_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_root_menu_links
    ADD CONSTRAINT menu_items_root_menu_links_unique UNIQUE (menu_item_id, menu_id);


--
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- Name: menus menus_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_slug_unique UNIQUE (slug);


--
-- Name: navigations_items_audience_links navigations_items_audience_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_audience_links
    ADD CONSTRAINT navigations_items_audience_links_pkey PRIMARY KEY (id);


--
-- Name: navigations_items_audience_links navigations_items_audience_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_audience_links
    ADD CONSTRAINT navigations_items_audience_links_unique UNIQUE (navigation_item_id, audience_id);


--
-- Name: navigations_items_master_links navigations_items_master_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_master_links
    ADD CONSTRAINT navigations_items_master_links_pkey PRIMARY KEY (id);


--
-- Name: navigations_items_master_links navigations_items_master_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_master_links
    ADD CONSTRAINT navigations_items_master_links_unique UNIQUE (navigation_item_id, navigation_id);


--
-- Name: navigations_items_parent_links navigations_items_parent_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_parent_links
    ADD CONSTRAINT navigations_items_parent_links_pkey PRIMARY KEY (id);


--
-- Name: navigations_items_parent_links navigations_items_parent_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_parent_links
    ADD CONSTRAINT navigations_items_parent_links_unique UNIQUE (navigation_item_id, inv_navigation_item_id);


--
-- Name: navigations_items navigations_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items
    ADD CONSTRAINT navigations_items_pkey PRIMARY KEY (id);


--
-- Name: navigations_items_related_links navigations_items_related_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_related_links
    ADD CONSTRAINT navigations_items_related_links_pkey PRIMARY KEY (id);


--
-- Name: navigations_items_related_links navigations_items_related_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_related_links
    ADD CONSTRAINT navigations_items_related_links_unique UNIQUE (navigation_item_id, navigations_items_related_id);


--
-- Name: navigations_items_related navigations_items_related_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_related
    ADD CONSTRAINT navigations_items_related_pkey PRIMARY KEY (id);


--
-- Name: navigations_localizations_links navigations_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_localizations_links
    ADD CONSTRAINT navigations_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: navigations_localizations_links navigations_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_localizations_links
    ADD CONSTRAINT navigations_localizations_links_unique UNIQUE (navigation_id, inv_navigation_id);


--
-- Name: navigations navigations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations
    ADD CONSTRAINT navigations_pkey PRIMARY KEY (id);


--
-- Name: navigations navigations_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations
    ADD CONSTRAINT navigations_slug_unique UNIQUE (slug);


--
-- Name: news_tags_localizations_links news_tags_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_tags_localizations_links
    ADD CONSTRAINT news_tags_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: news_tags_localizations_links news_tags_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_tags_localizations_links
    ADD CONSTRAINT news_tags_localizations_links_unique UNIQUE (news_tag_id, inv_news_tag_id);


--
-- Name: news_tags news_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_tags
    ADD CONSTRAINT news_tags_pkey PRIMARY KEY (id);


--
-- Name: newsletters_localizations_links newsletters_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletters_localizations_links
    ADD CONSTRAINT newsletters_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: newsletters_localizations_links newsletters_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletters_localizations_links
    ADD CONSTRAINT newsletters_localizations_links_unique UNIQUE (newsletter_id, inv_newsletter_id);


--
-- Name: newsletters_news_tags_links newsletters_news_tags_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletters_news_tags_links
    ADD CONSTRAINT newsletters_news_tags_links_pkey PRIMARY KEY (id);


--
-- Name: newsletters_news_tags_links newsletters_news_tags_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletters_news_tags_links
    ADD CONSTRAINT newsletters_news_tags_links_unique UNIQUE (newsletter_id, news_tag_id);


--
-- Name: newsletters newsletters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletters
    ADD CONSTRAINT newsletters_pkey PRIMARY KEY (id);


--
-- Name: pages_components pages_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_components
    ADD CONSTRAINT pages_components_pkey PRIMARY KEY (id);


--
-- Name: pages_localizations_links pages_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_localizations_links
    ADD CONSTRAINT pages_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: pages_localizations_links pages_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_localizations_links
    ADD CONSTRAINT pages_localizations_links_unique UNIQUE (page_id, inv_page_id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: pages_components pages_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_components
    ADD CONSTRAINT pages_unique UNIQUE (entity_id, component_id, field, component_type);


--
-- Name: partners_localizations_links partners_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_localizations_links
    ADD CONSTRAINT partners_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: partners_localizations_links partners_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_localizations_links
    ADD CONSTRAINT partners_localizations_links_unique UNIQUE (partner_id, inv_partner_id);


--
-- Name: partners_partners_type_links partners_partners_type_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_partners_type_links
    ADD CONSTRAINT partners_partners_type_links_pkey PRIMARY KEY (id);


--
-- Name: partners_partners_type_links partners_partners_type_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_partners_type_links
    ADD CONSTRAINT partners_partners_type_links_unique UNIQUE (partner_id, partners_type_id);


--
-- Name: partners partners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- Name: partners_types_localizations_links partners_types_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_types_localizations_links
    ADD CONSTRAINT partners_types_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: partners_types_localizations_links partners_types_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_types_localizations_links
    ADD CONSTRAINT partners_types_localizations_links_unique UNIQUE (partners_type_id, inv_partners_type_id);


--
-- Name: partners_types partners_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_types
    ADD CONSTRAINT partners_types_pkey PRIMARY KEY (id);


--
-- Name: privacy_policies_localizations_links privacy_policies_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privacy_policies_localizations_links
    ADD CONSTRAINT privacy_policies_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: privacy_policies_localizations_links privacy_policies_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privacy_policies_localizations_links
    ADD CONSTRAINT privacy_policies_localizations_links_unique UNIQUE (privacy_policy_id, inv_privacy_policy_id);


--
-- Name: privacy_policies privacy_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privacy_policies
    ADD CONSTRAINT privacy_policies_pkey PRIMARY KEY (id);


--
-- Name: products_localizations_links products_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_localizations_links
    ADD CONSTRAINT products_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: products_localizations_links products_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_localizations_links
    ADD CONSTRAINT products_localizations_links_unique UNIQUE (product_id, inv_product_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: server_processors server_processors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_processors
    ADD CONSTRAINT server_processors_pkey PRIMARY KEY (id);


--
-- Name: server_series server_series_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_series
    ADD CONSTRAINT server_series_pkey PRIMARY KEY (id);


--
-- Name: server_sizes server_sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_sizes
    ADD CONSTRAINT server_sizes_pkey PRIMARY KEY (id);


--
-- Name: server_types_localizations_links server_types_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types_localizations_links
    ADD CONSTRAINT server_types_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: server_types_localizations_links server_types_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types_localizations_links
    ADD CONSTRAINT server_types_localizations_links_unique UNIQUE (server_type_id, inv_server_type_id);


--
-- Name: server_types server_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types
    ADD CONSTRAINT server_types_pkey PRIMARY KEY (id);


--
-- Name: server_types_server_processors_links server_types_server_processors_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types_server_processors_links
    ADD CONSTRAINT server_types_server_processors_links_pkey PRIMARY KEY (id);


--
-- Name: server_types_server_processors_links server_types_server_processors_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types_server_processors_links
    ADD CONSTRAINT server_types_server_processors_links_unique UNIQUE (server_type_id, server_processor_id);


--
-- Name: server_types_server_series_links server_types_server_series_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types_server_series_links
    ADD CONSTRAINT server_types_server_series_links_pkey PRIMARY KEY (id);


--
-- Name: server_types_server_series_links server_types_server_series_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types_server_series_links
    ADD CONSTRAINT server_types_server_series_links_unique UNIQUE (server_type_id, server_serieses_id);


--
-- Name: servers_localizations_links servers_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_localizations_links
    ADD CONSTRAINT servers_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: servers_localizations_links servers_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_localizations_links
    ADD CONSTRAINT servers_localizations_links_unique UNIQUE (server_id, inv_server_id);


--
-- Name: servers servers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (id);


--
-- Name: servers_server_processor_links servers_server_processor_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_server_processor_links
    ADD CONSTRAINT servers_server_processor_links_pkey PRIMARY KEY (id);


--
-- Name: servers_server_processor_links servers_server_processor_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_server_processor_links
    ADD CONSTRAINT servers_server_processor_links_unique UNIQUE (server_id, server_processor_id);


--
-- Name: servers_server_series_links servers_server_series_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_server_series_links
    ADD CONSTRAINT servers_server_series_links_pkey PRIMARY KEY (id);


--
-- Name: servers_server_series_links servers_server_series_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_server_series_links
    ADD CONSTRAINT servers_server_series_links_unique UNIQUE (server_id, server_serieses_id);


--
-- Name: servers_server_size_links servers_server_size_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_server_size_links
    ADD CONSTRAINT servers_server_size_links_pkey PRIMARY KEY (id);


--
-- Name: servers_server_size_links servers_server_size_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_server_size_links
    ADD CONSTRAINT servers_server_size_links_unique UNIQUE (server_id, server_size_id);


--
-- Name: site_contacts_localizations_links site_contacts_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_contacts_localizations_links
    ADD CONSTRAINT site_contacts_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: site_contacts_localizations_links site_contacts_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_contacts_localizations_links
    ADD CONSTRAINT site_contacts_localizations_links_unique UNIQUE (site_contact_id, inv_site_contact_id);


--
-- Name: site_contacts site_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_contacts
    ADD CONSTRAINT site_contacts_pkey PRIMARY KEY (id);


--
-- Name: site_settings_footer_form_links site_settings_footer_form_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings_footer_form_links
    ADD CONSTRAINT site_settings_footer_form_links_pkey PRIMARY KEY (id);


--
-- Name: site_settings_footer_form_links site_settings_footer_form_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings_footer_form_links
    ADD CONSTRAINT site_settings_footer_form_links_unique UNIQUE (site_setting_id, form_id);


--
-- Name: site_settings site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_pkey PRIMARY KEY (id);


--
-- Name: slugs slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slugs
    ADD CONSTRAINT slugs_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_unique UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_unique UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: tests_localizations_links tests_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests_localizations_links
    ADD CONSTRAINT tests_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: tests_localizations_links tests_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests_localizations_links
    ADD CONSTRAINT tests_localizations_links_unique UNIQUE (test_id, inv_test_id);


--
-- Name: tests tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_unique UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_unique UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: addresses_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX addresses_created_by_id_fk ON public.addresses USING btree (created_by_id);


--
-- Name: addresses_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX addresses_localizations_links_fk ON public.addresses_localizations_links USING btree (address_id);


--
-- Name: addresses_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX addresses_localizations_links_inv_fk ON public.addresses_localizations_links USING btree (inv_address_id);


--
-- Name: addresses_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX addresses_localizations_links_order_fk ON public.addresses_localizations_links USING btree (address_order);


--
-- Name: addresses_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX addresses_updated_by_id_fk ON public.addresses USING btree (updated_by_id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);


--
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);


--
-- Name: admin_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_order_inv_fk ON public.admin_permissions_role_links USING btree (permission_order);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);


--
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);


--
-- Name: admin_users_roles_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_order_fk ON public.admin_users_roles_links USING btree (role_order);


--
-- Name: admin_users_roles_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_order_inv_fk ON public.admin_users_roles_links USING btree (user_order);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: audience_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX audience_created_by_id_fk ON public.audience USING btree (created_by_id);


--
-- Name: audience_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX audience_updated_by_id_fk ON public.audience USING btree (updated_by_id);


--
-- Name: components_page_components_cards_component_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_page_components_cards_component_type_index ON public.components_page_components_cards_components USING btree (component_type);


--
-- Name: components_page_components_cards_entity_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_page_components_cards_entity_fk ON public.components_page_components_cards_components USING btree (entity_id);


--
-- Name: components_page_components_cards_field_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_page_components_cards_field_index ON public.components_page_components_cards_components USING btree (field);


--
-- Name: components_page_components_pages_component_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_page_components_pages_component_type_index ON public.components_page_components_pages_components USING btree (component_type);


--
-- Name: components_page_components_pages_entity_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_page_components_pages_entity_fk ON public.components_page_components_pages_components USING btree (entity_id);


--
-- Name: components_page_components_pages_field_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_page_components_pages_field_index ON public.components_page_components_pages_components USING btree (field);


--
-- Name: components_page_components_servers_sliders_servers_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_page_components_servers_sliders_servers_links_fk ON public.components_page_components_servers_sliders_servers_links USING btree (servers_slider_id);


--
-- Name: components_page_components_servers_sliders_servers_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_page_components_servers_sliders_servers_links_inv_fk ON public.components_page_components_servers_sliders_servers_links USING btree (server_id);


--
-- Name: components_page_components_servers_sliders_servers_links_order_; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_page_components_servers_sliders_servers_links_order_ ON public.components_page_components_servers_sliders_servers_links USING btree (server_order);


--
-- Name: components_utils_components_block_settings_component_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_utils_components_block_settings_component_type_index ON public.components_utils_components_block_settings_components USING btree (component_type);


--
-- Name: components_utils_components_block_settings_entity_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_utils_components_block_settings_entity_fk ON public.components_utils_components_block_settings_components USING btree (entity_id);


--
-- Name: components_utils_components_block_settings_field_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_utils_components_block_settings_field_index ON public.components_utils_components_block_settings_components USING btree (field);


--
-- Name: components_utils_components_block_settings_form_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_utils_components_block_settings_form_links_fk ON public.components_utils_components_block_settings_form_links USING btree (block_settings_id);


--
-- Name: components_utils_components_block_settings_form_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_utils_components_block_settings_form_links_inv_fk ON public.components_utils_components_block_settings_form_links USING btree (form_id);


--
-- Name: components_utils_components_page_links_product_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_utils_components_page_links_product_links_fk ON public.components_utils_components_page_links_product_links USING btree (page_link_id);


--
-- Name: components_utils_components_page_links_product_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX components_utils_components_page_links_product_links_inv_fk ON public.components_utils_components_page_links_product_links USING btree (product_id);


--
-- Name: events_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX events_created_by_id_fk ON public.events USING btree (created_by_id);


--
-- Name: events_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX events_localizations_links_fk ON public.events_localizations_links USING btree (event_id);


--
-- Name: events_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX events_localizations_links_inv_fk ON public.events_localizations_links USING btree (inv_event_id);


--
-- Name: events_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX events_localizations_links_order_fk ON public.events_localizations_links USING btree (event_order);


--
-- Name: events_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX events_updated_by_id_fk ON public.events USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_folder_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_fk ON public.files_folder_links USING btree (file_id);


--
-- Name: files_folder_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_inv_fk ON public.files_folder_links USING btree (folder_id);


--
-- Name: files_folder_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_order_inv_fk ON public.files_folder_links USING btree (file_order);


--
-- Name: files_related_morphs_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);


--
-- Name: files_related_morphs_id_column_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_id_column_index ON public.files_related_morphs USING btree (related_id);


--
-- Name: files_related_morphs_order_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_order_index ON public.files_related_morphs USING btree ("order");


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: form_fields_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX form_fields_created_by_id_fk ON public.form_fields USING btree (created_by_id);


--
-- Name: form_fields_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX form_fields_localizations_links_fk ON public.form_fields_localizations_links USING btree (form_field_id);


--
-- Name: form_fields_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX form_fields_localizations_links_inv_fk ON public.form_fields_localizations_links USING btree (inv_form_field_id);


--
-- Name: form_fields_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX form_fields_localizations_links_order_fk ON public.form_fields_localizations_links USING btree (form_field_order);


--
-- Name: form_fields_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX form_fields_updated_by_id_fk ON public.form_fields USING btree (updated_by_id);


--
-- Name: forms_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_created_by_id_fk ON public.forms USING btree (created_by_id);


--
-- Name: forms_form_fields_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_form_fields_links_fk ON public.forms_form_fields_links USING btree (form_id);


--
-- Name: forms_form_fields_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_form_fields_links_inv_fk ON public.forms_form_fields_links USING btree (form_field_id);


--
-- Name: forms_form_fields_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_form_fields_links_order_fk ON public.forms_form_fields_links USING btree (form_field_order);


--
-- Name: forms_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_localizations_links_fk ON public.forms_localizations_links USING btree (form_id);


--
-- Name: forms_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_localizations_links_inv_fk ON public.forms_localizations_links USING btree (inv_form_id);


--
-- Name: forms_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_localizations_links_order_fk ON public.forms_localizations_links USING btree (form_order);


--
-- Name: forms_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_updated_by_id_fk ON public.forms USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: menu_items_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menu_items_created_by_id_fk ON public.menu_items USING btree (created_by_id);


--
-- Name: menu_items_parent_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menu_items_parent_links_fk ON public.menu_items_parent_links USING btree (menu_item_id);


--
-- Name: menu_items_parent_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menu_items_parent_links_inv_fk ON public.menu_items_parent_links USING btree (inv_menu_item_id);


--
-- Name: menu_items_root_menu_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menu_items_root_menu_links_fk ON public.menu_items_root_menu_links USING btree (menu_item_id);


--
-- Name: menu_items_root_menu_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menu_items_root_menu_links_inv_fk ON public.menu_items_root_menu_links USING btree (menu_id);


--
-- Name: menu_items_root_menu_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menu_items_root_menu_links_order_inv_fk ON public.menu_items_root_menu_links USING btree (menu_item_order);


--
-- Name: menu_items_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menu_items_updated_by_id_fk ON public.menu_items USING btree (updated_by_id);


--
-- Name: menus_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menus_created_by_id_fk ON public.menus USING btree (created_by_id);


--
-- Name: menus_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menus_updated_by_id_fk ON public.menus USING btree (updated_by_id);


--
-- Name: navigations_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_created_by_id_fk ON public.navigations USING btree (created_by_id);


--
-- Name: navigations_items_audience_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_items_audience_links_fk ON public.navigations_items_audience_links USING btree (navigation_item_id);


--
-- Name: navigations_items_audience_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_items_audience_links_inv_fk ON public.navigations_items_audience_links USING btree (audience_id);


--
-- Name: navigations_items_audience_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_items_audience_links_order_fk ON public.navigations_items_audience_links USING btree (audience_order);


--
-- Name: navigations_items_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_items_created_by_id_fk ON public.navigations_items USING btree (created_by_id);


--
-- Name: navigations_items_master_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_items_master_links_fk ON public.navigations_items_master_links USING btree (navigation_item_id);


--
-- Name: navigations_items_master_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_items_master_links_inv_fk ON public.navigations_items_master_links USING btree (navigation_id);


--
-- Name: navigations_items_master_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_items_master_links_order_inv_fk ON public.navigations_items_master_links USING btree (navigation_item_order);


--
-- Name: navigations_items_parent_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_items_parent_links_fk ON public.navigations_items_parent_links USING btree (navigation_item_id);


--
-- Name: navigations_items_parent_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_items_parent_links_inv_fk ON public.navigations_items_parent_links USING btree (inv_navigation_item_id);


--
-- Name: navigations_items_related_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_items_related_created_by_id_fk ON public.navigations_items_related USING btree (created_by_id);


--
-- Name: navigations_items_related_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_items_related_links_fk ON public.navigations_items_related_links USING btree (navigation_item_id);


--
-- Name: navigations_items_related_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_items_related_links_inv_fk ON public.navigations_items_related_links USING btree (navigations_items_related_id);


--
-- Name: navigations_items_related_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_items_related_updated_by_id_fk ON public.navigations_items_related USING btree (updated_by_id);


--
-- Name: navigations_items_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_items_updated_by_id_fk ON public.navigations_items USING btree (updated_by_id);


--
-- Name: navigations_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_localizations_links_fk ON public.navigations_localizations_links USING btree (navigation_id);


--
-- Name: navigations_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_localizations_links_inv_fk ON public.navigations_localizations_links USING btree (inv_navigation_id);


--
-- Name: navigations_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_localizations_links_order_fk ON public.navigations_localizations_links USING btree (navigation_order);


--
-- Name: navigations_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX navigations_updated_by_id_fk ON public.navigations USING btree (updated_by_id);


--
-- Name: news_tags_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX news_tags_created_by_id_fk ON public.news_tags USING btree (created_by_id);


--
-- Name: news_tags_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX news_tags_localizations_links_fk ON public.news_tags_localizations_links USING btree (news_tag_id);


--
-- Name: news_tags_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX news_tags_localizations_links_inv_fk ON public.news_tags_localizations_links USING btree (inv_news_tag_id);


--
-- Name: news_tags_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX news_tags_localizations_links_order_fk ON public.news_tags_localizations_links USING btree (news_tag_order);


--
-- Name: news_tags_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX news_tags_updated_by_id_fk ON public.news_tags USING btree (updated_by_id);


--
-- Name: newsletters_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsletters_created_by_id_fk ON public.newsletters USING btree (created_by_id);


--
-- Name: newsletters_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsletters_localizations_links_fk ON public.newsletters_localizations_links USING btree (newsletter_id);


--
-- Name: newsletters_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsletters_localizations_links_inv_fk ON public.newsletters_localizations_links USING btree (inv_newsletter_id);


--
-- Name: newsletters_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsletters_localizations_links_order_fk ON public.newsletters_localizations_links USING btree (newsletter_order);


--
-- Name: newsletters_news_tags_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsletters_news_tags_links_fk ON public.newsletters_news_tags_links USING btree (newsletter_id);


--
-- Name: newsletters_news_tags_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsletters_news_tags_links_inv_fk ON public.newsletters_news_tags_links USING btree (news_tag_id);


--
-- Name: newsletters_news_tags_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsletters_news_tags_links_order_fk ON public.newsletters_news_tags_links USING btree (news_tag_order);


--
-- Name: newsletters_news_tags_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsletters_news_tags_links_order_inv_fk ON public.newsletters_news_tags_links USING btree (newsletter_order);


--
-- Name: newsletters_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsletters_updated_by_id_fk ON public.newsletters USING btree (updated_by_id);


--
-- Name: pages_component_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_component_type_index ON public.pages_components USING btree (component_type);


--
-- Name: pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_created_by_id_fk ON public.pages USING btree (created_by_id);


--
-- Name: pages_entity_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_entity_fk ON public.pages_components USING btree (entity_id);


--
-- Name: pages_field_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_field_index ON public.pages_components USING btree (field);


--
-- Name: pages_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_localizations_links_fk ON public.pages_localizations_links USING btree (page_id);


--
-- Name: pages_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_localizations_links_inv_fk ON public.pages_localizations_links USING btree (inv_page_id);


--
-- Name: pages_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_localizations_links_order_fk ON public.pages_localizations_links USING btree (page_order);


--
-- Name: pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_updated_by_id_fk ON public.pages USING btree (updated_by_id);


--
-- Name: partners_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_created_by_id_fk ON public.partners USING btree (created_by_id);


--
-- Name: partners_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_localizations_links_fk ON public.partners_localizations_links USING btree (partner_id);


--
-- Name: partners_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_localizations_links_inv_fk ON public.partners_localizations_links USING btree (inv_partner_id);


--
-- Name: partners_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_localizations_links_order_fk ON public.partners_localizations_links USING btree (partner_order);


--
-- Name: partners_partners_type_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_partners_type_links_fk ON public.partners_partners_type_links USING btree (partner_id);


--
-- Name: partners_partners_type_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_partners_type_links_inv_fk ON public.partners_partners_type_links USING btree (partners_type_id);


--
-- Name: partners_partners_type_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_partners_type_links_order_inv_fk ON public.partners_partners_type_links USING btree (partner_order);


--
-- Name: partners_types_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_types_created_by_id_fk ON public.partners_types USING btree (created_by_id);


--
-- Name: partners_types_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_types_localizations_links_fk ON public.partners_types_localizations_links USING btree (partners_type_id);


--
-- Name: partners_types_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_types_localizations_links_inv_fk ON public.partners_types_localizations_links USING btree (inv_partners_type_id);


--
-- Name: partners_types_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_types_localizations_links_order_fk ON public.partners_types_localizations_links USING btree (partners_type_order);


--
-- Name: partners_types_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_types_updated_by_id_fk ON public.partners_types USING btree (updated_by_id);


--
-- Name: partners_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_updated_by_id_fk ON public.partners USING btree (updated_by_id);


--
-- Name: privacy_policies_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX privacy_policies_created_by_id_fk ON public.privacy_policies USING btree (created_by_id);


--
-- Name: privacy_policies_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX privacy_policies_localizations_links_fk ON public.privacy_policies_localizations_links USING btree (privacy_policy_id);


--
-- Name: privacy_policies_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX privacy_policies_localizations_links_inv_fk ON public.privacy_policies_localizations_links USING btree (inv_privacy_policy_id);


--
-- Name: privacy_policies_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX privacy_policies_localizations_links_order_fk ON public.privacy_policies_localizations_links USING btree (privacy_policy_order);


--
-- Name: privacy_policies_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX privacy_policies_updated_by_id_fk ON public.privacy_policies USING btree (updated_by_id);


--
-- Name: products_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_created_by_id_fk ON public.products USING btree (created_by_id);


--
-- Name: products_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_localizations_links_fk ON public.products_localizations_links USING btree (product_id);


--
-- Name: products_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_localizations_links_inv_fk ON public.products_localizations_links USING btree (inv_product_id);


--
-- Name: products_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_localizations_links_order_fk ON public.products_localizations_links USING btree (product_order);


--
-- Name: products_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_updated_by_id_fk ON public.products USING btree (updated_by_id);


--
-- Name: server_processors_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_processors_created_by_id_fk ON public.server_processors USING btree (created_by_id);


--
-- Name: server_processors_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_processors_updated_by_id_fk ON public.server_processors USING btree (updated_by_id);


--
-- Name: server_series_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_series_created_by_id_fk ON public.server_series USING btree (created_by_id);


--
-- Name: server_series_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_series_updated_by_id_fk ON public.server_series USING btree (updated_by_id);


--
-- Name: server_sizes_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_sizes_created_by_id_fk ON public.server_sizes USING btree (created_by_id);


--
-- Name: server_sizes_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_sizes_updated_by_id_fk ON public.server_sizes USING btree (updated_by_id);


--
-- Name: server_types_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_types_created_by_id_fk ON public.server_types USING btree (created_by_id);


--
-- Name: server_types_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_types_localizations_links_fk ON public.server_types_localizations_links USING btree (server_type_id);


--
-- Name: server_types_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_types_localizations_links_inv_fk ON public.server_types_localizations_links USING btree (inv_server_type_id);


--
-- Name: server_types_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_types_localizations_links_order_fk ON public.server_types_localizations_links USING btree (server_type_order);


--
-- Name: server_types_server_processors_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_types_server_processors_links_fk ON public.server_types_server_processors_links USING btree (server_type_id);


--
-- Name: server_types_server_processors_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_types_server_processors_links_inv_fk ON public.server_types_server_processors_links USING btree (server_processor_id);


--
-- Name: server_types_server_processors_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_types_server_processors_links_order_fk ON public.server_types_server_processors_links USING btree (server_processor_order);


--
-- Name: server_types_server_processors_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_types_server_processors_links_order_inv_fk ON public.server_types_server_processors_links USING btree (server_type_order);


--
-- Name: server_types_server_series_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_types_server_series_links_fk ON public.server_types_server_series_links USING btree (server_type_id);


--
-- Name: server_types_server_series_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_types_server_series_links_inv_fk ON public.server_types_server_series_links USING btree (server_serieses_id);


--
-- Name: server_types_server_series_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_types_server_series_links_order_fk ON public.server_types_server_series_links USING btree (server_serieses_order);


--
-- Name: server_types_server_series_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_types_server_series_links_order_inv_fk ON public.server_types_server_series_links USING btree (server_type_order);


--
-- Name: server_types_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX server_types_updated_by_id_fk ON public.server_types USING btree (updated_by_id);


--
-- Name: servers_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX servers_created_by_id_fk ON public.servers USING btree (created_by_id);


--
-- Name: servers_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX servers_localizations_links_fk ON public.servers_localizations_links USING btree (server_id);


--
-- Name: servers_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX servers_localizations_links_inv_fk ON public.servers_localizations_links USING btree (inv_server_id);


--
-- Name: servers_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX servers_localizations_links_order_fk ON public.servers_localizations_links USING btree (server_order);


--
-- Name: servers_server_processor_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX servers_server_processor_links_fk ON public.servers_server_processor_links USING btree (server_id);


--
-- Name: servers_server_processor_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX servers_server_processor_links_inv_fk ON public.servers_server_processor_links USING btree (server_processor_id);


--
-- Name: servers_server_processor_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX servers_server_processor_links_order_inv_fk ON public.servers_server_processor_links USING btree (server_order);


--
-- Name: servers_server_series_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX servers_server_series_links_fk ON public.servers_server_series_links USING btree (server_id);


--
-- Name: servers_server_series_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX servers_server_series_links_inv_fk ON public.servers_server_series_links USING btree (server_serieses_id);


--
-- Name: servers_server_series_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX servers_server_series_links_order_inv_fk ON public.servers_server_series_links USING btree (server_order);


--
-- Name: servers_server_size_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX servers_server_size_links_fk ON public.servers_server_size_links USING btree (server_id);


--
-- Name: servers_server_size_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX servers_server_size_links_inv_fk ON public.servers_server_size_links USING btree (server_size_id);


--
-- Name: servers_server_size_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX servers_server_size_links_order_inv_fk ON public.servers_server_size_links USING btree (server_order);


--
-- Name: servers_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX servers_updated_by_id_fk ON public.servers USING btree (updated_by_id);


--
-- Name: site_contacts_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_contacts_created_by_id_fk ON public.site_contacts USING btree (created_by_id);


--
-- Name: site_contacts_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_contacts_localizations_links_fk ON public.site_contacts_localizations_links USING btree (site_contact_id);


--
-- Name: site_contacts_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_contacts_localizations_links_inv_fk ON public.site_contacts_localizations_links USING btree (inv_site_contact_id);


--
-- Name: site_contacts_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_contacts_localizations_links_order_fk ON public.site_contacts_localizations_links USING btree (site_contact_order);


--
-- Name: site_contacts_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_contacts_updated_by_id_fk ON public.site_contacts USING btree (updated_by_id);


--
-- Name: site_settings_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_settings_created_by_id_fk ON public.site_settings USING btree (created_by_id);


--
-- Name: site_settings_footer_form_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_settings_footer_form_links_fk ON public.site_settings_footer_form_links USING btree (site_setting_id);


--
-- Name: site_settings_footer_form_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_settings_footer_form_links_inv_fk ON public.site_settings_footer_form_links USING btree (form_id);


--
-- Name: site_settings_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_settings_updated_by_id_fk ON public.site_settings USING btree (updated_by_id);


--
-- Name: slugs_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX slugs_created_by_id_fk ON public.slugs USING btree (created_by_id);


--
-- Name: slugs_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX slugs_updated_by_id_fk ON public.slugs USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_order_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_order);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- Name: strapi_transfer_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_links_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_id);


--
-- Name: strapi_transfer_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_links_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_id);


--
-- Name: strapi_transfer_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_links_order_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_order);


--
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- Name: tests_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tests_created_by_id_fk ON public.tests USING btree (created_by_id);


--
-- Name: tests_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tests_localizations_links_fk ON public.tests_localizations_links USING btree (test_id);


--
-- Name: tests_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tests_localizations_links_inv_fk ON public.tests_localizations_links USING btree (inv_test_id);


--
-- Name: tests_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tests_localizations_links_order_fk ON public.tests_localizations_links USING btree (test_order);


--
-- Name: tests_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tests_updated_by_id_fk ON public.tests USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);


--
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);


--
-- Name: up_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_order_inv_fk ON public.up_permissions_role_links USING btree (permission_order);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);


--
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);


--
-- Name: up_users_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_order_inv_fk ON public.up_users_role_links USING btree (user_order);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_parent_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_fk ON public.upload_folders_parent_links USING btree (folder_id);


--
-- Name: upload_folders_parent_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_inv_fk ON public.upload_folders_parent_links USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_order_inv_fk ON public.upload_folders_parent_links USING btree (folder_order);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: addresses addresses_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: addresses_localizations_links addresses_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses_localizations_links
    ADD CONSTRAINT addresses_localizations_links_fk FOREIGN KEY (address_id) REFERENCES public.addresses(id) ON DELETE CASCADE;


--
-- Name: addresses_localizations_links addresses_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses_localizations_links
    ADD CONSTRAINT addresses_localizations_links_inv_fk FOREIGN KEY (inv_address_id) REFERENCES public.addresses(id) ON DELETE CASCADE;


--
-- Name: addresses addresses_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: audience audience_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audience
    ADD CONSTRAINT audience_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: audience audience_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audience
    ADD CONSTRAINT audience_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: components_page_components_cards_components components_page_components_cards_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_cards_components
    ADD CONSTRAINT components_page_components_cards_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_page_components_cards(id) ON DELETE CASCADE;


--
-- Name: components_page_components_pages_components components_page_components_pages_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_pages_components
    ADD CONSTRAINT components_page_components_pages_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_page_components_pages(id) ON DELETE CASCADE;


--
-- Name: components_page_components_servers_sliders_servers_links components_page_components_servers_sliders_servers_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_servers_sliders_servers_links
    ADD CONSTRAINT components_page_components_servers_sliders_servers_links_fk FOREIGN KEY (servers_slider_id) REFERENCES public.components_page_components_servers_sliders(id) ON DELETE CASCADE;


--
-- Name: components_page_components_servers_sliders_servers_links components_page_components_servers_sliders_servers_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_page_components_servers_sliders_servers_links
    ADD CONSTRAINT components_page_components_servers_sliders_servers_links_inv_fk FOREIGN KEY (server_id) REFERENCES public.servers(id) ON DELETE CASCADE;


--
-- Name: components_utils_components_block_settings_components components_utils_components_block_settings_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_block_settings_components
    ADD CONSTRAINT components_utils_components_block_settings_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_utils_components_block_settings(id) ON DELETE CASCADE;


--
-- Name: components_utils_components_block_settings_form_links components_utils_components_block_settings_form_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_block_settings_form_links
    ADD CONSTRAINT components_utils_components_block_settings_form_links_fk FOREIGN KEY (block_settings_id) REFERENCES public.components_utils_components_block_settings(id) ON DELETE CASCADE;


--
-- Name: components_utils_components_block_settings_form_links components_utils_components_block_settings_form_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_block_settings_form_links
    ADD CONSTRAINT components_utils_components_block_settings_form_links_inv_fk FOREIGN KEY (form_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: components_utils_components_page_links_product_links components_utils_components_page_links_product_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_page_links_product_links
    ADD CONSTRAINT components_utils_components_page_links_product_links_fk FOREIGN KEY (page_link_id) REFERENCES public.components_utils_components_page_links(id) ON DELETE CASCADE;


--
-- Name: components_utils_components_page_links_product_links components_utils_components_page_links_product_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components_utils_components_page_links_product_links
    ADD CONSTRAINT components_utils_components_page_links_product_links_inv_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: events events_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: events_localizations_links events_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_localizations_links
    ADD CONSTRAINT events_localizations_links_fk FOREIGN KEY (event_id) REFERENCES public.events(id) ON DELETE CASCADE;


--
-- Name: events_localizations_links events_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_localizations_links
    ADD CONSTRAINT events_localizations_links_inv_fk FOREIGN KEY (inv_event_id) REFERENCES public.events(id) ON DELETE CASCADE;


--
-- Name: events events_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_links files_folder_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_links files_folder_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_inv_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: form_fields form_fields_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_fields
    ADD CONSTRAINT form_fields_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: form_fields_localizations_links form_fields_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_fields_localizations_links
    ADD CONSTRAINT form_fields_localizations_links_fk FOREIGN KEY (form_field_id) REFERENCES public.form_fields(id) ON DELETE CASCADE;


--
-- Name: form_fields_localizations_links form_fields_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_fields_localizations_links
    ADD CONSTRAINT form_fields_localizations_links_inv_fk FOREIGN KEY (inv_form_field_id) REFERENCES public.form_fields(id) ON DELETE CASCADE;


--
-- Name: form_fields form_fields_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_fields
    ADD CONSTRAINT form_fields_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: forms forms_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: forms_form_fields_links forms_form_fields_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_form_fields_links
    ADD CONSTRAINT forms_form_fields_links_fk FOREIGN KEY (form_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_form_fields_links forms_form_fields_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_form_fields_links
    ADD CONSTRAINT forms_form_fields_links_inv_fk FOREIGN KEY (form_field_id) REFERENCES public.form_fields(id) ON DELETE CASCADE;


--
-- Name: forms_localizations_links forms_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_localizations_links
    ADD CONSTRAINT forms_localizations_links_fk FOREIGN KEY (form_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_localizations_links forms_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_localizations_links
    ADD CONSTRAINT forms_localizations_links_inv_fk FOREIGN KEY (inv_form_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms forms_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: menu_items menu_items_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: menu_items_parent_links menu_items_parent_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_parent_links
    ADD CONSTRAINT menu_items_parent_links_fk FOREIGN KEY (menu_item_id) REFERENCES public.menu_items(id) ON DELETE CASCADE;


--
-- Name: menu_items_parent_links menu_items_parent_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_parent_links
    ADD CONSTRAINT menu_items_parent_links_inv_fk FOREIGN KEY (inv_menu_item_id) REFERENCES public.menu_items(id) ON DELETE CASCADE;


--
-- Name: menu_items_root_menu_links menu_items_root_menu_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_root_menu_links
    ADD CONSTRAINT menu_items_root_menu_links_fk FOREIGN KEY (menu_item_id) REFERENCES public.menu_items(id) ON DELETE CASCADE;


--
-- Name: menu_items_root_menu_links menu_items_root_menu_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items_root_menu_links
    ADD CONSTRAINT menu_items_root_menu_links_inv_fk FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- Name: menu_items menu_items_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: menus menus_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: menus menus_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: navigations navigations_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations
    ADD CONSTRAINT navigations_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: navigations_items_audience_links navigations_items_audience_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_audience_links
    ADD CONSTRAINT navigations_items_audience_links_fk FOREIGN KEY (navigation_item_id) REFERENCES public.navigations_items(id) ON DELETE CASCADE;


--
-- Name: navigations_items_audience_links navigations_items_audience_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_audience_links
    ADD CONSTRAINT navigations_items_audience_links_inv_fk FOREIGN KEY (audience_id) REFERENCES public.audience(id) ON DELETE CASCADE;


--
-- Name: navigations_items navigations_items_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items
    ADD CONSTRAINT navigations_items_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: navigations_items_master_links navigations_items_master_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_master_links
    ADD CONSTRAINT navigations_items_master_links_fk FOREIGN KEY (navigation_item_id) REFERENCES public.navigations_items(id) ON DELETE CASCADE;


--
-- Name: navigations_items_master_links navigations_items_master_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_master_links
    ADD CONSTRAINT navigations_items_master_links_inv_fk FOREIGN KEY (navigation_id) REFERENCES public.navigations(id) ON DELETE CASCADE;


--
-- Name: navigations_items_parent_links navigations_items_parent_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_parent_links
    ADD CONSTRAINT navigations_items_parent_links_fk FOREIGN KEY (navigation_item_id) REFERENCES public.navigations_items(id) ON DELETE CASCADE;


--
-- Name: navigations_items_parent_links navigations_items_parent_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_parent_links
    ADD CONSTRAINT navigations_items_parent_links_inv_fk FOREIGN KEY (inv_navigation_item_id) REFERENCES public.navigations_items(id) ON DELETE CASCADE;


--
-- Name: navigations_items_related navigations_items_related_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_related
    ADD CONSTRAINT navigations_items_related_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: navigations_items_related_links navigations_items_related_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_related_links
    ADD CONSTRAINT navigations_items_related_links_fk FOREIGN KEY (navigation_item_id) REFERENCES public.navigations_items(id) ON DELETE CASCADE;


--
-- Name: navigations_items_related_links navigations_items_related_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_related_links
    ADD CONSTRAINT navigations_items_related_links_inv_fk FOREIGN KEY (navigations_items_related_id) REFERENCES public.navigations_items_related(id) ON DELETE CASCADE;


--
-- Name: navigations_items_related navigations_items_related_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items_related
    ADD CONSTRAINT navigations_items_related_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: navigations_items navigations_items_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_items
    ADD CONSTRAINT navigations_items_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: navigations_localizations_links navigations_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_localizations_links
    ADD CONSTRAINT navigations_localizations_links_fk FOREIGN KEY (navigation_id) REFERENCES public.navigations(id) ON DELETE CASCADE;


--
-- Name: navigations_localizations_links navigations_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_localizations_links
    ADD CONSTRAINT navigations_localizations_links_inv_fk FOREIGN KEY (inv_navigation_id) REFERENCES public.navigations(id) ON DELETE CASCADE;


--
-- Name: navigations navigations_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations
    ADD CONSTRAINT navigations_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: news_tags news_tags_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_tags
    ADD CONSTRAINT news_tags_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: news_tags_localizations_links news_tags_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_tags_localizations_links
    ADD CONSTRAINT news_tags_localizations_links_fk FOREIGN KEY (news_tag_id) REFERENCES public.news_tags(id) ON DELETE CASCADE;


--
-- Name: news_tags_localizations_links news_tags_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_tags_localizations_links
    ADD CONSTRAINT news_tags_localizations_links_inv_fk FOREIGN KEY (inv_news_tag_id) REFERENCES public.news_tags(id) ON DELETE CASCADE;


--
-- Name: news_tags news_tags_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_tags
    ADD CONSTRAINT news_tags_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: newsletters newsletters_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletters
    ADD CONSTRAINT newsletters_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: newsletters_localizations_links newsletters_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletters_localizations_links
    ADD CONSTRAINT newsletters_localizations_links_fk FOREIGN KEY (newsletter_id) REFERENCES public.newsletters(id) ON DELETE CASCADE;


--
-- Name: newsletters_localizations_links newsletters_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletters_localizations_links
    ADD CONSTRAINT newsletters_localizations_links_inv_fk FOREIGN KEY (inv_newsletter_id) REFERENCES public.newsletters(id) ON DELETE CASCADE;


--
-- Name: newsletters_news_tags_links newsletters_news_tags_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletters_news_tags_links
    ADD CONSTRAINT newsletters_news_tags_links_fk FOREIGN KEY (newsletter_id) REFERENCES public.newsletters(id) ON DELETE CASCADE;


--
-- Name: newsletters_news_tags_links newsletters_news_tags_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletters_news_tags_links
    ADD CONSTRAINT newsletters_news_tags_links_inv_fk FOREIGN KEY (news_tag_id) REFERENCES public.news_tags(id) ON DELETE CASCADE;


--
-- Name: newsletters newsletters_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsletters
    ADD CONSTRAINT newsletters_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: pages pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: pages_components pages_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_components
    ADD CONSTRAINT pages_entity_fk FOREIGN KEY (entity_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_localizations_links pages_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_localizations_links
    ADD CONSTRAINT pages_localizations_links_fk FOREIGN KEY (page_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_localizations_links pages_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_localizations_links
    ADD CONSTRAINT pages_localizations_links_inv_fk FOREIGN KEY (inv_page_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: partners partners_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: partners_localizations_links partners_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_localizations_links
    ADD CONSTRAINT partners_localizations_links_fk FOREIGN KEY (partner_id) REFERENCES public.partners(id) ON DELETE CASCADE;


--
-- Name: partners_localizations_links partners_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_localizations_links
    ADD CONSTRAINT partners_localizations_links_inv_fk FOREIGN KEY (inv_partner_id) REFERENCES public.partners(id) ON DELETE CASCADE;


--
-- Name: partners_partners_type_links partners_partners_type_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_partners_type_links
    ADD CONSTRAINT partners_partners_type_links_fk FOREIGN KEY (partner_id) REFERENCES public.partners(id) ON DELETE CASCADE;


--
-- Name: partners_partners_type_links partners_partners_type_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_partners_type_links
    ADD CONSTRAINT partners_partners_type_links_inv_fk FOREIGN KEY (partners_type_id) REFERENCES public.partners_types(id) ON DELETE CASCADE;


--
-- Name: partners_types partners_types_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_types
    ADD CONSTRAINT partners_types_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: partners_types_localizations_links partners_types_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_types_localizations_links
    ADD CONSTRAINT partners_types_localizations_links_fk FOREIGN KEY (partners_type_id) REFERENCES public.partners_types(id) ON DELETE CASCADE;


--
-- Name: partners_types_localizations_links partners_types_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_types_localizations_links
    ADD CONSTRAINT partners_types_localizations_links_inv_fk FOREIGN KEY (inv_partners_type_id) REFERENCES public.partners_types(id) ON DELETE CASCADE;


--
-- Name: partners_types partners_types_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_types
    ADD CONSTRAINT partners_types_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: partners partners_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: privacy_policies privacy_policies_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privacy_policies
    ADD CONSTRAINT privacy_policies_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: privacy_policies_localizations_links privacy_policies_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privacy_policies_localizations_links
    ADD CONSTRAINT privacy_policies_localizations_links_fk FOREIGN KEY (privacy_policy_id) REFERENCES public.privacy_policies(id) ON DELETE CASCADE;


--
-- Name: privacy_policies_localizations_links privacy_policies_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privacy_policies_localizations_links
    ADD CONSTRAINT privacy_policies_localizations_links_inv_fk FOREIGN KEY (inv_privacy_policy_id) REFERENCES public.privacy_policies(id) ON DELETE CASCADE;


--
-- Name: privacy_policies privacy_policies_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privacy_policies
    ADD CONSTRAINT privacy_policies_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: products products_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: products_localizations_links products_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_localizations_links
    ADD CONSTRAINT products_localizations_links_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_localizations_links products_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_localizations_links
    ADD CONSTRAINT products_localizations_links_inv_fk FOREIGN KEY (inv_product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products products_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: server_processors server_processors_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_processors
    ADD CONSTRAINT server_processors_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: server_processors server_processors_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_processors
    ADD CONSTRAINT server_processors_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: server_series server_series_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_series
    ADD CONSTRAINT server_series_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: server_series server_series_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_series
    ADD CONSTRAINT server_series_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: server_sizes server_sizes_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_sizes
    ADD CONSTRAINT server_sizes_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: server_sizes server_sizes_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_sizes
    ADD CONSTRAINT server_sizes_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: server_types server_types_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types
    ADD CONSTRAINT server_types_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: server_types_localizations_links server_types_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types_localizations_links
    ADD CONSTRAINT server_types_localizations_links_fk FOREIGN KEY (server_type_id) REFERENCES public.server_types(id) ON DELETE CASCADE;


--
-- Name: server_types_localizations_links server_types_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types_localizations_links
    ADD CONSTRAINT server_types_localizations_links_inv_fk FOREIGN KEY (inv_server_type_id) REFERENCES public.server_types(id) ON DELETE CASCADE;


--
-- Name: server_types_server_processors_links server_types_server_processors_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types_server_processors_links
    ADD CONSTRAINT server_types_server_processors_links_fk FOREIGN KEY (server_type_id) REFERENCES public.server_types(id) ON DELETE CASCADE;


--
-- Name: server_types_server_processors_links server_types_server_processors_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types_server_processors_links
    ADD CONSTRAINT server_types_server_processors_links_inv_fk FOREIGN KEY (server_processor_id) REFERENCES public.server_processors(id) ON DELETE CASCADE;


--
-- Name: server_types_server_series_links server_types_server_series_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types_server_series_links
    ADD CONSTRAINT server_types_server_series_links_fk FOREIGN KEY (server_type_id) REFERENCES public.server_types(id) ON DELETE CASCADE;


--
-- Name: server_types_server_series_links server_types_server_series_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types_server_series_links
    ADD CONSTRAINT server_types_server_series_links_inv_fk FOREIGN KEY (server_serieses_id) REFERENCES public.server_series(id) ON DELETE CASCADE;


--
-- Name: server_types server_types_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.server_types
    ADD CONSTRAINT server_types_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: servers servers_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: servers_localizations_links servers_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_localizations_links
    ADD CONSTRAINT servers_localizations_links_fk FOREIGN KEY (server_id) REFERENCES public.servers(id) ON DELETE CASCADE;


--
-- Name: servers_localizations_links servers_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_localizations_links
    ADD CONSTRAINT servers_localizations_links_inv_fk FOREIGN KEY (inv_server_id) REFERENCES public.servers(id) ON DELETE CASCADE;


--
-- Name: servers_server_processor_links servers_server_processor_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_server_processor_links
    ADD CONSTRAINT servers_server_processor_links_fk FOREIGN KEY (server_id) REFERENCES public.servers(id) ON DELETE CASCADE;


--
-- Name: servers_server_processor_links servers_server_processor_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_server_processor_links
    ADD CONSTRAINT servers_server_processor_links_inv_fk FOREIGN KEY (server_processor_id) REFERENCES public.server_processors(id) ON DELETE CASCADE;


--
-- Name: servers_server_series_links servers_server_series_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_server_series_links
    ADD CONSTRAINT servers_server_series_links_fk FOREIGN KEY (server_id) REFERENCES public.servers(id) ON DELETE CASCADE;


--
-- Name: servers_server_series_links servers_server_series_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_server_series_links
    ADD CONSTRAINT servers_server_series_links_inv_fk FOREIGN KEY (server_serieses_id) REFERENCES public.server_series(id) ON DELETE CASCADE;


--
-- Name: servers_server_size_links servers_server_size_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_server_size_links
    ADD CONSTRAINT servers_server_size_links_fk FOREIGN KEY (server_id) REFERENCES public.servers(id) ON DELETE CASCADE;


--
-- Name: servers_server_size_links servers_server_size_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers_server_size_links
    ADD CONSTRAINT servers_server_size_links_inv_fk FOREIGN KEY (server_size_id) REFERENCES public.server_sizes(id) ON DELETE CASCADE;


--
-- Name: servers servers_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: site_contacts site_contacts_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_contacts
    ADD CONSTRAINT site_contacts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: site_contacts_localizations_links site_contacts_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_contacts_localizations_links
    ADD CONSTRAINT site_contacts_localizations_links_fk FOREIGN KEY (site_contact_id) REFERENCES public.site_contacts(id) ON DELETE CASCADE;


--
-- Name: site_contacts_localizations_links site_contacts_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_contacts_localizations_links
    ADD CONSTRAINT site_contacts_localizations_links_inv_fk FOREIGN KEY (inv_site_contact_id) REFERENCES public.site_contacts(id) ON DELETE CASCADE;


--
-- Name: site_contacts site_contacts_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_contacts
    ADD CONSTRAINT site_contacts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: site_settings site_settings_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: site_settings_footer_form_links site_settings_footer_form_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings_footer_form_links
    ADD CONSTRAINT site_settings_footer_form_links_fk FOREIGN KEY (site_setting_id) REFERENCES public.site_settings(id) ON DELETE CASCADE;


--
-- Name: site_settings_footer_form_links site_settings_footer_form_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings_footer_form_links
    ADD CONSTRAINT site_settings_footer_form_links_inv_fk FOREIGN KEY (form_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: site_settings site_settings_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: slugs slugs_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slugs
    ADD CONSTRAINT slugs_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: slugs slugs_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slugs
    ADD CONSTRAINT slugs_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_inv_fk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_inv_fk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: tests tests_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: tests_localizations_links tests_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests_localizations_links
    ADD CONSTRAINT tests_localizations_links_fk FOREIGN KEY (test_id) REFERENCES public.tests(id) ON DELETE CASCADE;


--
-- Name: tests_localizations_links tests_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests_localizations_links
    ADD CONSTRAINT tests_localizations_links_inv_fk FOREIGN KEY (inv_test_id) REFERENCES public.tests(id) ON DELETE CASCADE;


--
-- Name: tests tests_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_inv_fk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

