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




insert into MM_USER values(1,'admin',CryptString.encrypt('1234','encrypt'),'관리자','admin@meetme.com','여',25,'서울시','/init/user/1.jpg','/init/user/1.jpg',1);
insert into MM_USER values(2,'test1', CryptString.encrypt('1234sss', 'encrypt'),'test1','sfd@hanmail.net','여',50,'서울시','/init/user/20.jpg','/init/user/20.jpg',1);
insert into MM_USER values(3,'test2', CryptString.encrypt('ddsfw234', 'encrypt'),'test2','gdgg@hanmail.net','여',50,'서울시','/init/user/20.jpg','/init/user/20.jpg',1);
insert into MM_USER values(4,'test3', CryptString.encrypt('1111fdsr3', 'encrypt'),'test3','gdgsh@hanmail.net','여',50,'서울시','/init/user/20.jpg','/init/user/20.jpg',1);
insert into MM_USER values(5,'test4', CryptString.encrypt('aaaa232', 'encrypt'),'test4','wett@hanmail.net','여',50,'서울시','/init/user/20.jpg','/init/user/20.jpg',1);

select user_id, dump(user_pass) from MM_USER;

select * from mm_user;

select user_id, CryptString.decrypt(user_pass, 'encrypt') user_pass from MM_USER

