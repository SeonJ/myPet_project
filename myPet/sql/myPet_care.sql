CREATE TABLE care (
	careNum number PRIMARY KEY,
	useTime number NOT NULL, 
	sitEmail varchar2(200) NOT NULL, 
	memEmail varchar2(200) NOT NULL, 
	dogs varchar2(200) NOT NULL, 
	area varchar2(200) NOT NULL, 
	careDate varchar2(200) NOT NULL, 
	startTime number NOT NULL, 
	cares varchar2(4000) NOT NULL, 
	review varchar2(4000), 
	careDiary varchar2(4000), 
	photo varchar2(4000), 
	reg date DEFAULT sysdate NOT NULL, 
	CONSTRAINT FK_sitEmail FOREIGN KEY(sitEmail) REFERENCES SITTER(sitEmail), 
	CONSTRAINT FK_memEmail FOREIGN KEY(memEmail) REFERENCES MEMBER(memEmail)
);

CREATE SEQUENCE	care_seq 
start with 1
increment by 1;

INSERT INTO reserve VALUES ('','','','','','','','','','','','','');

SELECT * FROM care WHERE careNum='';

