BEGIN
	WHILE LENGTH (@phrase) > 0 DO
	  SET @strt = 0; 
	  SET @mot = SUBSTRING_INDEX(@phrase,' ',1);
	  SET @stop = LENGTH (@mot);
	  SET @lgth = LENGTH (@phrase) - @stop;
	  SET @mot = SUBSTRING(@phrase, @strt, @stop);
	  SET @phrase = SUBSTRING(@phrase, @stop, @lgth + 1);
	  SELECT @mot;
	END WHILE;
END;

