# 创建employee1
create table employee1 (
    employeeID varchar(20) not null ,
    name varchar(20) primary key,
    gender varchar(10) not null,
    education varchar(10) not null,
    unique (employeeID)
);

# 创建employee2
create table employee2 (
    employeeID varchar(20) not null ,
    name varchar(20) not null ,
    gender varchar(10) not null,
    education varchar(10) not null,
    unique (employeeID)
);

# 添加元素到employee1和employee2，验证实体完整性是否起作用
# 插入第一条记录
INSERT INTO employee1 (employeeID, name, gender, education)
VALUES ('E001', '张三', '男', '本科');

# 插入第二条记录 (employeeID和name都不同)
INSERT INTO employee1 (employeeID, name, gender, education)
VALUES ('E002', '李四', '女', '硕士');

INSERT INTO employee1 (employeeID, name, gender, education)
VALUES ('E003', NULL, '男', '本科');
-- 预期结果：失败！因为 name 是主键，不能为 NULL。

INSERT INTO employee1 (employeeID, name, gender, education)
VALUES ('E001', '王五', '男', '博士');
-- 预期结果：失败！因为 employeeID 'E001' 已经存在，违反了 UNIQUE 约束。