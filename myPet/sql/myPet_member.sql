CREATE TABLE member (
	memEmail varchar2(200) PRIMARY KEY,
	pw varchar2(200) NOT NULL, 
	photo varchar2(4000) NOT NULL, 
	name varchar2(200) NOT NULL, 
	gender varchar2(200) NOT NULL, 
	phone varchar2(200) NOT NULL, 
	address varchar2(200) NOT NULL, 
	restTime number NOT NULL, 
	state varchar2(200) default 'approve' NOT NULL
);

INSERT INTO member VALUES ();

SELECT * FROM member WHERE memEamil='';

UPDATE member SET
pw='',
photo='',
address='',
WHERE memEail='';

delete member where memEmail='';


--- 페이징

SELECT *  
FROM (SELECT ROWNUM,  
             m.*,  
             FLOOR((ROWNUM - 1) / 10 + 1) page  
      FROM (
             SELECT * FROM member  
             ORDER BY memEmail ASC
           ) m  
      )  
WHERE page = 11;

-- 검색
SELECT count(*) FROM member   
WHERE name like '%수%'
ORDER BY memEmail ASC;


-- 검색 : 페이징
SELECT *  
FROM (SELECT ROWNUM,  
             m.*,  
             FLOOR((ROWNUM - 1) / 10 + 1) page  
      FROM (
             SELECT * FROM member  
			 WHERE name like '%수%'
			 ORDER BY memEmail ASC;
           ) m  
      )  
WHERE page = 1;

SELECT *  
FROM (SELECT ROWNUM,  
             m.*,  
             FLOOR((ROWNUM - 1) / 10 + 1) page  
      FROM (
             SELECT * FROM member  
			 WHERE phone like '%1234%'
			 ORDER BY memEmail ASC;
           ) m  
      )  
WHERE page = 1;

--- 마지막(총) 페이지 : 전체 회원
SELECT CEIL(COUNT(*)/5) FROM member;

-- 마지막 (총) 페이지 : 검색
SELECT CEIL(COUNT(*)/10) FROM member  
WHERE name like '%수%';

-- 회원 존재 여부 점검
SELECT count(*) FROM member 
WHERE memEmail='';

--- 로그인 인증
SELECT count(*) FROM member 
WHERE memEmail='' AND pw='';
