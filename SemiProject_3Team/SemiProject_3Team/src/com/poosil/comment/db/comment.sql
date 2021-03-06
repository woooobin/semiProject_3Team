DROP SEQUENCE COMMENTSEQ;
DROP SEQUENCE GROUPENOSEQ;
DROP TABLE COMMENTBOARD;

CREATE SEQUENCE COMMENTNOSEQ;
CREATE SEQUENCE GROUPNOSEQ;

CREATE TABLE COMMENTBOARD(
	COMMENTNO NUMBER PRIMARY KEY,
	GROUPNO NUMBER NOT NULL,
	GROUPSEQ NUMBER NOT NULL,
	TITLETAB NUMBER NOT NULL,
	FREEBOARDSEQ NUMBER,
	USERID VARCHAR2(30),
	COMMENTCONTENT VARCHAR2(1000) NOT NULL,
	REGDATE DATE,
	CONSTRAINT FK_FBSEQ FOREIGN KEY(FREEBOARDSEQ) REFERENCES FREEBOARD(FREEBOARDSEQ),
	CONSTRAINT FK_ID FOREIGN KEY(USERID) REFERENCES MEMBERS(USERID)
);
--1번째 댓글
INSERT INTO COMMENTBOARD
VALUES(COMMENTNOSEQ.NEXTVAL, GROUPNOSEQ.NEXTVAL, 1, 0, 1, '김호수', '첫 코멘트입니다.', SYSDATE);

UPDATE COMMENTBOARD
SET GROUPSEQ = GROUPSEQ + 1
WHERE GROUPNO = (SELECT GROUPNO FROM COMMENTBOARD WHERE COMMENTNO = 1)
AND GROUPSEQ > (SELECT GROUPSEQ FROM COMMENTBOARD WHERE COMMENTNO = 1);

--첫 댓글 대댓글
INSERT INTO COMMENTBOARD
VALUES(
		COMMENTNOSEQ.NEXTVAL,
		(SELECT COMMENTNO FROM COMMENTBOARD WHERE COMMENTNO = 2),
		(SELECT GROUPSEQ FROM COMMENTBOARD WHERE COMMENTNO = 2) + 1,
		(SELECT TITLETAB +1 FROM COMMENTBOARD WHERE COMMENTNO = 2),
		1,
		'test1',
		'무플방지',
		SYSDATE
);

SELECT * FROM COMMENTBOARD
ORDER BY COMMENTNO DESC, GROUPSEQ;