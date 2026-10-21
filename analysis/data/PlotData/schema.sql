-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

SET client_encoding = 'UTF-8';

CREATE TABLE IF NOT EXISTS "listplotvariables"
 (
	"id"			INTEGER, 
	"label"			VARCHAR (50), 
	"units"			VARCHAR (50), 
	"name"			VARCHAR (10)
);
COMMENT ON COLUMN "listplotvariables"."label" IS 'Parameter Name';
COMMENT ON COLUMN "listplotvariables"."units" IS 'Units';
COMMENT ON COLUMN "listplotvariables"."name" IS 'Variable Name from PlotData database';

-- CREATE INDEXES ...
ALTER TABLE "listplotvariables" ADD CONSTRAINT "listplotvariables_pkey" PRIMARY KEY ("id");

CREATE TABLE IF NOT EXISTS "plotdata"
 (
	"p"			DOUBLE PRECISION, 
	"tavg"			DOUBLE PRECISION, 
	"tha"			DOUBLE PRECISION, 
	"thb"			DOUBLE PRECISION, 
	"tca"			DOUBLE PRECISION, 
	"tcb"			DOUBLE PRECISION, 
	"wrca"			DOUBLE PRECISION, 
	"wrcb"			DOUBLE PRECISION, 
	"psga"			DOUBLE PRECISION, 
	"psgb"			DOUBLE PRECISION, 
	"wfwa"			DOUBLE PRECISION, 
	"wfwb"			DOUBLE PRECISION, 
	"wsta"			DOUBLE PRECISION, 
	"wstb"			DOUBLE PRECISION, 
	"vol"			DOUBLE PRECISION, 
	"lvpz"			DOUBLE PRECISION, 
	"void"			DOUBLE PRECISION, 
	"wlr"			DOUBLE PRECISION, 
	"wup"			DOUBLE PRECISION, 
	"hup"			DOUBLE PRECISION, 
	"hlw"			DOUBLE PRECISION, 
	"whpi"			DOUBLE PRECISION, 
	"wecs"			DOUBLE PRECISION, 
	"qmwt"			DOUBLE PRECISION, 
	"lsga"			DOUBLE PRECISION, 
	"lsgb"			DOUBLE PRECISION, 
	"qmga"			DOUBLE PRECISION, 
	"qmgb"			DOUBLE PRECISION, 
	"nsga"			DOUBLE PRECISION, 
	"nsgb"			DOUBLE PRECISION, 
	"tbld"			DOUBLE PRECISION, 
	"wtra"			DOUBLE PRECISION, 
	"wtrb"			DOUBLE PRECISION, 
	"tsat"			DOUBLE PRECISION, 
	"qrhr"			DOUBLE PRECISION, 
	"lvcr"			DOUBLE PRECISION, 
	"scma"			DOUBLE PRECISION, 
	"scmb"			DOUBLE PRECISION, 
	"frcl"			DOUBLE PRECISION, 
	"prb"			DOUBLE PRECISION, 
	"prba"			DOUBLE PRECISION, 
	"trb"			DOUBLE PRECISION, 
	"lwrb"			DOUBLE PRECISION, 
	"dnbr"			DOUBLE PRECISION, 
	"qfcl"			DOUBLE PRECISION, 
	"wbk"			DOUBLE PRECISION, 
	"wspy"			DOUBLE PRECISION, 
	"wcsp"			DOUBLE PRECISION, 
	"htr"			DOUBLE PRECISION, 
	"mh2"			DOUBLE PRECISION, 
	"cnh2"			DOUBLE PRECISION, 
	"rhbr"			DOUBLE PRECISION, 
	"rhmt"			DOUBLE PRECISION, 
	"rhfl"			DOUBLE PRECISION, 
	"rhrd"			DOUBLE PRECISION, 
	"rh"			DOUBLE PRECISION, 
	"pwnt"			DOUBLE PRECISION, 
	"pwr"			DOUBLE PRECISION, 
	"tfsb"			DOUBLE PRECISION, 
	"tfpk"			DOUBLE PRECISION, 
	"tf"			DOUBLE PRECISION, 
	"tpct"			DOUBLE PRECISION, 
	"wcft"			DOUBLE PRECISION, 
	"wlpi"			DOUBLE PRECISION, 
	"wchg"			DOUBLE PRECISION, 
	"rm1"			DOUBLE PRECISION, 
	"rm2"			DOUBLE PRECISION, 
	"rm3"			DOUBLE PRECISION, 
	"rm4"			DOUBLE PRECISION, 
	"rc87"			DOUBLE PRECISION, 
	"rc131"			DOUBLE PRECISION, 
	"strb"			DOUBLE PRECISION, 
	"stsg"			DOUBLE PRECISION, 
	"sttb"			DOUBLE PRECISION, 
	"rblk"			DOUBLE PRECISION, 
	"sglk"			DOUBLE PRECISION, 
	"dthy"			DOUBLE PRECISION, 
	"dwb"			DOUBLE PRECISION, 
	"wrla"			DOUBLE PRECISION, 
	"wrlb"			DOUBLE PRECISION, 
	"wld"			DOUBLE PRECISION, 
	"mbk"			DOUBLE PRECISION, 
	"ebk"			DOUBLE PRECISION, 
	"tklv"			DOUBLE PRECISION, 
	"frzr"			REAL, 
	"tdbr"			REAL, 
	"mdbr"			REAL, 
	"mcrt"			REAL, 
	"mgas"			REAL, 
	"tcrt"			REAL, 
	"tslp"			REAL, 
	"ppm"			DOUBLE PRECISION, 
	"time"			REAL
);
COMMENT ON COLUMN "plotdata"."p" IS '1';
COMMENT ON COLUMN "plotdata"."tavg" IS '2';
COMMENT ON COLUMN "plotdata"."tha" IS '3';
COMMENT ON COLUMN "plotdata"."thb" IS '4';
COMMENT ON COLUMN "plotdata"."tca" IS '5';
COMMENT ON COLUMN "plotdata"."tcb" IS '6';
COMMENT ON COLUMN "plotdata"."wrca" IS '7';
COMMENT ON COLUMN "plotdata"."wrcb" IS '8';
COMMENT ON COLUMN "plotdata"."psga" IS '9';
COMMENT ON COLUMN "plotdata"."psgb" IS '10';
COMMENT ON COLUMN "plotdata"."wfwa" IS '11';
COMMENT ON COLUMN "plotdata"."wfwb" IS '12';
COMMENT ON COLUMN "plotdata"."wsta" IS '13';
COMMENT ON COLUMN "plotdata"."wstb" IS '14';
COMMENT ON COLUMN "plotdata"."vol" IS '15';
COMMENT ON COLUMN "plotdata"."lvpz" IS '16';
COMMENT ON COLUMN "plotdata"."void" IS '17';
COMMENT ON COLUMN "plotdata"."wlr" IS '18';
COMMENT ON COLUMN "plotdata"."wup" IS '19';
COMMENT ON COLUMN "plotdata"."hup" IS '20';
COMMENT ON COLUMN "plotdata"."hlw" IS '21';
COMMENT ON COLUMN "plotdata"."whpi" IS '22';
COMMENT ON COLUMN "plotdata"."wecs" IS '23';
COMMENT ON COLUMN "plotdata"."qmwt" IS '24';
COMMENT ON COLUMN "plotdata"."lsga" IS '25';
COMMENT ON COLUMN "plotdata"."lsgb" IS '26';
COMMENT ON COLUMN "plotdata"."qmga" IS '27';
COMMENT ON COLUMN "plotdata"."qmgb" IS '28';
COMMENT ON COLUMN "plotdata"."nsga" IS '29';
COMMENT ON COLUMN "plotdata"."nsgb" IS '30';
COMMENT ON COLUMN "plotdata"."tbld" IS '31';
COMMENT ON COLUMN "plotdata"."wtra" IS '32';
COMMENT ON COLUMN "plotdata"."wtrb" IS '33';
COMMENT ON COLUMN "plotdata"."tsat" IS '34';
COMMENT ON COLUMN "plotdata"."qrhr" IS '35';
COMMENT ON COLUMN "plotdata"."lvcr" IS '36';
COMMENT ON COLUMN "plotdata"."scma" IS '37';
COMMENT ON COLUMN "plotdata"."scmb" IS '38';
COMMENT ON COLUMN "plotdata"."frcl" IS '29';
COMMENT ON COLUMN "plotdata"."prb" IS '40';
COMMENT ON COLUMN "plotdata"."prba" IS '41';
COMMENT ON COLUMN "plotdata"."trb" IS '42';
COMMENT ON COLUMN "plotdata"."lwrb" IS '43';
COMMENT ON COLUMN "plotdata"."dnbr" IS '44';
COMMENT ON COLUMN "plotdata"."qfcl" IS '45';
COMMENT ON COLUMN "plotdata"."wbk" IS '46';
COMMENT ON COLUMN "plotdata"."wspy" IS '47';
COMMENT ON COLUMN "plotdata"."wcsp" IS '48';
COMMENT ON COLUMN "plotdata"."htr" IS '49';
COMMENT ON COLUMN "plotdata"."mh2" IS '50';
COMMENT ON COLUMN "plotdata"."cnh2" IS '51';
COMMENT ON COLUMN "plotdata"."rhbr" IS '52';
COMMENT ON COLUMN "plotdata"."rhmt" IS '53';
COMMENT ON COLUMN "plotdata"."rhfl" IS '54';
COMMENT ON COLUMN "plotdata"."rhrd" IS '55';
COMMENT ON COLUMN "plotdata"."rh" IS '56';
COMMENT ON COLUMN "plotdata"."pwnt" IS '57';
COMMENT ON COLUMN "plotdata"."pwr" IS '58';
COMMENT ON COLUMN "plotdata"."tfsb" IS '59';
COMMENT ON COLUMN "plotdata"."tfpk" IS '60';
COMMENT ON COLUMN "plotdata"."tf" IS '61';
COMMENT ON COLUMN "plotdata"."tpct" IS '62';
COMMENT ON COLUMN "plotdata"."wcft" IS '63';
COMMENT ON COLUMN "plotdata"."wlpi" IS '64';
COMMENT ON COLUMN "plotdata"."wchg" IS '65';
COMMENT ON COLUMN "plotdata"."rm1" IS '66';
COMMENT ON COLUMN "plotdata"."rm2" IS '67';
COMMENT ON COLUMN "plotdata"."rm3" IS '68';
COMMENT ON COLUMN "plotdata"."rm4" IS '69';
COMMENT ON COLUMN "plotdata"."rc87" IS '70';
COMMENT ON COLUMN "plotdata"."rc131" IS '71';
COMMENT ON COLUMN "plotdata"."strb" IS '72';
COMMENT ON COLUMN "plotdata"."stsg" IS '73';
COMMENT ON COLUMN "plotdata"."sttb" IS '74';
COMMENT ON COLUMN "plotdata"."rblk" IS '75';
COMMENT ON COLUMN "plotdata"."sglk" IS '76';
COMMENT ON COLUMN "plotdata"."dthy" IS '77';
COMMENT ON COLUMN "plotdata"."dwb" IS '78';
COMMENT ON COLUMN "plotdata"."wrla" IS '80';
COMMENT ON COLUMN "plotdata"."wrlb" IS '81';
COMMENT ON COLUMN "plotdata"."wld" IS '82';
COMMENT ON COLUMN "plotdata"."mbk" IS '83';
COMMENT ON COLUMN "plotdata"."ebk" IS '84';
COMMENT ON COLUMN "plotdata"."tklv" IS '85';
COMMENT ON COLUMN "plotdata"."frzr" IS '86';
COMMENT ON COLUMN "plotdata"."tdbr" IS '87';
COMMENT ON COLUMN "plotdata"."mdbr" IS '88';
COMMENT ON COLUMN "plotdata"."mcrt" IS '89';
COMMENT ON COLUMN "plotdata"."mgas" IS '90';
COMMENT ON COLUMN "plotdata"."tcrt" IS '91';
COMMENT ON COLUMN "plotdata"."tslp" IS '92';
COMMENT ON COLUMN "plotdata"."ppm" IS '93';
COMMENT ON COLUMN "plotdata"."time" IS '79';

-- CREATE INDEXES ...
CREATE UNIQUE INDEX "plotdata_time_idx" ON "plotdata" ("time");


-- CREATE Relationships ...
-- relationships are not implemented for postgres
