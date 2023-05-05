show global variables like 'log_bin_trust_function_creators';
SET GLOBAL log_bin_trust_function_creators = 1;

USE `music`;
DROP function IF EXISTS `fnGetCommonCode`;

USE `music`;
DROP function IF EXISTS `music`.`fnGetCommonCode`;
;

DELIMITER $$
USE `music`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `fnGetCommonCode`(
	vparentscd varchar(10)
    ,vgroupcd varchar(10)
    ,vcode varchar(10)
) RETURNS varchar(100) CHARSET utf8mb3
BEGIN
	declare vreturn_value varchar(100);
    if vgroupcd != null then
		select value into vreturn_value
			FROM comcode
		where
			parentscd = vparentscd        
			and groupcd = vgroupcd
            and code = vcode; 
	else
		select value into vreturn_value
			FROM comcode
		where
			parentscd = vparentscd        			
            and code = vcode;
	end if;    
	    
RETURN Vreturn_value;
END$$