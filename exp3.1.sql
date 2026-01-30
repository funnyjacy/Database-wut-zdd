-- 存储过程：计算员工总数并输出
DELIMITER //

CREATE PROCEDURE GetEmployeeCount()
BEGIN
    -- 声明一个局部变量用于存储员工人数
    DECLARE total_employees INT DEFAULT 0;

    -- 计算 employee 表中的总行数，并将其存储到局部变量 total_employees 中
    SELECT COUNT(*)
    INTO total_employees
    FROM employee;

    -- 输出局部变量的值
    SELECT CONCAT('员工总人数为: ', total_employees) AS Result;

END //

DELIMITER ;

CALL GetEmployeeCount();

-- 存储过程：比较两个员工的实际收入
DELIMITER //

CREATE PROCEDURE CompareEmployeeIncome(
    IN employee_id_A VARCHAR(20),  -- 第一个员工的编号
    IN employee_id_B VARCHAR(20)   -- 第二个员工的编号
)
BEGIN
    -- 声明两个局部变量来存储员工的收入
    DECLARE income_A DECIMAL(10, 2);
    DECLARE income_B DECIMAL(10, 2);
    DECLARE result_output INT;

    -- 1. 获取员工 A 的收入
    SELECT income INTO income_A
    FROM salary
    WHERE emp_id = employee_id_A;

    -- 2. 获取员工 B 的收入
    SELECT income INTO income_B
    FROM salary
    WHERE emp_id = employee_id_B;

    -- 3. 比较收入并设置输出结果 (0 或 1)
    -- 若前者 (A) 比后者 (B) 高，则输出 0
    IF income_A > income_B THEN
        SET result_output = 0;
    -- 否则（包括 A < B 或 A = B 或任一收入为 NULL），输出 1
    ELSE
        SET result_output = 1;
    END IF;

    -- 4. 输出结果
    SELECT result_output AS CompareResult;

END //

DELIMITER ;

-- 调用
call CompareEmployeeIncome('E001', 'E002');

-- 创建触发器：在删除 employee 表记录后，同步删除 salary 表中的对应记录
DELIMITER //

CREATE TRIGGER after_employee_delete
AFTER DELETE ON employee
FOR EACH ROW
BEGIN
    -- 使用 OLD.emp_id 获取在 employee 表中被删除的员工编号
    -- 并在 salary 表中删除该编号对应的记录
    DELETE FROM salary
    WHERE emp_id = OLD.emp_id;
END //

DELIMITER ;

-- 确保旧的 AFTER DELETE 触发器已被删除
DROP TRIGGER IF EXISTS after_employee_delete;

-- 创建 BEFORE DELETE 触发器
DELIMITER //

CREATE TRIGGER before_employee_delete
BEFORE DELETE ON employee   -- 关键：在删除操作执行前触发
FOR EACH ROW
BEGIN
    -- 先删除 salary 表中的对应记录
    DELETE FROM salary
    WHERE emp_id = OLD.emp_id;
END //

DELIMITER ;

SELECT @@transaction_isolation;