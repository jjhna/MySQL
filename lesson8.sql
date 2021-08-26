-- Lesson 8 -refining selections, so make unique select commands such as how many return values to recieve, etcALTER

-- The distinct command which allows the user to select certain or unique titles 
mysql> select author_lname from books;
+----------------+
| author_lname   |
+----------------+
| Lahiri         |
| Gaiman         |
| Gaiman         |
| Lahiri         |
| Eggers         |
| Eggers         |
| Chabon         |
| Smith          |
| Eggers         |
| Gaiman         |
| Carver         |
| Carver         |
| DeLillo        |
| Steinbeck      |
| Foster Wallace |
| Foster Wallace |
| Harris         |
| Harris         |
| Saunders       |
+----------------+
19 rows in set (0.00 sec)

-- note that wedon't return copies of the authors with the same last name, only unique values

mysql> select distinct author_lname from books;
+----------------+
| author_lname   |
+----------------+
| Lahiri         |
| Gaiman         |
| Eggers         |
| Chabon         |
| Smith          |
| Carver         |
| DeLillo        |
| Steinbeck      |
| Foster Wallace |
| Harris         |
| Saunders       |
+----------------+
11 rows in set (0.00 sec)

-- Note: go and see refining_selections/distinct.sql doc
mysql> SELECT DISTINCT concat(author_fname, ' ', author_lname) FROM books;
+-----------------------------------------+
| concat(author_fname, ' ', author_lname) |
+-----------------------------------------+
| Jhumpa Lahiri                           |
| Neil Gaiman                             |
| Dave Eggers                             |
| Michael Chabon                          |
| Patti Smith                             |
| Raymond Carver                          |
| Don DeLillo                             |
| John Steinbeck                          |
| David Foster Wallace                    |
| Dan Harris                              |
| Freida Harris                           |
| George Saunders                         |
+-----------------------------------------+
12 rows in set (0.00 sec)

-- The command order by which will order the list of data by alpahbet or numerical, etcALTER

mysql> select author_lname from books order by author_lname;
+----------------+
| author_lname   |
+----------------+
| Carver         |
| Carver         |
| Chabon         |
| DeLillo        |
| Eggers         |
| Eggers         |
| Eggers         |
| Foster Wallace |
| Foster Wallace |
| Gaiman         |
| Gaiman         |
| Gaiman         |
| Harris         |
| Harris         |
| Lahiri         |
| Lahiri         |
| Saunders       |
| Smith          |
| Steinbeck      |
+----------------+
19 rows in set (0.01 sec)

mysql> select released_year from books order by released_year;
+---------------+
| released_year |
+---------------+
|          1945 |
|          1981 |
|          1985 |
|          1989 |
|          1996 |
|          2000 |
|          2001 |
|          2001 |
|          2001 |
|          2003 |
|          2003 |
|          2004 |
|          2005 |
|          2010 |
|          2012 |
|          2013 |
|          2014 |
|          2016 |
|          2017 |
+---------------+
19 rows in set (0.04 sec)

-- To reverse the order by use dec

mysql> select title from books order by title desc;
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| White Noise                                         |
| where im calling from: selected stories             |
| What We Talk About When We Talk About Love: Stories |
| The Namesake                                        |
| The Circle                                          |
| The Amazing Adventures of Kavalier & Clay           |
| Oblivion: Stories                                   |
| Norse Mythology                                     |
| Lincoln In The Bardo                                |
| Just Kids                                           |
| Interpreter of Maladies                             |
| fake_book                                           |
| Coraline                                            |
| Consider the Lobster                                |
| Cannery Row                                         |
| American Gods                                       |
| A Hologram for the King: A Novel                    |
| A Heartbreaking Work of Staggering Genius           |
| 10% Happier                                         |
+-----------------------------------------------------+
19 rows in set (0.00 sec)

mysql> select title, released_year, pages from books order by released_year;
+-----------------------------------------------------+---------------+-------+
| title                                               | released_year | pages |
+-----------------------------------------------------+---------------+-------+
| Cannery Row                                         |          1945 |   181 |
| What We Talk About When We Talk About Love: Stories |          1981 |   176 |
| White Noise                                         |          1985 |   320 |
| where im calling from: selected stories             |          1989 |   526 |
| Interpreter of Maladies                             |          1996 |   198 |
| The Amazing Adventures of Kavalier & Clay           |          2000 |   634 |
| fake_book                                           |          2001 |   428 |
| American Gods                                       |          2001 |   465 |
| A Heartbreaking Work of Staggering Genius           |          2001 |   437 |
| Coraline                                            |          2003 |   208 |
| The Namesake                                        |          2003 |   291 |
| Oblivion: Stories                                   |          2004 |   329 |
| Consider the Lobster                                |          2005 |   343 |
| Just Kids                                           |          2010 |   304 |
| A Hologram for the King: A Novel                    |          2012 |   352 |
| The Circle                                          |          2013 |   504 |
| 10% Happier                                         |          2014 |   256 |
| Norse Mythology                                     |          2016 |   304 |
| Lincoln In The Bardo                                |          2017 |   367 |
+-----------------------------------------------------+---------------+-------+
19 rows in set (0.00 sec)

-- Note for below we are ordering by released_year because its the 2nd variable in our command

mysql> select title, released_year, pages from books order by 2;
+-----------------------------------------------------+---------------+-------+
| title                                               | released_year | pages |
+-----------------------------------------------------+---------------+-------+
| Cannery Row                                         |          1945 |   181 |
| What We Talk About When We Talk About Love: Stories |          1981 |   176 |
| White Noise                                         |          1985 |   320 |
| where im calling from: selected stories             |          1989 |   526 |
| Interpreter of Maladies                             |          1996 |   198 |
| The Amazing Adventures of Kavalier & Clay           |          2000 |   634 |
| fake_book                                           |          2001 |   428 |
| American Gods                                       |          2001 |   465 |
| A Heartbreaking Work of Staggering Genius           |          2001 |   437 |
| Coraline                                            |          2003 |   208 |
| The Namesake                                        |          2003 |   291 |
| Oblivion: Stories                                   |          2004 |   329 |
| Consider the Lobster                                |          2005 |   343 |
| Just Kids                                           |          2010 |   304 |
| A Hologram for the King: A Novel                    |          2012 |   352 |
| The Circle                                          |          2013 |   504 |
| 10% Happier                                         |          2014 |   256 |
| Norse Mythology                                     |          2016 |   304 |
| Lincoln In The Bardo                                |          2017 |   367 |
+-----------------------------------------------------+---------------+-------+
19 rows in set (0.00 sec)

-- Using the doc file we are first ordering by the last name and if there are any duplicates they then check the first name to see which name goes first or last

mysql> source refining_selections/order_by.sql;
+--------------+----------------+
| author_fname | author_lname   |
+--------------+----------------+
| Raymond      | Carver         |
| Raymond      | Carver         |
| Michael      | Chabon         |
| Don          | DeLillo        |
| Dave         | Eggers         |
| Dave         | Eggers         |
| Dave         | Eggers         |
| David        | Foster Wallace |
| David        | Foster Wallace |
| Neil         | Gaiman         |
| Neil         | Gaiman         |
| Neil         | Gaiman         |
| Dan          | Harris         |
| Freida       | Harris         |
| Jhumpa       | Lahiri         |
| Jhumpa       | Lahiri         |
| George       | Saunders       |
| Patti        | Smith          |
| John         | Steinbeck      |
+--------------+----------------+
19 rows in set (0.07 sec)

-- The limit command which allows us to specify how many results we want returned backALTER

mysql> select title from books limit 3;
+-----------------+
| title           |
+-----------------+
| The Namesake    |
| Norse Mythology |
| American Gods   |
+-----------------+
3 rows in set (0.00 sec)

mysql> source refining_selections/limit.sql;
+----------------------+---------------+
| title                | released_year |
+----------------------+---------------+
| Lincoln In The Bardo |          2017 |
| Norse Mythology      |          2016 |
| 10% Happier          |          2014 |
+----------------------+---------------+
3 rows in set (0.00 sec)

-- The like command which allows us to perform better searching such as searching for certain keywords: find titles that start with muh deck
-- Note that the '%da%' is a wildcard which means anything between the % is the word or value that we want to find similar to whether its: dan or someday
-- If you want to be more specific you can go with something like 'da%' which searches only for speicifc names such as david, dan or dave

mysql> select title, author_fname from books where author_fname like '%da%';
+-------------------------------------------+--------------+
| title                                     | author_fname |
+-------------------------------------------+--------------+
| A Hologram for the King: A Novel          | Dave         |
| The Circle                                | Dave         |
| A Heartbreaking Work of Staggering Genius | Dave         |
| Oblivion: Stories                         | David        |
| Consider the Lobster                      | David        |
| 10% Happier                               | Dan          |
| fake_book                                 | Freida       |
+-------------------------------------------+--------------+
7 rows in set (0.03 sec)

mysql> select title, title from books where title like 'the%';
+-------------------------------------------+-------------------------------------------+
| title                                     | title                                     |
+-------------------------------------------+-------------------------------------------+
| The Namesake                              | The Namesake                              |
| The Circle                                | The Circle                                |
| The Amazing Adventures of Kavalier & Clay | The Amazing Adventures of Kavalier & Clay |
+-------------------------------------------+-------------------------------------------+
3 rows in set (0.00 sec)

mysql> select title, title from books where title like '%the';
Empty set (0.00 sec)

-- Instead of a wild card you can specify the amount of characters using undercard because wildcards mean any digit or number etcALTER

mysql> select title, stock_quantity from books where stock_quantity like '__';
+-----------------------------------------------------+----------------+
| title                                               | stock_quantity |
+-----------------------------------------------------+----------------+
| The Namesake                                        |             32 |
| Norse Mythology                                     |             43 |
| American Gods                                       |             12 |
| Interpreter of Maladies                             |             97 |
| The Circle                                          |             26 |
| The Amazing Adventures of Kavalier & Clay           |             68 |
| Just Kids                                           |             55 |
| What We Talk About When We Talk About Love: Stories |             23 |
| where im calling from: selected stories             |             12 |
| White Noise                                         |             49 |
| Cannery Row                                         |             95 |
| Consider the Lobster                                |             92 |
| 10% Happier                                         |             29 |
+-----------------------------------------------------+----------------+
13 rows in set (0.00 sec)

-- BUT what if you need to look up characters with % or _ characters?ALTER

mysql> select title from books where title like '%\%%';
+-------------+
| title       |
+-------------+
| 10% Happier |
+-------------+
1 row in set (0.00 sec)

mysql> select title from books where title like '%\_%';
+-----------+
| title     |
+-----------+
| fake_book |
+-----------+
1 row in set (0.00 sec)

