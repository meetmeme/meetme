delete mm_category CASCADE CONSTRAINTS;
select * from mm_category

INSERT ALL
into MM_USER values(1,'admin','1234','관리자','admin@meetme.com','여',25,'서울시','','',1)
into MM_USER values(2,'TooColdWinter','!important','브리트니 점례','britntney@google.com','여',10,'서울시','','',1)
into MM_USER values(3,'SantaCross','toggledata','별빛로긔','starlight@naver.com','남',20,'서울시','','',1)
into MM_USER values(4,'ModalHater','lime&&33','곽두팔','modalmodal@hanmail.net','남',30,'서울시','','',1)
into MM_USER values(5,'BBangBBang','808@@@','이재용','samsunglover@hotmail.net','남',40,'서울시','','',1)
into MM_USER values(6,'JavaLover','Samsung*','이건희','jjangjjang789@empas.com','남',50,'서울시','','',1)
into MM_USER values(7,'Reasonable88','twinkle55','귀염둥이','prettywomen@hitel.net','여',60,'서울시','','',1)
into MM_USER values(8,'OrakGrak','$fgas&*','뿌잉뿌잉','jeongsintong1@netian.com','여',10,'서울시','','',1)
into MM_USER values(9,'Developer135','!@#$%^&','컨트롤즤','ctrlz135@nate.com','여',20,'서울시','','',1)
into MM_USER values(10,'EclipseJJang','1@3$5^7','김유미','yumi309@hanmir.com','남',30,'서울시','','',1)
into MM_USER values(11,'DBdb5678','parkinterpark','박막례','yurajjang12@dreamwiz.com','여',40,'서울시','','',1)
into MM_USER values(12,'Hammer5880','dngltdnglt','우힛우힛','azummayeogi@korea.com','여',50,'서울시','','',1)
into MM_USER values(13,'Elsa','skxmfkddmfhrkwk','빠담빠담','letitgoletitgo@nate.com','여',60,'서울시','','',1)
into MM_USER values(14,'Olarph','%&(xlvksl','나트랑','doyouwanna@buildasnow.man','남',40,'서울시','','',1)
into MM_USER values(15,'OhFrozen77','mamamomo','티파니','breakfast@tiffany.lov','여',40,'서울시','','',1)
into MM_USER values(16,'CountryRock','rongrong22','나는야락스타','rockandroll@nate.com','남',10,'서울시','','',1)
into MM_USER values(17,'TaylerSwift','popoqwqw','테일러','36ruralliving@hitel.net','남',20,'서울시','','',1)
into MM_USER values(18,'bestdriver','almond^^','베스트드레서','bestdriver123@dreamwiz.com','남',30,'서울시','','',1)
into MM_USER values(19,'LoveandHate','brainwasher','이중세뇌','maxminminus@kebi.com','여',40,'서울시','','',1)
into MM_USER values(20,'Sunrise','goehedl','해돋이','sunandmoon28@hanmail.net','여',50,'서울시','','',1)
select * from dual;

INSERT ALL
INTO MM_FOLLOWS VALUES(1, 2, 1)
INTO MM_FOLLOWS VALUES(1, 3, 1)
INTO MM_FOLLOWS VALUES(1, 4, 1)
INTO MM_FOLLOWS VALUES(1, 5, 1)
INTO MM_FOLLOWS VALUES(1, 6, 1)
INTO MM_FOLLOWS VALUES(1, 7, 1)
INTO MM_FOLLOWS VALUES(1, 8, 1)
INTO MM_FOLLOWS VALUES(1, 9, 1)
INTO MM_FOLLOWS VALUES(1, 10, 1)
INTO MM_FOLLOWS VALUES(1, 11, 1)
INTO MM_FOLLOWS VALUES(1, 12, 1)
INTO MM_FOLLOWS VALUES(1, 13, 1)
INTO MM_FOLLOWS VALUES(1, 14, 1)
INTO MM_FOLLOWS VALUES(1, 15, 1)
INTO MM_FOLLOWS VALUES(1, 16, 1)
INTO MM_FOLLOWS VALUES(1, 17, 1)
INTO MM_FOLLOWS VALUES(1, 18, 1)
select * from dual;

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

		SELECT DISTINCT *
		FROM MM_FOLLOWS f
		JOIN MM_USER u
		on (u.USER_NUM = f.FOLLOWING_NUM)
		WHERE (U.USER_ID LIKE '%a%' OR U.USER_NAME LIKE '%a%')
		AND F.USER_NUM = '1'