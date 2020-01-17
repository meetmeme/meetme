select mm_user.user_id, 
(select count(mm_follows.FOLLOWER_CK)
from mm_follows
group by user_num)
		from mm_follows
		inner join mm_user
		on mm_follows.user_num = mm_user.user_num
		where rownum <=5
		order by count(mm_follows.FOLLOWER_CK) asc
		
		

select * from
(select count(f.FOLLOWER_CK), f.user_num, u.user_id
from mm_follows f, mm_user u
where f.user_num = u.user_num
group by f.user_num
) 
where rownum <=5;

select count(m.FOLLOWER_CK), m.user_num, u.user_id
from

select * from(	
			select count(follower_ck)
			from mm_follows 
			group by user_num
		)
		where rownum <=5 and follower_ck=1
		
select count(*)
from mm_follows
where follower_ck=1;

select * from mm_follows;

select * from(	
	select count(follower_ck)
	from mm_follows 
	group by user_num
	order by count(follower_ck) desc
)
where rownum<=5;



select user_num, count(follower_ck) 
from mm_follows 
group by user_num;

select user_id from mm_user;

select a.*, u.user_id
from (select user_num, count(follower_ck) 
		from mm_follows 
		group by user_num
		order by count(follower_ck) desc) a
inner join mm_user u
on a.user_num = u.user_num
where rownum<=5;