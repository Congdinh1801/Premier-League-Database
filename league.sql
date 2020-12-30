DROP TABLE player_awards CASCADE CONSTRAINTS;
DROP TABLE player CASCADE CONSTRAINTS;
DROP TABLE team CASCADE CONSTRAINTS;
DROP TABLE director CASCADE CONSTRAINTS;
DROP TABLE matches CASCADE CONSTRAINTS;
DROP TABLE referee CASCADE CONSTRAINTS;
DROP TABLE coach CASCADE CONSTRAINTS;
DROP TABLE team_history CASCADE CONSTRAINTS;
DROP TABLE plays_in CASCADE CONSTRAINTS;
DROP TABLE participate CASCADE CONSTRAINTS;
DROP TABLE controls CASCADE CONSTRAINTS;
DROP TABLE manages CASCADE CONSTRAINTS;

CREATE TABLE player_awards(
Type        VARCHAR2 (20),
Month        VARCHAR2 (3),
Year        CHAR (4),
P_name    VARCHAR2 (30),
CONSTRAINT paward_type_mon_year_pk PRIMARY KEY (Type, Month, Year));

CREATE TABLE player(
PName        VARCHAR2 (30) CONSTRAINT player_name_pk PRIMARY KEY,
Goals        NUMBER (3),
Assist        NUMBER (3),
BirthDate    DATE,
Appearances    NUMBER (3),
Nationality    VARCHAR2 (25),
Pposition    CHAR (2),
T_name    VARCHAR2 (20));

CREATE TABLE team(
Stadium    VARCHAR2 (20),
Name        VARCHAR2 (20) CONSTRAINT team_name_pk PRIMARY KEY,
Web        VARCHAR2 (40),
Chairman    VARCHAR2 (30));

CREATE TABLE director(
Director_Name   VARCHAR2 (30),
T_name    VARCHAR2 (15),
CONSTRAINT director_name_Tname_pk PRIMARY KEY (Director_Name, T_name));

CREATE TABLE matches(
Stadium    VARCHAR2 (20),
Matches_Date    DATE,
H_Score    NUMBER (2),
G_Score    NUMBER (2),
CONSTRAINT matches_date_stadium_pk PRIMARY KEY (Stadium, Matches_Date));

CREATE TABLE referee(
Name        VARCHAR2 (30) CONSTRAINT referee_name_pk PRIMARY KEY,
CountyFA    VARCHAR2 (30),
Red_Card    NUMBER (3),
Yellow_Card    NUMBER (4),
Debut_Match    DATE);

CREATE TABLE coach(
Name        VARCHAR2 (30) CONSTRAINT coach_name_pk PRIMARY KEY,
Start_date    DATE,
Country_birth    VARCHAR2 (25),
BirthDate    DATE,
NumSeason    NUMBER (2));

CREATE TABLE team_history(
Year        CHAR (4),
T_name    VARCHAR2 (15),
Win        NUMBER (2),
Loss        NUMBER (2),
Total_matches    NUMBER (3),
Goals        NUMBER (3),
Yellow_card    NUMBER (3),
Red_card    NUMBER (3),
Fouls        NUMBER (3),
Offside        NUMBER (3),
CONSTRAINT team_history_year_T_name_pk PRIMARY KEY (Year, T_name));

CREATE TABLE plays_in(
P_name    VARCHAR2 (30),
M_stadium    VARCHAR2 (20),
M_date    DATE,
CONSTRAINT plays_in_player_match_pk PRIMARY KEY (P_name, M_stadium, M_date));

CREATE TABLE participate(
T_name    VARCHAR2 (15),
M_stadium    VARCHAR2 (20),
M_date    DATE,
CONSTRAINT participate_team_match_pk PRIMARY KEY (T_name , M_stadium,  M_date));

CREATE TABLE controls(
R_name    VARCHAR2 (30),
M_stadium    VARCHAR2 (20),
M_date    DATE,
CONSTRAINT controls_ref_match_pk PRIMARY KEY (R_name, M_stadium, M_date));

CREATE TABLE manages(
C_name    VARCHAR2 (30),
T_name    VARCHAR2 (15),
CONSTRAINT manages_coach_team_pk PRIMARY KEY (C_name, T_name));

ALTER TABLE player_awards
ADD CONSTRAINT playerawards_pname_fk FOREIGN KEY(P_name) REFERENCES player (PName);

ALTER TABLE player
ADD CONSTRAINT player_Tname_fk FOREIGN KEY(T_name) REFERENCES team (Name);

ALTER TABLE director
ADD CONSTRAINT director_tname_fk FOREIGN KEY(T_name) REFERENCES team (Name);

ALTER TABLE team_history
ADD CONSTRAINT teamhistory_tname_fk FOREIGN KEY(T_name) REFERENCES team (Name);

ALTER TABLE plays_in ADD(
CONSTRAINT playsin_pname_fk FOREIGN KEY(P_name) REFERENCES player (PName),
CONSTRAINT playsin_mstadium_fk FOREIGN KEY(M_stadium, M_date) REFERENCES matches (Stadium, Matches_Date));

ALTER TABLE participate ADD(
CONSTRAINT participate_tname_fk FOREIGN KEY(T_name) REFERENCES team (Name),
CONSTRAINT participate_mstadium_fk FOREIGN KEY(M_stadium, M_date) REFERENCES matches (Stadium, Matches_Date));

ALTER TABLE controls ADD(
CONSTRAINT controls_rname_fk FOREIGN KEY(R_name) REFERENCES referee (Name),
CONSTRAINT controls_mstadium_fk FOREIGN KEY(M_stadium, M_date) REFERENCES matches (Stadium, Matches_Date));

ALTER TABLE manages ADD(
CONSTRAINT manages_cname_fk FOREIGN KEY(C_name) REFERENCES coach (Name),
CONSTRAINT manages_tname_fk FOREIGN KEY(T_name) REFERENCES team (Name));









