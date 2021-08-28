-- Lesson 10 is about data types such as char, varchar, float, doule, etc
-- Char is used for fixed length os data and it's faster for fixed length textALTER
-- It is primarily useful for: Sex: M/F or Y/N or NY, KY, IL, etc

mysql> create table dogs(name char(5), breed varchar(10));

mysql> select * from dogs;
+-------+------------+
| name  | breed      |
+-------+------------+
| bob   | beagle     |
| boba  | beagled    |
| bobay | beagledy   |
| bobay | beagledyan |
+-------+------------+
4 rows in set (0.00 sec)

-- decimals work with 2 parameters, the first being the the toal length of the number (includes the decimals numbers) and the 2nd parameter is the decimal amount places
-- note that the decimals round up to the nearest decimal value

mysql> insert into items(price) values(3.5256);
Query OK, 1 row affected, 1 warning (0.10 sec)

mysql> select * from items;
+--------+
| price  |
+--------+
| 999.99 |
|  64.53 |
| 999.99 |
|   3.53 |
+--------+
4 rows in set (0.00 sec)

-- floats and double allow you to store larger numbers using less space but it comes at the cost of precision than decimals
-- Note that you should use decimals as much as possible, unless percision doesn't matter

mysql> create table thingies(price float, numba double);
Query OK, 0 rows affected (0.09 sec)

mysql> insert into thingies(price, numba) values (59.29525, 25.1251251252346);
Query OK, 1 row affected (0.00 sec)

mysql> select * from thingies;
+---------+------------------+
| price   | numba            |
+---------+------------------+
| 59.2952 | 25.1251251252346 |
+---------+------------------+
1 row in set (0.00 sec)

-- The year format is default of YYYY-MM-DD
-- The time format is default of  HH:MM:SS
-- The DATETIME is both time and date and has a defult value of: YYYY-MM-DD HH:MM:SS

mysql> create table people (name varchar(100), birthdate date, birthtime time, birthdt datetime);
Query OK, 0 rows affected (0.07 sec)

mysql> insert into people(name, birthdate, birthtime, birthdt) values ('padma', '1983-11-11', '10:07:34', '1983-11-11 10:07:34');
Query OK, 1 row affected (0.01 sec)

mysql> select * from people;
+-------+------------+-----------+---------------------+
| name  | birthdate  | birthtime | birthdt             |
+-------+------------+-----------+---------------------+
| padma | 1983-11-11 | 10:07:34  | 1983-11-11 10:07:34 |
+-------+------------+-----------+---------------------+
1 row in set (0.00 sec)

-- curdate, curtime and now commands, which allows the user to get the current date, time or both date and time to the userALTER

mysql> insert into people(name, birthdate, birthtime, birthdt) values ('bob', curdate(), curtime(), now());
Query OK, 1 row affected (0.01 sec)

mysql> select * from people;
+-------+------------+-----------+---------------------+
| name  | birthdate  | birthtime | birthdt             |
+-------+------------+-----------+---------------------+
| padma | 1983-11-11 | 10:07:34  | 1983-11-11 10:07:34 |
| bob   | 2021-08-27 | 20:14:37  | 2021-08-27 20:14:37 |
+-------+------------+-----------+---------------------+
2 rows in set (0.00 sec)

-- You can format the dates and times using day(), dayname(), dayofweek(), and dayofyear() to get maybe the day of a certain date: monday or wednesday, etc

mysql> select name, birthdate, day(birthdate), dayname(birthdate), dayofweek(birthdate), dayofyear(birthdate) from people;
+-------+------------+----------------+--------------------+----------------------+----------------------+
| name  | birthdate  | day(birthdate) | dayname(birthdate) | dayofweek(birthdate) | dayofyear(birthdate) |
+-------+------------+----------------+--------------------+----------------------+----------------------+
| padma | 1983-11-11 |             11 | Friday             |                    6 |                  315 |
| bob   | 2021-08-27 |             27 | Friday             |                    6 |                  239 |
+-------+------------+----------------+--------------------+----------------------+----------------------+
2 rows in set (0.00 sec)

-- other formats for time include seconds, minutes, hours, etc

mysql> select name, birthtime, hour(birthdt), minute(birthdt) from people;
+-------+-----------+---------------+-----------------+
| name  | birthtime | hour(birthdt) | minute(birthdt) |
+-------+-----------+---------------+-----------------+
| padma | 10:07:34  |            10 |               7 |
| bob   | 20:14:37  |            20 |              14 |
+-------+-----------+---------------+-----------------+
2 rows in set (0.00 sec)

-- note that with these commands you can format the dates and times to something better using concat OR even better the DATE_FORMAT command

mysql> SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) FROM people;
+-------------------------------------------------------------------------+
| CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) |
+-------------------------------------------------------------------------+
| November 11 1983                                                        |
| August 27 2021                                                          |
+-------------------------------------------------------------------------+
2 rows in set (0.00 sec)

mysql> SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;
+-------------------------------------------+
| DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') |
+-------------------------------------------+
| 11/11/1983 at 10:07                       |
| 08/27/2021 at 08:14                       |
+-------------------------------------------+
2 rows in set (0.00 sec)

mysql> SELECT DATE_FORMAT(birthdt, '%W %M %Y at %h:%i') FROM people;
+-------------------------------------------+
| DATE_FORMAT(birthdt, '%W %M %Y at %h:%i') |
+-------------------------------------------+
| Friday November 1983 at 10:07             |
| Friday August 2021 at 08:14               |
+-------------------------------------------+
2 rows in set (0.00 sec)

-- To calculate the date difference use datediff or date_add() commands
-- so we claculated the number of days between now and the birth date

mysql> select name, birthdate, datediff(now(), birthdate) from people;
+-------+------------+----------------------------+
| name  | birthdate  | datediff(now(), birthdate) |
+-------+------------+----------------------------+
| padma | 1983-11-11 |                      13805 |
| bob   | 2021-08-27 |                          1 |
+-------+------------+----------------------------+
2 rows in set (0.00 sec)

mysql> select birthdt, date_add(birthdt, interval 1 month) from people;
+---------------------+-------------------------------------+
| birthdt             | date_add(birthdt, interval 1 month) |
+---------------------+-------------------------------------+
| 1983-11-11 10:07:34 | 1983-12-11 10:07:34                 |
| 2021-08-27 20:14:37 | 2021-09-27 20:14:37                 |
+---------------------+-------------------------------------+
2 rows in set (0.00 sec)

-- to add or subtract dates and times you use the + and - operatorsALTER

mysql> select birthdt, birthdt + interval 15 month + interval 10 hour from people;
+---------------------+------------------------------------------------+
| birthdt             | birthdt + interval 15 month + interval 10 hour |
+---------------------+------------------------------------------------+
| 1983-11-11 10:07:34 | 1985-02-11 20:07:34                            |
| 2021-08-27 20:14:37 | 2022-11-28 06:14:37                            |
+---------------------+------------------------------------------------+
2 rows in set (0.00 sec)

-- Timestamp is similar to date time however timestamp has a less of a range between 1970 to 2038 while dattime can go back to 1000
-- To create a time stamp use:

mysql> create table comments (content varchar(100), created_at timestamp default now());
Query OK, 0 rows affected (0.06 sec)

mysql> insert into comments(content) values ('I found this oofa');
Query OK, 1 row affected (0.01 sec)

mysql> select * from comments order by created_at;
+-------------------+---------------------+
| content           | created_at          |
+-------------------+---------------------+
| I found this oof  | 2021-08-28 00:55:25 |
| I found this oofa | 2021-08-28 01:10:24 |
+-------------------+---------------------+
2 rows in set (0.00 sec)

mysql> update comments set content='this isnt oof' where content='I found this oofa';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from comments;
+------------------+---------------------+
| content          | created_at          |
+------------------+---------------------+
| I found this oof | 2021-08-28 00:55:25 |
| this isnt oof    | 2021-08-28 01:10:24 |
+------------------+---------------------+
2 rows in set (0.00 sec)

-- more examples

mysql> create table stonk(name char(4));
Query OK, 0 rows affected (0.07 sec)

mysql> insert stonk(name) value ('baba');
Query OK, 1 row affected (0.01 sec)

mysql> select * from stonk;
+------+
| name |
+------+
| baba |

mysql> insert into tweets(content, username) value('this is 1st post', 'babamama');
Query OK, 1 row affected (0.05 sec)

mysql> select * from tweets;
+------------------+----------+---------------------+
| content          | username | created_a           |
+------------------+----------+---------------------+
| this is 1st post | babamama | 2021-08-28 03:37:54 |
| this is 1st post | babamama | 2021-08-28 03:38:00 |
+------------------+----------+---------------------+
2 rows in set (0.00 sec)