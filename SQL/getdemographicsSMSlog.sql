CALL getdemographicsSMSlog(1000);

select * from demographics;

DELIMITER $

DROP PROCEDURE IF EXISTS `getdemographicsSMSlog`$

CREATE PROCEDURE getdemographicsSMSlog
(IN _limit int)
BEGIN

    SELECT demographics.gender,demographics.age_group,
                sms.box,sms.totallength 
    FROM users 
        LEFT JOIN demographics ON users.userid = demographics.userid
        INNER JOIN records ON users.userid = records.userid
        RIGHT JOIN sms ON records.db_key = sms.db_key 
        WHERE demographics.gender IS NOT NULL AND demographics.age_group IS NOT NULL LIMIT _limit;
END 
$ DELIMITER ;