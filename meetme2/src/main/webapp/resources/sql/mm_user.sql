
drop table mm_user CASCADE CONSTRAINTS;

CREATE TABLE MM_USER(
	USER_NUM		NUMBER PRIMARY KEY,
	USER_ID			VARCHAR2(20),
	USER_PASS		VARCHAR2(20),
	USER_NAME		VARCHAR2(20),
	USER_EMAIL		VARCHAR2(20),
	USER_GENDER		VARCHAR2(10),
	USER_AGE		NUMBER,
	USER_CITY		VARCHAR2(30),
	USER_ORIGINAL	VARCHAR2(100),
	USER_SAVE		VARCHAR2(100),
	userCertification	number default 0
);



insert into mm_user values (1, 'admin', '1234','관리자','admin@meetme.com',
'여','25','서울시','','',1); 

select * from mm_user;

drop table userAuth;

create table userAuth (
	user_email	varchar2(20),
	authKey		varchar2(100)
);

select * from USERAUTH;