mysql> use swiat
Database changed
mysql> select k.name kraj, count(*) ile
    -> from country k, city m
    -> where
    -> code = countrycode
    -> and
    -> (select count(*) from city c
    -> where
    -> m.countrycode = c.countrycode) = 5
    -> group by 1
    -> order by 1;
+----------------------+-----+
| kraj                 | ile |
+----------------------+-----+
| Angola               |   5 |
| C“te d?Ivoire        |   5 |
| Denmark              |   5 |
| Georgia              |   5 |
| Ghana                |   5 |
| Jordan               |   5 |
| Lithuania            |   5 |
| Madagascar           |   5 |
| Nepal                |   5 |
| Norway               |   5 |
| Oman                 |   5 |
| Paraguay             |   5 |
| Portugal             |   5 |
| Switzerland          |   5 |
| United Arab Emirates |   5 |
+----------------------+-----+
15 rows in set (28.99 sec)

mysql> select k.name kraj, count(*) ile
    -> from country k, city m
    -> where
    -> code = countrycode
    -> and
    -> (select count(*) from city c
    -> where
    -> m.countrycode = c.countrycode) = 5;
+--------+-----+
| kraj   | ile |
+--------+-----+
| Angola |  75 |
+--------+-----+
1 row in set (29.03 sec)

mysql> select k.name kraj, count(*) ile
    -> from country k, city m
    -> where
    -> code = countrycode
    -> group by 1
    -> having ile = 5
    -> order by 1;
+----------------------+-----+
| kraj                 | ile |
+----------------------+-----+
| Angola               |   5 |
| C“te d?Ivoire        |   5 |
| Denmark              |   5 |
| Georgia              |   5 |
| Ghana                |   5 |
| Jordan               |   5 |
| Lithuania            |   5 |
| Madagascar           |   5 |
| Nepal                |   5 |
| Norway               |   5 |
| Oman                 |   5 |
| Paraguay             |   5 |
| Portugal             |   5 |
| Switzerland          |   5 |
| United Arab Emirates |   5 |
+----------------------+-----+
15 rows in set (0.00 sec)

mysql> select name miasto, population, 70*population krotno˜†, count (*) ile
    -> from city
    -> where
    -> 1=1
    -> \c
mysql> select name miasto, sum(population), 70*sum(population) krotno˜†, count (*) ile
    -> from city
    -> group by 1
    -> having ile > 1
    -> order by 3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '*) ile
from city
group by 1
having ile > 1
order by 3' at line 1
mysql> select name miasto, sum(population), 70*sum(population) krotno˜†, count(*) ile
    -> from city
    -> group by 1
    -> having ile > 1
    -> order by 3;
+--------------+-----------------+-----------+-----+
| miasto       | sum(population) | krotno˜†  | ile |
+--------------+-----------------+-----------+-----+
| Kingston     |          104762 |   7333340 |   2 |
| Saint Johnïs |          125936 |   8815520 |   2 |
| San Felipe   |          186245 |  13037150 |   2 |
| Zeleznogorsk |          190900 |  13363000 |   2 |
| Halifax      |          204979 |  14348530 |   2 |
| Gloucester   |          214314 |  15001980 |   2 |
| Kaiyuan      |          216218 |  15135260 |   2 |
| Peoria       |          221300 |  15491000 |   2 |
| San Mateo    |          227402 |  15918140 |   2 |
| Manzanillo   |          233364 |  16335480 |   2 |
| Plymouth     |          255000 |  17850000 |   2 |
| York         |          259405 |  18158350 |   2 |
| Worcester    |          267648 |  18735360 |   2 |
| San Carlos   |          272523 |  19076610 |   2 |
| Pasadena     |          275610 |  19292700 |   2 |
| C diz        |          284403 |  19908210 |   2 |
| Portsmouth   |          290565 |  20339550 |   2 |
| Santa Clara  |          309711 |  21679770 |   2 |
| Cambridge    |          331541 |  23207870 |   3 |
| Concepci¢n   |          332835 |  23298450 |   2 |
| Santa Rosa   |          333228 |  23325960 |   2 |
| Taiping      |          348785 |  24414950 |   2 |
| Santa Maria  |          382755 |  26792850 |   2 |
| Salamanca    |          385584 |  26990880 |   2 |
| Ede          |          408674 |  28607180 |   2 |
| Glendale     |          413785 |  28964950 |   2 |
| Springfield  |          415116 |  29058120 |   3 |
| Aurora       |          419383 |  29356810 |   2 |
| Jining       |          428800 |  30016000 |   2 |
| Brest        |          435634 |  30494380 |   2 |
| Richmond     |          440757 |  30852990 |   3 |
| Hamilton     |          453914 |  31773980 |   3 |
| Depok        |          472000 |  33040000 |   2 |
| San Fernando |          476975 |  33388250 |   3 |
| Santa Ana    |          477366 |  33415620 |   2 |
| Newcastle    |          493317 |  34532190 |   2 |
| San Miguel   |          500220 |  35015400 |   3 |
| Salem        |          503636 |  35254520 |   2 |
| Arlington    |          507807 |  35546490 |   2 |
| Matamoros    |          508286 |  35580020 |   2 |
| Manchester   |          537006 |  37590420 |   2 |
| San Juan     |          553526 |  38746820 |   2 |
| Toledo       |          554180 |  38792600 |   3 |
| Kansas City  |          588411 |  41188770 |   2 |
| Vancouver    |          657568 |  46029760 |   2 |
| Jinzhou      |          665761 |  46603270 |   2 |
| Guadalupe    |          777661 |  54436270 |   2 |
| Colombo      |          822764 |  57593480 |   2 |
| Suzhou       |          861862 |  60330340 |   2 |
| Columbus     |          897761 |  62843270 |   2 |
| M‚rida       |          928211 |  64974770 |   2 |
| Yichun       |          951585 |  66610950 |   2 |
| Cartagena    |          983466 |  68842620 |   2 |
| Anyang       |         1011438 |  70800660 |   2 |
| La Paz       |         1167894 |  81752580 |   3 |
| Birmingham   |         1255820 |  87907400 |   2 |
| Le¢n         |         1397250 |  97807500 |   3 |
| San Jos‚     |         1453337 | 101733590 |   4 |
| Victoria     |         1616323 | 113142610 |   3 |
| C¢rdoba      |         1646167 | 115231690 |   3 |
| Valencia     |         1681582 | 117710740 |   3 |
| Barcelona    |         1825718 | 127800260 |   2 |
| Tripoli      |         1922000 | 134540000 |   2 |
| Alexandria   |         3456479 | 241953530 |   2 |
| Los Angeles  |         3853035 | 269712450 |   2 |
| Hyderabad    |         4115912 | 288113840 |   2 |
| London       |         7624917 | 533744190 |   2 |
+--------------+-----------------+-----------+-----+
67 rows in set (0.00 sec)

mysql> select name miasto, population miastowi
    -> from city
    -> where
    -> population > ANY
    -> (select 70*sum(population)
    -> from city
    -> group by name
    -> having count(*) > 1)
    -> order by 2;
+------------------+----------+
| miasto           | miastowi |
+------------------+----------+
| Peking           |  7472000 |
| Tokyo            |  7980230 |
| New York         |  8008278 |
| Moscow           |  8389200 |
| Ciudad de M‚xico |  8591309 |
| Istanbul         |  8787958 |
| Karachi          |  9269265 |
| Jakarta          |  9604900 |
| Shanghai         |  9696300 |
| S?o Paulo        |  9968485 |
| Seoul            |  9981619 |
| Mumbai (Bombay)  | 10500000 |
+------------------+----------+
12 rows in set (0.01 sec)

mysql> select k.name kraj, count(*) ile_miast
    -> from country k, city m
    -> where
    -> code = countrycode
    -> group by 1
    -> having ile_miast >= ALL
    -> (select count(*)
    -> from country, city
    -> where
    -> code = countrycode
    -> and
    -> continent = "Europe"
    -> group by code)
    -> order by 2;
+--------------------+-----------+
| kraj               | ile_miast |
+--------------------+-----------+
| Russian Federation |       189 |
| Japan              |       248 |
| Brazil             |       250 |
| United States      |       274 |
| India              |       341 |
| China              |       363 |
+--------------------+-----------+
6 rows in set (0.00 sec)

mysql> select k.name kraj, m.name stolica, language j©zyk
    -> from country k, city m, countrylanguage j
    -> where
    -> capital = id
    -> and
    -> code = j.countrycode
    -> and
    -> lnaguage IN
    -> (select language
    -> from
    -> countrylanguage 
    -> where
    -> countrycode =
    -> (select code from country where name = "poland"))
    -> group by 3, 1;
ERROR 1054 (42S22): Unknown column 'lnaguage' in 'IN/ALL/ANY subquery'
mysql> select k.name kraj, m.name stolica, language j©zyk
    -> from country k, city m, countrylanguage j
    -> where
    -> capital = id
    -> and
    -> code = j.countrycode
    -> and
    -> language IN
    -> (select language
    -> from
    -> countrylanguage 
    -> where
    -> countrycode =
    -> (select code from country where name = "poland"))
    -> group by 3, 1;
+--------------------+-----------------------------------+-------------+
| kraj               | stolica                           | j©zyk       |
+--------------------+-----------------------------------+-------------+
| Belarus            | Minsk                             | Belorussian |
| Estonia            | Tallinn                           | Belorussian |
| Latvia             | Riga                              | Belorussian |
| Lithuania          | Vilnius                           | Belorussian |
| Poland             | Warszawa                          | Belorussian |
| Russian Federation | Moscow                            | Belorussian |
| Ukraine            | Kyiv                              | Belorussian |
| Australia          | Canberra                          | German      |
| Austria            | Wien                              | German      |
| Belgium            | Bruxelles [Brussel]               | German      |
| Brazil             | Bras¡lia                          | German      |
| Canada             | Ottawa                            | German      |
| Czech Republic     | Praha                             | German      |
| Denmark            | K?benhavn                         | German      |
| Germany            | Berlin                            | German      |
| Hungary            | Budapest                          | German      |
| Italy              | Roma                              | German      |
| Kazakstan          | Astana                            | German      |
| Liechtenstein      | Vaduz                             | German      |
| Luxembourg         | Luxembourg [Luxemburg/L‰tzebuerg] | German      |
| Namibia            | Windhoek                          | German      |
| Paraguay           | Asunci¢n                          | German      |
| Poland             | Warszawa                          | German      |
| Romania            | Bucuresti                         | German      |
| Switzerland        | Bern                              | German      |
| United States      | Washington                        | German      |
| Austria            | Wien                              | Polish      |
| Belarus            | Minsk                             | Polish      |
| Canada             | Ottawa                            | Polish      |
| Czech Republic     | Praha                             | Polish      |
| Germany            | Berlin                            | Polish      |
| Latvia             | Riga                              | Polish      |
| Lithuania          | Vilnius                           | Polish      |
| Poland             | Warszawa                          | Polish      |
| Ukraine            | Kyiv                              | Polish      |
| United States      | Washington                        | Polish      |
| Belarus            | Minsk                             | Ukrainian   |
| Canada             | Ottawa                            | Ukrainian   |
| Estonia            | Tallinn                           | Ukrainian   |
| Kazakstan          | Astana                            | Ukrainian   |
| Kyrgyzstan         | Bishkek                           | Ukrainian   |
| Latvia             | Riga                              | Ukrainian   |
| Lithuania          | Vilnius                           | Ukrainian   |
| Moldova            | Chisinau                          | Ukrainian   |
| Poland             | Warszawa                          | Ukrainian   |
| Romania            | Bucuresti                         | Ukrainian   |
| Russian Federation | Moscow                            | Ukrainian   |
| Ukraine            | Kyiv                              | Ukrainian   |
+--------------------+-----------------------------------+-------------+
48 rows in set (0.00 sec)

mysql> select left(name, 1) znak, count(*) ile 
    -> from country
    -> group by 1
    -> sort by 2,1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'sort by 2,1' at line 4
mysql> select left(name, 1) znak, count(*) ile 
    -> from country
    -> group by 1
    -> order by 2,1;
+------+-----+
| znak | ile |
+------+-----+
| O    |   1 |
| Q    |   1 |
| W    |   2 |
| Y    |   2 |
| Z    |   2 |
| J    |   3 |
| D    |   4 |
| R    |   4 |
| K    |   5 |
| V    |   5 |
| H    |   6 |
| E    |   8 |
| F    |   8 |
| I    |   8 |
| U    |   8 |
| L    |   9 |
| P    |  12 |
| T    |  13 |
| A    |  15 |
| G    |  15 |
| N    |  15 |
| B    |  20 |
| C    |  22 |
| M    |  22 |
| S    |  29 |
+------+-----+
25 rows in set (0.00 sec)

mysql> select name
    -> from country
    -> where
    -> EXISTS 
    -> (select * from city
    -> where left(name, 1) = "z"
    -> and 
    -> code = countrycode)
    -> order by 1;
+------------------------+
| name                   |
+------------------------+
| Bosnia and Herzegovina |
| China                  |
| Croatia                |
| Egypt                  |
| Germany                |
| Iran                   |
| Japan                  |
| Kazakstan              |
| Mexico                 |
| Netherlands            |
| Niger                  |
| Nigeria                |
| Philippines            |
| Poland                 |
| Russian Federation     |
| Senegal                |
| Spain                  |
| Switzerland            |
| Tanzania               |
| Turkey                 |
| Ukraine                |
+------------------------+
21 rows in set (1.64 sec)

mysql> select left(name, 1) znak, count(*) ile 
    -> from city
    -> group by 2, 1l
    -> /c
    -> select left(name, 1) znak, count(*) ile 
    -> from city
    -> group by 2, 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select left(name, 1) znak, count(*) ile 
from city
group by 2, 1' at line 5
mysql> select left(name, 1) znak, count(*) ile 
    -> from city
    -> group by 1;
+------+-----+
| znak | ile |
+------+-----+
| A    | 259 |
| B    | 317 |
| C    | 281 |
| D    | 127 |
| E    |  72 |
| F    |  78 |
| G    | 140 |
| H    | 159 |
| I    | 109 |
| J    | 104 |
| K    | 261 |
| L    | 172 |
| M    | 301 |
| N    | 176 |
| O    |  96 |
| P    | 236 |
| Q    |  39 |
| R    | 110 |
| S    | 431 |
| T    | 255 |
| U    |  49 |
| V    |  85 |
| W    |  66 |
| X    |  24 |
| Y    |  63 |
| Z    |  59 |
| [    |   2 |
| ™    |   2 |
| æ    |   5 |
| ï    |   1 |
+------+-----+
30 rows in set (0.00 sec)

mysql> select left(name, 1) znak, count(*) ile 
    -> from city
    -> group by 1
    -> order by 2,1;
+------+-----+
| znak | ile |
+------+-----+
| ï    |   1 |
| [    |   2 |
| ™    |   2 |
| æ    |   5 |
| X    |  24 |
| Q    |  39 |
| U    |  49 |
| Z    |  59 |
| Y    |  63 |
| W    |  66 |
| E    |  72 |
| F    |  78 |
| V    |  85 |
| O    |  96 |
| J    | 104 |
| I    | 109 |
| R    | 110 |
| D    | 127 |
| G    | 140 |
| H    | 159 |
| L    | 172 |
| N    | 176 |
| P    | 236 |
| T    | 255 |
| A    | 259 |
| K    | 261 |
| C    | 281 |
| M    | 301 |
| B    | 317 |
| S    | 431 |
+------+-----+
30 rows in set (0.01 sec)

mysql> select name kraj
    -> from country
    -> where
    -> NOT EXISTS
    -> (select * from city 
    -> where
    -> code = countrycode
    -> and
    -> left(name,1) in ("l","n","p","t","a","k","c","m","b","s"));
+----------------------------------------------+
| kraj                                         |
+----------------------------------------------+
| Netherlands Antilles                         |
| Armenia                                      |
| Aruba                                        |
| Botswana                                     |
| Virgin Islands, British                      |
| Cayman Islands                               |
| Djibouti                                     |
| Dominica                                     |
| Gibraltar                                    |
| Guyana                                       |
| Iceland                                      |
| East Timor                                   |
| Christmas Island                             |
| Western Sahara                               |
| Marshall Islands                             |
| Martinique                                   |
| Mongolia                                     |
| Namibia                                      |
| Nauru                                        |
| Northern Mariana Islands                     |
| Qatar                                        |
| Saint Helena                                 |
| Solomon Islands                              |
| Seychelles                                   |
| Sierra Leone                                 |
| Tokelau                                      |
| Tuvalu                                       |
| Antarctica                                   |
| Bouvet Island                                |
| British Indian Ocean Territory               |
| South Georgia and the South Sandwich Islands |
| Heard Island and McDonald Islands            |
| French Southern territories                  |
| United States Minor Outlying Islands         |
+----------------------------------------------+
34 rows in set (1.00 sec)

