CREATE OR REPLACE PACKAGE CryptString AS
FUNCTION encrypt( Str VARCHAR2, hash VARCHAR2 ) RETURN VARCHAR2;
FUNCTION decrypt( xCrypt VARCHAR2, hash VARCHAR2 ) RETURN VARCHAR2;
END CryptString;
/


CREATE OR REPLACE PACKAGE BODY CryptString AS
crypted_string VARCHAR2(2000);

FUNCTION encrypt( Str VARCHAR2, hash VARCHAR2 ) RETURN VARCHAR2 AS
pieces_of_eight INTEGER := ((FLOOR(LENGTH(Str)/8 + .9)) * 8);
BEGIN
dbms_obfuscation_toolkit.DESEncrypt( input_string => RPAD( Str, pieces_of_eight ), key_string => RPAD(hash,16,'#'), encrypted_string => crypted_string );
RETURN crypted_string;
END;

FUNCTION decrypt( xCrypt VARCHAR2, hash VARCHAR2 ) RETURN VARCHAR2 AS
BEGIN
dbms_obfuscation_toolkit.DESDecrypt( input_string => xCrypt, key_string => RPAD(hash,16,'#'), decrypted_string => crypted_string );
RETURN trim(crypted_string);
END;

END CryptString;
/

drop table encrypt_table;

create table encrypt_table( id number, passwd varchar(50) );

insert into encrypt_table values( 1, CryptString.encrypt('tigerofkorea', 'encrypt1'));
insert into encrypt_table values( 2, CryptString.encrypt('tigerofkorea', 'encrypt2'));



select id, dump(passwd) passwd from encrypt_table;



select id, CryptString.decrypt(passwd, 'encrypt1') passwd from encrypt_table
where CryptString.decrypt(passwd, 'encrypt1') = 'tigerofkorea';


select id, CryptString.decrypt(passwd, 'encrypt2') passwd from encrypt_table
where CryptString.decrypt(passwd, 'encrypt2') = 'tigerofkorea';



INSERT ALL
into MM_USER values(1,'admin',CryptString.encrypt('1234','encrypt'),'관리자','admin@meetme.com','여',25,'서울시','/init/user/1.jpg','/init/user/1.jpg',1)
into MM_USER values(2,'TooColdWinter',CryptString.encrypt('!important', 'encrypt'),'브리트니 점례','britntney@google.com','여',10,'서울시','/init/user/2.jpg','/init/user/2.jpg',1)
into MM_USER values(3,'SantaCross',CryptString.encrypt('toggledata', 'encrypt'),'별빛로긔','starlight@naver.com','남',20,'서울시','/init/user/3.jpg','/init/user/3.jpg',1)
into MM_USER values(4,'ModalHater',CryptString.encrypt('lime&&33', 'encrypt'),'곽두팔','modalmodal@hanmail.net','남',30,'서울시','/init/user/4.jpg','/init/user/4.jpg',1)
into MM_USER values(5,'BBangBBang',CryptString.encrypt('808@@@', 'encrypt'),'이재용','samsunglover@hotmail.net','남',40,'서울시','/init/user/5.jpg','/init/user/5.jpg',1)
into MM_USER values(6,'JavaLover',CryptString.encrypt('Samsung*', 'encrypt'),'이건희','jjangjjang789@empas.com','남',50,'서울시','/init/user/6.jpg','/init/user/6.jpg',1)
into MM_USER values(7,'Reasonable88',CryptString.encrypt('twinkle55', 'encrypt'),'귀염둥이','prettywomen@hitel.net','여',60,'서울시','/init/user/7.jpg','/init/user/7.jpg',1)
into MM_USER values(8,'OrakGrak',CryptString.encrypt('$fgas&*', 'encrypt'),'뿌잉뿌잉','jeongsintong1@netian.com','여',10,'서울시','/init/user/8.jpg','/init/user/8.jpg',1)
into MM_USER values(9,'Developer135',CryptString.encrypt('!@#$%^&', 'encrypt'),'컨트롤즤','ctrlz135@nate.com','여',20,'서울시','/init/user/9.jpg','/init/user/9.jpg',1)
into MM_USER values(10,'EclipseJJang',CryptString.encrypt('1@3$5^7', 'encrypt'),'김유미','yumi309@hanmir.com','남',30,'서울시','/init/user/10.png','/init/user/10.png',1)
into MM_USER values(11,'DBdb5678',CryptString.encrypt('parkinterpark', 'encrypt'),'박막례','yurajjang12@dreamwiz.com','여',40,'서울시','/init/user/11.jpg','/init/user/11.jpg',1)
into MM_USER values(12,'Hammer5880',CryptString.encrypt('dngltdnglt', 'encrypt'),'우힛우힛','azummayeogi@korea.com','여',50,'서울시','/init/user/12.jpg','/init/user/12.jpg',1)
into MM_USER values(13,'Elsa',CryptString.encrypt('skxmfkddmfhrkwk', 'encrypt'),'빠담빠담','letitgoletitgo@nate.com','여',60,'서울시','/init/user/13.jpg','/init/user/13.jpg',1)
into MM_USER values(14,'Olarph',CryptString.encrypt('%&(xlvksl', 'encrypt'),'나트랑','doyouwanna@buildasnow.man','남',40,'서울시','/init/user/14.jpg','/init/user/14.jpg',1)
into MM_USER values(15,'OhFrozen77',CryptString.encrypt('mamamomo', 'encrypt'),'티파니','breakfast@tiffany.lov','여',40,'서울시','/init/user/15.jpg','/init/user/15.jpg',1)
into MM_USER values(16,'CountryRock',CryptString.encrypt('rongrong22', 'encrypt'),'나는야락스타','rockandroll@nate.com','남',10,'서울시','/init/user/16.jpg','/init/user/16.jpg',1)
into MM_USER values(17,'TaylerSwift',CryptString.encrypt('popoqwqw', 'encrypt'),'테일러','36ruralliving@hitel.net','남',20,'서울시','/init/user/17.jpg','/init/user/17.jpg',1)
into MM_USER values(18,'bestdriver',CryptString.encrypt('almond^^', 'encrypt'),'베스트드레서','bestdriver123@dreamwiz.com','남',30,'서울시','/init/user/18.jpg','/init/user/18.jpg',1)
into MM_USER values(19,'LoveandHate',CryptString.encrypt('brainwasher', 'encrypt'),'이중세뇌','maxminminus@kebi.com','여',40,'서울시','/init/user/19.jpg','/init/user/19.jpg',1)
into MM_USER values(20,'Sunrise',CryptString.encrypt('goehedl', 'encrypt'),'해돋이','sunandmoon28@hanmail.net','여',50,'서울시','/init/user/20.jpg','/init/user/20.jpg',1)
SELECT * FROM DUAL;

SELECT * FROM MM_USER;


select user_id, dump(user_pass) from MM_USER;


select * from mm_user;	

select user_id, CryptString.decrypt(user_pass, 'encrypt') user_pass from MM_USER;
