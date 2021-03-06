
SELECT * FROM PS_UD_OLA_APPLCATN;
SELECT UNIQUE(ADDRESS_TYPE) FROM PS_UD_OLA_ADDR;

SELECT * FROM PS_UD_OLA2_ADDRESS;
DELETE FROM PS_UD_OLA2_ADDRESS;COMMIT;
INSERT INTO PS_UD_OLA2_ADDRESS
VALUES ('STF2960', 'HOME', 'USA', ' ' , ' ', ' ', ' ', 'NEW YORK', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'NY', '10001', ' ', ' ', NULL, 'STF2960' );COMMIT;

DESCR PS_UD_OLA2_ADDRESS;


SELECT * FROM PS_PTPPB_PGLT_HTML WHERE CREATEOPRID = 'STF2960';

SELECT * FROM PS_UD_OLA2_PHONE;

INSERT INTO PS_UD_OLA2_PHONE
VALUES ('STF2960', 'MAIN', ' ', 2123456789); 
COMMIT;
DELETE FROM PS_UD_OLA2_PHONE; 
COMMIT;


SELECT * FROM PS_UD_OLA2_CONFIG;


SELECT * FROM PSPRSMDEFN WHERE PORTAL_URI_SEG1 LIKE 'WEBLIB_UD_OAA%';


SELECT * FROM PS_UD_OLA_QUALS;

-- QUALIFICATIONS SQLS
SELECT * FROM PSRECDEFN WHERE RECNAME LIKE 'UD_SA_P%';
SELECT * FROM PS_UD_OLA_QUALS;
-- QUAL CODE
SELECT * FROM PS_UD_SA_TEST_TBL WHERE TEST_ID LIKE 'GCE%';
SELECT * FROM PS_SA_TEST_TBL WHERE TEST_ID LIKE 'GCE%';
SELECT * FROM PS_UD_OLA_QUAL_VW;
-- SUBJECT CODE
SELECT * FROM PS_SA_TCMP_REL_TBL WHERE TEST_ID = 'GCE A';
SELECT * FROM PS_UD_OLA_SUBJ_VW WHERE TEST_ID = 'GCE A';
-- GRADE
SELECT * FROM PS_UD_SA_TST_GRADE WHERE TEST_ID = 'GCE A';
SELECT * FROM PS_UD_SA_GRADE_CFG WHERE UD_QUAL_GRADE = 'U';
-- actual applicant data
SELECT * FROM PS_UD_SA_TEST_TBL WHERE EXCLUDE = 'N' AND TEST_ID LIKE 'GCE A';
SELECT * FROM PS_SCC_STG_TESTCMP WHERE SCORE_LETTER = 'C';
-- LOCATION
SELECT * FROM PS_EXT_ORG_PRI_VW X WHERE EXT_ORG_TYPE = 'SCHL' AND COUNTRY = 'GBR' AND EXT_ORG_ID LIKE 'UA%'
and X.EFFDT = (SELECT MAX(A.EFFDT)
                    FROM PS_EXT_ORG_PRI_VW A
                   WHERE A.EXT_ORG_ID = x.EXT_ORG_ID
                     AND A.EFF_STATUS = 'A'
                     AND A.EFFDT <= SYSDATE);


-- config table insert
SELECT * FROM PS_UD_OLA2_CONFIG WHERE OBJNAME = 'QUALS';
INSERT INTO PS_UD_OLA2_CONFIG VALUES ('QUALS', '*', '*', '*', 'OPRID', 2, ' ', ' ', ' ', ' ');
INSERT INTO PS_UD_OLA2_CONFIG VALUES ('QUALS', '*', '*', '*', 'UD_OLA_APPLNBR', 2, ' ', ' ', ' ', ' ');
INSERT INTO PS_UD_OLA2_CONFIG VALUES ('QUALS', '*', '*', '*', 'SEQNUM', 4, ' ', ' ', ' ', ' ');
INSERT INTO PS_UD_OLA2_CONFIG VALUES ('QUALS', '*', '*', '*', 'UD_TEST_ID', 4, ' ', ' ', ' ', ' ');
INSERT INTO PS_UD_OLA2_CONFIG VALUES ('QUALS', '*', '*', '*', 'UD_OLA_QUAL_DESCR', 64, ' ', 'UD_TEST_ID', ' ', ' ');
INSERT INTO PS_UD_OLA2_CONFIG VALUES ('QUALS', '*', '*', '*', 'UD_TEST_COMPONENT', 4, ' ', ' ', ' ', ' ');
--INSERT INTO PS_UD_OLA2_CONFIG VALUES ('QUALS', '*', '*', '*', 'UD_OLA_QUAL_SUBJ', 2, ' ', ' ', ' ', ' ');
INSERT INTO PS_UD_OLA2_CONFIG VALUES ('QUALS', '*', '*', '*', 'UD_SCORE_LETTER', 4, ' ', ' ', ' ', ' ');
--INSERT INTO PS_UD_OLA2_CONFIG VALUES ('QUALS', '*', '*', '*', 'UD_OLA_QUAL_GRADE', 2, ' ', ' ', ' ', ' ');
--INSERT INTO PS_UD_OLA2_CONFIG VALUES ('QUALS', '*', '*', '*', 'PERCENTILE', 2, ' ', ' ', ' ', ' ');
INSERT INTO PS_UD_OLA2_CONFIG VALUES ('QUALS', '*', '*', '*', 'UD_EXT_ORG_ID', 4, ' ', ' ', ' ', ' ');
--INSERT INTO PS_UD_OLA2_CONFIG VALUES ('QUALS', '*', '*', '*', 'DESCR50', 2, ' ', ' ', ' ', ' ');
--INSERT INTO PS_UD_OLA2_CONFIG VALUES ('QUALS', '*', '*', '*', 'TEST_DT', 2, ' ', ' ', ' ', ' ');
INSERT INTO PS_UD_OLA2_CONFIG VALUES ('QUALS', '*', '*', '*', 'LASTUPDOPRID', 2, ' ', ' ', ' ', ' ');
INSERT INTO PS_UD_OLA2_CONFIG VALUES ('QUALS', '*', '*', '*', 'LASTUPDDTTM', 2, ' ', ' ', ' ', ' ');


DELETE PS_UD_OLA2_CONFIG WHERE OBJNAME = 'QUALS';
COMMIT;

SELECT * FROM SYSADM.PS_UD_OLA2_QUALS ORDER BY 1,2,3;

DELETE FROM PS_UD_OLA2_QUALS;
COMMIT;



SELECT * FROM PS_UD_OLA_APPLCATN;
SELECT UNIQUE ACAD_CAREER FROM PS_ACAD_PROG_TBL;

SELECT * FROM PS_ACAD_PROG_TBL WHERE ACAD_PROG = 'MB7AH';
SELECT * FROM XLATTABLE_VW WHERE FIELDNAME = 'ACAD_CAREER' AND EFF_STATUS = 'A';