PGDMP          ,            	    z         	   ACTMainDB    13.2    13.2 _    M           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            N           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            O           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            P           1262    950540 	   ACTMainDB    DATABASE     h   CREATE DATABASE "ACTMainDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Mexico.1252';
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
            public          postgres    false    203            �            1259    958839    edition    TABLE     �   CREATE TABLE public.edition (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
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
    image_id integer
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
            public          postgres    false    207            �            1259    958866    route    TABLE     a   CREATE TABLE public.route (
    id integer NOT NULL,
    name character varying(100) NOT NULL
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
    password character varying(50) NOT NULL,
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
            public          postgres    false    201            2          0    958839    edition 
   TABLE DATA           E   COPY public.edition (id, nombre, details, date, current) FROM stdin;
    public          postgres    false    205   �p       @          0    958897    event 
   TABLE DATA           B   COPY public.event (id, placeid, start_hour, end_hour) FROM stdin;
    public          postgres    false    219   %s       D          0    959000    eventxitinerary 
   TABLE DATA           C   COPY public.eventxitinerary (id, itineraryid, eventid) FROM stdin;
    public          postgres    false    223   is       F          0    1008257    image 
   TABLE DATA           ;   COPY public.image (image_id, name, drive_path) FROM stdin;
    public          postgres    false    225   �s       H          0    1008267    images_edition 
   TABLE DATA           Q   COPY public.images_edition (images_edition_id, edition_id, image_id) FROM stdin;
    public          postgres    false    227   }u       B          0    958904 	   itinerary 
   TABLE DATA           /   COPY public.itinerary (id, userid) FROM stdin;
    public          postgres    false    221   �u       <          0    958880 
   membership 
   TABLE DATA           H   COPY public.membership (id, name, details, price, image_id) FROM stdin;
    public          postgres    false    215   �u       >          0    958890    membershipxuser 
   TABLE DATA           W   COPY public.membershipxuser (id, userid, membershipid, startdate, enddate) FROM stdin;
    public          postgres    false    217   �w       J          0    1008302    news 
   TABLE DATA           F   COPY public.news (id, title, description, image_id, date) FROM stdin;
    public          postgres    false    229   �w       6          0    958856    place 
   TABLE DATA           <   COPY public.place (id, name, details, image_id) FROM stdin;
    public          postgres    false    209   �w       :          0    958873    placexroute 
   TABLE DATA           ;   COPY public.placexroute (id, routeid, placeid) FROM stdin;
    public          postgres    false    213   +z       8          0    958866    route 
   TABLE DATA           )   COPY public.route (id, name) FROM stdin;
    public          postgres    false    211   az       0          0    958829    sponsor 
   TABLE DATA           5   COPY public.sponsor (id, name, image_id) FROM stdin;
    public          postgres    false    203   �z       4          0    958849    sponsorxedition 
   TABLE DATA           E   COPY public.sponsorxedition ("ID", editionid, sponsorid) FROM stdin;
    public          postgres    false    207   �z       .          0    950543    user 
   TABLE DATA           {   COPY public."user" (id, name, lastname, email, password, identification, phone_number, address, age, image_id) FROM stdin;
    public          postgres    false    201   !{       Q           0    0    Itinerario_ID_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Itinerario_ID_seq"', 3, true);
          public          postgres    false    220            R           0    0    Patrocinador_ID_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Patrocinador_ID_seq"', 2, true);
          public          postgres    false    202            S           0    0    edicion_ID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."edicion_ID_seq"', 4, true);
          public          postgres    false    204            T           0    0    evento_ID_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."evento_ID_seq"', 2, true);
          public          postgres    false    218            U           0    0    eventoxitinerario_ID_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."eventoxitinerario_ID_seq"', 4, true);
          public          postgres    false    222            V           0    0    image_image_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.image_image_id_seq', 11, true);
          public          postgres    false    224            W           0    0 $   images_edition_images_edition_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.images_edition_images_edition_id_seq', 12, true);
          public          postgres    false    226            X           0    0    lugar_ID_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."lugar_ID_seq"', 4, true);
          public          postgres    false    208            Y           0    0    lugarxruta_ID_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."lugarxruta_ID_seq"', 5, true);
          public          postgres    false    212            Z           0    0    membresia_ID_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."membresia_ID_seq"', 5, true);
          public          postgres    false    214            [           0    0    membresiaxpersona_ID_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."membresiaxpersona_ID_seq"', 1, false);
          public          postgres    false    216            \           0    0    news_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.news_id_seq', 1, false);
          public          postgres    false    228            ]           0    0    patrocinadorxedicion_ID_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."patrocinadorxedicion_ID_seq"', 3, true);
          public          postgres    false    206            ^           0    0    ruta_ID_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."ruta_ID_seq"', 4, true);
          public          postgres    false    210            _           0    0    usuario_ID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."usuario_ID_seq"', 3, true);
          public          postgres    false    200            �           2606    958908    itinerary Itinerario_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.itinerary
    ADD CONSTRAINT "Itinerario_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.itinerary DROP CONSTRAINT "Itinerario_pkey";
       public            postgres    false    221            �           2606    958836    sponsor Patrocinador_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.sponsor
    ADD CONSTRAINT "Patrocinador_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.sponsor DROP CONSTRAINT "Patrocinador_pkey";
       public            postgres    false    203            �           2606    958846    edition edicion_pkey 
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
       public            postgres    false    207            �           2606    958870    route ruta_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.route
    ADD CONSTRAINT ruta_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.route DROP CONSTRAINT ruta_pkey;
       public            postgres    false    211            ~           2606    950547    user usuario_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY public."user" DROP CONSTRAINT usuario_pkey;
       public            postgres    false    201            �           2606    958949 /   sponsorxedition edicion_patrocinadorxedicion_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.sponsorxedition
    ADD CONSTRAINT "edicion_patrocinadorxedicion_FK" FOREIGN KEY (editionid) REFERENCES public.edition(id) NOT VALID;
 [   ALTER TABLE ONLY public.sponsorxedition DROP CONSTRAINT "edicion_patrocinadorxedicion_FK";
       public          postgres    false    207    2946    205            �           2606    959005 +   eventxitinerary eventoxitinerario_evento_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.eventxitinerary
    ADD CONSTRAINT "eventoxitinerario_evento_FK" FOREIGN KEY (eventid) REFERENCES public.event(id);
 W   ALTER TABLE ONLY public.eventxitinerary DROP CONSTRAINT "eventoxitinerario_evento_FK";
       public          postgres    false    223    2960    219            �           2606    959010 /   eventxitinerary eventoxitinerario_itinerario_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.eventxitinerary
    ADD CONSTRAINT "eventoxitinerario_itinerario_FK" FOREIGN KEY (itineraryid) REFERENCES public.itinerary(id);
 [   ALTER TABLE ONLY public.eventxitinerary DROP CONSTRAINT "eventoxitinerario_itinerario_FK";
       public          postgres    false    2962    223    221            �           2606    1008272 (   images_edition images_edition_edition_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.images_edition
    ADD CONSTRAINT images_edition_edition_fk FOREIGN KEY (edition_id) REFERENCES public.edition(id);
 R   ALTER TABLE ONLY public.images_edition DROP CONSTRAINT images_edition_edition_fk;
       public          postgres    false    2946    205    227            �           2606    958924    event lugar_evento_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.event
    ADD CONSTRAINT "lugar_evento_FK" FOREIGN KEY (placeid) REFERENCES public.place(id) NOT VALID;
 A   ALTER TABLE ONLY public.event DROP CONSTRAINT "lugar_evento_FK";
       public          postgres    false    219    209    2950            �           2606    958934    placexroute lugar_lugarxruta_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.placexroute
    ADD CONSTRAINT "lugar_lugarxruta_FK" FOREIGN KEY (placeid) REFERENCES public.place(id) NOT VALID;
 K   ALTER TABLE ONLY public.placexroute DROP CONSTRAINT "lugar_lugarxruta_FK";
       public          postgres    false    213    2950    209            �           2606    1008277    membership membership_image_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.membership
    ADD CONSTRAINT membership_image_fk FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 H   ALTER TABLE ONLY public.membership DROP CONSTRAINT membership_image_fk;
       public          postgres    false    2966    215    225            �           2606    958944 .   membershipxuser membresia_membresiaxpersona_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.membershipxuser
    ADD CONSTRAINT "membresia_membresiaxpersona_FK" FOREIGN KEY (membershipid) REFERENCES public.membership(id) NOT VALID;
 Z   ALTER TABLE ONLY public.membershipxuser DROP CONSTRAINT "membresia_membresiaxpersona_FK";
       public          postgres    false    2956    215    217            �           2606    1008310    news news_image_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_image_id_fkey FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 A   ALTER TABLE ONLY public.news DROP CONSTRAINT news_image_id_fkey;
       public          postgres    false    225    2966    229            �           2606    958954 4   sponsorxedition patrocinador_patrocinadorxedicion_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.sponsorxedition
    ADD CONSTRAINT "patrocinador_patrocinadorxedicion_FK" FOREIGN KEY (sponsorid) REFERENCES public.sponsor(id) NOT VALID;
 `   ALTER TABLE ONLY public.sponsorxedition DROP CONSTRAINT "patrocinador_patrocinadorxedicion_FK";
       public          postgres    false    2944    207    203            �           2606    1008282    place place_image_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public.place
    ADD CONSTRAINT place_image_fk FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 >   ALTER TABLE ONLY public.place DROP CONSTRAINT place_image_fk;
       public          postgres    false    2966    225    209            �           2606    958929    placexroute ruta_lugarxruta_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.placexroute
    ADD CONSTRAINT "ruta_lugarxruta_FK" FOREIGN KEY (routeid) REFERENCES public.route(id) NOT VALID;
 J   ALTER TABLE ONLY public.placexroute DROP CONSTRAINT "ruta_lugarxruta_FK";
       public          postgres    false    211    2952    213            �           2606    1008287    sponsor sponsor_image_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.sponsor
    ADD CONSTRAINT sponsor_image_fk FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 B   ALTER TABLE ONLY public.sponsor DROP CONSTRAINT sponsor_image_fk;
       public          postgres    false    225    203    2966            �           2606    1008292    user user_image_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_image_fk FOREIGN KEY (image_id) REFERENCES public.image(image_id);
 >   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_image_fk;
       public          postgres    false    225    201    2966            �           2606    958909    itinerary usuario_itinerario_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.itinerary
    ADD CONSTRAINT "usuario_itinerario_FK" FOREIGN KEY (userid) REFERENCES public."user"(id) NOT VALID;
 K   ALTER TABLE ONLY public.itinerary DROP CONSTRAINT "usuario_itinerario_FK";
       public          postgres    false    2942    221    201            �           2606    958939 ,   membershipxuser usuario_membresiaxpersona_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.membershipxuser
    ADD CONSTRAINT "usuario_membresiaxpersona_FK" FOREIGN KEY (userid) REFERENCES public."user"(id) NOT VALID;
 X   ALTER TABLE ONLY public.membershipxuser DROP CONSTRAINT "usuario_membresiaxpersona_FK";
       public          postgres    false    201    2942    217            2   s  x�]S�n�0<�_���6$%)���i�I
'�\���a!�*I��w��0 |�cvfxU<{�!$��-;�����^��/�|���z��4p����ƻסOd�&�L~-!1��M}��x۵(����1��"��u��)�@�|p~F��˲Ivgn$��/r�l�����8��,ceP* ��Bp&�][cq�q
v�����q����<JK�\C�:���m��{$�6/����{��+�H��b�3*겺�Vմ�����Zy�?Z|H'���dLJ���haӞ�|2,v�́tt����T�
v-� ��Ё�֝ϱ�f���R�5����%P�=8�q	Y����$�����Ѣ9=e�3���g`����=: Kv��:P��Q���3�@��2�eD�5�57���$�5��0t�RC5��>=�^(�?$#4b!h����t��A���.�4U��׌'�p�*��5�B�.Hg��<*��!Y����#BH_F����[Q�h���_�o�8�E�SK�1dxw��ٙg#����A���w�	�����'w����`��Ҋɺ���}�U��������
Q髧�������,�zVV��׫i��H���h4�{U�      @   4   x�3�4�42�2��25Գ4��4��sq��L�,���--и\1z\\\ ��      D      x�3�4�4�2�F\1z\\\ 	      F   �  x���Y��@ ��gjn��A�N:$��b�(-��n�Z�ƺ���>��/�ɡ)%A1��,����b�uo�W�c�L��E�q^����6����tYȁ����.W�n��n+��6�~(!����*a�V3zRÞή���C]��jK��0@�n��~W�I��;����=b��Mv;��r�<z~�p�UvRU�������{~v7��w~�d��0������F1��h�K������B�jx֘��	�E���R7_�U�$&5�(ZV�z��W�*qP�q9��웇0em=錿��yi��f��_�l��O8n�Y R6IKԖ������h�-�Ϩu����tg��$J��P�o�f�^��Ѭy�cmc���}���f�A�@��-N�ֳ� !�\��`�?���V���������q�MSf�C2#m3��<M�2��5dW��"�z�0�C�(��	�,  �<.�      H   <   x����@�s���Y>����Y��J��f�bt�e����ţ�[��4��tI�w ?�	�      B      x�3�4����� ]      <   �  x�ՓMr�0���)���֨N�f�f2]u�E���lc�"��ĽM�ҋ��^���]i���>P;�	"96OKʁ0��L1���������N `G�� 7���Y��M��g��Ɨ3�H��łs�3j��=�����08�mSV��e�-��&�0,����;j}�JQ{�ؓ@ʔ�5���ڮ3}skc������#J�7Љx5�/�<Ҭ��� �؝���$��ٔKU9���j\�3ͼшz�w`��nߜih��:{=��~���yo�J�/ ����\8.�YN��%O�)��b�|�e�n�@��_?k���lz�)�o7�3J|�8kO>
:�P&"�K2��@��Dw���n�<q|��
㟘�^�����IX�1.���MQ�n�=��x"�n�c�om�4� ��      >      x������ � �      J      x������ � �      6   D  x����n1�ϻO��V* .�JႠEq���xg-���LF�>=�3-����L��}��W��³��%s�|�4������^n��*�}�:�Vi2Mb����H��V�b*y�HG�c�L������փ��MZ�����{�y'_r�\�i����Phqn�;N �;'~�H���9�B׸���`�{��MD�ԙ�P�PSrW�8#����4kŉ�v2�b���gO4����j��B�< �@W��I�eT���fDhm�s����&����n&�h6�-Zu������$A�7N�������de4N~�(.��i*�qL�j���Ȕ{��?�n �{��� ��r�*����d��㧁i�Y7<�-��.~*U� ߸%o���3U��t�Y��;�0 ]�#S`�h��"7g�m�ܵp�a*��}���Zt)�w�k���_s��:Gk>�Ao�w�e%M�a��~�(�?����Gu sU�R�v��[�c� 0�'���E_ه9�d�s'	3��w�?��x�s}���so��r�D}��{��Z�����~���o+ϒz      :   &   x�3�4�4�2�F\ƜF@҄�L9�9��b���� Ks+      8   :   x�3��IT(*-ITpt�2�tI,�,�L�KI�2�t-NN�I�+I�2���/�1z\\\ �$�      0   9   x�3�tI,�,�L�KI��2�t�OIMO,V�K,K,*�Wp�/*JM,�44������ `v      4      x�3�4�4�2�4�Ɯ&�F\1z\\\ !��      .   p   x�3�H-H�t����K/M��, r2�Kr3s���s9��9��9-��37S!9�8��Ԉ3Ə˘�=3'%�3�(���D�Ң���lpZ�������03 ���� &�     