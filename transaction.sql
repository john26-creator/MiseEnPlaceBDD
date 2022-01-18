
SET autocommit = 1;

START TRANSACTION
BEGIN
 DECLARE nb_jeremies INT DEFAULT 1;

 UPDATE `animaux` SET `nom`='sneaker' WHERE UPPER(nom) = 'SLIM';

 SAVEPOINT update_slim; 

 SET nb_jeremies = SELECT COUNT (*) FROM animaux WHERE UPPER (proprietaire) = 'JEREMIE';
 
 IF ( nb_jeremies = 0 ) THEN 
	INSERT INTO animaux (`nom`, `proprietaire`, `espece`, `genre`, `naissance`, `mort`) 
		VALUES ('Arnold', 'Jeremie', 'chien', 'm', '29-11-2021', NULL);
	SELECT "INSERTION REUSSIE";
 ELSE
	SELECT "INSERTION ECHEC, Jérémie est déjà en base";
	ROLLBACK  TO  update_slim ;
 END IF;
 
 COMMIT;
END;

