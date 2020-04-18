mysql> use swiat
Database changed
mysql> create table t(
    -> wiek int,
    -> check(wiek > 0))
    -> engine = innodb;
Query OK, 0 rows affected (0.01 sec)

mysql> insert t value (12, (-4), (pi()));
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert t value (12, (-4), (pi());
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> insert t value 12, (-4), (pi());
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '12, (-4), (pi())' at line 1
mysql> insert t value (12), (-4), (pi());
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from t;
+------+
| wiek |
+------+
|   12 |
|   -4 |
|    3 |
+------+
3 rows in set (0.00 sec)

mysql> drop table t;
Query OK, 0 rows affected (0.02 sec)

mysql> select name kraj, gnpold "co to?"
    -> from country
    -> where 
    -> name like "p%";
+------------------+-----------+
| kraj             | co to?    |
+------------------+-----------+
| Philippines      |  82239.00 |
| Pakistan         |  58549.00 |
| Palau            |      NULL |
| Panama           |   8700.00 |
| Papua New Guinea |   6328.00 |
| Paraguay         |   9555.00 |
| Peru             |  65186.00 |
| Pitcairn         |      NULL |
| Portugal         | 102133.00 |
| Puerto Rico      |  32100.00 |
| Poland           | 135636.00 |
| Palestine        |      NULL |
+------------------+-----------+
12 rows in set (0.01 sec)

mysql> select name kraj, gnpold "co to?"
    -> from country
    -> where 
    -> name like "p%"
    -> and
    -> gnpold = NULL;
Empty set (0.00 sec)

mysql> select name kraj, gnpold "co to?"
    -> from country
    -> where 
    -> name like "p%"
    -> and
    -> gnpold is NULL;
+-----------+--------+
| kraj      | co to? |
+-----------+--------+
| Palau     |   NULL |
| Pitcairn  |   NULL |
| Palestine |   NULL |
+-----------+--------+
3 rows in set (0.00 sec)

mysql> select name kraj, gnpold "co to?"
    -> from country
    -> where 
    -> name like "p%"
    -> and
    -> gnpold is not NULL;
+------------------+-----------+
| kraj             | co to?    |
+------------------+-----------+
| Philippines      |  82239.00 |
| Pakistan         |  58549.00 |
| Panama           |   8700.00 |
| Papua New Guinea |   6328.00 |
| Paraguay         |   9555.00 |
| Peru             |  65186.00 |
| Portugal         | 102133.00 |
| Puerto Rico      |  32100.00 |
| Poland           | 135636.00 |
+------------------+-----------+
9 rows in set (0.00 sec)

mysql> select name kraj, gnpold "co to?"
    -> from country
    -> where 
    -> name like "p%"
    -> and
    -> gnpold not like "%";;
Empty set (0.00 sec)

ERROR: 
No query specified

mysql> select name kraj, gnpold "co to?"
    -> from country
    -> where 
    -> name like "p%"
    -> and
    -> gnpold not like "%";
Empty set (0.00 sec)

mysql> select name kraj, gnpold "co to?"
    -> from country
    -> where 
    -> name like "p%"
    -> and
    -> gnpold like "%";
+------------------+-----------+
| kraj             | co to?    |
+------------------+-----------+
| Philippines      |  82239.00 |
| Pakistan         |  58549.00 |
| Panama           |   8700.00 |
| Papua New Guinea |   6328.00 |
| Paraguay         |   9555.00 |
| Peru             |  65186.00 |
| Portugal         | 102133.00 |
| Puerto Rico      |  32100.00 |
| Poland           | 135636.00 |
+------------------+-----------+
9 rows in set (0.00 sec)

mysql> select 3 + null, null / 12, pi()/0, sqrt(-5), log(0);
+----------+-----------+--------+----------+--------+
| 3 + null | null / 12 | pi()/0 | sqrt(-5) | log(0) |
+----------+-----------+--------+----------+--------+
|     NULL |      NULL |   NULL |     NULL |   NULL |
+----------+-----------+--------+----------+--------+
1 row in set (0.00 sec)

mysql> select 3 + null, null / 12, pi()/0, sqrt(-5), log(0), pow(0,0);
+----------+-----------+--------+----------+--------+----------+
| 3 + null | null / 12 | pi()/0 | sqrt(-5) | log(0) | pow(0,0) |
+----------+-----------+--------+----------+--------+----------+
|     NULL |      NULL |   NULL |     NULL |   NULL |        1 |
+----------+-----------+--------+----------+--------+----------+
1 row in set (0.00 sec)

mysql> select name kraj, ifnull(gnpold, "asdsad") "co to?"), 
    -> from country
    -> where
    -> name like "p%";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '), 
from country
where
name like "p%"' at line 1
mysql> select name kraj, ifnull(gnpold, "asdsad") "co to?", 
    -> 
    -> from country
    -> where
    -> name like "p%";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from country
where
name like "p%"' at line 3
mysql> select name kraj, ifnull(gnpold, "asdsad") "co to?")
    -> 
    -> from country
    -> where
    -> name like "p%";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')

from country
where
name like "p%"' at line 1
mysql> select name kraj, ifnull(gnpold, "sadasd") "co to?"
    -> from country
    -> where
    -> name like "p%";
+------------------+-----------+
| kraj             | co to?    |
+------------------+-----------+
| Philippines      | 82239.00  |
| Pakistan         | 58549.00  |
| Palau            | sadasd    |
| Panama           | 8700.00   |
| Papua New Guinea | 6328.00   |
| Paraguay         | 9555.00   |
| Peru             | 65186.00  |
| Pitcairn         | sadasd    |
| Portugal         | 102133.00 |
| Puerto Rico      | 32100.00  |
| Poland           | 135636.00 |
| Palestine        | sadasd    |
+------------------+-----------+
12 rows in set (0.00 sec)

mysql> select name kraj, gnp, gnpold, gnp-gnpold
    -> from country
    -> where
    -> name like "p%";
+------------------+-----------+-----------+------------+
| kraj             | gnp       | gnpold    | gnp-gnpold |
+------------------+-----------+-----------+------------+
| Philippines      |  65107.00 |  82239.00 |  -17132.00 |
| Pakistan         |  61289.00 |  58549.00 |    2740.00 |
| Palau            |    105.00 |      NULL |       NULL |
| Panama           |   9131.00 |   8700.00 |     431.00 |
| Papua New Guinea |   4988.00 |   6328.00 |   -1340.00 |
| Paraguay         |   8444.00 |   9555.00 |   -1111.00 |
| Peru             |  64140.00 |  65186.00 |   -1046.00 |
| Pitcairn         |      0.00 |      NULL |       NULL |
| Portugal         | 105954.00 | 102133.00 |    3821.00 |
| Puerto Rico      |  34100.00 |  32100.00 |    2000.00 |
| Poland           | 151697.00 | 135636.00 |   16061.00 |
| Palestine        |   4173.00 |      NULL |       NULL |
+------------------+-----------+-----------+------------+
12 rows in set (0.00 sec)

mysql> select name kraj, gnp, ifnull(gnpold, 0) gnpold,
    -> ifnull(gnp*gnpold, 0) "gnp*gnpold"
    -> from country
    -> where
    -> name like "p%";
+------------------+-----------+-----------+----------------+
| kraj             | gnp       | gnpold    | gnp*gnpold     |
+------------------+-----------+-----------+----------------+
| Philippines      |  65107.00 |  82239.00 |  5354334573.00 |
| Pakistan         |  61289.00 |  58549.00 |  3588409661.00 |
| Palau            |    105.00 |      0.00 |           0.00 |
| Panama           |   9131.00 |   8700.00 |    79439700.00 |
| Papua New Guinea |   4988.00 |   6328.00 |    31564064.00 |
| Paraguay         |   8444.00 |   9555.00 |    80682420.00 |
| Peru             |  64140.00 |  65186.00 |  4181030040.00 |
| Pitcairn         |      0.00 |      0.00 |           0.00 |
| Portugal         | 105954.00 | 102133.00 | 10821399882.00 |
| Puerto Rico      |  34100.00 |  32100.00 |  1094610000.00 |
| Poland           | 151697.00 | 135636.00 | 20575574292.00 |
| Palestine        |   4173.00 |      0.00 |           0.00 |
+------------------+-----------+-----------+----------------+
12 rows in set (0.00 sec)

mysql> select name kraj, gnp, ifnull(gnpold, 0) gnpold,
    -> ifnull(gnp+gnpold, 0) "gnp+gnpold"
    -> from country
    -> where
    -> name like "p%";
+------------------+-----------+-----------+------------+
| kraj             | gnp       | gnpold    | gnp+gnpold |
+------------------+-----------+-----------+------------+
| Philippines      |  65107.00 |  82239.00 |  147346.00 |
| Pakistan         |  61289.00 |  58549.00 |  119838.00 |
| Palau            |    105.00 |      0.00 |       0.00 |
| Panama           |   9131.00 |   8700.00 |   17831.00 |
| Papua New Guinea |   4988.00 |   6328.00 |   11316.00 |
| Paraguay         |   8444.00 |   9555.00 |   17999.00 |
| Peru             |  64140.00 |  65186.00 |  129326.00 |
| Pitcairn         |      0.00 |      0.00 |       0.00 |
| Portugal         | 105954.00 | 102133.00 |  208087.00 |
| Puerto Rico      |  34100.00 |  32100.00 |   66200.00 |
| Poland           | 151697.00 | 135636.00 |  287333.00 |
| Palestine        |   4173.00 |      0.00 |       0.00 |
+------------------+-----------+-----------+------------+
12 rows in set (0.00 sec)

mysql> select name kraj, gnp, ifnull(gnpold, 0) gnpold,
    -> ifnull(gnp+gnpold, gnp) "gnp+gnpold"
    -> from country
    -> where
    -> name like "p%";
+------------------+-----------+-----------+------------+
| kraj             | gnp       | gnpold    | gnp+gnpold |
+------------------+-----------+-----------+------------+
| Philippines      |  65107.00 |  82239.00 |  147346.00 |
| Pakistan         |  61289.00 |  58549.00 |  119838.00 |
| Palau            |    105.00 |      0.00 |     105.00 |
| Panama           |   9131.00 |   8700.00 |   17831.00 |
| Papua New Guinea |   4988.00 |   6328.00 |   11316.00 |
| Paraguay         |   8444.00 |   9555.00 |   17999.00 |
| Peru             |  64140.00 |  65186.00 |  129326.00 |
| Pitcairn         |      0.00 |      0.00 |       0.00 |
| Portugal         | 105954.00 | 102133.00 |  208087.00 |
| Puerto Rico      |  34100.00 |  32100.00 |   66200.00 |
| Poland           | 151697.00 | 135636.00 |  287333.00 |
| Palestine        |   4173.00 |      0.00 |    4173.00 |
+------------------+-----------+-----------+------------+
12 rows in set (0.00 sec)

mysql> select concat(name, headofstate) klej, localname
    -> from country
    -> where
    -> name like "p%";
+--------------------------------------+--------------------------------+
| klej                                 | localname                      |
+--------------------------------------+--------------------------------+
| PhilippinesGloria Macapagal-Arroyo   | Pilipinas                      |
| PakistanMohammad Rafiq Tarar         | Pakistan                       |
| PalauKuniwo Nakamura                 | Belau/Palau                    |
| PanamaMireya Elisa Moscoso Rodr¡guez | Panam                          |
| Papua New GuineaElisabeth II         | Papua New Guinea/Papua Niugini |
| ParaguayLuis µngel Gonz lez Macchi   | Paraguay                       |
| PeruValentin Paniagua Corazao        | Per£/Piruw                     |
| PitcairnElisabeth II                 | Pitcairn                       |
| PortugalJorge Samp?io                | Portugal                       |
| Puerto RicoGeorge W. Bush            | Puerto Rico                    |
| PolandAleksander Kwasniewski         | Polska                         |
| PalestineYasser (Yasir) Arafat       | Filastin                       |
+--------------------------------------+--------------------------------+
12 rows in set (0.00 sec)

mysql> select concat(name, " --> ", headofstate) klej, localname
    -> from country
    -> where
    -> name like "p%";
+-------------------------------------------+--------------------------------+
| klej                                      | localname                      |
+-------------------------------------------+--------------------------------+
| Philippines --> Gloria Macapagal-Arroyo   | Pilipinas                      |
| Pakistan --> Mohammad Rafiq Tarar         | Pakistan                       |
| Palau --> Kuniwo Nakamura                 | Belau/Palau                    |
| Panama --> Mireya Elisa Moscoso Rodr¡guez | Panam                          |
| Papua New Guinea --> Elisabeth II         | Papua New Guinea/Papua Niugini |
| Paraguay --> Luis µngel Gonz lez Macchi   | Paraguay                       |
| Peru --> Valentin Paniagua Corazao        | Per£/Piruw                     |
| Pitcairn --> Elisabeth II                 | Pitcairn                       |
| Portugal --> Jorge Samp?io                | Portugal                       |
| Puerto Rico --> George W. Bush            | Puerto Rico                    |
| Poland --> Aleksander Kwasniewski         | Polska                         |
| Palestine --> Yasser (Yasir) Arafat       | Filastin                       |
+-------------------------------------------+--------------------------------+
12 rows in set (0.00 sec)

mysql> select concat(name, headofstate) klej, localname
    -> from country
    -> where
    -> name like "p%"
    -> order by 2;
+--------------------------------------+--------------------------------+
| klej                                 | localname                      |
+--------------------------------------+--------------------------------+
| PalauKuniwo Nakamura                 | Belau/Palau                    |
| PalestineYasser (Yasir) Arafat       | Filastin                       |
| PakistanMohammad Rafiq Tarar         | Pakistan                       |
| PanamaMireya Elisa Moscoso Rodr¡guez | Panam                          |
| Papua New GuineaElisabeth II         | Papua New Guinea/Papua Niugini |
| ParaguayLuis µngel Gonz lez Macchi   | Paraguay                       |
| PeruValentin Paniagua Corazao        | Per£/Piruw                     |
| PhilippinesGloria Macapagal-Arroyo   | Pilipinas                      |
| PitcairnElisabeth II                 | Pitcairn                       |
| PolandAleksander Kwasniewski         | Polska                         |
| PortugalJorge Samp?io                | Portugal                       |
| Puerto RicoGeorge W. Bush            | Puerto Rico                    |
+--------------------------------------+--------------------------------+
12 rows in set (0.00 sec)

mysql> select concat(name, " --> ", headofstate) klej, localname
    -> from country
    -> where
    -> name like "p%"
    -> order by 1 desc;
+-------------------------------------------+--------------------------------+
| klej                                      | localname                      |
+-------------------------------------------+--------------------------------+
| Puerto Rico --> George W. Bush            | Puerto Rico                    |
| Portugal --> Jorge Samp?io                | Portugal                       |
| Poland --> Aleksander Kwasniewski         | Polska                         |
| Pitcairn --> Elisabeth II                 | Pitcairn                       |
| Philippines --> Gloria Macapagal-Arroyo   | Pilipinas                      |
| Peru --> Valentin Paniagua Corazao        | Per£/Piruw                     |
| Paraguay --> Luis µngel Gonz lez Macchi   | Paraguay                       |
| Papua New Guinea --> Elisabeth II         | Papua New Guinea/Papua Niugini |
| Panama --> Mireya Elisa Moscoso Rodr¡guez | Panam                          |
| Palestine --> Yasser (Yasir) Arafat       | Filastin                       |
| Palau --> Kuniwo Nakamura                 | Belau/Palau                    |
| Pakistan --> Mohammad Rafiq Tarar         | Pakistan                       |
+-------------------------------------------+--------------------------------+
12 rows in set (0.00 sec)

mysql> select concat(name, " --> ", headofstate) klej, localname
    -> from country
    -> where
    -> name like "p%"
    -> order by headofstate desc;
+-------------------------------------------+--------------------------------+
| klej                                      | localname                      |
+-------------------------------------------+--------------------------------+
| Palestine --> Yasser (Yasir) Arafat       | Filastin                       |
| Peru --> Valentin Paniagua Corazao        | Per£/Piruw                     |
| Pakistan --> Mohammad Rafiq Tarar         | Pakistan                       |
| Panama --> Mireya Elisa Moscoso Rodr¡guez | Panam                          |
| Paraguay --> Luis µngel Gonz lez Macchi   | Paraguay                       |
| Palau --> Kuniwo Nakamura                 | Belau/Palau                    |
| Portugal --> Jorge Samp?io                | Portugal                       |
| Philippines --> Gloria Macapagal-Arroyo   | Pilipinas                      |
| Puerto Rico --> George W. Bush            | Puerto Rico                    |
| Papua New Guinea --> Elisabeth II         | Papua New Guinea/Papua Niugini |
| Pitcairn --> Elisabeth II                 | Pitcairn                       |
| Poland --> Aleksander Kwasniewski         | Polska                         |
+-------------------------------------------+--------------------------------+
12 rows in set (0.00 sec)

mysql> -- W paästwie Polska rz¥dzi Alex.
mysql> select concat("W paästwie ", name, " rz¥dzi ", headofstate) zdanie
    -> from country
    -> where
    -> name like "p%"
    -> ;
ERROR 1271 (HY000): Illegal mix of collations for operation 'concat'
mysql> select concat("W kraju ", name, " panuje ", headofstate) zdanie
    -> from country
    -> where
    -> name like "p%";
+------------------------------------------------------+
| zdanie                                               |
+------------------------------------------------------+
| W kraju Philippines panuje Gloria Macapagal-Arroyo   |
| W kraju Pakistan panuje Mohammad Rafiq Tarar         |
| W kraju Palau panuje Kuniwo Nakamura                 |
| W kraju Panama panuje Mireya Elisa Moscoso Rodr¡guez |
| W kraju Papua New Guinea panuje Elisabeth II         |
| W kraju Paraguay panuje Luis µngel Gonz lez Macchi   |
| W kraju Peru panuje Valentin Paniagua Corazao        |
| W kraju Pitcairn panuje Elisabeth II                 |
| W kraju Portugal panuje Jorge Samp?io                |
| W kraju Puerto Rico panuje George W. Bush            |
| W kraju Poland panuje Aleksander Kwasniewski         |
| W kraju Palestine panuje Yasser (Yasir) Arafat       |
+------------------------------------------------------+
12 rows in set (0.00 sec)

mysql> create table test(
    -> imie char(12),
    -> kiedy date,
    -> zamawia datetime,
    -> czas time);
Query OK, 0 rows affected (0.00 sec)

mysql> insert test value
    -> ("Ewa", "1997-11-23", "2019-10-17 14:53:11", "12:21:15"),
    -> ("Adam", "1969-01-03", "2019-1-17 14:3:11", "2:21:15"),
    -> ("Adam", "1969-01-03", "2019-1-17 14:3:11", "2:1:5"),
    -> ("Ola", "1969:01:03", "2019.1.17 14:3:11", "2:1:5"),
    -> ("Olaf", "1969-1:03", "2019.1:17 14:3:11", "2::5"),
    -> ("Iza", now(), now(), now());
Query OK, 6 rows affected, 2 warnings (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 2

mysql> select * from test;
+------+------------+---------------------+----------+
| imie | kiedy      | zamawia             | czas     |
+------+------------+---------------------+----------+
| Ewa  | 1997-11-23 | 2019-10-17 14:53:11 | 12:21:15 |
| Adam | 1969-01-03 | 2019-01-17 14:03:11 | 02:21:15 |
| Adam | 1969-01-03 | 2019-01-17 14:03:11 | 02:01:05 |
| Ola  | 1969-01-03 | 2019-01-17 14:03:11 | 02:01:05 |
| Olaf | 1969-01-03 | 2019-01-17 14:03:11 | 00:00:02 |
| Iza  | 2019-03-18 | 2019-03-18 11:13:08 | 11:13:08 |
+------+------------+---------------------+----------+
6 rows in set (0.00 sec)

mysql> select current_date() "1",
    -> current_time() "2",
    -> date_format(current_date(), "%Y..||.. %W $^$ %d @@##@@ %") "3",
    -> time_format(current_date(), "%H -||- %s ;;; %h <> %i") "4";
+------------+----------+-----------------------------------+-------------------------+
| 1          | 2        | 3                                 | 4                       |
+------------+----------+-----------------------------------+-------------------------+
| 2019-03-18 | 11:20:27 | 2019..||.. Monday $^$ 18 @@##@@ % | 00 -||- 19 ;;; 12 <> 20 |
+------------+----------+-----------------------------------+-------------------------+
1 row in set, 1 warning (0.01 sec)

mysql> select year(now()), month(now()), day(now());
+-------------+--------------+------------+
| year(now()) | month(now()) | day(now()) |
+-------------+--------------+------------+
|        2019 |            3 |         18 |
+-------------+--------------+------------+
1 row in set (0.00 sec)

mysql> select Imie, year(now())-year(kiedy) wiek from test;
+------+------+
| Imie | wiek |
+------+------+
| Ewa  |   22 |
| Adam |   50 |
| Adam |   50 |
| Ola  |   50 |
| Olaf |   50 |
| Iza  |    0 |
+------+------+
6 rows in set (0.00 sec)

mysql> select Imie, now()-year(kiedy) wiek from test;
+------+-----------------------+
| Imie | wiek                  |
+------+-----------------------+
| Ewa  | 20190318110836.000000 |
| Adam | 20190318110864.000000 |
| Adam | 20190318110864.000000 |
| Ola  | 20190318110864.000000 |
| Olaf | 20190318110864.000000 |
| Iza  | 20190318110814.000000 |
+------+-----------------------+
6 rows in set (0.00 sec)

mysql> select Imie, now()-kiedy wiek from test;
+------+----------------+
| Imie | wiek           |
+------+----------------+
| Ewa  | 20190298141724 |
| Adam | 20190298422744 |
| Adam | 20190298422744 |
| Ola  | 20190298422744 |
| Olaf | 20190298422744 |
| Iza  | 20190297922529 |
+------+----------------+
6 rows in set (0.00 sec)

mysql> select length("asdsad sad sadasd") dˆ;
+----+
| dˆ |
+----+
| 17 |
+----+
1 row in set (0.00 sec)

mysql> slect UPPER("S ad dasd  SDsadsa") zw;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'slect UPPER("S ad dasd  SDsadsa") zw' at line 1
mysql> select UPPER("S ad dasd  SDsadsa") zw;
+--------------------+
| zw                 |
+--------------------+
| S AD DASD  SDSADSA |
+--------------------+
1 row in set (0.00 sec)

mysql> select lower("SdsdS SDas dsa da") zm;
+-------------------+
| zm                |
+-------------------+
| sdsds sdas dsa da |
+-------------------+
1 row in set (0.00 sec)

mysql> select left("SdsdS SDas dsa da") zm;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ') zm' at line 1
mysql> select left("SdsdS SDas dsa da",5) zm;
+-------+
| zm    |
+-------+
| SdsdS |
+-------+
1 row in set (0.00 sec)

mysql> select right("SdsdS SDas dsa da",5) zm;
+-------+
| zm    |
+-------+
| sa da |
+-------+
1 row in set (0.00 sec)

mysql> insert test value
    -> ("krySIA", now(), now(), now());
Query OK, 1 row affected, 1 warning (0.02 sec)

mysql> select concat(upper(left(imie,1)),lower(imie, right(length(imie)-1))) imie
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '))) imie' at line 1
mysql> select concat(upper(left(imie,1)),lower(imie, right(length(imie)-1)))) imie;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')))) imie' at line 1
mysql> select concat(upper(left(imie,1)),lower(imie, right(length(imie)-1)) imie;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')) imie' at line 1
mysql> select concat(upper(left(imie,1)),lower(right(imie, length(imie)-1))) imie;
ERROR 1054 (42S22): Unknown column 'imie' in 'field list'
mysql> select concat(upper(left(imie,1)),lower(right(imie, length(imie)-1))) imie from test;
+--------+
| imie   |
+--------+
| Ewa    |
| Adam   |
| Adam   |
| Ola    |
| Olaf   |
| Iza    |
| Krysia |
+--------+
7 rows in set (0.00 sec)

mysql> insert test value
    -> ("Ula    ", now(), now(), now());
Query OK, 1 row affected, 1 warning (0.02 sec)

mysql> select if(12>9, "tka", "nie") sd;
+-----+
| sd  |
+-----+
| tka |
+-----+
1 row in set (0.00 sec)

mysql> select if(12>90, "tka", "nie") sd;
+-----+
| sd  |
+-----+
| nie |
+-----+
1 row in set (0.00 sec)

mysql> select imie, if(right(imie, 1)= "a", "pani", "pan") pˆe† from test;
+--------+------+
| imie   | pˆe† |
+--------+------+
| Ewa    | pani |
| Adam   | pan  |
| Adam   | pan  |
| Ola    | pani |
| Olaf   | pan  |
| Iza    | pani |
| krySIA | pani |
| Ula    | pani |
+--------+------+
8 rows in set (0.00 sec)

mysql> alter table test
    -> modify imie varchar(12);
Query OK, 8 rows affected (0.02 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> insert test value
    -> ("Kaka    ", now(), now(), now());
Query OK, 1 row affected, 1 warning (0.00 sec)

mysql> select imie, if(right(imie, 1)= "a", "pani", "pan") pˆe† from test;
+----------+------+
| imie     | pˆe† |
+----------+------+
| Ewa      | pani |
| Adam     | pan  |
| Adam     | pan  |
| Ola      | pani |
| Olaf     | pan  |
| Iza      | pani |
| krySIA   | pani |
| Ula      | pani |
| Kaka     | pan  |
+----------+------+
9 rows in set (0.00 sec)

mysql> select ltrim("  sadasdsa das as dsa  ") lewa;
+-----------------------+
| lewa                  |
+-----------------------+
| sadasdsa das as dsa   |
+-----------------------+
1 row in set (0.00 sec)

mysql> select rtrim("  sadasdsa das as dsa  ") lewa;
+-----------------------+
| lewa                  |
+-----------------------+
|   sadasdsa das as dsa |
+-----------------------+
1 row in set (0.00 sec)

mysql> select trim("  sadasdsa das as dsa  ") lewa;
+---------------------+
| lewa                |
+---------------------+
| sadasdsa das as dsa |
+---------------------+
1 row in set (0.00 sec)

mysql> select imie, if(right(rtrim(imie), 1)= "a", "pani", "pan") pˆe† from test;
+----------+------+
| imie     | pˆe† |
+----------+------+
| Ewa      | pani |
| Adam     | pan  |
| Adam     | pan  |
| Ola      | pani |
| Olaf     | pan  |
| Iza      | pani |
| krySIA   | pani |
| Ula      | pani |
| Kaka     | pani |
+----------+------+
9 rows in set (0.00 sec)

