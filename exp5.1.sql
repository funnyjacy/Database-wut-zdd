select user();

create user 'user_1'@'localhost' identified by '1234';

create user 'user_2'@'localhost' identified by '1234';

rename user 'user_2'@'localhost' to 'user_3'@'localhost';

alter user 'user_3'@'localhost' identified by '123456';

-- 授予 user_1 对 DBEM 数据库中 employee 表的查询、插入、修改、删除权限
GRANT SELECT, INSERT, UPDATE, DELETE ON DBEM.employee TO 'user_1'@'localhost';

grant select on dbem.salary to 'user_1'@'localhost' with grant option;
grant select on dbem.salary to 'user_3'@'localhost';

-- 回收user_1对employee表的select权限
revoke select on dbem.employee from 'user_1'@'localhost';

select user
from mysql.user;

SHOW ENGINE INNODB STATUS;