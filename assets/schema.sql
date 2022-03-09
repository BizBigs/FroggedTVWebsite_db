--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.1

-- Started on 2022-03-08 23:22:18 UTC

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
-- TOC entry 212 (class 1259 OID 16391)
-- Name: ftv_blog_post; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ftv_blog_post (
    id_blog_post integer NOT NULL,
    title character varying(128) NOT NULL,
    content text,
    created_at timestamp with time zone,
    last_modified timestamp with time zone,
    author_id integer NOT NULL
);


ALTER TABLE public.ftv_blog_post OWNER TO admin;

--
-- TOC entry 211 (class 1259 OID 16390)
-- Name: ftv_blog_post_id_blog_post_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.ftv_blog_post ALTER COLUMN id_blog_post ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ftv_blog_post_id_blog_post_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16415)
-- Name: ftv_comment; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ftv_comment (
    id_comment integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    author_id integer NOT NULL,
    article_id integer,
    comment_id integer
);


ALTER TABLE public.ftv_comment OWNER TO admin;

--
-- TOC entry 215 (class 1259 OID 16414)
-- Name: ftv_comment_id_comment_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.ftv_comment ALTER COLUMN id_comment ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ftv_comment_id_comment_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16464)
-- Name: ftv_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ftv_permissions (
    id_permission integer NOT NULL,
    permission_name character varying(20) NOT NULL,
    description character varying(128) NOT NULL
);


ALTER TABLE public.ftv_permissions OWNER TO admin;

--
-- TOC entry 223 (class 1259 OID 16463)
-- Name: ftv_permissions_id_permission_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.ftv_permissions ALTER COLUMN id_permission ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ftv_permissions_id_permission_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 16404)
-- Name: ftv_profile; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ftv_profile (
    id_profile integer NOT NULL,
    mmr smallint,
    steam_id character varying(20),
    user_id integer NOT NULL
);


ALTER TABLE public.ftv_profile OWNER TO admin;

--
-- TOC entry 213 (class 1259 OID 16403)
-- Name: ftv_profile_id_profile_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.ftv_profile ALTER COLUMN id_profile ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ftv_profile_id_profile_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16458)
-- Name: ftv_roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ftv_roles (
    id_role integer NOT NULL,
    role_name character varying(20) NOT NULL
);


ALTER TABLE public.ftv_roles OWNER TO admin;

--
-- TOC entry 221 (class 1259 OID 16457)
-- Name: ftv_roles_id_role_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.ftv_roles ALTER COLUMN id_role ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ftv_roles_id_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16436)
-- Name: ftv_tag; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ftv_tag (
    id_tag integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.ftv_tag OWNER TO admin;

--
-- TOC entry 217 (class 1259 OID 16435)
-- Name: ftv_tag_id_tag_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.ftv_tag ALTER COLUMN id_tag ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ftv_tag_id_tag_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 210 (class 1259 OID 16385)
-- Name: ftv_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ftv_user (
    id_user integer NOT NULL,
    email character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    last_modified timestamp with time zone NOT NULL,
    password character varying(20) NOT NULL,
    nickname character varying(20) NOT NULL
);


ALTER TABLE public.ftv_user OWNER TO admin;

--
-- TOC entry 209 (class 1259 OID 16384)
-- Name: ftv_user_id_user_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.ftv_user ALTER COLUMN id_user ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ftv_user_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16442)
-- Name: link_ftv_blog_post_ftv_tag; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.link_ftv_blog_post_ftv_tag (
    id_link integer NOT NULL,
    tag_id integer NOT NULL,
    blog_post_id integer NOT NULL
);


ALTER TABLE public.link_ftv_blog_post_ftv_tag OWNER TO admin;

--
-- TOC entry 219 (class 1259 OID 16441)
-- Name: link_ftv_blog_post_ftv_tag_id_link_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.link_ftv_blog_post_ftv_tag ALTER COLUMN id_link ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.link_ftv_blog_post_ftv_tag_id_link_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16486)
-- Name: link_ftv_roles_ftv_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.link_ftv_roles_ftv_permissions (
    id_link integer NOT NULL,
    role_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.link_ftv_roles_ftv_permissions OWNER TO admin;

--
-- TOC entry 227 (class 1259 OID 16485)
-- Name: link_ftv_roles_ftv_permissions_id_link_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.link_ftv_roles_ftv_permissions ALTER COLUMN id_link ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.link_ftv_roles_ftv_permissions_id_link_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16470)
-- Name: link_ftv_user_ftv_roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.link_ftv_user_ftv_roles (
    id_link integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.link_ftv_user_ftv_roles OWNER TO admin;

--
-- TOC entry 225 (class 1259 OID 16469)
-- Name: link_ftv_user_ftv_role_id_link_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.link_ftv_user_ftv_roles ALTER COLUMN id_link ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.link_ftv_user_ftv_role_id_link_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3214 (class 2606 OID 16397)
-- Name: ftv_blog_post ftv_blog_post_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ftv_blog_post
    ADD CONSTRAINT ftv_blog_post_pkey PRIMARY KEY (id_blog_post);


--
-- TOC entry 3218 (class 2606 OID 16419)
-- Name: ftv_comment ftv_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ftv_comment
    ADD CONSTRAINT ftv_comment_pkey PRIMARY KEY (id_comment);


--
-- TOC entry 3226 (class 2606 OID 16468)
-- Name: ftv_permissions ftv_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ftv_permissions
    ADD CONSTRAINT ftv_permissions_pkey PRIMARY KEY (id_permission);


--
-- TOC entry 3216 (class 2606 OID 16408)
-- Name: ftv_profile ftv_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ftv_profile
    ADD CONSTRAINT ftv_profile_pkey PRIMARY KEY (id_profile);


--
-- TOC entry 3224 (class 2606 OID 16462)
-- Name: ftv_roles ftv_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ftv_roles
    ADD CONSTRAINT ftv_roles_pkey PRIMARY KEY (id_role);


--
-- TOC entry 3220 (class 2606 OID 16440)
-- Name: ftv_tag ftv_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ftv_tag
    ADD CONSTRAINT ftv_tag_pkey PRIMARY KEY (id_tag);


--
-- TOC entry 3212 (class 2606 OID 16389)
-- Name: ftv_user ftv_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ftv_user
    ADD CONSTRAINT ftv_user_pkey PRIMARY KEY (id_user);


--
-- TOC entry 3222 (class 2606 OID 16446)
-- Name: link_ftv_blog_post_ftv_tag link_ftv_blog_post_ftv_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.link_ftv_blog_post_ftv_tag
    ADD CONSTRAINT link_ftv_blog_post_ftv_tag_pkey PRIMARY KEY (id_link);


--
-- TOC entry 3230 (class 2606 OID 16490)
-- Name: link_ftv_roles_ftv_permissions link_ftv_roles_ftv_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.link_ftv_roles_ftv_permissions
    ADD CONSTRAINT link_ftv_roles_ftv_permissions_pkey PRIMARY KEY (id_link);


--
-- TOC entry 3228 (class 2606 OID 16474)
-- Name: link_ftv_user_ftv_roles link_ftv_user_ftv_role_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.link_ftv_user_ftv_roles
    ADD CONSTRAINT link_ftv_user_ftv_role_pkey PRIMARY KEY (id_link);


--
-- TOC entry 3231 (class 2606 OID 16398)
-- Name: ftv_blog_post FK_FTV_BLOG_POST_FTV_USER; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ftv_blog_post
    ADD CONSTRAINT "FK_FTV_BLOG_POST_FTV_USER" FOREIGN KEY (author_id) REFERENCES public.ftv_user(id_user);


--
-- TOC entry 3234 (class 2606 OID 16425)
-- Name: ftv_comment FK_FTV_COMMENT_FTV_BLOG_POST; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ftv_comment
    ADD CONSTRAINT "FK_FTV_COMMENT_FTV_BLOG_POST" FOREIGN KEY (article_id) REFERENCES public.ftv_blog_post(id_blog_post) NOT VALID;


--
-- TOC entry 3235 (class 2606 OID 16430)
-- Name: ftv_comment FK_FTV_COMMENT_FTV_COMMENT; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ftv_comment
    ADD CONSTRAINT "FK_FTV_COMMENT_FTV_COMMENT" FOREIGN KEY (comment_id) REFERENCES public.ftv_comment(id_comment) NOT VALID;


--
-- TOC entry 3233 (class 2606 OID 16420)
-- Name: ftv_comment FK_FTV_COMMENT_FTV_USER; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ftv_comment
    ADD CONSTRAINT "FK_FTV_COMMENT_FTV_USER" FOREIGN KEY (author_id) REFERENCES public.ftv_user(id_user) NOT VALID;


--
-- TOC entry 3232 (class 2606 OID 16409)
-- Name: ftv_profile FK_FTV_PROFILE_FTV_USER; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ftv_profile
    ADD CONSTRAINT "FK_FTV_PROFILE_FTV_USER" FOREIGN KEY (user_id) REFERENCES public.ftv_user(id_user);


--
-- TOC entry 3236 (class 2606 OID 16447)
-- Name: link_ftv_blog_post_ftv_tag FK_LINK_FTV_BLOGPOST; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.link_ftv_blog_post_ftv_tag
    ADD CONSTRAINT "FK_LINK_FTV_BLOGPOST" FOREIGN KEY (blog_post_id) REFERENCES public.ftv_blog_post(id_blog_post);


--
-- TOC entry 3237 (class 2606 OID 16452)
-- Name: link_ftv_blog_post_ftv_tag FK_LINK_FTV_TAG; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.link_ftv_blog_post_ftv_tag
    ADD CONSTRAINT "FK_LINK_FTV_TAG" FOREIGN KEY (tag_id) REFERENCES public.ftv_tag(id_tag) NOT VALID;


--
-- TOC entry 3241 (class 2606 OID 16496)
-- Name: link_ftv_roles_ftv_permissions FK_LINK_RP_FTV_PERMISSIONS; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.link_ftv_roles_ftv_permissions
    ADD CONSTRAINT "FK_LINK_RP_FTV_PERMISSIONS" FOREIGN KEY (permission_id) REFERENCES public.ftv_permissions(id_permission) NOT VALID;


--
-- TOC entry 3240 (class 2606 OID 16491)
-- Name: link_ftv_roles_ftv_permissions FK_LINK_RP_FTV_ROLES; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.link_ftv_roles_ftv_permissions
    ADD CONSTRAINT "FK_LINK_RP_FTV_ROLES" FOREIGN KEY (role_id) REFERENCES public.ftv_roles(id_role) NOT VALID;


--
-- TOC entry 3238 (class 2606 OID 16475)
-- Name: link_ftv_user_ftv_roles FK_LINK_RU_FTV_USER; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.link_ftv_user_ftv_roles
    ADD CONSTRAINT "FK_LINK_RU_FTV_USER" FOREIGN KEY (user_id) REFERENCES public.ftv_user(id_user) NOT VALID;


--
-- TOC entry 3239 (class 2606 OID 16480)
-- Name: link_ftv_user_ftv_roles FK_LINK_RY_FTV_ROLE; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.link_ftv_user_ftv_roles
    ADD CONSTRAINT "FK_LINK_RY_FTV_ROLE" FOREIGN KEY (role_id) REFERENCES public.ftv_roles(id_role) NOT VALID;


-- Completed on 2022-03-08 23:22:18 UTC

--
-- PostgreSQL database dump complete
--

