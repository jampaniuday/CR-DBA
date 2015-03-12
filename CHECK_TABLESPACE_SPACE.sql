set lines 1200;
set pages 200;
SELECT df.tablespace_name, df.total_space_mb TOTAL_SPACE_MB,
(df.total_space_mb - fs.free_space_mb) USED_SPACE_MB,
fs.free_space_mb FREE_SPACE_MB,
ROUND(100 * (fs.free_space / df.total_space),2) PCT_FREE
FROM (SELECT tablespace_name, SUM(bytes) TOTAL_SPACE,
ROUND(SUM(bytes) / 1048576) TOTAL_SPACE_MB
FROM dba_data_files
GROUP BY tablespace_name) df,
(SELECT tablespace_name, SUM(bytes) FREE_SPACE,
ROUND(SUM(bytes) / 1048576) FREE_SPACE_MB
FROM dba_free_space
GROUP BY tablespace_name) fs
WHERE df.tablespace_name = fs.tablespace_name(+)
ORDER BY 5;
