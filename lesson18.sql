-- Lesson 18

-- SQL triggers is a special type of stored procedure that automatically runs when an event occurs in the databae server. 
-- In other words if I wanted to create a trigger where I don't want the user to allow inputs under a certain number. I would create a trigger that would prevent the user from enter numbers under a certain number and return an error messsage. See users_triggers.sql for an example of a trigger. 

-- In order to activate a trigger you need to run the trigger once which will start up the trigger, think of it as a gas generator.

mysql> source triggers/users_triggers.sql
Query OK, 0 rows affected (0.11 sec)

mysql> insert into users(username, age) values('yang', 15);
ERROR 1644 (45000): Must be an adult!

-- To see a log of triggers that are currently active use: 
show triggers;
 
 -- To remove any triggers use:
 drop trigger trigger_name;
 -- ex:
 drop trigger must_be_adult;
 
 -- NOTE that triggers can make debugging hard
 
-- Other trigger examples:

DELIMITER $$

CREATE TRIGGER example_cannot_follow_self
     BEFORE INSERT ON follows FOR EACH ROW
     BEGIN
          IF NEW.follower_id = NEW.following_id
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot follow yourself, silly';
          END IF;
     END;
$$

DELIMITER ;

-- Another one 

DELIMITER $$

CREATE TRIGGER create_unfollow
    AFTER DELETE ON follows FOR EACH ROW 
BEGIN
    INSERT INTO unfollows
    SET follower_id = OLD.follower_id,
        followee_id = OLD.followee_id;
END$$

DELIMITER ;
