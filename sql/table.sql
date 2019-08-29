DROP TABLE PLANT_ADMIN;
DROP TABLE USERS;
DROP SEQUENCE SEQ_NUMP;

CREATE TABLE PLANT_ADMIN 
(
PNUM NUMBER(4) NOT NULL
, PNAME NCHAR(10) NOT NULL 
, PPRICE NUMBER(7) NOT NULL 
, PAMOUNT NUMBER(5) NOT NULL 
, BOX NUMBER(3) 
, BPRICE NUMBER(7) 
, PSUM NUMBER(7) NOT NULL 
, CONSTRAINT PLANT_PK PRIMARY KEY 
(
 PNUM
)
ENABLE 
);

CREATE TABLE USERS 
(
  USERID CHAR(8) NOT NULL 
, UNAME NCHAR(5) NOT NULL 
, UPASSWORD CHAR(8) NOT NULL 
, UADDRESS NVARCHAR2(20) 
, UTELNUM CHAR(11) 
, CONSTRAINT USERS_PK PRIMARY KEY 
  (
    USERID 
  )
  ENABLE 
);

CREATE SEQUENCE SEQ_NUMP INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_NUMU INCREMENT BY 1 START WITH 1;

CREATE TRIGGER PLANT_ADMIN_TRG 
BEFORE INSERT ON PLANT_ADMIN 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.PNUM IS NULL THEN
      SELECT SEQ_NUMP.NEXTVAL INTO :NEW.PNUM FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/

INSERT INTO PLANT_ADMIN (PNAME, PPRICE, PAMOUNT, BOX, BPRICE, PSUM) VALUES (N'�汫��', '16000', '18', '2', '144000', '288000');
INSERT INTO PLANT_ADMIN (PNAME, PPRICE, PAMOUNT, BOX, BPRICE, PSUM) VALUES (N'��Ÿ��', '8000', '24', '1', '192000', '192000');
INSERT INTO PLANT_ADMIN (PNAME, PPRICE, PAMOUNT, BOX, BPRICE, PSUM) VALUES (N'����+����������', '20000', '24', '1', '480000', '480000');
INSERT INTO PLANT_ADMIN (PNAME, PPRICE, PAMOUNT, BOX, BPRICE, PSUM) VALUES (N'������(��)', '25000', '10', '1', '250000', '250000');
INSERT INTO PLANT_ADMIN (PNAME, PPRICE, PAMOUNT, BOX, BPRICE, PSUM) VALUES (N'�����е�', '10000', '48', '2', '240000', '480000');
INSERT INTO PLANT_ADMIN (PNAME, PPRICE, PAMOUNT, BOX, BPRICE, PSUM) VALUES (N'��Ͷ�', '8000', '24', '1', '192000', '192000');
INSERT INTO PLANT_ADMIN (PNAME, PPRICE, PAMOUNT, BOX, BPRICE, PSUM) VALUES (N'ȫ��ȭ��', '8000', '24', '1', '192000', '192000');
INSERT INTO PLANT_ADMIN (PNAME, PPRICE, PAMOUNT, BOX, BPRICE, PSUM) VALUES (N'ȫ��(���׸���)', '10000', '40', '2', '200000', '400000');
commit;

ALTER TABLE USERS 
ADD (UTYPE CHAR(11) NOT NULL);

INSERT INTO USERS (USERID, UNAME, UPASSWORD, UTYPE) VALUES ('admin', N'admin', 'admin', 'admin');
commit;