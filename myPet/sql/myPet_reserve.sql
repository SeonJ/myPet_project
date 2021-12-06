CREATE TABLE reserve (
	reserveNum number PRIMARY KEY,
	useTime number NOT NULL, 
	sitEmail varchar2(200) NOT NULL, 
	memEmail varchar2(200) NOT NULL, 
	dogs varchar2(200) NOT NULL, 
	area varchar2(200) NOT NULL, 
	careDate varchar2(200) NOT NULL, 
	startTime number NOT NULL, 
	cares varchar2(4000) NOT NULL, 
	reg date DEFAULT sysdate NOT NULL, 
	approve varchar2(200) default 'wait' NOT NULL, 
	dogNum number,
	CONSTRAINT FK_reserve_sitEmail FOREIGN KEY(sitEmail) REFERENCES SITTER(sitEmail), 
	CONSTRAINT FK_reserve_memEmail FOREIGN KEY(memEmail) REFERENCES MEMBER(memEmail)
);

CREATE SEQUENCE	reserve_seq 
start with 1
increment by 1;

INSERT INTO reserve VALUES ('','','','','','','','','','','','');

SELECT * FROM reserve WHERE reserveNum='';

