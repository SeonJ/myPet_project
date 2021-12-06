CREATE TABLE dog (
	dogNum number PRIMARY KEY,
	name varchar2(200) NOT NULL, 
	photo varchar2(4000) NOT NULL, 
	email varchar2(200) NOT NULL, 
	weight varchar2(200) NOT NULL, 
	speices varchar2(200) NOT NULL
);

CREATE SEQUENCE	dog_seq 
start with 1
increment by 1;

INSERT INTO dog VALUES ();

SELECT * FROM dog WHERE dogNum='';

UPDATE dog SET
name='',
photo='',
weight='',
WHERE dogNum='';

delete dog where dogNum='';