SELECT V.REQUEST_ID,
S.SID,
S.SERIAL#,
P.SPID
FROM FND_CONC_REQUESTS_FORM_V V,
V$PROCESS P,
V$SESSION S
WHERE V.REQUEST_ID LIKE '&REQ_ID'
AND V.ORACLE_PROCESS_ID = P.SPID(+)
AND P.ADDR = S.PADDR(+);