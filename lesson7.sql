-- This lesson is to learn how to use sql files into the terminal using the command source

mysql> use cat_app;
Database changed
mysql> source first_file.sql;
Query OK, 0 rows affected (0.06 sec)

mysql> desc cats;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| cat_id | int(11)      | NO   | PRI | NULL    | auto_increment |
| name   | varchar(100) | YES  |     | NULL    |                |
| age    | int(11)      | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
3 rows in set (0.08 sec)

mysql> source testing/insert.sql;
Query OK, 1 row affected (0.02 sec)

Query OK, 1 row affected (0.01 sec)

+--------+---------+------+
| cat_id | name    | age  |
+--------+---------+------+
|      1 | Charlie |   17 |
|      2 | Connie  |   10 |
+--------+---------+------+
2 rows in set (0.00 sec)

mysql> select author_fname as first, author_lname as last,
    -> concat (author_fname, ' ' , author_lname) as full
    -> from books;
+---------+----------------+----------------------+
| first   | last           | full                 |
+---------+----------------+----------------------+
| Jhumpa  | Lahiri         | Jhumpa Lahiri        |
| Neil    | Gaiman         | Neil Gaiman          |
| Neil    | Gaiman         | Neil Gaiman          |
| Jhumpa  | Lahiri         | Jhumpa Lahiri        |
| Dave    | Eggers         | Dave Eggers          |
| Dave    | Eggers         | Dave Eggers          |
| Michael | Chabon         | Michael Chabon       |
| Patti   | Smith          | Patti Smith          |
| Dave    | Eggers         | Dave Eggers          |
| Neil    | Gaiman         | Neil Gaiman          |
| Raymond | Carver         | Raymond Carver       |
| Raymond | Carver         | Raymond Carver       |
| Don     | DeLillo        | Don DeLillo          |
| John    | Steinbeck      | John Steinbeck       |
| David   | Foster Wallace | David Foster Wallace |
| David   | Foster Wallace | David Foster Wallace |
+---------+----------------+----------------------+
16 rows in set (0.00 sec)

W
mysql> select
    -> concat_ws(' - ', title, author_fname, author_lname)
    -> from books;
+------------------------------------------------------------------------+
| concat_ws(' - ', title, author_fname, author_lname)                    |
+------------------------------------------------------------------------+
| The Namesake - Jhumpa - Lahiri                                         |
| Norse Mythology - Neil - Gaiman                                        |
| American Gods - Neil - Gaiman                                          |
| Interpreter of Maladies - Jhumpa - Lahiri                              |
| A Hologram for the King: A Novel - Dave - Eggers                       |
| The Circle - Dave - Eggers                                             |
| The Amazing Adventures of Kavalier & Clay - Michael - Chabon           |
| Just Kids - Patti - Smith                                              |
| A Heartbreaking Work of Staggering Genius - Dave - Eggers              |
| Coraline - Neil - Gaiman                                               |
| What We Talk About When We Talk About Love: Stories - Raymond - Carver |
| Where Im Calling From: Selected Stories - Raymond - Carver            |
| White Noise - Don - DeLillo                                            |
| Cannery Row - John - Steinbeck                                         |
| Oblivion: Stories - David - Foster Wallace                             |
| Consider the Lobster - David - Foster Wallace                          |
+------------------------------------------------------------------------+
16 rows in set (0.01 sec)

-- This is the context for the substring command

mysql> select substring(title, 1, 10) from books;
+-------------------------+
| substring(title, 1, 10) |
+-------------------------+
| The Namesa              |
| Norse Myth              |
| American G              |
| Interprete              |
| A Hologram              |
| The Circle              |
| The Amazin              |
| Just Kids               |
| A Heartbre              |
| Coraline                |
| What We Ta              |
| Where Im               |
| White Nois              |
| Cannery Ro              |
| Oblivion:               |
| Consider t              |
+-------------------------+
16 rows in set (0.01 sec)

mysql> select substr(title, 1, 10) as 'short title' from books;
+-------------+
| short title |
+-------------+
| The Namesa  |
| Norse Myth  |
| American G  |
| Interprete  |
| A Hologram  |
| The Circle  |
| The Amazin  |
| Just Kids   |
| A Heartbre  |
| Coraline    |
| What We Ta  |
| Where Im   |
| White Nois  |
| Cannery Ro  |
| Oblivion:   |
| Consider t  |
+-------------+
16 rows in set (0.00 sec)

mysql> select substr('hello wrld', 7);
+-------------------------+
| substr('hello wrld', 7) |
+-------------------------+
| wrld                    |
+-------------------------+
1 row in set (0.00 sec)

mysql> select substr('hello wrld', -3);
+--------------------------+
| substr('hello wrld', -3) |
+--------------------------+
| rld                      |
+--------------------------+
1 row in set (0.01 sec)

-- This is the context for the replace command

mysql> select replace(title, 'e', '3') from books;
+-----------------------------------------------------+
| replace(title, 'e', '3')                            |
+-----------------------------------------------------+
| Th3 Nam3sak3                                        |
| Nors3 Mythology                                     |
| Am3rican Gods                                       |
| Int3rpr3t3r of Maladi3s                             |
| A Hologram for th3 King: A Nov3l                    |
| Th3 Circl3                                          |
| Th3 Amazing Adv3ntur3s of Kavali3r & Clay           |
| Just Kids                                           |
| A H3artbr3aking Work of Stagg3ring G3nius           |
| Coralin3                                            |
| What W3 Talk About Wh3n W3 Talk About Lov3: Stori3s |
| Wh3r3 Im Calling From: S3l3ct3d Stori3s            |
| Whit3 Nois3                                         |
| Cann3ry Row                                         |
| Oblivion: Stori3s                                   |
| Consid3r th3 Lobst3r                                |
+-----------------------------------------------------+
16 rows in set (0.00 sec)

-- This is the context for the reverse command

mysql> select reverse(title) from books;
+-----------------------------------------------------+
| reverse(title)                                      |
+-----------------------------------------------------+
| ekasemaN ehT                                        |
| ygolohtyM esroN                                     |
| sdoG naciremA                                       |
| seidalaM fo reterpretnI                             |
| levoN A :gniK eht rof margoloH A                    |
| elcriC ehT                                          |
| yalC & reilavaK fo serutnevdA gnizamA ehT           |
| sdiK tsuJ                                           |
| suineG gnireggatS fo kroW gnikaerbtraeH A           |
| enilaroC                                            |
| seirotS :evoL tuobA klaT eW nehW tuobA klaT eW tahW |
| seirotS detceleS :morF gnillaC mI erehW            |
| esioN etihW                                         |
| woR yrennaC                                         |
| seirotS :noivilbO                                   |
| retsboL eht redisnoC                                |
+-----------------------------------------------------+
16 rows in set (0.00 sec)

mysql> select concat('woof', reverse('woof'));
+---------------------------------+
| concat('woof', reverse('woof')) |
+---------------------------------+
| wooffoow                        |
+---------------------------------+
1 row in set (0.00 sec)

-- This is the context of the char length command

mysql> select author_fname, char_length(author_fname) as 'length' from books;
+--------------+--------+
| author_fname | length |
+--------------+--------+
| Jhumpa       |      6 |
| Neil         |      4 |
| Neil         |      4 |
| Jhumpa       |      6 |
| Dave         |      4 |
| Dave         |      4 |
| Michael      |      7 |
| Patti        |      5 |
| Dave         |      4 |
| Neil         |      4 |
| Raymond      |      7 |
| Raymond      |      7 |
| Don          |      3 |
| John         |      4 |
| David        |      5 |
| David        |      5 |
+--------------+--------+
16 rows in set (0.02 sec)

-- NOTE you can use SQL formatter online to format any sql context
-- This is the context of UPPER and LOWER commands

mysql> select upper(title) from books;
+-----------------------------------------------------+
| upper(title)                                        |
+-----------------------------------------------------+
| THE NAMESAKE                                        |
| NORSE MYTHOLOGY                                     |
| AMERICAN GODS                                       |
| INTERPRETER OF MALADIES                             |
| A HOLOGRAM FOR THE KING: A NOVEL                    |
| THE CIRCLE                                          |
| THE AMAZING ADVENTURES OF KAVALIER & CLAY           |
| JUST KIDS                                           |
| A HEARTBREAKING WORK OF STAGGERING GENIUS           |
| CORALINE                                            |
| WHAT WE TALK ABOUT WHEN WE TALK ABOUT LOVE: STORIES |
| WHERE IM CALLING FROM: SELECTED STORIES            |
| WHITE NOISE                                         |
| CANNERY ROW                                         |
| OBLIVION: STORIES                                   |
| CONSIDER THE LOBSTER                                |
+-----------------------------------------------------+
16 rows in set (0.08 sec)

mysql> select concat('MY FAVORITE BOK IS ', lower(title)) from books;
+------------------------------------------------------------------------+
| concat('MY FAVORITE BOK IS ', lower(title))                            |
+------------------------------------------------------------------------+
| MY FAVORITE BOK IS the namesake                                        |
| MY FAVORITE BOK IS norse mythology                                     |
| MY FAVORITE BOK IS american gods                                       |
| MY FAVORITE BOK IS interpreter of maladies                             |
| MY FAVORITE BOK IS a hologram for the king: a novel                    |
| MY FAVORITE BOK IS the circle                                          |
| MY FAVORITE BOK IS the amazing adventures of kavalier & clay           |
| MY FAVORITE BOK IS just kids                                           |
| MY FAVORITE BOK IS a heartbreaking work of staggering genius           |
| MY FAVORITE BOK IS coraline                                            |
| MY FAVORITE BOK IS what we talk about when we talk about love: stories |
| MY FAVORITE BOK IS where im calling from: selected stories             |
| MY FAVORITE BOK IS white noise                                         |
| MY FAVORITE BOK IS cannery row                                         |
| MY FAVORITE BOK IS oblivion: stories                                   |
| MY FAVORITE BOK IS consider the lobster                                |
+------------------------------------------------------------------------+
16 rows in set (0.08 sec)

-- an example of both using upper and reverse commands

mysql> select upper(reverse('Why does my cat look at me with such hatred?'));
+----------------------------------------------------------------+
| upper(reverse('Why does my cat look at me with such hatred?')) |
+----------------------------------------------------------------+
| ?DERTAH HCUS HTIW EM TA KOOL TAC YM SEOD YHW                   |
+----------------------------------------------------------------+
1 row in set (0.00 sec)

-- other misc examples

mysql> select replace(title, ' ', '->') from books;
+--------------------------------------------------------------+
| replace(title, ' ', '->')                                    |
+--------------------------------------------------------------+
| The->Namesake                                                |
| Norse->Mythology                                             |
| American->Gods                                               |
| Interpreter->of->Maladies                                    |
| A->Hologram->for->the->King:->A->Novel                       |
| The->Circle                                                  |
| The->Amazing->Adventures->of->Kavalier->&->Clay              |
| Just->Kids                                                   |
| A->Heartbreaking->Work->of->Staggering->Genius               |
| Coraline                                                     |
| What->We->Talk->About->When->We->Talk->About->Love:->Stories |
| where->im->calling->from:->selected->stories                 |
| White->Noise                                                 |
| Cannery->Row                                                 |
| Oblivion:->Stories                                           |
| Consider->the->Lobster                                       |
+--------------------------------------------------------------+
16 rows in set (0.00 sec)

mysql> select concat(upper(author_fname), ' ', upper(author_lname)) as 'full name in caps' from books;
+----------------------+
| full name in caps    |
+----------------------+
| JHUMPA LAHIRI        |
| NEIL GAIMAN          |
| NEIL GAIMAN          |
| JHUMPA LAHIRI        |
| DAVE EGGERS          |
| DAVE EGGERS          |
| MICHAEL CHABON       |
| PATTI SMITH          |
| DAVE EGGERS          |
| NEIL GAIMAN          |
| RAYMOND CARVER       |
| RAYMOND CARVER       |
| DON DELILLO          |
| JOHN STEINBECK       |
| DAVID FOSTER WALLACE |
| DAVID FOSTER WALLACE |
+----------------------+
16 rows in set (0.00 sec)

mysql> select concat(substr(title, 1, 10), '...') as 'short title', concat(author_lname, ',',  author_fname) as 'author', concat (stock_quantity, ' in stock') as 'quantity'  from books;
+---------------+----------------------+--------------+
| short title   | author               | quantity     |
+---------------+----------------------+--------------+
| The Namesa... | Lahiri,Jhumpa        | 32 in stock  |
| Norse Myth... | Gaiman,Neil          | 43 in stock  |
| American G... | Gaiman,Neil          | 12 in stock  |
| Interprete... | Lahiri,Jhumpa        | 97 in stock  |
| A Hologram... | Eggers,Dave          | 154 in stock |
| The Circle... | Eggers,Dave          | 26 in stock  |
| The Amazin... | Chabon,Michael       | 68 in stock  |
| Just Kids...  | Smith,Patti          | 55 in stock  |
| A Heartbre... | Eggers,Dave          | 104 in stock |
| Coraline...   | Gaiman,Neil          | 100 in stock |
| What We Ta... | Carver,Raymond       | 23 in stock  |
| where im c... | Carver,Raymond       | 12 in stock  |
| White Nois... | DeLillo,Don          | 49 in stock  |
| Cannery Ro... | Steinbeck,John       | 95 in stock  |
| Oblivion: ... | Foster Wallace,David | 172 in stock |
| Consider t... | Foster Wallace,David | 92 in stock  |
+---------------+----------------------+--------------+
16 rows in set (0.00 sec)