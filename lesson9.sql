-- Lesson 9 Aggregate functions, these are commands that are mainly used for numerical operations such as count, min, max, and finding the avg of items in a listALTER

mysql> select count(*) from books;
+----------+
| count(*) |
+----------+
|       19 |
+----------+
1 row in set (0.01 sec)

mysql> select count(distinct author_fname) from books;
+------------------------------+
| count(distinct author_fname) |
+------------------------------+
|                           12 |
+------------------------------+
1 row in set (0.00 sec)

mysql> select count(distinct author_fname, author_lname) from books;
+--------------------------------------------+
| count(distinct author_fname, author_lname) |
+--------------------------------------------+
|                                         12 |
+--------------------------------------------+
1 row in set (0.00 sec)

select count(*) from books where title like '%the%';
+----------+
| count(*) |
+----------+
|        6 |
+----------+
1 row in set (0.00 sec)


-- GROUP BY, definition: summarizes or agregates identical data into single rows. 
-- GROUP BY, so group by is a unique command that groups similar itmes of the same value given into just one row

-- Pleases take note that Carver has written two books previously but those two values have been just put into one row
-- Please note that this is NOT USEFUL, because we don't know that Carter has written two books

mysql> select title, author_lname from books group by author_lname;
+-----------------------------------------------------+----------------+
| title                                               | author_lname   |
+-----------------------------------------------------+----------------+
| What We Talk About When We Talk About Love: Stories | Carver         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         |
| White Noise                                         | DeLillo        |
| A Hologram for the King: A Novel                    | Eggers         |
| Oblivion: Stories                                   | Foster Wallace |
| Norse Mythology                                     | Gaiman         |
| 10% Happier                                         | Harris         |
| The Namesake                                        | Lahiri         |
| Lincoln In The Bardo                                | Saunders       |
| Just Kids                                           | Smith          |
| Cannery Row                                         | Steinbeck      |
+-----------------------------------------------------+----------------+
11 rows in set (0.00 sec)

-- group by allows us to do something like this: where the amount books written by an author are counted and listed onto the screen

mysql> select author_lname, count(*) from books group by author_lname;
+----------------+----------+
| author_lname   | count(*) |
+----------------+----------+
| Carver         |        2 |
| Chabon         |        1 |
| DeLillo        |        1 |
| Eggers         |        3 |
| Foster Wallace |        2 |
| Gaiman         |        3 |
| Harris         |        2 |
| Lahiri         |        2 |
| Saunders       |        1 |
| Smith          |        1 |
| Steinbeck      |        1 |
+----------------+----------+
11 rows in set (0.00 sec)

-- other useful examples of group by

mysql> select author_fname, author_lname, count(*) from books group by author_lname, author_fname;
+--------------+----------------+----------+
| author_fname | author_lname   | count(*) |
+--------------+----------------+----------+
| Raymond      | Carver         |        2 |
| Michael      | Chabon         |        1 |
| Don          | DeLillo        |        1 |
| Dave         | Eggers         |        3 |
| David        | Foster Wallace |        2 |
| Neil         | Gaiman         |        3 |
| Dan          | Harris         |        1 |
| Freida       | Harris         |        1 |
| Jhumpa       | Lahiri         |        2 |
| George       | Saunders       |        1 |
| Patti        | Smith          |        1 |
| John         | Steinbeck      |        1 |
+--------------+----------------+----------+
12 rows in set (0.00 sec)

mysql> select concat('In ', released_year, ' ', count(*), ' books released') from books group by released_year;
+----------------------------------------------------------------+
| concat('In ', released_year, ' ', count(*), ' books released') |
+----------------------------------------------------------------+
| In 1945 1 books released                                       |
| In 1981 1 books released                                       |
| In 1985 1 books released                                       |
| In 1989 1 books released                                       |
| In 1996 1 books released                                       |
| In 2000 1 books released                                       |
| In 2001 3 books released                                       |
| In 2003 2 books released                                       |
| In 2004 1 books released                                       |
| In 2005 1 books released                                       |
| In 2010 1 books released                                       |
| In 2012 1 books released                                       |
| In 2013 1 books released                                       |
| In 2014 1 books released                                       |
| In 2016 1 books released                                       |
| In 2017 1 books released                                       |
+----------------------------------------------------------------+
16 rows in set (0.00 sec)

-- min and max are commands that can help you get the minimum or maximum amount in the tableALTER

mysql> select min(released_year) from books;
+--------------------+
| min(released_year) |
+--------------------+
|               1945 |
+--------------------+
1 row in set (0.00 sec)

mysql> select max(pages) from books;
+------------+
| max(pages) |
+------------+
|        634 |
+------------+
1 row in set (0.00 sec)

-- Now with using min and max you need to use paranthesis () to find additional info on the value that your found using min or max
-- Note that below the paranthesis are performed first before the first part of the code. However this is technically running 2 queries which is really slow

mysql> select * from books where pages = (select max(pages) from books);
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                     | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
|       7 | The Amazing Adventures of Kavalier & Clay | Michael      | Chabon       |          2000 |             68 |   634 |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
1 row in set (0.00 sec)

-- otherwise use the original way that is using the limit command

mysql> select * from books order by pages asc limit 1;
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                               | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
|      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |          1981 |             23 |   176 |
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
1 row in set (0.01 sec)

-- if you want to find the min number using the group by command you can use:
-- so we are trying to find the first book that the author wrote by finding the minimum released year

mysql> select author_fname, author_lname, min(released_year) from books group by author_lname, author_fname;
+--------------+----------------+--------------------+
| author_fname | author_lname   | min(released_year) |
+--------------+----------------+--------------------+
| Raymond      | Carver         |               1981 |
| Michael      | Chabon         |               2000 |
| Don          | DeLillo        |               1985 |
| Dave         | Eggers         |               2001 |
| David        | Foster Wallace |               2004 |
| Neil         | Gaiman         |               2001 |
| Dan          | Harris         |               2014 |
| Freida       | Harris         |               2001 |
| Jhumpa       | Lahiri         |               1996 |
| George       | Saunders       |               2017 |
| Patti        | Smith          |               2010 |
| John         | Steinbeck      |               1945 |
+--------------+----------------+--------------------+
12 rows in set (0.00 sec)

mysql> select author_fname, author_lname, max(pages) from books group by author_fname, author_lname;
+--------------+----------------+------------+
| author_fname | author_lname   | max(pages) |
+--------------+----------------+------------+
| Dan          | Harris         |        256 |
| Dave         | Eggers         |        504 |
| David        | Foster Wallace |        343 |
| Don          | DeLillo        |        320 |
| Freida       | Harris         |        428 |
| George       | Saunders       |        367 |
| Jhumpa       | Lahiri         |        291 |
| John         | Steinbeck      |        181 |
| Michael      | Chabon         |        634 |
| Neil         | Gaiman         |        465 |
| Patti        | Smith          |        304 |
| Raymond      | Carver         |        526 |
+--------------+----------------+------------+
12 rows in set (0.00 sec)

SELECT
  CONCAT(author_fname, ' ', author_lname) AS author,
  MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname,
         author_fname;

+----------------------+--------------+
| author               | longest book |
+----------------------+--------------+
| Raymond Carver       |          526 |
| Michael Chabon       |          634 |
| Don DeLillo          |          320 |
| Dave Eggers          |          504 |
| David Foster Wallace |          343 |
| Neil Gaiman          |          465 |
| Dan Harris           |          256 |
| Freida Harris        |          428 |
| Jhumpa Lahiri        |          291 |
| George Saunders      |          367 |
| Patti Smith          |          304 |
| John Steinbeck       |          181 |
+----------------------+--------------+
12 rows in set (0.00 sec)

-- sum all the pages in the entire databaseALTER

mysql> select sum(pages) from books;
+------------+
| sum(pages) |
+------------+
|       6623 |
+------------+
1 row in set (0.00 sec)

mysql> select author_fname, author_lname, sum(pages) from books group by author_fname, author_lname;
+--------------+----------------+------------+
| author_fname | author_lname   | sum(pages) |
+--------------+----------------+------------+
| Dan          | Harris         |        256 |
| Dave         | Eggers         |       1293 |
| David        | Foster Wallace |        672 |
| Don          | DeLillo        |        320 |
| Freida       | Harris         |        428 |
| George       | Saunders       |        367 |
| Jhumpa       | Lahiri         |        489 |
| John         | Steinbeck      |        181 |
| Michael      | Chabon         |        634 |
| Neil         | Gaiman         |        977 |
| Patti        | Smith          |        304 |
| Raymond      | Carver         |        702 |
+--------------+----------------+------------+
12 rows in set (0.00 sec)

-- you can use the avg command to get the average among the entire table, which calculates the sum of everything and divides by the amount of data in the table

mysql> select avg(pages) from books;
+------------+
| avg(pages) |
+------------+
|   348.5789 |
+------------+
1 row in set (0.00 sec)

mysql> select released_year, avg(stock_quantity) as 'stonk' from books group by released_year;
+---------------+-----------+
| released_year | stonk     |
+---------------+-----------+
|          1945 |   95.0000 |
|          1981 |   23.0000 |
|          1985 |   49.0000 |
|          1989 |   12.0000 |
|          1996 |   97.0000 |
|          2000 |   68.0000 |
|          2001 |  134.3333 |
|          2003 |   66.0000 |
|          2004 |  172.0000 |
|          2005 |   92.0000 |
|          2010 |   55.0000 |
|          2012 |  154.0000 |
|          2013 |   26.0000 |
|          2014 |   29.0000 |
|          2016 |   43.0000 |
|          2017 | 1000.0000 |
+---------------+-----------+
16 rows in set (0.00 sec)

mysql> SELECT author_fname, author_lname, AVG(pages) FROM books GROUP BY author_lname, author_fname;
+--------------+----------------+------------+
| author_fname | author_lname   | AVG(pages) |
+--------------+----------------+------------+
| Raymond      | Carver         |   351.0000 |
| Michael      | Chabon         |   634.0000 |
| Don          | DeLillo        |   320.0000 |
| Dave         | Eggers         |   431.0000 |
| David        | Foster Wallace |   336.0000 |
| Neil         | Gaiman         |   325.6667 |
| Dan          | Harris         |   256.0000 |
| Freida       | Harris         |   428.0000 |
| Jhumpa       | Lahiri         |   244.5000 |
| George       | Saunders       |   367.0000 |
| Patti        | Smith          |   304.0000 |
| John         | Steinbeck      |   181.0000 |
+--------------+----------------+------------+
12 rows in set (0.00 sec)

-- Here are some other examples for lesson 8:

mysql> select author_fname, author_lname, max(pages) from books group by pages order by pages desc limit 1;
+--------------+--------------+------------+
| author_fname | author_lname | max(pages) |
+--------------+--------------+------------+
| Michael      | Chabon       |        634 |
+--------------+--------------+------------+

mysql> select released_year, count(title) as '# books', avg(pages) as 'avg pages' from books group by released_year order by released_year;
+---------------+---------+-----------+
| released_year | # books | avg pages |
+---------------+---------+-----------+
|          1945 |       1 |  181.0000 |
|          1981 |       1 |  176.0000 |
|          1985 |       1 |  320.0000 |
|          1989 |       1 |  526.0000 |
|          1996 |       1 |  198.0000 |
|          2000 |       1 |  634.0000 |
|          2001 |       3 |  443.3333 |
|          2003 |       2 |  249.5000 |
|          2004 |       1 |  329.0000 |
|          2005 |       1 |  343.0000 |
|          2010 |       1 |  304.0000 |
|          2012 |       1 |  352.0000 |
|          2013 |       1 |  504.0000 |
|          2014 |       1 |  256.0000 |
|          2016 |       1 |  304.0000 |
|          2017 |       1 |  367.0000 |
+---------------+---------+-----------+
16 rows in set (0.00 sec)