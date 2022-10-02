PGDMP     ;    )            	    z         	   ACTMainDB    13.2    13.2 J    '           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            (           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            )           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            *           1262    950540 	   ACTMainDB    DATABASE     h   CREATE DATABASE "ACTMainDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Mexico.1252';
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
            public          postgres    false    221            �            1259    958829    sponsor    TABLE     �   CREATE TABLE public.sponsor (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    photo character varying(300) NOT NULL
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
            public          postgres    false    223            �            1259    958856    place    TABLE     �   CREATE TABLE public.place (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    details character varying(500) NOT NULL,
    photo character varying(300) NOT NULL
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
    photo character varying(300) NOT NULL,
    price numeric(8,2) NOT NULL
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
            public          postgres    false    217            �            1259    958849    sponsorxedition    TABLE     �   CREATE TABLE public.sponsorxedition (
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
    photo character varying(100) NOT NULL,
    age integer NOT NULL
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
            public          postgres    false    201                      0    958839    edition 
   TABLE DATA           E   COPY public.edition (id, nombre, details, date, current) FROM stdin;
    public          postgres    false    205   EW                  0    958897    event 
   TABLE DATA           B   COPY public.event (id, placeid, start_hour, end_hour) FROM stdin;
    public          postgres    false    219   �Y       $          0    959000    eventxitinerary 
   TABLE DATA           C   COPY public.eventxitinerary (id, itineraryid, eventid) FROM stdin;
    public          postgres    false    223   Z       "          0    958904 	   itinerary 
   TABLE DATA           /   COPY public.itinerary (id, userid) FROM stdin;
    public          postgres    false    221   3Z                 0    958880 
   membership 
   TABLE DATA           E   COPY public.membership (id, name, details, photo, price) FROM stdin;
    public          postgres    false    215   TZ                 0    958890    membershipxuser 
   TABLE DATA           W   COPY public.membershipxuser (id, userid, membershipid, startdate, enddate) FROM stdin;
    public          postgres    false    217   \                 0    958856    place 
   TABLE DATA           9   COPY public.place (id, name, details, photo) FROM stdin;
    public          postgres    false    209   )\                 0    958873    placexroute 
   TABLE DATA           ;   COPY public.placexroute (id, routeid, placeid) FROM stdin;
    public          postgres    false    213   �^                 0    958866    route 
   TABLE DATA           )   COPY public.route (id, name) FROM stdin;
    public          postgres    false    211   �^                 0    958829    sponsor 
   TABLE DATA           2   COPY public.sponsor (id, name, photo) FROM stdin;
    public          postgres    false    203   _                 0    958849    sponsorxedition 
   TABLE DATA           E   COPY public.sponsorxedition ("ID", editionid, sponsorid) FROM stdin;
    public          postgres    false    207   Y_                 0    950543    user 
   TABLE DATA           x   COPY public."user" (id, name, lastname, email, password, identification, phone_number, address, photo, age) FROM stdin;
    public          postgres    false    201   �_       +           0    0    Itinerario_ID_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Itinerario_ID_seq"', 3, true);
          public          postgres    false    220            ,           0    0    Patrocinador_ID_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Patrocinador_ID_seq"', 2, true);
          public          postgres    false    202            -           0    0    edicion_ID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."edicion_ID_seq"', 4, true);
          public          postgres    false    204            .           0    0    evento_ID_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."evento_ID_seq"', 2, true);
          public          postgres    false    218            /           0    0    eventoxitinerario_ID_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."eventoxitinerario_ID_seq"', 4, true);
          public          postgres    false    222            0           0    0    lugar_ID_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."lugar_ID_seq"', 4, true);
          public          postgres    false    208            1           0    0    lugarxruta_ID_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."lugarxruta_ID_seq"', 5, true);
          public          postgres    false    212            2           0    0    membresia_ID_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."membresia_ID_seq"', 5, true);
          public          postgres    false    214            3           0    0    membresiaxpersona_ID_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."membresiaxpersona_ID_seq"', 1, false);
          public          postgres    false    216            4           0    0    patrocinadorxedicion_ID_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."patrocinadorxedicion_ID_seq"', 3, true);
          public          postgres    false    206            5           0    0    ruta_ID_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."ruta_ID_seq"', 4, true);
          public          postgres    false    210            6           0    0    usuario_ID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."usuario_ID_seq"', 2, true);
          public          postgres    false    200            ~           2606    958908    itinerary Itinerario_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.itinerary
    ADD CONSTRAINT "Itinerario_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.itinerary DROP CONSTRAINT "Itinerario_pkey";
       public            postgres    false    221            l           2606    958836    sponsor Patrocinador_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.sponsor
    ADD CONSTRAINT "Patrocinador_pkey" PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.sponsor DROP CONSTRAINT "Patrocinador_pkey";
       public            postgres    false    203            n           2606    958846    edition edicion_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.edition
    ADD CONSTRAINT edicion_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.edition DROP CONSTRAINT edicion_pkey;
       public            postgres    false    205            |           2606    958901    event evento_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.event
    ADD CONSTRAINT evento_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.event DROP CONSTRAINT evento_pkey;
       public            postgres    false    219            �           2606    959004 &   eventxitinerary eventoxitinerario_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.eventxitinerary
    ADD CONSTRAINT eventoxitinerario_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.eventxitinerary DROP CONSTRAINT eventoxitinerario_pkey;
       public            postgres    false    223            r           2606    958863    place lugar_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.place
    ADD CONSTRAINT lugar_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.place DROP CONSTRAINT lugar_pkey;
       public            postgres    false    209            v           2606    958877    placexroute lugarxruta_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.placexroute
    ADD CONSTRAINT lugarxruta_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.placexroute DROP CONSTRAINT lugarxruta_pkey;
       public            postgres    false    213            x           2606    958887    membership membresia_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.membership
    ADD CONSTRAINT membresia_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.membership DROP CONSTRAINT membresia_pkey;
       public            postgres    false    215            z           2606    958894 &   membershipxuser membresiaxpersona_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.membershipxuser
    ADD CONSTRAINT membresiaxpersona_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.membershipxuser DROP CONSTRAINT membresiaxpersona_pkey;
       public            postgres    false    217            p           2606    958853 )   sponsorxedition patrocinadorxedicion_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.sponsorxedition
    ADD CONSTRAINT patrocinadorxedicion_pkey PRIMARY KEY ("ID");
 S   ALTER TABLE ONLY public.sponsorxedition DROP CONSTRAINT patrocinadorxedicion_pkey;
       public            postgres    false    207            t           2606    958870    route ruta_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.route
    ADD CONSTRAINT ruta_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.route DROP CONSTRAINT ruta_pkey;
       public            postgres    false    211            j           2606    950547    user usuario_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY public."user" DROP CONSTRAINT usuario_pkey;
       public            postgres    false    201            �           2606    958949 /   sponsorxedition edicion_patrocinadorxedicion_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.sponsorxedition
    ADD CONSTRAINT "edicion_patrocinadorxedicion_FK" FOREIGN KEY (editionid) REFERENCES public.edition(id) NOT VALID;
 [   ALTER TABLE ONLY public.sponsorxedition DROP CONSTRAINT "edicion_patrocinadorxedicion_FK";
       public          postgres    false    205    2926    207            �           2606    959005 +   eventxitinerary eventoxitinerario_evento_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.eventxitinerary
    ADD CONSTRAINT "eventoxitinerario_evento_FK" FOREIGN KEY (eventid) REFERENCES public.event(id);
 W   ALTER TABLE ONLY public.eventxitinerary DROP CONSTRAINT "eventoxitinerario_evento_FK";
       public          postgres    false    219    223    2940            �           2606    959010 /   eventxitinerary eventoxitinerario_itinerario_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.eventxitinerary
    ADD CONSTRAINT "eventoxitinerario_itinerario_FK" FOREIGN KEY (itineraryid) REFERENCES public.itinerary(id);
 [   ALTER TABLE ONLY public.eventxitinerary DROP CONSTRAINT "eventoxitinerario_itinerario_FK";
       public          postgres    false    223    2942    221            �           2606    958924    event lugar_evento_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.event
    ADD CONSTRAINT "lugar_evento_FK" FOREIGN KEY (placeid) REFERENCES public.place(id) NOT VALID;
 A   ALTER TABLE ONLY public.event DROP CONSTRAINT "lugar_evento_FK";
       public          postgres    false    2930    209    219            �           2606    958934    placexroute lugar_lugarxruta_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.placexroute
    ADD CONSTRAINT "lugar_lugarxruta_FK" FOREIGN KEY (placeid) REFERENCES public.place(id) NOT VALID;
 K   ALTER TABLE ONLY public.placexroute DROP CONSTRAINT "lugar_lugarxruta_FK";
       public          postgres    false    213    209    2930            �           2606    958944 .   membershipxuser membresia_membresiaxpersona_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.membershipxuser
    ADD CONSTRAINT "membresia_membresiaxpersona_FK" FOREIGN KEY (membershipid) REFERENCES public.membership(id) NOT VALID;
 Z   ALTER TABLE ONLY public.membershipxuser DROP CONSTRAINT "membresia_membresiaxpersona_FK";
       public          postgres    false    215    2936    217            �           2606    958954 4   sponsorxedition patrocinador_patrocinadorxedicion_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.sponsorxedition
    ADD CONSTRAINT "patrocinador_patrocinadorxedicion_FK" FOREIGN KEY (sponsorid) REFERENCES public.sponsor(id) NOT VALID;
 `   ALTER TABLE ONLY public.sponsorxedition DROP CONSTRAINT "patrocinador_patrocinadorxedicion_FK";
       public          postgres    false    207    203    2924            �           2606    958929    placexroute ruta_lugarxruta_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.placexroute
    ADD CONSTRAINT "ruta_lugarxruta_FK" FOREIGN KEY (routeid) REFERENCES public.route(id) NOT VALID;
 J   ALTER TABLE ONLY public.placexroute DROP CONSTRAINT "ruta_lugarxruta_FK";
       public          postgres    false    211    213    2932            �           2606    958909    itinerary usuario_itinerario_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.itinerary
    ADD CONSTRAINT "usuario_itinerario_FK" FOREIGN KEY (userid) REFERENCES public."user"(id) NOT VALID;
 K   ALTER TABLE ONLY public.itinerary DROP CONSTRAINT "usuario_itinerario_FK";
       public          postgres    false    221    201    2922            �           2606    958939 ,   membershipxuser usuario_membresiaxpersona_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.membershipxuser
    ADD CONSTRAINT "usuario_membresiaxpersona_FK" FOREIGN KEY (userid) REFERENCES public."user"(id) NOT VALID;
 X   ALTER TABLE ONLY public.membershipxuser DROP CONSTRAINT "usuario_membresiaxpersona_FK";
       public          postgres    false    217    2922    201               s  x�]S�n�0<�_���6$%)���i�I
'�\���a!�*I��w��0 |�cvfxU<{�!$��-;�����^��/�|���z��4p����ƻסOd�&�L~-!1��M}��x۵(����1��"��u��)�@�|p~F��˲Ivgn$��/r�l�����8��,ceP* ��Bp&�][cq�q
v�����q����<JK�\C�:���m��{$�6/����{��+�H��b�3*겺�Vմ�����Zy�?Z|H'���dLJ���haӞ�|2,v�́tt����T�
v-� ��Ё�֝ϱ�f���R�5����%P�=8�q	Y����$�����Ѣ9=e�3���g`����=: Kv��:P��Q���3�@��2�eD�5�57���$�5��0t�RC5��>=�^(�?$#4b!h����t��A���.�4U��׌'�p�*��5�B�.Hg��<*��!Y����#BH_F����[Q�h���_�o�8�E�SK�1dxw��ٙg#����A���w�	�����'w����`��Ҋɺ���}�U��������
Q髧�������,�zVV��׫i��H���h4�{U�          4   x�3�4�42�2��25Գ4��4��sq��L�,���--и\1z\\\ ��      $      x�3�4�4�2�F\1z\\\ 	      "      x�3�4����� ]         �  x�Փ�N�0Eם�Ȇ�L)��b���[��Ki\��b����NZ�X����������
Y����<u�a0��BG�`��	�� `z�~+���uI!�F}�#AQ�Ӂ���z�р����:s`!Υ�[�U{�ߴ�M�#�Ɓ����4������я*E�����b��uu�G�Bv�P�����fq^݄��%�V�;�촣=Ep��4D�QN���ڳ=�g˽B���TDEe�T6�K���4�R�j�{vu\����Wg��b������(��@�ݛ1#�̳����s��b�	H!~{y7Y7ච�i??�q4���m��)��7�k�#Jx;��wsO�	Z'��#�isH�bA� S��ЖnG�<px���G�#|�\� ��駋3��MQ�n�ۖ�l��e�3���b�xm�.�            x������ � �         N  x��S�nA<�_��N!pA�Dq�=�^�4�e+;_O�lBs�igz�QU]�n�K��D��4E��������7�D��n��oW?Z�g_�B���ɩ�5�O����UbeO�1y&����c�CΞu��/�Q����r;t�=�d�A��}=M��!EM䚯-c�	��i����V���Kt���[}��V�D��R�Lw��	�%v��c�b�x��b�=e)�g��Ȟhй���`�\��, ��.�&ɧQ��e�������p���� ����8`���7k���>��$��?���F��SNc�`��P1�&	S�N��a�4"ŞdFpP���~'y�1 As9�K�6#cu2��qh��4�-�	��D?��Td��n���9�fץ�pY:�ӕF�@�aP4K�c[��m&� ��o#
0v�86N��r7.<m��s��y�F�L&Œ;�Z�<�6��b&R��L�<:���<���.��V�G���"�)� d��:p,6 l��7����[�}y�d��I\e�6/����"�������G�G����O�6��/�n����wCg�n���_�4�h         &   x�3�4�4�2�F\ƜF@҄�L9�9��b���� Ks+         :   x�3��IT(*-ITpt�2�tI,�,�L�KI�2�t-NN�I�+I�2���/�1z\\\ �$�         B   x�3�tI,�,�L�KI��OO�K-�LH,��2�t�OIMO,V�K,K,*�Wp�/*JM,FU���� K            x�3�4�4�2�4�Ɯ&�F\1z\\\ !��         Q   x�3�H-H�t����K/M��, r2�Kr3s���s9��9��9-��37S!9�8�S?=5/�(39 �$��Ԉ+F��� �0     