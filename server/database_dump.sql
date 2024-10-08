PGDMP  "    )                |            MusicPlatform    16.3    16.3 j    D           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            E           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            F           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            G           1262    50894    MusicPlatform    DATABASE     �   CREATE DATABASE "MusicPlatform" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "MusicPlatform";
                postgres    false            �            1259    51170    Album    TABLE     G  CREATE TABLE public."Album" (
    id integer NOT NULL,
    name text NOT NULL,
    "artistId" integer NOT NULL,
    genre text NOT NULL,
    picture text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    listens integer DEFAULT 0 NOT NULL,
    likes integer DEFAULT 0 NOT NULL
);
    DROP TABLE public."Album";
       public         heap    postgres    false            �            1259    51169    Album_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Album_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Album_id_seq";
       public          postgres    false    229            H           0    0    Album_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Album_id_seq" OWNED BY public."Album".id;
          public          postgres    false    228            �            1259    51158    Artist    TABLE     =  CREATE TABLE public."Artist" (
    id integer NOT NULL,
    name text NOT NULL,
    genre text NOT NULL,
    description text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    listens integer DEFAULT 0 NOT NULL,
    likes integer DEFAULT 0 NOT NULL,
    picture text
);
    DROP TABLE public."Artist";
       public         heap    postgres    false            �            1259    51157    Artist_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Artist_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Artist_id_seq";
       public          postgres    false    227            I           0    0    Artist_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Artist_id_seq" OWNED BY public."Artist".id;
          public          postgres    false    226            �            1259    51182    Comment    TABLE       CREATE TABLE public."Comment" (
    id integer NOT NULL,
    username text NOT NULL,
    text text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    likes integer DEFAULT 0 NOT NULL,
    "parentId" integer,
    "trackId" integer,
    "artistId" integer,
    "albumId" integer
);
    DROP TABLE public."Comment";
       public         heap    postgres    false            �            1259    51181    Comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Comment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Comment_id_seq";
       public          postgres    false    231            J           0    0    Comment_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Comment_id_seq" OWNED BY public."Comment".id;
          public          postgres    false    230            �            1259    51248    ListenedTrack    TABLE     �   CREATE TABLE public."ListenedTrack" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "trackId" integer NOT NULL,
    "listenedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
 #   DROP TABLE public."ListenedTrack";
       public         heap    postgres    false            �            1259    51247    ListenedTrack_id_seq    SEQUENCE     �   CREATE SEQUENCE public."ListenedTrack_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."ListenedTrack_id_seq";
       public          postgres    false    233            K           0    0    ListenedTrack_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."ListenedTrack_id_seq" OWNED BY public."ListenedTrack".id;
          public          postgres    false    232            �            1259    51121    Role    TABLE     p   CREATE TABLE public."Role" (
    id integer NOT NULL,
    value text NOT NULL,
    description text NOT NULL
);
    DROP TABLE public."Role";
       public         heap    postgres    false            �            1259    51120    Role_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Role_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Role_id_seq";
       public          postgres    false    219            L           0    0    Role_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Role_id_seq" OWNED BY public."Role".id;
          public          postgres    false    218            �            1259    51137    Token    TABLE     �   CREATE TABLE public."Token" (
    id integer NOT NULL,
    "refreshToken" text NOT NULL,
    "accessToken" text NOT NULL,
    "userId" integer NOT NULL
);
    DROP TABLE public."Token";
       public         heap    postgres    false            �            1259    51136    Token_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Token_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Token_id_seq";
       public          postgres    false    223            M           0    0    Token_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Token_id_seq" OWNED BY public."Token".id;
          public          postgres    false    222            �            1259    51146    Track    TABLE     �  CREATE TABLE public."Track" (
    id integer NOT NULL,
    name text NOT NULL,
    listens integer DEFAULT 0 NOT NULL,
    likes integer DEFAULT 0 NOT NULL,
    genre text NOT NULL,
    duration text NOT NULL,
    picture text NOT NULL,
    audio text NOT NULL,
    text text NOT NULL,
    "artistId" integer,
    "albumId" integer,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);
    DROP TABLE public."Track";
       public         heap    postgres    false            �            1259    51145    Track_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Track_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Track_id_seq";
       public          postgres    false    225            N           0    0    Track_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Track_id_seq" OWNED BY public."Track".id;
          public          postgres    false    224            �            1259    51110    User    TABLE        CREATE TABLE public."User" (
    id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    "isActivated" boolean DEFAULT false NOT NULL,
    password text NOT NULL,
    "activationLink" text NOT NULL,
    banned boolean DEFAULT false NOT NULL,
    "banReason" text
);
    DROP TABLE public."User";
       public         heap    postgres    false            �            1259    51130    UserRole    TABLE     z   CREATE TABLE public."UserRole" (
    id integer NOT NULL,
    "roleId" integer NOT NULL,
    "userId" integer NOT NULL
);
    DROP TABLE public."UserRole";
       public         heap    postgres    false            �            1259    51129    UserRole_id_seq    SEQUENCE     �   CREATE SEQUENCE public."UserRole_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."UserRole_id_seq";
       public          postgres    false    221            O           0    0    UserRole_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."UserRole_id_seq" OWNED BY public."UserRole".id;
          public          postgres    false    220            �            1259    51109    User_id_seq    SEQUENCE     �   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public          postgres    false    217            P           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public          postgres    false    216            �            1259    51258    _LikedAlbums    TABLE     [   CREATE TABLE public."_LikedAlbums" (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);
 "   DROP TABLE public."_LikedAlbums";
       public         heap    postgres    false            �            1259    51261    _LikedArtists    TABLE     \   CREATE TABLE public."_LikedArtists" (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);
 #   DROP TABLE public."_LikedArtists";
       public         heap    postgres    false            �            1259    51255    _LikedTracks    TABLE     [   CREATE TABLE public."_LikedTracks" (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);
 "   DROP TABLE public."_LikedTracks";
       public         heap    postgres    false            �            1259    51100    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    postgres    false            b           2604    51173    Album id    DEFAULT     h   ALTER TABLE ONLY public."Album" ALTER COLUMN id SET DEFAULT nextval('public."Album_id_seq"'::regclass);
 9   ALTER TABLE public."Album" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            ^           2604    51161 	   Artist id    DEFAULT     j   ALTER TABLE ONLY public."Artist" ALTER COLUMN id SET DEFAULT nextval('public."Artist_id_seq"'::regclass);
 :   ALTER TABLE public."Artist" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            f           2604    51185 
   Comment id    DEFAULT     l   ALTER TABLE ONLY public."Comment" ALTER COLUMN id SET DEFAULT nextval('public."Comment_id_seq"'::regclass);
 ;   ALTER TABLE public."Comment" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            i           2604    51251    ListenedTrack id    DEFAULT     x   ALTER TABLE ONLY public."ListenedTrack" ALTER COLUMN id SET DEFAULT nextval('public."ListenedTrack_id_seq"'::regclass);
 A   ALTER TABLE public."ListenedTrack" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233            W           2604    51124    Role id    DEFAULT     f   ALTER TABLE ONLY public."Role" ALTER COLUMN id SET DEFAULT nextval('public."Role_id_seq"'::regclass);
 8   ALTER TABLE public."Role" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            Y           2604    51140    Token id    DEFAULT     h   ALTER TABLE ONLY public."Token" ALTER COLUMN id SET DEFAULT nextval('public."Token_id_seq"'::regclass);
 9   ALTER TABLE public."Token" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            Z           2604    51149    Track id    DEFAULT     h   ALTER TABLE ONLY public."Track" ALTER COLUMN id SET DEFAULT nextval('public."Track_id_seq"'::regclass);
 9   ALTER TABLE public."Track" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            T           2604    51113    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            X           2604    51133    UserRole id    DEFAULT     n   ALTER TABLE ONLY public."UserRole" ALTER COLUMN id SET DEFAULT nextval('public."UserRole_id_seq"'::regclass);
 <   ALTER TABLE public."UserRole" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            :          0    51170    Album 
   TABLE DATA           d   COPY public."Album" (id, name, "artistId", genre, picture, "createdAt", listens, likes) FROM stdin;
    public          postgres    false    229   G�       8          0    51158    Artist 
   TABLE DATA           f   COPY public."Artist" (id, name, genre, description, "createdAt", listens, likes, picture) FROM stdin;
    public          postgres    false    227   d�       <          0    51182    Comment 
   TABLE DATA           �   COPY public."Comment" (id, username, text, "createdAt", "updatedAt", likes, "parentId", "trackId", "artistId", "albumId") FROM stdin;
    public          postgres    false    231   G�       >          0    51248    ListenedTrack 
   TABLE DATA           P   COPY public."ListenedTrack" (id, "userId", "trackId", "listenedAt") FROM stdin;
    public          postgres    false    233   d�       0          0    51121    Role 
   TABLE DATA           8   COPY public."Role" (id, value, description) FROM stdin;
    public          postgres    false    219   ��       4          0    51137    Token 
   TABLE DATA           N   COPY public."Token" (id, "refreshToken", "accessToken", "userId") FROM stdin;
    public          postgres    false    223   Ӂ       6          0    51146    Track 
   TABLE DATA           �   COPY public."Track" (id, name, listens, likes, genre, duration, picture, audio, text, "artistId", "albumId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    225   ��       .          0    51110    User 
   TABLE DATA           u   COPY public."User" (id, username, email, "isActivated", password, "activationLink", banned, "banReason") FROM stdin;
    public          postgres    false    217   k�       2          0    51130    UserRole 
   TABLE DATA           <   COPY public."UserRole" (id, "roleId", "userId") FROM stdin;
    public          postgres    false    221   �       @          0    51258    _LikedAlbums 
   TABLE DATA           2   COPY public."_LikedAlbums" ("A", "B") FROM stdin;
    public          postgres    false    235   .�       A          0    51261    _LikedArtists 
   TABLE DATA           3   COPY public."_LikedArtists" ("A", "B") FROM stdin;
    public          postgres    false    236   K�       ?          0    51255    _LikedTracks 
   TABLE DATA           2   COPY public."_LikedTracks" ("A", "B") FROM stdin;
    public          postgres    false    234   h�       ,          0    51100    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    215   ��       Q           0    0    Album_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Album_id_seq"', 1, false);
          public          postgres    false    228            R           0    0    Artist_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Artist_id_seq"', 3, true);
          public          postgres    false    226            S           0    0    Comment_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Comment_id_seq"', 1, false);
          public          postgres    false    230            T           0    0    ListenedTrack_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."ListenedTrack_id_seq"', 1, true);
          public          postgres    false    232            U           0    0    Role_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Role_id_seq"', 1, true);
          public          postgres    false    218            V           0    0    Token_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Token_id_seq"', 1, true);
          public          postgres    false    222            W           0    0    Track_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Track_id_seq"', 3, true);
          public          postgres    false    224            X           0    0    UserRole_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."UserRole_id_seq"', 1, true);
          public          postgres    false    220            Y           0    0    User_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."User_id_seq"', 1, true);
          public          postgres    false    216                       2606    51180    Album Album_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Album"
    ADD CONSTRAINT "Album_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Album" DROP CONSTRAINT "Album_pkey";
       public            postgres    false    229            }           2606    51168    Artist Artist_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Artist"
    ADD CONSTRAINT "Artist_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Artist" DROP CONSTRAINT "Artist_pkey";
       public            postgres    false    227            �           2606    51191    Comment Comment_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Comment" DROP CONSTRAINT "Comment_pkey";
       public            postgres    false    231            �           2606    51254     ListenedTrack ListenedTrack_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."ListenedTrack"
    ADD CONSTRAINT "ListenedTrack_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."ListenedTrack" DROP CONSTRAINT "ListenedTrack_pkey";
       public            postgres    false    233            r           2606    51128    Role Role_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Role" DROP CONSTRAINT "Role_pkey";
       public            postgres    false    219            x           2606    51144    Token Token_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Token"
    ADD CONSTRAINT "Token_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Token" DROP CONSTRAINT "Token_pkey";
       public            postgres    false    223            {           2606    51156    Track Track_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Track"
    ADD CONSTRAINT "Track_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Track" DROP CONSTRAINT "Track_pkey";
       public            postgres    false    225            u           2606    51135    UserRole UserRole_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."UserRole" DROP CONSTRAINT "UserRole_pkey";
       public            postgres    false    221            o           2606    51119    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    217            l           2606    51108 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            postgres    false    215            �           1259    51311     ListenedTrack_userId_trackId_idx    INDEX     m   CREATE INDEX "ListenedTrack_userId_trackId_idx" ON public."ListenedTrack" USING btree ("userId", "trackId");
 6   DROP INDEX public."ListenedTrack_userId_trackId_idx";
       public            postgres    false    233    233            s           1259    51194    Role_value_key    INDEX     K   CREATE UNIQUE INDEX "Role_value_key" ON public."Role" USING btree (value);
 $   DROP INDEX public."Role_value_key";
       public            postgres    false    219            y           1259    51196    Token_refreshToken_key    INDEX     ]   CREATE UNIQUE INDEX "Token_refreshToken_key" ON public."Token" USING btree ("refreshToken");
 ,   DROP INDEX public."Token_refreshToken_key";
       public            postgres    false    223            v           1259    51195    UserRole_roleId_userId_key    INDEX     h   CREATE UNIQUE INDEX "UserRole_roleId_userId_key" ON public."UserRole" USING btree ("roleId", "userId");
 0   DROP INDEX public."UserRole_roleId_userId_key";
       public            postgres    false    221    221            m           1259    51193    User_email_key    INDEX     K   CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);
 $   DROP INDEX public."User_email_key";
       public            postgres    false    217            p           1259    51192    User_username_key    INDEX     Q   CREATE UNIQUE INDEX "User_username_key" ON public."User" USING btree (username);
 '   DROP INDEX public."User_username_key";
       public            postgres    false    217            �           1259    51267    _LikedAlbums_AB_unique    INDEX     ^   CREATE UNIQUE INDEX "_LikedAlbums_AB_unique" ON public."_LikedAlbums" USING btree ("A", "B");
 ,   DROP INDEX public."_LikedAlbums_AB_unique";
       public            postgres    false    235    235            �           1259    51268    _LikedAlbums_B_index    INDEX     P   CREATE INDEX "_LikedAlbums_B_index" ON public."_LikedAlbums" USING btree ("B");
 *   DROP INDEX public."_LikedAlbums_B_index";
       public            postgres    false    235            �           1259    51269    _LikedArtists_AB_unique    INDEX     `   CREATE UNIQUE INDEX "_LikedArtists_AB_unique" ON public."_LikedArtists" USING btree ("A", "B");
 -   DROP INDEX public."_LikedArtists_AB_unique";
       public            postgres    false    236    236            �           1259    51270    _LikedArtists_B_index    INDEX     R   CREATE INDEX "_LikedArtists_B_index" ON public."_LikedArtists" USING btree ("B");
 +   DROP INDEX public."_LikedArtists_B_index";
       public            postgres    false    236            �           1259    51265    _LikedTracks_AB_unique    INDEX     ^   CREATE UNIQUE INDEX "_LikedTracks_AB_unique" ON public."_LikedTracks" USING btree ("A", "B");
 ,   DROP INDEX public."_LikedTracks_AB_unique";
       public            postgres    false    234    234            �           1259    51266    _LikedTracks_B_index    INDEX     P   CREATE INDEX "_LikedTracks_B_index" ON public."_LikedTracks" USING btree ("B");
 *   DROP INDEX public."_LikedTracks_B_index";
       public            postgres    false    234            �           2606    51222    Album Album_artistId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Album"
    ADD CONSTRAINT "Album_artistId_fkey" FOREIGN KEY ("artistId") REFERENCES public."Artist"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 G   ALTER TABLE ONLY public."Album" DROP CONSTRAINT "Album_artistId_fkey";
       public          postgres    false    4733    227    229            �           2606    51242    Comment Comment_albumId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_albumId_fkey" FOREIGN KEY ("albumId") REFERENCES public."Album"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 J   ALTER TABLE ONLY public."Comment" DROP CONSTRAINT "Comment_albumId_fkey";
       public          postgres    false    229    231    4735            �           2606    51237    Comment Comment_artistId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_artistId_fkey" FOREIGN KEY ("artistId") REFERENCES public."Artist"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Comment" DROP CONSTRAINT "Comment_artistId_fkey";
       public          postgres    false    231    227    4733            �           2606    51227    Comment Comment_parentId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES public."Comment"(id);
 K   ALTER TABLE ONLY public."Comment" DROP CONSTRAINT "Comment_parentId_fkey";
       public          postgres    false    4737    231    231            �           2606    51232    Comment Comment_trackId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_trackId_fkey" FOREIGN KEY ("trackId") REFERENCES public."Track"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 J   ALTER TABLE ONLY public."Comment" DROP CONSTRAINT "Comment_trackId_fkey";
       public          postgres    false    4731    231    225            �           2606    51276 (   ListenedTrack ListenedTrack_trackId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ListenedTrack"
    ADD CONSTRAINT "ListenedTrack_trackId_fkey" FOREIGN KEY ("trackId") REFERENCES public."Track"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public."ListenedTrack" DROP CONSTRAINT "ListenedTrack_trackId_fkey";
       public          postgres    false    225    233    4731            �           2606    51271 '   ListenedTrack ListenedTrack_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ListenedTrack"
    ADD CONSTRAINT "ListenedTrack_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public."ListenedTrack" DROP CONSTRAINT "ListenedTrack_userId_fkey";
       public          postgres    false    4719    233    217            �           2606    51207    Token Token_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Token"
    ADD CONSTRAINT "Token_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 E   ALTER TABLE ONLY public."Token" DROP CONSTRAINT "Token_userId_fkey";
       public          postgres    false    217    4719    223            �           2606    51217    Track Track_albumId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Track"
    ADD CONSTRAINT "Track_albumId_fkey" FOREIGN KEY ("albumId") REFERENCES public."Album"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 F   ALTER TABLE ONLY public."Track" DROP CONSTRAINT "Track_albumId_fkey";
       public          postgres    false    229    225    4735            �           2606    51212    Track Track_artistId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Track"
    ADD CONSTRAINT "Track_artistId_fkey" FOREIGN KEY ("artistId") REFERENCES public."Artist"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public."Track" DROP CONSTRAINT "Track_artistId_fkey";
       public          postgres    false    227    225    4733            �           2606    51197    UserRole UserRole_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 K   ALTER TABLE ONLY public."UserRole" DROP CONSTRAINT "UserRole_roleId_fkey";
       public          postgres    false    4722    221    219            �           2606    51202    UserRole UserRole_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 K   ALTER TABLE ONLY public."UserRole" DROP CONSTRAINT "UserRole_userId_fkey";
       public          postgres    false    221    4719    217            �           2606    51291     _LikedAlbums _LikedAlbums_A_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."_LikedAlbums"
    ADD CONSTRAINT "_LikedAlbums_A_fkey" FOREIGN KEY ("A") REFERENCES public."Album"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public."_LikedAlbums" DROP CONSTRAINT "_LikedAlbums_A_fkey";
       public          postgres    false    235    229    4735            �           2606    51296     _LikedAlbums _LikedAlbums_B_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."_LikedAlbums"
    ADD CONSTRAINT "_LikedAlbums_B_fkey" FOREIGN KEY ("B") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public."_LikedAlbums" DROP CONSTRAINT "_LikedAlbums_B_fkey";
       public          postgres    false    217    235    4719            �           2606    51301 "   _LikedArtists _LikedArtists_A_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."_LikedArtists"
    ADD CONSTRAINT "_LikedArtists_A_fkey" FOREIGN KEY ("A") REFERENCES public."Artist"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public."_LikedArtists" DROP CONSTRAINT "_LikedArtists_A_fkey";
       public          postgres    false    4733    227    236            �           2606    51306 "   _LikedArtists _LikedArtists_B_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."_LikedArtists"
    ADD CONSTRAINT "_LikedArtists_B_fkey" FOREIGN KEY ("B") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public."_LikedArtists" DROP CONSTRAINT "_LikedArtists_B_fkey";
       public          postgres    false    236    217    4719            �           2606    51281     _LikedTracks _LikedTracks_A_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."_LikedTracks"
    ADD CONSTRAINT "_LikedTracks_A_fkey" FOREIGN KEY ("A") REFERENCES public."Track"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public."_LikedTracks" DROP CONSTRAINT "_LikedTracks_A_fkey";
       public          postgres    false    4731    234    225            �           2606    51286     _LikedTracks _LikedTracks_B_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."_LikedTracks"
    ADD CONSTRAINT "_LikedTracks_B_fkey" FOREIGN KEY ("B") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public."_LikedTracks" DROP CONSTRAINT "_LikedTracks_B_fkey";
       public          postgres    false    217    4719    234            :      x������ � �      8   �   x�}�1N1@��{�����x쵷LQ����f�qB��P"q$N�+�Cqs#�Q���Ofs��1������CH�y$?�<���~��]�p)�4A�8 ��ќ����J �j�w�3+�q�O�����&���X8:	���R��BP����hZo���x�_������_��3���-��Q���y`B��!ǭ��uyn�0_i�R�      <      x������ � �      >   )   x�3�4B##]K]#c+cK+C=#33�=... j�      0   &   x�3�v�tIMK,�)Q(-N-R(��I����� ���      4   �   x�͎�N�0 ��ǻHZ\��de�Vn��5&����Z�a{z�-�=9�w\}�X#�R�����?�P��K�>?a�s�s���Jp�|\�V8MW�:0	��I/1j��f}	H[�W��_=1(fG�	��״[��d!��힂}.L��V����uj�����e}^�8�&�tӍ��w���(�����4�?��a��1O��i>LX�tخ��n[����z�      6   �  x�}UK��F]S���$����S��� p����l��ŏEu��K�	r��$�����Ʋ'Ȯ�WU�.�*���	��S_�E�������Ny�>ʼ��%���@K��b�F���"�w��)���q���~jKG]�Wi���/|�$"ߏ�!$�J|�j{lCpD3�d;݃50Tt��-��3֔#��=�;Ph��#uP����qp�_*����� ��������������yzj��9�!Ҁ�wX�	�ʭ��pGN�3�W;]ժ�6��|�:;�׶��khp����������RŽe�FÌ�6,�c�A1�v�Ø����l���!"(�(��U7�K�.#NȼW8��#a���� r'dA�w�0��A������#K?������	�a��G�Q�cLB�*�F%r�B�Q������>�4ơ�.,D�fl�Q:ȥ�EZ��b�s�S��lǛG�Ʋ���c��GZXaR݋�[�u��f5PN��n����u�(�ю��M����N(,��l_jz��� �����X:�X��E<�jI���Ώ���,oج,�>'m��yɕ��M}�/�gm%�����o0o]�����O#������\�����Zy��֬��G&�,���G�6�M轵V�=��y��o��������e�:(��Dk����PD��D.c)vI�J̵��r�J��H�B'�(q�K�P�D�I��,��A���Y�l����i��=�tuYOn�k�㖝�SU�����#�Lmn.$:I���vl�h��y��b������s�B�X+:+�f���v����2��s���}�
��x웭���nݯ�`�[,�Lh�6M��*�������7�]_��/�@���f���[/|�H�e���K뛇�f���#9�      .   �   x��I�0 �u{�%�P(;��k�	�N|PKh���G��<� nD:{�Hg�U��M��"�"�D9��������]�m'�D��C5/7ַa��N~��r���
�Dƹ���lB�"-�N�"U-cB	.4jQ��M�1�ȱ*b      2      x�3�4�4����� �X      @      x������ � �      A      x������ � �      ?      x������ � �      ,   �  x����j�AF��St_�H#�.y�>A�蟑�4��x���樂�f#F�|hq�Z��>�m�[S��c����� qn+|Al,�U�l���1{�&s�Ȉ$%�8�T
�C��`|�����d�{�G��_��������z������������a��1S��Ay5���z��o�3�Zy`��	��8+��I����Hp� B\屷L��T%��G���@H��
��7"㍞�7�e$������xv06�!�FL�ZA0e�[n
CgAR/K4��*�
��ڗ ߡ��P�����}��+{�*-����1I�p�m���)3����u�g«��ڒ�($T#�Dr?�.����J��3�>�i�?�e�N�Xk7X�#��/����5����1?�+uc��7����x�	����     