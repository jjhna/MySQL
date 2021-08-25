-- When you need to show a list of all the database in the system
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| c9                 |
| cat_app            |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.03 sec)

-- To create a new database called shirts_db
mysql> create database shirts_db;
Query OK, 1 row affected (0.01 sec)


-- When you need to use a specific database, in this case we are using the database: cat_app
-- You must do this before accessing any tables 
mysql> use cat_app;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

-- shows the current database that is being used 
Database changed
mysql> select database();
+------------+
| database() |
+------------+
| cat_app    |
+------------+
1 row in set (0.00 sec)

-- Creates a new table with the list of columns and data type that each column will used
-- also note that you can make each column nullable or not nullable
-- also you can set the deault value of a column when an input isn't specifiedALTER
-- also you can set the primary key to a certain column, also the int id is automatically incremented when new data is entered
mysql> create table employees (id int not null auto_increment, last_name varchar(100) not null, first_name varchar(100) not null, middle_name varchar(100), age int not null, current_status varchar(100) not null default 'employed', primary key(id));
ERROR 1050 (42S01): Table 'employees' already exists

-- the command to select all the columns from the employees table
mysql> select * from employees;
+----+-----------+------------+-------------+-----+----------------+
| id | last_name | first_name | middle_name | age | current_status |
+----+-----------+------------+-------------+-----+----------------+
|  1 | explorer  | Dora       | NULL        |  99 | employed       |
+----+-----------+------------+-------------+-----+----------------+
1 row in set (0.00 sec)

-- adding new data into the employees table specified 3 columns with the 3 added values
mysql> insert into employees(first_name, last_name, age) values ('Dora', 'explorer', 99);
Query OK, 1 row affected (0.01 sec)

-- erases or deltes an entire table, in this case the employees table is removed for good.
mysql> drop table employees;