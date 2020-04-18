mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| webserv            |
+--------------------+
4 rows in set (0.00 sec)
mysql> +--------------------+
    -> | Database           |
    -> 
    -> 
    -> 
    -> create database bro;  
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '+--------------------+
| Database           |



create database bro' at line 1
mysql> create database bro;
Query OK, 1 row affected (0.00 sec)

mysql> use bro
Database changed
mysql> show tables;
Empty set (0.00 sec)

mysql> create table osoby(
    -> id_o tinyint unsigned not null auto_increment,
    -> imie char(12) not null,
    -> nazwisko char(21) not null,
    -> wiek tinyint,
    -> miasto char(31) default "Nibylandia",
    -> primary key (id_o))
    -> engine=innodb
    -> default character set utf8 collate utf8_unicode_ci;
Query OK, 0 rows affected (0.02 sec)

mysql> showtable 
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'showtable' at line 1
mysql> show tables;
+---------------+
| Tables_in_bro |
+---------------+
| osoby         |
+---------------+
1 row in set (0.00 sec)

mysql> show osoby
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'osoby' at line 1
mysql> showtable osoby;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'showtable osoby' at line 1
mysql> desc osoby
    -> ;
+----------+---------------------+------+-----+------------+----------------+
| Field    | Type                | Null | Key | Default    | Extra          |
+----------+---------------------+------+-----+------------+----------------+
| id_o     | tinyint(3) unsigned | NO   | PRI | NULL       | auto_increment |
| imie     | char(12)            | NO   |     | NULL       |                |
| nazwisko | char(21)            | NO   |     | NULL       |                |
| wiek     | tinyint(4)          | YES  |     | NULL       |                |
| miasto   | char(31)            | YES  |     | Nibylandia |                |
+----------+---------------------+------+-----+------------+----------------+
5 rows in set (0.02 sec)

mysql> create table telefony(
    -> id_t tinyint unsigned not null auto_increment,
    -> numer char(9) not null,
    -> typ enum("stacjonarny", "kom¢rka") not null default "kom¢rka",
    -> operator enum("play", "orange", "ATM", "era") not null,
    -> primary key(id_t))
    -> engine=innodb
    -> default character set utf8 collate utf8_unicode_ci;
Query OK, 0 rows affected (0.02 sec)

mysql> create table scal(
    -> id_s tinyint unsigned not null auto_increment,
    -> id_o tinyint unsigned not null,
    -> id_t tinyint unsigned not null,
    -> primary key(id_s),
    -> foreign key(id_o) refereces osoby(id_o),
    -> foreign key(id_t) refereces telefony(id_t))
    -> engine=innodb
    -> default character set utf8 collate utf8_unicode_ci;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'refereces osoby(id_o),
foreign key(id_t) refereces telefony(id_t))
engine=innodb' at line 6
mysql> create table scal(
    -> id_s tinyint unsigned not null auto_increment,
    -> id_o tinyint unsigned not null,
    -> id_t tinyint unsigned not null,
    -> primary key(id_s),
    -> foreign key(id_o) references osoby(id_o),
    -> foreign key(id_t) references telefony(id_t))
    -> engine=innodb
    -> default character set utf8 collate utf8_unicode_ci;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from osoby;
Empty set (0.00 sec)

mysql> insert into osoby 
    -> (id_o, imie, nazwisko, wiek, miasto)
    -> values
    -> (1, "Ola", "lis", 20, "Zabrze");
Query OK, 1 row affected (0.00 sec)

mysql> select * from osoby;
+------+------+----------+------+--------+
| id_o | imie | nazwisko | wiek | miasto |
+------+------+----------+------+--------+
|    1 | Ola  | lis      |   20 | Zabrze |
+------+------+----------+------+--------+
1 row in set (0.00 sec)

mysql> insert osoby
    -> value
    -> (2, "Ela", "Pis", 23, "Mysiog¢ra");
Query OK, 1 row affected (0.00 sec)

mysql> insert osoby
    -> value
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 2
mysql> insert osoby
    -> (imie, wiek, nazwisko)
    -> value
    -> ("Adam", 44, "Mickiewicz");
Query OK, 1 row affected (0.00 sec)

mysql> select * from osoby;
+------+------+------------+------+------------+
| id_o | imie | nazwisko   | wiek | miasto     |
+------+------+------------+------+------------+
|    1 | Ola  | lis        |   20 | Zabrze     |
|    2 | Ela  | Pis        |   23 | Mysiog¢ra  |
|    3 | Adam | Mickiewicz |   44 | Nibylandia |
+------+------+------------+------+------------+
3 rows in set (0.00 sec)

mysql> insert telefony value
    -> (1, "123123123", "stacjonarny", "tp");
Query OK, 1 row affected, 1 warning (0.01 sec)

mysql> select * from telefony;
+------+-----------+-------------+----------+
| id_t | numer     | typ         | operator |
+------+-----------+-------------+----------+
|    1 | 123123123 | stacjonarny |          |
+------+-----------+-------------+----------+
1 row in set (0.00 sec)

mysql> insert telefony (numer, operator) value
    -> ("32423424", "orange"), (456456456, "era"), (333333333, "ATM"0;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '0' at line 2
mysql> ("32423424", "orange"), (456456456, "era"), (333333333, "ATM");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '"32423424", "orange"), (456456456, "era"), (333333333, "ATM")' at line 1
mysql> insert telefony (numer, operator) value
    -> ("32423424", "orange"), (456456456, "era"), (333333333, "ATM");
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from telefony;
+------+-----------+-------------+----------+
| id_t | numer     | typ         | operator |
+------+-----------+-------------+----------+
|    1 | 123123123 | stacjonarny |          |
|    2 | 32423424  | kom¢rka     | orange   |
|    3 | 456456456 | kom¢rka     | era      |
|    4 | 333333333 | kom¢rka     | ATM      |
+------+-----------+-------------+----------+
4 rows in set (0.00 sec)

mysql> insert scal calue (1,1,2), (2,1,4), (3,2,2), (4,3,1)
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'calue (1,1,2), (2,1,4), (3,2,2), (4,3,1)' at line 1
mysql> insert scal value (1,1,2), (2,1,4), (3,2,2), (4,3,1)
    -> )
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 2
mysql> 
mysql> insert scal value (1,1,2), (2,1,4), (3,2,2), (4,3,1);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from scal;
+------+------+------+
| id_s | id_o | id_t |
+------+------+------+
|    1 |    1 |    2 |
|    2 |    1 |    4 |
|    3 |    2 |    2 |
|    4 |    3 |    1 |
+------+------+------+
4 rows in set (0.00 sec)

