SET @nb_animaux = 0;

CALL get_nb_animaux_by_type ('chien', @nb_animaux);
SELECT @nb_animaux as nb_chiens;

CALL get_nb_animaux_by_type ('chat', @nb_animaux);
SELECT @nb_animaux as nb_chiens_chats;

DELIMITER $$
CREATE PROCEDURE `get_nb_animaux_by_type`(IN type_animal VARCHAR(20), INOUT nb_animaux INT) 
	BEGIN
		SELECT (nb_animaux + COUNT(*)) FROM animaux WHERE espece = type_animal INTO nb_animaux;
	END $$
DELIMITER ;



