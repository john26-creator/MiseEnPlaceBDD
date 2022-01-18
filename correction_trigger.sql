DELIMITER $$

CREATE TRIGGER set_name_if_not_filled BEFORE INSERT ON abonne FOR EACH ROW
	BEGIN
		IF NEW.nom = NULL THEN
		  SET @strt = 0; 
		  SET NEW.nom = SUBSTRING_INDEX(NEW.email,'@',1);
		  SET @stop = LENGTH (NEW.nom);
		  SET @lgth = LENGTH (NEW.email) - @stop;
		  SET NEW.nom = SUBSTRING(NEW.email, @strt, @stop);
		END IF;
	END $$
DELIMITER ;

