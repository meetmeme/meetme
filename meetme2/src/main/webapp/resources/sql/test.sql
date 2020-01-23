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
		
		select * from mm_user
		
		update MM_USER set USER_PASS = 'user11' where USER_EMAIL = 'thgmldmljr@naver.com'
		
		select * from (select rownum, u.* from MM_USER SAMPLE(50) u) where rownum < 4;
		
		SELECT * FROM MM_USER SAMPLE(20)
		
		select * from mm_event order by event_date