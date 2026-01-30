SELECT
    emp_id,
    emp_name,
    education
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/emp_backup.csv'
FIELDS TERMINATED BY ','      -- 字段分隔符为逗号
OPTIONALLY ENCLOSED BY '"'    -- 字段值可选地用双引号括起来
LINES TERMINATED BY '\n'      -- 行分隔符为换行符
FROM
    employee;

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/emp_backup.csv'
REPLACE -- 重点：指定replace功能
INTO TABLE employee
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(emp_id, emp_name, education); -- 指定要导入的字段

