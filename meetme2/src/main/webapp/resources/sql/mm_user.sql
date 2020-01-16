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
'여','25','서울시','image/default.png','image/default.png',1); 
insert into mm_user values (2, 'user1', '1234','user1','user1@meetme.com',
'여','25','서울시','image/default.png','image/default.png',1); 
insert into mm_user values (3, 'user2', '1234','user2','user2@meetme.com',
'여','25','서울시','image/default.png','image/default.png',1); 
insert into mm_user values (4, 'user3', '1234','user3','user3@meetme.com',
'여','25','서울시','image/default.png','image/default.png',1); 
insert into mm_user values (5, 'user4', '1234','user4','user4@meetme.com',
'여','25','서울시','image/default.png','image/default.png',1); 
insert into mm_user values (6, 'user5', '1234','user5','user5@meetme.com',
'여','25','서울시','image/default.png','image/default.png',1); 



select * from mm_user;

drop table userAuth;

create table userAuth (
	user_email	varchar2(20),
	authKey		varchar2(100)
);

select * from USERAUTH;

drop table mm_user_interests;

CREATE TABLE MM_USER_INTERESTS(
	USER_NUM		NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	CATEGORY_NUM	NUMBER REFERENCES MM_CATEGORY(CATEGORY_NUM) ON DELETE CASCADE
);
insert into MM_USER_INTERESTS values(1,1);
insert into MM_USER_INTERESTS values(1,2);
insert into MM_USER_INTERESTS values(1,3);
insert into MM_USER_INTERESTS values(1,4);
insert into MM_USER_INTERESTS values(2,1);
insert into MM_USER_INTERESTS values(2,3);
insert into MM_USER_INTERESTS values(3,7);
insert into MM_USER_INTERESTS values(3,6);
insert into MM_USER_INTERESTS values(3,8);
insert into MM_USER_INTERESTS values(4,4);
insert into MM_USER_INTERESTS values(5,5);
insert into MM_USER_INTERESTS values(5,6);
insert into MM_USER_INTERESTS values(6,3);
insert into MM_USER_INTERESTS values(6,1);

select * from mm_user_interests;

drop table mm_myhome CASCADE CONSTRAINTS;

CREATE TABLE MM_MYHOME(
	USER_NUM		NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	MYHOME_NUM		NUMBER PRIMARY KEY,
	MYHOME_INTRO	VARCHAR2(50),
	MYHOME_BGM		VARCHAR2(50)
);

insert into mm_myhome(user_num, myhome_num) values(1,1);
insert into mm_myhome(user_num, myhome_num) values(2,2);
insert into mm_myhome(user_num, myhome_num) values(3,3);
insert into mm_myhome(user_num, myhome_num) values(4,4);
insert into mm_myhome(user_num, myhome_num) values(5,5);
insert into mm_myhome(user_num, myhome_num) values(6,6);

select * from mm_myhome;
