INSERT ALL

SELECT * FROM DUAL;

select a.*, u.user_id
		from (select user_num, count(FOLLOWING_NUM) c
				from mm_follows 
				group by user_num
				order by count(FOLLOWING_NUM) desc) a
		inner join mm_user u
		on a.user_num = u.user_num
		where rownum <=5
		

select * from mm_report;

select count(*), user_num
from mm_report
where report_ck = 1
group by user_num;''



insert into mm_notice
		values ((select nvl(max(notice_num),0)+1 from MM_NOTICE), 
		(select user_num from mm_event where event_num=1),
		'경고', '회원님은 적절하지 않은 이벤트를 등록하였습니다. 확인 후 삭제 조치 바랍니다.',sysdate,0)
		
		
		select count(*) u, user_num
		from mm_report
		where report_ck = 1
		group by user_num