-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

SET client_encoding = 'UTF-8';

CREATE TABLE IF NOT EXISTS "pctran options"
 (
	"set"			DOUBLE PRECISION, 
	"yminimum"			REAL, 
	"ymaximum"			REAL, 
	"xspan"			REAL, 
	"xscroll"			REAL, 
	"plotstayontop"			BOOLEAN NOT NULL, 
	"displaydatetime"			BOOLEAN NOT NULL, 
	"displaylegend"			BOOLEAN NOT NULL, 
	"displayplottitle"			BOOLEAN NOT NULL, 
	"printlocation"			INTEGER, 
	"scalingmethod"			INTEGER, 
	"printformat"			INTEGER, 
	"timescreenout"			REAL, 
	"timeplotout"			REAL, 
	"timebackout"			REAL, 
	"reportstayontop"			BOOLEAN NOT NULL, 
	"savevalvereports"			BOOLEAN NOT NULL, 
	"savepumpreports"			BOOLEAN NOT NULL, 
	"savecontrolreports"			BOOLEAN NOT NULL, 
	"savehxreports"			BOOLEAN NOT NULL, 
	"saverupdskreports"			BOOLEAN NOT NULL, 
	"savevacbkrreports"			BOOLEAN NOT NULL, 
	"savemalfreports"			BOOLEAN NOT NULL, 
	"mimicprintorientation"			INTEGER, 
	"mimicprintquality"			INTEGER, 
	"mimicprintcopies"			INTEGER, 
	"ptplotspan"			REAL, 
	"ptplotscroll"			REAL, 
	"ptplotstayontop"			BOOLEAN NOT NULL, 
	"timedoseout"			REAL, 
	"timeexcstart"			TIMESTAMP WITHOUT TIME ZONE
);
COMMENT ON COLUMN "pctran options"."yminimum" IS 'Y-Axis Minimum';
COMMENT ON COLUMN "pctran options"."ymaximum" IS 'Y-Axis Maximum';
COMMENT ON COLUMN "pctran options"."xspan" IS 'X-Axis Span (sec)';
COMMENT ON COLUMN "pctran options"."xscroll" IS 'X-Axis Scroll (sec)';
COMMENT ON COLUMN "pctran options"."plotstayontop" IS 'Plot Always Top Window When Not Closed';
COMMENT ON COLUMN "pctran options"."displaydatetime" IS 'Display Date & Time on Plot';
COMMENT ON COLUMN "pctran options"."displaylegend" IS 'Display Legend on Plot';
COMMENT ON COLUMN "pctran options"."displayplottitle" IS 'Display Plot Title on Plot';
COMMENT ON COLUMN "pctran options"."printlocation" IS '0=Clipboard, 1=File, 2=Printer';
COMMENT ON COLUMN "pctran options"."scalingmethod" IS '0=None, 1=To Fit, 2=To Max, 3=To Height, 4=To Width';
COMMENT ON COLUMN "pctran options"."printformat" IS '0=Bitmap, 1=Metafile, 2=Enhanced Metafile';
COMMENT ON COLUMN "pctran options"."timescreenout" IS 'Rate of Output to Screen';
COMMENT ON COLUMN "pctran options"."timeplotout" IS 'Rate of Output to Plot';
COMMENT ON COLUMN "pctran options"."timebackout" IS 'Rate of Output to BackTrack Record';
COMMENT ON COLUMN "pctran options"."reportstayontop" IS 'Report Always Top Window when Not Closed';
COMMENT ON COLUMN "pctran options"."savevalvereports" IS 'Report Valve Changes';
COMMENT ON COLUMN "pctran options"."savepumpreports" IS 'Report Pump Changes';
COMMENT ON COLUMN "pctran options"."savecontrolreports" IS 'Report Control Changes';
COMMENT ON COLUMN "pctran options"."savehxreports" IS 'Report HX Changes';
COMMENT ON COLUMN "pctran options"."saverupdskreports" IS 'Report Rupture Disk Changes';
COMMENT ON COLUMN "pctran options"."savevacbkrreports" IS 'Report Vacuum Breaker Changes';
COMMENT ON COLUMN "pctran options"."savemalfreports" IS 'Report Malfunction Changes';
COMMENT ON COLUMN "pctran options"."mimicprintorientation" IS 'Mimic Print Orientation (1=portrait, 2=landscape)';
COMMENT ON COLUMN "pctran options"."mimicprintquality" IS 'Mimic Print Quality (-1=draft, -2=low, -3=medium, -4=high)';
COMMENT ON COLUMN "pctran options"."mimicprintcopies" IS 'Mimic Print Copies';
COMMENT ON COLUMN "pctran options"."ptplotspan" IS 'PT Plot Time Span (sec)';
COMMENT ON COLUMN "pctran options"."ptplotscroll" IS 'PT Plot Time Scroll (seec)';
COMMENT ON COLUMN "pctran options"."ptplotstayontop" IS 'PT Plot Always Top Window When Not Closed';
COMMENT ON COLUMN "pctran options"."timedoseout" IS 'Rate of Dose Output Record';
COMMENT ON COLUMN "pctran options"."timeexcstart" IS 'Exercise Start Time xx/xx/xx yy:yy:yy am';

-- CREATE INDEXES ...
ALTER TABLE "pctran options" ADD CONSTRAINT "pctran options_pkey" PRIMARY KEY ("set");

CREATE TABLE IF NOT EXISTS "print formats"
 (
	"id"			INTEGER, 
	"format"			VARCHAR (50)
);

-- CREATE INDEXES ...
ALTER TABLE "print formats" ADD CONSTRAINT "print formats_pkey" PRIMARY KEY ("id");

CREATE TABLE IF NOT EXISTS "print locations"
 (
	"id"			INTEGER, 
	"print location"			VARCHAR (50)
);

-- CREATE INDEXES ...
CREATE INDEX "print locations_id_idx" ON "print locations" ("id");
ALTER TABLE "print locations" ADD CONSTRAINT "print locations_pkey" PRIMARY KEY ("id");

CREATE TABLE IF NOT EXISTS "scaling methods"
 (
	"id"			INTEGER, 
	"scaling method"			VARCHAR (50)
);

-- CREATE INDEXES ...
CREATE INDEX "scaling methods_id_idx" ON "scaling methods" ("id");
ALTER TABLE "scaling methods" ADD CONSTRAINT "scaling methods_pkey" PRIMARY KEY ("id");


-- CREATE Relationships ...
-- Relationship from "PCTran Options" ("printlocation") to "Print Locations"("id") does not enforce integrity.
-- Relationship from "PCTran Options" ("scalingmethod") to "Scaling Methods"("id") does not enforce integrity.
-- Relationship from "PCTran Options" ("printformat") to "Print Formats"("id") does not enforce integrity.
