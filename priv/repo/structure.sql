--
-- PostgreSQL database dump
--

-- Dumped from database version 11.9
-- Dumped by pg_dump version 11.9

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
-- Name: pgt_ca_products__created_at(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.pgt_ca_products__created_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$        BEGIN
          IF (TG_OP = 'UPDATE') THEN
            NEW."created_at" := OLD."created_at";
          ELSIF (TG_OP = 'INSERT') THEN
            NEW."created_at" := CURRENT_TIMESTAMP;
          END IF;
          RETURN NEW;
        END;
$$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: product_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_types (
    id integer NOT NULL,
    slug text NOT NULL,
    name text,
    CONSTRAINT name_not_null CHECK ((name IS NOT NULL))
);


--
-- Name: product_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.product_types ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id integer NOT NULL,
    url text NOT NULL,
    xpath jsonb NOT NULL,
    name text NOT NULL,
    inner_text text NOT NULL,
    count integer NOT NULL,
    created_at timestamp without time zone,
    product_type_id integer,
    CONSTRAINT name_not_empty CHECK ((name <> ''::text)),
    CONSTRAINT product_type_id_presence CHECK ((product_type_id IS NOT NULL))
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: schema_migrations_sequel; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations_sequel (
    filename text NOT NULL
);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: product_types product_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_types
    ADD CONSTRAINT product_types_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_sequel schema_migrations_sequel_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations_sequel
    ADD CONSTRAINT schema_migrations_sequel_pkey PRIMARY KEY (filename);


--
-- Name: product_types_slug_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX product_types_slug_index ON public.product_types USING btree (slug);


--
-- Name: products_count_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_count_index ON public.products USING btree (count);


--
-- Name: products_created_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_created_at_index ON public.products USING btree (created_at);


--
-- Name: products_name_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_name_index ON public.products USING btree (name);


--
-- Name: products_slug_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_slug_index ON public.products USING btree (name);


--
-- Name: products_url_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_url_index ON public.products USING btree (url);


--
-- Name: products pgt_ca_created_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER pgt_ca_created_at BEFORE INSERT OR UPDATE ON public.products FOR EACH ROW EXECUTE PROCEDURE public.pgt_ca_products__created_at();


--
-- Name: products products_product_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_type_id_fkey FOREIGN KEY (product_type_id) REFERENCES public.product_types(id);


--
-- PostgreSQL database dump complete
--
