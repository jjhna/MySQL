/* Lesson 13: Many to Many relationship
Useful for tying multiple tables together such as:
Books <-> Authors
Students <-> Classes
Series Data <-> Reviews Data <-> Reviewers Data
*/

-- Challenge 1

mysql> select title, rating from series join reviews on series.id = reviews.series_id  order by rating desc limit 10;
+----------------------+--------+
| title                | rating |
+----------------------+--------+
| Breaking Bad         |    9.9 |
| Arrested Development |    9.9 |
| Halt and Catch Fire  |    9.9 |
| Fargo                |    9.7 |
| Breaking Bad         |    9.5 |
| Breaking Bad         |    9.3 |
| Freaks and Geeks     |    9.3 |
| Fargo                |    9.1 |
| Breaking Bad         |    9.1 |
| Curb Your Enthusiasm |    9.1 |
+----------------------+--------+
10 rows in set (0.00 sec)

-- Challenge 2

mysql> select title, avg(rating) as 'avg_rating' from series join reviews on series.id = reviews.series_id group by series.id order by avg_rating;
+----------------------+------------+
| title                | avg_rating |
+----------------------+------------+
| General Hospital     |    5.38000 |
| Bobs Burgers        |    7.52000 |
| Seinfeld             |    7.60000 |
| Bojack Horseman      |    7.94000 |
| Arrested Development |    8.08000 |
| Archer               |    8.12000 |
| Curb Your Enthusiasm |    8.12000 |
| Freaks and Geeks     |    8.60000 |
| Stranger Things      |    8.76667 |
| Breaking Bad         |    9.36000 |
| Fargo                |    9.40000 |
| Halt and Catch Fire  |    9.90000 |
+----------------------+------------+
12 rows in set (0.00 sec)

-- Challenge 3

mysql> select first_name, last_name, rating from reviewers inner join reviews on reviewers.id = reviews.reviewer_id limit 10;
+------------+-----------+--------+
| first_name | last_name | rating |
+------------+-----------+--------+
| Thomas     | Stoneman  |    8.0 |
| Thomas     | Stoneman  |    8.1 |
| Thomas     | Stoneman  |    7.0 |
| Thomas     | Stoneman  |    7.5 |
| Thomas     | Stoneman  |    9.5 |
| Wyatt      | Skaggs    |    7.5 |
| Wyatt      | Skaggs    |    7.6 |
| Wyatt      | Skaggs    |    9.3 |
| Wyatt      | Skaggs    |    6.5 |
| Wyatt      | Skaggs    |    8.4 |
+------------+-----------+--------+
10 rows in set (0.00 sec)

-- Challenge 4
-- note this doesnt work
mysql> select case when rating = null then title end as 'unreviewd_series' from series left join reviews on series.id = reviews.series_id;

mysql> select title, rating from series left join reviews on series.id = reviews.series_id where rating is null;
+-----------------------+--------+
| title                 | rating |
+-----------------------+--------+
| Malcolm In The Middle |   NULL |
| Pushing Daisies       |   NULL |
+-----------------------+--------+
2 rows in set (0.00 sec)

-- Challenge 5

mysql> select genre, avg(rating) as 'avg_rating' from series left join reviews on series.id = reviews.series_id group by genre order by avg_rating;
+-----------+------------+
| genre     | avg_rating |
+-----------+------------+
| Animation |    7.86000 |
| Drama     |    8.04375 |
| Comedy    |    8.16250 |
+-----------+------------+
3 rows in set (0.00 sec)

mysql> select genre, round(avg(rating)) as 'avg_rating' from series left join reviews on series.id = reviews.series_id group by genre order by avg_rating;
+-----------+------------+
| genre     | avg_rating |
+-----------+------------+
| Comedy    |          8 |
| Animation |          8 |
| Drama     |          8 |
+-----------+------------+
3 rows in set (0.02 sec)

-- Challenge 6

mysql> select first_name, last_name, count(reviewer_id) as 'count', ifnull(min(rating), 0) as 'MIN', ifnull(max(rating), 0) as 'MAX', ifnull(avg(rating), 0) as 'AVG', if(count(rating) >= 1, 'ACTIVE', 'INACTIVE') as
'STATUS' from reviewers left join reviews on reviewers.id = reviews.reviewer_id group by reviewers.id;
+------------+-----------+-------+-----+-----+---------+----------+
| first_name | last_name | count | MIN | MAX | AVG     | STATUS   |
+------------+-----------+-------+-----+-----+---------+----------+
| Thomas     | Stoneman  |     5 | 7.0 | 9.5 | 8.02000 | ACTIVE   |
| Wyatt      | Skaggs    |     9 | 5.5 | 9.3 | 7.80000 | ACTIVE   |
| Kimbra     | Masters   |     9 | 6.8 | 9.0 | 7.98889 | ACTIVE   |
| Domingo    | Cortes    |    10 | 5.8 | 9.1 | 7.83000 | ACTIVE   |
| Colt       | Steele    |    10 | 4.5 | 9.9 | 8.77000 | ACTIVE   |
| Pinkie     | Petit     |     4 | 4.3 | 8.8 | 7.25000 | ACTIVE   |
| Marlon     | Crafford  |     0 | 0.0 | 0.0 | 0.00000 | INACTIVE |
+------------+-----------+-------+-----+-----+---------+----------+
7 rows in set (0.01 sec)

-- Challenge 7 - 3 tables join

mysql> select title, rating, concat(first_name, ' ', last_name) as 'reviewer' from reviewers inner join reviews on reviewers.id = reviews.reviewer_id inner join series on series.id = reviews.series_id order by title
 limit 15;
+----------------------+--------+-----------------+
| title                | rating | reviewer        |
+----------------------+--------+-----------------+
| Archer               |    8.9 | Colt Steele     |
| Archer               |    8.0 | Thomas Stoneman |
| Archer               |    7.7 | Domingo Cortes  |
| Archer               |    8.5 | Kimbra Masters  |
| Archer               |    7.5 | Wyatt Skaggs    |
| Arrested Development |    8.1 | Thomas Stoneman |
| Arrested Development |    6.0 | Domingo Cortes  |
| Arrested Development |    8.0 | Kimbra Masters  |
| Arrested Development |    8.4 | Pinkie Petit    |
| Arrested Development |    9.9 | Colt Steele     |
| Bobs Burgers        |    7.0 | Thomas Stoneman |
| Bobs Burgers        |    8.0 | Domingo Cortes  |
| Bobs Burgers        |    7.1 | Kimbra Masters  |
| Bobs Burgers        |    7.5 | Pinkie Petit    |
| Bobs Burgers        |    8.0 | Colt Steele     |
+----------------------+--------+-----------------+
15 rows in set (0.00 sec)