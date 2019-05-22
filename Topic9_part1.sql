DROP TABLE IF EXISTS logs //	
CREATE TABLE logs (	
name VARCHAR(40),	
created_at DATETIME DEFAULT NOW(),	
table_name VARCHAR(40),	
table_id INT	
) ENGINE=Archive //	
	
DROP TRIGGER IF EXISTS products_log //	
CREATE TRIGGER products_log AFTER INSERT ON products 	
FOR EACH ROW	
BEGIN	
	DECLARE tbl1_name VARCHAR(40);
	SET tbl1_name='products';
	INSERT INTO logs (name, created_at, table_name, table_id) SELECT products.name, products.created_at, tbl1_name, products.id FROM products;
END //	
	
DROP TRIGGER IF EXISTS users_log //	
CREATE TRIGGER userss_log AFTER INSERT ON users 	
FOR EACH ROW	
BEGIN	
	DECLARE tbl2_name VARCHAR(40);
	SET tbl2_name='users';
	INSERT INTO logs (name, created_at, table_name, table_id) SELECT users.name, users.created_at, tbl2_name, users.id FROM users;
END //	
	
	
INSERT INTO products(name) VALUES ('Snoop Dragon 825'), ('Snoop Dragon 830')//	
INSERT INTO users(name) VALUES ('Adam'), ('Peter')//	
	
SELECT*FROM logs//	
