-- '/'기준으로 cmd창에서 돌리기
 
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
dbms_obfuscation_toolkit.DESEncrypt( input_string => RPAD( Str, pieces_of_eight ), 
									 key_string => RPAD(hash,16,'#'), 
									 encrypted_string => crypted_string );
RETURN crypted_string;
END;

FUNCTION decrypt( xCrypt VARCHAR2, hash VARCHAR2 ) RETURN VARCHAR2 AS
BEGIN
dbms_obfuscation_toolkit.DESDecrypt( input_string => xCrypt, 
									 key_string => RPAD(hash,16,'#'), 
									 decrypted_string => crypted_string );
RETURN trim(crypted_string);
END;

END CryptString;
/

CREATE TABLE TEST_USER(
	ID		VARCHAR2(20),
	PASS	VARCHAR2(20)
);

--암호화
INSERT INTO TEST_USER
VALUES('TEST', CryptString.encrypt('TESTPASS','encrypt'));

SELECT * FROM TEST_USER;

--복호화
SELECT ID, CryptString.decrypt(PASS, 'encrypt')
FROM TEST_USER;

