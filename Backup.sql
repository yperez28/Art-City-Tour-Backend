PGDMP         3            
    z         	   ACTMainDB    13.2    13.2 y    {           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            |           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            }           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ~           1262    950540 	   ACTMainDB    DATABASE     h   CREATE DATABASE "ACTMainDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE "ACTMainDB";
                postgres    false            �            1259    958904 	   itinerary    TABLE     X   CREATE TABLE public.itinerary (
    id integer NOT NULL,
    userid integer NOT NULL
);
    DROP TABLE public.itinerary;
       public         heap    postgres    false            �            1259    958902    Itinerario_ID_seq    SEQUENCE     �   ALTER TABLE public.itinerary ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Itinerario_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    958829    sponsor    TABLE     y   CREATE TABLE public.sponsor (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    image_id integer
);
    DROP TABLE public.sponsor;
       public         heap    postgres    false            �            1259    958827    Patrocinador_ID_seq    SEQUENCE     �   ALTER TABLE public.sponsor ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Patrocinador_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    203            �            1259    1049417 	   companion    TABLE     �   CREATE TABLE public.companion (
    id integer NOT NULL,
    identification character varying(20) NOT NULL,
    age character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL
);
    DROP TABLE public.companion;
       public         heap    postgres    false            �            1259    1049420    companion_id_seq    SEQUENCE     �   ALTER TABLE public.companion ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.companion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    236            �            1259    1008327    companionxreservation    TABLE     �   CREATE TABLE public.companionxreservation (
    id integer NOT NULL,
    reservation_id integer NOT NULL,
    user_id integer NOT NULL
);
 )   DROP TABLE public.companionxreservation;
       public         heap    postgres    false            �            1259    1008325    companionxreservation_id_seq    SEQUENCE     �   ALTER TABLE public.companionxreservation ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.companionxreservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233            �            1259    958839    edition    TABLE     �   CREATE TABLE public.edition (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    details character varying(500),
    date character varying(50),
    current boolean NOT NULL
);
    DROP TABLE public.edition;
       public         heap    postgres    false            �            1259    958837    edicion_ID_seq    SEQUENCE     �   ALTER TABLE public.edition ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."edicion_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    205            �            1259    958897    event    TABLE     �   CREATE TABLE public.event (
    id integer NOT NULL,
    placeid integer NOT NULL,
    start_hour time without time zone,
    end_hour time without time zone
);
    DROP TABLE public.event;
       public         heap    postgres    false            �            1259    958895    evento_ID_seq    SEQUENCE     �   ALTER TABLE public.event ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."evento_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    959000    eventxitinerary    TABLE     �   CREATE TABLE public.eventxitinerary (
    id integer NOT NULL,
    itineraryid integer NOT NULL,
    eventid integer NOT NULL
);
 #   DROP TABLE public.eventxitinerary;
       public         heap    postgres    false            �            1259    958998    eventoxitinerario_ID_seq    SEQUENCE     �   ALTER TABLE public.eventxitinerary ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."eventoxitinerario_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    1008257    image    TABLE     j   CREATE TABLE public.image (
    image_id integer NOT NULL,
    name text,
    drive_path text NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    1008255    image_image_id_seq    SEQUENCE     �   ALTER TABLE public.image ALTER COLUMN image_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.image_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    225            �            1259    1008267    images_edition    TABLE     �   CREATE TABLE public.images_edition (
    images_edition_id integer NOT NULL,
    edition_id integer NOT NULL,
    image_id integer NOT NULL
);
 "   DROP TABLE public.images_edition;
       public         heap    postgres    false            �            1259    1008265 $   images_edition_images_edition_id_seq    SEQUENCE     �   ALTER TABLE public.images_edition ALTER COLUMN images_edition_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.images_edition_images_edition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    227            �            1259    958856    place    TABLE     �   CREATE TABLE public.place (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    details character varying(500) NOT NULL,
    image_id integer,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL
);
    DROP TABLE public.place;
       public         heap    postgres    false            �            1259    958854    lugar_ID_seq    SEQUENCE     �   ALTER TABLE public.place ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."lugar_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            �            1259    958873    placexroute    TABLE     y   CREATE TABLE public.placexroute (
    id integer NOT NULL,
    routeid integer NOT NULL,
    placeid integer NOT NULL
);
    DROP TABLE public.placexroute;
       public         heap    postgres    false            �            1259    958871    lugarxruta_ID_seq    SEQUENCE     �   ALTER TABLE public.placexroute ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."lugarxruta_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    213            �            1259    958880 
   membership    TABLE     �   CREATE TABLE public.membership (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    details character varying(1500) NOT NULL,
    price numeric(8,2) NOT NULL,
    image_id integer
);
    DROP TABLE public.membership;
       public         heap    postgres    false            �            1259    958890    membershipxuser    TABLE     �   CREATE TABLE public.membershipxuser (
    id integer NOT NULL,
    userid integer NOT NULL,
    membershipid integer NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL
);
 #   DROP TABLE public.membershipxuser;
       public         heap    postgres    false            �            1259    958878    membresia_ID_seq    SEQUENCE     �   ALTER TABLE public.membership ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."membresia_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    958888    membresiaxpersona_ID_seq    SEQUENCE     �   ALTER TABLE public.membershipxuser ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."membresiaxpersona_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    1008302    news    TABLE     �   CREATE TABLE public.news (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description character varying(1200) NOT NULL,
    image_id integer,
    date date
);
    DROP TABLE public.news;
       public         heap    postgres    false            �            1259    1008300    news_id_seq    SEQUENCE     �   ALTER TABLE public.news ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    229            �            1259    958849    sponsorxedition    TABLE     �   CREATE TABLE public.sponsorxedition (
    "ID" integer NOT NULL,
    editionid integer NOT NULL,
    sponsorid integer NOT NULL
);
 #   DROP TABLE public.sponsorxedition;
       public         heap    postgres    false            �            1259    958847    patrocinadorxedicion_ID_seq    SEQUENCE     �   ALTER TABLE public.sponsorxedition ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."patrocinadorxedicion_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    207            �            1259    1008320    reservation    TABLE     }   CREATE TABLE public.reservation (
    id integer NOT NULL,
    place_id integer NOT NULL,
    first_time boolean NOT NULL
);
    DROP TABLE public.reservation;
       public         heap    postgres    false            �            1259    1008318    reservation_id_seq    SEQUENCE     �   ALTER TABLE public.reservation ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    231            �            1259    1008349    reservationxuser    TABLE     �   CREATE TABLE public.reservationxuser (
    id integer NOT NULL,
    user_id integer NOT NULL,
    reservation_id integer NOT NULL
);
 $   DROP TABLE public.reservationxuser;
       public         heap    postgres    false            �            1259    1008347    reservationxuser_id_seq    SEQUENCE     �   ALTER TABLE public.reservationxuser ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservationxuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    235            �            1259    958866    route    TABLE     x   CREATE TABLE public.route (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    editionid integer
);
    DROP TABLE public.route;
       public         heap    postgres    false            �            1259    958864    ruta_ID_seq    SEQUENCE     �   ALTER TABLE public.route ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ruta_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    211            �            1259    950543    user    TABLE     �  CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    lastname character varying(30) NOT NULL,
    email character varying(30) NOT NULL,
    password character varying(500) NOT NULL,
    identification character varying(30) NOT NULL,
    phone_number character varying(30) NOT NULL,
    address character varying(300) NOT NULL,
    age integer NOT NULL,
    image_id integer
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    950541    usuario_ID_seq    SEQUENCE     �   ALTER TABLE public."user" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."usuario_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    201            w          0    1049417 	   companion 
   TABLE DATA           M   COPY public.companion (id, identification, age, name, last_name) FROM stdin;
    public          postgres    false    236   ��       t          0    1008327    companionxreservation 
   TABLE DATA           L   COPY public.companionxreservation (id, reservation_id, user_id) FROM stdin;
    public          postgres    false    233   �       X          0    958839    edition 
   TABLE DATA           C   COPY public.edition (id, name, details, date, current) FROM stdin;
    public          postgres    false    205   1�       f          0    958897    event 
   TABLE DATA           B   COPY public.event (id, placeid, start_hour, end_hour) FROM stdin;
    public          postgres    false    219   ��       j          0    959000    eventxitinerary 
   TABLE DATA           C   COPY public.eventxitinerary (id, itineraryid, eventid) FROM stdin;
    public          postgres    false    223   �       l          0    1008257    image 
   TABLE DATA           ;   COPY public.image (image_id, name, drive_path) FROM stdin;
    public          postgres    false    225   �       n          0    1008267    images_edition 
   TABLE DATA           Q   COPY public.images_edition (images_edition_id, edition_id, image_id) FROM stdin;
    public          postgres    false    227   ��       h          0    958904 	   itinerary 
   TABLE DATA           /   COPY public.itinerary (id, userid) FROM stdin;
    public          postgres    false    221   �       b          0    958880 
   membership 
   TABLE DATA           H   COPY public.membership (id, name, details, price, image_id) FROM stdin;
    public          postgres    false    215   �       d          0    958890    membershipxuser 
   TABLE DATA           W   COPY public.membershipxuser (id, userid, membershipid, startdate, enddate) FROM stdin;
    public          postgres    false    217   ��       p          0    1008302    news 
   TABLE DATA           F   COPY public.news (id, title, description, image_id, date) FROM stdin;
    public          postgres    false    229   �       \          0    958856    place 
   TABLE DATA           Q   COPY public.place (id, name, details, image_id, latitude, longitude) FROM stdin;
    public          postgres    false    209   ��       `          0    958873    placexroute 
   TABLE DATA           ;   COPY public.placexroute (id, routeid, placeid) FROM stdin;
    public          postgres    false    213   8�       r          0    1008320    reservation 
   TABLE DATA           ?   COPY public.reservation (id, place_id, first_time) FROM stdin;
    public          postgres    false    231   y�       v          0    1008349    reservationxuser 
   TABLE DATA           G   COPY public.reservationxuser (id, user_id, reservation_id) FROM stdin;
    public          postgres    false    235   ��       ^          0    958866    route 
   TABLE DATA           4   COPY public.route (id, name, editionid) FROM stdin;
    public          postgres    false    211   ��       V          0    958829    sponsor 
   TABLE DATA           5   COPY public.sponsor (id, name, image_id) FROM stdin;
    public          postgres    false    203   �       Z          0    958849    sponsorxedition 
   TABLE DATA           E   COPY public.sponsorxedition ("ID", editionid, sponsorid) FROM stdin;
    public          postgres    false    207   X�       T          0    950543    user 
   TABLE DATA           {   COPY public."user" (id, name, lastname, email, password, identification, phone_number, address, age, image_id) FROM stdin;
    public          postgres    false    201   ��                  0    0    Itinerario_ID_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Itinerario_ID_seq"', 3, true);
          public          postgres    false    220            �           0    0    Patrocinador_ID_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Patrocinador_ID_seq"', 3, true);
          public          postgres    false    202            �           0    0    companion_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.companion_id_seq', 1, false);
          public          postgres    false    237            �           0    0    companionxreservation_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.companionxreservation_id_seq', 1, false);
          public          postgres    false    232            �           0    0    edicion_ID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."edicion_ID_seq"', 8, true);
          public          postgres    false    204            �           0    0    evento_ID_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."evento_ID_seq"', 2, true);
          public          postgres    false    218            �           0    0    eventoxitinerario_ID_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."eventoxitinerario_ID_seq"', 4, true);
          public          postgres    false    222            �           0    0    image_image_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.image_image_id_seq', 42, true);
          public          postgres    false    224            �           0    0 $   images_edition_images_edition_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.images_edition_images_edition_id_seq', 30, true);
          public          postgres    false    226            �           0    0    lugar_ID_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."lugar_ID_seq"', 4, true);
          public          postgres    false    208            �           0    0    lugarxruta_ID_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."lugarxruta_ID_seq"', 9, true);
          public          postgres    false    212            �           0    0    membresia_ID_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."membresia_ID_seq"', 5, true);
          public          postgres    false    214            �           0    0    membresiaxpersona_ID_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."membresiaxpersona_ID_seq"', 3, true);
          public          postgres    false    216            �           0    0    news_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.news_id_seq', 4, true);
          public          postgres    false    228            �           0    0    patrocinadorxedicion_ID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."patrocinadorxedicion_ID_seq"', 15, true);
          public          postgres    false    206            �           0    0    reservation_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.reservation_id_seq', 1, false);
          public          postgres    false    230            �           0    0    reservationxuser_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.reservationxuser_id_seq', 1, false);
          public          postgres    false    234            �           0    0    ruta_ID_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."ruta_ID_seq"', 5, true);
          public          postgres    false    210            �           0    0    usuario_ID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."usuario_ID_seq"', 9, true);
          public          postgres    false    200            �           2606    958908    itinerary Itinerario_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.itinerary
    ADD CONSTRAINT "Itinerario_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.itinerary DROP CONSTRAINT "Itinerario_pkey";
       public            postgres    false    221            �           2606    958836    sponsor Patrocinador_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.sponsor
    ADD CONSTRAINT "Patrocinador_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.sponsor DROP CONSTRAINT "Patrocinador_pkey";
       public            postgres    false    203            �           2606    1008331 0   companionxreservation companionxreservation_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.companionxreservation
    ADD CONSTRAINT companionxreservation_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.companionxreservation DROP CONSTRAINT companionxreservation_pkey;
       public            postgres    false    233            �           2606    958846    edition edicion_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.edition
    ADD CONSTRAINT edicion_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.edition DROP CONSTRAINT edicion_pkey;
       public            postgres    false    205            �           2606    958901    event evento_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.event
    ADD CONSTRAINT evento_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.event DROP CONSTRAINT evento_pkey;
       public            postgres    false    219            �           2606    959004 &   eventxitinerary eventoxitinerario_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.eventxitinerary
    ADD CONSTRAINT eventoxitinerario_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.eventxitinerary DROP CONSTRAINT eventoxitinerario_pkey;
       public            postgres    false    223            �           2606    1008264    image image_id_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_id_pkey PRIMARY KEY (image_id);
 =   ALTER TABLE ONLY public.image DROP CONSTRAINT image_id_pkey;
       public            postgres    false    225            �           2606    1008271 %   images_edition images_edition_id_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.images_edition
    ADD CONSTRAINT images_edition_id_pkey PRIMARY KEY (images_edition_id);
 O   ALTER TABLE ONLY public.images_edition DROP CONSTRAINT images_edition_id_pkey;
       public            postgres    false    227            �           2606    958863    place lugar_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.place
    ADD CONSTRAINT lugar_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.place DROP CONSTRAINT lugar_pkey;
       public            postgres    false    209            �           2606    958877    placexroute lugarxruta_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.placexroute
    ADD CONSTRAINT lugarxruta_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.placexroute DROP CONSTRAINT lugarxruta_pkey;
       public            postgres    false    213            �           2606    958887    membership membresia_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.membership
    ADD CONSTRAINT membresia_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.membership DROP CONSTRAINT membresia_pkey;
       public            postgres    false    215            �           2606    958894 &   membershipxuser membresiaxpersona_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.membershipxuser
    ADD CONSTRAINT membresiaxpersona_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.membershipxuser DROP CONSTRAINT membresiaxpersona_pkey;
       public            postgres    false    217            �           2606    1008309    news news_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.news DROP CONSTRAINT news_pkey;
       public            postgres    false    229            �           2606    958853 )   sponsorxedition patrocinadorxedicion_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.sponsorxedition
    ADD CONSTRAINT patrocinadorxedicion_pkey PRIMARY KEY ("ID");
 S   ALTER TABLE ONLY public.sponsorxedition DROP CONSTRAINT patrocinadorxedicion_pkey;
       public            postgres    false    207            �           2606    1049423    companion pk_companions 
   CONSTRAINT     U   ALTER TABLE ONLY public.companion
    ADD CONSTRAINT pk_companions PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.companion DROP CONSTRAINT pk_companions;
       public            postgres    false    236            �           2606    1008324    reservation reservation_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservation_pkey;
       public            postgres    false    231            �           2606    1008353 &   reservationxuser reservationxuser_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.reservationxuser
    ADD CONSTRAINT reservationxuser_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.reservationxuser DROP CONSTRAINT reservationxuser_pkey;
       public            postgres    false    235            �           2606    958870    route ruta_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.route
    ADD CONSTRAINT ruta_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.route DROP CONSTRAINT ruta_pkey;
       public            postgres    false    211            �           2606    950547    user usuario_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY public."user" DROP CONSTRAINT usuario_pkey;
       public            postgres    false    201            �           2606    1008337 ?   companionxreservation companionxreservation_reservation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.companionxreservation
    ADD CONSTRAINT companionxreservation_reservation_id_fkey FOREIGN KEY (reservation_id) REFERENCES public.reservation(id);
 i   ALTER TABLE ONLY public.companionxreservation DROP CONSTRAINT companionxreservation_reservation_id_fkey;
       public          postgres    false    2996    231    233            �           2606    1008332 8   companionxreservation companionxreservation_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.companionxreservation
    ADD CONSTRAINT companionxreservation_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 b   ALTER TABLE ONLY public.companionxreservation DROP CONSTRAINT companionxreservation_user_id_fkey;
       public          postgres    false    201    2966    233            �           2606    958949 /   sponsorxedition edicion_patrocinadorxedicion_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.sponsorxedition
    ADD CONSTRAINT "edicion_patrocinadorxedicion_FK" FOREIGN KEY (editionid) REFERENCES public.edition(id) NOT VALID;
 [   ALTER TABLE ONLY public.sponsorxedition DROP CONSTRAINT "edicion_patrocinadorxedicion_FK";
       public          postgres    false    205    2970    207            �           2606    959005 +   eventxitinerary eventoxitinerario_evento_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.eventxitinerary
    ADD CONSTRAINT "eventoxitinerario_evento_FK" FOREIGN KEY (eventid) REFERENCES public.event(id);
 W   ALTER TABLE ONLY public.eventxitinerary DROP CONSTRAINT "eventoxitinerario_evento_FK";
       public          postgres    false    219    2984    223            �           2606    959010 /   eventxitinerary eventoxitinerario_itinerario_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.eventxitinerary
    ADD CONSTRAINT "eventoxitinerario_itinerario_FK" FOREIGN KEY (itineraryid) REFERENCES public.itinerary(id);
 [   ALTER TABLE ONLY public.eventxitinerary DROP CONSTRAINT "eventoxitinerario_itinerario_FK";
       public          postgres    false    2986    223    221            �           2606    1049424 '   companionxreservation fk_reservation_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.companionxreservation
    ADD CONSTRAINT fk_reservation_id FOREIGN KEY (reservation_id) REFERENCES public.reservation(id);
 Q   ALTER TABLE ONLY public.companionxreservation DROP CONSTRAINT fk_reservation_id;
       public          postgres    false    2996    231    233            �           2606    1008272 (   images_edition images_edition_edition_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.images_edition
    ADD CONSTRAINT images_edition_edition_fk FOREIGN KEY (edition_id) REFERENCES public.edition(id);
 R   ALTER TABLE ONLY public.images_edition DROP CONSTRAINT images_edition_edition_fk;
       public          postgres    false    2970    227    205            �           2606    958924    event lugar_evento_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.event
    ADD CONSTRAINT "lugar_evento_FK" FOREIGN KEY (placeid) REFERENCES public.place(id) NOT VALID;
 A   ALTER TABLE ONLY public.event DROP CONSTRAINT "lugar_evento_FK";
       public          postgres    false    219    2974    209            �           2606    958934    placexroute lugar_lugarxruta_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.placexroute
    ADD CONSTRAINT "lugar_lugarxruta_FK" FOREIGN KEY (placeid) REFERENCES public.place(id) NOT VALID;
 K   ALTER TABLE ONLY public.placexroute DROP CONSTRAINT "lugar_lugarxruta_FK";
       public          postgres    false    213    2974    209            �           2606    1008277    membership membership_image_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.membership
    ADD CONSTRAINT membership_image_fk FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 H   ALTER TABLE ONLY public.membership DROP CONSTRAINT membership_image_fk;
       public          postgres    false    215    2990    225            �           2606    958944 .   membershipxuser membresia_membresiaxpersona_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.membershipxuser
    ADD CONSTRAINT "membresia_membresiaxpersona_FK" FOREIGN KEY (membershipid) REFERENCES public.membership(id) NOT VALID;
 Z   ALTER TABLE ONLY public.membershipxuser DROP CONSTRAINT "membresia_membresiaxpersona_FK";
       public          postgres    false    217    215    2980            �           2606    1008310    news news_image_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_image_id_fkey FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 A   ALTER TABLE ONLY public.news DROP CONSTRAINT news_image_id_fkey;
       public          postgres    false    229    2990    225            �           2606    958954 4   sponsorxedition patrocinador_patrocinadorxedicion_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.sponsorxedition
    ADD CONSTRAINT "patrocinador_patrocinadorxedicion_FK" FOREIGN KEY (sponsorid) REFERENCES public.sponsor(id) NOT VALID;
 `   ALTER TABLE ONLY public.sponsorxedition DROP CONSTRAINT "patrocinador_patrocinadorxedicion_FK";
       public          postgres    false    203    2968    207            �           2606    1008282    place place_image_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public.place
    ADD CONSTRAINT place_image_fk FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 >   ALTER TABLE ONLY public.place DROP CONSTRAINT place_image_fk;
       public          postgres    false    225    209    2990            �           2606    1008342 %   reservation reservation_place_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.place(id) NOT VALID;
 O   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservation_place_id_fkey;
       public          postgres    false    231    209    2974            �           2606    1008359 5   reservationxuser reservationxuser_reservation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservationxuser
    ADD CONSTRAINT reservationxuser_reservation_id_fkey FOREIGN KEY (reservation_id) REFERENCES public.reservation(id);
 _   ALTER TABLE ONLY public.reservationxuser DROP CONSTRAINT reservationxuser_reservation_id_fkey;
       public          postgres    false    2996    235    231            �           2606    1008354 .   reservationxuser reservationxuser_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservationxuser
    ADD CONSTRAINT reservationxuser_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 X   ALTER TABLE ONLY public.reservationxuser DROP CONSTRAINT reservationxuser_user_id_fkey;
       public          postgres    false    2966    235    201            �           2606    958929    placexroute ruta_lugarxruta_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.placexroute
    ADD CONSTRAINT "ruta_lugarxruta_FK" FOREIGN KEY (routeid) REFERENCES public.route(id) NOT VALID;
 J   ALTER TABLE ONLY public.placexroute DROP CONSTRAINT "ruta_lugarxruta_FK";
       public          postgres    false    213    211    2976            �           2606    1008287    sponsor sponsor_image_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.sponsor
    ADD CONSTRAINT sponsor_image_fk FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 B   ALTER TABLE ONLY public.sponsor DROP CONSTRAINT sponsor_image_fk;
       public          postgres    false    203    2990    225            �           2606    1008292    user user_image_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_image_fk FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 >   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_image_fk;
       public          postgres    false    225    201    2990            �           2606    958909    itinerary usuario_itinerario_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.itinerary
    ADD CONSTRAINT "usuario_itinerario_FK" FOREIGN KEY (userid) REFERENCES public."user"(id) NOT VALID;
 K   ALTER TABLE ONLY public.itinerary DROP CONSTRAINT "usuario_itinerario_FK";
       public          postgres    false    221    2966    201            �           2606    958939 ,   membershipxuser usuario_membresiaxpersona_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.membershipxuser
    ADD CONSTRAINT "usuario_membresiaxpersona_FK" FOREIGN KEY (userid) REFERENCES public."user"(id) NOT VALID;
 X   ALTER TABLE ONLY public.membershipxuser DROP CONSTRAINT "usuario_membresiaxpersona_FK";
       public          postgres    false    2966    201    217            w      x������ � �      t      x������ � �      X   e  x�]S�n�0<�_���6,7)���i�y��1�5�vXH�JRF�����(���~)���Gˆ�����`Bkv��G��e�|��19����.��m�i}Ԥ��o%$&�7���]�R��=��^P!�&XW��b$��gTy'�T�M�{[s-1�gx�C�`+�����v�H���A���
���vk��i�)��;�h-��|��y���\C�:���m��{$�7/���{��+�Hkް��yy7-��,�����r�?�>��b|}2�%�}HT�t�7߇��'s������ 卂��&p#t`A�u�sl�YƷ�VJ�f:x���8��2� k���"}�~P�6Z4��L{�T��q3���Gd��_JP1J�c��r��I��,S�"�����	��'i��E+��K}��_����{��ᘌ0�x��H����}5�4�9t�)�̾f<�����zW�+� Q��{��� ��l\�B�2�7��p����v��e�� �Kp�S�{��0C�wW�^�y1����;�!}WH��Y�.�O0{v�B�[>�@�(���.�_��`P�Ȯ�Ɂ{x����t~7]��t��H���h4���      f   4   x�3�4�42�2��25Գ4��4��sq��L�,���--и\1z\\\ ��      j      x�3�4�4�2�F\1z\\\ 	      l   m  x���[��@�gX�n�;�L&* �
�(H&1�E���7���Zzcc��$�~ �����ϩ�� J�Q�ʂ9�u�\0*"t�u��K���c�&�iY�Y���S}G�7�g�ozf�t��kM�[����D���r�&� ��qϹW/0��?�ࡲ�m�����Ds�UvP]y�l{\x�����+�N��v��v�F���*7��ו>�魻>����k�WT[4J��;����[��r�"����kN!��`m���M�v��V�HiU��V�bJ��m'����b^�T��V��`g���@K��5ՠ��(�pvNs��-�h�o�z1��G˔��5� u��0�k\�6����N2]�jI+�
[Ԣ�����3�:3t�E%�^i����>M5/0���jL�5)�$���-�x������j�������l��F�CD@-�b7�p���惯�c @n�v����:p��B^Ѐ�Ve}�s��?�'���$��x�q��fH5�_�?tf�I����I�Wȅg9J��3x���#f��Y�j����>�/�/b]�F�h@lus�v7��͑�ޜ@n�"��Jd�+���B���G�K�ϒ���_��m      n   L   x���1��;��E�W.�K}� \#G�]q����=�&	�B~�\�ڍV{�n/:�C��D�r����E�      h      x�3�4����� ]      b   �  x��TKn�@]�N�Mw�ٕ�mY��n�m �qnӳ�b�HN/�Iv�����w��S0���:wt{
@�V.k�)8��3y�lO��<$��� ;�iBY�`��:��P"���˼ �ZVRZy�C�|Y��u�iP�m�^��{�ap4��b������Q(���ۻh-�C"��Q'�̓�H�:���.��<�g9����yR�̆x��of���e�·�M��T�\�#�͜7�?�|VjR͚8
��"�`�uӚ�5;������q�>��רPǾ�p�A�*8��A���eI,j�ܖ{��Y%�^�qq�S,|'|�UN�QXw1̍���mj�����X��}�f]o7f[��TC�|�����S���ƴ��܅��wI���ǯ�j���T���1��W]U�_]%      d   "   x�3�4�4�4202�54�52�2��L�=... Y�;      p   �   x�]�K�0D��)� �)w`Kvl��
�B� �=�*>���<=%��fN�L�A�=� c����aZ�MP|K[���Gf�x}
���iSf�-U�peC��](�F�z�6C_G�V&��ȶ>AG�S$)f뻕�Ϡ}V�Ʈ̴��dM]8!��U����y+�|�Zw      \   |  x��T�n�0<K_��
ql�zJ�^�6)�"�^��Z!@�*)
q������'��}����>;��%��!�pz�[�n8҃��sd?
%�'&Ñ�(Ѿph�Hٓ�
Z��}�9��i@29�>'k���d�pF��V<�Q'i`��%w�h�7Q󀟹�I"<���:�v��l˭���KD�A�Rp��; s�����x�#ph%�I2�_1:��=}AyC�ʉ�^T�Čl��ܩ~�.��O�9E�GݥXyF�ť?Bbh�)έ�M�]C�bQ]5W��z��>lW���v}��շ�$НN��O��)�V�/��ކt��%�U�'�P�Oش�J2zm� wV�r1����n}(|d/>��c�]H4�8IP[��7�W3��b��/����w$��8��k��b}�ܜoV��H_G߰70.�cT���]��R���5=��G݃/���ag�Pv�mo�M���Qʆ��?��v��x*�T�:)��@��w��Bg!�u},���]�m��J�����>
,;��;�M�V�� ��\Ԉ���[��˺ȽN�'D)&(��18�/��<�;_��K
����$v奊/.F�u�> i�>�����-�	/�Doo�m���q���rU�j�����      `   1   x���	  ���0��u���!�R�شO�Z�N���ܜ���Y      r      x������ � �      v      x������ � �      ^   >   x�3��IT(*-ITpt�4�2�tI,�,�L�KIr�9]��s�JR�<N��"0+F��� ���      V   G   x�3�tI,�,�L�KI��2�t�OIMO,V�K,K,*�Wp�/*JM,�44�2�t��SpO,��42����� m��      Z   ,   x�3�4�4�2�4�4�24�B.C#e�L�P�L��qqq �N|      T     x�m�Mv�0����*:pH�Y�(U[�G��q�J�iEPܕk��ZO[G��;z��2��W�盒�A��ǭ:H�Z+	B�j��8���M�M�V��~i��h`�|H��2_|�OdLd��Y2�84	�/��aM
���p`ȥ�!�{���w߳K=75���6�:��OO]�Mˤ��H��j�����k-���{�z��v���&bM��(�{�u�P�ن�{r4�|Ǣޙ
U$�;�i69�=�����LF�0�Z���OҺ�hW^el��`��N�f����2�1q6     