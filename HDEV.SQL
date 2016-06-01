--University of Derby -> New Online Application System -> Online App Setup -> Online App Installation
SELECT * FROM PS_UD_OLA_INSTALL;

--University of Derby -> New Online Application System -> Online App Setup -> Site ID Configuration
SELECT * FROM PS_UD_OLA_SITES;

--University of Derby -> New Online Application System -> Online App Setup -> Business Unit Configuration
SELECT * FROM PS_UD_OLA_BU_HDR;
SELECT * FROM PS_UD_OLA_BU_DTL;
SELECT * FROM PS_UD_OLA_BU_EMAIL;
SELECT * FROM PS_UD_OLA_BU_NAV_H;

--University of Derby -> New Online Application System -> Online App Setup -> Help Text Configuration
SELECT * FROM PS_UD_HELPTEXT_CFG;

--University of Derby -> New Online Application System -> Online App Setup -> OLA Term Title Configuration
SELECT * FROM PS_UD_OLA_TERM_CFG;

--University of Derby -> New Online Application System -> Online App Setup -> Admit Type Configuration
SELECT * FROM PS_UD_OLA_ADMT_HDR;
SELECT * FROM PS_UD_OLA_ADMT_DTL WHERE STRM = '2015';
SELECT * FROM PS_UD_OLA_APPL_CAP;

--University of Derby -> New Online Application System -> Online App Setup -> Validation Configuration
SELECT * FROM PS_UD_OLA_VAL_LVL1;
SELECT * FROM PS_UD_OLA_VAL_LVL2;
SELECT * FROM PS_UD_OLA_VAL_LVL3;

--University of Derby -> New Online Application System -> Online App Setup -> Name Prefix Configuration
SELECT * FROM PS_UD_OLA_NMPREFIX;

--University of Derby -> New Online Application System -> Online App Setup -> Programme Search Configuration
SELECT * FROM PS_UD_OLA_PSC_HDR ;
SELECT * FROM PS_UD_OLA_PSC_PROG WHERE STRM = 2016;
SELECT * FROM PS_UD_OLA_PSC_PLAN WHERE STRM = 2016;
SELECT * FROM PS_UD_OLA_PSC_ADMT WHERE STRM = 2016 AND ADM_APPL_CTR = 'EL';
SELECT * FROM PS_UD_OLA_PSC_MODE WHERE STRM = 2016;
SELECT * FROM PS_UD_OLA_PSC_POE WHERE STRM = 2016;
UY0AF
--University of Derby -> New Online Application System -> Online App Setup -> Qualification Grade Setup
SELECT * FROM PS_UD_SA_GRADE_CFG;

--University of Derby -> New Online Application System -> Online App Setup -> Online App Residency Rule
SELECT * FROM PS_UD_OLA_RESIDHDR;
SELECT * FROM PS_UD_OLA_RESIDDTL;
SELECT * FROM PS_UD_OLA_RESIDMAP;





-- JOINT HONORS STUFF
SELECT * FROM PS_ACAD_PROG_TBL WHERE ACAD_PROG LIKE 'Y002%';
SELECT * FROM PS_ACAD_PLAN_TBL WHERE ACAD_PROG = 'Y002' AND DIPLOMA_DESCR LIKE '%Account%Math%' AND EFF_STATUS = 'A';
SELECT * FROM PS_ACAD_PLAN_TBL WHERE ACAD_PROG = 'Y002' AND DIPLOMA_DESCR LIKE '%Math%Acc%';

-- Math PROG:G120
SELECT * FROM PS_UD_OLA_PSC_PROG WHERE STRM = 2016 AND EFF_STATUS = 'A';

-- MORE THAN ONE PLAN 
SELECT UNIQUE ACAD_PROG, ACAD_PLAN, UD_OLA_PLAN_TITLE FROM PS_UD_OLA_PSC_PLAN 
WHERE EFF_STATUS = 'A' 
AND STRM IN (to_char(sysdate, 'YYYY'), to_char(sysdate, 'YYYY')+1)
AND ACAD_PROG = 'C300';

SELECT * FROM PS_ACAD_PROG_TBL WHERE EFF_STATUS = 'A' AND DESCR LIKE '%Math%';

SELECT J.ACAD_PROG, J.ACAD_PLAN, J.DESCR254_MIXED, J.* FROM PS_ACAD_PROG_TBL J WHERE ACAD_PROG = 'Y002'
AND J.EFF_STATUS = 'A'
AND J.EFFDT = (SELECT MAX(J1.EFFDT)
                    FROM PS_ACAD_PROG_TBL J1
                     WHERE J1.ACAD_PROG = J.ACAD_PROG
                     AND J1.EFF_STATUS = J.EFF_STATUS
                     AND J1.EFFDT <= SYSDATE);

SELECT * FROM PS_ACAD_PLAN_TBL J WHERE ACAD_PROG = 'C300'
AND J.EFF_STATUS = 'A'
AND J.EFFDT = (SELECT MAX(J1.EFFDT)
                    FROM PS_ACAD_PLAN_TBL J1
                     WHERE J1.ACAD_PLAN = J.ACAD_PLAN
                     AND J1.EFF_STATUS = J.EFF_STATUS
                     AND J1.EFFDT <= SYSDATE);

SELECT * FROM PS_ACAD_PLAN_TBL J WHERE ACAD_PROG = 'C300' ORDER BY 3;


-- sql for query for acad plan from acad prog
SELECT P.ACAD_PROG, P.ACAD_PLAN, P.TRNSCR_DESCR FROM PS_ACAD_PLAN_TBL P WHERE P.ACAD_PLAN = 
(SELECT J.ACAD_PLAN FROM PS_ACAD_PROG_TBL J WHERE ACAD_PROG = 'C300'
AND J.EFFDT = (SELECT MAX(J1.EFFDT)
                    FROM PS_ACAD_PROG_TBL J1
                     WHERE J1.ACAD_PROG = J.ACAD_PROG
                     AND J1.EFFDT <= SYSDATE))
AND P.EFFDT = (SELECT MAX(P1.EFFDT)
                    FROM PS_ACAD_PLAN_TBL P1
                     WHERE P1.ACAD_PLAN = P.ACAD_PLAN
                     AND P1.EFFDT <= SYSDATE);


SELECT * FROM PS_UD_OLA_PSC_HDR2;
DELETE FROM PS_UD_OLA_PSC_HDR2;
INSERT INTO PS_UD_OLA_PSC_HDR2 VALUES ('DERBY', 2016, 'A', TO_DATE('2015/08/01', 'yyyy/mm/dd'));
INSERT INTO PS_UD_OLA_PSC_HDR2 VALUES ('DERBY', 2016, 'I', TO_DATE('2015/08/01', 'yyyy/mm/dd'));
COMMIT;


