drop table mm_report;

create table mm_report(
	report_num		number primary key, /* 신고 번호 */
	reporter_id		varchar2(20), /* 신고한 사람 */	
	user_num		number,	/* 유저 신고 */
	event_num		number,	/* 이벤트 신고 */
	report_content	varchar2(100),	/* 신고 내용 */
	report_date		date	/* 신고 날짜 */
);

select * from mm_report;

insert into mm_report(report_num, reporter_id, user_num, report_content, report_date)
values(1,'user1',2,'유저 신고합니다~',sysdate);
insert into mm_report(report_num,reporter_id, user_num, report_content, report_date)
values(2,'user1',3,'유저 신고합니다~',sysdate);
insert into mm_report(report_num,reporter_id, user_num, report_content, report_date)
values(3,'user4',3,'유저 신고합니다~',sysdate);
insert into mm_report(report_num,reporter_id, user_num, report_content, report_date)
values(4,'user4',3,'유저 신고합니다~',sysdate);
insert into mm_report(report_num,reporter_id, user_num, report_content, report_date)
values(5,'user2',4,'유저 신고합니다~',sysdate);
insert into mm_report(report_num,reporter_id, user_num, report_content, report_date)
values(6,'user1',4,'유저 신고합니다~',sysdate);
insert into mm_report(report_num,reporter_id, user_num, report_content, report_date)
values(7,'user3',4,'유저 신고합니다~',sysdate);
insert into mm_report(report_num,reporter_id, user_num, report_content, report_date)
values(8,'user1',4,'유저 신고합니다~',sysdate);
insert into mm_report(report_num,reporter_id, user_num, report_content, report_date)
values(9,'admin',4,'유저 신고합니다~',sysdate);


insert into mm_report(report_num,reporter_id, event_num, report_content, report_date)
values(10,'admin',1,'이벤트 신고합니다~',sysdate);
insert into mm_report(report_num,reporter_id, event_num, report_content, report_date)
values(11,'user1',2,'이벤트 신고합니다~',sysdate);
insert into mm_report(report_num,reporter_id, event_num, report_content, report_date)
values(12,'user3',2,'이벤트 신고합니다~',sysdate);
insert into mm_report(report_num,reporter_id, event_num, report_content, report_date)
values(13,'user2',3,'이벤트 신고합니다~',sysdate);
insert into mm_report(report_num,reporter_id, event_num, report_content, report_date)
values(14,'user3',3,'이벤트 신고합니다~',sysdate);
insert into mm_report(report_num,reporter_id, event_num, report_content, report_date)
values(15,'user2',3,'이벤트 신고합니다~',sysdate);
insert into mm_report(report_num,reporter_id, event_num, report_content, report_date)
values(16,'user1',3,'이벤트 신고합니다~',sysdate);
insert into mm_report(report_num,reporter_id, event_num, report_content, report_date)
values(17,'admin',3,'이벤트 신고합니다~',sysdate);
insert into mm_report(report_num,reporter_id, event_num, report_content, report_date)
values(18,'user2',4,'이벤트 신고합니다~',sysdate);
insert into mm_report(report_num,reporter_id, event_num, report_content, report_date)
values(19,'user3',4,'이벤트 신고합니다~',sysdate);

select * from mm_report 
inner join mm_user 
on mm_report.user_num=mm_user.user_num;

select * from mm_report 
inner join MM_EVENT
on mm_report.event_num=mm_event.event_num;


select report_num, mm_user.user_id, mm_report.user_num, report_content, report_date 
		from mm_report 
		inner join mm_user 
		on mm_report.user_num=mm_user.user_num