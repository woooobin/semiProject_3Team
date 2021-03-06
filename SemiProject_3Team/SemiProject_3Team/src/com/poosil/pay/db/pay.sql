
INSERT INTO SHOPPINGCART
VALUES (3, 1, 1000, 'test1');

DROP SEQUENCE ORDERSEQ;

DROP TABLE ORDERPAGE;

CREATE SEQUENCE ORDERSEQ;

CREATE TABLE ORDERPAGE(
	orderSeq NUMBER(30), 
	userId VARCHAR2(30) NOT NULL, 
	projectItemSeq NUMBER(30) NOT NULL, 
	address VARCHAR2(100),
	phone NUMBER(30),
	totalPrice NUMBER(30),
	price NUMBER(30),
	orderDate DATE NOT NULL,
	DELIVERYFEE NUMBER(30),
	PURCHASEPRICE NUMBER(30),
	CONSTRAINT ORDERPAGE_PK PRIMARY KEY (orderSeq),
	CONSTRAINT ORDERPAGE_USERID_FK FOREIGN KEY (userId) REFERENCES MEMBERS (userId),
	CONSTRAINT ORDERPAGE_PROJECTITEMSEQ_FK FOREIGN KEY (projectItemSeq) REFERENCES PROJECTITEM (projectItemSeq) 
);

ALTER TABLE ORDERPAGE ADD DELIVERYFEE NUMBER(30);
ALTER TABLE ORDERPAGE ADD PURCHASEPRICE NUMBER(30);
ALTER TABLE ORDERPAGE DROP COLUMN PURCAHSEPRICE;

SELECT * FROM ORDERPAGE;
INSERT INTO ORDERPAGE
VALUES (ORDERSEQ.NEXTVAL, 2, 'test1', 3, '너네집', 0, 20000, SYSDATE);

SELECT * FROM ORDERPAGE;

SELECT * FROM MEMBERS;
SELECT PROJECTITEMSEQ, PROJECTITEMNAME, QUANTITY, PROJECTID, PRICE
  		FROM PROJECTITEM
  		WHERE PROJECTITEMSEQ = 83;

UPDATE PROJECTITEM SET PRICE = '300000' WHERE PRICE = '0';
SELECT * FROM PROJECTITEM;
SELECT * FROM PROJECTS;
DELETE FROM PROJECTS
WHERE PROJECTID = 331;
DELETE FROM PROJECTITEM WHERE PROJECTID = 331;

UPDATE PROJECTS SET TOTALPRICE = 0; 
