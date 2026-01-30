CREATE TABLE `tb_sku` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `sku_name` VARCHAR(100),
  `price` DECIMAL(10,2),
  `stock` INT,
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO `tb_sku` (`sku_name`, `price`, `stock`, `create_time`) VALUES
('华为 Mate 60 Pro', 6999.00, 100, NOW()),
('苹果 iPhone 15', 5999.00, 150, NOW()),
('小米 14 Ultra', 6499.00, 80, NOW()),
('索尼 WH-1000XM5 耳机', 2499.00, 200, NOW()),
('任天堂 Switch OLED', 2299.00, 300, NOW()),
('罗技 MX Master 3S 鼠标', 699.00, 500, NOW()),
('戴尔 UltraSharp 27显示器', 3599.00, 45, NOW()),
('小胖子机械键盘', 499.00, 120, NOW()),
('极米 H6 投影仪', 4999.00, 30, NOW()),
('倍思 100W 充电头', 159.00, 1000, NOW());

INSERT INTO tb_sku(sku_name, price, stock) SELECT sku_name, price, stock FROM tb_sku;

-- 感受一下磁盘 I/O 的轰鸣，可能需要几秒甚至十几秒
explain SELECT * FROM tb_sku ORDER BY id LIMIT 30000000, 10;

-- 利用覆盖索引扫描，你会发现它瞬间返回
explain SELECT t.* FROM tb_sku t
JOIN (SELECT id FROM tb_sku ORDER BY id LIMIT 30000000, 10) a ON t.id = a.id;


