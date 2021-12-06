CREATE TABLE note (
	noteNum number PRIMARY KEY,
	sender varchar2(200) NOT NULL,
	recipient varchar2(200) NOT NULL, 
	subject varchar2(200) NOT NULL, 
	content varchar2(200) NOT NULL, 
	readcount number NOT NULL, 
	reg date default sysdate NOT NULL
);

CREATE SEQUENCE	note_seq 
start with 1
increment by 1;

INSERT INTO note VALUES ('','','','','','','');

SELECT * FROM note WHERE noteNum='';

