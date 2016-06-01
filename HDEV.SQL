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
SELECT * FROM PS_UD_OLA_ADMT_DTL;
SELECT * FROM PS_UD_OLA_APPL_CAP;

--University of Derby -> New Online Application System -> Online App Setup -> Validation Configuration
SELECT * FROM PS_UD_OLA_VAL_LVL1;
SELECT * FROM PS_UD_OLA_VAL_LVL2;
SELECT * FROM PS_UD_OLA_VAL_LVL3;

--University of Derby -> New Online Application System -> Online App Setup -> Name Prefix Configuration
SELECT * FROM PS_UD_OLA_NMPREFIX;

--University of Derby -> New Online Application System -> Online App Setup -> Programme Search Configuration
SELECT * FROM PS_UD_OLA_PSC_HDR WHERE STRM = 2016;
SELECT * FROM PS_UD_OLA_PSC_PROG WHERE STRM = 2016;
SELECT * FROM PS_UD_OLA_PSC_PLAN WHERE STRM = 2016;
SELECT * FROM PS_UD_OLA_PSC_ADMT WHERE STRM = 2016;
SELECT * FROM PS_UD_OLA_PSC_MODE WHERE STRM = 2016;
SELECT * FROM PS_UD_OLA_PSC_POE WHERE STRM = 2016;

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
SELECT * FROM PS_UD_OLA_PSC_PROG WHERE STRM = 2016 AND EFF_STATUS = 'A' AND ACAD_PROG LIKE 'G12%';
SELECT * FROM PS_ACAD_PROG_TBL WHERE EFF_STATUS = 'A' AND DESCR LIKE '%Math%';

SELECT J.ACAD_PROG, J.DESCR254_MIXED FROM PS_ACAD_PROG_TBL J WHERE ACAD_PROG = 'G120'
AND J.EFFDT = (SELECT MAX(J1.EFFDT)
                    FROM PS_ACAD_PROG_TBL J1
                     WHERE J1.ACAD_PROG = J.ACAD_PROG
                     AND J1.EFFDT <= SYSDATE);

--
SELECT P.ACAD_PROG, P.ACAD_PLAN, P.TRNSCR_DESCR FROM PS_ACAD_PLAN_TBL P WHERE P.ACAD_PLAN = 
(SELECT J.ACAD_PLAN FROM PS_ACAD_PROG_TBL J WHERE ACAD_PROG = 'G120'
AND J.EFFDT = (SELECT MAX(J1.EFFDT)
                    FROM PS_ACAD_PROG_TBL J1
                     WHERE J1.ACAD_PROG = J.ACAD_PROG
                     AND J1.EFFDT <= SYSDATE))
AND P.EFFDT = (SELECT MAX(P1.EFFDT)
                    FROM PS_ACAD_PLAN_TBL P1
                     WHERE P1.ACAD_PLAN = P.ACAD_PLAN
                     AND P1.EFFDT <= SYSDATE);



