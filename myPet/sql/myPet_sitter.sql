CREATE TABLE sitter (
	sitEmail varchar2(200) PRIMARY KEY,
	pw varchar2(200) NOT NULL, 
	photo varchar2(4000) NOT NULL, 
	name varchar2(200) NOT NULL, 
	gender varchar2(200) NOT NULL, 
	phone varchar2(200) NOT NULL, 
	address varchar2(200) NOT NULL, 
	workarea varchar2(200) NOT NULL, 
	resume varchar2(4000) NOT NULL, 
	vacation varchar2(200) default 'work' NOT NULL, 
	state varchar2(200) default 'wait' NOT NULL
);

INSERT INTO sitter VALUES ();

SELECT * FROM sitter WHERE sitEamil='';

UPDATE sitter SET
pw='',
photo='',
address='',
workarea='', 
resume='',
vacation=''
WHERE sitEail='';

delete sitter where sitEmail='';


--- 페이징

SELECT *  
FROM (SELECT ROWNUM,  
             m.*,  
             FLOOR((ROWNUM - 1) / 10 + 1) page  
      FROM (
             SELECT * FROM sitter  
             ORDER BY sitEmail ASC
           ) m  
      )  
WHERE page = 11;

-- 검색
SELECT count(*) FROM sitter   
WHERE name like '%수%'
ORDER BY sitEmail ASC;


-- 검색 : 페이징
SELECT *  
FROM (SELECT ROWNUM,  
             m.*,  
             FLOOR((ROWNUM - 1) / 10 + 1) page  
      FROM (
             SELECT * FROM sitter  
			 WHERE name like '%수%'
			 ORDER BY sitEmail ASC;
           ) m  
      )  
WHERE page = 1;

SELECT *  
FROM (SELECT ROWNUM,  
             m.*,  
             FLOOR((ROWNUM - 1) / 10 + 1) page  
      FROM (
             SELECT * FROM sitter  
			 WHERE phone like '%1234%'
			 ORDER BY sitEmail ASC;
           ) m  
      )  
WHERE page = 1;

--- 마지막(총) 페이지 : 전체 회원
SELECT CEIL(COUNT(*)/5) FROM sitter;

-- 마지막 (총) 페이지 : 검색
SELECT CEIL(COUNT(*)/10) FROM sitter  
WHERE name like '%수%';

-- 회원 존재 여부 점검
SELECT count(*) FROM sitter 
WHERE sitEmail='';

--- 로그인 인증
SELECT count(*) FROM sitter 
WHERE sitEmail='' AND pw='';
