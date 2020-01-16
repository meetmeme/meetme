DROP TABLE MM_FRICOM;
DROP TABLE MM_FRIENDS;
DROP TABLE MM_HASHTAG_USE;
DROP TABLE MM_HASHTAG;
DROP TABLE MM_EVENT_COMMENT;
DROP TABLE MM_EVENT_ATTENDEE;
DROP TABLE MM_EVENT;
DROP TABLE MM_COMMENT;
DROP TABLE MM_BOARD;
DROP TABLE MM_MYHOME;
DROP TABLE MM_USER_INTERESTS;
DROP TABLE MM_CATEGORY;
DROP TABLE MM_USER;
drop table mm_user_interests;
drop table mm_myhome CASCADE CONSTRAINTS;
drop table mm_message;
 
select * from mm_myhome;

CREATE TABLE MM_CATEGORY(
	CATEGORY_NUM	NUMBER PRIMARY KEY,
	CATEGORY_NAME	VARCHAR2(20)
);

CREATE TABLE MM_USER_INTERESTS(
	USER_NUM		NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	CATEGORY_NUM	NUMBER REFERENCES MM_CATEGORY(CATEGORY_NUM) ON DELETE CASCADE
);

select * from mm_user_interests;


CREATE TABLE MM_MYHOME(
	USER_NUM		NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	MYHOME_NUM		NUMBER PRIMARY KEY,
	MYHOME_INTRO	VARCHAR2(50),
	MYHOME_BGM		VARCHAR2(50)
);

select * from mm_myhome;

CREATE TABLE MM_BOARD(
	MYHOME_NUM		NUMBER REFERENCES MM_MYHOME(MYHOME_NUM) ON DELETE CASCADE,
	BOARD_NUM		NUMBER PRIMARY KEY,
	BOARD_ID		VARCHAR2(20),
	BOARD_PASS		VARCHAR2(20),
	BOARD_TITLE		VARCHAR2(20),
	BOARD_CONTENT	VARCHAR2(300),
	BOARD_PHOTO		VARCHAR2(50),
	BOARD_ORIGINAL	VARCHAR2(50),
	BOARD_DATE	DATE

);

CREATE TABLE MM_COMMENT(
	COMMENT_NUM		NUMBER	PRIMARY KEY,
	USER_NUM		NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	COMMENT_CONTENT	VARCHAR2(50),
	COMMENT_DATE	DATE,
	BOARD_NUM		NUMBER REFERENCES MM_BOARD(BOARD_NUM) ON DELETE CASCADE
);

CREATE TABLE MM_EVENT(
	EVENT_NUM		NUMBER PRIMARY KEY,
	CATEGORY_NUM	NUMBER	REFERENCES MM_CATEGORY(CATEGORY_NUM) ON DELETE SET NULL,
	EVENT_TITLE		VARCHAR2(20),
	EVENT_CONTENT	VARCHAR2(300),
	EVENT_DATE		DATE,
	EVENT_TIME		VARCHAR2(20),
	EVENT_LOCATION	VARCHAR2(20),
	EVENT_MAX		NUMBER,
	EVENT_PRICE		NUMBER
);

insert into mm_event
values(1,1,'이벤트1','함께 놀아요~', sysdate, '17:00', '서울시 종로구',20,0);
insert into mm_event
values(2,1,'이벤트1','함께 놀아요~', sysdate, '17:00', '서울시 종로구',20,0);
insert into mm_event
values(3,1,'이벤트1','함께 놀아요~', sysdate, '17:00', '서울시 종로구',20,0);
insert into mm_event
values(4,1,'이벤트1','함께 놀아요~', sysdate, '17:00', '서울시 종로구',20,0);

CREATE TABLE MM_EVENT_ATTENDEE(
	EVENT_NUM		NUMBER REFERENCES MM_EVENT(EVENT_NUM) ON DELETE CASCADE,
	USER_NUM		NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE
);

insert into mm_event_attendee
values(1,2);
insert into mm_event_attendee
values(2,4);
insert into mm_event_attendee
values(3,3);
insert into mm_event_attendee
values(4,3);


CREATE TABLE MM_EVENT_COMMENT(
	EVENT_COMM_NUM		NUMBER PRIMARY KEY,
	EVENT_NUM			NUMBER REFERENCES MM_EVENT(EVENT_NUM) ON DELETE CASCADE,
	USER_NUM			NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	EVENT_COMM_CONTENT	VARCHAR2(300),
	EVENT_COMM_DATE		DATE
);

CREATE TABLE MM_HASHTAG(
	HASHTAG_NUM		NUMBER PRIMARY KEY,
	HASHTAG_TITLE	VARCHAR2(20)
);

CREATE TABLE MM_HASHTAG_USE(
	HASHTAG_NUM		NUMBER REFERENCES MM_HASHTAG(HASHTAG_NUM) ON DELETE CASCADE,
	BOARD_NUM		NUMBER REFERENCES MM_BOARD(BOARD_NUM) ON DELETE CASCADE,
	EVENT_NUM		NUMBER REFERENCES MM_EVENT(EVENT_NUM) ON DELETE CASCADE,
	MYHOME_NUM		NUMBER REFERENCES MM_MYHOME(MYHOME_NUM) ON DELETE CASCADE,
	HASHTAGUSE_TYPE	VARCHAR2(20)
);

CREATE TABLE MM_FRIENDS(
	REQUESTER_NUM	NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	USER_NUM		NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	FRIENDS_CK		NUMBER
);

CREATE TABLE MM_FRICOM(
	FRICOM_NUM		NUMBER PRIMARY KEY,
	USER_ID			NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	FRICOM_CONTENT	VARCHAR2(300),
	FRICOM_DATE		DATE,
	MYHOME_NUM		NUMBER REFERENCES MM_MYHOME(MYHOME_NUM) ON DELETE CASCADE
);

CREATE TABLE MM_MESSAGE(
	SENDER_ID		NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	RECEIVER_ID		NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	CONTENT			VARCHAR2(300),
	SENT_DATE		DATE,
	MSG_CHECK		NUMBER			
);
--CREATE OR REPLACE VIEW MM_FRIENDS_V
--AS
--SELECT A.REQUESTER_ID, B.REQUESTER_ID
--FROM MM_FRIENDS A, MM_FRIENDS B
--WHERE A.REQUESTER_ID = B.USER_ID
--AND A.FRIENDS_CK = 1;