CREATE TABLE reply (
	replyNum number PRIMARY KEY,
	articleNum number NOT NULL ,
	email varchar2(200) NOT NULL, 
	name varchar2(200) NOT NULL, 
	content varchar2(200) NOT NULL, 
	reg date default sysdate NOT NULL, 
	CONSTRAINT FK_articleNum FOREIGN KEY(articleNum) REFERENCES board(articleNum)
);

-- 게시판 시퀀스 : num 생성기
CREATE SEQUENCE	reply_seq 
start with 1
increment by 1;

INSERT INTO reply VALUES ('','','','','','');

SELECT * FROM reply WHERE replyNum='';

UPDATE reply SET
content=''  
WHERE replyNum='';


--- 페이징
SELECT *  
FROM (SELECT ROWNUM,  
             m.*,  
             FLOOR((ROWNUM - 1) / 10 + 1) page  
      FROM (
             SELECT * FROM reply  
             ORDER BY replyNum ASC
           ) m  
      )  
WHERE page = 1;

--- 마지막(총) 페이지 : 전체 회원
SELECT CEIL(COUNT(*)/10) FROM reply;

-- 검색
SELECT * FROM reply 
WHERE name LIKE '%길동%'
ORDER BY replyNum ASC;

-- 페이징 : 검색 (작성자, 글 제목, 내용)
-- 작성자
SELECT *  
FROM (SELECT ROWNUM,  
             m.*,  
             FLOOR((ROWNUM - 1) / 10 + 1) page  
      FROM (
             SELECT * FROM reply 
             WHERE name LIKE '%%'
             ORDER BY replyNum ASC
           ) m  
      )  
WHERE page = 1;


-- 내용
SELECT *  
FROM (SELECT ROWNUM,  
             m.*,  
             FLOOR((ROWNUM - 1) / 10 + 1) page  
      FROM (
             SELECT * FROM reply 
             WHERE content LIKE '%%'
             ORDER BY articleNum ASC
           ) m  
      )  
WHERE page = 1;

-- 검색 결과 마지막 페이지

SELECT CEIL(COUNT(*)/${limit}) FROM reply  
WHERE content like '%%';

------------------------------

-- 검색 테스트를 위한 샘플 데이터 (더미 데이터) 재구성
SELECT count(*) FROM reply 
WHERE name LIKE '%%'
ORDER BY articleNum ASC;

UPDATE reply set
content = ''
WHERE name like '%%';

SELECT count(*) FROM reply 
WHERE content LIKE '%%'
ORDER BY articleNum ASC;