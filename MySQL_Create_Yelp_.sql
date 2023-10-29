DROP TABLE IF EXISTS REVIEW;
DROP TABLE IF EXISTS BUSINESS;
DROP TABLE IF EXISTS USERS;

use newdb;
create database newdb;

CREATE TABLE REVIEW (
id	varchar(22)	NOT NULL PRIMARY KEY,
business_id	varchar(22)	NOT NULL,
user_id	varchar(22)	NOT NULL,
stars	INT NOT NULL,
date	DATETIME,
text	text	NOT NULL);

CREATE TABLE BUSINESS (
id varchar(22),
name varchar(220),
address varchar(22));

CREATE TABLE USERS (
id varchar(22),
name varchar(22),
review_count INT);

CREATE INDEX indx1 ON BUSINESS (id);

ALTER TABLE REVIEW
ADD	FOREIGN KEY (business_id) 
REFERENCES BUSINESS (id);