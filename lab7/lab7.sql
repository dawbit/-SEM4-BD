mysql> use swiat
Database changed
mysql> select name kraj, continent kontynent, headofstate szef, population lud
    -> from country
    -> order by 4 desc
    -> limit 1;
+-------+-----------+-------------+------------+
| kraj  | kontynent | szef        | lud        |
+-------+-----------+-------------+------------+
| China | Asia      | Jiang Zemin | 1277558000 |
+-------+-----------+-------------+------------+
1 row in set (0.01 sec)

mysql> select name kraj, continent kontynent, headofstate szef, population lud
    -> from country
    -> where
    -> population = (select max(population) from country);
+-------+-----------+-------------+------------+
| kraj  | kontynent | szef        | lud        |
+-------+-----------+-------------+------------+
| China | Asia      | Jiang Zemin | 1277558000 |
+-------+-----------+-------------+------------+
1 row in set (0.00 sec)

mysql> select name kraj, continent kontynent, headofstate szef, population lud
    -> from country
    -> where
    -> population = (select avg(population) from country);
Empty set (0.02 sec)

mysql> select name kraj, continent kontynent, headofstate szef, population lud
    -> from country
    -> where
    -> population < (select avg(population) from country) + 2e6
    -> and
    -> population > (select avg(population) from country) - 2e6
    -> order by 4;
+-------------+---------------+---------------------------+----------+
| kraj        | kontynent     | szef                      | lud      |
+-------------+---------------+---------------------------+----------+
| Nepal       | Asia          | Gyanendra Bir Bikram      | 23930000 |
| North Korea | Asia          | Kim Jong-il               | 24039000 |
| Venezuela   | South America | Hugo Ch vez Fr¡as         | 24170000 |
| Uzbekistan  | Asia          | Islam Karimov             | 24318000 |
| Peru        | South America | Valentin Paniagua Corazao | 25662000 |
+-------------+---------------+---------------------------+----------+
5 rows in set (0.01 sec)

mysql> select name kraj, continent kontynent, headofstate szef, population lud
    -> from country
    -> where
    -> abs(population - (select avg(population) from country)) < 2e6
    -> order by 4;
+-------------+---------------+---------------------------+----------+
| kraj        | kontynent     | szef                      | lud      |
+-------------+---------------+---------------------------+----------+
| Nepal       | Asia          | Gyanendra Bir Bikram      | 23930000 |
| North Korea | Asia          | Kim Jong-il               | 24039000 |
| Venezuela   | South America | Hugo Ch vez Fr¡as         | 24170000 |
| Uzbekistan  | Asia          | Islam Karimov             | 24318000 |
| Peru        | South America | Valentin Paniagua Corazao | 25662000 |
+-------------+---------------+---------------------------+----------+
5 rows in set (0.00 sec)

mysql> select k.name kraj, m.name stolica, continent kontynent, headofstate szef, k.population lud
    -> from country k, city m
    -> where
    -> capital = id
    -> and
    -> k.population between 
    -> (select avg(population) from country) - 2e6
    -> and
    -> (select avg(population) from country) + 2e6
    -> order by 5;
+-------------+-----------+---------------+---------------------------+----------+
| kraj        | stolica   | kontynent     | szef                      | lud      |
+-------------+-----------+---------------+---------------------------+----------+
| Nepal       | Kathmandu | Asia          | Gyanendra Bir Bikram      | 23930000 |
| North Korea | Pyongyang | Asia          | Kim Jong-il               | 24039000 |
| Venezuela   | Caracas   | South America | Hugo Ch vez Fr¡as         | 24170000 |
| Uzbekistan  | Toskent   | Asia          | Islam Karimov             | 24318000 |
| Peru        | Lima      | South America | Valentin Paniagua Corazao | 25662000 |
+-------------+-----------+---------------+---------------------------+----------+
5 rows in set (0.02 sec)

mysql> select name kraj, continent kontynent, headofstate szef, population lud
    -> from country
    -> where
    -> continent = "europe"
    -> and
    -> population = 
    -> (select max(population) from country where continent = "europe");
+--------------------+-----------+----------------+-----------+
| kraj               | kontynent | szef           | lud       |
+--------------------+-----------+----------------+-----------+
| Russian Federation | Europe    | Vladimir Putin | 146934000 |
+--------------------+-----------+----------------+-----------+
1 row in set (0.00 sec)

mysql> select k.name kraj, m.name stolica, surfacearea pow, continent kontynent
    -> from country k, city m
    -> where
    -> capital = id
    -> and
    -> surfacearea = (select max(surfacearea) from country p where p.continent = k.continent)
    -> order by 3;
+--------------------+----------+-------------+---------------+
| kraj               | stolica  | pow         | kontynent     |
+--------------------+----------+-------------+---------------+
| Sudan              | Khartum  |  2505813.00 | Africa        |
| Australia          | Canberra |  7741220.00 | Oceania       |
| Brazil             | Bras¡lia |  8547403.00 | South America |
| China              | Peking   |  9572900.00 | Asia          |
| Canada             | Ottawa   |  9970610.00 | North America |
| Russian Federation | Moscow   | 17075400.00 | Europe        |
+--------------------+----------+-------------+---------------+
6 rows in set (0.09 sec)

mysql> select k.name kraj, m.name stolica, surfacearea pow, continent kontynent
    -> from country k left join city m
    -> on
    -> capital = id
    -> where
    -> surfacearea = (select max(surfacearea) from country p where p.continent = k.continent)
    -> order by 3;
+--------------------+----------+-------------+---------------+
| kraj               | stolica  | pow         | kontynent     |
+--------------------+----------+-------------+---------------+
| Sudan              | Khartum  |  2505813.00 | Africa        |
| Australia          | Canberra |  7741220.00 | Oceania       |
| Brazil             | Bras¡lia |  8547403.00 | South America |
| China              | Peking   |  9572900.00 | Asia          |
| Canada             | Ottawa   |  9970610.00 | North America |
| Antarctica         | NULL     | 13120000.00 | Antarctica    |
| Russian Federation | Moscow   | 17075400.00 | Europe        |
+--------------------+----------+-------------+---------------+
7 rows in set (0.09 sec)

mysql> select k.name kraj, m.name stolica, max(surfacearea) pow, continent kontynent
    -> from country k, city m
    -> where
    -> capital = id
    -> group by 4
    -> order by 3;
+----------------------+--------------+-------------+---------------+
| kraj                 | stolica      | pow         | kontynent     |
+----------------------+--------------+-------------+---------------+
| Algeria              | Alger        |  2505813.00 | Africa        |
| American Samoa       | Fagatogo     |  7741220.00 | Oceania       |
| Argentina            | Buenos Aires |  8547403.00 | South America |
| Afghanistan          | Kabul        |  9572900.00 | Asia          |
| Netherlands Antilles | Willemstad   |  9970610.00 | North America |
| Netherlands          | Amsterdam    | 17075400.00 | Europe        |
+----------------------+--------------+-------------+---------------+
6 rows in set (0.02 sec)

mysql> select name kraj, govermentform rz¥dy, lifeexpectancy ¾ycie
    -> from country
    -> where
    -> lifeexpectancy =
    -> (select max(lifeexpectancy)
    -> from country
    -> where
    -> country.govermentform = govermentform)
    -> order by 3;
ERROR 1054 (42S22): Unknown column 'govermentform' in 'field list'
mysql> select name kraj, govermentform rz¥dy, lifeexpectancy ¾ycie
    -> from country p
    -> where
    -> lifeexpectancy = 
    -> (select max(lifeexpectancy)
    -> from country k
    -> where
    -> k.governmentform = p.governmentform)
    -> order by 3;
ERROR 1054 (42S22): Unknown column 'govermentform' in 'field list'
mysql> select name kraj, governmentform rz¥dy, lifeexpectancy ¾ycie
    -> from country p
    -> where
    -> lifeexpectancy = 
    -> (select max(lifeexpectancy)
    -> from country k
    -> where
    -> k.governmentform = p.governmentform)
    -> order by 3;
+---------------------------+----------------------------------------------+-------+
| kraj                      | rz¥dy                                        | ¾ycie |
+---------------------------+----------------------------------------------+-------+
| Afghanistan               | Islamic Emirate                              |  45.9 |
| East Timor                | Administrated by the UN                      |  46.0 |
| Western Sahara            | Occupied by Marocco                          |  49.8 |
| Samoa                     | Parlementary Monarchy                        |  69.2 |
| Iran                      | Islamic Republic                             |  69.7 |
| Cook Islands              | Nonmetropolitan Territory of New Zealand     |  71.1 |
| Palestine                 | Autonomous Area                              |  71.4 |
| China                     | People'sRepublic                             |  71.4 |
| Qatar                     | Monarchy                                     |  72.4 |
| Bahrain                   | Monarchy (Emirate)                           |  73.0 |
| Brunei                    | Monarchy (Sultanate)                         |  73.6 |
| United Arab Emirates      | Emirate Federation                           |  74.1 |
| French Polynesia          | Nonmetropolitan Territory of France          |  74.8 |
| Libyan Arab Jamahiriya    | Socialistic State                            |  75.5 |
| Puerto Rico               | Commonwealth of the US                       |  75.6 |
| Kuwait                    | Constitutional Monarchy (Emirate)            |  76.1 |
| Cuba                      | Socialistic Republic                         |  76.2 |
| Saint Pierre and Miquelon | Territorial Collectivity of France           |  77.6 |
| Austria                   | Federal Republic                             |  77.7 |
| Virgin Islands, U.S.      | US Territory                                 |  78.1 |
| Martinique                | Overseas Department of France                |  78.3 |
| Faroe Islands             | Part of Denmark                              |  78.4 |
| Aruba                     | Nonmetropolitan Territory of The Netherlands |  78.4 |
| Gibraltar                 | Dependent Territory of the UK                |  79.0 |
| Switzerland               | Federation                                   |  79.6 |
| Australia                 | Constitutional Monarchy, Federation          |  79.8 |
| Japan                     | Constitutional Monarchy                      |  80.7 |
| San Marino                | Republic                                     |  81.1 |
| Macao                     | Special Administrative Region of China       |  81.6 |
| Andorra                   | Parliamentary Coprincipality                 |  83.5 |
+---------------------------+----------------------------------------------+-------+
30 rows in set (0.09 sec)

mysql> select name kraj, surfacearea pow, continent kontynent
    -> from country
    -> where
    -> surfacearea =
    -> 