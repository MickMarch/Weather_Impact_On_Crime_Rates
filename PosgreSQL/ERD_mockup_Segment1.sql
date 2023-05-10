-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.assault
(
    "EVENT_UNIQUE_ID" text COLLATE pg_catalog."default" NOT NULL,
    "CRIME" text COLLATE pg_catalog."default",
    "OCC_YEAR" bigint,
    "OCC_MONTH" text COLLATE pg_catalog."default",
    "OCC_DAY" bigint,
    "OCC_DOW" text COLLATE pg_catalog."default",
    "OCC_HOUR" bigint,
    "PREMISES_TYPE" text COLLATE pg_catalog."default",
    "HOOD_140" text COLLATE pg_catalog."default",
    "NEIGHBOURHOOD_140" text COLLATE pg_catalog."default",
    "LONG_WGS84" double precision,
    "LAT_WGS84" double precision,
    date text COLLATE pg_catalog."default",
    "Unnamed: 13" double precision,
    "EVENT_UNIQUE_ID.1" text COLLATE pg_catalog."default",
    CONSTRAINT "pk_EVENT_UNIQUE_ID" PRIMARY KEY ("EVENT_UNIQUE_ID")
);

CREATE TABLE IF NOT EXISTS public.auto_theft
(
    "EVENT_UNIQUE_ID" text COLLATE pg_catalog."default",
    "CRIME" text COLLATE pg_catalog."default",
    "OCC_YEAR" bigint,
    "OCC_MONTH" text COLLATE pg_catalog."default",
    "OCC_DAY" bigint,
    "OCC_DOW" text COLLATE pg_catalog."default",
    "OCC_HOUR" bigint,
    "PREMISES_TYPE" text COLLATE pg_catalog."default",
    "HOOD_140" text COLLATE pg_catalog."default",
    "NEIGHBOURHOOD_140" text COLLATE pg_catalog."default",
    "LONG_WGS84" double precision,
    "LAT_WGS84" double precision,
    "OCC_DATETIME" text COLLATE pg_catalog."default"
);

CREATE TABLE IF NOT EXISTS public.bicycle_theft
(
    "EVENT_UNIQUE_ID" text COLLATE pg_catalog."default",
    "CRIME" text COLLATE pg_catalog."default",
    "OCC_YEAR" bigint,
    "OCC_MONTH" text COLLATE pg_catalog."default",
    "OCC_DAY" bigint,
    "OCC_DOW" text COLLATE pg_catalog."default",
    "OCC_HOUR" bigint,
    "PREMISES_TYPE" text COLLATE pg_catalog."default",
    "HOOD_140" text COLLATE pg_catalog."default",
    "NEIGHBOURHOOD_140" text COLLATE pg_catalog."default",
    "LONG_WGS84" double precision,
    "LAT_WGS84" double precision,
    "OCC_DATETIME" text COLLATE pg_catalog."default"
);

CREATE TABLE IF NOT EXISTS public.homicides
(
    "EVENT_UNIQUE_ID" text COLLATE pg_catalog."default" NOT NULL,
    "CRIME" text COLLATE pg_catalog."default",
    "OCC_YEAR" bigint,
    "OCC_MONTH" text COLLATE pg_catalog."default",
    "OCC_DAY" bigint,
    "OCC_DOW" text COLLATE pg_catalog."default",
    "OCC_HOUR" bigint,
    "PREMISES_TYPE" double precision,
    "HOOD_140" bigint,
    "NEIGHBOURHOOD_140" text COLLATE pg_catalog."default",
    "LONG_WGS84" double precision,
    "LAT_WGS84" double precision,
    date text COLLATE pg_catalog."default",
    CONSTRAINT pk_homicide PRIMARY KEY ("EVENT_UNIQUE_ID")
);

CREATE TABLE IF NOT EXISTS public.weather
(
    date text COLLATE pg_catalog."default" NOT NULL,
    max_temperature double precision,
    min_temperature double precision,
    max_relative_humidity bigint,
    avg_relative_humidity double precision,
    avg_pressure_sea double precision,
    max_wind_speed bigint,
    precipitation double precision,
    rain double precision,
    snow double precision,
    snow_on_ground bigint,
    daylight double precision,
    avg_cloud_cover_8 double precision,
    CONSTRAINT pk_date PRIMARY KEY (date)
);

ALTER TABLE IF EXISTS public.assault
    ADD CONSTRAINT fk_date FOREIGN KEY (date)
    REFERENCES public.weather (date) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.homicides
    ADD CONSTRAINT fk_date FOREIGN KEY (date)
    REFERENCES public.weather (date) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;