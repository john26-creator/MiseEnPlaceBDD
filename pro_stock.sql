DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_test`()
    COMMENT 'procedure de test'
	BEGIN
		DECLARE id INT DEFAULT 0;
		DECLARE fin TINYINT DEFAULT 0;
		DECLARE curs_employe CURSOR FOR SELECT id FROM employe;

		DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;


		OPEN curs_employe;

		loop_curs: LOOP
			FETCH curs_employe INTO id;
			
			IF fin = 1 THEN
				LEAVE loop_curs;
			END IF;
			
			SELECT CONCAT ('client ', id) AS 'Employee';
		END LOOP;

		CLOSE curs_employe;
	END$$
DELIMITER ;

