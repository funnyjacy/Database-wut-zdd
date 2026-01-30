-- 创建数据库
CREATE DATABASE DBEM;
USE DBEM;

-- 创建部门信息表
CREATE TABLE department (
    dept_id VARCHAR(20) PRIMARY KEY COMMENT '部门编号',
    dept_name VARCHAR(50) NOT NULL COMMENT '部门名',
    remarks TEXT COMMENT '备注'
) COMMENT '部门信息表';

-- 创建员工信息表
CREATE TABLE employee (
    emp_id VARCHAR(20) PRIMARY KEY COMMENT '员工编号',
    emp_name VARCHAR(50) NOT NULL COMMENT '姓名',
    education VARCHAR(20) COMMENT '学历',
    birthday DATE COMMENT '生日',
    gender ENUM('男', '女') COMMENT '性别',
    work_date DATE COMMENT '工作时间',
    address VARCHAR(200) COMMENT '地址',
    phone VARCHAR(20) COMMENT '电话号码',
    dept_id VARCHAR(20) COMMENT '员工部门号',
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
) COMMENT '员工信息表';

-- 创建员工薪水情况表
CREATE TABLE salary (
    emp_id VARCHAR(20) PRIMARY KEY COMMENT '员工编号',
    income DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT '收入',
    expenditure DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT '支出',
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
) COMMENT '员工薪水情况表';


