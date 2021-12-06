CREATE TABLE purchase (
	tichetNum number PRIMARY KEY,
	tichet number NOT NULL, 
	memEmail varchar2(200) NOT NULL, 
	reg date DEFAULT sysdate NOT NULL, 
	status varchar2(200) default 'wait' NOT NULL, 
	refund varchar2(200),
	refundTime date DEFAULT sysdate,
	CONSTRAINT FK_Purchase_memEmail FOREIGN KEY(memEmail) REFERENCES MEMBER(memEmail)
);

CREATE SEQUENCE	purchase_seq 
start with 1
increment by 1;

INSERT INTO purchase VALUES ('','','','','','','');

SELECT * FROM purchase WHERE tichetNum='';

