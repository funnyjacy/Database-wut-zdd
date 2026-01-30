# 在department表的departName字段创建唯一索引
create index idx_department on department (dept_name);

# 创建复合索引
create index idx_NameAddress on employee (emp_name, address);

# 创建表的时候创建索引
CREATE TABLE department1 (
    dept_id VARCHAR(20) NOT NULL COMMENT '部门编号',
    dept_name VARCHAR(50) primary key COMMENT '部门名',
    remarks TEXT COMMENT '备注',
    INDEX idx_dept_id (dept_id)
) COMMENT '部门信息表1';

# 创建Hash索引
create table  tempEmployee (
    employeeID VARCHAR(20) primary key comment '员工编号',
    name varchar(20) not null comment '员工姓名',
    education varchar(20) not null comment '学历',
    index idx_hash_employeeId (employeeID) using hash
);


# 查看引擎
SHOW ENGINES;