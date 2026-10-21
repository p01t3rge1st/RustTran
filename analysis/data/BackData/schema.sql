-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

SET client_encoding = 'UTF-8';

CREATE TABLE IF NOT EXISTS "basicdata"
 (
	"set"			INTEGER, 
	"description"			VARCHAR (50), 
	"power"			REAL, 
	"p0"			DOUBLE PRECISION, 
	"t0"			DOUBLE PRECISION, 
	"wrc0"			REAL, 
	"tcst"			DOUBLE PRECISION, 
	"rcp"			DOUBLE PRECISION, 
	"aporv"			REAL, 
	"asaft"			DOUBLE PRECISION, 
	"porv1"			DOUBLE PRECISION, 
	"porv2"			DOUBLE PRECISION, 
	"saft1"			DOUBLE PRECISION, 
	"saft2"			DOUBLE PRECISION, 
	"phigh"			DOUBLE PRECISION, 
	"tefw0"			DOUBLE PRECISION, 
	"al0"			DOUBLE PRECISION, 
	"phpi"			DOUBLE PRECISION, 
	"pscram"			DOUBLE PRECISION, 
	"temp"			DOUBLE PRECISION, 
	"padv"			DOUBLE PRECISION, 
	"adv"			DOUBLE PRECISION, 
	"wld0"			DOUBLE PRECISION, 
	"chg"			DOUBLE PRECISION, 
	"trin"			DOUBLE PRECISION, 
	"trot"			DOUBLE PRECISION, 
	"akrd"			DOUBLE PRECISION, 
	"akchg"			DOUBLE PRECISION, 
	"gfw"			DOUBLE PRECISION, 
	"vsg"			DOUBLE PRECISION, 
	"tbv"			DOUBLE PRECISION, 
	"hmfw"			DOUBLE PRECISION, 
	"trxt"			DOUBLE PRECISION, 
	"ter1"			DOUBLE PRECISION, 
	"efw"			DOUBLE PRECISION, 
	"vprz"			DOUBLE PRECISION, 
	"vrcs"			DOUBLE PRECISION, 
	"msg0"			DOUBLE PRECISION, 
	"tsg0"			DOUBLE PRECISION, 
	"ssms"			DOUBLE PRECISION, 
	"uo2ms"			DOUBLE PRECISION, 
	"wtr0"			DOUBLE PRECISION, 
	"pcft"			DOUBLE PRECISION, 
	"cft"			DOUBLE PRECISION, 
	"wcf0"			DOUBLE PRECISION, 
	"plpi"			DOUBLE PRECISION, 
	"tavgl"			DOUBLE PRECISION, 
	"ulsg"			DOUBLE PRECISION, 
	"hrlv"			DOUBLE PRECISION, 
	"spry"			DOUBLE PRECISION, 
	"psp1"			DOUBLE PRECISION, 
	"psp2"			DOUBLE PRECISION, 
	"htr1"			DOUBLE PRECISION, 
	"phtr1"			DOUBLE PRECISION, 
	"phtr2"			DOUBLE PRECISION, 
	"phtrb"			DOUBLE PRECISION, 
	"vtaf"			DOUBLE PRECISION, 
	"ataf"			DOUBLE PRECISION, 
	"lsg0"			DOUBLE PRECISION, 
	"psg100"			DOUBLE PRECISION, 
	"htrb"			DOUBLE PRECISION, 
	"lpsg"			DOUBLE PRECISION, 
	"gstm"			DOUBLE PRECISION, 
	"ter2"			DOUBLE PRECISION, 
	"sghh"			DOUBLE PRECISION, 
	"asg1"			DOUBLE PRECISION, 
	"rlsg"			DOUBLE PRECISION, 
	"sgll"			DOUBLE PRECISION, 
	"cftn2"			DOUBLE PRECISION, 
	"ph(1)"			DOUBLE PRECISION, 
	"ph(2)"			DOUBLE PRECISION, 
	"ph(3)"			DOUBLE PRECISION, 
	"ph(4)"			DOUBLE PRECISION, 
	"ph(5)"			DOUBLE PRECISION, 
	"ph(6)"			DOUBLE PRECISION, 
	"ph(7)"			DOUBLE PRECISION, 
	"wh(1)"			DOUBLE PRECISION, 
	"wh(2)"			DOUBLE PRECISION, 
	"wh(3)"			DOUBLE PRECISION, 
	"wh(4)"			DOUBLE PRECISION, 
	"wh(5)"			DOUBLE PRECISION, 
	"wh(6)"			DOUBLE PRECISION, 
	"wh(7)"			DOUBLE PRECISION, 
	"pl(1)"			DOUBLE PRECISION, 
	"pl(2)"			DOUBLE PRECISION, 
	"pl(3)"			DOUBLE PRECISION, 
	"pl(4)"			DOUBLE PRECISION, 
	"pl(5)"			DOUBLE PRECISION, 
	"pl(6)"			DOUBLE PRECISION, 
	"pl(7)"			DOUBLE PRECISION, 
	"wl(1)"			DOUBLE PRECISION, 
	"wl(2)"			DOUBLE PRECISION, 
	"wl(3)"			DOUBLE PRECISION, 
	"wl(4)"			DOUBLE PRECISION, 
	"wl(5)"			DOUBLE PRECISION, 
	"wl(6)"			DOUBLE PRECISION, 
	"wl(7)"			DOUBLE PRECISION, 
	"pcsp"			DOUBLE PRECISION, 
	"gcsp"			DOUBLE PRECISION, 
	"ustc"			DOUBLE PRECISION, 
	"tf0"			DOUBLE PRECISION, 
	"pdsn"			DOUBLE PRECISION, 
	"wsv"			DOUBLE PRECISION, 
	"psv"			DOUBLE PRECISION, 
	"trb0"			DOUBLE PRECISION, 
	"prb0"			DOUBLE PRECISION, 
	"lwrb0"			DOUBLE PRECISION, 
	"arb"			DOUBLE PRECISION, 
	"vrb"			DOUBLE PRECISION, 
	"pfcl"			DOUBLE PRECISION, 
	"qcsp0"			DOUBLE PRECISION, 
	"qcl0"			DOUBLE PRECISION, 
	"tdsn"			DOUBLE PRECISION, 
	"crtm"			DOUBLE PRECISION, 
	"stlm"			DOUBLE PRECISION, 
	"rlk0"			DOUBLE PRECISION, 
	"pcrt"			DOUBLE PRECISION, 
	"rdsp"			DOUBLE PRECISION, 
	"qrhr0"			DOUBLE PRECISION, 
	"tank0"			DOUBLE PRECISION, 
	"tkmin"			DOUBLE PRECISION, 
	"prbh"			REAL, 
	"lpzl"			REAL, 
	"psgl"			REAL, 
	"phpl"			REAL, 
	"hcor"			REAL, 
	"afut"			REAL, 
	"mzrkt"			REAL, 
	"mzrst"			REAL, 
	"mcrt"			REAL, 
	"mves"			REAL, 
	"cnh2b"			REAL, 
	"fh2o"			REAL, 
	"fco2"			REAL, 
	"fdec"			REAL, 
	"wvnt0"			REAL, 
	"ppmec"			REAL
);
COMMENT ON COLUMN "basicdata"."set" IS 'Set of Basic Data';
COMMENT ON COLUMN "basicdata"."description" IS 'Plant Description';
COMMENT ON COLUMN "basicdata"."power" IS 'Rated Thermal  Power (MW)';
COMMENT ON COLUMN "basicdata"."p0" IS 'RCS initial pressure (Bar)';
COMMENT ON COLUMN "basicdata"."t0" IS 'RCS initial average temperature  (°C)';
COMMENT ON COLUMN "basicdata"."wrc0" IS 'Total core flow rate (t/hr)';
COMMENT ON COLUMN "basicdata"."tcst" IS 'RCP coastdown time (sec)';
COMMENT ON COLUMN "basicdata"."rcp" IS 'Total RCP heat input (MWt)';
COMMENT ON COLUMN "basicdata"."aporv" IS 'Area of PORV (cm2) per valve';
COMMENT ON COLUMN "basicdata"."asaft" IS 'Area of pressurizer safeties (cm2) valves combined';
COMMENT ON COLUMN "basicdata"."porv1" IS 'PORV open setpoint (bar)';
COMMENT ON COLUMN "basicdata"."porv2" IS 'PORV reseat setpoint (bar)';
COMMENT ON COLUMN "basicdata"."saft1" IS 'Safety valve open setpoint (bar)';
COMMENT ON COLUMN "basicdata"."saft2" IS 'Safety valve reseat setpoint  (bar)';
COMMENT ON COLUMN "basicdata"."phigh" IS 'High pressure reactor scram setpoint (bar)';
COMMENT ON COLUMN "basicdata"."tefw0" IS 'EFW initiation delay time (sec) after initiation signal (sec)';
COMMENT ON COLUMN "basicdata"."al0" IS 'Initial pressurizer level (fraction of full)';
COMMENT ON COLUMN "basicdata"."phpi" IS 'HPI auto start setpoint (bar)';
COMMENT ON COLUMN "basicdata"."pscram" IS 'Low pressure reactor scram setpoint (bar)';
COMMENT ON COLUMN "basicdata"."temp" IS 'HPI and EFW temperature (°C)';
COMMENT ON COLUMN "basicdata"."padv" IS 'SG relief valves (atmospheric dump valve) opening pressure (bar)';
COMMENT ON COLUMN "basicdata"."adv" IS 'SG relief valves  total capacity( t/hr)';
COMMENT ON COLUMN "basicdata"."wld0" IS 'Letdown flow for Chemical & Volume Control System (CVCC) during normal operation  (t/hr)';
COMMENT ON COLUMN "basicdata"."chg" IS 'Charging flow (t/hr)';
COMMENT ON COLUMN "basicdata"."trin" IS 'Rod insertion minimum time (sec)';
COMMENT ON COLUMN "basicdata"."trot" IS 'Rod withdrawal minimum time (sec)';
COMMENT ON COLUMN "basicdata"."akrd" IS 'Reactivity worth of one rod ($)';
COMMENT ON COLUMN "basicdata"."akchg" IS 'Accumulator/RWST boron acitivity (pcm/ppm)';
COMMENT ON COLUMN "basicdata"."gfw" IS 'Feedwater controller constant, a dimensionless number';
COMMENT ON COLUMN "basicdata"."vsg" IS 'total SG volume (M3)';
COMMENT ON COLUMN "basicdata"."tbv" IS 'total TBV flow capacity in fraction of full power steam';
COMMENT ON COLUMN "basicdata"."hmfw" IS 'feedwater enthalpy at full power (kJ/kg)';
COMMENT ON COLUMN "basicdata"."trxt" IS 'reactor trip delay time after turbine trip (sec)';
COMMENT ON COLUMN "basicdata"."ter1" IS 'maximum Tavg error for steam dump control (°C)';
COMMENT ON COLUMN "basicdata"."efw" IS 'EFW capacity (t/hr) for turbine driven pump';
COMMENT ON COLUMN "basicdata"."vprz" IS 'pressurizer volume (M3)';
COMMENT ON COLUMN "basicdata"."vrcs" IS 'total RCS volume excluding pressurizer (M3)';
COMMENT ON COLUMN "basicdata"."msg0" IS 'total SG water inventory including steam mass (kg)';
COMMENT ON COLUMN "basicdata"."tsg0" IS 'no-load steam generator temperature or RC Tavg  (°C)';
COMMENT ON COLUMN "basicdata"."ssms" IS 'reactor vessel stainless steel mass (ton) no-load steam generator temperature or RC Tavg  (°C)';
COMMENT ON COLUMN "basicdata"."uo2ms" IS 'fuel UO2 mass (ton)';
COMMENT ON COLUMN "basicdata"."wtr0" IS 'SG tube rupture flow per tube break (t/hr)';
COMMENT ON COLUMN "basicdata"."pcft" IS 'pressure set point for core flood tank initiation  (bar)';
COMMENT ON COLUMN "basicdata"."cft" IS 'CFT tank (accumulator) total water capacity  (M3)';
COMMENT ON COLUMN "basicdata"."wcf0" IS 'nominal CFT flow rate at initiation  (t/hr)';
COMMENT ON COLUMN "basicdata"."plpi" IS 'LPI system initiation pressure  (bar)';
COMMENT ON COLUMN "basicdata"."tavgl" IS 'Low Tavg set point for SG isolation (°C)';
COMMENT ON COLUMN "basicdata"."ulsg" IS 'height of SG U-tubes  (M)';
COMMENT ON COLUMN "basicdata"."hrlv" IS 'pressurizer low level set point for heater shutoff\015\012pressurizer low level set point for heater shutoff\015\012Przr low level set point for heater shutoff and  letdown isolation (fraction of full PRZR volume)\015\012ction of full PRZR volume)\015\012';
COMMENT ON COLUMN "basicdata"."spry" IS 'PRZ spray flow capacity (t/hr)';
COMMENT ON COLUMN "basicdata"."psp1" IS 'PRZ spray initiation error (bar)';
COMMENT ON COLUMN "basicdata"."psp2" IS 'PRZ spray maximum error  (bar)';
COMMENT ON COLUMN "basicdata"."htr1" IS 'PRZ proportional heater capacity (KW)';
COMMENT ON COLUMN "basicdata"."phtr1" IS 'proportional heater initiation error ( bar)';
COMMENT ON COLUMN "basicdata"."phtr2" IS 'proportional heater error for full capacity (bar)';
COMMENT ON COLUMN "basicdata"."phtrb" IS 'set point for pressure error to turn on backup heater capacity (bar)';
COMMENT ON COLUMN "basicdata"."vtaf" IS 'RCS volume to top of active fuel (M3)';
COMMENT ON COLUMN "basicdata"."ataf" IS 'RCS or core cross section area at top of fuel (M2)';
COMMENT ON COLUMN "basicdata"."lsg0" IS 'SG wide range level at full power (M)';
COMMENT ON COLUMN "basicdata"."psg100" IS 'Steam generator pressure at 100% power (bar)';
COMMENT ON COLUMN "basicdata"."htrb" IS 'backup heater capacity (KW)';
COMMENT ON COLUMN "basicdata"."lpsg" IS 'Number of steam generator loops';
COMMENT ON COLUMN "basicdata"."gstm" IS 'turbine control valve and bypass valve gain constant';
COMMENT ON COLUMN "basicdata"."ter2" IS 'deadband for Tavg steam dump control for load rejection (°C)';
COMMENT ON COLUMN "basicdata"."sghh" IS 'high-high SG level for turbine trip (%)';
COMMENT ON COLUMN "basicdata"."asg1" IS 'SG lower section cross section area (M2)';
COMMENT ON COLUMN "basicdata"."rlsg" IS 'range for SG narrow range level instrument (M)';
COMMENT ON COLUMN "basicdata"."sgll" IS 'low SG narrow range scram set point (%)';
COMMENT ON COLUMN "basicdata"."cftn2" IS 'total nitrogen volume in Core Flood Tanks or accumulators (M3)';
COMMENT ON COLUMN "basicdata"."ph(1)" IS 'The head curve for SI pump pressures 1st data point (bar)';
COMMENT ON COLUMN "basicdata"."ph(2)" IS 'The head curve for SI pump pressures 2nd data point (bar)';
COMMENT ON COLUMN "basicdata"."ph(3)" IS 'The head curve for SI pump pressures 3rd data point (bar)';
COMMENT ON COLUMN "basicdata"."ph(4)" IS 'The head curve for SI pump pressures 4th data point  (bar)';
COMMENT ON COLUMN "basicdata"."ph(5)" IS 'The head curve for SI pump pressures 5th data point  (bar)';
COMMENT ON COLUMN "basicdata"."ph(6)" IS 'The head curve for SI pump pressures 6th data point  (bar)';
COMMENT ON COLUMN "basicdata"."ph(7)" IS 'The head curve for SI pump pressures 7th data point (bar)';
COMMENT ON COLUMN "basicdata"."wh(1)" IS 'The head curve for SI pump flow 1st  data point (t/hr)';
COMMENT ON COLUMN "basicdata"."wh(2)" IS 'The head curve for SI pump flow 2nd  data point (t/hr)';
COMMENT ON COLUMN "basicdata"."wh(3)" IS 'The head curve for SI pump flow 3rd  data point (t/hr)';
COMMENT ON COLUMN "basicdata"."wh(4)" IS 'The head curve for SI pump flow 4th data point (t/hr)';
COMMENT ON COLUMN "basicdata"."wh(5)" IS 'The head curve for SI pump flow 5th  data point (t/hr)';
COMMENT ON COLUMN "basicdata"."wh(6)" IS 'The head curve for SI pump flow 6th  data point (t/hr)';
COMMENT ON COLUMN "basicdata"."wh(7)" IS 'The head curve for SI pump flow 7th  data point (t/hr)';
COMMENT ON COLUMN "basicdata"."pl(1)" IS 'The head curve for RHR pump pressures 1st data point  (bar)';
COMMENT ON COLUMN "basicdata"."pl(2)" IS 'The head curve for RHR pump pressures 2nd data point (bar)';
COMMENT ON COLUMN "basicdata"."pl(3)" IS 'The head curve for RHR pump pressures 3rd data point  (bar)';
COMMENT ON COLUMN "basicdata"."pl(4)" IS 'The head curve for RHR pump pressures 4th data point (bar)';
COMMENT ON COLUMN "basicdata"."pl(5)" IS 'The head curve for RHR pump pressures 5th data point  (bar)';
COMMENT ON COLUMN "basicdata"."pl(6)" IS 'The head curve for RHR pump pressures 6th data point  (bar)';
COMMENT ON COLUMN "basicdata"."pl(7)" IS 'The head curve for RHR pump pressures 7th data point (bar)';
COMMENT ON COLUMN "basicdata"."wl(1)" IS 'The head curve for RHR pump flow 1st data point (t/hr)';
COMMENT ON COLUMN "basicdata"."wl(2)" IS 'The head curve for RHR pump flow 2nd data point (t/hr)';
COMMENT ON COLUMN "basicdata"."wl(3)" IS 'The head curve for RHR pump flow 3rd data point (t/hr)';
COMMENT ON COLUMN "basicdata"."wl(4)" IS 'The head curve for RHR pump flow 4th data point (t/hr)';
COMMENT ON COLUMN "basicdata"."wl(5)" IS 'The head curve for RHR pump flow 5th data point (t/hr)';
COMMENT ON COLUMN "basicdata"."wl(6)" IS 'The head curve for RHR pump flow 6th data point (t/hr)';
COMMENT ON COLUMN "basicdata"."wl(7)" IS 'The head curve for RHR pump flow 7th data point (t/hr)';
COMMENT ON COLUMN "basicdata"."pcsp" IS 'containment spray initiation pressure (bar)';
COMMENT ON COLUMN "basicdata"."gcsp" IS 'containment spray capacity  (t/hr)';
COMMENT ON COLUMN "basicdata"."ustc" IS 'core uncovery steam cooling effectiveness as fraction of water cooling';
COMMENT ON COLUMN "basicdata"."tf0" IS 'average fuel temperature at full power (°C)';
COMMENT ON COLUMN "basicdata"."pdsn" IS 'containment design pressure  (bar)';
COMMENT ON COLUMN "basicdata"."wsv" IS 'main steam safety valve total capacity (t/hr)';
COMMENT ON COLUMN "basicdata"."psv" IS 'main steam safety valve opening press (bar)';
COMMENT ON COLUMN "basicdata"."trb0" IS 'initial containment temperature (°C)';
COMMENT ON COLUMN "basicdata"."prb0" IS 'initial containment pressure  (bar)';
COMMENT ON COLUMN "basicdata"."lwrb0" IS 'initial sump water level (M)';
COMMENT ON COLUMN "basicdata"."arb" IS 'sump or containment cross section area (M2)';
COMMENT ON COLUMN "basicdata"."vrb" IS 'containment volume (M3)';
COMMENT ON COLUMN "basicdata"."pfcl" IS 'High containment pressure set point to start fan cooler  (bar)';
COMMENT ON COLUMN "basicdata"."qcsp0" IS 'Emergency SI heat exchanger rated capacity (MW)';
COMMENT ON COLUMN "basicdata"."qcl0" IS 'Fan cooler capacity (MW)';
COMMENT ON COLUMN "basicdata"."tdsn" IS 'containment design temperature (°C)';
COMMENT ON COLUMN "basicdata"."crtm" IS 'containment heat sink concrete mass (ton)';
COMMENT ON COLUMN "basicdata"."stlm" IS 'containment heat sink steel mass (ton)';
COMMENT ON COLUMN "basicdata"."rlk0" IS 'containment leak rate (%/day) at design pressure';
COMMENT ON COLUMN "basicdata"."pcrt" IS 'RC pressure for break flow changed to non-critical  (bar)';
COMMENT ON COLUMN "basicdata"."rdsp" IS 'Rod speed constant, dimensionless number';
COMMENT ON COLUMN "basicdata"."qrhr0" IS 'RHR heat exchanger rate (MW)';
COMMENT ON COLUMN "basicdata"."tank0" IS 'RWST initial water volume M3';
COMMENT ON COLUMN "basicdata"."tkmin" IS 'RWST water volume to switch to sump M3';
COMMENT ON COLUMN "basicdata"."prbh" IS 'High RB press for SI initiation (bar)';
COMMENT ON COLUMN "basicdata"."lpzl" IS 'Simultaneous low PRZR level with RC press for SI initiation';
COMMENT ON COLUMN "basicdata"."psgl" IS 'Low SG press for SI initiation (bar)';
COMMENT ON COLUMN "basicdata"."phpl" IS 'Simultaneous low RC  press with PZR level for SI initiation (bar)';
COMMENT ON COLUMN "basicdata"."hcor" IS 'Fuel length (M)';
COMMENT ON COLUMN "basicdata"."afut" IS 'Total core heat transfer area M2';
COMMENT ON COLUMN "basicdata"."mzrkt" IS 'Total mass of fuel channel (Zr) Kg\015\012';
COMMENT ON COLUMN "basicdata"."mzrst" IS 'Total mass of fuel cladding (Zr) Kg\015\012';
COMMENT ON COLUMN "basicdata"."mcrt" IS 'Total mass of control rods Kg\015\012';
COMMENT ON COLUMN "basicdata"."mves" IS 'Mass of vessel bottom\015\012';
COMMENT ON COLUMN "basicdata"."cnh2b" IS 'Concentration of H2 in ctmt to start burn (%)';
COMMENT ON COLUMN "basicdata"."fh2o" IS 'Fraction of H2O in concrete';
COMMENT ON COLUMN "basicdata"."fco2" IS 'Fraction of CO2 in concrete';
COMMENT ON COLUMN "basicdata"."fdec" IS 'Fraction of decomposed concrete gas reacts with corium';
COMMENT ON COLUMN "basicdata"."wvnt0" IS 'Containment vent flow at 1 psid (kg/s)';
COMMENT ON COLUMN "basicdata"."ppmec" IS 'ACC & RWST boron concentration (ppm)';

-- CREATE INDEXES ...
ALTER TABLE "basicdata" ADD CONSTRAINT "basicdata_pkey" PRIMARY KEY ("set");

CREATE TABLE IF NOT EXISTS "iccontrolsdata"
 (
	"ic"			INTEGER, 
	"rx pwr dmd"			INTEGER, 
	"rx rate dmd"			INTEGER, 
	"turb press"			INTEGER, 
	"rx tavg"			INTEGER, 
	"sg a level"			INTEGER, 
	"sg b level"			INTEGER, 
	"pzr level"			INTEGER, 
	"pzr press"			INTEGER, 
	"pzr prop htr"			INTEGER, 
	"pzr bkup htr"			INTEGER, 
	"rx trip"			BOOLEAN NOT NULL, 
	"turbine trip"			BOOLEAN NOT NULL, 
	"lpi_smp_rhr"			INTEGER, 
	"ac offsite"			BOOLEAN NOT NULL, 
	"ac bus a"			BOOLEAN NOT NULL, 
	"ac bus b"			BOOLEAN NOT NULL, 
	"pzr prop htr malf"			BOOLEAN NOT NULL, 
	"pzr bkup htr malf"			BOOLEAN NOT NULL
);
COMMENT ON COLUMN "iccontrolsdata"."ic" IS 'Initial Condition';
COMMENT ON COLUMN "iccontrolsdata"."rx pwr dmd" IS 'ctlPwrDmd';
COMMENT ON COLUMN "iccontrolsdata"."rx rate dmd" IS 'ctlRateDmd';
COMMENT ON COLUMN "iccontrolsdata"."turb press" IS 'ctlTurbPress';
COMMENT ON COLUMN "iccontrolsdata"."rx tavg" IS 'ctlTavg';
COMMENT ON COLUMN "iccontrolsdata"."sg a level" IS 'ctlSGLevelA';
COMMENT ON COLUMN "iccontrolsdata"."sg b level" IS 'ctlSGLevelB';
COMMENT ON COLUMN "iccontrolsdata"."pzr level" IS 'ctlPzrLevel';
COMMENT ON COLUMN "iccontrolsdata"."pzr press" IS 'ctlPzrPress';
COMMENT ON COLUMN "iccontrolsdata"."pzr prop htr" IS 'ctlPzrHtrProp';
COMMENT ON COLUMN "iccontrolsdata"."pzr bkup htr" IS 'ctlPzrHtrBkup';
COMMENT ON COLUMN "iccontrolsdata"."rx trip" IS 'ctlReactorTrip';
COMMENT ON COLUMN "iccontrolsdata"."turbine trip" IS 'ctlTurbineTrip';
COMMENT ON COLUMN "iccontrolsdata"."lpi_smp_rhr" IS 'ctlLPI_Smp_RHR 0=LPI, 1=sump recirculation, 2=RHR';
COMMENT ON COLUMN "iccontrolsdata"."ac offsite" IS 'ctl';
COMMENT ON COLUMN "iccontrolsdata"."pzr prop htr malf" IS 'ctlPzrHtrPropMalf';
COMMENT ON COLUMN "iccontrolsdata"."pzr bkup htr malf" IS 'ctlPzrHtrBkupMalf';

-- CREATE INDEXES ...
ALTER TABLE "iccontrolsdata" ADD CONSTRAINT "iccontrolsdata_pkey" PRIMARY KEY ("ic");

CREATE TABLE IF NOT EXISTS "iccoredata"
 (
	"ic"			INTEGER, 
	"description"			VARCHAR (50), 
	"mcrn(1)"			REAL, 
	"mcrn(2)"			REAL, 
	"mcrn(3)"			REAL, 
	"mcrn(4)"			REAL, 
	"mcrn(5)"			REAL, 
	"mcrn(6)"			REAL, 
	"mcrn(7)"			REAL, 
	"mcrn(8)"			REAL, 
	"mh2n(1)"			REAL, 
	"mh2n(2)"			REAL, 
	"mh2n(3)"			REAL, 
	"mh2n(4)"			REAL, 
	"mh2n(5)"			REAL, 
	"mh2n(6)"			REAL, 
	"mh2n(7)"			REAL, 
	"mh2n(8)"			REAL, 
	"mnodsuh(1)"			REAL, 
	"mnodsuh(2)"			REAL, 
	"mnodsuh(3)"			REAL, 
	"mnodsuh(4)"			REAL, 
	"mnodsuh(5)"			REAL, 
	"mnodsuh(6)"			REAL, 
	"mnodsuh(7)"			REAL, 
	"mnodsuh(8)"			REAL, 
	"muo2fn(1)"			REAL, 
	"muo2fn(2)"			REAL, 
	"muo2fn(3)"			REAL, 
	"muo2fn(4)"			REAL, 
	"muo2fn(5)"			REAL, 
	"muo2fn(6)"			REAL, 
	"muo2fn(7)"			REAL, 
	"muo2fn(8)"			REAL, 
	"muo2n(1)"			REAL, 
	"muo2n(2)"			REAL, 
	"muo2n(3)"			REAL, 
	"muo2n(4)"			REAL, 
	"muo2n(5)"			REAL, 
	"muo2n(6)"			REAL, 
	"muo2n(7)"			REAL, 
	"muo2n(8)"			REAL, 
	"mzrfn(1)"			REAL, 
	"mzrfn(2)"			REAL, 
	"mzrfn(3)"			REAL, 
	"mzrfn(4)"			REAL, 
	"mzrfn(5)"			REAL, 
	"mzrfn(6)"			REAL, 
	"mzrfn(7)"			REAL, 
	"mzrfn(8)"			REAL, 
	"mzrkn(1)"			REAL, 
	"mzrkn(2)"			REAL, 
	"mzrkn(3)"			REAL, 
	"mzrkn(4)"			REAL, 
	"mzrkn(5)"			REAL, 
	"mzrkn(6)"			REAL, 
	"mzrkn(7)"			REAL, 
	"mzrkn(8)"			REAL, 
	"mzrofn(1)"			REAL, 
	"mzrofn(2)"			REAL, 
	"mzrofn(3)"			REAL, 
	"mzrofn(4)"			REAL, 
	"mzrofn(5)"			REAL, 
	"mzrofn(6)"			REAL, 
	"mzrofn(7)"			REAL, 
	"mzrofn(8)"			REAL, 
	"mzron(1)"			REAL, 
	"mzron(2)"			REAL, 
	"mzron(3)"			REAL, 
	"mzron(4)"			REAL, 
	"mzron(5)"			REAL, 
	"mzron(6)"			REAL, 
	"mzron(7)"			REAL, 
	"mzron(8)"			REAL, 
	"mzrsn(1)"			REAL, 
	"mzrsn(2)"			REAL, 
	"mzrsn(3)"			REAL, 
	"mzrsn(4)"			REAL, 
	"mzrsn(5)"			REAL, 
	"mzrsn(6)"			REAL, 
	"mzrsn(7)"			REAL, 
	"mzrsn(8)"			REAL, 
	"pcmelt"			INTEGER, 
	"val"			REAL, 
	"vesbk"			REAL, 
	"mh2t"			REAL, 
	"scladfail"			REAL, 
	"tves"			REAL, 
	"ttn(1)"			REAL, 
	"ttn(2)"			REAL, 
	"ttn(3)"			REAL, 
	"ttn(4)"			REAL, 
	"ttn(5)"			REAL, 
	"ttn(6)"			REAL, 
	"ttn(7)"			REAL, 
	"ttn(8)"			REAL, 
	"mcrfn(1)"			REAL, 
	"mcrfn(2)"			REAL, 
	"mcrfn(3)"			REAL, 
	"mcrfn(4)"			REAL, 
	"mcrfn(5)"			REAL, 
	"mcrfn(6)"			REAL, 
	"mcrfn(7)"			REAL, 
	"mcrfn(8)"			REAL, 
	"vtotdpow"			REAL, 
	"mh2rb"			REAL
);
COMMENT ON COLUMN "iccoredata"."ic" IS 'IC Number';
COMMENT ON COLUMN "iccoredata"."description" IS 'Description of the Initial Condition';

-- CREATE INDEXES ...
ALTER TABLE "iccoredata" ADD CONSTRAINT "iccoredata_pkey" PRIMARY KEY ("ic");

CREATE TABLE IF NOT EXISTS "icfandata"
 (
	"ic"			INTEGER, 
	"fan cooler 1"			INTEGER, 
	"fan cooler 2"			INTEGER, 
	"fan cooler 3"			INTEGER, 
	"fan cooler 4"			INTEGER, 
	"rx bldg vent"			INTEGER
);
COMMENT ON COLUMN "icfandata"."ic" IS 'Initial Condition';
COMMENT ON COLUMN "icfandata"."fan cooler 1" IS 'Fan(0)';
COMMENT ON COLUMN "icfandata"."fan cooler 2" IS 'Fan(1)';
COMMENT ON COLUMN "icfandata"."fan cooler 3" IS 'Fan(2)';
COMMENT ON COLUMN "icfandata"."fan cooler 4" IS 'Fan(3)';
COMMENT ON COLUMN "icfandata"."rx bldg vent" IS 'BldgVent';

-- CREATE INDEXES ...
ALTER TABLE "icfandata" ADD CONSTRAINT "icfandata_pkey" PRIMARY KEY ("ic");

CREATE TABLE IF NOT EXISTS "ichxdata"
 (
	"ic"			INTEGER, 
	"rhr"			INTEGER, 
	"rbs"			INTEGER, 
	"fcl"			INTEGER
);
COMMENT ON COLUMN "ichxdata"."ic" IS 'Initial Condition';
COMMENT ON COLUMN "ichxdata"."rhr" IS 'RHR HeatExchanger';
COMMENT ON COLUMN "ichxdata"."rbs" IS 'RB Spray Heat Exchanger';
COMMENT ON COLUMN "ichxdata"."fcl" IS 'Fan Cooler Heat Exchanger';

-- CREATE INDEXES ...
ALTER TABLE "ichxdata" ADD CONSTRAINT "ichxdata_pkey" PRIMARY KEY ("ic");

CREATE TABLE IF NOT EXISTS "ichxmalfdata"
 (
	"ic"			INTEGER, 
	"rhr"			BOOLEAN NOT NULL, 
	"rbs"			BOOLEAN NOT NULL, 
	"fcl"			BOOLEAN NOT NULL
);
COMMENT ON COLUMN "ichxmalfdata"."ic" IS 'Initial Condition';
COMMENT ON COLUMN "ichxmalfdata"."rhr" IS 'HeatExchangerRHR';
COMMENT ON COLUMN "ichxmalfdata"."rbs" IS 'HeatExchangerRBS';
COMMENT ON COLUMN "ichxmalfdata"."fcl" IS 'HeatExchangerFanCooler';

-- CREATE INDEXES ...
ALTER TABLE "ichxmalfdata" ADD CONSTRAINT "ichxmalfdata_pkey" PRIMARY KEY ("ic");

CREATE TABLE IF NOT EXISTS "icmalfdata"
 (
	"ic"			INTEGER, 
	"malfunction"			INTEGER, 
	"delaytime"			DOUBLE PRECISION, 
	"ramptime"			DOUBLE PRECISION, 
	"failurefraction"			DOUBLE PRECISION, 
	"status"			BOOLEAN NOT NULL
);
COMMENT ON COLUMN "icmalfdata"."ic" IS 'Initial Condition';
COMMENT ON COLUMN "icmalfdata"."malfunction" IS 'Malfunction Number';
COMMENT ON COLUMN "icmalfdata"."delaytime" IS 'Delay Time until the malfunction takes effect';
COMMENT ON COLUMN "icmalfdata"."ramptime" IS 'Time it takes for the malfunction to ramp in';
COMMENT ON COLUMN "icmalfdata"."failurefraction" IS 'Fraction of a full failure';
COMMENT ON COLUMN "icmalfdata"."status" IS 'Whether or not the malfunction is active';

-- CREATE INDEXES ...
CREATE INDEX "icmalfdata_icmalfdataic_idx" ON "icmalfdata" ("ic");
CREATE INDEX "icmalfdata_icmalfdatamalfunction_idx" ON "icmalfdata" ("malfunction");

CREATE TABLE IF NOT EXISTS "icmalfdatatemp"
 (
	"malfunction"			INTEGER, 
	"delaytime"			DOUBLE PRECISION, 
	"ramptime"			DOUBLE PRECISION, 
	"failurefraction"			DOUBLE PRECISION, 
	"status"			BOOLEAN NOT NULL
);
COMMENT ON COLUMN "icmalfdatatemp"."malfunction" IS 'Malfunction Number';
COMMENT ON COLUMN "icmalfdatatemp"."delaytime" IS 'Delay Time until the malfunction takes effect';
COMMENT ON COLUMN "icmalfdatatemp"."ramptime" IS 'Time it takes for the malfunction to ramp in';
COMMENT ON COLUMN "icmalfdatatemp"."failurefraction" IS 'Fraction of a full failure';
COMMENT ON COLUMN "icmalfdatatemp"."status" IS 'Whether or not the malfunction is active';

-- CREATE INDEXES ...
CREATE INDEX "icmalfdatatemp_icmalfdatamalfunction_idx" ON "icmalfdatatemp" ("malfunction");

CREATE TABLE IF NOT EXISTS "icpumpdata"
 (
	"ic"			INTEGER, 
	"hpi-1"			INTEGER, 
	"hpi-2"			INTEGER, 
	"rhr-1"			INTEGER, 
	"rhr-2"			INTEGER, 
	"rbs-1"			INTEGER, 
	"rbs-2"			INTEGER, 
	"cds"			INTEGER, 
	"mfw-1"			INTEGER, 
	"mfw-2"			INTEGER, 
	"mfw-3"			INTEGER, 
	"efw-tb"			INTEGER, 
	"efw-m1"			INTEGER, 
	"efw-m2"			INTEGER, 
	"rcp-1"			INTEGER, 
	"rcp-2"			INTEGER, 
	"hpi-3"			INTEGER, 
	"hpi-4"			INTEGER, 
	"chg-1"			INTEGER, 
	"chg-2"			INTEGER
);
COMMENT ON COLUMN "icpumpdata"."ic" IS 'Initial Condition';
COMMENT ON COLUMN "icpumpdata"."hpi-1" IS 'PumpHPI(0)';
COMMENT ON COLUMN "icpumpdata"."hpi-2" IS 'PumpHPI(1)';
COMMENT ON COLUMN "icpumpdata"."rhr-1" IS 'PumpRHR(0)';
COMMENT ON COLUMN "icpumpdata"."rhr-2" IS 'PumpRHR(1)';
COMMENT ON COLUMN "icpumpdata"."rbs-1" IS 'PumpRBS(0)';
COMMENT ON COLUMN "icpumpdata"."rbs-2" IS 'PumpRBS(1)';
COMMENT ON COLUMN "icpumpdata"."cds" IS 'PumpCDS';
COMMENT ON COLUMN "icpumpdata"."mfw-1" IS 'PumpMFW(0)';
COMMENT ON COLUMN "icpumpdata"."mfw-2" IS 'PumpMFW(1)';
COMMENT ON COLUMN "icpumpdata"."mfw-3" IS 'PumpMFW(2)';
COMMENT ON COLUMN "icpumpdata"."efw-tb" IS 'PumpEFW(0)';
COMMENT ON COLUMN "icpumpdata"."efw-m1" IS 'PumpEFW(1)';
COMMENT ON COLUMN "icpumpdata"."efw-m2" IS 'PumpEFW(2)';
COMMENT ON COLUMN "icpumpdata"."rcp-1" IS 'RCP(0)';
COMMENT ON COLUMN "icpumpdata"."rcp-2" IS 'RCP(1)';
COMMENT ON COLUMN "icpumpdata"."hpi-3" IS 'PumpHPI(2)';
COMMENT ON COLUMN "icpumpdata"."hpi-4" IS 'PumpHPI(3)';
COMMENT ON COLUMN "icpumpdata"."chg-1" IS 'PumpCHG(0)';
COMMENT ON COLUMN "icpumpdata"."chg-2" IS 'PumpCHG(1)';

-- CREATE INDEXES ...
ALTER TABLE "icpumpdata" ADD CONSTRAINT "icpumpdata_pkey" PRIMARY KEY ("ic");

CREATE TABLE IF NOT EXISTS "icpumpmalfdata"
 (
	"ic"			INTEGER, 
	"hpi-1"			BOOLEAN NOT NULL, 
	"hpi-2"			BOOLEAN NOT NULL, 
	"rhr-1"			BOOLEAN NOT NULL, 
	"rhr-2"			BOOLEAN NOT NULL, 
	"rbs-1"			BOOLEAN NOT NULL, 
	"rbs-2"			BOOLEAN NOT NULL, 
	"cds"			BOOLEAN NOT NULL, 
	"mfw-1"			BOOLEAN NOT NULL, 
	"mfw-2"			BOOLEAN NOT NULL, 
	"mfw-3"			BOOLEAN NOT NULL, 
	"efw-tb"			BOOLEAN NOT NULL, 
	"efw-m1"			BOOLEAN NOT NULL, 
	"efw-m2"			BOOLEAN NOT NULL, 
	"rcp-1"			BOOLEAN NOT NULL, 
	"rcp-2"			BOOLEAN NOT NULL, 
	"hpi-3"			BOOLEAN NOT NULL, 
	"hpi-4"			BOOLEAN NOT NULL, 
	"chg-1"			BOOLEAN NOT NULL, 
	"chg-2"			BOOLEAN NOT NULL
);
COMMENT ON COLUMN "icpumpmalfdata"."ic" IS 'Initial Condition';
COMMENT ON COLUMN "icpumpmalfdata"."hpi-1" IS 'PumpHPI(0)';
COMMENT ON COLUMN "icpumpmalfdata"."hpi-2" IS 'PumpHPI(1)';
COMMENT ON COLUMN "icpumpmalfdata"."rhr-1" IS 'PumpRHR(0)';
COMMENT ON COLUMN "icpumpmalfdata"."rhr-2" IS 'PumpRHR(1)';
COMMENT ON COLUMN "icpumpmalfdata"."rbs-1" IS 'PumpRBS(0)';
COMMENT ON COLUMN "icpumpmalfdata"."rbs-2" IS 'PumpRBS(1)';
COMMENT ON COLUMN "icpumpmalfdata"."cds" IS 'PumpCDS';
COMMENT ON COLUMN "icpumpmalfdata"."mfw-1" IS 'PumpMFW(0)';
COMMENT ON COLUMN "icpumpmalfdata"."mfw-2" IS 'PumpMFW(1)';
COMMENT ON COLUMN "icpumpmalfdata"."mfw-3" IS 'PumpMFW(2)';
COMMENT ON COLUMN "icpumpmalfdata"."efw-tb" IS 'PumpEFW(0)';
COMMENT ON COLUMN "icpumpmalfdata"."efw-m1" IS 'PumpEFW(1)';
COMMENT ON COLUMN "icpumpmalfdata"."efw-m2" IS 'PumpEFW(2)';
COMMENT ON COLUMN "icpumpmalfdata"."rcp-1" IS 'RCP(0)';
COMMENT ON COLUMN "icpumpmalfdata"."rcp-2" IS 'RCP(1)';
COMMENT ON COLUMN "icpumpmalfdata"."hpi-3" IS 'PumpHPI(2)';
COMMENT ON COLUMN "icpumpmalfdata"."hpi-4" IS 'PumpHPI(3)';
COMMENT ON COLUMN "icpumpmalfdata"."chg-1" IS 'PumpCHG(1)';
COMMENT ON COLUMN "icpumpmalfdata"."chg-2" IS 'PumpCHG(2)';

-- CREATE INDEXES ...
ALTER TABLE "icpumpmalfdata" ADD CONSTRAINT "icpumpmalfdata_pkey" PRIMARY KEY ("ic");

CREATE TABLE IF NOT EXISTS "ictripdata"
 (
	"ic"			INTEGER, 
	"itrxplo"			BOOLEAN NOT NULL, 
	"itrxfllo"			BOOLEAN NOT NULL, 
	"itrxsglvlo"			BOOLEAN NOT NULL, 
	"itrxfxhi"			BOOLEAN NOT NULL, 
	"itrxotdt"			BOOLEAN NOT NULL, 
	"itrxopdt"			BOOLEAN NOT NULL, 
	"itrxfxrthi"			BOOLEAN NOT NULL, 
	"itrxpzrlvhi"			BOOLEAN NOT NULL, 
	"itrxphi"			BOOLEAN NOT NULL, 
	"itecpzrlo"			BOOLEAN NOT NULL, 
	"itecsgplo"			BOOLEAN NOT NULL, 
	"itecprbhi"			BOOLEAN NOT NULL, 
	"itecstflhi"			BOOLEAN NOT NULL
);
COMMENT ON COLUMN "ictripdata"."ic" IS 'Intial Condition';
COMMENT ON COLUMN "ictripdata"."itrxplo" IS 'Low Rx Press';
COMMENT ON COLUMN "ictripdata"."itrxfllo" IS 'Low core flow';
COMMENT ON COLUMN "ictripdata"."itrxsglvlo" IS 'low SG level';
COMMENT ON COLUMN "ictripdata"."itrxfxhi" IS 'high flux';
COMMENT ON COLUMN "ictripdata"."itrxotdt" IS 'over-temperature dt';
COMMENT ON COLUMN "ictripdata"."itrxopdt" IS 'over-power dt';
COMMENT ON COLUMN "ictripdata"."itrxfxrthi" IS 'High flux increase rate';
COMMENT ON COLUMN "ictripdata"."itrxpzrlvhi" IS 'low przr level';
COMMENT ON COLUMN "ictripdata"."itrxphi" IS 'High Rx Press';
COMMENT ON COLUMN "ictripdata"."itecpzrlo" IS 'ECCS low Pzr level';
COMMENT ON COLUMN "ictripdata"."itecsgplo" IS 'ECCS low SG press';
COMMENT ON COLUMN "ictripdata"."itecprbhi" IS 'ECCS high RB press';
COMMENT ON COLUMN "ictripdata"."itecstflhi" IS 'ECCS high Steam flow';

-- CREATE INDEXES ...
ALTER TABLE "ictripdata" ADD CONSTRAINT "ictripdata_pkey" PRIMARY KEY ("ic");

CREATE TABLE IF NOT EXISTS "icvalvedata"
 (
	"ic"			INTEGER, 
	"valveaccumulator1"			INTEGER, 
	"valveaccumulator2"			INTEGER, 
	"valverbvent"			INTEGER, 
	"valveturbinestop"			INTEGER, 
	"valveturbinebypass"			INTEGER, 
	"valvepressurizerletdown"			INTEGER, 
	"valvepressurizerspray"			INTEGER, 
	"valvepressurizerauxspray"			INTEGER, 
	"valvepressurizerporv1"			INTEGER, 
	"valvepressurizerporv2"			INTEGER, 
	"valvepressurizersafty"			INTEGER, 
	"valvemainfeed-a"			INTEGER, 
	"valvemainfeed-b"			INTEGER, 
	"valvemsiv-a"			INTEGER, 
	"valvesg_adv-a"			INTEGER, 
	"valvesg_msv-a"			INTEGER, 
	"valvemsiv-b"			INTEGER, 
	"valvesg_adv-b"			INTEGER, 
	"valvesg_msv-b"			INTEGER, 
	"valveauxfeed-a"			INTEGER, 
	"valveauxfeed-b"			INTEGER, 
	"valvedoseletdown"			INTEGER, 
	"valvedoserlfsfty"			INTEGER, 
	"valvedoserbvent"			INTEGER, 
	"valveafwturb"			INTEGER
);
COMMENT ON COLUMN "icvalvedata"."ic" IS 'Initial Condition';
COMMENT ON COLUMN "icvalvedata"."valveaccumulator1" IS 'ValveAccumulator(0)          old # 1';
COMMENT ON COLUMN "icvalvedata"."valveaccumulator2" IS 'ValveAccumulator(1) 2';
COMMENT ON COLUMN "icvalvedata"."valverbvent" IS 'ValveRBVent             3';
COMMENT ON COLUMN "icvalvedata"."valveturbinestop" IS 'ValveTurbineStop      4';
COMMENT ON COLUMN "icvalvedata"."valveturbinebypass" IS 'ValveTurbineBypass  5';
COMMENT ON COLUMN "icvalvedata"."valvepressurizerletdown" IS 'ValvePressurizerLetdown 6';
COMMENT ON COLUMN "icvalvedata"."valvepressurizerspray" IS 'ValvePressurizerSpray     7';
COMMENT ON COLUMN "icvalvedata"."valvepressurizerauxspray" IS 'ValvePressurizerAuxSpray 8';
COMMENT ON COLUMN "icvalvedata"."valvepressurizerporv1" IS 'ValvePressurizerPORV(0)  9';
COMMENT ON COLUMN "icvalvedata"."valvepressurizerporv2" IS 'ValvePressurizerPORV(1) 10';
COMMENT ON COLUMN "icvalvedata"."valvepressurizersafty" IS 'ValvePressurizerSafty 11';
COMMENT ON COLUMN "icvalvedata"."valvemainfeed-a" IS 'ValveMainFeed(0) 12';
COMMENT ON COLUMN "icvalvedata"."valvemainfeed-b" IS 'ValveMainFeed(1) 13';
COMMENT ON COLUMN "icvalvedata"."valvemsiv-a" IS 'ValveMSIV(0)        14';
COMMENT ON COLUMN "icvalvedata"."valvesg_adv-a" IS 'ValveSGADV(0)    15';
COMMENT ON COLUMN "icvalvedata"."valvesg_msv-a" IS 'ValveSGMSV(0)    16';
COMMENT ON COLUMN "icvalvedata"."valvemsiv-b" IS 'ValveMSIV(1)       17';
COMMENT ON COLUMN "icvalvedata"."valvesg_adv-b" IS 'ValveSGADV(1)    18';
COMMENT ON COLUMN "icvalvedata"."valvesg_msv-b" IS 'ValveSGMSV(1)    19';
COMMENT ON COLUMN "icvalvedata"."valveauxfeed-a" IS 'ValveAuxFeed(0) 20';
COMMENT ON COLUMN "icvalvedata"."valveauxfeed-b" IS 'ValveAuxFeed(1) 21';
COMMENT ON COLUMN "icvalvedata"."valvedoseletdown" IS 'vlvGas (should be letdown isolation)';
COMMENT ON COLUMN "icvalvedata"."valvedoserlfsfty" IS 'vlvMSSV(combination of all SG relief & safety valves)';
COMMENT ON COLUMN "icvalvedata"."valvedoserbvent" IS 'vlvMSIV(should be RB Vent) LCP 9/11/99';
COMMENT ON COLUMN "icvalvedata"."valveafwturb" IS 'VlvAFWTurb';

-- CREATE INDEXES ...
ALTER TABLE "icvalvedata" ADD CONSTRAINT "icvalvedata_pkey" PRIMARY KEY ("ic");

CREATE TABLE IF NOT EXISTS "icvalvemalfdata"
 (
	"ic"			INTEGER, 
	"valveaccumulator1"			BOOLEAN NOT NULL, 
	"valveaccumulator2"			BOOLEAN NOT NULL, 
	"valverbvent"			BOOLEAN NOT NULL, 
	"valveturbinestop"			BOOLEAN NOT NULL, 
	"valveturbinebypass"			BOOLEAN NOT NULL, 
	"valvepressurizerletdown"			BOOLEAN NOT NULL, 
	"valvepressurizerspray"			BOOLEAN NOT NULL, 
	"valvepressurizerauxspray"			BOOLEAN NOT NULL, 
	"valvepressurizerporv1"			BOOLEAN NOT NULL, 
	"valvepressurizerporv2"			BOOLEAN NOT NULL, 
	"valvepressurizersafty"			BOOLEAN NOT NULL, 
	"valvemainfeed-a"			BOOLEAN NOT NULL, 
	"valvemainfeed-b"			BOOLEAN NOT NULL, 
	"valvemsiv-a"			BOOLEAN NOT NULL, 
	"valvesg_adv-a"			BOOLEAN NOT NULL, 
	"valvesg_msv-a"			BOOLEAN NOT NULL, 
	"valvemsiv-b"			BOOLEAN NOT NULL, 
	"valvesg_adv-b"			BOOLEAN NOT NULL, 
	"valvesg_msv-b"			BOOLEAN NOT NULL, 
	"valveauxfeed-a"			BOOLEAN NOT NULL, 
	"valveauxfeed-b"			BOOLEAN NOT NULL, 
	"valvedoseletdowniso"			BOOLEAN NOT NULL, 
	"valvedoserlfsfty"			BOOLEAN NOT NULL, 
	"valvedoserbvent"			BOOLEAN NOT NULL, 
	"valveafwturb"			BOOLEAN NOT NULL
);
COMMENT ON COLUMN "icvalvemalfdata"."ic" IS 'Initial Condition';
COMMENT ON COLUMN "icvalvemalfdata"."valveaccumulator1" IS 'ValveAccumulator(0)';
COMMENT ON COLUMN "icvalvemalfdata"."valveaccumulator2" IS 'ValveAccumulator(1)';
COMMENT ON COLUMN "icvalvemalfdata"."valverbvent" IS 'ValveRBVent';
COMMENT ON COLUMN "icvalvemalfdata"."valveturbinestop" IS 'ValveTurbineStop';
COMMENT ON COLUMN "icvalvemalfdata"."valveturbinebypass" IS 'ValveTurbineBypass';
COMMENT ON COLUMN "icvalvemalfdata"."valvepressurizerletdown" IS 'ValvePressurizerLetdown';
COMMENT ON COLUMN "icvalvemalfdata"."valvepressurizerspray" IS 'ValvePressurizerSpray';
COMMENT ON COLUMN "icvalvemalfdata"."valvepressurizerauxspray" IS 'ValvePressurizerAuxSpray';
COMMENT ON COLUMN "icvalvemalfdata"."valvepressurizerporv1" IS 'ValvePressurizerPORV(0)';
COMMENT ON COLUMN "icvalvemalfdata"."valvepressurizerporv2" IS 'ValvePressurizerPORV(1)';
COMMENT ON COLUMN "icvalvemalfdata"."valvepressurizersafty" IS 'ValvePressurizerSafty';
COMMENT ON COLUMN "icvalvemalfdata"."valvemainfeed-a" IS 'ValveMainFeed(0)';
COMMENT ON COLUMN "icvalvemalfdata"."valvemainfeed-b" IS 'ValveMainFeed(1)';
COMMENT ON COLUMN "icvalvemalfdata"."valvemsiv-a" IS 'ValveMSIV(0)';
COMMENT ON COLUMN "icvalvemalfdata"."valvesg_adv-a" IS 'ValveSGADV(0)';
COMMENT ON COLUMN "icvalvemalfdata"."valvesg_msv-a" IS 'ValveSGMSV(0)';
COMMENT ON COLUMN "icvalvemalfdata"."valvemsiv-b" IS 'ValveMSIV(1)';
COMMENT ON COLUMN "icvalvemalfdata"."valvesg_adv-b" IS 'ValveSGADV(1)';
COMMENT ON COLUMN "icvalvemalfdata"."valvesg_msv-b" IS 'ValveSGMSV(1)';
COMMENT ON COLUMN "icvalvemalfdata"."valveauxfeed-a" IS 'ValveAuxFeed(0)';
COMMENT ON COLUMN "icvalvemalfdata"."valveauxfeed-b" IS 'ValveAuxFeed(1)';
COMMENT ON COLUMN "icvalvemalfdata"."valvedoseletdowniso" IS 'ValveDoseLetdownIso';
COMMENT ON COLUMN "icvalvemalfdata"."valvedoserlfsfty" IS 'ValveDoseRlfSfty';
COMMENT ON COLUMN "icvalvemalfdata"."valvedoserbvent" IS 'ValveDoseRBVent';
COMMENT ON COLUMN "icvalvemalfdata"."valveafwturb" IS 'vlvAFWTurb';

-- CREATE INDEXES ...
ALTER TABLE "icvalvemalfdata" ADD CONSTRAINT "icvalvemalfdata_pkey" PRIMARY KEY ("ic");

CREATE TABLE IF NOT EXISTS "isotopedata"
 (
	"index"			SERIAL, 
	"istp"			VARCHAR (50), 
	"fsiv"			REAL, 
	"gap"			REAL, 
	"hl"			REAL, 
	"eg"			REAL, 
	"conv"			REAL, 
	"cnrc0"			REAL, 
	"cnsg0"			REAL, 
	"beta"			INTEGER
);
COMMENT ON COLUMN "isotopedata"."index" IS 'Index';
COMMENT ON COLUMN "isotopedata"."istp" IS 'Isotope name';
COMMENT ON COLUMN "isotopedata"."fsiv" IS 'fission product inventory (Ci)';
COMMENT ON COLUMN "isotopedata"."gap" IS 'fraction in gap';
COMMENT ON COLUMN "isotopedata"."hl" IS 'half life (hr)';
COMMENT ON COLUMN "isotopedata"."eg" IS 'average gamma energy (Mev)';
COMMENT ON COLUMN "isotopedata"."conv" IS 'thyroid dose conversion factor (Rem/Ci)';
COMMENT ON COLUMN "isotopedata"."cnrc0" IS 'isotope concentration in coolant (micro Ci/gm)';
COMMENT ON COLUMN "isotopedata"."cnsg0" IS 'isotope concentration in SG coolant (micro Ci/gm)';
COMMENT ON COLUMN "isotopedata"."beta" IS 'beta';

-- CREATE INDEXES ...
ALTER TABLE "isotopedata" ADD CONSTRAINT "isotopedata_pkey" PRIMARY KEY ("index");

CREATE TABLE IF NOT EXISTS "listic"
 (
	"ic"			INTEGER, 
	"date & time"			TIMESTAMP WITHOUT TIME ZONE, 
	"power"			DOUBLE PRECISION, 
	"rc press"			DOUBLE PRECISION, 
	"tavg"			DOUBLE PRECISION, 
	"sg press"			DOUBLE PRECISION, 
	"timeinlife"			VARCHAR (50), 
	"description"			VARCHAR (50)
);
COMMENT ON COLUMN "listic"."ic" IS 'IC Number';
COMMENT ON COLUMN "listic"."date & time" IS 'Date & Time the File was last saved';
COMMENT ON COLUMN "listic"."power" IS 'Reactor Power';
COMMENT ON COLUMN "listic"."rc press" IS 'RCS Pressure';
COMMENT ON COLUMN "listic"."tavg" IS 'RCS Temperature';
COMMENT ON COLUMN "listic"."sg press" IS 'SG Pressure';
COMMENT ON COLUMN "listic"."timeinlife" IS 'Time in Life of the Core';
COMMENT ON COLUMN "listic"."description" IS 'Description of the Initial Condition';

-- CREATE INDEXES ...
ALTER TABLE "listic" ADD CONSTRAINT "listic_pkey" PRIMARY KEY ("ic");

CREATE TABLE IF NOT EXISTS "listmalf"
 (
	"malfunction"			INTEGER, 
	"description"			VARCHAR (50), 
	"criteria"			VARCHAR (30)
);
COMMENT ON COLUMN "listmalf"."malfunction" IS 'Malfunction Number';
COMMENT ON COLUMN "listmalf"."description" IS 'Description of the Malfunction';
COMMENT ON COLUMN "listmalf"."criteria" IS 'Failure Fraction Criteria';

-- CREATE INDEXES ...
CREATE INDEX "listmalf_listmalfmalfunction_idx" ON "listmalf" ("malfunction");
ALTER TABLE "listmalf" ADD CONSTRAINT "listmalf_pkey" PRIMARY KEY ("malfunction");

CREATE TABLE IF NOT EXISTS "presetfreeze"
 (
	"ic"			INTEGER NOT NULL, 
	"ifreeze"			INTEGER NOT NULL, 
	"variable"			VARCHAR (25) NOT NULL, 
	"relation"			VARCHAR (2) NOT NULL, 
	"value"			REAL NOT NULL
);
COMMENT ON COLUMN "presetfreeze"."ic" IS 'Initial Condition';
COMMENT ON COLUMN "presetfreeze"."ifreeze" IS 'NUmber of Preset Freeze within the IC';
COMMENT ON COLUMN "presetfreeze"."variable" IS 'Variable tested';
COMMENT ON COLUMN "presetfreeze"."relation" IS 'Relationship (e.g., ">", "<")';
COMMENT ON COLUMN "presetfreeze"."value" IS 'Value the Variable is tested against';

-- CREATE INDEXES ...
CREATE INDEX "presetfreeze_ic_idx" ON "presetfreeze" ("ic");
CREATE INDEX "presetfreeze_ifreeze_idx" ON "presetfreeze" ("ifreeze");
ALTER TABLE "presetfreeze" ADD CONSTRAINT "presetfreeze_pkey" PRIMARY KEY ("ic", "ifreeze");

CREATE TABLE IF NOT EXISTS "raddata"
 (
	"id"			SERIAL, 
	"description"			VARCHAR (50), 
	"plorb"			DOUBLE PRECISION, 
	"plosg"			DOUBLE PRECISION, 
	"plotb"			DOUBLE PRECISION, 
	"ploax"			DOUBLE PRECISION, 
	"drfrb"			DOUBLE PRECISION, 
	"drfsg"			DOUBLE PRECISION, 
	"drftb"			DOUBLE PRECISION, 
	"drfax"			DOUBLE PRECISION, 
	"flsrb"			DOUBLE PRECISION, 
	"flssg"			DOUBLE PRECISION, 
	"flstb"			DOUBLE PRECISION, 
	"flsax"			DOUBLE PRECISION, 
	"fancr"			DOUBLE PRECISION, 
	"fspry"			DOUBLE PRECISION, 
	"gprl"			DOUBLE PRECISION, 
	"dcfe"			DOUBLE PRECISION, 
	"dcfp"			DOUBLE PRECISION, 
	"dcfo"			DOUBLE PRECISION, 
	"spikei"			DOUBLE PRECISION, 
	"spiken"			DOUBLE PRECISION, 
	"brth"			DOUBLE PRECISION, 
	"xoqeab"			DOUBLE PRECISION, 
	"xoqlpz"			DOUBLE PRECISION, 
	"waux"			DOUBLE PRECISION, 
	"wog"			DOUBLE PRECISION, 
	"sgtl"			DOUBLE PRECISION, 
	"vax"			DOUBLE PRECISION, 
	"vcds"			DOUBLE PRECISION, 
	"aux"			DOUBLE PRECISION, 
	"rmb1"			DOUBLE PRECISION, 
	"rmb2"			DOUBLE PRECISION, 
	"rmb3"			DOUBLE PRECISION, 
	"rmb4"			DOUBLE PRECISION, 
	"rc87n"			DOUBLE PRECISION, 
	"frce"			DOUBLE PRECISION, 
	"frcp"			DOUBLE PRECISION, 
	"frco"			DOUBLE PRECISION, 
	"spre"			DOUBLE PRECISION, 
	"sprp"			DOUBLE PRECISION, 
	"spro"			DOUBLE PRECISION
);
COMMENT ON COLUMN "raddata"."description" IS 'Description';
COMMENT ON COLUMN "raddata"."plorb" IS 'Plate-out or partition factor in the Reactor Building';
COMMENT ON COLUMN "raddata"."plosg" IS 'Plate-out or partition factor in the steam generator';
COMMENT ON COLUMN "raddata"."plotb" IS 'Plate-out or partition factor in the Turbine';
COMMENT ON COLUMN "raddata"."ploax" IS 'Plate-out or partition factor in the Auxiliary building';
COMMENT ON COLUMN "raddata"."drfrb" IS 'Dose reduction factor in the Reactor Building';
COMMENT ON COLUMN "raddata"."drfsg" IS 'Dose reduction factor in the steam generator';
COMMENT ON COLUMN "raddata"."drftb" IS 'Dose reduction factor in the turbine';
COMMENT ON COLUMN "raddata"."drfax" IS 'Dose reduction factor iin the Auxiliary building';
COMMENT ON COLUMN "raddata"."flsrb" IS 'Flashing factor in the Reactor Building';
COMMENT ON COLUMN "raddata"."flssg" IS 'Flashing factor in the primary containment';
COMMENT ON COLUMN "raddata"."flstb" IS 'Flashing factor iin the Turbine';
COMMENT ON COLUMN "raddata"."flsax" IS 'Flashing factor in the Auxiliary building';
COMMENT ON COLUMN "raddata"."fancr" IS 'FAN CIRCULATION RATE (M3/SEC)';
COMMENT ON COLUMN "raddata"."fspry" IS 'FRACTION OF CONTAIMENT SPRAYED AREA TO TOTAL';
COMMENT ON COLUMN "raddata"."gprl" IS 'FRACTION OF GAP RELEASE';
COMMENT ON COLUMN "raddata"."dcfe" IS 'Saturated decontamination factor for elemental iodine, i.e. fraction of the maximum value at which spray will no longer reduce the isotope concentration.';
COMMENT ON COLUMN "raddata"."dcfp" IS 'Saturated decontamination factor for particulate iodine';
COMMENT ON COLUMN "raddata"."dcfo" IS 'Saturated decontamination factor for organic iodine';
COMMENT ON COLUMN "raddata"."spikei" IS 'Iodine spike factor after reactor scram and depressurization';
COMMENT ON COLUMN "raddata"."spiken" IS 'Noble gas spike factor';
COMMENT ON COLUMN "raddata"."brth" IS 'Breathing rate (M3/sec)';
COMMENT ON COLUMN "raddata"."xoqeab" IS 'X/Q at exclusion area boundary (sec/M3)';
COMMENT ON COLUMN "raddata"."xoqlpz" IS 'X/Q at low population zone (sec/M3)';
COMMENT ON COLUMN "raddata"."waux" IS '(Reference Auxiliary building vent flow rate (M3/sec))';
COMMENT ON COLUMN "raddata"."wog" IS 'Off-gas flow rate (M3/s)';
COMMENT ON COLUMN "raddata"."sgtl" IS 'Nominal SG tube leak rate during operation (kg/s)';
COMMENT ON COLUMN "raddata"."vax" IS 'Auxiliary building volume (m3)';
COMMENT ON COLUMN "raddata"."vcds" IS 'Reference condenser hotwell volume (M3)';
COMMENT ON COLUMN "raddata"."aux" IS 'Aux Bldg fuel handling accdient source term multipler (mSv/h)\015\012''           ACCIDENT, TIMES CNRC0';
COMMENT ON COLUMN "raddata"."rmb1" IS 'containmen  monitor backgroun reading (mSv/h)';
COMMENT ON COLUMN "raddata"."rmb2" IS 'Steam line N16 background reading (mSv/h)';
COMMENT ON COLUMN "raddata"."rmb3" IS 'Turbine building background reading (mSv/h)';
COMMENT ON COLUMN "raddata"."rmb4" IS 'Aux Bldg background reading (mSv/h)';
COMMENT ON COLUMN "raddata"."rc87n" IS 'RC87N (mSv/h)';
COMMENT ON COLUMN "raddata"."frce" IS 'fraction of elemental iodine';
COMMENT ON COLUMN "raddata"."frcp" IS 'fraction of particulate iodine';
COMMENT ON COLUMN "raddata"."frco" IS 'fraction of organic iodine';
COMMENT ON COLUMN "raddata"."spre" IS 'spray constant for elemental iodine (1/sec)';
COMMENT ON COLUMN "raddata"."sprp" IS 'spray constant for  particulatel iodine (1/sec)';
COMMENT ON COLUMN "raddata"."spro" IS 'spray constant for  organic iodine (1/sec)';

-- CREATE INDEXES ...
ALTER TABLE "raddata" ADD CONSTRAINT "raddata_pkey" PRIMARY KEY ("id");

CREATE TABLE IF NOT EXISTS "replay"
 (
	"replayid"			INTEGER NOT NULL, 
	"icnumber"			INTEGER NOT NULL, 
	"description"			VARCHAR (50) NOT NULL
);
COMMENT ON COLUMN "replay"."replayid" IS 'Replay Set ID Number';
COMMENT ON COLUMN "replay"."icnumber" IS 'Initial Condition Number';
COMMENT ON COLUMN "replay"."description" IS 'Description of the Replay Set';

-- CREATE INDEXES ...
ALTER TABLE "replay" ADD CONSTRAINT "replay_pkey" PRIMARY KEY ("replayid");
CREATE INDEX "replay_replayid_idx" ON "replay" ("replayid");

CREATE TABLE IF NOT EXISTS "replaydata"
 (
	"replayid"			INTEGER NOT NULL, 
	"actionid"			INTEGER NOT NULL, 
	"time"			REAL NOT NULL, 
	"formname"			VARCHAR (50) NOT NULL, 
	"controltype"			VARCHAR (50) NOT NULL, 
	"controlname"			VARCHAR (50) NOT NULL, 
	"controlsubname"			VARCHAR (50), 
	"index"			INTEGER NOT NULL, 
	"capacity"			REAL NOT NULL, 
	"disablestate"			BOOLEAN NOT NULL, 
	"delaytime"			REAL, 
	"ramptime"			REAL
);
COMMENT ON COLUMN "replaydata"."replayid" IS 'ID Number for Replay Set';
COMMENT ON COLUMN "replaydata"."actionid" IS 'ID Number for Control Action';
COMMENT ON COLUMN "replaydata"."time" IS 'Time control changed state';
COMMENT ON COLUMN "replaydata"."formname" IS 'Form where the control is located';
COMMENT ON COLUMN "replaydata"."controltype" IS 'Type of Control';
COMMENT ON COLUMN "replaydata"."controlname" IS 'Control Name';
COMMENT ON COLUMN "replaydata"."controlsubname" IS 'Control subcomponent name (e.g., PZR Backup Heaters = BkupHtr)';
COMMENT ON COLUMN "replaydata"."index" IS 'Index of the control in its array';
COMMENT ON COLUMN "replaydata"."capacity" IS 'Capacity\Position value of the control';
COMMENT ON COLUMN "replaydata"."disablestate" IS 'Disable state of the control';
COMMENT ON COLUMN "replaydata"."delaytime" IS 'Delay Time for Malfunction';
COMMENT ON COLUMN "replaydata"."ramptime" IS 'Ramp Time for Malfunction';

-- CREATE INDEXES ...
CREATE INDEX "replaydata_actionid_idx" ON "replaydata" ("actionid");
ALTER TABLE "replaydata" ADD CONSTRAINT "replaydata_pkey" PRIMARY KEY ("replayid", "actionid");
CREATE INDEX "replaydata_replayid_idx" ON "replaydata" ("replayid");
CREATE INDEX "replaydata_time_idx" ON "replaydata" ("time");

CREATE TABLE IF NOT EXISTS "temppresetfreeze"
 (
	"num"			VARCHAR (255), 
	"variable"			VARCHAR (255), 
	"relation"			VARCHAR (255), 
	"value"			REAL, 
	"active"			BOOLEAN NOT NULL, 
	"met"			BOOLEAN NOT NULL
);

-- CREATE INDEXES ...

CREATE TABLE IF NOT EXISTS "icfanmalfdata"
 (
	"ic"			INTEGER, 
	"fan cooler 1"			BOOLEAN NOT NULL, 
	"fan cooler 2"			BOOLEAN NOT NULL, 
	"fan cooler 3"			BOOLEAN NOT NULL, 
	"fan cooler 4"			BOOLEAN NOT NULL, 
	"rx bldg vent"			BOOLEAN NOT NULL
);
COMMENT ON COLUMN "icfanmalfdata"."ic" IS 'Initial Condition';

-- CREATE INDEXES ...
ALTER TABLE "icfanmalfdata" ADD CONSTRAINT "icfanmalfdata_pkey" PRIMARY KEY ("ic");

CREATE TABLE IF NOT EXISTS "icthermodata"
 (
	"ic"			INTEGER, 
	"description"			VARCHAR (50), 
	"dt"			DOUBLE PRECISION, 
	"tint"			DOUBLE PRECISION, 
	"pf"			DOUBLE PRECISION, 
	"ans"			DOUBLE PRECISION, 
	"powr"			DOUBLE PRECISION, 
	"pwr0"			DOUBLE PRECISION, 
	"trcpa"			DOUBLE PRECISION, 
	"trcpb"			DOUBLE PRECISION, 
	"trkt"			DOUBLE PRECISION, 
	"trkf"			DOUBLE PRECISION, 
	"ttdafw"			DOUBLE PRECISION, 
	"tmdafw"			INTEGER, 
	"tcsp"			DOUBLE PRECISION, 
	"tscram"			DOUBLE PRECISION, 
	"tfcl"			DOUBLE PRECISION, 
	"tlpi"			DOUBLE PRECISION, 
	"tcft"			DOUBLE PRECISION, 
	"thpi"			DOUBLE PRECISION, 
	"hifx"			DOUBLE PRECISION, 
	"wrc1"			DOUBLE PRECISION, 
	"alda"			DOUBLE PRECISION, 
	"alif"			DOUBLE PRECISION, 
	"beta"			DOUBLE PRECISION, 
	"ramp"			DOUBLE PRECISION, 
	"akmd"			DOUBLE PRECISION, 
	"rhsd"			DOUBLE PRECISION, 
	"akdp"			DOUBLE PRECISION, 
	"itbv"			INTEGER, 
	"icsp"			INTEGER, 
	"irun"			INTEGER, 
	"rdpos"			INTEGER, 
	"p"			DOUBLE PRECISION, 
	"tavg"			DOUBLE PRECISION, 
	"tm"			DOUBLE PRECISION, 
	"lev"			DOUBLE PRECISION, 
	"v"			DOUBLE PRECISION, 
	"vr"			DOUBLE PRECISION, 
	"w3"			DOUBLE PRECISION, 
	"uc"			DOUBLE PRECISION, 
	"mbk"			DOUBLE PRECISION, 
	"frcl"			DOUBLE PRECISION, 
	"psg0"			DOUBLE PRECISION, 
	"lsga"			DOUBLE PRECISION, 
	"lsgb"			DOUBLE PRECISION, 
	"sgct"			DOUBLE PRECISION, 
	"lsld"			INTEGER, 
	"itdafw"			INTEGER, 
	"imdafw"			INTEGER, 
	"ilev"			INTEGER, 
	"isat"			INTEGER, 
	"icore"			INTEGER, 
	"ilif"			INTEGER, 
	"ksga"			INTEGER, 
	"ihpi"			INTEGER, 
	"irca"			INTEGER, 
	"ircb"			INTEGER, 
	"icft"			INTEGER, 
	"ilpi"			INTEGER, 
	"icrt"			INTEGER, 
	"x"			DOUBLE PRECISION, 
	"imfw"			INTEGER, 
	"msga"			DOUBLE PRECISION, 
	"msgb"			DOUBLE PRECISION, 
	"psga"			DOUBLE PRECISION, 
	"psgb"			DOUBLE PRECISION, 
	"xsga"			DOUBLE PRECISION, 
	"xsgb"			DOUBLE PRECISION, 
	"ptbva"			DOUBLE PRECISION, 
	"ptbvb"			DOUBLE PRECISION, 
	"nsg2a"			DOUBLE PRECISION, 
	"nsg2b"			DOUBLE PRECISION, 
	"wtba"			DOUBLE PRECISION, 
	"wtbb"			DOUBLE PRECISION, 
	"rhx"			DOUBLE PRECISION, 
	"wfwa"			DOUBLE PRECISION, 
	"wfwb"			DOUBLE PRECISION, 
	"wrca"			DOUBLE PRECISION, 
	"wrcb"			DOUBLE PRECISION, 
	"wmfw0"			DOUBLE PRECISION, 
	"lvcr"			DOUBLE PRECISION, 
	"pn2"			DOUBLE PRECISION, 
	"prb"			DOUBLE PRECISION, 
	"trb"			DOUBLE PRECISION, 
	"lwrb"			DOUBLE PRECISION, 
	"tfsb"			DOUBLE PRECISION, 
	"tfpk"			DOUBLE PRECISION, 
	"qn"			DOUBLE PRECISION, 
	"sum"			DOUBLE PRECISION, 
	"wsta"			DOUBLE PRECISION, 
	"wstb"			DOUBLE PRECISION, 
	"tpct"			DOUBLE PRECISION, 
	"vh2o"			DOUBLE PRECISION, 
	"vn2"			DOUBLE PRECISION, 
	"fwera0"			DOUBLE PRECISION, 
	"fwerb0"			DOUBLE PRECISION, 
	"pera0"			DOUBLE PRECISION, 
	"perb0"			DOUBLE PRECISION, 
	"erl0"			DOUBLE PRECISION, 
	"timestep"			INTEGER, 
	"lvap1"			DOUBLE PRECISION, 
	"pset1"			DOUBLE PRECISION, 
	"tklv"			DOUBLE PRECISION, 
	"wcrv"			DOUBLE PRECISION, 
	"wstab"			DOUBLE PRECISION, 
	"lvap2"			DOUBLE PRECISION, 
	"wcrl"			DOUBLE PRECISION, 
	"ppm"			DOUBLE PRECISION, 
	"ppm0"			REAL, 
	"rhx0"			REAL
);
COMMENT ON COLUMN "icthermodata"."ic" IS 'IC Number';
COMMENT ON COLUMN "icthermodata"."description" IS 'IC description';
COMMENT ON COLUMN "icthermodata"."dt" IS 'Time step size for run (sec)';
COMMENT ON COLUMN "icthermodata"."tint" IS '(run initiation time (sec))';
COMMENT ON COLUMN "icthermodata"."pf" IS 'Power factor as fraction of rated';
COMMENT ON COLUMN "icthermodata"."ans" IS 'Decay heat level as multiplier to American Nuclear Standard 5.1 decay heat table.';
COMMENT ON COLUMN "icthermodata"."powr" IS 'Unit load demand (ULD) set point as fraction of full power';
COMMENT ON COLUMN "icthermodata"."pwr0" IS 'Power set point as fraction of full power';
COMMENT ON COLUMN "icthermodata"."trcpa" IS 'Time for left side reactor coolant pump trip (sec)';
COMMENT ON COLUMN "icthermodata"."trcpb" IS 'Time for right side reactor coolant pump trip (sec)';
COMMENT ON COLUMN "icthermodata"."trkt" IS '(Time to start power ramp (sec))';
COMMENT ON COLUMN "icthermodata"."trkf" IS '(Time for power ramp is ended (sec))';
COMMENT ON COLUMN "icthermodata"."ttdafw" IS '(Time for the turbine driven AFW pump to  start (sec))';
COMMENT ON COLUMN "icthermodata"."tmdafw" IS '(Time for the motor driven AFW pump to  start (sec))';
COMMENT ON COLUMN "icthermodata"."tcsp" IS 'Containment spray initiation time (sec)';
COMMENT ON COLUMN "icthermodata"."tscram" IS 'Time for reactor scram (sec)';
COMMENT ON COLUMN "icthermodata"."tfcl" IS 'Containment fan cooler initiation time (sec)';
COMMENT ON COLUMN "icthermodata"."tlpi" IS 'Low pressure injection initiation time (sec)';
COMMENT ON COLUMN "icthermodata"."tcft" IS 'Core flood tank (accumulator) initiation time (sec)';
COMMENT ON COLUMN "icthermodata"."thpi" IS 'High Pressure injection initiation time (sec)';
COMMENT ON COLUMN "icthermodata"."hifx" IS 'High neutron flux reactor scracm set point (fraction of full power, IC dependent)';
COMMENT ON COLUMN "icthermodata"."wrc1" IS 'Low core flow reactor scram set point (fraction of full flow, IC dependent)';
COMMENT ON COLUMN "icthermodata"."alda" IS 'decay constant,for fast transient 0.405 sec-1, slow  =  0.0767 sec-1';
COMMENT ON COLUMN "icthermodata"."alif" IS 'effective neutron life time (sec)';
COMMENT ON COLUMN "icthermodata"."beta" IS 'effective delay neutron fraction';
COMMENT ON COLUMN "icthermodata"."ramp" IS 'turbine power demand ramp rate (%/min)';
COMMENT ON COLUMN "icthermodata"."akmd" IS ' moderator temperature reactivity coefficient ($/°C)';
COMMENT ON COLUMN "icthermodata"."rhsd" IS 'shutdown reactivity ($)';
COMMENT ON COLUMN "icthermodata"."akdp" IS 'Doppler (fuel) reactivity coefficient ($/°C)';
COMMENT ON COLUMN "icthermodata"."itbv" IS '(Turbine bypass system control in Tavg/SG pressure mode)';
COMMENT ON COLUMN "icthermodata"."icsp" IS '(Containment spray system stop/run)';
COMMENT ON COLUMN "icthermodata"."irun" IS '(Initial/snapped IC)';
COMMENT ON COLUMN "icthermodata"."rdpos" IS 'rod position % of withdrawan';
COMMENT ON COLUMN "icthermodata"."p" IS '(RCS pressure (Kg/cm2))';
COMMENT ON COLUMN "icthermodata"."tavg" IS '(RCS average temperature  (°C))';
COMMENT ON COLUMN "icthermodata"."tm" IS '(Subcooled RCS temperature  (°C))';
COMMENT ON COLUMN "icthermodata"."lev" IS '(Dimensionless RCS inventory)';
COMMENT ON COLUMN "icthermodata"."v" IS '(Two-phase volume (M3))';
COMMENT ON COLUMN "icthermodata"."vr" IS '(Subcooled volume (M3))';
COMMENT ON COLUMN "icthermodata"."w3" IS '(Interconnecting flow rate  (t/hr))';
COMMENT ON COLUMN "icthermodata"."uc" IS 'Steam generator heat transfer coefficient at 100% power';
COMMENT ON COLUMN "icthermodata"."mbk" IS '(Integrated break flow in the containment (kg))';
COMMENT ON COLUMN "icthermodata"."frcl" IS '(Clad damage fraction (%))';
COMMENT ON COLUMN "icthermodata"."psg0" IS 'Steam generator pressure at zero power (bar)';
COMMENT ON COLUMN "icthermodata"."lsga" IS '(A SG wide range level (M))';
COMMENT ON COLUMN "icthermodata"."lsgb" IS '(B SG wide range level (M))';
COMMENT ON COLUMN "icthermodata"."sgct" IS '(SG mass to level conversion constant ( = MSG0/LSG0))';
COMMENT ON COLUMN "icthermodata"."lsld" IS '(Pressurizer top discharge flow (steam/liquid))';
COMMENT ON COLUMN "icthermodata"."itdafw" IS '(TD AFW pump not initiated/initiated)';
COMMENT ON COLUMN "icthermodata"."imdafw" IS '(MD AFW pump not initiated/initiated)';
COMMENT ON COLUMN "icthermodata"."ilev" IS '(Pressurizer not drained/has drained)';
COMMENT ON COLUMN "icthermodata"."isat" IS '(RCS subcooled/saturated)';
COMMENT ON COLUMN "icthermodata"."icore" IS '(Reactor at power/tripped)';
COMMENT ON COLUMN "icthermodata"."ilif" IS 'Core life beginning/middle/end of cycle';
COMMENT ON COLUMN "icthermodata"."ksga" IS 'Number of steam generators at the left hand A-side';
COMMENT ON COLUMN "icthermodata"."ihpi" IS '(HPI not initiated/initiated)';
COMMENT ON COLUMN "icthermodata"."irca" IS '(RCP-A tripped/operating)';
COMMENT ON COLUMN "icthermodata"."ircb" IS '(RCP-B tripped/operating';
COMMENT ON COLUMN "icthermodata"."icft" IS '(CFT not initiated/initiated';
COMMENT ON COLUMN "icthermodata"."ilpi" IS '(LPI not initiated/initiated';
COMMENT ON COLUMN "icthermodata"."icrt" IS '(LOCA flow (critical/non?critical)';
COMMENT ON COLUMN "icthermodata"."x" IS '(RCS two-phase volume quality';
COMMENT ON COLUMN "icthermodata"."imfw" IS '(Main feedwater status (on/tripped)';
COMMENT ON COLUMN "icthermodata"."msga" IS '(A SG liquid mass (kg))';
COMMENT ON COLUMN "icthermodata"."msgb" IS '(B  SG liquid mass (kg))';
COMMENT ON COLUMN "icthermodata"."psga" IS '(A SG pressure (bar))';
COMMENT ON COLUMN "icthermodata"."psgb" IS '(B SG pressure (bar))';
COMMENT ON COLUMN "icthermodata"."xsga" IS '(A SG quality))';
COMMENT ON COLUMN "icthermodata"."xsgb" IS '(B SG quality))';
COMMENT ON COLUMN "icthermodata"."ptbva" IS '(A SG pressure (bar))';
COMMENT ON COLUMN "icthermodata"."ptbvb" IS '(B turbine bypass controlling pressure   (bar))';
COMMENT ON COLUMN "icthermodata"."nsg2a" IS 'A SG controlling (narrow range level (%)';
COMMENT ON COLUMN "icthermodata"."nsg2b" IS 'B SG controlling narrow range level (%)';
COMMENT ON COLUMN "icthermodata"."wtba" IS '(A SG turbine flow   (t/hr))';
COMMENT ON COLUMN "icthermodata"."wtbb" IS '(B SG turbine flow   (t/hr))';
COMMENT ON COLUMN "icthermodata"."rhx" IS '(Externally inserted rod & boron reactivity ($))';
COMMENT ON COLUMN "icthermodata"."wfwa" IS '(A SG feedwater flow (t/hr))';
COMMENT ON COLUMN "icthermodata"."wfwb" IS '(B SG feedwater flow (t/hr))';
COMMENT ON COLUMN "icthermodata"."wrca" IS '(RC loop A flow (kt/hr))';
COMMENT ON COLUMN "icthermodata"."wrcb" IS '(RC loop B flow (kt/hr))';
COMMENT ON COLUMN "icthermodata"."wmfw0" IS '(Nominal full power total feedwater flow  (t/hr))';
COMMENT ON COLUMN "icthermodata"."lvcr" IS '(Core water level from bottom of the core (M))';
COMMENT ON COLUMN "icthermodata"."pn2" IS '(Accumulator nitrogen pressure (bar))';
COMMENT ON COLUMN "icthermodata"."prb" IS '(Containment pressure   (bar))';
COMMENT ON COLUMN "icthermodata"."trb" IS '(Containment temperature  (°C))';
COMMENT ON COLUMN "icthermodata"."lwrb" IS '(Containment water level  (M))';
COMMENT ON COLUMN "icthermodata"."tfsb" IS '(Submerged fuel average temperature  (°C))';
COMMENT ON COLUMN "icthermodata"."tfpk" IS '(Peak fuel temperature  (°C))';
COMMENT ON COLUMN "icthermodata"."qn" IS '(Normalized neutron flux)';
COMMENT ON COLUMN "icthermodata"."sum" IS '(integration term in kinetics equation)';
COMMENT ON COLUMN "icthermodata"."wsta" IS '(A SG steam flow   (t/hr))';
COMMENT ON COLUMN "icthermodata"."wstb" IS '(B SG steam flow   (t/hr))';
COMMENT ON COLUMN "icthermodata"."tpct" IS '(Peak clad temperature (°C))';
COMMENT ON COLUMN "icthermodata"."vh2o" IS '(Total CFT (accumulator) water volume)';
COMMENT ON COLUMN "icthermodata"."vn2" IS '(total CFT nitrogen volume  (M3))';
COMMENT ON COLUMN "icthermodata"."fwera0" IS '(feedwater control valve A error)';
COMMENT ON COLUMN "icthermodata"."fwerb0" IS '(feedwater control valve B error)';
COMMENT ON COLUMN "icthermodata"."pera0" IS '(SG A pressure controller error)';
COMMENT ON COLUMN "icthermodata"."perb0" IS '(SG B pressure controller error)';
COMMENT ON COLUMN "icthermodata"."erl0" IS '(pressurizer level controller error)';
COMMENT ON COLUMN "icthermodata"."timestep" IS '(number of time steps)';
COMMENT ON COLUMN "icthermodata"."lvap1" IS 'Break elevation (dimensionless)';
COMMENT ON COLUMN "icthermodata"."pset1" IS '(SG header pressure set point, bar)';
COMMENT ON COLUMN "icthermodata"."tklv" IS '(RWST water inventory, ton)';
COMMENT ON COLUMN "icthermodata"."wcrv" IS '(Critical break flow rate, t/hr)';
COMMENT ON COLUMN "icthermodata"."wstab" IS 'SG steam flow cross connect Kg/s';
COMMENT ON COLUMN "icthermodata"."lvap2" IS 'Elv for Przr discharge turn to vapor  (dimensionless)';
COMMENT ON COLUMN "icthermodata"."wcrl" IS '(Critical break flow rate, t/hr)';
COMMENT ON COLUMN "icthermodata"."ppm" IS 'RCS boron concentration (ppm)';
COMMENT ON COLUMN "icthermodata"."ppm0" IS 'Nominal boron concentration (ppm)';
COMMENT ON COLUMN "icthermodata"."rhx0" IS 'Original reactivity';

-- CREATE INDEXES ...
ALTER TABLE "icthermodata" ADD CONSTRAINT "icthermodata_pkey" PRIMARY KEY ("ic");


-- CREATE Relationships ...
-- Relationship from "ICFanMalfData" ("ic") to "ICFanData"("ic") does not enforce integrity.
-- Relationship from "ICHxMalfData" ("ic") to "ICHxData"("ic") does not enforce integrity.
-- Relationship from "ListMalf" ("malfunction") to "ICMalfData"("malfunction") does not enforce integrity.
-- Relationship from "ICValveData" ("ic") to "ListIC"("ic") does not enforce integrity.
-- Relationship from "ICPumpMalfData" ("ic") to "ICPumpData"("ic") does not enforce integrity.
-- Relationship from "ICFanData" ("ic") to "ListIC"("ic") does not enforce integrity.
-- Relationship from "ICControlsData" ("ic") to "ListIC"("ic") does not enforce integrity.
-- Relationship from "ICThermoData" ("ic") to "ListIC"("ic") does not enforce integrity.
-- Relationship from "ICPumpData" ("ic") to "ListIC"("ic") does not enforce integrity.
-- Relationship from "ICMalfData" ("ic") to "ListIC"("ic") does not enforce integrity.
-- Relationship from "ICHxData" ("ic") to "ListIC"("ic") does not enforce integrity.
