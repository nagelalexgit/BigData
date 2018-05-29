
CALL getdemographicsCalllog(10000);

DELIMITER $

DROP PROCEDURE IF EXISTS `getdemographicsCalllog`$

CREATE PROCEDURE getdemographicsCalllog
(IN _limit int)
BEGIN

    SELECT demographics.gender,demographics.age_group,
                calllog.time,calllog.direction,
                calllog.duration, calllog.contact
    FROM users 
        LEFT JOIN demographics ON users.userid = demographics.userid
        INNER JOIN records ON users.userid = records.userid
        RIGHT JOIN calllog ON records.db_key = calllog.db_key 
        WHERE demographics.gender IS NOT NULL 
				AND demographics.age_group IS NOT NULL 
				AND calllog.description = 'Voice call' LIMIT _limit;
END 
$ DELIMITER ;