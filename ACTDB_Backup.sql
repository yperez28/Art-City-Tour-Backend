PGDMP     9    -    
            z         	   ACTMainDB    13.2    13.2 J    '           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            (           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            )           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            *           1262    950540 	   ACTMainDB    DATABASE     h   CREATE DATABASE "ACTMainDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE "ACTMainDB";
                postgres    false            �            1259    958904 
   Itinerario    TABLE     `   CREATE TABLE public."Itinerario" (
    "ID" integer NOT NULL,
    usuarioid integer NOT NULL
);
     DROP TABLE public."Itinerario";
       public         heap    postgres    false            �            1259    958902    Itinerario_ID_seq    SEQUENCE     �   ALTER TABLE public."Itinerario" ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Itinerario_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    958829    patrocinador    TABLE     �   CREATE TABLE public.patrocinador (
    "ID" integer NOT NULL,
    nombre character varying(100) NOT NULL,
    imagen character varying(300) NOT NULL
);
     DROP TABLE public.patrocinador;
       public         heap    postgres    false            �            1259    958827    Patrocinador_ID_seq    SEQUENCE     �   ALTER TABLE public.patrocinador ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Patrocinador_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    203            �            1259    958839    edicion    TABLE     �   CREATE TABLE public.edicion (
    "ID" integer NOT NULL,
    nombre character varying(100) NOT NULL,
    detalles character varying(500),
    fecha character varying(50)
);
    DROP TABLE public.edicion;
       public         heap    postgres    false            �            1259    958837    edicion_ID_seq    SEQUENCE     �   ALTER TABLE public.edicion ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."edicion_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    205            �            1259    958897    evento    TABLE     �   CREATE TABLE public.evento (
    "ID" integer NOT NULL,
    lugarid integer NOT NULL,
    horainicio time without time zone,
    horafin time without time zone
);
    DROP TABLE public.evento;
       public         heap    postgres    false            �            1259    958895    evento_ID_seq    SEQUENCE     �   ALTER TABLE public.evento ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."evento_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    959000    eventoxitinerario    TABLE     ~   CREATE TABLE public.eventoxitinerario (
    "ID" integer NOT NULL,
    itinerarioid integer NOT NULL,
    eventoid integer
);
 %   DROP TABLE public.eventoxitinerario;
       public         heap    postgres    false            �            1259    958998    eventoxitinerario_ID_seq    SEQUENCE     �   ALTER TABLE public.eventoxitinerario ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."eventoxitinerario_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    958856    lugar    TABLE     �   CREATE TABLE public.lugar (
    "ID" integer NOT NULL,
    nombre character varying(100) NOT NULL,
    detalles character varying(500) NOT NULL,
    imagen character varying(300) NOT NULL
);
    DROP TABLE public.lugar;
       public         heap    postgres    false            �            1259    958854    lugar_ID_seq    SEQUENCE     �   ALTER TABLE public.lugar ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."lugar_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            �            1259    958873 
   lugarxruta    TABLE     y   CREATE TABLE public.lugarxruta (
    "ID" integer NOT NULL,
    rutaid integer NOT NULL,
    lugarid integer NOT NULL
);
    DROP TABLE public.lugarxruta;
       public         heap    postgres    false            �            1259    958871    lugarxruta_ID_seq    SEQUENCE     �   ALTER TABLE public.lugarxruta ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."lugarxruta_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    213            �            1259    958880 	   membresia    TABLE     �   CREATE TABLE public.membresia (
    "ID" integer NOT NULL,
    nombre character varying(100) NOT NULL,
    detalles character varying(1500) NOT NULL,
    imagen character varying(300) NOT NULL,
    precio numeric(8,2) NOT NULL
);
    DROP TABLE public.membresia;
       public         heap    postgres    false            �            1259    958878    membresia_ID_seq    SEQUENCE     �   ALTER TABLE public.membresia ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."membresia_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    958890    membresiaxpersona    TABLE     �   CREATE TABLE public.membresiaxpersona (
    "ID" integer NOT NULL,
    usuarioid integer NOT NULL,
    membresiaid integer NOT NULL,
    fechainicio date NOT NULL,
    fechafin date NOT NULL
);
 %   DROP TABLE public.membresiaxpersona;
       public         heap    postgres    false            �            1259    958888    membresiaxpersona_ID_seq    SEQUENCE     �   ALTER TABLE public.membresiaxpersona ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."membresiaxpersona_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    958849    patrocinadorxedicion    TABLE     �   CREATE TABLE public.patrocinadorxedicion (
    "ID" integer NOT NULL,
    edicionid integer NOT NULL,
    patrocinadorid integer NOT NULL
);
 (   DROP TABLE public.patrocinadorxedicion;
       public         heap    postgres    false            �            1259    958847    patrocinadorxedicion_ID_seq    SEQUENCE     �   ALTER TABLE public.patrocinadorxedicion ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."patrocinadorxedicion_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    207            �            1259    958866    ruta    TABLE     d   CREATE TABLE public.ruta (
    "ID" integer NOT NULL,
    nombre character varying(100) NOT NULL
);
    DROP TABLE public.ruta;
       public         heap    postgres    false            �            1259    958864    ruta_ID_seq    SEQUENCE     �   ALTER TABLE public.ruta ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ruta_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    211            �            1259    950543    usuario    TABLE     �  CREATE TABLE public.usuario (
    "ID" integer NOT NULL,
    nombre character varying(20) NOT NULL,
    apellido character varying(30) NOT NULL,
    correo character varying(30) NOT NULL,
    contrasenna character varying(50) NOT NULL,
    cedula character varying(30) NOT NULL,
    "numeroTelefono" character varying(30) NOT NULL,
    direccion character varying(300) NOT NULL,
    imagen character varying(100) NOT NULL,
    edad integer NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �            1259    950541    usuario_ID_seq    SEQUENCE     �   ALTER TABLE public.usuario ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."usuario_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    201            "          0    958904 
   Itinerario 
   TABLE DATA           7   COPY public."Itinerario" ("ID", usuarioid) FROM stdin;
    public          postgres    false    221   �X                 0    958839    edicion 
   TABLE DATA           @   COPY public.edicion ("ID", nombre, detalles, fecha) FROM stdin;
    public          postgres    false    205   �X                  0    958897    evento 
   TABLE DATA           D   COPY public.evento ("ID", lugarid, horainicio, horafin) FROM stdin;
    public          postgres    false    219   �X       $          0    959000    eventoxitinerario 
   TABLE DATA           I   COPY public.eventoxitinerario ("ID", itinerarioid, eventoid) FROM stdin;
    public          postgres    false    223   Y                 0    958856    lugar 
   TABLE DATA           ?   COPY public.lugar ("ID", nombre, detalles, imagen) FROM stdin;
    public          postgres    false    209    Y                 0    958873 
   lugarxruta 
   TABLE DATA           ;   COPY public.lugarxruta ("ID", rutaid, lugarid) FROM stdin;
    public          postgres    false    213   rY                 0    958880 	   membresia 
   TABLE DATA           K   COPY public.membresia ("ID", nombre, detalles, imagen, precio) FROM stdin;
    public          postgres    false    215   �Y                 0    958890    membresiaxpersona 
   TABLE DATA           `   COPY public.membresiaxpersona ("ID", usuarioid, membresiaid, fechainicio, fechafin) FROM stdin;
    public          postgres    false    217   ^Z                 0    958829    patrocinador 
   TABLE DATA           <   COPY public.patrocinador ("ID", nombre, imagen) FROM stdin;
    public          postgres    false    203   {Z                 0    958849    patrocinadorxedicion 
   TABLE DATA           O   COPY public.patrocinadorxedicion ("ID", edicionid, patrocinadorid) FROM stdin;
    public          postgres    false    207   �Z                 0    958866    ruta 
   TABLE DATA           ,   COPY public.ruta ("ID", nombre) FROM stdin;
    public          postgres    false    211   �Z                 0    950543    usuario 
   TABLE DATA           �   COPY public.usuario ("ID", nombre, apellido, correo, contrasenna, cedula, "numeroTelefono", direccion, imagen, edad) FROM stdin;
    public          postgres    false    201   �Z       +           0    0    Itinerario_ID_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Itinerario_ID_seq"', 1, false);
          public          postgres    false    220            ,           0    0    Patrocinador_ID_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Patrocinador_ID_seq"', 1, false);
          public          postgres    false    202            -           0    0    edicion_ID_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."edicion_ID_seq"', 1, false);
          public          postgres    false    204            .           0    0    evento_ID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."evento_ID_seq"', 1, false);
          public          postgres    false    218            /           0    0    eventoxitinerario_ID_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."eventoxitinerario_ID_seq"', 1, false);
          public          postgres    false    222            0           0    0    lugar_ID_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."lugar_ID_seq"', 2, true);
          public          postgres    false    208            1           0    0    lugarxruta_ID_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."lugarxruta_ID_seq"', 2, true);
          public          postgres    false    212            2           0    0    membresia_ID_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."membresia_ID_seq"', 2, true);
          public          postgres    false    214            3           0    0    membresiaxpersona_ID_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."membresiaxpersona_ID_seq"', 1, false);
          public          postgres    false    216            4           0    0    patrocinadorxedicion_ID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."patrocinadorxedicion_ID_seq"', 1, false);
          public          postgres    false    206            5           0    0    ruta_ID_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."ruta_ID_seq"', 1, true);
          public          postgres    false    210            6           0    0    usuario_ID_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."usuario_ID_seq"', 1, false);
          public          postgres    false    200            ~           2606    958908    Itinerario Itinerario_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Itinerario"
    ADD CONSTRAINT "Itinerario_pkey" PRIMARY KEY ("ID");
 H   ALTER TABLE ONLY public."Itinerario" DROP CONSTRAINT "Itinerario_pkey";
       public            postgres    false    221            l           2606    958836    patrocinador Patrocinador_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.patrocinador
    ADD CONSTRAINT "Patrocinador_pkey" PRIMARY KEY ("ID");
 J   ALTER TABLE ONLY public.patrocinador DROP CONSTRAINT "Patrocinador_pkey";
       public            postgres    false    203            n           2606    958846    edicion edicion_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.edicion
    ADD CONSTRAINT edicion_pkey PRIMARY KEY ("ID");
 >   ALTER TABLE ONLY public.edicion DROP CONSTRAINT edicion_pkey;
       public            postgres    false    205            |           2606    958901    evento evento_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.evento
    ADD CONSTRAINT evento_pkey PRIMARY KEY ("ID");
 <   ALTER TABLE ONLY public.evento DROP CONSTRAINT evento_pkey;
       public            postgres    false    219            �           2606    959004 (   eventoxitinerario eventoxitinerario_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.eventoxitinerario
    ADD CONSTRAINT eventoxitinerario_pkey PRIMARY KEY ("ID");
 R   ALTER TABLE ONLY public.eventoxitinerario DROP CONSTRAINT eventoxitinerario_pkey;
       public            postgres    false    223            r           2606    958863    lugar lugar_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.lugar
    ADD CONSTRAINT lugar_pkey PRIMARY KEY ("ID");
 :   ALTER TABLE ONLY public.lugar DROP CONSTRAINT lugar_pkey;
       public            postgres    false    209            v           2606    958877    lugarxruta lugarxruta_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.lugarxruta
    ADD CONSTRAINT lugarxruta_pkey PRIMARY KEY ("ID");
 D   ALTER TABLE ONLY public.lugarxruta DROP CONSTRAINT lugarxruta_pkey;
       public            postgres    false    213            x           2606    958887    membresia membresia_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.membresia
    ADD CONSTRAINT membresia_pkey PRIMARY KEY ("ID");
 B   ALTER TABLE ONLY public.membresia DROP CONSTRAINT membresia_pkey;
       public            postgres    false    215            z           2606    958894 (   membresiaxpersona membresiaxpersona_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.membresiaxpersona
    ADD CONSTRAINT membresiaxpersona_pkey PRIMARY KEY ("ID");
 R   ALTER TABLE ONLY public.membresiaxpersona DROP CONSTRAINT membresiaxpersona_pkey;
       public            postgres    false    217            p           2606    958853 .   patrocinadorxedicion patrocinadorxedicion_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.patrocinadorxedicion
    ADD CONSTRAINT patrocinadorxedicion_pkey PRIMARY KEY ("ID");
 X   ALTER TABLE ONLY public.patrocinadorxedicion DROP CONSTRAINT patrocinadorxedicion_pkey;
       public            postgres    false    207            t           2606    958870    ruta ruta_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.ruta
    ADD CONSTRAINT ruta_pkey PRIMARY KEY ("ID");
 8   ALTER TABLE ONLY public.ruta DROP CONSTRAINT ruta_pkey;
       public            postgres    false    211            j           2606    950547    usuario usuario_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY ("ID");
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    201            �           2606    958949 4   patrocinadorxedicion edicion_patrocinadorxedicion_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.patrocinadorxedicion
    ADD CONSTRAINT "edicion_patrocinadorxedicion_FK" FOREIGN KEY (edicionid) REFERENCES public.edicion("ID") NOT VALID;
 `   ALTER TABLE ONLY public.patrocinadorxedicion DROP CONSTRAINT "edicion_patrocinadorxedicion_FK";
       public          postgres    false    205    2926    207            �           2606    959005 -   eventoxitinerario eventoxitinerario_evento_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.eventoxitinerario
    ADD CONSTRAINT "eventoxitinerario_evento_FK" FOREIGN KEY (eventoid) REFERENCES public.evento("ID");
 Y   ALTER TABLE ONLY public.eventoxitinerario DROP CONSTRAINT "eventoxitinerario_evento_FK";
       public          postgres    false    219    223    2940            �           2606    959010 1   eventoxitinerario eventoxitinerario_itinerario_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.eventoxitinerario
    ADD CONSTRAINT "eventoxitinerario_itinerario_FK" FOREIGN KEY (itinerarioid) REFERENCES public."Itinerario"("ID");
 ]   ALTER TABLE ONLY public.eventoxitinerario DROP CONSTRAINT "eventoxitinerario_itinerario_FK";
       public          postgres    false    223    2942    221            �           2606    958924    evento lugar_evento_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.evento
    ADD CONSTRAINT "lugar_evento_FK" FOREIGN KEY (lugarid) REFERENCES public.lugar("ID") NOT VALID;
 B   ALTER TABLE ONLY public.evento DROP CONSTRAINT "lugar_evento_FK";
       public          postgres    false    2930    209    219            �           2606    958934    lugarxruta lugar_lugarxruta_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.lugarxruta
    ADD CONSTRAINT "lugar_lugarxruta_FK" FOREIGN KEY (lugarid) REFERENCES public.lugar("ID") NOT VALID;
 J   ALTER TABLE ONLY public.lugarxruta DROP CONSTRAINT "lugar_lugarxruta_FK";
       public          postgres    false    213    209    2930            �           2606    958944 0   membresiaxpersona membresia_membresiaxpersona_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.membresiaxpersona
    ADD CONSTRAINT "membresia_membresiaxpersona_FK" FOREIGN KEY (membresiaid) REFERENCES public.membresia("ID") NOT VALID;
 \   ALTER TABLE ONLY public.membresiaxpersona DROP CONSTRAINT "membresia_membresiaxpersona_FK";
       public          postgres    false    215    2936    217            �           2606    958954 9   patrocinadorxedicion patrocinador_patrocinadorxedicion_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.patrocinadorxedicion
    ADD CONSTRAINT "patrocinador_patrocinadorxedicion_FK" FOREIGN KEY (patrocinadorid) REFERENCES public.patrocinador("ID") NOT VALID;
 e   ALTER TABLE ONLY public.patrocinadorxedicion DROP CONSTRAINT "patrocinador_patrocinadorxedicion_FK";
       public          postgres    false    207    203    2924            �           2606    958929    lugarxruta ruta_lugarxruta_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.lugarxruta
    ADD CONSTRAINT "ruta_lugarxruta_FK" FOREIGN KEY (rutaid) REFERENCES public.ruta("ID") NOT VALID;
 I   ALTER TABLE ONLY public.lugarxruta DROP CONSTRAINT "ruta_lugarxruta_FK";
       public          postgres    false    211    213    2932            �           2606    958909     Itinerario usuario_itinerario_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."Itinerario"
    ADD CONSTRAINT "usuario_itinerario_FK" FOREIGN KEY (usuarioid) REFERENCES public.usuario("ID") NOT VALID;
 N   ALTER TABLE ONLY public."Itinerario" DROP CONSTRAINT "usuario_itinerario_FK";
       public          postgres    false    221    201    2922            �           2606    958939 .   membresiaxpersona usuario_membresiaxpersona_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.membresiaxpersona
    ADD CONSTRAINT "usuario_membresiaxpersona_FK" FOREIGN KEY (usuarioid) REFERENCES public.usuario("ID") NOT VALID;
 Z   ALTER TABLE ONLY public.membresiaxpersona DROP CONSTRAINT "usuario_membresiaxpersona_FK";
       public          postgres    false    217    2922    201            "      x������ � �            x������ � �             x������ � �      $      x������ � �         B   x�3��--N�W�KL���K��t�Q����D��S�R�2�K2��8CRK�P5�@������� /"�            x�3�4�4�2�F\1z\\\ 	         �   x�%�1n�0Eg�\�9��hz�fȘ��X��L�d$9}�v">�����v߫Zm�	H����Y�f�aaZ�e ���e�V?����G�s���^�1RQ�i�Df54ֽ��$2?{���H�	d��$�������ds�|�_�am\u�N	�+ֹ;�������/k�P�            x������ � �            x������ � �            x������ � �            x�3��IT(*-ITpt����� 2n            x������ � �     