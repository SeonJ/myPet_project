CREATE TABLE singo (
	singoNum number PRIMARY KEY,
	singoDangHam varchar2(200) NOT NULL,
	singoHam varchar2(200) NOT NULL, 
	job varchar2(200) NOT NULL, 
	content varchar2(200) NOT NULL, 
	reg date default sysdate NOT NULL
);

CREATE SEQUENCE	singo_seq 
start with 1
increment by 1;

INSERT INTO singo VALUES ('','','','','','');

SELECT * FROM singo WHERE noteNum='';

