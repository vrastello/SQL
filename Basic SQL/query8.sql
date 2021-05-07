-- Create a table with the following columns, named bsg_spaceship
--
--    id - an auto-incrementing integer which is also the primary key
--    name - variable-length string with a max of 255 characters, cannot be null
--    separate_saucer_section - a boolean property which specifies whether or not there is a separate saucer section on the spaceship. This defaults to No.
--    length - integer, cannot be null
--
-- Once you have created the table, run the query "DESCRIBE bsg_spaceship;"

-- Write your queries BELOW this line
CREATE TABLE bsg_spaceship(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    separate_saucer_section BOOLEAN NOT NULL DEFAULT 0,
    length int NOT NULL) engine = INNODB;


DESCRIBE bsg_spaceship;

