CREATE TABLE MEMBERS(
	userId VARCHAR2(30) NOT NULL,
	password VARCHAR2(30) ,
	userEmail VARCHAR2(100),
	userPhone NUMBER(30),
	address VARCHAR2(100),
	addressLatitude VARCHAR2(30),
	addressLongitude VARCHAR2(30),
	userRole VARCHAR2(10),
	isSeller CHAR(2),
	sellersOpt VARCHAR2(30),
	avatar VARCHAR2(100),
	CONSTRAINT MEMBER_PK PRIMARY KEY (userId)
);


