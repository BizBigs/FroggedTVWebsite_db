-- Table: public.ftv_user

-- DROP TABLE IF EXISTS public.ftv_user;

CREATE TABLE IF NOT EXISTS public.ftv_user
(
    id_user integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    email character varying(50) COLLATE pg_catalog."default" NOT NULL UNIQUE,
    created_at timestamp with time zone NOT NULL,
    last_modified timestamp with time zone NOT NULL,
    password character varying(20) COLLATE pg_catalog."default" NOT NULL,
    nickname character varying(20) COLLATE pg_catalog."default" NOT NULL UNIQUE,
    public_id character varying(50) COLLATE pg_catalog."default" NOT NULL UNIQUE,
    CONSTRAINT ftv_user_pkey PRIMARY KEY (id_user)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ftv_user
    OWNER to admin;

-- Table: public.ftv_blog_post

-- DROP TABLE IF EXISTS public.ftv_blog_post;

CREATE TABLE IF NOT EXISTS public.ftv_blog_post
(
    id_blog_post integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    title character varying(128) COLLATE pg_catalog."default" NOT NULL,
    content text COLLATE pg_catalog."default",
    created_at timestamp with time zone,
    last_modified timestamp with time zone,
    author_id integer NOT NULL,
    CONSTRAINT ftv_blog_post_pkey PRIMARY KEY (id_blog_post),
    CONSTRAINT "FK_FTV_BLOG_POST_FTV_USER" FOREIGN KEY (author_id)
        REFERENCES public.ftv_user (id_user) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ftv_blog_post
    OWNER to admin;

-- Table: public.ftv_profile

-- DROP TABLE IF EXISTS public.ftv_profile;

CREATE TABLE IF NOT EXISTS public.ftv_profile
(
    id_profile integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    mmr smallint,
    steam_id character varying(20) COLLATE pg_catalog."default",
    user_id integer NOT NULL,
    CONSTRAINT ftv_profile_pkey PRIMARY KEY (id_profile),
    CONSTRAINT "FK_FTV_PROFILE_FTV_USER" FOREIGN KEY (user_id)
        REFERENCES public.ftv_user (id_user) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ftv_profile
    OWNER to admin;

-- Table: public.ftv_comment

-- DROP TABLE IF EXISTS public.ftv_comment;

CREATE TABLE IF NOT EXISTS public.ftv_comment
(
    id_comment integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    created_at timestamp with time zone NOT NULL,
    author_id integer NOT NULL,
    article_id integer,
    comment_id integer,
    CONSTRAINT ftv_comment_pkey PRIMARY KEY (id_comment),
    CONSTRAINT "FK_FTV_COMMENT_FTV_BLOG_POST" FOREIGN KEY (article_id)
        REFERENCES public.ftv_blog_post (id_blog_post) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_FTV_COMMENT_FTV_COMMENT" FOREIGN KEY (comment_id)
        REFERENCES public.ftv_comment (id_comment) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_FTV_COMMENT_FTV_USER" FOREIGN KEY (author_id)
        REFERENCES public.ftv_user (id_user) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ftv_comment
    OWNER to admin;

-- Table: public.ftv_tag

-- DROP TABLE IF EXISTS public.ftv_tag;

CREATE TABLE IF NOT EXISTS public.ftv_tag
(
    id_tag integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT ftv_tag_pkey PRIMARY KEY (id_tag)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ftv_tag
    OWNER to admin;

-- Table: public.link_ftv_blog_post_ftv_tag

-- DROP TABLE IF EXISTS public.link_ftv_blog_post_ftv_tag;

CREATE TABLE IF NOT EXISTS public.link_ftv_blog_post_ftv_tag
(
    id_link integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    tag_id integer NOT NULL,
    blog_post_id integer NOT NULL,
    CONSTRAINT "FK_LINK_FTV_BLOGPOST" FOREIGN KEY (blog_post_id)
        REFERENCES public.ftv_blog_post (id_blog_post) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_LINK_FTV_TAG" FOREIGN KEY (tag_id)
        REFERENCES public.ftv_tag (id_tag) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.link_ftv_blog_post_ftv_tag
    OWNER to admin;

-- Table: public.ftv_roles

-- DROP TABLE IF EXISTS public.ftv_roles;

CREATE TABLE IF NOT EXISTS public.ftv_roles
(
    id_role integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    role_name character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT ftv_roles_pkey PRIMARY KEY (id_role)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ftv_roles
    OWNER to admin;

-- Table: public.ftv_permissions

-- DROP TABLE IF EXISTS public.ftv_permissions;

CREATE TABLE IF NOT EXISTS public.ftv_permissions
(
    id_permission integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    permission_name character varying(20) COLLATE pg_catalog."default" NOT NULL,
    description character varying(128) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT ftv_permissions_pkey PRIMARY KEY (id_permission)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ftv_permissions
    OWNER to admin;

-- Table: public.link_ftv_user_ftv_roles

-- DROP TABLE IF EXISTS public.link_ftv_user_ftv_roles;

CREATE TABLE IF NOT EXISTS public.link_ftv_user_ftv_roles
(
    id_link integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    CONSTRAINT link_ftv_user_ftv_role_pkey PRIMARY KEY (id_link),
    CONSTRAINT "FK_LINK_RU_FTV_USER" FOREIGN KEY (user_id)
        REFERENCES public.ftv_user (id_user) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_LINK_RY_FTV_ROLE" FOREIGN KEY (role_id)
        REFERENCES public.ftv_roles (id_role) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.link_ftv_user_ftv_roles
    OWNER to admin;

-- Table: public.link_ftv_roles_ftv_permissions

-- DROP TABLE IF EXISTS public.link_ftv_roles_ftv_permissions;

CREATE TABLE IF NOT EXISTS public.link_ftv_roles_ftv_permissions
(
    id_link integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    role_id integer NOT NULL,
    permission_id integer NOT NULL,
    CONSTRAINT link_ftv_roles_ftv_permissions_pkey PRIMARY KEY (id_link),
    CONSTRAINT "FK_LINK_RP_FTV_PERMISSIONS" FOREIGN KEY (permission_id)
        REFERENCES public.ftv_permissions (id_permission) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_LINK_RP_FTV_ROLES" FOREIGN KEY (role_id)
        REFERENCES public.ftv_roles (id_role) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.link_ftv_roles_ftv_permissions
    OWNER to admin;

-- Table: public.ftv_team

-- DROP TABLE IF EXISTS public.ftv_team;

CREATE TABLE IF NOT EXISTS public.ftv_team
(
    id_team integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL UNIQUE,
    acronym character varying(5) COLLATE pg_catalog."default" NOT NULL UNIQUE,
    logo bytea,
    CONSTRAINT ftv_team_pkey PRIMARY KEY (id_team)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ftv_team
    OWNER to admin;

-- Table: public.link_ftv_team_ftv_user

-- DROP TABLE IF EXISTS public.link_ftv_team_ftv_user;

CREATE TABLE IF NOT EXISTS public.link_ftv_team_ftv_user
(
    id_link integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    is_captain boolean,
    is_coach boolean,
    team_id integer NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT link_ftv_team_ftv_user_pkey PRIMARY KEY (id_link),
    CONSTRAINT "FK_LINK_TU_FTV_TEAM" FOREIGN KEY (team_id)
        REFERENCES public.ftv_team (id_team) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_LINK_TU_FTV_USER" FOREIGN KEY (user_id)
        REFERENCES public.ftv_user (id_user) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.link_ftv_team_ftv_user
    OWNER to admin;

-- Table: public.ftv_season

-- DROP TABLE IF EXISTS public.ftv_season;

CREATE TABLE IF NOT EXISTS public.ftv_season
(
    id_season integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(20) COLLATE pg_catalog."default",
    season_number integer NOT NULL UNIQUE,
    logo bytea,
    CONSTRAINT ftv_season_pkey PRIMARY KEY (id_season)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ftv_season
    OWNER to admin;

-- Table: public.ftv_division

-- DROP TABLE IF EXISTS public.ftv_division;

CREATE TABLE IF NOT EXISTS public.ftv_division
(
    id_division integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(20) COLLATE pg_catalog."default" NOT NULL UNIQUE,
    CONSTRAINT ftv_division_pkey PRIMARY KEY (id_division)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ftv_division
    OWNER to admin;

-- Table: public.link_ftv_season_ftv_division_ftv_team

-- DROP TABLE IF EXISTS public.link_ftv_season_ftv_division_ftv_team;

CREATE TABLE IF NOT EXISTS public.link_ftv_season_ftv_division_ftv_team
(
    id_link integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    team_id integer NOT NULL,
    season_id integer NOT NULL,
    division_id integer NOT NULL,
    CONSTRAINT link_ftv_season_ftv_division_ftv_team_pkey PRIMARY KEY (id_link),
    CONSTRAINT "FK_LINK_TSD_FTV_DIVISION" FOREIGN KEY (division_id)
        REFERENCES public.ftv_division (id_division) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_LINK_TSD_FTV_SEASON" FOREIGN KEY (season_id)
        REFERENCES public.ftv_season (id_season) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_LINK_TSD_FTV_TEAM" FOREIGN KEY (team_id)
        REFERENCES public.ftv_team (id_team) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.link_ftv_season_ftv_division_ftv_team
    OWNER to admin;

-- Table: public.ftv_planning_season_division

-- DROP TABLE IF EXISTS public.ftv_planning_season_division;

CREATE TABLE IF NOT EXISTS public.ftv_planning_season_division
(
    id_planning_season_division integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    division_id integer NOT NULL,
    season_id integer NOT NULL,
    CONSTRAINT ftv_planning_season_division_pkey PRIMARY KEY (id_planning_season_division),
    CONSTRAINT "FK_FTV_PLANNING_FTV_DIVISION" FOREIGN KEY (division_id)
        REFERENCES public.ftv_division (id_division) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_FTV_PLANNING_FTV_SEASON" FOREIGN KEY (season_id)
        REFERENCES public.ftv_season (id_season) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ftv_planning_season_division
    OWNER to admin;

-- Table: public.ftv_week_planning

-- DROP TABLE IF EXISTS public.ftv_week_planning;

CREATE TABLE IF NOT EXISTS public.ftv_week_planning
(
    id_week_planning integer NOT NULL,
    day_from date NOT NULL,
    day_to date NOT NULL,
    planning_id integer NOT NULL,
    CONSTRAINT ftv_week_planning_pkey PRIMARY KEY (id_week_planning),
    CONSTRAINT "FK_FTV_WEEK_FTV_PLANNING" FOREIGN KEY (planning_id)
        REFERENCES public.ftv_planning_season_division (id_planning_season_division) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ftv_week_planning
    OWNER to admin;

-- Table: public.ftv_bestof

-- DROP TABLE IF EXISTS public.ftv_bestof;

CREATE TABLE IF NOT EXISTS public.ftv_bestof
(
    id_bestof integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    week_id integer NOT NULL,
    winner_id integer,
    CONSTRAINT ftv_bestof_pkey PRIMARY KEY (id_bestof),
    CONSTRAINT "FK_FTV_BESTOF_FTV_WEEK_PLANNING" FOREIGN KEY (week_id)
        REFERENCES public.ftv_week_planning (id_week_planning) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_FTV_BESTOF_FTV_WINNER_TEAM" FOREIGN KEY (winner_id)
        REFERENCES public.ftv_team (id_team) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ftv_bestof
    OWNER to admin;

-- Table: public.ftv_match

-- DROP TABLE IF EXISTS public.ftv_match;

CREATE TABLE IF NOT EXISTS public.ftv_match
(
    id_match integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    dota_match_id character varying(20) COLLATE pg_catalog."default",
    winner_id integer,
    first_team_id integer NOT NULL,
    second_team_id integer NOT NULL,
    bestof_id integer NOT NULL,
    CONSTRAINT ftv_match_pkey PRIMARY KEY (id_match),
    CONSTRAINT "FK_FTV_MATCH_FTV_BESTOF" FOREIGN KEY (bestof_id)
        REFERENCES public.ftv_bestof (id_bestof) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_FTV_MATCH_FTV_TEAM_1" FOREIGN KEY (first_team_id)
        REFERENCES public.ftv_team (id_team) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_FTV_MATCH_FTV_TEAM_2" FOREIGN KEY (second_team_id)
        REFERENCES public.ftv_team (id_team) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "FK_FTV_MATCH_FTV_TEAM_MATCH_WINNER" FOREIGN KEY (winner_id)
        REFERENCES public.ftv_team (id_team) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ftv_match
    OWNER to admin;
------------------------------------------------------  INSERT DATAS -------------------------------------------------------------

insert into ftv_user(nickname, email, created_at, last_modified, password) values
    ('Bigs', 'bigs@discord.gg', TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), 'lol'),
    ('YouYou', 'youyou@discord.gg', TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), 'lol'),
    ('KeepCalm', 'keepcalm@discord.gg', TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), 'lol'),
    ('Drugu', 'drugu@discord.gg', TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), 'lol'),
    ('Kaoru', 'kaoru@discord.gg', TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), 'lol');

insert into ftv_blog_post(title, content, created_at, last_modified, author_id) values
    ('Canard', 'lorem ipsum', TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), 2),
    ('Canardv2', 'lorem ipsum', TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), 2),
    ('Canardv3', 'lorem ipsum', TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), 2),
    ('Connard', 'lorem ipsum', TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), 3),
    ('Connardv2', 'lorem ipsum', TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), 3),
    ('Connardv3', 'lorem ipsum', TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), 3),
    ('alcoolo', 'lorem ipsum', TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), 4),
    ('tronpa', 'lorem ipsum', TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), 5),
    ('tronpaV2', 'lorem ipsum', TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), 5),
    ('CanardV234', 'lorem ipsum', TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), TO_TIMESTAMP('2017-03-31 9:30:20','YYYY-MM-DD HH:MI:SS'), 5);
