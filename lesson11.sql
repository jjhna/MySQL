-- Lesson 11: more logical operators

-- Logical operator of !=

mysql> SELECT title, author_lname FROM books WHERE author_lname != 'Harris';
+-----------------------------------------------------+----------------+
| title                                               | author_lname   |
+-----------------------------------------------------+----------------+
| The Namesake                                        | Lahiri         |
| Norse Mythology                                     | Gaiman         |
| American Gods                                       | Gaiman         |
| Interpreter of Maladies                             | Lahiri         |
| A Hologram for the King: A Novel                    | Eggers         |
| The Circle                                          | Eggers         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         |
| Just Kids                                           | Smith          |
| A Heartbreaking Work of Staggering Genius           | Eggers         |
| Coraline                                            | Gaiman         |
| What We Talk About When We Talk About Love: Stories | Carver         |
| where im calling from: selected stories             | Carver         |
| White Noise                                         | DeLillo        |
| Cannery Row                                         | Steinbeck      |
| Oblivion: Stories                                   | Foster Wallace |
| Consider the Lobster                                | Foster Wallace |
| Lincoln In The Bardo                                | Saunders       |
+-----------------------------------------------------+----------------+
17 rows in set (0.01 sec)

-- Logical operator of NOT LIKE

mysql> SELECT title FROM books WHERE title NOT LIKE '%the%';
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| Norse Mythology                                     |
| American Gods                                       |
| Interpreter of Maladies                             |
| Just Kids                                           |
| A Heartbreaking Work of Staggering Genius           |
| Coraline                                            |
| What We Talk About When We Talk About Love: Stories |
| where im calling from: selected stories             |
| White Noise                                         |
| Cannery Row                                         |
| Oblivion: Stories                                   |
| 10% Happier                                         |
| fake_book                                           |
+-----------------------------------------------------+
13 rows in set (0.00 sec)

-- Logical operator of greater than > and >=

mysql> SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;
+-------------------------------------------+----------------+
| title                                     | stock_quantity |
+-------------------------------------------+----------------+
| A Hologram for the King: A Novel          |            154 |
| A Heartbreaking Work of Staggering Genius |            104 |
| Coraline                                  |            100 |
| Oblivion: Stories                         |            172 |
| fake_book                                 |            287 |
| Lincoln In The Bardo                      |           1000 |
+-------------------------------------------+----------------+
6 rows in set (0.00 sec)

mysql> SELECT title, released_year FROM books WHERE released_year <= 2000;
+-----------------------------------------------------+---------------+
| title                                               | released_year |
+-----------------------------------------------------+---------------+
| Interpreter of Maladies                             |          1996 |
| The Amazing Adventures of Kavalier & Clay           |          2000 |
| What We Talk About When We Talk About Love: Stories |          1981 |
| where im calling from: selected stories             |          1989 |
| White Noise                                         |          1985 |
| Cannery Row                                         |          1945 |
+-----------------------------------------------------+---------------+
6 rows in set (0.00 sec)

-- The logical operator of AND &&

mysql> SELECT  title, author_lname, released_year FROM books WHERE author_lname='Eggers' AND released_year > 2010;
+----------------------------------+--------------+---------------+
| title                            | author_lname | released_year |
+----------------------------------+--------------+---------------+
| A Hologram for the King: A Novel | Eggers       |          2012 |
| The Circle                       | Eggers       |          2013 |
+----------------------------------+--------------+---------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM books WHERE author_lname='Eggers' AND released_year > 2010 AND title LIKE '%novel%';
+---------+----------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                            | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+----------------------------------+--------------+--------------+---------------+----------------+-------+
|       5 | A Hologram for the King: A Novel | Dave         | Eggers       |          2012 |            154 |   352 |
+---------+----------------------------------+--------------+--------------+---------------+----------------+-------+
1 row in set (0.08 sec)

-- The logical operator of OR || 

mysql> SELECT title, author_lname, released_year, stock_quantity FROM   books WHERE  author_lname = 'Eggers' || released_year > 2010 OR stock_quantity > 100;
+-------------------------------------------+----------------+---------------+----------------+
| title                                     | author_lname   | released_year | stock_quantity |
+-------------------------------------------+----------------+---------------+----------------+
| Norse Mythology                           | Gaiman         |          2016 |             43 |
| A Hologram for the King: A Novel          | Eggers         |          2012 |            154 |
| The Circle                                | Eggers         |          2013 |             26 |
| A Heartbreaking Work of Staggering Genius | Eggers         |          2001 |            104 |
| Oblivion: Stories                         | Foster Wallace |          2004 |            172 |
| 10% Happier                               | Harris         |          2014 |             29 |
| fake_book                                 | Harris         |          2001 |            287 |
| Lincoln In The Bardo                      | Saunders       |          2017 |           1000 |
+-------------------------------------------+----------------+---------------+----------------+
8 rows in set (0.00 sec)

-- The logical operator of BETWEEN (and NOT between) which is a better version of mulitiple && statements

mysql> SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| A Hologram for the King: A Novel |          2012 |
| The Circle                       |          2013 |
| Just Kids                        |          2010 |
| Oblivion: Stories                |          2004 |
| Consider the Lobster             |          2005 |
| 10% Happier                      |          2014 |
+----------------------------------+---------------+
6 rows in set (0.00 sec)

mysql> SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015;
+-----------------------------------------------------+---------------+
| title                                               | released_year |
+-----------------------------------------------------+---------------+
| The Namesake                                        |          2003 |
| Norse Mythology                                     |          2016 |
| American Gods                                       |          2001 |
| Interpreter of Maladies                             |          1996 |
| The Amazing Adventures of Kavalier & Clay           |          2000 |
| A Heartbreaking Work of Staggering Genius           |          2001 |
| Coraline                                            |          2003 |
| What We Talk About When We Talk About Love: Stories |          1981 |
| where im calling from: selected stories             |          1989 |
| White Noise                                         |          1985 |
| Cannery Row                                         |          1945 |
| fake_book                                           |          2001 |
| Lincoln In The Bardo                                |          2017 |
+-----------------------------------------------------+---------------+
13 rows in set (0.00 sec)

-- The logical operator of IN and NOT IN which is a better version of OR statements

mysql> SELECT title, author_lname FROM books WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
+-----------------------------------------------------+--------------+
| title                                               | author_lname |
+-----------------------------------------------------+--------------+
| The Namesake                                        | Lahiri       |
| Interpreter of Maladies                             | Lahiri       |
| Just Kids                                           | Smith        |
| What We Talk About When We Talk About Love: Stories | Carver       |
| where im calling from: selected stories             | Carver       |
+-----------------------------------------------------+--------------+
5 rows in set (0.00 sec)

mysql> SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016);
+-------------------------------------------+---------------+
| title                                     | released_year |
+-------------------------------------------+---------------+
| The Namesake                              |          2003 |
| American Gods                             |          2001 |
| The Circle                                |          2013 |
| A Heartbreaking Work of Staggering Genius |          2001 |
| Coraline                                  |          2003 |
| Consider the Lobster                      |          2005 |
| fake_book                                 |          2001 |
| Lincoln In The Bardo                      |          2017 |
+-------------------------------------------+---------------+
8 rows in set (0.00 sec)

mysql> SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 != 0 ORDER BY released_year;
+-------------------------------------------+---------------+
| title                                     | released_year |
+-------------------------------------------+---------------+
| American Gods                             |          2001 |
| A Heartbreaking Work of Staggering Genius |          2001 |
| fake_book                                 |          2001 |
| The Namesake                              |          2003 |
| Coraline                                  |          2003 |
| Consider the Lobster                      |          2005 |
| The Circle                                |          2013 |
| Lincoln In The Bardo                      |          2017 |
+-------------------------------------------+---------------+
8 rows in set (0.00 sec)

-- The logical operstor CASE, ELSE statement which is similar to the if and else statements

mysql> SELECT title, stock_quantity, CASE WHEN stock_quantity BETWEEN 0 AND 50 THEN '*' WHEN stock_quantity BETWEEN 51 AND 100 THEN '**' WHEN stock_quantity BETWEEN 101 AND 150 THEN '***' ELSE '****' END AS STOCK FROM books;
+-----------------------------------------------------+----------------+-------+
| title                                               | stock_quantity | STOCK |
+-----------------------------------------------------+----------------+-------+
| The Namesake                                        |             32 | *     |
| Norse Mythology                                     |             43 | *     |
| American Gods                                       |             12 | *     |
| Interpreter of Maladies                             |             97 | **    |
| A Hologram for the King: A Novel                    |            154 | ****  |
| The Circle                                          |             26 | *     |
| The Amazing Adventures of Kavalier & Clay           |             68 | **    |
| Just Kids                                           |             55 | **    |
| A Heartbreaking Work of Staggering Genius           |            104 | ***   |
| Coraline                                            |            100 | **    |
| What We Talk About When We Talk About Love: Stories |             23 | *     |
| where im calling from: selected stories             |             12 | *     |
| White Noise                                         |             49 | *     |
| Cannery Row                                         |             95 | **    |
| Oblivion: Stories                                   |            172 | ****  |
| Consider the Lobster                                |             92 | **    |
| 10% Happier                                         |             29 | *     |
| fake_book                                           |            287 | ****  |
| Lincoln In The Bardo                                |           1000 | ****  |
+-----------------------------------------------------+----------------+-------+
19 rows in set (0.00 sec)

mysql> SELECT title, released_year, CASE WHEN released_year >= 2000 THEN 'Modern Lit' ELSE '20th Century Lit' END AS GENRE FROM books;
+-----------------------------------------------------+---------------+------------------+
| title                                               | released_year | GENRE            |
+-----------------------------------------------------+---------------+------------------+
| The Namesake                                        |          2003 | Modern Lit       |
| Norse Mythology                                     |          2016 | Modern Lit       |
| American Gods                                       |          2001 | Modern Lit       |
| Interpreter of Maladies                             |          1996 | 20th Century Lit |
| A Hologram for the King: A Novel                    |          2012 | Modern Lit       |
| The Circle                                          |          2013 | Modern Lit       |
| The Amazing Adventures of Kavalier & Clay           |          2000 | Modern Lit       |
| Just Kids                                           |          2010 | Modern Lit       |
| A Heartbreaking Work of Staggering Genius           |          2001 | Modern Lit       |
| Coraline                                            |          2003 | Modern Lit       |
| What We Talk About When We Talk About Love: Stories |          1981 | 20th Century Lit |
| where im calling from: selected stories             |          1989 | 20th Century Lit |
| White Noise                                         |          1985 | 20th Century Lit |
| Cannery Row                                         |          1945 | 20th Century Lit |
| Oblivion: Stories                                   |          2004 | Modern Lit       |
| Consider the Lobster                                |          2005 | Modern Lit       |
| 10% Happier                                         |          2014 | Modern Lit       |
| fake_book                                           |          2001 | Modern Lit       |
| Lincoln In The Bardo                                |          2017 | Modern Lit       |
+-----------------------------------------------------+---------------+------------------+
19 rows in set (0.00 sec)

-- Additional examples

mysql> select title, author_lname, case when title like '%stories%' then 'Short Stories' when title like 'just kids%' && title like 'A heartbreaking%' then 'Memoir' else 'novel' end as 'type' from books;
+-----------------------------------------------------+----------------+---------------+
| title                                               | author_lname   | type          |
+-----------------------------------------------------+----------------+---------------+
| The Namesake                                        | Lahiri         | novel         |
| Norse Mythology                                     | Gaiman         | novel         |
| American Gods                                       | Gaiman         | novel         |
| Interpreter of Maladies                             | Lahiri         | novel         |
| A Hologram for the King: A Novel                    | Eggers         | novel         |
| The Circle                                          | Eggers         | novel         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         | novel         |
| Just Kids                                           | Smith          | novel         |
| A Heartbreaking Work of Staggering Genius           | Eggers         | novel         |
| Coraline                                            | Gaiman         | novel         |
| What We Talk About When We Talk About Love: Stories | Carver         | Short Stories |
| where im calling from: selected stories             | Carver         | Short Stories |
| White Noise                                         | DeLillo        | novel         |
| Cannery Row                                         | Steinbeck      | novel         |
| Oblivion: Stories                                   | Foster Wallace | Short Stories |
| Consider the Lobster                                | Foster Wallace | novel         |
| 10% Happier                                         | Harris         | novel         |
| fake_book                                           | Harris         | novel         |
| Lincoln In The Bardo                                | Saunders       | novel         |
+-----------------------------------------------------+----------------+---------------+
19 rows in set (0.00 sec)

