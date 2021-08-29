-- Lesson 12: one to many or just using joins for multiple tables 
-- Here we want to avoid perofrming duplicates or keep data seperate for security reasons
-- Joins take data from 1 table and another table and join them toether in a meaningful way

-- primary keys: a column is always unique so that other tables can reference that particular key for the other data columns: customer_id
-- id INT AUTO_INCREMENT PRIMARY KEY

-- foreign keys: reference to another table within a given table. So a column with unique data that refers to another column from another table
-- FOREIGN KEY(customer_id) REFERENCES customers(id)
-- Note, that you cannot delete or remove data or tables that have a foreign key restraint on them

-- Technically there are no difference in a left or right join, it just depends on the data that they contain and what you want to perform with those data

/* About deleting (or adding) orders...
 So you cannot add or remove orders due to the foreign key constraint which notifies sql that a customer is dependent on an order and vice versa
 To avoid this make sure you add in a: ON DELETE CASCADE which will specify whether you want your rows deleted in a child table
 when the corresponding rows are deleted in the parent table.
*/

mysql> select * from customers;
+----+------------+-----------+------------------+
| id | first_name | last_name | email            |
+----+------------+-----------+------------------+
|  1 | Boy        | George    | george@gmail.com |
|  2 | George     | Michael   | gm@gmail.com     |
|  3 | David      | Bowie     | david@gmail.com  |
|  4 | Blue       | Steele    | blue@gmail.com   |
|  5 | Bette      | Davis     | bette@aol.com    |
+----+------------+-----------+------------------+
5 rows in set (0.00 sec)

mysql> select * from orders;
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
|  3 | 2014-12-12 | 800.67 |           2 |
|  4 | 2015-01-03 |  12.50 |           2 |
|  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+--------+-------------+
5 rows in set (0.00 sec)

-- Cross Join - Kind of meaningless to use cross join

mysql> select * from customers, orders;
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  1 | 2016-02-10 |  99.99 |           1 |
|  3 | David      | Bowie     | david@gmail.com  |  1 | 2016-02-10 |  99.99 |           1 |
|  4 | Blue       | Steele    | blue@gmail.com   |  1 | 2016-02-10 |  99.99 |           1 |
|  5 | Bette      | Davis     | bette@aol.com    |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  2 | 2017-11-11 |  35.50 |           1 |
|  3 | David      | Bowie     | david@gmail.com  |  2 | 2017-11-11 |  35.50 |           1 |
|  4 | Blue       | Steele    | blue@gmail.com   |  2 | 2017-11-11 |  35.50 |           1 |
|  5 | Bette      | Davis     | bette@aol.com    |  2 | 2017-11-11 |  35.50 |           1 |
|  1 | Boy        | George    | george@gmail.com |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  3 | David      | Bowie     | david@gmail.com  |  3 | 2014-12-12 | 800.67 |           2 |
|  4 | Blue       | Steele    | blue@gmail.com   |  3 | 2014-12-12 | 800.67 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  3 | 2014-12-12 | 800.67 |           2 |
|  1 | Boy        | George    | george@gmail.com |  4 | 2015-01-03 |  12.50 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  3 | David      | Bowie     | david@gmail.com  |  4 | 2015-01-03 |  12.50 |           2 |
|  4 | Blue       | Steele    | blue@gmail.com   |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  4 | 2015-01-03 |  12.50 |           2 |
|  1 | Boy        | George    | george@gmail.com |  5 | 1999-04-11 | 450.25 |           5 |
|  2 | George     | Michael   | gm@gmail.com     |  5 | 1999-04-11 | 450.25 |           5 |
|  3 | David      | Bowie     | david@gmail.com  |  5 | 1999-04-11 | 450.25 |           5 |
|  4 | Blue       | Steele    | blue@gmail.com   |  5 | 1999-04-11 | 450.25 |           5 |
|  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+----+------------+--------+-------------+
25 rows in set (0.00 sec)

-- Inner Join - we are specifying what column from 1 table is equivalent to another column from another table
-- select all records from a and b where the join conditions are met
-- Examples of an implicit orders:

mysql> select * from customers, orders where customers.id = orders.customer_id;
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+----+------------+--------+-------------+
5 rows in set (0.00 sec)

mysql> select first_name, last_name, order_date, amount from customers, orders where customers.id = orders.customer_id;
+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 |  12.50 |
| Bette      | Davis     | 1999-04-11 | 450.25 |
+------------+-----------+------------+--------+
5 rows in set (0.00 sec)

    -- Example of an explicit join order, explicit joins are easier to read and has better syntax while the opposite is true for implicit joins
    -- the implicit is more of a cross join while the explicit specifies which table is joined into which other table
    
mysql> select * from customers join orders on customers.id = orders.customer_id;
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+----+------------+--------+-------------+
5 rows in set (0.00 sec)

mysql> select first_name, last_name, order_date, amount from customers join orders on customers.id = orders.customer_id;
+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 |  12.50 |
| Bette      | Davis     | 1999-04-11 | 450.25 |
+------------+-----------+------------+--------+
5 rows in set (0.00 sec)

-- Getting Fancier (Inner Joins Still)

    SELECT first_name, last_name, order_date, amount 
    FROM customers
    JOIN orders
        ON customers.id = orders.customer_id
    ORDER BY order_date;

    SELECT 
        first_name, 
        last_name, 
        SUM(amount) AS total_spent
    FROM customers
    JOIN orders
        ON customers.id = orders.customer_id
    GROUP BY orders.customer_id
    ORDER BY total_spent DESC;

-- Left Join = select everything from A along with any matching records in B
-- Usefu to say if you wanted to see which customer hasn't order anything

mysql> select * from customers left join orders on customers.id = orders.customer_id;
+----+------------+-----------+------------------+------+------------+--------+-------------+
| id | first_name | last_name | email            | id   | order_date | amount | customer_id |
+----+------------+-----------+------------------+------+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |    1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |    2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |    3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |    4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |    5 | 1999-04-11 | 450.25 |           5 |
|  3 | David      | Bowie     | david@gmail.com  | NULL | NULL       |   NULL |        NULL |
|  4 | Blue       | Steele    | blue@gmail.com   | NULL | NULL       |   NULL |        NULL |
+----+------------+-----------+------------------+------+------------+--------+-------------+
7 rows in set (0.01 sec)

mysql> select first_name, last_name, ifnull(sum(amount), 0) from customers left join orders on customers.id = orders.customer_id group by amount desc;
+------------+-----------+------------------------+
| first_name | last_name | ifnull(sum(amount), 0) |
+------------+-----------+------------------------+
| George     | Michael   |                 800.67 |
| Bette      | Davis     |                 450.25 |
| Boy        | George    |                  99.99 |
| Boy        | George    |                  35.50 |
| George     | Michael   |                  12.50 |
| David      | Bowie     |                   0.00 |
+------------+-----------+------------------------+
6 rows in set, 1 warning (0.00 sec)

-- Right Joins - select everything from b along with any matching records in a

mysql> select first_name, last_name, order_date, amount from customers right join orders on customers.id = orders.customer_id;
+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 |  12.50 |
| Bette      | Davis     | 1999-04-11 | 450.25 |
+------------+-----------+------------+--------+

/* About deleting (or adding) orders...
 So you cannot add or remove orders due to the foreign key constraint which notifies sql that a customer is dependent on an order and vice versa
 To avoid this make sure you add in a: ON DELETE CASCADE which will specify whether you want your rows deleted in a child table
 when the corresponding rows are deleted in the parent table.
*/

CREATE TABLE orders( id INT AUTO_INCREMENT PRIMARY KEY, order_date DATE, amount DECIMAL(8,2), customer_id INT, FOREIGN KEY(customer_id) REFERENCES customers(id) ON DELETE CASCADE);

-- Other examples

mysql> create table students(id int auto_increment primary key, first_name varchar(100));
Query OK, 0 rows affected (0.09 sec)

mysql> create table papers(title varchar(100), grade char(1), student_id int, foreign key(student_id) references students(id) on delete cascade);
Query OK, 0 rows affected (0.13 sec)

mysql> select first_name, title, grade from students join papers on students.id = papers.student_id;
+------------+---------------------------------------+-------+
| first_name | title                                 | grade |
+------------+---------------------------------------+-------+
| Caleb      | My First Book Report                  | 6     |
| Caleb      | My Second Book Report                 | 7     |
| Samantha   | Russian Lit Through The Ages          | 9     |
| Samantha   | De Montaigne and The Art of The Essay | 9     |
| Carlos     | Borges and Magical Realism            | 8     |
+------------+---------------------------------------+-------+
5 rows in set (0.00 sec)

mysql> select first_name, title, grade from students left join papers on students.id = papers.student_id;
+------------+---------------------------------------+-------+
| first_name | title                                 | grade |
+------------+---------------------------------------+-------+
| Caleb      | My First Book Report                  | 6     |
| Caleb      | My Second Book Report                 | 7     |
| Samantha   | Russian Lit Through The Ages          | 9     |
| Samantha   | De Montaigne and The Art of The Essay | 9     |
| Raj        | NULL                                  | NULL  |
| Carlos     | Borges and Magical Realism            | 8     |
| Lisa       | NULL                                  | NULL  |
+------------+---------------------------------------+-------+
7 rows in set (0.00 sec)

mysql> select first_name, ifnull(title, 'MISSING'), ifnull(grade, 0) from students left join papers on students.id = papers.student_id;
+------------+---------------------------------------+------------------+
| first_name | ifnull(title, 'MISSING')              | ifnull(grade, 0) |
+------------+---------------------------------------+------------------+
| Caleb      | My First Book Report                  | 6                |
| Caleb      | My Second Book Report                 | 7                |
| Samantha   | Russian Lit Through The Ages          | 9                |
| Samantha   | De Montaigne and The Art of The Essay | 9                |
| Raj        | MISSING                               | 0                |
| Carlos     | Borges and Magical Realism            | 8                |
| Lisa       | MISSING                               | 0                |
+------------+---------------------------------------+------------------+
7 rows in set (0.00 sec)

mysql> select first_name, ifnull(avg(grade), 0) as 'average' from students left join papers on students.id = papers.student_id group by students.id order by average desc;
+------------+---------+
| first_name | average |
+------------+---------+
| Samantha   |       9 |
| Carlos     |       8 |
| Caleb      |     6.5 |
| Lisa       |       0 |
| Raj        |       0 |
+------------+---------+
5 rows in set (0.00 sec)

mysql> select first_name, ifnull(avg(grade), 0) as 'average', case when sum(grade) >= 70 then 'PASSING' else 'FAILING' end as 'passing_status' from students left join papers on students.id = papers.student_id group
by students.id order by average desc;
+------------+---------+----------------+
| first_name | average | passing_status |
+------------+---------+----------------+
| Samantha   |       9 | FAILING        |
| Carlos     |       8 | FAILING        |
| Caleb      |     6.5 | FAILING        |
| Raj        |       0 | FAILING        |
| Lisa       |       0 | FAILING        |
+------------+---------+----------------+
5 rows in set (0.00)