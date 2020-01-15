delete table mm_category CASCADE CONSTRAINTS;
select * from mm_category

insert all
into  MM_CATEGORY values(1, 'outdoor')
into  MM_CATEGORY values(2, 'technology')
into  MM_CATEGORY values(3, 'family')
into  MM_CATEGORY values(4, 'healthy')
into  MM_CATEGORY values(5, 'sports')
into  MM_CATEGORY values(6, 'study')
into  MM_CATEGORY values(7, 'language')
into  MM_CATEGORY values(8, 'photo')
into  MM_CATEGORY values(9, 'music')
into  MM_CATEGORY values(10, 'dance')
into  MM_CATEGORY values(11, 'game')
into  MM_CATEGORY values(12, 'pet')
into  MM_CATEGORY values(13, 'DIY')
select * from dual;

select * from MM_CATEGORY;

insert all
into  MM_HASHTAG values(1, '야외활동')
into  MM_HASHTAG values(2, '기술')
into  MM_HASHTAG values(3, '가족')
into  MM_HASHTAG values(4, '건강')
into  MM_HASHTAG values(5, '스포츠')
into  MM_HASHTAG values(6, '학습')
into  MM_HASHTAG values(7, '사진촬영')
into  MM_HASHTAG values(8, '음악')
into  MM_HASHTAG values(9, '언어')
into  MM_HASHTAG values(10, '춤')
into  MM_HASHTAG values(11, '야외활동1')
into  MM_HASHTAG values(12, '기술1')
into  MM_HASHTAG values(13, '가족1')
into  MM_HASHTAG values(14, '건강1')
into  MM_HASHTAG values(15, '스포츠1')
into  MM_HASHTAG values(16, '학습1')
into  MM_HASHTAG values(17, '사진촬영1')
into  MM_HASHTAG values(18, '음악1')
into  MM_HASHTAG values(19, '언어1')
into  MM_HASHTAG values(20, '춤1')
into  MM_HASHTAG values(21, '야외활동2')
into  MM_HASHTAG values(22, '기술2')
into  MM_HASHTAG values(23, '가족2')
into  MM_HASHTAG values(24, '건강2')
into  MM_HASHTAG values(25, '스포츠2')
into  MM_HASHTAG values(26, '학습2')
into  MM_HASHTAG values(27, '사진촬영2')
into  MM_HASHTAG values(28, '음악2')
into  MM_HASHTAG values(29, '언어2')
into  MM_HASHTAG values(30, '춤2')
select * from dual;


INSERT  ALL
 INTO MM_FRIENDS VALUES(1,2,1)
 INTO MM_FRIENDS VALUES(1,3,1)
 INTO MM_FRIENDS VALUES(2,1,1)
 INTO MM_FRIENDS VALUES(2,3,1)
 INTO MM_FRIENDS VALUES(3,1,1)
 INTO MM_FRIENDS VALUES(3,2,1)
select * from dual;

		SELECT DISTINCT *
		FROM
		(SELECT  *
		FROM MM_FRIENDS 
		OUTER JOIN MM_USER
		USING(USER_NUM)
		WHERE (USER_ID LIKE '%a%' OR USER_NAME LIKE '%a%')) A
		LEFT OUTER JOIN (SELECT USER_ID AS REQ_ID, REQUESTER_NUM FROM MM_USER U JOIN MM_FRIENDS F ON U.USER_NUM = F.REQUESTER_NUM WHERE USER_ID='user2') S
		USING(REQUESTER_NUM)
		WHERE REQ_ID IS NOT NULL
