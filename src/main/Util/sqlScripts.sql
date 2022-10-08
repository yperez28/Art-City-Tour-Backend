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
--NEWS  TABLE ITERATION2

CREATE TABLE public.news
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    title character varying(100) COLLATE pg_catalog."default" NOT NULL,
    description character varying(1200) COLLATE pg_catalog."default" NOT NULL,
    image_id integer,
    date date,
    CONSTRAINT news_pkey PRIMARY KEY (id),
    CONSTRAINT news_image_id_fkey FOREIGN KEY (image_id)
        REFERENCES public.image (image_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

-------------------------------------------------------------------------------------------------------------------------------------
--RESERVATION TABLES

CREATE TABLE public.reservation
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    place_id integer NOT NULL,
    first_time boolean NOT NULL,
    CONSTRAINT reservation_pkey PRIMARY KEY (id),
    CONSTRAINT reservation_place_id_fkey FOREIGN KEY (place_id)
        REFERENCES public.place (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)


CREATE TABLE public.companionxreservation
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    reservation_id integer NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT companionxreservation_pkey PRIMARY KEY (id),
    CONSTRAINT companionxreservation_reservation_id_fkey FOREIGN KEY (reservation_id)
        REFERENCES public.reservation (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT companionxreservation_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public."user" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)


CREATE TABLE public.reservationxuser
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    reservation_id integer NOT NULL,
    CONSTRAINT reservationxuser_pkey PRIMARY KEY (id),
    CONSTRAINT reservationxuser_reservation_id_fkey FOREIGN KEY (reservation_id)
        REFERENCES public.reservation (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT reservationxuser_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public."user" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

