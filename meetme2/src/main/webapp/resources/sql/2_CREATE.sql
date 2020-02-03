CREATE TABLE MM_USER(
	USER_NUM		NUMBER PRIMARY KEY,
	USER_ID			VARCHAR2(50),
	USER_PASS		VARCHAR2(100),
	USER_NAME		VARCHAR2(100),
	USER_EMAIL		VARCHAR2(100) unique,
	USER_GENDER		VARCHAR2(10),
	USER_AGE		NUMBER,
	USER_CITY		VARCHAR2(200),
	USER_ORIGINAL	VARCHAR2(200),
	USER_SAVE		VARCHAR2(200),
	USERCERTIFICATION	NUMBER default 0
);

CREATE TABLE USERAUTH (
	USER_EMAIL	VARCHAR2(100) REFERENCES MM_USER(USER_EMAIL) ON DELETE CASCADE,
	AUTHKEY		VARCHAR2(100)
);

CREATE TABLE MM_MYHOME(
	USER_NUM		NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	MYHOME_NUM		NUMBER PRIMARY KEY,
	MYHOME_INTRO	VARCHAR2(1000),
	MYHOME_BGM		VARCHAR2(50)
);

CREATE TABLE MM_CATEGORY(
	CATEGORY_NUM	NUMBER PRIMARY KEY,
	CATEGORY_NAME	VARCHAR2(20)
);

CREATE TABLE MM_USER_INTERESTS(
	USER_NUM		NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	CATEGORY_NUM	NUMBER REFERENCES MM_CATEGORY(CATEGORY_NUM) ON DELETE CASCADE
);

CREATE TABLE MM_BOARD(
	MYHOME_NUM		NUMBER REFERENCES MM_MYHOME(MYHOME_NUM) ON DELETE CASCADE,
	BOARD_NUM		NUMBER PRIMARY KEY,
	BOARD_ID		VARCHAR2(50),
	BOARD_TITLE		VARCHAR2(300),
	BOARD_CONTENT	VARCHAR2(3000),
	BOARD_PHOTO		VARCHAR2(200),
	BOARD_ORIGINAL	VARCHAR2(200),
	BOARD_DATE	DATE

);

CREATE TABLE MM_COMMENT(
	COMMENT_NUM		NUMBER	PRIMARY KEY,
	USER_NUM		NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	BOARD_USER_NUM		NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	COMMENT_CONTENT	VARCHAR2(50),
	COMMENT_DATE	DATE,
	BOARD_NUM		NUMBER REFERENCES MM_BOARD(BOARD_NUM) ON DELETE CASCADE
);

CREATE TABLE MM_EVENT(
	EVENT_NUM		NUMBER PRIMARY KEY,
	USER_NUM		NUMBER REFERENCES MM_USER(USER_NUM)	ON DELETE CASCADE,
	CATEGORY_NUM	NUMBER	REFERENCES MM_CATEGORY(CATEGORY_NUM) ON DELETE SET NULL,
	EVENT_TITLE		VARCHAR2(500),
	EVENT_CONTENT	VARCHAR2(3000),
	EVENT_DATE		date,
	EVENT_TIME		VARCHAR2(20),
	EVENT_LOCATION	VARCHAR2(100),
	EVENT_LAT		VARCHAR2(20),
	EVENT_LNG		VARCHAR2(20),
	EVENT_MAX		NUMBER,
	EVENT_PRICE		NUMBER,
	EVENT_SAVE	VARCHAR2(200),
	EVENT_ORIGINAL VARCHAR2(200)
);

CREATE TABLE MM_EVENT_ATTENDEE(
	EVENT_NUM		NUMBER REFERENCES MM_EVENT(EVENT_NUM) ON DELETE CASCADE,
	USER_NUM		NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE
);

CREATE TABLE MM_EVENT_COMMENT(
	EVENT_COMM_NUM		NUMBER PRIMARY KEY,
	EVENT_NUM			NUMBER REFERENCES MM_EVENT(EVENT_NUM) ON DELETE CASCADE,
	USER_NUM			NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	EVENT_COMM_CONTENT	VARCHAR2(300),
	EVENT_COMM_DATE		DATE
);

CREATE TABLE MM_NOTICE(
   NOTICE_NUM      NUMBER   PRIMARY KEY,
   USER_NUM      NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
   NOTICE_TITLE   VARCHAR2(300),
   NOTICE_CONTENT   VARCHAR2(1000),
   NOTICE_DATE      DATE,
   NOTICE_CK      NUMBER
);

CREATE TABLE MM_HASHTAG(
	HASHTAG_NUM		NUMBER PRIMARY KEY,
	HASHTAG_TITLE	VARCHAR2(20)
);

CREATE TABLE MM_HASHTAG_USE(
	HASHTAG_NUM		NUMBER REFERENCES MM_HASHTAG(HASHTAG_NUM) ON DELETE CASCADE,
	EVENT_NUM		NUMBER REFERENCES MM_EVENT(EVENT_NUM) ON DELETE CASCADE,
	BOARD_NUM		NUMBER REFERENCES MM_BOARD(BOARD_NUM) ON DELETE CASCADE,
	MYHOME_NUM		NUMBER REFERENCES MM_MYHOME(MYHOME_NUM) ON DELETE CASCADE
);

CREATE TABLE MM_FOLLOWS(
	USER_NUM		NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	FOLLOWING_NUM	NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE
);

CREATE TABLE MM_MESSAGE(
	SENDER_NUM		NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	RECEIVER_NUM	NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,
	CONTENT			VARCHAR2(2500),
	SENT_DATE		DATE,
	MSG_CHECK		NUMBER
);

CREATE TABLE MM_REPORT(
	REPORT_NUM		NUMBER PRIMARY KEY,
	REPORTER_ID		VARCHAR2(50),	
	USER_NUM		NUMBER REFERENCES MM_USER(USER_NUM) ON DELETE CASCADE,	
	EVENT_NUM		NUMBER REFERENCES MM_EVENT(EVENT_NUM) ON DELETE CASCADE,
	REPORT_CONTENT	VARCHAR2(300),
	REPORT_DATE		DATE,
	REPORT_CK		NUMBER DEFAULT 0
);

CREATE TABLE MM_EVENT_GALLERY(
	EVENT_NUM 		NUMBER REFERENCES MM_EVENT(EVENT_NUM) ON DELETE CASCADE,
	EVENT_GALLERY	VARCHAR2(200),
	EVENT_GALLERY_ORIGINAL	VARCHAR2(200)
);

CREATE TABLE MM_BGM(
	BGM_NUM	NUMBER PRIMARY KEY,
	BGM_NAME	VARCHAR2(50) NOT NULL
)

