PGDMP         +                z         	   ACTMainDB    13.2    13.2 ?    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    1099306 	   ACTMainDB    DATABASE     h   CREATE DATABASE "ACTMainDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE "ACTMainDB";
                postgres    false            ?            1259    1099307 	   itinerary    TABLE     X   CREATE TABLE public.itinerary (
    id integer NOT NULL,
    userid integer NOT NULL
);
    DROP TABLE public.itinerary;
       public         heap    postgres    false            ?            1259    1099310    Itinerario_ID_seq    SEQUENCE     ?   ALTER TABLE public.itinerary ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Itinerario_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    200            ?            1259    1099312    sponsor    TABLE     y   CREATE TABLE public.sponsor (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    image_id integer
);
    DROP TABLE public.sponsor;
       public         heap    postgres    false            ?            1259    1099315    Patrocinador_ID_seq    SEQUENCE     ?   ALTER TABLE public.sponsor ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Patrocinador_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    202            ?            1259    1099317    admin    TABLE     Y   CREATE TABLE public.admin (
    admin_id bigint NOT NULL,
    user_id bigint NOT NULL
);
    DROP TABLE public.admin;
       public         heap    postgres    false            ?            1259    1099320    admin_admin_id_seq    SEQUENCE     ?   ALTER TABLE public.admin ALTER COLUMN admin_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.admin_admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    204            ?            1259    1099322 	   companion    TABLE     ?   CREATE TABLE public.companion (
    id integer NOT NULL,
    identification character varying(20) NOT NULL,
    age character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL
);
    DROP TABLE public.companion;
       public         heap    postgres    false            ?            1259    1099325    companion_id_seq    SEQUENCE     ?   ALTER TABLE public.companion ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.companion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    206            ?            1259    1099327    companionxreservation    TABLE     ?   CREATE TABLE public.companionxreservation (
    id integer NOT NULL,
    reservation_id integer NOT NULL,
    companion_id integer NOT NULL
);
 )   DROP TABLE public.companionxreservation;
       public         heap    postgres    false            ?            1259    1099330    companionxreservation_id_seq    SEQUENCE     ?   ALTER TABLE public.companionxreservation ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.companionxreservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    208            ?            1259    1099332    edition    TABLE     ?   CREATE TABLE public.edition (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    details character varying(500),
    date character varying(50),
    current boolean NOT NULL
);
    DROP TABLE public.edition;
       public         heap    postgres    false            ?            1259    1099338    edicion_ID_seq    SEQUENCE     ?   ALTER TABLE public.edition ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."edicion_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    210            ?            1259    1099340    event    TABLE     }   CREATE TABLE public.event (
    id integer NOT NULL,
    placeid integer NOT NULL,
    start_hour text,
    end_hour text
);
    DROP TABLE public.event;
       public         heap    postgres    false            ?            1259    1099346    evento_ID_seq    SEQUENCE     ?   ALTER TABLE public.event ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."evento_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    212            ?            1259    1099348    eventxitinerary    TABLE     ?   CREATE TABLE public.eventxitinerary (
    id integer NOT NULL,
    itineraryid integer NOT NULL,
    eventid integer NOT NULL
);
 #   DROP TABLE public.eventxitinerary;
       public         heap    postgres    false            ?            1259    1099351    eventoxitinerario_ID_seq    SEQUENCE     ?   ALTER TABLE public.eventxitinerary ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."eventoxitinerario_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            ?            1259    1099353    image    TABLE     j   CREATE TABLE public.image (
    image_id integer NOT NULL,
    name text,
    drive_path text NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            ?            1259    1099359    image_image_id_seq    SEQUENCE     ?   ALTER TABLE public.image ALTER COLUMN image_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.image_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            ?            1259    1099361    images_edition    TABLE     ?   CREATE TABLE public.images_edition (
    images_edition_id integer NOT NULL,
    edition_id integer NOT NULL,
    image_id integer NOT NULL
);
 "   DROP TABLE public.images_edition;
       public         heap    postgres    false            ?            1259    1099364 $   images_edition_images_edition_id_seq    SEQUENCE     ?   ALTER TABLE public.images_edition ALTER COLUMN images_edition_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.images_edition_images_edition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            ?            1259    1099366    place    TABLE     p  CREATE TABLE public.place (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    details character varying(500) NOT NULL,
    image_id integer,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    category character varying(100),
    pricerange integer,
    link text,
    reservation_id integer,
    score integer
);
    DROP TABLE public.place;
       public         heap    postgres    false            ?            1259    1099372    lugar_ID_seq    SEQUENCE     ?   ALTER TABLE public.place ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."lugar_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            ?            1259    1099374    placexroute    TABLE     y   CREATE TABLE public.placexroute (
    id integer NOT NULL,
    routeid integer NOT NULL,
    placeid integer NOT NULL
);
    DROP TABLE public.placexroute;
       public         heap    postgres    false            ?            1259    1099377    lugarxruta_ID_seq    SEQUENCE     ?   ALTER TABLE public.placexroute ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."lugarxruta_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            ?            1259    1099379 
   membership    TABLE     ?   CREATE TABLE public.membership (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    details character varying(1500) NOT NULL,
    price numeric(8,2) NOT NULL,
    image_id integer
);
    DROP TABLE public.membership;
       public         heap    postgres    false            ?            1259    1099385    membershipxuser    TABLE     ?   CREATE TABLE public.membershipxuser (
    id integer NOT NULL,
    userid integer NOT NULL,
    membershipid integer NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL
);
 #   DROP TABLE public.membershipxuser;
       public         heap    postgres    false            ?            1259    1099388    membresia_ID_seq    SEQUENCE     ?   ALTER TABLE public.membership ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."membresia_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            ?            1259    1099390    membresiaxpersona_ID_seq    SEQUENCE     ?   ALTER TABLE public.membershipxuser ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."membresiaxpersona_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    225            ?            1259    1099392    news    TABLE     ?   CREATE TABLE public.news (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description character varying(1200) NOT NULL,
    image_id integer,
    date date,
    link character varying(200)
);
    DROP TABLE public.news;
       public         heap    postgres    false            ?            1259    1099398    news_id_seq    SEQUENCE     ?   ALTER TABLE public.news ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            ?            1259    1099400    normal_user    TABLE     e   CREATE TABLE public.normal_user (
    normal_user_id bigint NOT NULL,
    user_id bigint NOT NULL
);
    DROP TABLE public.normal_user;
       public         heap    postgres    false            ?            1259    1099403    normal_user_normal_user_id_seq    SEQUENCE     ?   ALTER TABLE public.normal_user ALTER COLUMN normal_user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.normal_user_normal_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230            ?            1259    1099405    sponsorxedition    TABLE     ?   CREATE TABLE public.sponsorxedition (
    "ID" integer NOT NULL,
    editionid integer NOT NULL,
    sponsorid integer NOT NULL
);
 #   DROP TABLE public.sponsorxedition;
       public         heap    postgres    false            ?            1259    1099408    patrocinadorxedicion_ID_seq    SEQUENCE     ?   ALTER TABLE public.sponsorxedition ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."patrocinadorxedicion_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232            ?            1259    1099410    reservation    TABLE     ?  CREATE TABLE public.reservation (
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
       public         heap    postgres    false            ?            1259    1099413    reservation_id_seq    SEQUENCE     ?   ALTER TABLE public.reservation ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    234            ?            1259    1099415    reservationxuser    TABLE     ?   CREATE TABLE public.reservationxuser (
    id integer NOT NULL,
    user_id integer NOT NULL,
    reservation_id integer NOT NULL
);
 $   DROP TABLE public.reservationxuser;
       public         heap    postgres    false            ?            1259    1099418    reservationxuser_id_seq    SEQUENCE     ?   ALTER TABLE public.reservationxuser ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservationxuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    236            ?            1259    1099420    route    TABLE     x   CREATE TABLE public.route (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    editionid integer
);
    DROP TABLE public.route;
       public         heap    postgres    false            ?            1259    1099423    ruta_ID_seq    SEQUENCE     ?   ALTER TABLE public.route ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ruta_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    238            ?            1259    1099425    user    TABLE     ?  CREATE TABLE public."user" (
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
       public         heap    postgres    false            ?            1259    1099431    usuario_ID_seq    SEQUENCE     ?   ALTER TABLE public."user" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."usuario_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    240            f          0    1099317    admin 
   TABLE DATA           2   COPY public.admin (admin_id, user_id) FROM stdin;
    public          postgres    false    204   W?       h          0    1099322 	   companion 
   TABLE DATA           M   COPY public.companion (id, identification, age, name, last_name) FROM stdin;
    public          postgres    false    206   y?       j          0    1099327    companionxreservation 
   TABLE DATA           Q   COPY public.companionxreservation (id, reservation_id, companion_id) FROM stdin;
    public          postgres    false    208   ??       l          0    1099332    edition 
   TABLE DATA           C   COPY public.edition (id, name, details, date, current) FROM stdin;
    public          postgres    false    210   ??       n          0    1099340    event 
   TABLE DATA           B   COPY public.event (id, placeid, start_hour, end_hour) FROM stdin;
    public          postgres    false    212   Н       p          0    1099348    eventxitinerary 
   TABLE DATA           C   COPY public.eventxitinerary (id, itineraryid, eventid) FROM stdin;
    public          postgres    false    214   ??       r          0    1099353    image 
   TABLE DATA           ;   COPY public.image (image_id, name, drive_path) FROM stdin;
    public          postgres    false    216   
?       t          0    1099361    images_edition 
   TABLE DATA           Q   COPY public.images_edition (images_edition_id, edition_id, image_id) FROM stdin;
    public          postgres    false    218   ??       b          0    1099307 	   itinerary 
   TABLE DATA           /   COPY public.itinerary (id, userid) FROM stdin;
    public          postgres    false    200   	?       z          0    1099379 
   membership 
   TABLE DATA           H   COPY public.membership (id, name, details, price, image_id) FROM stdin;
    public          postgres    false    224   &?       {          0    1099385    membershipxuser 
   TABLE DATA           W   COPY public.membershipxuser (id, userid, membershipid, startdate, enddate) FROM stdin;
    public          postgres    false    225   ֠       ~          0    1099392    news 
   TABLE DATA           L   COPY public.news (id, title, description, image_id, date, link) FROM stdin;
    public          postgres    false    228   ??       ?          0    1099400    normal_user 
   TABLE DATA           >   COPY public.normal_user (normal_user_id, user_id) FROM stdin;
    public          postgres    false    230   ?       v          0    1099366    place 
   TABLE DATA           ?   COPY public.place (id, name, details, image_id, latitude, longitude, category, pricerange, link, reservation_id, score) FROM stdin;
    public          postgres    false    220   -?       x          0    1099374    placexroute 
   TABLE DATA           ;   COPY public.placexroute (id, routeid, placeid) FROM stdin;
    public          postgres    false    222   J?       ?          0    1099410    reservation 
   TABLE DATA           |   COPY public.reservation (id, place_id, identification, age, name, lastname, email, phone_number, is_first_time) FROM stdin;
    public          postgres    false    234   g?       ?          0    1099415    reservationxuser 
   TABLE DATA           G   COPY public.reservationxuser (id, user_id, reservation_id) FROM stdin;
    public          postgres    false    236   ??       ?          0    1099420    route 
   TABLE DATA           4   COPY public.route (id, name, editionid) FROM stdin;
    public          postgres    false    238   ??       d          0    1099312    sponsor 
   TABLE DATA           5   COPY public.sponsor (id, name, image_id) FROM stdin;
    public          postgres    false    202   ??       ?          0    1099405    sponsorxedition 
   TABLE DATA           E   COPY public.sponsorxedition ("ID", editionid, sponsorid) FROM stdin;
    public          postgres    false    232   ۡ       ?          0    1099425    user 
   TABLE DATA           q   COPY public."user" (id, name, lastname, email, password, identification, phone_number, address, age) FROM stdin;
    public          postgres    false    240   ??       ?           0    0    Itinerario_ID_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Itinerario_ID_seq"', 3, true);
          public          postgres    false    201            ?           0    0    Patrocinador_ID_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Patrocinador_ID_seq"', 5, true);
          public          postgres    false    203            ?           0    0    admin_admin_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_admin_id_seq', 2, true);
          public          postgres    false    205            ?           0    0    companion_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.companion_id_seq', 1, false);
          public          postgres    false    207            ?           0    0    companionxreservation_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.companionxreservation_id_seq', 1, false);
          public          postgres    false    209            ?           0    0    edicion_ID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."edicion_ID_seq"', 8, true);
          public          postgres    false    211            ?           0    0    evento_ID_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."evento_ID_seq"', 3, true);
          public          postgres    false    213            ?           0    0    eventoxitinerario_ID_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."eventoxitinerario_ID_seq"', 4, true);
          public          postgres    false    215            ?           0    0    image_image_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.image_image_id_seq', 48, true);
          public          postgres    false    217            ?           0    0 $   images_edition_images_edition_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.images_edition_images_edition_id_seq', 30, true);
          public          postgres    false    219            ?           0    0    lugar_ID_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."lugar_ID_seq"', 6, true);
          public          postgres    false    221            ?           0    0    lugarxruta_ID_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."lugarxruta_ID_seq"', 13, true);
          public          postgres    false    223            ?           0    0    membresia_ID_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."membresia_ID_seq"', 5, true);
          public          postgres    false    226            ?           0    0    membresiaxpersona_ID_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."membresiaxpersona_ID_seq"', 5, true);
          public          postgres    false    227            ?           0    0    news_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.news_id_seq', 4, true);
          public          postgres    false    229            ?           0    0    normal_user_normal_user_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.normal_user_normal_user_id_seq', 1, false);
          public          postgres    false    231            ?           0    0    patrocinadorxedicion_ID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."patrocinadorxedicion_ID_seq"', 15, true);
          public          postgres    false    233            ?           0    0    reservation_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.reservation_id_seq', 1, false);
          public          postgres    false    235            ?           0    0    reservationxuser_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.reservationxuser_id_seq', 1, false);
          public          postgres    false    237            ?           0    0    ruta_ID_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."ruta_ID_seq"', 8, true);
          public          postgres    false    239            ?           0    0    usuario_ID_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."usuario_ID_seq"', 10, true);
          public          postgres    false    241            ?           2606    1099434    itinerary Itinerario_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.itinerary
    ADD CONSTRAINT "Itinerario_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.itinerary DROP CONSTRAINT "Itinerario_pkey";
       public            postgres    false    200            ?           2606    1099436    sponsor Patrocinador_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.sponsor
    ADD CONSTRAINT "Patrocinador_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.sponsor DROP CONSTRAINT "Patrocinador_pkey";
       public            postgres    false    202            ?           2606    1099438    admin admin_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (admin_id);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            postgres    false    204            ?           2606    1099440    edition edicion_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.edition
    ADD CONSTRAINT edicion_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.edition DROP CONSTRAINT edicion_pkey;
       public            postgres    false    210            ?           2606    1099442    event evento_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.event
    ADD CONSTRAINT evento_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.event DROP CONSTRAINT evento_pkey;
       public            postgres    false    212            ?           2606    1099444 &   eventxitinerary eventoxitinerario_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.eventxitinerary
    ADD CONSTRAINT eventoxitinerario_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.eventxitinerary DROP CONSTRAINT eventoxitinerario_pkey;
       public            postgres    false    214            ?           2606    1099446    image image_id_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_id_pkey PRIMARY KEY (image_id);
 =   ALTER TABLE ONLY public.image DROP CONSTRAINT image_id_pkey;
       public            postgres    false    216            ?           2606    1099448 %   images_edition images_edition_id_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.images_edition
    ADD CONSTRAINT images_edition_id_pkey PRIMARY KEY (images_edition_id);
 O   ALTER TABLE ONLY public.images_edition DROP CONSTRAINT images_edition_id_pkey;
       public            postgres    false    218            ?           2606    1099450    place lugar_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.place
    ADD CONSTRAINT lugar_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.place DROP CONSTRAINT lugar_pkey;
       public            postgres    false    220            ?           2606    1099452    placexroute lugarxruta_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.placexroute
    ADD CONSTRAINT lugarxruta_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.placexroute DROP CONSTRAINT lugarxruta_pkey;
       public            postgres    false    222            ?           2606    1099454    membership membresia_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.membership
    ADD CONSTRAINT membresia_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.membership DROP CONSTRAINT membresia_pkey;
       public            postgres    false    224            ?           2606    1099456 &   membershipxuser membresiaxpersona_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.membershipxuser
    ADD CONSTRAINT membresiaxpersona_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.membershipxuser DROP CONSTRAINT membresiaxpersona_pkey;
       public            postgres    false    225            ?           2606    1099458    news news_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.news DROP CONSTRAINT news_pkey;
       public            postgres    false    228            ?           2606    1099460    normal_user normal_user_id_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.normal_user
    ADD CONSTRAINT normal_user_id_pkey PRIMARY KEY (normal_user_id);
 I   ALTER TABLE ONLY public.normal_user DROP CONSTRAINT normal_user_id_pkey;
       public            postgres    false    230            ?           2606    1099462 )   sponsorxedition patrocinadorxedicion_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.sponsorxedition
    ADD CONSTRAINT patrocinadorxedicion_pkey PRIMARY KEY ("ID");
 S   ALTER TABLE ONLY public.sponsorxedition DROP CONSTRAINT patrocinadorxedicion_pkey;
       public            postgres    false    232            ?           2606    1099464    companion pk_companions 
   CONSTRAINT     U   ALTER TABLE ONLY public.companion
    ADD CONSTRAINT pk_companions PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.companion DROP CONSTRAINT pk_companions;
       public            postgres    false    206            ?           2606    1099466 .   companionxreservation pk_companionxreservation 
   CONSTRAINT     l   ALTER TABLE ONLY public.companionxreservation
    ADD CONSTRAINT pk_companionxreservation PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.companionxreservation DROP CONSTRAINT pk_companionxreservation;
       public            postgres    false    208            ?           2606    1099468    reservation reservation_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservation_pkey;
       public            postgres    false    234            ?           2606    1099470 &   reservationxuser reservationxuser_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.reservationxuser
    ADD CONSTRAINT reservationxuser_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.reservationxuser DROP CONSTRAINT reservationxuser_pkey;
       public            postgres    false    236            ?           2606    1099472    route ruta_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.route
    ADD CONSTRAINT ruta_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.route DROP CONSTRAINT ruta_pkey;
       public            postgres    false    238            ?           2606    1099474    user usuario_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY public."user" DROP CONSTRAINT usuario_pkey;
       public            postgres    false    240            ?           2606    1099475    admin admin_user_fk    FK CONSTRAINT     s   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_user_fk FOREIGN KEY (user_id) REFERENCES public."user"(id);
 =   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_user_fk;
       public          postgres    false    240    204    3018            ?           2606    1099480 /   sponsorxedition edicion_patrocinadorxedicion_FK    FK CONSTRAINT     ?   ALTER TABLE ONLY public.sponsorxedition
    ADD CONSTRAINT "edicion_patrocinadorxedicion_FK" FOREIGN KEY (editionid) REFERENCES public.edition(id) NOT VALID;
 [   ALTER TABLE ONLY public.sponsorxedition DROP CONSTRAINT "edicion_patrocinadorxedicion_FK";
       public          postgres    false    210    232    2988            ?           2606    1099485 +   eventxitinerary eventoxitinerario_evento_FK    FK CONSTRAINT     ?   ALTER TABLE ONLY public.eventxitinerary
    ADD CONSTRAINT "eventoxitinerario_evento_FK" FOREIGN KEY (eventid) REFERENCES public.event(id);
 W   ALTER TABLE ONLY public.eventxitinerary DROP CONSTRAINT "eventoxitinerario_evento_FK";
       public          postgres    false    214    212    2990            ?           2606    1099490 /   eventxitinerary eventoxitinerario_itinerario_FK    FK CONSTRAINT     ?   ALTER TABLE ONLY public.eventxitinerary
    ADD CONSTRAINT "eventoxitinerario_itinerario_FK" FOREIGN KEY (itineraryid) REFERENCES public.itinerary(id);
 [   ALTER TABLE ONLY public.eventxitinerary DROP CONSTRAINT "eventoxitinerario_itinerario_FK";
       public          postgres    false    200    214    2978            ?           2606    1099495 %   companionxreservation fk_companion_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.companionxreservation
    ADD CONSTRAINT fk_companion_id FOREIGN KEY (companion_id) REFERENCES public.companion(id);
 O   ALTER TABLE ONLY public.companionxreservation DROP CONSTRAINT fk_companion_id;
       public          postgres    false    208    2984    206            ?           2606    1099500 '   companionxreservation fk_reservation_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.companionxreservation
    ADD CONSTRAINT fk_reservation_id FOREIGN KEY (reservation_id) REFERENCES public.reservation(id);
 Q   ALTER TABLE ONLY public.companionxreservation DROP CONSTRAINT fk_reservation_id;
       public          postgres    false    234    3012    208            ?           2606    1099505 (   images_edition images_edition_edition_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.images_edition
    ADD CONSTRAINT images_edition_edition_fk FOREIGN KEY (edition_id) REFERENCES public.edition(id);
 R   ALTER TABLE ONLY public.images_edition DROP CONSTRAINT images_edition_edition_fk;
       public          postgres    false    218    210    2988            ?           2606    1099510    event lugar_evento_FK    FK CONSTRAINT     ?   ALTER TABLE ONLY public.event
    ADD CONSTRAINT "lugar_evento_FK" FOREIGN KEY (placeid) REFERENCES public.place(id) NOT VALID;
 A   ALTER TABLE ONLY public.event DROP CONSTRAINT "lugar_evento_FK";
       public          postgres    false    2998    212    220            ?           2606    1099515    placexroute lugar_lugarxruta_FK    FK CONSTRAINT     ?   ALTER TABLE ONLY public.placexroute
    ADD CONSTRAINT "lugar_lugarxruta_FK" FOREIGN KEY (placeid) REFERENCES public.place(id) NOT VALID;
 K   ALTER TABLE ONLY public.placexroute DROP CONSTRAINT "lugar_lugarxruta_FK";
       public          postgres    false    220    222    2998            ?           2606    1099520    membership membership_image_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.membership
    ADD CONSTRAINT membership_image_fk FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 H   ALTER TABLE ONLY public.membership DROP CONSTRAINT membership_image_fk;
       public          postgres    false    216    224    2994            ?           2606    1099525 .   membershipxuser membresia_membresiaxpersona_FK    FK CONSTRAINT     ?   ALTER TABLE ONLY public.membershipxuser
    ADD CONSTRAINT "membresia_membresiaxpersona_FK" FOREIGN KEY (membershipid) REFERENCES public.membership(id) NOT VALID;
 Z   ALTER TABLE ONLY public.membershipxuser DROP CONSTRAINT "membresia_membresiaxpersona_FK";
       public          postgres    false    224    225    3002            ?           2606    1099530    news news_image_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_image_id_fkey FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 A   ALTER TABLE ONLY public.news DROP CONSTRAINT news_image_id_fkey;
       public          postgres    false    216    228    2994            ?           2606    1099535    normal_user normal_user_user_fk    FK CONSTRAINT        ALTER TABLE ONLY public.normal_user
    ADD CONSTRAINT normal_user_user_fk FOREIGN KEY (user_id) REFERENCES public."user"(id);
 I   ALTER TABLE ONLY public.normal_user DROP CONSTRAINT normal_user_user_fk;
       public          postgres    false    240    230    3018            ?           2606    1099540 4   sponsorxedition patrocinador_patrocinadorxedicion_FK    FK CONSTRAINT     ?   ALTER TABLE ONLY public.sponsorxedition
    ADD CONSTRAINT "patrocinador_patrocinadorxedicion_FK" FOREIGN KEY (sponsorid) REFERENCES public.sponsor(id) NOT VALID;
 `   ALTER TABLE ONLY public.sponsorxedition DROP CONSTRAINT "patrocinador_patrocinadorxedicion_FK";
       public          postgres    false    202    232    2980            ?           2606    1099545    place place_image_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public.place
    ADD CONSTRAINT place_image_fk FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 >   ALTER TABLE ONLY public.place DROP CONSTRAINT place_image_fk;
       public          postgres    false    2994    220    216            ?           2606    1099550 %   reservation reservation_place_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.place(id);
 O   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservation_place_id_fkey;
       public          postgres    false    234    220    2998            ?           2606    1099555 .   reservationxuser reservationxuser_user_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.reservationxuser
    ADD CONSTRAINT reservationxuser_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 X   ALTER TABLE ONLY public.reservationxuser DROP CONSTRAINT reservationxuser_user_id_fkey;
       public          postgres    false    236    240    3018            ?           2606    1099560    placexroute ruta_lugarxruta_FK    FK CONSTRAINT     ?   ALTER TABLE ONLY public.placexroute
    ADD CONSTRAINT "ruta_lugarxruta_FK" FOREIGN KEY (routeid) REFERENCES public.route(id) NOT VALID;
 J   ALTER TABLE ONLY public.placexroute DROP CONSTRAINT "ruta_lugarxruta_FK";
       public          postgres    false    222    3016    238            ?           2606    1099565    sponsor sponsor_image_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.sponsor
    ADD CONSTRAINT sponsor_image_fk FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 B   ALTER TABLE ONLY public.sponsor DROP CONSTRAINT sponsor_image_fk;
       public          postgres    false    216    202    2994            ?           2606    1099570    itinerary usuario_itinerario_FK    FK CONSTRAINT     ?   ALTER TABLE ONLY public.itinerary
    ADD CONSTRAINT "usuario_itinerario_FK" FOREIGN KEY (userid) REFERENCES public."user"(id) NOT VALID;
 K   ALTER TABLE ONLY public.itinerary DROP CONSTRAINT "usuario_itinerario_FK";
       public          postgres    false    200    3018    240            ?           2606    1099575 ,   membershipxuser usuario_membresiaxpersona_FK    FK CONSTRAINT     ?   ALTER TABLE ONLY public.membershipxuser
    ADD CONSTRAINT "usuario_membresiaxpersona_FK" FOREIGN KEY (userid) REFERENCES public."user"(id) NOT VALID;
 X   ALTER TABLE ONLY public.membershipxuser DROP CONSTRAINT "usuario_membresiaxpersona_FK";
       public          postgres    false    240    3018    225            f      x?3?44?????? #O      h      x?????? ? ?      j      x?????? ? ?      l      x?????? ? ?      n      x?????? ? ?      p      x?????? ? ?      r   ?   x???]n?0  ???.???e?!?+???ً???1?E?m<????M??q7???h??<?>myǼF?F0???w?+?/A?#???Ņ?R????3%????)?? 6?qW??f????????Q??k???-G?=M???????Urnd??S?W????.?v??:?!(Z&????q???L?|l?s?6??손*?۲5+??A??'gT      t      x?????? ? ?      b      x?????? ? ?      z   ?  x??TKn?@]?N?Mw?ٕ?mY???n?m ?qnӳ?b?HN/?Iv??????w??S0???:wt{
@?V.k?)8??3y?lO??<$???? ;?iBY?`??:??P"???˼ ?ZVRZy?C?|Y??u?iP?m?^??{?ap4???b??????Q(????ۻh-?C"??Q'?̓?H?:???.??<?g9????yR?̆x??of????e?·?M??T?\??#?͜7???|VjR͚8
??"?`?uӚ??5;??????q?>??רPǾ?p?A?*8??A???eI,j?ܖ{??Y%?^?qq?S,|'|?UN?QXw1̍???mj?????X??}?f]o7f[??TC?|?????S???ƴ??܅??wI???ǯ?j???T???1??W]U?_]%      {      x?????? ? ?      ~      x?????? ? ?      ?      x?????? ? ?      v      x?????? ? ?      x      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      d      x?????? ? ?      ?      x?????? ? ?      ?   B   x?34?tL????t,H???L??Lqr3s???s9??M b?.?P ???_Z??id????? TK9     