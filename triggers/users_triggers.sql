DELIMITER $$
-- By default the semicolon is a delimiter, this delimeter $$ will tell sql to continue to run each line until the $$ delimiter on the bottom is reached. So were technically changing the delimiter to $$ instead of ; OTHERWISE the sql cli will continue to run because it thinks there isn't a semicolon.

-- We create the trigger called must_be_adult
CREATE TRIGGER must_be_adult
    -- We want to run this code before users is inserted into the table, so this trigger will check everytime the insert command is used
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
         -- NEW is just a placeholder where it refers to the data is about to be insered.
         -- age is the variable from the tables parameter "age int"
          IF NEW.age < 18
          THEN
              -- A signal sql state code that can be found online or the dodcumentation that tells sql or the dev what type of error the are getting plus a text message
              -- Ex: ERROR 1007 (HY000): Can't create database 'trigger_demo'; database exists
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$

DELIMITER ;