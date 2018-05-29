CREATE SCHEMA `mdcdb` ;

USE mdcdb;

CREATE table processrelation(db_key INTEGER, pathid INTEGER);
CREATE table application(db_key INTEGER, event VARCHAR(32), uid VARCHAR(16), name VARCHAR(64), view VARCHAR(16));
CREATE table gps(db_key INTEGER, time INTEGER, longitude NUMERIC(11,8), latitude NUMERIC(11,8), altitude NUMERIC(11,8), speed NUMERIC, speed_accuracy NUMERIC, horizontal_dop NUMERIC, horizontal_accuracy NUMERIC, vertical_dop NUMERIC, vertical_accuracy NUMERIC, time_since_gps_boot NUMERIC);
CREATE table deviceassign(imei VARCHAR(75), userid INTEGER, start INTEGER, stop INTEGER);
CREATE table users(userid INTEGER, phonenumber VARCHAR(75), test_user CHAR);
CREATE table bnetworks(id INTEGER, mac VARCHAR(75));
CREATE table wlanrelation(db_key INTEGER, id_wnetworks INTEGER, ssid VARCHAR(75), rx INTEGER, channel INTEGER, security VARCHAR(8), opmode VARCHAR(8));
CREATE table mediaplay(db_key INTEGER, album VARCHAR(75), artist VARCHAR(75), track INTEGER, title VARCHAR(75), uri VARCHAR(75), state INTEGER, duration INTEGER);
CREATE table records(db_key INTEGER, userid INTEGER, time INTEGER, tz INTEGER, type VARCHAR(16));
CREATE table btrelation(db_key INTEGER, id_bnetworks INTEGER, name VARCHAR(75));
CREATE table calllog(db_key INTEGER, time INTEGER, status VARCHAR(16), direction VARCHAR(16), description VARCHAR(16), number VARCHAR(75), name VARCHAR(75), contact INTEGER, flags INTEGER, duration INTEGER, link INTEGER, subject INTEGER, logid INTEGER, durationtype INTEGER);
CREATE table devices(imei VARCHAR(75), model VARCHAR(16), id_bnetworks INTEGER);
CREATE table gsmcells(id INTEGER, cell_id INTEGER, country_code INTEGER, network_code INTEGER, area_code INTEGER);
CREATE table gsm(db_key INTEGER, id_gsmcells INTEGER, signaldbm INTEGER, `signal` INTEGER);
CREATE table survey_phones(userid INTEGER, relation INTEGER, number VARCHAR(75));
CREATE table sms(db_key INTEGER, time INTEGER, box VARCHAR(10), status INTEGER, totallength INTEGER, letternbr VARCHAR(50), address VARCHAR(75), rid INTEGER);
CREATE table visits_20min(userid INTEGER, placeid INTEGER, time_start INTEGER, tz_start INTEGER, time_end INTEGER, tz_end INTEGER, trusted_start CHAR, trusted_end CHAR, trusted_transition CHAR);
CREATE table sys(db_key INTEGER, profile VARCHAR(16), battery INTEGER, charging INTEGER, c INTEGER, d INTEGER, e INTEGER, y INTEGER, z INTEGER, inactive INTEGER, ring VARCHAR(16), freeram INTEGER);
CREATE table accel_activity_noko(idx INTEGER, db_key INTEGER, activity VARCHAR(120), likelihood DOUBLE PRECISION, ismostlikely CHAR);
CREATE table gpswlan(db_key INTEGER, longitude NUMERIC, latitude NUMERIC, mac VARCHAR(75));
CREATE table eb(db_key INTEGER, buildtime VARCHAR(64), version VARCHAR(16), action VARCHAR(16), imsi VARCHAR(75));
CREATE table state(db_key INTEGER, state VARCHAR(32), reason VARCHAR(128));
CREATE table accel(db_key INTEGER, start INTEGER, stop INTEGER, avdelt REAL, data MEDIUMTEXT);
CREATE table places(userid INTEGER, placeid INTEGER, place_label INTEGER, with_family CHAR, with_close_friends CHAR, with_friends CHAR, with_colleagues_acquaintances CHAR, with_incidental CHAR);
CREATE table calendar(db_key INTEGER, uid INTEGER, begin INTEGER, last_mod INTEGER, status VARCHAR(16), title VARCHAR(75), location VARCHAR(75), type VARCHAR(16), class VARCHAR(16));
CREATE table visits_10min(userid INTEGER, placeid INTEGER, time_start INTEGER, tz_start INTEGER, time_end INTEGER, tz_end INTEGER, trusted_start CHAR, trusted_end CHAR, trusted_transition CHAR);
CREATE table wnetworks(id INTEGER, mac VARCHAR(75));
CREATE table media(db_key INTEGER, time INTEGER, tz INTEGER, filename VARCHAR(75), extension VARCHAR(3), size NUMERIC);
CREATE table contacts(db_key INTEGER, cid INTEGER, first_name VARCHAR(75), last_name VARCHAR(75), mobile VARCHAR(500), tel VARCHAR(500), last_mod INTEGER);
CREATE table demographics(userid INTEGER, gender INTEGER, age_group INTEGER, nb_12 INTEGER, nb_12_18 INTEGER, nb_18_30 INTEGER, nb_30_40 INTEGER, nb_40_50 INTEGER, nb_50_65 INTEGER, nb_65 INTEGER, working INTEGER, phone_bill INTEGER);
CREATE table paths(id INTEGER, path VARCHAR(128));

LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\sms.csv' INTO TABLE sms;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\gsmcells.csv' INTO TABLE gsmcells;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\devices.csv' INTO TABLE devices;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\paths.csv' INTO TABLE paths;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\eb.csv' INTO TABLE eb;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\wnetworks.csv' INTO TABLE wnetworks;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\calendar.csv' INTO TABLE calendar;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\survey_phones.csv' INTO TABLE survey_phones;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\calllog.csv' INTO TABLE calllog;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\gps.csv' INTO TABLE gps;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\places.csv' INTO TABLE places;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\users.csv' INTO TABLE users;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\deviceassign.csv' INTO TABLE deviceassign;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\accel_activity_noko.csv' INTO TABLE accel_activity_noko;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\bnetworks.csv' INTO TABLE bnetworks;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\demographics.csv' INTO TABLE demographics;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\gsm.csv' INTO TABLE gsm;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\visits_20min.csv' INTO TABLE visits_20min;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\application.csv' INTO TABLE application;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\contacts.csv' INTO TABLE contacts;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\media.csv' INTO TABLE media;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\gpswlan.csv' INTO TABLE gpswlan;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\visits_10min.csv' INTO TABLE visits_10min;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\state.csv' INTO TABLE state;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\mediaplay.csv' INTO TABLE mediaplay;

ALTER TABLE eb ADD PRIMARY KEY (db_key);
ALTER TABLE bnetworks ADD PRIMARY KEY (id);
ALTER TABLE paths ADD PRIMARY KEY (id);
ALTER TABLE gsmcells ADD PRIMARY KEY (id);
ALTER TABLE application ADD PRIMARY KEY (db_key);
ALTER TABLE state ADD PRIMARY KEY (db_key);
ALTER TABLE gps ADD PRIMARY KEY (db_key);
ALTER TABLE gpswlan ADD PRIMARY KEY (db_key);
ALTER TABLE users ADD PRIMARY KEY (userid);
ALTER TABLE demographics ADD PRIMARY KEY (userid);
ALTER TABLE accel_activity_noko ADD PRIMARY KEY (idx);
ALTER TABLE mediaplay ADD PRIMARY KEY (db_key);
ALTER TABLE devices ADD PRIMARY KEY (imei);
ALTER TABLE wnetworks ADD PRIMARY KEY (id);
ALTER TABLE gsm ADD PRIMARY KEY (db_key);

CREATE INDEX bnetworksmac_idx ON bnetworks(mac);
CREATE INDEX pathspaths_idx ON paths(path);
CREATE INDEX gsmcellscell_id_idx ON gsmcells(cell_id);
CREATE INDEX contactscid_idx ON contacts(cid);
CREATE INDEX contactsdb_key_idx ON contacts(db_key);
CREATE INDEX contactsfirst_name_idx ON contacts(first_name);
CREATE INDEX contactslast_name_idx ON contacts(last_name);
CREATE INDEX mediatime_filename_size_idx ON media(time,filename,size);
CREATE INDEX mediadb_key_idx ON media(db_key);
CREATE INDEX mediaextension_idx ON media(extension);
CREATE INDEX smsbox_idx ON sms(box);
CREATE INDEX smsdb_key_idx ON sms(db_key);
CREATE INDEX smsstatus_idx ON sms(status);
CREATE INDEX smstime_idx ON sms(time);
CREATE INDEX gpstime_idx ON gps(time);
CREATE INDEX btrelationdb_key_idx ON btrelation(db_key);
CREATE INDEX btrelationid_bnetworks_idx ON btrelation(id_bnetworks);
CREATE INDEX gpswlanmac_idx ON gpswlan(mac);
CREATE INDEX calendarbegin_idx ON calendar(begin);
CREATE INDEX calendardb_key_idx ON calendar(db_key);
CREATE INDEX calendaruid_idx ON calendar(uid);
CREATE INDEX visits_20minuserid_idx ON visits_20min(userid);
CREATE INDEX visits_20minuserid_placeid_idx ON visits_20min(userid,placeid);
CREATE INDEX accel_activity_nokodb_key_idx ON accel_activity_noko(db_key);
CREATE INDEX mediaplaydb_key_idx ON mediaplay(db_key);
CREATE INDEX visits_10minplaceid_idx ON visits_10min(placeid);
CREATE INDEX visits_10minuserid_idx ON visits_10min(userid);
CREATE INDEX visits_10minuserid_placeid_idx ON visits_10min(userid,placeid);
CREATE INDEX placesuserid_placeid_idx ON places(userid,placeid);
CREATE INDEX placesplaceid_idx ON places(placeid);
CREATE INDEX placesuserid_idx ON places(userid);
CREATE INDEX deviceassignimei_idx ON deviceassign(imei);
CREATE INDEX deviceassignstart_idx ON deviceassign(start);
CREATE INDEX deviceassignstop_idx ON deviceassign(stop);
CREATE INDEX devicesid_bnetworks_idx ON devices(id_bnetworks);
CREATE INDEX devicesmodel_idx ON devices(model);
CREATE INDEX wnetworksmac_idx ON wnetworks(mac);
CREATE INDEX calllogdb_key_idx ON calllog(db_key);
CREATE INDEX calllogdescription_idx ON calllog(description);
CREATE INDEX calllogdirection_idx ON calllog(direction);
CREATE INDEX callloglogid_idx ON calllog(logid);
CREATE INDEX calllogtime_idx ON calllog(time);
CREATE INDEX gsmid_gsmcells_idx ON gsm(id_gsmcells);


LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\sys.csv' INTO TABLE sys;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\wlanrelation.csv' INTO TABLE wlanrelation;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\accel.csv' INTO TABLE accel;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\processrelation.csv' INTO TABLE processrelation;
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\btrelation.csv' INTO TABLE btrelation;

ALTER TABLE accel ADD PRIMARY KEY (db_key);
ALTER TABLE sys ADD PRIMARY KEY (db_key);

CREATE INDEX wlanrelationdb_key_idx ON wlanrelation(db_key);
CREATE INDEX wlanrelationid_wnetworks_idx ON wlanrelation(id_wnetworks);
CREATE INDEX processrelationdb_key_idx ON processrelation(db_key);
CREATE INDEX processrelationpathid_idx ON processrelation(pathid);


ALTER TABLE records ADD PRIMARY KEY (db_key, userid);

CREATE table records(db_key INTEGER, userid INTEGER, time INTEGER, tz INTEGER, type VARCHAR(16));
LOAD DATA LOCAL INFILE 'C:\\mdcdb_1063\\records.csv' IGNORE INTO TABLE records;

ALTER TABLE records ADD PRIMARY KEY (db_key, userid);

CREATE INDEX recordstime_idx ON records(time);
CREATE INDEX recordstype_idx ON records(type);
CREATE INDEX recordsuserid_idx ON records(userid);
