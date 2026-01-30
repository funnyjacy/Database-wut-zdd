-- 1. 创建 salary1 表
-- 注意：外键列 (emp_id) 的数据类型和长度必须与被参照表 (salary) 的列 (emp_id) 严格一致。
CREATE TABLE salary1 (
    emp_id VARCHAR(20) PRIMARY KEY COMMENT '员工编号',
    income DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT '收入',
    expenditure DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT '支出',
    -- 定义外键约束，参照 salary 表的 emp_id 列
    FOREIGN KEY (emp_id)
    REFERENCES salary(emp_id)
    -- 当 salary 表中的记录被删除时，salary1 中对应的记录也随之删除
    ON DELETE CASCADE
    -- 当 salary 表中的 emp_id 被更新时，salary1 中对应的 emp_id 也随之更新
    ON UPDATE CASCADE
) COMMENT '员工薪水情况表1 (参照salary)';

-- 2. 初始化 salary1 表的数据
-- 使用 INSERT INTO ... SELECT 语句将 salary 表中的所有数据复制到 salary1 表。
INSERT INTO salary1 (emp_id, income, expenditure)
SELECT emp_id, income, expenditure
FROM salary;

-- 3. 删除 salary 表中的一行数据
-- 假设要删除 emp_id 为 'E001' 的员工数据。
-- 请替换 '要删除的员工ID' 为 salary 表中实际存在的一个 emp_id 值。
DELETE FROM salary
WHERE emp_id = 'E001';

-- 4. 查看 salary1 表的内容，观察变化
-- 观察 salary1 表中，与刚才在 salary 表中删除的记录对应的行是否也被自动删除了。
SELECT * FROM salary1;