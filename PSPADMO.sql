SELECT * FROM SYSADM.PS_IG_FILE_ATTACH;
DELETE FROM SYSADM.PS_IG_FILE_ATTACH;
COMMIT;

SELECT * FROM SYSADM.PS_IG_FILE_ATTDET ORDER BY 5, 1, 2, 3;
SELECT * FROM SYSADM.PS_IG_FILE_ATTDET;
DELETE FROM PS_IG_FILE_ATTDET; COMMIT;

SELECT * FROM PSURLDEFN ORDER BY 1;

SELECT * FROM PS_PT_URL_PROPS;

SELECT * FROM SYSADM.PS_PTPPB_DATATYPE;
SELECT * FROM SYSADM.PS_PTPPB_DATADISP;

SELECT * FROM SYSADM.PS_PTPPB_PGLT_PRMS WHERE PTPPB_PAGELET_ID LIKE 'A_CBR_Q%' ORDER BY ORDERNO;
SELECT * FROM SYSADM.PS_PTPPB_PGLT_HTML WHERE PTPPB_PAGELET_ID LIKE 'A_CBR%';
SELECT * FROM SYSADM.PS_PTPPB_PGLT_URL;



SELECT * FROM PS_PTPPB_PGLT_HTML WHERE ROWNUM < 3;
SELECT * FROM SYSADM.PSKEYDEFN WHERE INDEXID='_' AND RECNAME = 'CBR_PHONE' ORDER BY KEYPOSN;
SELECT * FROM SYSADM.PSRECFIELD WHERE RECNAME = 'CBR_RECORD';
SELECT * FROM SYSADM.PSDBFIELD WHERE FIELDNAME = 'COUNTRY_CODE';


SELECT * FROM PS_CBR_RECORD;
DELETE FROM PS_CBR_RECORD;COMMIT;


SELECT * FROM SYSADM.PSPRSMDEFN WHERE PORTAL_NAME = 'EMPLOYEE' AND PORTAL_OBJNAME LIKE '%POST_TEST';
SELECT * FROM SYSADM.PSPRSMDEFN WHERE PORTAL_NAME = 'EMPLOYEE' AND PORTAL_URI_SEG4 = 'IScript_PageletBuilder';

SELECT * FROM SYSADM.PS_CBR_CONFIG;

DELETE FROM SYSADM.PS_CBR_CONFIG; COMMIT;
INSERT INTO SYSADM.PS_CBR_CONFIG VALUES ('MAIN', 'ASDF=QWER', '*', '*', 'POSTAL', 1, ' ', ' ', 'tooltip_text', 'errormsg_text');COMMIT;
INSERT INTO PS_CBR_CONFIG VALUES ('CBR_RECORD', 'zxcv=hjkl', '*', '*', 'STATE', 1, ' ', ' ', ' ', ' ');COMMIT;
INSERT INTO PS_CBR_CONFIG VALUES ('CBR_RECORD', 'POIU=MNBV', '*', '*', 'COUNTY', 1, ' ', ' ', ' ', ' ');COMMIT;

DELETE FROM SYSADM.PS_CBR_CONFIG;
INSERT INTO SYSADM.PS_CBR_CONFIG VALUES ('PHONE', '*', '*', '*', 'OPRID', 2, ' ', ' ', ' ', ' ');
INSERT INTO SYSADM.PS_CBR_CONFIG VALUES ('PHONE', '*', '*', '*', 'URI_TYPE', 4, ' ', ' ', ' ', ' ');
INSERT INTO SYSADM.PS_CBR_CONFIG VALUES ('PHONE', '*', '*', '*', 'SEQNUM', 4, ' ', ' ', ' ', ' ');
INSERT INTO SYSADM.PS_CBR_CONFIG VALUES ('PHONE', '*', '*', '*', 'LASTUPDOPRID', 2, ' ', ' ', ' ', ' ');
INSERT INTO SYSADM.PS_CBR_CONFIG VALUES ('PHONE', '*', '*', '*', 'LASTUPDDTTM', 2, ' ', ' ', ' ', ' ');
COMMIT;

SELECT * FROM SYSADM.PS_CBR_PHONE;

DELETE FROM SYSADM.PS_CBR_PHONE;
COMMIT;

SELECT * FROM SYSADM.PS_CBR_PROMPT_TEST;

SELECT * FROM SYSADM.PSRECFIELD WHERE RECNAME LIKE '%SBR' AND EDITTABLE <> ' ';
SELECT * FROM SYSADM.PSRECFIELD WHERE RECNAME = 'ADDR_OTR_SBR';

SELECT * FROM SYSADM.PSRECFIELD WHERE RECNAME = 'CBR_PROMPT_TEST' AND SUBRECORD = 'Y' ORDER BY FIELDNUM;
SELECT * FROM SYSADM.PSRECFIELD WHERE RECNAME = 'ADDR_OTR_SBR' AND EDITTABLE <> ' ' ORDER BY FIELDNUM;
SELECT * FROM SYSADM.PSKEYDEFN WHERE RECNAME = 'STATE_OTH' AND INDEXID='_';

SELECT * FROM SYSADM.PSRECFIELD WHERE RECNAME like 'STATE%'; 

SELECT * FROM SYSADM.PSKEYDEFN  WHERE RECNAME LIKE 'STATE%';

SELECT * FROM SYSADM.STATE_OTH;

-- seqnum 
SELECT * FROM SYSADM.PS_CBR_COURSE ORDER BY SEQNUM;




SELECT * FROM SYSADM.PS_CBR_CONFIG WHERE OBJNAME = 'QUPLOAD';
INSERT INTO SYSADM.PS_CBR_CONFIG VALUES ('QUPLOAD', '*', '*', '*', 'OPRID', 2, ' ', ' ', ' ', ' ');
INSERT INTO SYSADM.PS_CBR_CONFIG VALUES ('QUPLOAD', '*', '*', '*', 'CATEGORYID', 4, ' ', ' ', ' ', ' ');
INSERT INTO SYSADM.PS_CBR_CONFIG VALUES ('QUPLOAD', '*', '*', '*', 'SEQNUM', 4, ' ', ' ', ' ', ' ');
INSERT INTO SYSADM.PS_CBR_CONFIG VALUES ('QUPLOAD', '*', '*', '*', 'APPLID', 4, ' ', ' ', ' ', ' ');
INSERT INTO SYSADM.PS_CBR_CONFIG VALUES ('QUPLOAD', '*', '*', '*', 'ATTACHSYSFILENAME', 4, ' ', ' ', ' ', ' ');
INSERT INTO SYSADM.PS_CBR_CONFIG VALUES ('QUPLOAD', '*', '*', '*', 'ATTACHUSERFILE', 0, ' ', ' ', ' ', ' ');
INSERT INTO SYSADM.PS_CBR_CONFIG VALUES ('QUPLOAD', '*', '*', '*', 'LASTUPDOPRID', 2, ' ', ' ', ' ', ' ');
INSERT INTO SYSADM.PS_CBR_CONFIG VALUES ('QUPLOAD', '*', '*', '*', 'LASTUPDDTTM', 2, ' ', ' ', ' ', ' ');
DELETE FROM SYSADM.PS_CBR_CONFIG WHERE OBJNAME = 'QUPLOAD';
COMMIT;

SELECT * FROM SYSADM.PS_STATE_TBL;

SELECT * FROM SYSADM.PS_CBR_PROMPT_TEST;

SELECT * FROM SYSADM.PSKEYDEFN WHERE RECNAME = 'CBR_UPLOAD' AND INDEXID='_' ORDER BY KEYPOSN;

SELECT * FROM SYSADM.PS_CBR_UPLOAD ORDER BY SEQNUM;
SELECT * FROM SYSADM.PS_IG_FILE_ATTDET;

DELETE FROM SYSADM.PS_CBR_UPLOAD;
DELETE FROM SYSADM.PS_IG_FILE_ATTDET;
COMMIT;

select * from sysadm.pskeydefn where indexid = '_' and recname = 'PSOPRDEFN' order by keyposn;

SELECT * FROM SYSADM.PS_CBR_PHONE;