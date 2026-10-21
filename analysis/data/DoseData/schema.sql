-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

SET client_encoding = 'UTF-8';

CREATE TABLE IF NOT EXISTS "listds"
 (
	"time"			REAL, 
	"i132"			DOUBLE PRECISION, 
	"i133"			DOUBLE PRECISION, 
	"i134"			DOUBLE PRECISION, 
	"i135"			DOUBLE PRECISION, 
	"i131"			DOUBLE PRECISION, 
	"kr83m"			DOUBLE PRECISION, 
	"kr85m"			DOUBLE PRECISION, 
	"kr85"			DOUBLE PRECISION, 
	"kr87"			DOUBLE PRECISION, 
	"kr88"			DOUBLE PRECISION, 
	"xe131m"			DOUBLE PRECISION, 
	"xe133m"			DOUBLE PRECISION, 
	"xe133"			DOUBLE PRECISION, 
	"xe135m"			DOUBLE PRECISION, 
	"xe135"			DOUBLE PRECISION, 
	"xe138"			DOUBLE PRECISION, 
	"co58"			DOUBLE PRECISION, 
	"co60"			DOUBLE PRECISION, 
	"rb86"			DOUBLE PRECISION, 
	"sr89"			DOUBLE PRECISION, 
	"sr90"			DOUBLE PRECISION, 
	"y90"			DOUBLE PRECISION, 
	"y91"			DOUBLE PRECISION, 
	"zr95"			DOUBLE PRECISION, 
	"nb95"			DOUBLE PRECISION, 
	"mo99"			DOUBLE PRECISION, 
	"tc99m"			DOUBLE PRECISION, 
	"ru103"			DOUBLE PRECISION, 
	"ru106"			DOUBLE PRECISION, 
	"sb127"			DOUBLE PRECISION, 
	"te127"			DOUBLE PRECISION, 
	"te127m"			DOUBLE PRECISION, 
	"te129"			DOUBLE PRECISION, 
	"te129m"			DOUBLE PRECISION, 
	"te132"			DOUBLE PRECISION, 
	"cs134"			DOUBLE PRECISION, 
	"cs136"			DOUBLE PRECISION, 
	"cs137"			DOUBLE PRECISION, 
	"ba140"			DOUBLE PRECISION, 
	"la140"			DOUBLE PRECISION, 
	"ce141"			DOUBLE PRECISION, 
	"ce144"			DOUBLE PRECISION, 
	"pr143"			DOUBLE PRECISION, 
	"nd147"			DOUBLE PRECISION, 
	"np239"			DOUBLE PRECISION, 
	"pu238"			DOUBLE PRECISION, 
	"pu239"			DOUBLE PRECISION, 
	"pu240"			DOUBLE PRECISION, 
	"pu241"			DOUBLE PRECISION, 
	"am241"			DOUBLE PRECISION, 
	"cm242"			DOUBLE PRECISION, 
	"cm244"			DOUBLE PRECISION
);
COMMENT ON COLUMN "listds"."time" IS 'TIME';
COMMENT ON COLUMN "listds"."i132" IS '2';
COMMENT ON COLUMN "listds"."i133" IS '3';
COMMENT ON COLUMN "listds"."i134" IS '4';
COMMENT ON COLUMN "listds"."i135" IS '5';
COMMENT ON COLUMN "listds"."i131" IS '1';
COMMENT ON COLUMN "listds"."kr83m" IS '6';
COMMENT ON COLUMN "listds"."kr85m" IS '7';
COMMENT ON COLUMN "listds"."kr85" IS '8';
COMMENT ON COLUMN "listds"."kr87" IS '9';
COMMENT ON COLUMN "listds"."kr88" IS '10';
COMMENT ON COLUMN "listds"."xe131m" IS '11';
COMMENT ON COLUMN "listds"."xe133m" IS '12';
COMMENT ON COLUMN "listds"."xe133" IS '13';
COMMENT ON COLUMN "listds"."xe135m" IS '14';
COMMENT ON COLUMN "listds"."xe135" IS '15';
COMMENT ON COLUMN "listds"."xe138" IS '16';
COMMENT ON COLUMN "listds"."co58" IS '17';
COMMENT ON COLUMN "listds"."co60" IS '18';
COMMENT ON COLUMN "listds"."rb86" IS '19';
COMMENT ON COLUMN "listds"."sr89" IS '20';
COMMENT ON COLUMN "listds"."sr90" IS '21';
COMMENT ON COLUMN "listds"."y90" IS '22';
COMMENT ON COLUMN "listds"."y91" IS '23';
COMMENT ON COLUMN "listds"."zr95" IS '24';
COMMENT ON COLUMN "listds"."nb95" IS '25';
COMMENT ON COLUMN "listds"."mo99" IS '26';
COMMENT ON COLUMN "listds"."tc99m" IS '27';
COMMENT ON COLUMN "listds"."ru103" IS '28';
COMMENT ON COLUMN "listds"."ru106" IS '29';
COMMENT ON COLUMN "listds"."sb127" IS '30';
COMMENT ON COLUMN "listds"."te127" IS '31';
COMMENT ON COLUMN "listds"."te127m" IS '32';
COMMENT ON COLUMN "listds"."te129" IS '33';
COMMENT ON COLUMN "listds"."te129m" IS '34';
COMMENT ON COLUMN "listds"."te132" IS '35';
COMMENT ON COLUMN "listds"."cs134" IS '35';
COMMENT ON COLUMN "listds"."cs136" IS '37';
COMMENT ON COLUMN "listds"."cs137" IS '38';
COMMENT ON COLUMN "listds"."ba140" IS '39';
COMMENT ON COLUMN "listds"."la140" IS '40';
COMMENT ON COLUMN "listds"."ce141" IS '41';
COMMENT ON COLUMN "listds"."ce144" IS '42';
COMMENT ON COLUMN "listds"."pr143" IS '43';
COMMENT ON COLUMN "listds"."nd147" IS '44';
COMMENT ON COLUMN "listds"."np239" IS '45';
COMMENT ON COLUMN "listds"."pu238" IS '46';
COMMENT ON COLUMN "listds"."pu239" IS '47';
COMMENT ON COLUMN "listds"."pu240" IS '48';
COMMENT ON COLUMN "listds"."pu241" IS '49';
COMMENT ON COLUMN "listds"."am241" IS '50';
COMMENT ON COLUMN "listds"."cm242" IS '51';
COMMENT ON COLUMN "listds"."cm244" IS '52';

-- CREATE INDEXES ...
ALTER TABLE "listds" ADD CONSTRAINT "listds_pkey" PRIMARY KEY ("time");
CREATE UNIQUE INDEX "listds_time_idx" ON "listds" ("time");


-- CREATE Relationships ...
-- relationships are not implemented for postgres
