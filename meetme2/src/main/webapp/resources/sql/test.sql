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