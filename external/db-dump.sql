-- SQL Manager Lite for PostgreSQL 6.1.0.53492
-- ---------------------------------------
-- Хост         : localhost
-- База данных  : blog
-- Версия       : PostgreSQL 12.1, compiled by Visual C++ build 1914, 64-bit



SET check_function_bodies = false;
--
-- Structure for table category (OID = 24582) :
--
SET search_path = public, pg_catalog;
CREATE TABLE public.category (
    id integer NOT NULL,
    name varchar(20) NOT NULL,
    url varchar(20) NOT NULL,
    articles integer DEFAULT 0 NOT NULL
)
WITH (oids = false);
ALTER TABLE ONLY public.category ALTER COLUMN name SET STATISTICS 0;
ALTER TABLE ONLY public.category ALTER COLUMN url SET STATISTICS 0;
ALTER TABLE ONLY public.category ALTER COLUMN articles SET STATISTICS 0;
--
-- Structure for table article (OID = 24590) :
--
CREATE TABLE public.article (
    id bigint NOT NULL,
    title varchar(255) NOT NULL,
    url varchar(255) NOT NULL,
    logo varchar(255) NOT NULL,
    desk varchar(255) NOT NULL,
    content text NOT NULL,
    id_category integer NOT NULL,
    created timestamp(0) without time zone DEFAULT now() NOT NULL,
    views bigint DEFAULT 0 NOT NULL,
    comments integer DEFAULT 0 NOT NULL
)
WITH (oids = false);
ALTER TABLE ONLY public.article ALTER COLUMN id SET STATISTICS 0;
ALTER TABLE ONLY public.article ALTER COLUMN title SET STATISTICS 0;
ALTER TABLE ONLY public.article ALTER COLUMN url SET STATISTICS 0;
ALTER TABLE ONLY public.article ALTER COLUMN logo SET STATISTICS 0;
ALTER TABLE ONLY public.article ALTER COLUMN desk SET STATISTICS 0;
ALTER TABLE ONLY public.article ALTER COLUMN content SET STATISTICS 0;
ALTER TABLE ONLY public.article ALTER COLUMN id_category SET STATISTICS 0;
ALTER TABLE ONLY public.article ALTER COLUMN created SET STATISTICS 0;
ALTER TABLE ONLY public.article ALTER COLUMN views SET STATISTICS 0;
ALTER TABLE ONLY public.article ALTER COLUMN comments SET STATISTICS 0;
--
-- Structure for table account (OID = 24601) :
--
CREATE TABLE public.account (
    id bigint NOT NULL,
    email varchar(100) NOT NULL,
    name varchar(30) NOT NULL,
    avatar varchar(255),
    created timestamp(0) without time zone DEFAULT now() NOT NULL
)
WITH (oids = false);
ALTER TABLE ONLY public.account ALTER COLUMN email SET STATISTICS 0;
ALTER TABLE ONLY public.account ALTER COLUMN name SET STATISTICS 0;
ALTER TABLE ONLY public.account ALTER COLUMN avatar SET STATISTICS 0;
ALTER TABLE ONLY public.account ALTER COLUMN created SET STATISTICS 0;
--
-- Structure for table comment (OID = 24609) :
--
CREATE TABLE public.comment (
    id bigint NOT NULL,
    id_account bigint NOT NULL,
    id_article bigint NOT NULL,
    content text NOT NULL,
    created timestamp(0) without time zone DEFAULT now() NOT NULL
)
WITH (oids = false);
ALTER TABLE ONLY public.comment ALTER COLUMN id SET STATISTICS 0;
ALTER TABLE ONLY public.comment ALTER COLUMN id_account SET STATISTICS 0;
ALTER TABLE ONLY public.comment ALTER COLUMN id_article SET STATISTICS 0;
ALTER TABLE ONLY public.comment ALTER COLUMN content SET STATISTICS 0;
ALTER TABLE ONLY public.comment ALTER COLUMN created SET STATISTICS 0;
--
-- Definition for sequence account_seq (OID = 24618) :
--
CREATE SEQUENCE public.account_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence comment_seq (OID = 24620) :
--
CREATE SEQUENCE public.comment_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for index comment_idx (OID = 24637) :
--
CREATE INDEX comment_idx ON public.comment USING btree (id_article);
--
-- Definition for index article_idx (OID = 24638) :
--
CREATE INDEX article_idx ON public.article USING btree (id_category);
--
-- Definition for index comment_idx1 (OID = 24639) :
--
CREATE INDEX comment_idx1 ON public.comment USING btree (id_account);
--
-- Definition for index category_pkey (OID = 24586) :
--
ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey
    PRIMARY KEY (id);
--
-- Definition for index category_url_key (OID = 24588) :
--
ALTER TABLE ONLY category
    ADD CONSTRAINT category_url_key
    UNIQUE (url);
--
-- Definition for index article_pkey (OID = 24599) :
--
ALTER TABLE ONLY article
    ADD CONSTRAINT article_pkey
    PRIMARY KEY (id);
--
-- Definition for index account_pkey (OID = 24605) :
--
ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey
    PRIMARY KEY (id);
--
-- Definition for index account_email_key (OID = 24607) :
--
ALTER TABLE ONLY account
    ADD CONSTRAINT account_email_key
    UNIQUE (email);
--
-- Definition for index comment_pkey (OID = 24616) :
--
ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pkey
    PRIMARY KEY (id);
--
-- Definition for index article_fk (OID = 24622) :
--
ALTER TABLE ONLY article
    ADD CONSTRAINT article_fk
    FOREIGN KEY (id_category) REFERENCES category(id) ON UPDATE CASCADE ON DELETE RESTRICT;
--
-- Definition for index comment_fk (OID = 24627) :
--
ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk
    FOREIGN KEY (id_account) REFERENCES account(id) ON UPDATE CASCADE ON DELETE RESTRICT;
--
-- Definition for index comment_fk1 (OID = 24632) :
--
ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk1
    FOREIGN KEY (id_article) REFERENCES article(id) ON UPDATE CASCADE ON DELETE RESTRICT;
--
-- Data for sequence public.account_seq (OID = 24618)
--
SELECT pg_catalog.setval('account_seq', 1, false);
--
-- Data for sequence public.comment_seq (OID = 24620)
--
SELECT pg_catalog.setval('comment_seq', 1, false);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
