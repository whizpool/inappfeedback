PGDMP     &                    y            inappfeedback_v1    10.12    13.2 Q    q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            r           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            s           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            t           1262    197834    inappfeedback_v1    DATABASE     t   CREATE DATABASE inappfeedback_v1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
     DROP DATABASE inappfeedback_v1;
                postgres    false            �           1247    238623    enum_questions_is_editable    TYPE     X   CREATE TYPE public.enum_questions_is_editable AS ENUM (
    'feedback',
    'rating'
);
 -   DROP TYPE public.enum_questions_is_editable;
       public          postgres    false                       1247    197836    enum_questions_type    TYPE     �   CREATE TYPE public.enum_questions_type AS ENUM (
    'string',
    'singleline',
    'multiline',
    'number',
    'select',
    'choice'
);
 &   DROP TYPE public.enum_questions_type;
       public          postgres    false            �           1247    231235    enum_questions_widget_type    TYPE     �   CREATE TYPE public.enum_questions_widget_type AS ENUM (
    'string',
    'singleline',
    'multiline',
    'number',
    'select',
    'choice',
    'feedback',
    'rating'
);
 -   DROP TYPE public.enum_questions_widget_type;
       public          postgres    false                       1247    197850    enum_users_status    TYPE     P   CREATE TYPE public.enum_users_status AS ENUM (
    'invited',
    'accepted'
);
 $   DROP TYPE public.enum_users_status;
       public          postgres    false            �            1259    197855    Session    TABLE     �   CREATE TABLE public."Session" (
    sid character varying(36) NOT NULL,
    expires timestamp with time zone,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Session";
       public            postgres    false            �            1259    197861 
   dbVersions    TABLE     �   CREATE TABLE public."dbVersions" (
    id integer NOT NULL,
    version character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."dbVersions";
       public            postgres    false            �            1259    197864    dbVersions_id_seq    SEQUENCE     �   CREATE SEQUENCE public."dbVersions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."dbVersions_id_seq";
       public          postgres    false    197            u           0    0    dbVersions_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."dbVersions_id_seq" OWNED BY public."dbVersions".id;
          public          postgres    false    198            �            1259    197866    feedback_answers    TABLE       CREATE TABLE public.feedback_answers (
    id integer NOT NULL,
    feedback_id integer NOT NULL,
    widget_question_id integer NOT NULL,
    answer text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 $   DROP TABLE public.feedback_answers;
       public            postgres    false            �            1259    197872    feedback_answers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.feedback_answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.feedback_answers_id_seq;
       public          postgres    false    199            v           0    0    feedback_answers_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.feedback_answers_id_seq OWNED BY public.feedback_answers.id;
          public          postgres    false    200            �            1259    197874 	   feedbacks    TABLE       CREATE TABLE public.feedbacks (
    id integer NOT NULL,
    widget_id integer NOT NULL,
    screen_shot character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    referral_url character varying(255)
);
    DROP TABLE public.feedbacks;
       public            postgres    false            �            1259    197877    feedbacks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.feedbacks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.feedbacks_id_seq;
       public          postgres    false    201            w           0    0    feedbacks_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.feedbacks_id_seq OWNED BY public.feedbacks.id;
          public          postgres    false    202            �            1259    197879    question_options    TABLE        CREATE TABLE public.question_options (
    id integer NOT NULL,
    question_id integer NOT NULL,
    label character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 $   DROP TABLE public.question_options;
       public            postgres    false            �            1259    197885    question_options_id_seq    SEQUENCE     �   CREATE SEQUENCE public.question_options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.question_options_id_seq;
       public          postgres    false    203            x           0    0    question_options_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.question_options_id_seq OWNED BY public.question_options.id;
          public          postgres    false    204            �            1259    197887 	   questions    TABLE     �  CREATE TABLE public.questions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    display_text character varying(255),
    tooltip character varying(255),
    type public.enum_questions_type DEFAULT 'singleline'::public.enum_questions_type,
    "limit" integer DEFAULT 0,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    widget_type character varying(255),
    is_editable boolean,
    form_key character varying(100)
);
    DROP TABLE public.questions;
       public            postgres    false    523    523            �            1259    197895    questions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.questions_id_seq;
       public          postgres    false    205            y           0    0    questions_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;
          public          postgres    false    206            �            1259    197897    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    api_key character varying(255) NOT NULL,
    account_id character varying(255) NOT NULL,
    status public.enum_users_status DEFAULT 'invited'::public.enum_users_status,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.users;
       public            postgres    false    526    526            �            1259    197904    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    207            z           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    208            �            1259    197906    widget_connections    TABLE     �  CREATE TABLE public.widget_connections (
    id integer NOT NULL,
    widget_id integer NOT NULL,
    github_api_url character varying(255),
    is_github_connected boolean DEFAULT false,
    personal_access_token character varying(255),
    github_response text,
    repo_id character varying(255),
    repo_name character varying(255),
    repo_owner character varying(255),
    repo_url character varying(255),
    is_slack_connected boolean DEFAULT false,
    webhook character varying(255),
    channel_name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 &   DROP TABLE public.widget_connections;
       public            postgres    false            �            1259    197914    widget_connections_id_seq    SEQUENCE     �   CREATE SEQUENCE public.widget_connections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.widget_connections_id_seq;
       public          postgres    false    209            {           0    0    widget_connections_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.widget_connections_id_seq OWNED BY public.widget_connections.id;
          public          postgres    false    210            �            1259    197916    widget_questions    TABLE     �  CREATE TABLE public.widget_questions (
    id integer NOT NULL,
    widget_id integer NOT NULL,
    question_id integer NOT NULL,
    "order" integer NOT NULL,
    display_text character varying(255) NOT NULL,
    is_required boolean DEFAULT true,
    is_active boolean DEFAULT true,
    "limit" integer DEFAULT 0,
    option_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    display_label boolean
);
 $   DROP TABLE public.widget_questions;
       public            postgres    false            �            1259    197922    widget_questions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.widget_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.widget_questions_id_seq;
       public          postgres    false    211            |           0    0    widget_questions_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.widget_questions_id_seq OWNED BY public.widget_questions.id;
          public          postgres    false    212            �            1259    197924    widgets    TABLE     �  CREATE TABLE public.widgets (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    creater_name character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    status boolean DEFAULT true,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    type character varying(255),
    rating_option character varying(255)
);
    DROP TABLE public.widgets;
       public            postgres    false            �            1259    197931    widgets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.widgets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.widgets_id_seq;
       public          postgres    false    213            }           0    0    widgets_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.widgets_id_seq OWNED BY public.widgets.id;
          public          postgres    false    214            �
           2604    197933    dbVersions id    DEFAULT     r   ALTER TABLE ONLY public."dbVersions" ALTER COLUMN id SET DEFAULT nextval('public."dbVersions_id_seq"'::regclass);
 >   ALTER TABLE public."dbVersions" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    198    197            �
           2604    197934    feedback_answers id    DEFAULT     z   ALTER TABLE ONLY public.feedback_answers ALTER COLUMN id SET DEFAULT nextval('public.feedback_answers_id_seq'::regclass);
 B   ALTER TABLE public.feedback_answers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    199            �
           2604    197935    feedbacks id    DEFAULT     l   ALTER TABLE ONLY public.feedbacks ALTER COLUMN id SET DEFAULT nextval('public.feedbacks_id_seq'::regclass);
 ;   ALTER TABLE public.feedbacks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    201            �
           2604    197936    question_options id    DEFAULT     z   ALTER TABLE ONLY public.question_options ALTER COLUMN id SET DEFAULT nextval('public.question_options_id_seq'::regclass);
 B   ALTER TABLE public.question_options ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203            �
           2604    197937    questions id    DEFAULT     l   ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);
 ;   ALTER TABLE public.questions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205            �
           2604    197938    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    207            �
           2604    197939    widget_connections id    DEFAULT     ~   ALTER TABLE ONLY public.widget_connections ALTER COLUMN id SET DEFAULT nextval('public.widget_connections_id_seq'::regclass);
 D   ALTER TABLE public.widget_connections ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209            �
           2604    197940    widget_questions id    DEFAULT     z   ALTER TABLE ONLY public.widget_questions ALTER COLUMN id SET DEFAULT nextval('public.widget_questions_id_seq'::regclass);
 B   ALTER TABLE public.widget_questions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211            �
           2604    197941 
   widgets id    DEFAULT     h   ALTER TABLE ONLY public.widgets ALTER COLUMN id SET DEFAULT nextval('public.widgets_id_seq'::regclass);
 9   ALTER TABLE public.widgets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213            \          0    197855    Session 
   TABLE DATA           Q   COPY public."Session" (sid, expires, data, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    196   �h       ]          0    197861 
   dbVersions 
   TABLE DATA           M   COPY public."dbVersions" (id, version, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    197   �h       _          0    197866    feedback_answers 
   TABLE DATA           q   COPY public.feedback_answers (id, feedback_id, widget_question_id, answer, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    199   �h       a          0    197874 	   feedbacks 
   TABLE DATA           g   COPY public.feedbacks (id, widget_id, screen_shot, "createdAt", "updatedAt", referral_url) FROM stdin;
    public          postgres    false    201   i       c          0    197879    question_options 
   TABLE DATA           c   COPY public.question_options (id, question_id, label, value, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    203   2i       e          0    197887 	   questions 
   TABLE DATA           �   COPY public.questions (id, name, display_text, tooltip, type, "limit", "createdAt", "updatedAt", widget_type, is_editable, form_key) FROM stdin;
    public          postgres    false    205   �i       g          0    197897    users 
   TABLE DATA           m   COPY public.users (id, name, email, role, api_key, account_id, status, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    207   0k       i          0    197906    widget_connections 
   TABLE DATA           �   COPY public.widget_connections (id, widget_id, github_api_url, is_github_connected, personal_access_token, github_response, repo_id, repo_name, repo_owner, repo_url, is_slack_connected, webhook, channel_name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    209   Mk       k          0    197916    widget_questions 
   TABLE DATA           �   COPY public.widget_questions (id, widget_id, question_id, "order", display_text, is_required, is_active, "limit", option_id, "createdAt", "updatedAt", display_label) FROM stdin;
    public          postgres    false    211   jk       m          0    197924    widgets 
   TABLE DATA           u   COPY public.widgets (id, name, creater_name, url, status, "createdAt", "updatedAt", type, rating_option) FROM stdin;
    public          postgres    false    213   �k       ~           0    0    dbVersions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."dbVersions_id_seq"', 1, true);
          public          postgres    false    198                       0    0    feedback_answers_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.feedback_answers_id_seq', 39, true);
          public          postgres    false    200            �           0    0    feedbacks_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.feedbacks_id_seq', 27, true);
          public          postgres    false    202            �           0    0    question_options_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.question_options_id_seq', 1, false);
          public          postgres    false    204            �           0    0    questions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.questions_id_seq', 2, true);
          public          postgres    false    206            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          postgres    false    208            �           0    0    widget_connections_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.widget_connections_id_seq', 1, false);
          public          postgres    false    210            �           0    0    widget_questions_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.widget_questions_id_seq', 56, true);
          public          postgres    false    212            �           0    0    widgets_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.widgets_id_seq', 6, true);
          public          postgres    false    214            �
           2606    197943    Session Session_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_pkey" PRIMARY KEY (sid);
 B   ALTER TABLE ONLY public."Session" DROP CONSTRAINT "Session_pkey";
       public            postgres    false    196            �
           2606    197945    dbVersions dbVersions_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."dbVersions"
    ADD CONSTRAINT "dbVersions_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."dbVersions" DROP CONSTRAINT "dbVersions_pkey";
       public            postgres    false    197            �
           2606    197947 &   feedback_answers feedback_answers_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.feedback_answers
    ADD CONSTRAINT feedback_answers_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.feedback_answers DROP CONSTRAINT feedback_answers_pkey;
       public            postgres    false    199            �
           2606    197949    feedbacks feedbacks_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.feedbacks DROP CONSTRAINT feedbacks_pkey;
       public            postgres    false    201            �
           2606    197951 &   question_options question_options_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.question_options
    ADD CONSTRAINT question_options_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.question_options DROP CONSTRAINT question_options_pkey;
       public            postgres    false    203            �
           2606    197953    questions questions_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_pkey;
       public            postgres    false    205            �
           2606    197955    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    207            �
           2606    197957 *   widget_connections widget_connections_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.widget_connections
    ADD CONSTRAINT widget_connections_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.widget_connections DROP CONSTRAINT widget_connections_pkey;
       public            postgres    false    209            �
           2606    197959 &   widget_questions widget_questions_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.widget_questions
    ADD CONSTRAINT widget_questions_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.widget_questions DROP CONSTRAINT widget_questions_pkey;
       public            postgres    false    211            �
           2606    197961    widgets widgets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.widgets
    ADD CONSTRAINT widgets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.widgets DROP CONSTRAINT widgets_pkey;
       public            postgres    false    213            �
           2606    197962 2   feedback_answers feedback_answers_feedback_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.feedback_answers
    ADD CONSTRAINT feedback_answers_feedback_id_fkey FOREIGN KEY (feedback_id) REFERENCES public.feedbacks(id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.feedback_answers DROP CONSTRAINT feedback_answers_feedback_id_fkey;
       public          postgres    false    201    2767    199            �
           2606    197967 9   feedback_answers feedback_answers_widget_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.feedback_answers
    ADD CONSTRAINT feedback_answers_widget_question_id_fkey FOREIGN KEY (widget_question_id) REFERENCES public.widget_questions(id) ON UPDATE CASCADE;
 c   ALTER TABLE ONLY public.feedback_answers DROP CONSTRAINT feedback_answers_widget_question_id_fkey;
       public          postgres    false    211    199    2777            �
           2606    197972 "   feedbacks feedbacks_widget_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_widget_id_fkey FOREIGN KEY (widget_id) REFERENCES public.widgets(id) ON UPDATE CASCADE;
 L   ALTER TABLE ONLY public.feedbacks DROP CONSTRAINT feedbacks_widget_id_fkey;
       public          postgres    false    213    201    2779            �
           2606    197977 -   widget_connections widget_connections_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.widget_connections
    ADD CONSTRAINT widget_connections_id_fkey FOREIGN KEY (id) REFERENCES public.widgets(id) ON UPDATE CASCADE;
 W   ALTER TABLE ONLY public.widget_connections DROP CONSTRAINT widget_connections_id_fkey;
       public          postgres    false    2779    213    209            �
           2606    197982 4   widget_connections widget_connections_widget_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.widget_connections
    ADD CONSTRAINT widget_connections_widget_id_fkey FOREIGN KEY (widget_id) REFERENCES public.widgets(id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.widget_connections DROP CONSTRAINT widget_connections_widget_id_fkey;
       public          postgres    false    209    213    2779            �
           2606    197987 2   widget_questions widget_questions_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.widget_questions
    ADD CONSTRAINT widget_questions_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.widget_questions DROP CONSTRAINT widget_questions_question_id_fkey;
       public          postgres    false    211    205    2771            �
           2606    197992 0   widget_questions widget_questions_widget_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.widget_questions
    ADD CONSTRAINT widget_questions_widget_id_fkey FOREIGN KEY (widget_id) REFERENCES public.widgets(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.widget_questions DROP CONSTRAINT widget_questions_widget_id_fkey;
       public          postgres    false    211    2779    213            \      x������ � �      ]   3   x�3�42020"]CH��)�Y�Z[��Yj������� �r?      _      x������ � �      a      x������ � �      c   �   x��ѽ�  ��x��M@A�c�:��Hb�O�o/0ts!�p�|9r���!��)����Ng�c��Q�Cx6&������B}4Y�l1��i1ڃMf�m�e�����Գ��W�l ��Z�c�n��������},�ZiE�v�f�{B���u      e   =  x���Kk1 ���W��b��V������Hŋ �y�����M�A�ˊ�����L���}������'�G�Vӊ�xM��iV"eWPE�U�-�nY`9���^��WE���� �1�����)7�����e���u�F�ЅT�(qOF*��M(�єͅܙ�Ʉӓ:i���$�<D�,�L�3�3�Ϋפ�r��kZ'����'�`)`�!��Hr_�kiqK��O?�|f����e���iS޽�<w ���HhR�`F(�T����M�CS:��3�i1�w�dk71R�*�㸘_!~?�F�      g      x������ � �      i      x������ � �      k      x������ � �      m      x������ � �     