


insert into MM_EVENT values(1, 1,'[Pub Party Friday]', '▶️상세내용
강남 인터내셔널펍파티에 오신것을 환영합니다. 매주 금요일 토요일 강남의 GSM테라스에서는 200~300여명의 멤버들이 모여 인터내셔널 펍 파티를 즐기고 있습니다.'
, sysdate, 'PM 7','강남',10,40000);

insert into MM_EVENT values(2, 4,'한강 러닝',
'같이 한강 뛰어요!!' , sysdate, 'PM 4','뚝섬 유원지역',5,0);

insert into MM_EVENT values(3, 4,'222한강 러닝',
'같이 한강 뛰어요!!' , sysdate, 'PM 4','뚝섬 유원지역',5,0);



delete * from MM_EVENT;

select * from MM_EVENT    WHERE EVENT_TITLE like '%Pub%' or EVENT_CONTENT like '%Pub%' or EVENT_LOCATION     like '%Pub%'

select * from MM_EVENT;

insert into MM_EVENT_ATTENDEE values(3, 3);
insert into MM_EVENT_ATTENDEE values(3, 4);
insert into MM_EVENT_ATTENDEE values(3, 5);
insert into MM_EVENT_ATTENDEE values(3, 6);
insert into MM_EVENT_ATTENDEE values(3, 7);
insert into MM_EVENT_ATTENDEE values(3, 8);
insert into MM_EVENT_ATTENDEE values(3, 9);
insert into MM_EVENT_ATTENDEE values(3, 10);
insert into MM_EVENT_ATTENDEE values(3, 11);
insert into MM_EVENT_ATTENDEE values(3, 12);
insert into MM_EVENT_ATTENDEE values(3, 13);
insert into MM_EVENT_ATTENDEE values(3, 14);
insert into MM_EVENT_ATTENDEE values(5, 3);



select * from MM_EVENT_GALLERY;


select * from MM_HASHTAG;

select * from MM_HASHTAG_USE;

select * from MM_HASHTAG 
where HASHTAG_NUM in (
	select HASHTAG_NUM 
	from MM_HASHTAG_USE 
	where EVENT_NUM = 5
	);








