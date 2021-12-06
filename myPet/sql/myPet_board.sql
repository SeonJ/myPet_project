CREATE TABLE board (
	articleNum number PRIMARY KEY,
	email varchar2(200) NOT NULL, 
	name varchar2(200) NOT NULL, 
	subject varchar2(200) NOT NULL, 
	content varchar2(200) NOT NULL, 
	readcount number default 0 NOT NULL, 
	reg date default sysdate NOT NULL
);

-- 게시판 시퀀스 : num 생성기
CREATE SEQUENCE	board_seq 
start with 1
increment by 1;

INSERT INTO board VALUES ();

SELECT * FROM board WHERE articleNum='';

UPDATE board SET
subject='',
content=''  
WHERE articleNum='';


--- 페이징
SELECT *  
FROM (SELECT ROWNUM,  
             m.*,  
             FLOOR((ROWNUM - 1) / 10 + 1) page  
      FROM (
             SELECT * FROM board  
             ORDER BY articleNum ASC
           ) m  
      )  
WHERE page = 1;

--- 마지막(총) 페이지 : 전체 회원
SELECT CEIL(COUNT(*)/10) FROM board;

-- 검색
SELECT * FROM board 
WHERE name LIKE '%길동%'
ORDER BY articleNum ASC;

-- 페이징 : 검색 (작성자, 글 제목, 내용)
-- 작성자
SELECT *  
FROM (SELECT ROWNUM,  
             m.*,  
             FLOOR((ROWNUM - 1) / 10 + 1) page  
      FROM (
             SELECT * FROM board 
             WHERE name LIKE '%수%'
             ORDER BY articleNum ASC
           ) m  
      )  
WHERE page = 1;

-- 제목
SELECT *  
FROM (SELECT ROWNUM,  
             m.*,  
             FLOOR((ROWNUM - 1) / 10 + 1) page  
      FROM (
             SELECT * FROM board 
             WHERE subject LIKE '%%'
             ORDER BY articleNum ASC
           ) m  
      )  
WHERE page = 1;

-- 내용
SELECT *  
FROM (SELECT ROWNUM,  
             m.*,  
             FLOOR((ROWNUM - 1) / 10 + 1) page  
      FROM (
             SELECT * FROM board 
             WHERE content LIKE '%%'
             ORDER BY articleNum ASC
           ) m  
      )  
WHERE page = 1;

-- 검색 결과 마지막 페이지
SELECT CEIL(COUNT(*)/10) FROM board  
WHERE subject like '%%';

SELECT CEIL(COUNT(*)/${limit}) FROM board  
WHERE content like '%%';

------------------------------

-- 검색 테스트를 위한 샘플 데이터 (더미 데이터) 재구성
SELECT count(*) FROM board 
WHERE name LIKE '%%'
ORDER BY articleNum ASC;

SELECT count(*) FROM board 
WHERE subject LIKE '%%'
ORDER BY articleNum ASC;

UPDATE board set
subject = ''
WHERE name like '%%';

UPDATE board set
content = ''
WHERE name like '%%';

SELECT count(*) FROM board 
WHERE content LIKE '%%'
ORDER BY articleNum ASC;