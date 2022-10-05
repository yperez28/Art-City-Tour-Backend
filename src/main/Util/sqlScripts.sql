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