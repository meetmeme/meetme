
CREATE TABLE MM_USER(
	USER_NUM		NUMBER PRIMARY KEY,
	USER_ID			VARCHAR2(20),
	USER_PASS		VARCHAR2(20),
	USER_NAME		VARCHAR2(20),
	USER_EMAIL		VARCHAR2(20),
	USER_GENDER		VARCHAR2(10),
	USER_AGE		NUMBER,
	USER_CITY		VARCHAR2(30),
	USER_IMAGE		VARCHAR2(100)
);


drop table mm_user CASCADE CONSTRAINTS;

insert into mm_user values (1, 'admin', '1234','관리자','admin@meetme.com',
'여','25','서울시',''); 