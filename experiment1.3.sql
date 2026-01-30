-- 1基本查询任务
# 查询每个雇员的姓名、地址和联系电话
select emp_name, address, phone
from employee;
# 查询employee表中部门号和性别，要求使用DISTINCT消除重复行
select distinct dept_id, gender
from employee;
# 查询所有财务部的员工的姓名和联系电话
SELECT e.emp_name, e.phone, d.dept_name
FROM employee e
         INNER JOIN department d ON e.dept_id = d.dept_id
WHERE d.dept_name = '财务部';
# 查询employee表中女雇员的地址和电话，使用AS子句将结果中各列的
# 标题指定为“地址”和“电话”
select e.address as 地址, e.phone as 电话
from employee e
where e.gender = '女';
# 查询财务部雇员的最高和最低实际收入
select *
from employee
         join dbem.department d on d.dept_id = employee.dept_id
where d.dept_name = '财务部';
# 找出所有收入在2000到3000元之间的员工编号

-- 2子查询的使用
# 查找在财务部工作的员工的情况
select *
from employee e
         join dbem.department d on d.dept_id = e.dept_id
where d.dept_name = '财务部';
# 用子查询方法查找所有收入在2500元以下的雇员的情况
select *
from employee
         join dbem.salary s on employee.emp_id = s.emp_id
where s.income < 15000;

-- 3连接查询的使用
# 查询每个雇员的情况及其薪水情况
select *
from salary
         join dbem.employee e on e.emp_id = salary.emp_id;
# 使用内连接查询名字为“王林”的员工所在部门
select d.dept_name
from department d
         inner join dbem.employee e on d.dept_id = e.dept_id
where e.emp_name = '张三';
# 查找财务部收入在2000元以上的雇员姓名和薪水详情
select e.emp_name, s.income
from employee e
         join dbem.salary s on e.emp_id = s.emp_id
where income > 15000;

-- 4GROUP BY、ORDER BY和LIMIT子句的使用
# 查询employee中男性和女性的人数
select e.gender, count(e.gender)
from employee e
group by e.gender;
# 查找员工数超过2人的部门名称和员工数量
select d.dept_name, count(e.emp_id)
from department d
         join dbem.employee e on d.dept_id = e.dept_id
group by d.dept_name
having count(e.emp_id) > 2;
# 将employee表中的员工年龄由大到小排列
select *
from employee e
order by e.birthday asc;
# 返回employee表中前5位员工的信息
select *
from employee
limit 5;

-- 视图查询
select v.emp_name, v.income
from v_em v
where emp_name = '张三';

-- 视图更新
insert into v_dp (dept_id, dept_name, remarks)
values ('D005', '广告部', '负责广告');

insert into v_em (emp_id, emp_name, income)
values ('D001', '蔡徐坤', 15000);

