PGDMP         9                v            postgres    9.6.5    9.6.5 )    �	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �	           1262    12669    postgres    DATABASE     f   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE postgres;
             postgres    false            �	           1262    12669    postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                  postgres    false    2435                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    4                        3079    12655    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    2                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                  false            �	           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                       false    1            �            1259    16647    comments    TABLE     �   CREATE TABLE comments (
    owner_profile_id character varying,
    owner_name character varying,
    comment character varying,
    topic_id bigint,
    id bigint NOT NULL
);
    DROP TABLE public.comments;
       public         postgres    false    4            �            1259    16659    comments_id_seq    SEQUENCE     q   CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public       postgres    false    194    4            �	           0    0    comments_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE comments_id_seq OWNED BY comments.id;
            public       postgres    false    195            �            1259    16640 	   questions    TABLE       CREATE TABLE questions (
    id integer NOT NULL,
    topic_id bigint,
    user_id character varying(100),
    question character varying(500),
    hint character varying(500),
    solution character varying(250),
    answers character varying(1000) COLLATE pg_catalog."uk_UA"
);
    DROP TABLE public.questions;
       public         postgres    false    4            �            1259    16638    questions_id_seq    SEQUENCE     r   CREATE SEQUENCE questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.questions_id_seq;
       public       postgres    false    4    193            �	           0    0    questions_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE questions_id_seq OWNED BY questions.id;
            public       postgres    false    192            �            1259    16626 
   topicImage    TABLE     y   CREATE TABLE "topicImage" (
    id integer NOT NULL,
    "imageId" character varying,
    "topicId" character varying
);
     DROP TABLE public."topicImage";
       public         postgres    false    4            �            1259    16629    topicImage_id_seq    SEQUENCE     u   CREATE SEQUENCE "topicImage_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."topicImage_id_seq";
       public       postgres    false    4    190            �	           0    0    topicImage_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE "topicImage_id_seq" OWNED BY "topicImage".id;
            public       postgres    false    191            �            1259    16617    topics    TABLE     �  CREATE TABLE topics (
    id integer NOT NULL,
    name character varying(150),
    keywords character varying(200),
    description character varying(500),
    category character varying(100),
    topic_image character varying(150),
    owner_profile_id character varying,
    up_rank bigint,
    down_rank bigint,
    single_star bigint,
    two_star bigint,
    three_star bigint,
    four_star bigint,
    five_star bigint,
    review bigint,
    access bigint
);
    DROP TABLE public.topics;
       public         postgres    false    4            �            1259    16615    topics_id_seq    SEQUENCE     o   CREATE SEQUENCE topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.topics_id_seq;
       public       postgres    false    4    189            �	           0    0    topics_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE topics_id_seq OWNED BY topics.id;
            public       postgres    false    188            �            1259    16603    users    TABLE     �   CREATE TABLE users (
    id integer NOT NULL,
    name character varying,
    address character varying,
    email character varying,
    phone bigint
);
    DROP TABLE public.users;
       public         postgres    false    4            �            1259    16606    users_id_seq    SEQUENCE     n   CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    4    186            �	           0    0    users_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE users_id_seq OWNED BY users.id;
            public       postgres    false    187            �           2604    16661    comments id    DEFAULT     \   ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    195    194            �           2604    16643    questions id    DEFAULT     ^   ALTER TABLE ONLY questions ALTER COLUMN id SET DEFAULT nextval('questions_id_seq'::regclass);
 ;   ALTER TABLE public.questions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    192    193    193            �           2604    16631    topicImage id    DEFAULT     d   ALTER TABLE ONLY "topicImage" ALTER COLUMN id SET DEFAULT nextval('"topicImage_id_seq"'::regclass);
 >   ALTER TABLE public."topicImage" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    191    190            �           2604    16620 	   topics id    DEFAULT     X   ALTER TABLE ONLY topics ALTER COLUMN id SET DEFAULT nextval('topics_id_seq'::regclass);
 8   ALTER TABLE public.topics ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    189    188    189            �           2604    16608    users id    DEFAULT     V   ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    187    186            }	          0    16647    comments 
   TABLE DATA               P   COPY comments (owner_profile_id, owner_name, comment, topic_id, id) FROM stdin;
    public       postgres    false    194   e(       �	           0    0    comments_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('comments_id_seq', 7, true);
            public       postgres    false    195            |	          0    16640 	   questions 
   TABLE DATA               V   COPY questions (id, topic_id, user_id, question, hint, solution, answers) FROM stdin;
    public       postgres    false    193   )       �	           0    0    questions_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('questions_id_seq', 10, true);
            public       postgres    false    192            y	          0    16626 
   topicImage 
   TABLE DATA               9   COPY "topicImage" (id, "imageId", "topicId") FROM stdin;
    public       postgres    false    190   $+       �	           0    0    topicImage_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('"topicImage_id_seq"', 1, false);
            public       postgres    false    191            x	          0    16617    topics 
   TABLE DATA               �   COPY topics (id, name, keywords, description, category, topic_image, owner_profile_id, up_rank, down_rank, single_star, two_star, three_star, four_star, five_star, review, access) FROM stdin;
    public       postgres    false    189   A+       �	           0    0    topics_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('topics_id_seq', 23, true);
            public       postgres    false    188            u	          0    16603    users 
   TABLE DATA               9   COPY users (id, name, address, email, phone) FROM stdin;
    public       postgres    false    186   ,       �	           0    0    users_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('users_id_seq', 2, true);
            public       postgres    false    187            �           2606    16625    topics topics_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.topics DROP CONSTRAINT topics_pkey;
       public         postgres    false    189    189            }	   �   x���K�0���sb��`��n�-�@[�����a�n�|��+���F9n8\��n��`;uV %���0[B����MΉ =�~���i��"j=��BH��
5V�����e��%7~��/�:.��+�&�|�պZk��t��M�t}���m��l��HXFy	�n�      |	   �  x���n�0���SX>#�a��].U	R��=�=�[[q��6�"Ļw���DLo�"�����Ѥd2!)YK�T9������!O]�Vs�|eTc�V�Z�\33&�ƭ�eSf�b#�\VZ+rϦ����B�C�|��4��-ێ�1
e��`ʬM	;�"y�:�� <.�v�v�l�/��I�%��e��%�g���������`d�6����0��g�c�P�j��w�X��,��űŭ~�/Ѣ�>z�M�����^���y�&W�.$(����A�el�M3B7(Ǉ��׍NF��T�W�L8��9�Y<";�8Q���@@0�;���r9ݛ����,�D��¿勂4մK��(b�땿�}����
.����}!%Z�z����pb�Ȏ N��]G�rZ*/��Yyд|�WpC�w���*t[�-.$h5&�0^X�<xA�p�+_��k�\K0��K+b�-���H.+na	<V�;��V���z-�I����f      y	      x������ � �      x	   �   x���M�0�ׯ���ij\"k=��U�ВR=��h\`���d~�o2��	����Y"������EO!0�J�mt1[��{�A�)處��
��1���#8X�1�����,P�4M�lL
ln��*��Q�T��;�yڹVU�/�>&�J��������������-�n����{N��A F2|�'�B����      u	   Z   x�3���I-�LJ�KO��/J�,J,���,J�KtH�M���K���4���07153�2����k(.�+J�DVlnfndih`f����� $�     