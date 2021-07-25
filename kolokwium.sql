MariaDB [(none)]> CREATE DATABASE Dawid_Bitner;
Query OK, 1 row affected (0.16 sec)

MariaDB [(none)]> CREATE TABLE t1(
    -> id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> rodzaj ENUM('osobowy', 'ci©¾arowy'),
    -> marka VARCHAR(15) NOT NULL,
    -> zakup DATETIME)
    -> ENGINE = innodb
    -> default character set utf8 collate utf8_unicode_ci;
ERROR 1046 (3D000): No database selected
MariaDB [(none)]> use Dawid_Bitner
Database changed
MariaDB [Dawid_Bitner]> CREATE TABLE t1(
    -> id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> rodzaj ENUM('osobowy', 'ci©¾arowy'),
    -> marka VARCHAR(15) NOT NULL,
    -> zakup DATETIME)
    -> ENGINE = innodb
    -> default character set utf8 collate utf8_unicode_ci;
Query OK, 0 rows affected (0.84 sec)

MariaDB [Dawid_Bitner]> CREATE TABLE t2(
    -> id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -> kol2 VARCHAR(50) DEFAULT 'OK',
    -> CONSTRAINT obcy FOREIGN KEY(id) REFERENCES t1(id))
    -> ENGINE = innodb
    -> default character set utf8 collate utf8_unicode_ci;
Query OK, 0 rows affected (0.45 sec)

MariaDB [Dawid_Bitner]> INSERT INTO t1 VALUES(1, "osobowy", "kia", "2019-05-26 12:30:00"),
    -> (2, "osobowy", "fiat", NOW()),
    -> (3, "cie¾arowy", "star", "2019-05-28 12:00:00"),
    -> (6, "osobowy", "ford", "2010-10-10 12:00:00");
Query OK, 4 rows affected (0.15 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [Dawid_Bitner]> UPDATE t1 SET marka='polonez' WHERE id=2;
Query OK, 1 row affected (0.17 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [Dawid_Bitner]> SELECT * FROM t1;
+----+-----------+---------+---------------------+
| id | rodzaj    | marka   | zakup               |
+----+-----------+---------+---------------------+
|  1 | osobowy   | kia     | 2019-05-26 12:30:00 |
|  2 | osobowy   | polonez | 2019-05-27 12:34:47 |
|  3 | ci©¾arowy | star    | 2019-05-28 12:00:00 |
|  6 | osobowy   | ford    | 2010-10-10 12:00:00 |
+----+-----------+---------+---------------------+
4 rows in set (0.10 sec)

MariaDB [Dawid_Bitner]> ALTER TABLE t2 CHANGE kol2 k2 INT DEFAULT 13;
Query OK, 0 rows affected (1.66 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [Dawid_Bitner]> SELECT * FROM t2;
Empty set (0.00 sec)

MariaDB [Dawid_Bitner]> desc t2;
+-------+------------------+------+-----+---------+----------------+
| Field | Type             | Null | Key | Default | Extra          |
+-------+------------------+------+-----+---------+----------------+
| id    | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| k2    | int(11)          | YES  |     | 13      |                |
+-------+------------------+------+-----+---------+----------------+
2 rows in set (0.11 sec)

MariaDB [Dawid_Bitner]> SHOW CREATE TABLE t2;
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                                                                       |
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| t2    | CREATE TABLE `t2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `k2` int(11) DEFAULT '13',
  PRIMARY KEY (`id`),
  CONSTRAINT `obcy` FOREIGN KEY (`id`) REFERENCES `t1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci |
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

MariaDB [Dawid_Bitner]> ALTER TABLE t2 DROP FOREIGN KEY obcy;
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [Dawid_Bitner]> INSERT INTO t2 VALUES(3, 9),
    -> (1, 13),
    -> (5, 8),
    -> (2, 2),
    -> (3, 3);
ERROR 1062 (23000): Duplicate entry '3' for key 'PRIMARY'
MariaDB [Dawid_Bitner]> DROP DATABASE Dawid_Bitner;
Query OK, 2 rows affected (0.73 sec)

MariaDB [(none)]> use swiat;
Database changed
MariaDB [swiat]> SELECT name kraj, population ilu, headofstate gˆowa
    -> FROM country
    -> WHERE headofstate LIKE 'A%' OR headofstate LIKE '%i'
    -> AND (population BETWEEN 2e07 AND 4e07)
    -> ORDER BY population DESC;
+--------------------------+-----------+-------------------------------+
| kraj                     | ilu       | gˆowa                         |
+--------------------------+-----------+-------------------------------+
| Indonesia                | 212107000 | Abdurrahman Wahid             |
| Japan                    | 126714000 | Akihito                       |
| Iran                     |  67702000 | Ali Mohammad Khatami-Ardakani |
| Turkey                   |  66591000 | Ahmet Necdet Sezer            |
| Colombia                 |  42321000 | Andr‚s Pastrana Arango        |
| Spain                    |  39441700 | Juan Carlos I                 |
| Poland                   |  38653600 | Aleksander Kwasniewski        |
| Algeria                  |  31471000 | Abdelaziz Bouteflika          |
| Canada                   |  31147000 | Elisabeth II                  |
| Kenya                    |  30080000 | Daniel arap Moi               |
| Morocco                  |  28351000 | Mohammed VI                   |
| Iraq                     |  23115000 | Saddam Hussein al-Takriti     |
| Uganda                   |  21778000 | Yoweri Museveni               |
| Yemen                    |  18112000 | Ali Abdallah Salih            |
| Guatemala                |  11385000 | Alfonso Portillo Cabrera      |
| Mali                     |  11234000 | Alpha Oumar Konar‚            |
| Belgium                  |  10239000 | Albert II                     |
| Belarus                  |  10236000 | Aljaksandr Lukaçenka          |
| Somalia                  |  10097000 | Abdiqassim Salad Hassan       |
| Senegal                  |   9481000 | Abdoulaye Wade                |
| Switzerland              |   7160400 | Adolf Ogi                     |
| Jordan                   |   5083000 | Abdullah II                   |
| Nicaragua                |   5074000 | Arnoldo Alem n Lacayo         |
| Sierra Leone             |   4854000 | Ahmed Tejan Kabbah            |
| Kyrgyzstan               |   4699000 | Askar Akajev                  |
| Bosnia and Herzegovina   |   3972000 | Ante Jelavic                  |
| Central African Republic |   3615000 | Ange-F‚lix Patass‚            |
| Trinidad and Tobago      |   1295000 | Arthur N. R. Robinson         |
| Comoros                  |    578000 | Azali Assoumani               |
| Cape Verde               |    428000 | Ant¢nio Mascarenhas Monteiro  |
+--------------------------+-----------+-------------------------------+
30 rows in set, 3 warnings (0.36 sec)

MariaDB [swiat]> SELECT countrycode AS kod, COUNT(*) AS ile
    -> FROM city
    -> WHERE countrycode LIKE '_O_'
    -> GROUP BY countrycode
    -> ORDER BY ile, kod;
+-----+-----+
| kod | ile |
+-----+-----+
| COK |   1 |
| COM |   1 |
| TON |   1 |
| COG |   2 |
| SOM |   3 |
| JOR |   5 |
| NOR |   5 |
| DOM |   6 |
| BOL |   8 |
| MOZ |  12 |
| COD |  18 |
| ROM |  29 |
| COL |  38 |
| POL |  44 |
| KOR |  70 |
+-----+-----+
15 rows in set, 3 warnings (0.33 sec)

MariaDB [swiat]> SELECT countrycode AS kod, COUNT(*) AS ile
    -> FROM city
    -> WHERE countrycode LIKE '_O_'
    -> GROUP BY countrycode
    -> ORDER BY ile, kod DESC;
+-----+-----+
| kod | ile |
+-----+-----+
| TON |   1 |
| COM |   1 |
| COK |   1 |
| COG |   2 |
| SOM |   3 |
| NOR |   5 |
| JOR |   5 |
| DOM |   6 |
| BOL |   8 |
| MOZ |  12 |
| COD |  18 |
| ROM |  29 |
| COL |  38 |
| POL |  44 |
| KOR |  70 |
+-----+-----+
15 rows in set (0.00 sec)

MariaDB [swiat]> SELECT countrycode AS kod, COUNT(*) AS ile
    -> FROM city
    -> WHERE countrycode LIKE '_O_'
    -> GROUP BY countrycode
    -> ORDER BY ile DESC, kod DESC;
+-----+-----+
| kod | ile |
+-----+-----+
| KOR |  70 |
| POL |  44 |
| COL |  38 |
| ROM |  29 |
| COD |  18 |
| MOZ |  12 |
| BOL |   8 |
| DOM |   6 |
| NOR |   5 |
| JOR |   5 |
| SOM |   3 |
| COG |   2 |
| TON |   1 |
| COM |   1 |
| COK |   1 |
+-----+-----+
15 rows in set (0.00 sec)

MariaDB [swiat]> SELECT DISTINCT headofstate FROM country
    -> WHERE headofstate LIKE '%n';
+-----------------------------+
| headofstate                 |
+-----------------------------+
| Zayid bin Sultan al-Nahayan |
| Robert Kotçarjan            |
| Jiang Zemin                 |
| Kocheril Raman Narayanan    |
| àlafur Ragnar Gr¡msson      |
| Vladimir Voronin            |
| Sellapan Rama Nathan        |
| Milan Kucan                 |
| Abdiqassim Salad Hassan     |
| Tarja Halonen               |
| Ronald Venetiaan            |
| Chen Shui-bian              |
| Arthur N. R. Robinson       |
| Vladimir Putin              |
+-----------------------------+
14 rows in set (0.00 sec)

MariaDB [swiat]> SELECT countrycode, district, COUNT(*)
    -> FROM city
    -> GROUP BY district
    -> HAVING countrycode LIKE 'P__' AND COUNT(*) >= 10
    -> ORDER BY countrycode, COUNT(*);
+-------------+----------------------+----------+
| countrycode | district             | COUNT(*) |
+-------------+----------------------+----------+
| PHL         | Southern Mindanao    |       10 |
| PHL         | National Capital Reg |       16 |
| PHL         | Central Luzon        |       22 |
| PHL         | Southern Tagalog     |       31 |
| POL         | Slaskie              |       14 |
+-------------+----------------------+----------+
5 rows in set (0.10 sec)

MariaDB [swiat]> SELECT countrycode kod, district region, count(*) ile 
    -> FROM city 
    -> GROUP BY countrycode 
    -> HAVING countrycode like "p%" and count(*)>=10 order by 1,3;
+-----+----------------------+-----+
| kod | region               | ile |
+-----+----------------------+-----+
| PAK | Sindh                |  59 |
| PER | Lima                 |  22 |
| PHL | National Capital Reg | 136 |
| POL | Mazowieckie          |  44 |
| PRK | Pyongyang-si         |  13 |
+-----+----------------------+-----+
5 rows in set (0.00 sec)

MariaDB [swiat]> SELECT country.name, country.continent, city.name 
    -> FROM city 
    -> JOIN country ON city.countrycode = country.code AND 
    -> ((LEFT(country.continent,3) = LEFT(city.name,3)) OR (RIGHT(country.continent,3) = RIGHT(city.name,3)));
+---------------+---------------+-----------------+
| name          | continent     | name            |
+---------------+---------------+-----------------+
| Brazil        | South America | Cariacica       |
| Chile         | South America | Arica           |
| Canada        | North America | North York      |
| Cyprus        | Asia          | Nicosia         |
| Peru          | South America | Ica             |
| United States | North America | Norfolk         |
| United States | North America | North Las Vegas |
| United States | North America | Norwalk         |
| United States | North America | Norman          |
| United States | North America | Santa Monica    |
+---------------+---------------+-----------------+
10 rows in set (0.13 sec)

MariaDB [swiat]> SELECT country.name, city.name, countrylanguage.language
    -> FROM country, city, countrylanguage
    -> WHERE country.capital = city.id AND countrylanguage.countrycode = country.code AND 
    -> LENGTH(city.name) > LENGTH(country.name) AND country.continent = "europe" 
    -> AND city.name NOT LIKE "% %" AND city.name NOT LIKE "%-%" AND countrylanguage.isofficial = "T";
+----------+------------+-----------+
| name     | name       | language  |
+----------+------------+-----------+
| Spain    | Madrid     | Spanish   |
| Iceland  | Reykjav¡k  | Icelandic |
| Greece   | Athenai    | Greek     |
| Malta    | Valletta   | English   |
| Malta    | Valletta   | Maltese   |
| Moldova  | Chisinau   | Romanian  |
| Poland   | Warszawa   | Polish    |
| Romania  | Bucuresti  | Romani    |
| Romania  | Bucuresti  | Romanian  |
| Sweden   | Stockholm  | Swedish   |
| Slovakia | Bratislava | Slovak    |
| Slovenia | Ljubljana  | Slovene   |
| Denmark  | K?benhavn  | Danish    |
| Hungary  | Budapest   | Hungarian |
+----------+------------+-----------+
14 rows in set, 3 warnings (0.37 sec)

MariaDB [swiat]> SELECT country.name, city.name
    -> FROM country
    -> LEFT JOIN city ON country.capital = city.id
    -> WHERE country.name like "%y";
+--------------------------------+------------+
| name                           | name       |
+--------------------------------+------------+
| Italy                          | Roma       |
| Norway                         | Oslo       |
| Paraguay                       | Asunci¢n   |
| Germany                        | Berlin     |
| Turkey                         | Ankara     |
| Hungary                        | Budapest   |
| Uruguay                        | Montevideo |
| British Indian Ocean Territory | NULL       |
+--------------------------------+------------+
8 rows in set (0.10 sec)

MariaDB [swiat]> SELECT country.name, city.name
    -> FROM country, city
    -> WHERE country.capital = city.id AND country.gnp > pi() * 
    -> (SELECT AVG(gnp) FROM COUNTRY WHERE continent = "europe");
+----------------+------------+
| name           | name       |
+----------------+------------+
| Brazil         | Bras¡lia   |
| United Kingdom | London     |
| Italy          | Roma       |
| Japan          | Tokyo      |
| China          | Peking     |
| France         | Paris      |
| Germany        | Berlin     |
| United States  | Washington |
+----------------+------------+
8 rows in set (0.10 sec)

MariaDB [swiat]> SELECT wyb.name, countrylanguage.language
    -> FROM country wyb, countrylanguage
    -> WHERE wyb.code = countrylanguage.countrycode AND countrylanguage.isofficial = "T" 
    -> AND wyb.lifeexpectancy > 2 * (SELECT MIN(lifeexpectancy) 
    -> FROM country 
    -> WHERE country.continent = wyb.continent);
+------------------------+----------+
| name                   | language |
+------------------------+----------+
| Libyan Arab Jamahiriya | Arabic   |
| Saint Helena           | English  |
+------------------------+----------+
2 rows in set (0.12 sec)

MariaDB [swiat]> SELECT w1.name, w2.language
    -> FROM country w1, countrylanguage w2
    -> WHERE w1.continent = "europe" AND w1.code = l.countrycode AND w2.isofficial = "T" 
    -> AND w2.language IN (SELECT language 
    -> FROM countrylanguage, country 
    -> WHERE country.code = countrylanguage.countrycode AND 
    -> country.continent = "south america" AND countrylanguage.isofficial = "T");
ERROR 1054 (42S22): Unknown column 'l.countrycode' in 'where clause'
MariaDB [swiat]> SELECT w1.name, w2.language
    -> FROM country w1, countrylanguage w2
    -> WHERE w1.continent = "europe" AND w1.code = w2.countrycode AND w2.isofficial = "T" 
    -> AND w2.language IN (SELECT language 
    -> FROM countrylanguage, country 
    -> WHERE country.code = countrylanguage.countrycode AND 
    -> country.continent = "south america" AND countrylanguage.isofficial = "T"); 
+----------------+------------+
| name           | language   |
+----------------+------------+
| United Kingdom | English    |
| Spain          | Spanish    |
| Gibraltar      | English    |
| Ireland        | English    |
| Malta          | English    |
| Portugal       | Portuguese |
+----------------+------------+
6 rows in set (0.11 sec)

