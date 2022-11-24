PGDMP     *                
    z            ArtCityTour2    15.0    15.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17847    ArtCityTour2    DATABASE     �   CREATE DATABASE "ArtCityTour2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Costa Rica.1252';
    DROP DATABASE "ArtCityTour2";
                postgres    false            �            1259    17848 	   itinerary    TABLE     X   CREATE TABLE public.itinerary (
    id integer NOT NULL,
    userid integer NOT NULL
);
    DROP TABLE public.itinerary;
       public         heap    postgres    false            �            1259    17851    Itinerario_ID_seq    SEQUENCE     �   ALTER TABLE public.itinerary ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Itinerario_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    17852    sponsor    TABLE     y   CREATE TABLE public.sponsor (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    image_id integer
);
    DROP TABLE public.sponsor;
       public         heap    postgres    false            �            1259    17855    Patrocinador_ID_seq    SEQUENCE     �   ALTER TABLE public.sponsor ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Patrocinador_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    17856    admin    TABLE     Y   CREATE TABLE public.admin (
    admin_id bigint NOT NULL,
    user_id bigint NOT NULL
);
    DROP TABLE public.admin;
       public         heap    postgres    false            �            1259    17859    admin_admin_id_seq    SEQUENCE     �   ALTER TABLE public.admin ALTER COLUMN admin_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.admin_admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    17860 	   companion    TABLE     �   CREATE TABLE public.companion (
    id integer NOT NULL,
    identification character varying(20) NOT NULL,
    age character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL
);
    DROP TABLE public.companion;
       public         heap    postgres    false            �            1259    17863    companion_id_seq    SEQUENCE     �   ALTER TABLE public.companion ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.companion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    17864    companionxreservation    TABLE     �   CREATE TABLE public.companionxreservation (
    id integer NOT NULL,
    reservation_id integer NOT NULL,
    companion_id integer NOT NULL
);
 )   DROP TABLE public.companionxreservation;
       public         heap    postgres    false            �            1259    17867    companionxreservation_id_seq    SEQUENCE     �   ALTER TABLE public.companionxreservation ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.companionxreservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    17868    edition    TABLE     �   CREATE TABLE public.edition (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    details character varying(500),
    date character varying(50),
    current boolean NOT NULL
);
    DROP TABLE public.edition;
       public         heap    postgres    false            �            1259    17873    edicion_ID_seq    SEQUENCE     �   ALTER TABLE public.edition ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."edicion_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    17874    event    TABLE     �   CREATE TABLE public.event (
    id integer NOT NULL,
    placeid integer NOT NULL,
    start_hour time without time zone,
    end_hour time without time zone
);
    DROP TABLE public.event;
       public         heap    postgres    false            �            1259    17877    evento_ID_seq    SEQUENCE     �   ALTER TABLE public.event ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."evento_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    17878    eventxitinerary    TABLE     �   CREATE TABLE public.eventxitinerary (
    id integer NOT NULL,
    itineraryid integer NOT NULL,
    eventid integer NOT NULL
);
 #   DROP TABLE public.eventxitinerary;
       public         heap    postgres    false            �            1259    17881    eventoxitinerario_ID_seq    SEQUENCE     �   ALTER TABLE public.eventxitinerary ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."eventoxitinerario_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    17882    image    TABLE     j   CREATE TABLE public.image (
    image_id integer NOT NULL,
    name text,
    drive_path text NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    17887    image_image_id_seq    SEQUENCE     �   ALTER TABLE public.image ALTER COLUMN image_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.image_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230            �            1259    17888    images_edition    TABLE     �   CREATE TABLE public.images_edition (
    images_edition_id integer NOT NULL,
    edition_id integer NOT NULL,
    image_id integer NOT NULL
);
 "   DROP TABLE public.images_edition;
       public         heap    postgres    false            �            1259    17891 $   images_edition_images_edition_id_seq    SEQUENCE     �   ALTER TABLE public.images_edition ALTER COLUMN images_edition_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.images_edition_images_edition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232            �            1259    17892    place    TABLE     h  CREATE TABLE public.place (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    details character varying(500) NOT NULL,
    image_id integer,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    category character varying(100),
    "priceRange" integer,
    score integer,
    link character varying(250)
);
    DROP TABLE public.place;
       public         heap    postgres    false            �            1259    17897    lugar_ID_seq    SEQUENCE     �   ALTER TABLE public.place ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."lugar_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    234            �            1259    17898    placexroute    TABLE     y   CREATE TABLE public.placexroute (
    id integer NOT NULL,
    routeid integer NOT NULL,
    placeid integer NOT NULL
);
    DROP TABLE public.placexroute;
       public         heap    postgres    false            �            1259    17901    lugarxruta_ID_seq    SEQUENCE     �   ALTER TABLE public.placexroute ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."lugarxruta_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    236            �            1259    17902 
   membership    TABLE     �   CREATE TABLE public.membership (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    details character varying(1500) NOT NULL,
    price numeric(8,2) NOT NULL,
    image_id integer
);
    DROP TABLE public.membership;
       public         heap    postgres    false            �            1259    17907    membershipxuser    TABLE     �   CREATE TABLE public.membershipxuser (
    id integer NOT NULL,
    userid integer NOT NULL,
    membershipid integer NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL
);
 #   DROP TABLE public.membershipxuser;
       public         heap    postgres    false            �            1259    17910    membresia_ID_seq    SEQUENCE     �   ALTER TABLE public.membership ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."membresia_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    238            �            1259    17911    membresiaxpersona_ID_seq    SEQUENCE     �   ALTER TABLE public.membershipxuser ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."membresiaxpersona_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    239            �            1259    17912    news    TABLE     �   CREATE TABLE public.news (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description character varying(1200) NOT NULL,
    image_id integer,
    date date,
    link character varying(200)
);
    DROP TABLE public.news;
       public         heap    postgres    false            �            1259    17917    news_id_seq    SEQUENCE     �   ALTER TABLE public.news ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    242            �            1259    17918    normal_user    TABLE     e   CREATE TABLE public.normal_user (
    normal_user_id bigint NOT NULL,
    user_id bigint NOT NULL
);
    DROP TABLE public.normal_user;
       public         heap    postgres    false            �            1259    17921    normal_user_normal_user_id_seq    SEQUENCE     �   ALTER TABLE public.normal_user ALTER COLUMN normal_user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.normal_user_normal_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    244            �            1259    17922    sponsorxedition    TABLE     �   CREATE TABLE public.sponsorxedition (
    "ID" integer NOT NULL,
    editionid integer NOT NULL,
    sponsorid integer NOT NULL
);
 #   DROP TABLE public.sponsorxedition;
       public         heap    postgres    false            �            1259    17925    patrocinadorxedicion_ID_seq    SEQUENCE     �   ALTER TABLE public.sponsorxedition ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."patrocinadorxedicion_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    246            �            1259    17926    reservation    TABLE     �  CREATE TABLE public.reservation (
    id integer NOT NULL,
    place_id integer NOT NULL,
    identification character varying(20) NOT NULL,
    age character varying(3) NOT NULL,
    name character varying(20) NOT NULL,
    lastname character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    phone_number character varying(11),
    is_first_time boolean NOT NULL
);
    DROP TABLE public.reservation;
       public         heap    postgres    false            �            1259    17929    reservation_id_seq    SEQUENCE     �   ALTER TABLE public.reservation ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    248            �            1259    17930    reservationxuser    TABLE     �   CREATE TABLE public.reservationxuser (
    id integer NOT NULL,
    user_id integer NOT NULL,
    reservation_id integer NOT NULL
);
 $   DROP TABLE public.reservationxuser;
       public         heap    postgres    false            �            1259    17933    reservationxuser_id_seq    SEQUENCE     �   ALTER TABLE public.reservationxuser ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservationxuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    250            �            1259    17934    route    TABLE     �   CREATE TABLE public.route (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    editionid integer,
    imageid integer
);
    DROP TABLE public.route;
       public         heap    postgres    false            �            1259    17937    ruta_ID_seq    SEQUENCE     �   ALTER TABLE public.route ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ruta_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    252            �            1259    17938    user    TABLE     �  CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    lastname character varying(30) NOT NULL,
    email character varying(30) NOT NULL,
    password character varying(500) NOT NULL,
    identification character varying(30) NOT NULL,
    phone_number character varying(30) NOT NULL,
    address character varying(300) NOT NULL,
    age integer NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    17943    usuario_ID_seq    SEQUENCE     �   ALTER TABLE public."user" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."usuario_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    254            �          0    17856    admin 
   TABLE DATA           2   COPY public.admin (admin_id, user_id) FROM stdin;
    public          postgres    false    218   H�       �          0    17860 	   companion 
   TABLE DATA           M   COPY public.companion (id, identification, age, name, last_name) FROM stdin;
    public          postgres    false    220   e�       �          0    17864    companionxreservation 
   TABLE DATA           Q   COPY public.companionxreservation (id, reservation_id, companion_id) FROM stdin;
    public          postgres    false    222   ��       �          0    17868    edition 
   TABLE DATA           C   COPY public.edition (id, name, details, date, current) FROM stdin;
    public          postgres    false    224   ��       �          0    17874    event 
   TABLE DATA           B   COPY public.event (id, placeid, start_hour, end_hour) FROM stdin;
    public          postgres    false    226   �       �          0    17878    eventxitinerary 
   TABLE DATA           C   COPY public.eventxitinerary (id, itineraryid, eventid) FROM stdin;
    public          postgres    false    228   X�       �          0    17882    image 
   TABLE DATA           ;   COPY public.image (image_id, name, drive_path) FROM stdin;
    public          postgres    false    230   ��       �          0    17888    images_edition 
   TABLE DATA           Q   COPY public.images_edition (images_edition_id, edition_id, image_id) FROM stdin;
    public          postgres    false    232   !�       �          0    17848 	   itinerary 
   TABLE DATA           /   COPY public.itinerary (id, userid) FROM stdin;
    public          postgres    false    214   }�       �          0    17902 
   membership 
   TABLE DATA           H   COPY public.membership (id, name, details, price, image_id) FROM stdin;
    public          postgres    false    238   ��       �          0    17907    membershipxuser 
   TABLE DATA           W   COPY public.membershipxuser (id, userid, membershipid, startdate, enddate) FROM stdin;
    public          postgres    false    239   O�       �          0    17912    news 
   TABLE DATA           L   COPY public.news (id, title, description, image_id, date, link) FROM stdin;
    public          postgres    false    242   ��       �          0    17918    normal_user 
   TABLE DATA           >   COPY public.normal_user (normal_user_id, user_id) FROM stdin;
    public          postgres    false    244   ��       �          0    17892    place 
   TABLE DATA           v   COPY public.place (id, name, details, image_id, latitude, longitude, category, "priceRange", score, link) FROM stdin;
    public          postgres    false    234   Ϊ       �          0    17898    placexroute 
   TABLE DATA           ;   COPY public.placexroute (id, routeid, placeid) FROM stdin;
    public          postgres    false    236   &�       �          0    17926    reservation 
   TABLE DATA           |   COPY public.reservation (id, place_id, identification, age, name, lastname, email, phone_number, is_first_time) FROM stdin;
    public          postgres    false    248   g�       �          0    17930    reservationxuser 
   TABLE DATA           G   COPY public.reservationxuser (id, user_id, reservation_id) FROM stdin;
    public          postgres    false    250   ��       �          0    17934    route 
   TABLE DATA           =   COPY public.route (id, name, editionid, imageid) FROM stdin;
    public          postgres    false    252   ��       �          0    17852    sponsor 
   TABLE DATA           5   COPY public.sponsor (id, name, image_id) FROM stdin;
    public          postgres    false    216   ��       �          0    17922    sponsorxedition 
   TABLE DATA           E   COPY public.sponsorxedition ("ID", editionid, sponsorid) FROM stdin;
    public          postgres    false    246   R�       �          0    17938    user 
   TABLE DATA           q   COPY public."user" (id, name, lastname, email, password, identification, phone_number, address, age) FROM stdin;
    public          postgres    false    254   ��       �           0    0    Itinerario_ID_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Itinerario_ID_seq"', 11, true);
          public          postgres    false    215            �           0    0    Patrocinador_ID_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Patrocinador_ID_seq"', 3, true);
          public          postgres    false    217            �           0    0    admin_admin_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.admin_admin_id_seq', 1, false);
          public          postgres    false    219            �           0    0    companion_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.companion_id_seq', 1, false);
          public          postgres    false    221            �           0    0    companionxreservation_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.companionxreservation_id_seq', 1, false);
          public          postgres    false    223            �           0    0    edicion_ID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."edicion_ID_seq"', 8, true);
          public          postgres    false    225            �           0    0    evento_ID_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."evento_ID_seq"', 2, true);
          public          postgres    false    227            �           0    0    eventoxitinerario_ID_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."eventoxitinerario_ID_seq"', 16, true);
          public          postgres    false    229            �           0    0    image_image_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.image_image_id_seq', 43, true);
          public          postgres    false    231            �           0    0 $   images_edition_images_edition_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.images_edition_images_edition_id_seq', 30, true);
          public          postgres    false    233            �           0    0    lugar_ID_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."lugar_ID_seq"', 14, true);
          public          postgres    false    235            �           0    0    lugarxruta_ID_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."lugarxruta_ID_seq"', 9, true);
          public          postgres    false    237            �           0    0    membresia_ID_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."membresia_ID_seq"', 5, true);
          public          postgres    false    240            �           0    0    membresiaxpersona_ID_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."membresiaxpersona_ID_seq"', 5, true);
          public          postgres    false    241            �           0    0    news_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.news_id_seq', 7, true);
          public          postgres    false    243            �           0    0    normal_user_normal_user_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.normal_user_normal_user_id_seq', 1, false);
          public          postgres    false    245            �           0    0    patrocinadorxedicion_ID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."patrocinadorxedicion_ID_seq"', 15, true);
          public          postgres    false    247            �           0    0    reservation_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.reservation_id_seq', 1, false);
          public          postgres    false    249            �           0    0    reservationxuser_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.reservationxuser_id_seq', 1, false);
          public          postgres    false    251            �           0    0    ruta_ID_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."ruta_ID_seq"', 7, true);
          public          postgres    false    253            �           0    0    usuario_ID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."usuario_ID_seq"', 9, true);
          public          postgres    false    255            �           2606    17945    itinerary Itinerario_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.itinerary
    ADD CONSTRAINT "Itinerario_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.itinerary DROP CONSTRAINT "Itinerario_pkey";
       public            postgres    false    214            �           2606    17947    sponsor Patrocinador_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.sponsor
    ADD CONSTRAINT "Patrocinador_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.sponsor DROP CONSTRAINT "Patrocinador_pkey";
       public            postgres    false    216            �           2606    17949    admin admin_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (admin_id);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            postgres    false    218            �           2606    17951    edition edicion_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.edition
    ADD CONSTRAINT edicion_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.edition DROP CONSTRAINT edicion_pkey;
       public            postgres    false    224            �           2606    17953    event evento_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.event
    ADD CONSTRAINT evento_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.event DROP CONSTRAINT evento_pkey;
       public            postgres    false    226            �           2606    17955 &   eventxitinerary eventoxitinerario_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.eventxitinerary
    ADD CONSTRAINT eventoxitinerario_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.eventxitinerary DROP CONSTRAINT eventoxitinerario_pkey;
       public            postgres    false    228            �           2606    17957    image image_id_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_id_pkey PRIMARY KEY (image_id);
 =   ALTER TABLE ONLY public.image DROP CONSTRAINT image_id_pkey;
       public            postgres    false    230            �           2606    17959 %   images_edition images_edition_id_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.images_edition
    ADD CONSTRAINT images_edition_id_pkey PRIMARY KEY (images_edition_id);
 O   ALTER TABLE ONLY public.images_edition DROP CONSTRAINT images_edition_id_pkey;
       public            postgres    false    232            �           2606    17961    place lugar_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.place
    ADD CONSTRAINT lugar_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.place DROP CONSTRAINT lugar_pkey;
       public            postgres    false    234            �           2606    17963    placexroute lugarxruta_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.placexroute
    ADD CONSTRAINT lugarxruta_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.placexroute DROP CONSTRAINT lugarxruta_pkey;
       public            postgres    false    236            �           2606    17965    membership membresia_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.membership
    ADD CONSTRAINT membresia_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.membership DROP CONSTRAINT membresia_pkey;
       public            postgres    false    238            �           2606    17967 &   membershipxuser membresiaxpersona_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.membershipxuser
    ADD CONSTRAINT membresiaxpersona_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.membershipxuser DROP CONSTRAINT membresiaxpersona_pkey;
       public            postgres    false    239            �           2606    17969    news news_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.news DROP CONSTRAINT news_pkey;
       public            postgres    false    242            �           2606    17971    normal_user normal_user_id_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.normal_user
    ADD CONSTRAINT normal_user_id_pkey PRIMARY KEY (normal_user_id);
 I   ALTER TABLE ONLY public.normal_user DROP CONSTRAINT normal_user_id_pkey;
       public            postgres    false    244            �           2606    17973 )   sponsorxedition patrocinadorxedicion_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.sponsorxedition
    ADD CONSTRAINT patrocinadorxedicion_pkey PRIMARY KEY ("ID");
 S   ALTER TABLE ONLY public.sponsorxedition DROP CONSTRAINT patrocinadorxedicion_pkey;
       public            postgres    false    246            �           2606    17975    companion pk_companions 
   CONSTRAINT     U   ALTER TABLE ONLY public.companion
    ADD CONSTRAINT pk_companions PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.companion DROP CONSTRAINT pk_companions;
       public            postgres    false    220            �           2606    17977 .   companionxreservation pk_companionxreservation 
   CONSTRAINT     l   ALTER TABLE ONLY public.companionxreservation
    ADD CONSTRAINT pk_companionxreservation PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.companionxreservation DROP CONSTRAINT pk_companionxreservation;
       public            postgres    false    222            �           2606    17979    reservation reservation_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservation_pkey;
       public            postgres    false    248            �           2606    17981 &   reservationxuser reservationxuser_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.reservationxuser
    ADD CONSTRAINT reservationxuser_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.reservationxuser DROP CONSTRAINT reservationxuser_pkey;
       public            postgres    false    250            �           2606    17983    route ruta_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.route
    ADD CONSTRAINT ruta_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.route DROP CONSTRAINT ruta_pkey;
       public            postgres    false    252            �           2606    17985    user usuario_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY public."user" DROP CONSTRAINT usuario_pkey;
       public            postgres    false    254            �           2606    17986    admin admin_user_fk    FK CONSTRAINT     s   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_user_fk FOREIGN KEY (user_id) REFERENCES public."user"(id);
 =   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_user_fk;
       public          postgres    false    218    3314    254                       2606    17991 /   sponsorxedition edicion_patrocinadorxedicion_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.sponsorxedition
    ADD CONSTRAINT "edicion_patrocinadorxedicion_FK" FOREIGN KEY (editionid) REFERENCES public.edition(id) NOT VALID;
 [   ALTER TABLE ONLY public.sponsorxedition DROP CONSTRAINT "edicion_patrocinadorxedicion_FK";
       public          postgres    false    224    3284    246            �           2606    17996 +   eventxitinerary eventoxitinerario_evento_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.eventxitinerary
    ADD CONSTRAINT "eventoxitinerario_evento_FK" FOREIGN KEY (eventid) REFERENCES public.event(id);
 W   ALTER TABLE ONLY public.eventxitinerary DROP CONSTRAINT "eventoxitinerario_evento_FK";
       public          postgres    false    228    226    3286            �           2606    18001 /   eventxitinerary eventoxitinerario_itinerario_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.eventxitinerary
    ADD CONSTRAINT "eventoxitinerario_itinerario_FK" FOREIGN KEY (itineraryid) REFERENCES public.itinerary(id);
 [   ALTER TABLE ONLY public.eventxitinerary DROP CONSTRAINT "eventoxitinerario_itinerario_FK";
       public          postgres    false    3274    228    214            �           2606    18006 %   companionxreservation fk_companion_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.companionxreservation
    ADD CONSTRAINT fk_companion_id FOREIGN KEY (companion_id) REFERENCES public.companion(id);
 O   ALTER TABLE ONLY public.companionxreservation DROP CONSTRAINT fk_companion_id;
       public          postgres    false    222    220    3280            �           2606    18011 '   companionxreservation fk_reservation_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.companionxreservation
    ADD CONSTRAINT fk_reservation_id FOREIGN KEY (reservation_id) REFERENCES public.reservation(id);
 Q   ALTER TABLE ONLY public.companionxreservation DROP CONSTRAINT fk_reservation_id;
       public          postgres    false    3308    222    248                       2606    18092    route fk_route_image    FK CONSTRAINT     �   ALTER TABLE ONLY public.route
    ADD CONSTRAINT fk_route_image FOREIGN KEY (imageid) REFERENCES public.image(image_id) NOT VALID;
 >   ALTER TABLE ONLY public.route DROP CONSTRAINT fk_route_image;
       public          postgres    false    3290    252    230            �           2606    18016 (   images_edition images_edition_edition_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.images_edition
    ADD CONSTRAINT images_edition_edition_fk FOREIGN KEY (edition_id) REFERENCES public.edition(id);
 R   ALTER TABLE ONLY public.images_edition DROP CONSTRAINT images_edition_edition_fk;
       public          postgres    false    3284    224    232            �           2606    18021    event lugar_evento_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.event
    ADD CONSTRAINT "lugar_evento_FK" FOREIGN KEY (placeid) REFERENCES public.place(id) NOT VALID;
 A   ALTER TABLE ONLY public.event DROP CONSTRAINT "lugar_evento_FK";
       public          postgres    false    226    3294    234            �           2606    18026    placexroute lugar_lugarxruta_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.placexroute
    ADD CONSTRAINT "lugar_lugarxruta_FK" FOREIGN KEY (placeid) REFERENCES public.place(id) NOT VALID;
 K   ALTER TABLE ONLY public.placexroute DROP CONSTRAINT "lugar_lugarxruta_FK";
       public          postgres    false    236    234    3294            �           2606    18031    membership membership_image_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.membership
    ADD CONSTRAINT membership_image_fk FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 H   ALTER TABLE ONLY public.membership DROP CONSTRAINT membership_image_fk;
       public          postgres    false    230    3290    238                        2606    18036 .   membershipxuser membresia_membresiaxpersona_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.membershipxuser
    ADD CONSTRAINT "membresia_membresiaxpersona_FK" FOREIGN KEY (membershipid) REFERENCES public.membership(id) NOT VALID;
 Z   ALTER TABLE ONLY public.membershipxuser DROP CONSTRAINT "membresia_membresiaxpersona_FK";
       public          postgres    false    3298    239    238                       2606    18041    news news_image_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_image_id_fkey FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 A   ALTER TABLE ONLY public.news DROP CONSTRAINT news_image_id_fkey;
       public          postgres    false    230    3290    242                       2606    18046    normal_user normal_user_user_fk    FK CONSTRAINT        ALTER TABLE ONLY public.normal_user
    ADD CONSTRAINT normal_user_user_fk FOREIGN KEY (user_id) REFERENCES public."user"(id);
 I   ALTER TABLE ONLY public.normal_user DROP CONSTRAINT normal_user_user_fk;
       public          postgres    false    244    254    3314                       2606    18051 4   sponsorxedition patrocinador_patrocinadorxedicion_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.sponsorxedition
    ADD CONSTRAINT "patrocinador_patrocinadorxedicion_FK" FOREIGN KEY (sponsorid) REFERENCES public.sponsor(id) NOT VALID;
 `   ALTER TABLE ONLY public.sponsorxedition DROP CONSTRAINT "patrocinador_patrocinadorxedicion_FK";
       public          postgres    false    3276    246    216            �           2606    18056    place place_image_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public.place
    ADD CONSTRAINT place_image_fk FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 >   ALTER TABLE ONLY public.place DROP CONSTRAINT place_image_fk;
       public          postgres    false    234    3290    230                       2606    18061 %   reservation reservation_place_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.place(id);
 O   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservation_place_id_fkey;
       public          postgres    false    248    234    3294                       2606    18066 .   reservationxuser reservationxuser_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservationxuser
    ADD CONSTRAINT reservationxuser_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 X   ALTER TABLE ONLY public.reservationxuser DROP CONSTRAINT reservationxuser_user_id_fkey;
       public          postgres    false    254    250    3314            �           2606    18071    placexroute ruta_lugarxruta_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.placexroute
    ADD CONSTRAINT "ruta_lugarxruta_FK" FOREIGN KEY (routeid) REFERENCES public.route(id) NOT VALID;
 J   ALTER TABLE ONLY public.placexroute DROP CONSTRAINT "ruta_lugarxruta_FK";
       public          postgres    false    236    252    3312            �           2606    18076    sponsor sponsor_image_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.sponsor
    ADD CONSTRAINT sponsor_image_fk FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 B   ALTER TABLE ONLY public.sponsor DROP CONSTRAINT sponsor_image_fk;
       public          postgres    false    230    3290    216            �           2606    18081    itinerary usuario_itinerario_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.itinerary
    ADD CONSTRAINT "usuario_itinerario_FK" FOREIGN KEY (userid) REFERENCES public."user"(id) NOT VALID;
 K   ALTER TABLE ONLY public.itinerary DROP CONSTRAINT "usuario_itinerario_FK";
       public          postgres    false    254    3314    214                       2606    18086 ,   membershipxuser usuario_membresiaxpersona_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.membershipxuser
    ADD CONSTRAINT "usuario_membresiaxpersona_FK" FOREIGN KEY (userid) REFERENCES public."user"(id) NOT VALID;
 X   ALTER TABLE ONLY public.membershipxuser DROP CONSTRAINT "usuario_membresiaxpersona_FK";
       public          postgres    false    254    3314    239            �      x������ � �      �      x������ � �      �      x������ � �      �   e  x�]S�n�0<�_���6,7)���i�y��1�5�vXH�JRF�����(���~)���Gˆ�����`Bkv��G��e�|��19����.��m�i}Ԥ��o%$&�7���]�R��=��^P!�&XW��b$��gTy'�T�M�{[s-1�gx�C�`+�����v�H���A���
���vk��i�)��;�h-��|��y���\C�:���m��{$�7/���{��+�Hkް��yy7-��,�����r�?�>��b|}2�%�}HT�t�7߇��'s������ 卂��&p#t`A�u�sl�YƷ�VJ�f:x���8��2� k���"}�~P�6Z4��L{�T��q3���Gd��_JP1J�c��r��I��,S�"�����	��'i��E+��K}��_����{��ᘌ0�x��H����}5�4�9t�)�̾f<�����zW�+� Q��{��� ��l\�B�2�7��p����v��e�� �Kp�S�{��0C�wW�^�y1����;�!}WH��Y�.�O0{v�B�[>�@�(���.�_��`P�Ȯ�Ɂ{x����t~7]��t��H���h4���      �   4   x�3�4�42�2��25Գ4��4��sq��L�,���--и\1z\\\ ��      �      x�34�44�4�24�F\1z\\\ !D�      �   �  x���[��@�gjl��-�L2�����`��d�X�E�k��^Kol�y�d�d2]��9UH�1ڣ��e]���=��u��K���)ƨMӲL��q_�O�����<S|��ㅝ����o
�z6u^ #���{�a�4T����-�\�@W��g/�U��Iu��&����Ko�m�w��y����ĩ�C~k7�aǭE�}V�Auڿ.�3w�:�s�cѹ�[Y���� O���*�/)(p�uQ��jB�I�4Xi����YmJ����"� &��M����^Z̋x��Ww)�&3�O�);k�A��R*���F�kZL�nv�[9�b��u,�('9j�A��4�9k�1t�s�8B\�{�+�db�jdJ	[Ԣ�����=�:=rnf%�^�=[��u��^�ف���5.�$+z�!��'�O���nQ]/�r��p�14�P�Bg�� B�l�Ӹ��#��L�|%<|Ȏּ+�:o~[�B4%@�Z���΅���xqB۸I�az�x��h'�j�T�!O���Cg�m�tx�`x�tx�\x���;9�D����"�QM���>ާ�"��L�����n���&��Y2ۛ���W 3_��|%2�	?�܈�c�A����Y�,STJ�;���l�?']R���v=����^�q? �  >+�      �   L   x���1��;��E�W.�K}� \#G�]q����=�&	�B~�\�ڍV{�n/:�C��D�r����E�      �      x�34�4����� HO      �   �  x��TKn�@]�N�Mw�ٕ�mY��n�m �qnӳ�b�HN/�Iv�����w��S0���:wt{
@�V.k�)8��3y�lO��<$��� ;�iBY�`��:��P"���˼ �ZVRZy�C�|Y��u�iP�m�^��{�ap4��b������Q(���ۻh-�C"��Q'�̓�H�:���.��<�g9����yR�̆x��of���e�·�M��T�\�#�͜7�?�|VjR͚8
��"�`�uӚ�5;������q�>��רPǾ�p�A�*8��A���eI,j�ܖ{��Y%�^�qq�S,|'|�UN�QXw1̍���mj�����X��}�f]o7f[��TC�|�����S���ƴ��܅��wI���ǯ�j���T���1��W]U�_]%      �   (   x�3�4�4�4202�54�5�1��L.SNSNr1z\\\ 1�	�      �     x�mU�n�F}��b���K�-PAP��(�>�eD�ȭ���^$�s�	���X�,Gv��ڝ�9�̙�����Nb�wA��8	�zӳKR}t�k��-[:O�i���Sq��
�>'��e�G���0�-���Sb=�<p�j�ڮ��z��_5�4�V+�5�|M�c�mʁm��q��~��,�2S�-��;&��]`��<ƽzA�L}	���L����|�)��H������׀��Ƹ��<x�W?�G��7���A�~�G �#��i��O*U�?��̈s,�-&� �!�=@m&�%
t� ���n��f��~[o�� �H�3q0-7�oڰr� H&qŽ���J�\�Bf��h���3��QT��L.�]�﬉�t��6Q8�2r:ki'��׈ڝ#% /��p�K��x6��?@6�"؟|N�������F�� #�N1�
� 0�V�#.kj+1�(aTK(��Ii!���$�%ᅟ&����_�?�$��	���Z��$�)^����ϮWe8ӕyyH~�)��������(��>O>(�#0�3~��n�dϘ�Ӿ$yL˒E�¡h�]����ӫ�ٵh| p@Ғ�$5~�K��ٍ۳kO���7B�����d�f�P�E?
<�|h2��� ��1��rP�����b�!�p\A��T�o����������l�y;�TϦ@�ӯ�����f�,ڐ��T��k�)�N�j��4I�JW]���p�J}�)R=�\��xϡ�� *l�J�޼Y�!S�7;��=v3 UR-�X^�ʩ���*�X8�T�N�5a;\��q��:��yC���c�=rD���Z4$#@���gх'��oѕ��i/�X��#g�ȗ��'������>���l���O���fa�4�'�� �l� ����t��\J>q�:'��u��D� AI��ي~����3�΢O��|�tj� �{r���R����O���'�]�p��]�S��f��G'��|WwRc��'IjY�sY��y�"��ϖm�uV�?��b�	}�      �      x������ � �      �   H  x��U�n�8=�_�H۲cg���-���]��=�2��
Q�TIш��}C�F�EP� �$r��͛7�L}���:r�R��Ͽ��q��)�[�=�@�gYߑ�(P�s0T{�������658P�ޒk�ڐ��-�6ES�f��f��4��a��8Ǳ�
9s얂n�MH�A�QW�!�4��rm������;�IX��@a�K��l�ɂ��<�$�q��8Z!������HY�Բ( �W=U�>!�\?Pg���Ya����|�@�M���_�*/P��ߚ��ZM&겸,��l��-g��b9������o4Q_Rd�W�͑U�95�X�f}hc|<1���t�G�w8�	�E�M�qt%�f�BϲX��7���;�
���x�.�Ӣ�i�C鐫��,����ǊƗCA���i=S�/�QAP���a�-��x1{S�eJ��*����A�^�����������)�rYʖ,}r��n�3'I���P�=�q'�Mv���-������A_��������W����,�^���έ�w��u��eũ��e�㣖�。8o�Ĭ�q��M�V2�+,%F��b�3����=�i�M���c��]sh�4�˓p$�	�b+�$��Q(�B��A����,�}�/˧}��{����//L���x<V3u��]�����;K�����(p]�§�on�GK�1�Ї���.J5�~"����l~N�._�}2V�&�B�]~)���{v��y����S�L�<+/�w���*�\�����v�f��w�k2M_Ӧu�a���;��μ�ְ r�=pz��wz�6�A����6���S}/F��/
��      �   1   x���	  ���0��u���!�R�شO�Z�N���ܜ���Y      �      x������ � �      �      x������ � �      �   J   x�3�tI,�,�L�KI�4�41�2�t-NN�I�+I
s�p���9�\��>�
E�%�
��!�ƜF�\1z\\\ ��J      �   G   x�3�tI,�,�L�KI��2�t�OIMO,V�K,K,*�Wp�/*JM,�44�2�t��SpO,��42����� m��      �   ,   x�3�4�4�2�4�4�24�B.C#e�L�P�L��qqq �N|      �     x�mͻV�0 ��9}
�	--�H�Jo8�H#Ds��By+��S��Ŀ�Ӈ@B5�Ln=���[u�q�V�0i!�e�c�-��ھ˝T�����t2�6&u��ˏ�O�h�<�'m�@��nM*<ly`̄h@D�Jk���߂�^��'Gw���y��Kg&��WŰV]R=��w�y9zz�� ����+�FVD��{��I�����t�4�x���q${�Y� ��{^"X�T�NG�üh*w��"��u�pǱ^�eYߐ�oa     