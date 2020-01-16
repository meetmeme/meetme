
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

