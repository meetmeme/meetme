
DROP TABLE MM_BOARD;



CREATE TABLE MM_BOARD(
	MYHOME_NUM		NUMBER REFERENCES MM_MYHOME(MYHOME_NUM) ON DELETE CASCADE,
	BOARD_NUM		NUMBER PRIMARY KEY,
	BOARD_ID		VARCHAR2(20),
	BOARD_PASS		VARCHAR2(20),
	BOARD_TITLE		VARCHAR2(20),
	BOARD_CONTENT	VARCHAR2(300),
	BOARD_PHOTO		VARCHAR2(50),
	BOARD_ORIGINAL	VARCHAR2(50),
	BOARD_DATE	DATE

);

select * from mm_board;

insert into mm_board(myhome_num, board_num, board_id, board_pass, board_title, board_content, board_date) 
values(2,1,'user1','1234','title1','content1','2020-01-01');
insert into mm_board(myhome_num, board_num, board_id, board_pass, board_title, board_content, board_date) 
values(2,2,'user1','1234','title1','content1','2020-01-11');
insert into mm_board(myhome_num, board_num, board_id, board_pass, board_title, board_content, board_date) 
values(2,3,'user1','1234','title1','content1','2020-01-29');
insert into mm_board(myhome_num, board_num, board_id, board_pass, board_title, board_content, board_date) 
values(2,4,'user1','1234','title1','content1','2020-02-04');
insert into mm_board(myhome_num, board_num, board_id, board_pass, board_title, board_content, board_date) 
values(2,5,'user1','1234','title1','content1','2020-05-01');
insert into mm_board(myhome_num, board_num, board_id, board_pass, board_title, board_content, board_date) 
values(2,6,'user1','1234','title1','content1','2020-05-22');
insert into mm_board(myhome_num, board_num, board_id, board_pass, board_title, board_content, board_date) 
values(2,7,'user1','1234','title1','content1','2020-05-24');
insert into mm_board(myhome_num, board_num, board_id, board_pass, board_title, board_content, board_date) 
values(2,8,'user1','1234','title1','content1','2020-07-01');
insert into mm_board(myhome_num, board_num, board_id, board_pass, board_title, board_content, board_date) 
values(2,9,'user1','1234','title1','content1','2020-08-01');
insert into mm_board(myhome_num, board_num, board_id, board_pass, board_title, board_content, board_date) 
values(2,10,'user1','1234','title1','content1','2020-08-21');
insert into mm_board(myhome_num, board_num, board_id, board_pass, board_title, board_content, board_date) 
values(2,11,'user1','1234','title1','content1','2020-08-24');
insert into mm_board(myhome_num, board_num, board_id, board_pass, board_title, board_content, board_date) 
values(2,12,'user1','1234','title1','content1','2020-08-25');
insert into mm_board(myhome_num, board_num, board_id, board_pass, board_title, board_content, board_date) 
values(2,13,'user1','1234','title1','content1','2020-09-11');
insert into mm_board(myhome_num, board_num, board_id, board_pass, board_title, board_content, board_date) 
values(2,14,'user1','1234','title1','content1','2020-09-21');
insert into mm_board(myhome_num, board_num, board_id, board_pass, board_title, board_content, board_date) 
values(2,15,'user1','1234','title1','content1','2020-10-01');