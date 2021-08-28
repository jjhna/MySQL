-- The READ FROM CRUD:

-- IMPORTANT NOTE: the command LIKE allows the user to search up partial matches such as author = '%the%' while the = sign only searches for exact matches

mysql> select cat_id, name, age, breed from cats;
+--------+----------------+------+------------+
| cat_id | name           | age  | breed      |
+--------+----------------+------+------------+
|      1 | Ringo          |    4 | Tabby      |
|      2 | Cindy          |   10 | Maine Coon |
|      3 | Dumbledore     |   11 | Maine Coon |
|      4 | Egg            |    4 | Persian    |
|      5 | Misty          |   13 | Tabby      |
|      6 | George Michael |    9 | Ragdoll    |
|      7 | Jackson        |    7 | Sphynx     |
+--------+----------------+------+------------+
7 rows in set (0.00 sec)

mysql> select * from cats where age=4;
+--------+-------+---------+------+
| cat_id | name  | breed   | age  |
+--------+-------+---------+------+
|      1 | Ringo | Tabby   |    4 |
|      4 | Egg   | Persian |    4 |
+--------+-------+---------+------+
2 rows in set (0.01 sec)

-- Aliases = printing out a column from a data as a different name ex:

mysql> select cat_id as id,name from cats;
+----+----------------+
| id | name           |
+----+----------------+
|  1 | Ringo          |
|  2 | Cindy          |
|  3 | Dumbledore     |
|  4 | Egg            |
|  5 | Misty          |
|  6 | George Michael |
|  7 | Jackson        |
+----+----------------+
7 rows in set (0.00 sec)

mysql> select name as 'cat name', breed as 'kitty breed' from cats;
+----------------+-------------+
| cat name       | kitty breed |
+----------------+-------------+
| Ringo          | Tabby       |
| Cindy          | Maine Coon  |
| Dumbledore     | Maine Coon  |
| Egg            | Persian     |
| Misty          | Tabby       |
| George Michael | Ragdoll     |
| Jackson        | Sphynx      |
+----------------+-------------+
7 rows in set (0.00 sec)

-- The Update from CRUD:
-- Note also look at the breed tabby from the previous table that is listed above.

-- NOTE this is WHERE becomes important to both the update and delete CRUDS because you need to specify which 

mysql> update cats set breed='shorthair'
    -> where breed='tabby';
Query OK, 2 rows affected (0.02 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from cats;
+--------+----------------+------------+------+
| cat_id | name           | breed      | age  |
+--------+----------------+------------+------+
|      1 | Ringo          | shorthair  |    4 |
|      2 | Cindy          | Maine Coon |   10 |
|      3 | Dumbledore     | Maine Coon |   11 |
|      4 | Egg            | Persian    |    4 |
|      5 | Misty          | shorthair  |   13 |
|      6 | George Michael | Ragdoll    |    9 |
|      7 | Jackson        | Sphynx     |    7 |
+--------+----------------+------------+------+
7 rows in set (0.00 sec)

mysql> update cats set age=14 where name = 'misty';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from cats;
+--------+----------------+------------+------+
| cat_id | name           | breed      | age  |
+--------+----------------+------------+------+
|      1 | Ringo          | shorthair  |    4 |
|      2 | Cindy          | Maine Coon |   10 |
|      3 | Dumbledore     | Maine Coon |   11 |
|      4 | Egg            | Persian    |    4 |
|      5 | Misty          | shorthair  |   14 |
|      6 | George Michael | Ragdoll    |    9 |
|      7 | Jackson        | Sphynx     |    7 |
+--------+----------------+------------+------+

-- The Delete from CRUD
-- This is both deleteing a data entry from a table

mysql> delete from cats where name='egg';
Query OK, 1 row affected (0.02 sec)

mysql> select * from cats;
+--------+----------------+-------------------+------+
| cat_id | name           | breed             | age  |
+--------+----------------+-------------------+------+
|      1 | Ringo          | british shorthair |    4 |
|      2 | Cindy          | Maine Coon        |   12 |
|      3 | Dumbledore     | Maine Coon        |   12 |
|      5 | Misty          | shorthair         |   14 |
|      6 | George Michael | Ragdoll           |    9 |
|      7 | jack           | Sphynx            |    7 |
+--------+----------------+-------------------+------+
6 rows in set (0.00 sec)

-- note that this will delete all the data from the cats table, HOWEVER the table still remains
Delete from cats;

