-- Developpeur
-- Rien à faire à part changer les identifiant de root
ALTER USER 'root'@'localhost' IDENTIFIED BY 'NewPassword';

-- Developpeur
CREATE USER 'dev'@'localhost' IDENTIFIED BY 'dev';
SHOW GRANTS FOR 'dev'@'localhost';
REVOKE ALL ON blog.* FROM 'dev'@'localhost';
FLUSH PRIVILEGES;

GRANT INSERT, SELECT, UPDATE, DELETE, CREATE, ALTER, DROP, LOCK TABLES, INDEX, EXECUTE, CREATE TEMPORARY TABLES ON blog.* TO dev@'localhost' IDENTIFIED BY 'dev';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'dev'@'localhost';

-- programme
CREATE USER 'programme'@'localhost' IDENTIFIED BY 'programme';
SHOW GRANTS FOR 'programme'@'localhost';
REVOKE ALL ON *.* FROM 'programme'@'localhost';
FLUSH PRIVILEGES;

GRANT INSERT, SELECT, UPDATE, DELETE, CREATE, ALTER, DROP, LOCK TABLES, INDEX, EXECUTE, CREATE TEMPORARY TABLES ON blog.* TO programme@'localhost' IDENTIFIED BY 'programme';
GRANT INSERT, SELECT, UPDATE, DELETE, CREATE, ALTER, DROP, LOCK TABLES, INDEX, EXECUTE, CREATE TEMPORARY TABLES ON test_blog.* TO programme@'localhost' IDENTIFIED BY 'programme';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'programme'@'localhost';


-- Testeur
CREATE USER 'testeur'@'localhost' IDENTIFIED BY 'test';
SHOW GRANTS FOR 'testeur'@'localhost';
REVOKE ALL ON test_blog.* FROM 'testeur'@'localhost';
FLUSH PRIVILEGES;

GRANT INSERT, SELECT, UPDATE, DELETE, CREATE, ALTER, DROP, LOCK TABLES, INDEX, EXECUTE, CREATE TEMPORARY TABLES ON test_blog.* TO testeur@'localhost' IDENTIFIED BY 'test';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'testeur'@'localhost';


