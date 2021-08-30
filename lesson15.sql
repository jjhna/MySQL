-- Lesson 15
-- NEW CODE: HAVING command allows us to take the end results of the entire sql code and filter it based off a clause like user.id = 257, (challenge 7)

mysql> select username, created_at from users order by created_at limit 5;
+------------------+---------------------+
| username         | created_at          |
+------------------+---------------------+
| Darby_Herzog     | 2016-05-06 00:14:21 |
| Emilio_Bernier52 | 2016-05-06 13:04:30 |
| Elenor88         | 2016-05-08 01:30:41 |
| Nicole71         | 2016-05-09 17:30:22 |
| Jordyn.Jacobson2 | 2016-05-14 07:56:26 |
+------------------+---------------------+
5 rows in set (0.01 sec)

mysql> select dayname(created_at) as 'date', count(created_at) as 'count' from users group by dayname(created_at) order by count desc;
+-----------+-------+
| date      | count |
+-----------+-------+
| Thursday  |    16 |
| Sunday    |    16 |
| Friday    |    15 |
| Tuesday   |    14 |
| Monday    |    14 |
| Wednesday |    13 |
| Saturday  |    12 |
+-----------+-------+
7 rows in set (0.00 sec)

mysql> select username from users left join photos on users.id = photos.user_id where photos.id is null;
+---------------------+
| username            |
+---------------------+
| Aniya_Hackett       |
| Bartholome.Bernhard |
| Bethany20           |
| Darby_Herzog        |
| David.Osinski47     |
| Duane60             |
| Esmeralda.Mraz57    |
| Esther.Zulauf61     |
| Franco_Keebler64    |
| Hulda.Macejkovic    |
| Jaclyn81            |
| Janelle.Nikolaus81  |
| Jessyca_West        |
| Julien_Schmidt      |
| Kasandra_Homenick   |
| Leslie67            |
| Linnea59            |
| Maxwell.Halvorson   |
| Mckenna17           |
| Mike.Auer39         |
| Morgan.Kassulke     |
| Nia_Haag            |
| Ollie_Ledner37      |
| Pearl7              |
| Rocio33             |
| Tierra.Trantow      |
+---------------------+
26 rows in set (0.00 sec)

mysql> select username, photos.id, photos.image_url, count(*) as total from photos inner join likes on likes.photo_id = photos.id inner join users on photos.user_id = users.id group by photos.id order by total desc
limit 1;
+---------------+-----+---------------------+-------+
| username      | id  | image_url           | total |
+---------------+-----+---------------------+-------+
| Zack_Kemmer93 | 145 | https://jarret.name |    48 |
+---------------+-----+---------------------+-------+
1 row in set (0.08 sec)

mysql> select(select count(*) from photos) / (select count(*) from users) as avg;
+--------+
| avg    |
+--------+
| 2.5700 |
+--------+
1 row in set (0.07 sec)

mysql> select tag_name, count(tag_id) as count from tags left join photo_tags on tags.id = tag_id group by tag_name order by count desc limit 5;
+----------+-------+
| tag_name | count |
+----------+-------+
| smile    |    59 |
| beach    |    42 |
| party    |    39 |
| fun      |    38 |
| food     |    24 |
+----------+-------+
5 rows in set (0.00 sec)

mysql> select username, count(*) as count from users inner join likes on users.id = likes.user_id group by likes.user_id having count = (select count(*) from photos);
+--------------------+-------+
| username           | count |
+--------------------+-------+
| Aniya_Hackett      |   257 |
| Jaclyn81           |   257 |
| Rocio33            |   257 |
| Maxwell.Halvorson  |   257 |
| Ollie_Ledner37     |   257 |
| Mckenna17          |   257 |
| Duane60            |   257 |
| Julien_Schmidt     |   257 |
| Mike.Auer39        |   257 |
| Nia_Haag           |   257 |
| Leslie67           |   257 |
| Janelle.Nikolaus81 |   257 |
| Bethany20          |   257 |
+--------------------+-------+
13 rows in set (0.06 sec)
