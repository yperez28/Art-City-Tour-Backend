-------------------------------------------------ADD HERE ALL SQL SCRIPTS----------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------ADD TABLE FOR IMAGES-------------------------------------------------
CREATE TABLE IF NOT EXISTS image (
	image_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
	name text,
	drive_path text NOT NULL,
	CONSTRAINT image_id_pkey PRIMARY KEY (image_id)
);

CREATE TABLE IF NOT EXISTS images_edition(
	images_edition_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
	edition_id integer NOT NULL,
	image_id integer NOT NULL,
	CONSTRAINT images_edition_id_pkey PRIMARY KEY (images_edition_id),
    CONSTRAINT images_edition_edition_fk FOREIGN KEY (edition_id)
        REFERENCES public.edition (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------- ALTER TABLE FOR IMAGES --------------------------------------------------------------
ALTER TABLE membership
DROP COLUMN photo,
ADD COLUMN image_id integer NOT NULL,
ADD CONSTRAINT membership_image_fk FOREIGN KEY (image_id) REFERENCES image (image_id);

ALTER TABLE place
DROP COLUMN photo,
ADD COLUMN image_id integer,
ADD CONSTRAINT place_image_fk FOREIGN KEY (image_id) REFERENCES image (image_id);

ALTER TABLE sponsor
DROP COLUMN photo,
ADD COLUMN image_id integer,
ADD CONSTRAINT sponsor_image_fk FOREIGN KEY (image_id) REFERENCES image (image_id);

ALTER TABLE public.user
DROP COLUMN photo,
ADD COLUMN image_id integer,
ADD CONSTRAINT user_image_fk FOREIGN KEY (image_id) REFERENCES image (image_id);
-----------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------
-- NEW RESERVATION TABLE
DROP TABLE IF EXISTS public.reservation;

CREATE TABLE IF NOT EXISTS public.reservation
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    place_id integer NOT NULL,
    identification character varying(20) COLLATE pg_catalog."default" NOT NULL,
    age character varying(3) COLLATE pg_catalog."default" NOT NULL,
    name character varying(20) COLLATE pg_catalog."default" NOT NULL,
    lastname character varying(50) COLLATE pg_catalog."default" NOT NULL,
    email character varying(50) COLLATE pg_catalog."default" NOT NULL,
    phone_number character varying(11) COLLATE pg_catalog."default",
    is_first_time boolean NOT NULL,
    CONSTRAINT reservation_pkey PRIMARY KEY (id),
    CONSTRAINT reservation_place_id_fkey FOREIGN KEY (place_id)
        REFERENCES public.place (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.reservation
    OWNER to postgres;

--companion table
DROP TABLE IF EXISTS public.companion;

CREATE TABLE IF NOT EXISTS public.companion
(
    id integer NOT NULL,
    identification character varying(20) COLLATE pg_catalog."default" NOT NULL,
    age character varying(20) COLLATE pg_catalog."default" NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_companions PRIMARY KEY (id)
)

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.companion
    OWNER to postgres;

--companionxreservation table
DROP TABLE IF EXISTS public.companionxreservation;

CREATE TABLE IF NOT EXISTS public.companionxreservation
(
    id integer NOT NULL,
    reservation_id integer NOT NULL,
    companion_id integer NOT NULL,
    CONSTRAINT pk_companionxreservation PRIMARY KEY (id),
    CONSTRAINT fk_companion_id FOREIGN KEY (companion_id)
        REFERENCES public.companion (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_reservation_id FOREIGN KEY (reservation_id)
        REFERENCES public.reservation (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.companionxreservation
    OWNER to postgres;
---------------------------------------------------------------------------------------------------------------------
