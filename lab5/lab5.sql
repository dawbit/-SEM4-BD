mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| brednie            |
| bro                |
| iskierka           |
| kotki              |
| kumple             |
| mysql              |
| performance_schema |
| przyjaciele        |
| sobieraj_znajomi   |
| swiat              |
| swiat_h            |
| webserv            |
| znajomi            |
+--------------------+
14 rows in set (0.01 sec)

mysql> use swiat;
Database changed
mysql> use znajomi
Database changed
mysql> select miasto from osoby
    -> union
    -> select typ from telefony;
+-----------------+
| miasto          |
+-----------------+
| Gliwice         |
| Tarnowskie G¢ry |
| Knur¢w          |
| komorkowy       |
| stacjonarny     |
+-----------------+
5 rows in set (0.00 sec)

mysql> select miasto from osoby
    -> union all
    -> select typ from telefony;
+-----------------+
| miasto          |
+-----------------+
| Gliwice         |
| Tarnowskie G¢ry |
| Gliwice         |
| Knur¢w          |
| Gliwice         |
| komorkowy       |
| komorkowy       |
| komorkowy       |
| stacjonarny     |
+-----------------+
9 rows in set (0.00 sec)

mysql> select miasto from osoby
    -> union all
    -> select typ from telefony order by 1;
+-----------------+
| miasto          |
+-----------------+
| Gliwice         |
| Gliwice         |
| Gliwice         |
| Knur¢w          |
| komorkowy       |
| komorkowy       |
| komorkowy       |
| stacjonarny     |
| Tarnowskie G¢ry |
+-----------------+
9 rows in set (0.00 sec)

mysql> select miasto from osoby
    -> union all
    -> select typ, numer from telefony;
ERROR 1222 (21000): The used SELECT statements have a different number of columns
mysql> select miasto, imie from osoby
    -> union all
    -> select typ from telefony order by 1;
ERROR 1222 (21000): The used SELECT statements have a different number of columns
mysql> select miasto, imie from osoby
    -> union all
    -> select typ, numer from telefony;
+-----------------+-----------+
| miasto          | imie      |
+-----------------+-----------+
| Gliwice         | Artur     |
| Tarnowskie G¢ry | Michaˆ    |
| Gliwice         | Monika    |
| Knur¢w          | Oliwia    |
| Gliwice         | Michaˆ    |
| komorkowy       | 321123321 |
| komorkowy       | 123456789 |
| komorkowy       | 987789987 |
| stacjonarny     | 567432121 |
+-----------------+-----------+
9 rows in set (0.00 sec)

mysql> select count(miasto) ile
    -> from osoby
    -> where miasto = "gliwice";
+-----+
| ile |
+-----+
|   3 |
+-----+
1 row in set (0.00 sec)

mysql> select count("Policz ile jest znajomych z Gliwic.") ile
    -> from osoby
    -> where
    -> miasto = "gliwice";
+-----+
| ile |
+-----+
|   3 |
+-----+
1 row in set (0.00 sec)

mysql> select count(*) ile
    -> from osoby
    -> where
    -> miasto = "gliwice";
+-----+
| ile |
+-----+
|   3 |
+-----+
1 row in set (0.00 sec)

mysql> create table test(
    -> p char(1), s char(1));
Query OK, 0 rows affected (0.01 sec)

mysql> insert test value(
    -> "k", "w"),
    -> ("k", "z"),
    -> ("k", "z"),
    -> ("p", "w"),
    -> ("p", "w"),
    -> ("p", "w"),
    -> ("p", "z"),
    -> ("p", "z"),
    -> ("p", "z"),
    -> ("p", "z");
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select p pˆe†, s stan, count(*) ile
    -> from osoby
    -> where
    -> p = "k" and s = "w"
    -> union
    -> select p, s, count(*)
    -> from osoby
    -> where
    -> p = "k" and s = "z"
    -> union
    -> select p, s, count(*)
    -> from osoby
    -> where
    -> p = "k" and s = "w";
ERROR 1054 (42S22): Unknown column 'p' in 'field list'
mysql> select p pˆe†, s stan, count(*) ile
    -> from test
    -> where
    -> p = "k" and s = "w";
+------+------+-----+
| pˆe† | stan | ile |
+------+------+-----+
| k    | w    |   1 |
+------+------+-----+
1 row in set (0.00 sec)

mysql> select p pˆe†, s stan, count(*) ile
    -> from test
    -> where
    -> p = "k" and s = "w"
    -> union
    -> select p, s, count(*)
    -> from test where
    -> p = "k" and s = "z"
    -> union
    -> select p, s, count(*)
    -> from test where
    -> p = "p" and s = "w"
    -> union
    -> select p, s, count(*)
    -> from test where
    -> p = "p" and s = "z";
+------+------+-----+
| pˆe† | stan | ile |
+------+------+-----+
| k    | w    |   1 |
| k    | z    |   2 |
| p    | w    |   3 |
| p    | z    |   4 |
+------+------+-----+
4 rows in set (0.00 sec)

mysql> use swiat;
Database changed
mysql> select region
    -> from country
    -> where
    -> continent = "Europe";
+------------------+
| region           |
+------------------+
| Western Europe   |
| Southern Europe  |
| Southern Europe  |
| Western Europe   |
| Southern Europe  |
| British Islands  |
| Eastern Europe   |
| Southern Europe  |
| Nordic Countries |
| Southern Europe  |
| Nordic Countries |
| British Islands  |
| Nordic Countries |
| Southern Europe  |
| Western Europe   |
| Southern Europe  |
| Southern Europe  |
| Southern Europe  |
| Baltic Countries |
| Western Europe   |
| Baltic Countries |
| Western Europe   |
| Southern Europe  |
| Southern Europe  |
| Eastern Europe   |
| Western Europe   |
| Nordic Countries |
| Southern Europe  |
| Eastern Europe   |
| Western Europe   |
| Eastern Europe   |
| Nordic Countries |
| Western Europe   |
| Southern Europe  |
| Eastern Europe   |
| Southern Europe  |
| Nordic Countries |
| Western Europe   |
| Nordic Countries |
| Eastern Europe   |
| Eastern Europe   |
| Eastern Europe   |
| Eastern Europe   |
| Southern Europe  |
| Eastern Europe   |
| Baltic Countries |
+------------------+
46 rows in set (0.00 sec)

mysql> select distinct region
    -> from country
    -> where
    -> continent = "Europe";
+------------------+
| region           |
+------------------+
| Western Europe   |
| Southern Europe  |
| British Islands  |
| Eastern Europe   |
| Nordic Countries |
| Baltic Countries |
+------------------+
6 rows in set (0.00 sec)

mysql> select count(distinct region) ile
    -> from country
    -> where
    -> continent = 2;
+-----+
| ile |
+-----+
|   6 |
+-----+
1 row in set (0.00 sec)

mysql> select max(population) najw, min(population) najmn, avg(population) ˜r,
    -> sum(population) suma, count(*) ile
    -> from city;
+----------+-------+-------------+------------+------+
| najw     | najmn | ˜r          | suma       | ile  |
+----------+-------+-------------+------------+------+
| 10500000 |    42 | 350468.2236 | 1429559884 | 4079 |
+----------+-------+-------------+------------+------+
1 row in set (0.02 sec)

mysql> select region, count(*) ile
    -> from country
    -> where 
    -> continent = "europe"
    -> group by region
    -> order by 2, 1;
+------------------+-----+
| region           | ile |
+------------------+-----+
| British Islands  |   2 |
| Baltic Countries |   3 |
| Nordic Countries |   7 |
| Western Europe   |   9 |
| Eastern Europe   |  10 |
| Southern Europe  |  15 |
+------------------+-----+
6 rows in set (0.00 sec)

mysql> select region, count(*) ile
    -> from country
    -> where 
    -> continent = "europe"
    -> group by gdzie
    -> order by 2, 1;
ERROR 1054 (42S22): Unknown column 'gdzie' in 'group statement'
mysql> select region gdzie, count(*) ile
    -> from country
    -> where 
    -> continent = "europe"
    -> group by gdzie
    -> order by 2, 1;
+------------------+-----+
| gdzie            | ile |
+------------------+-----+
| British Islands  |   2 |
| Baltic Countries |   3 |
| Nordic Countries |   7 |
| Western Europe   |   9 |
| Eastern Europe   |  10 |
| Southern Europe  |  15 |
+------------------+-----+
6 rows in set (0.00 sec)

mysql> select region, count(*) ile
    -> from country
    -> where 
    -> continent = "europe"
    -> group by 1;
+------------------+-----+
| region           | ile |
+------------------+-----+
| Baltic Countries |   3 |
| British Islands  |   2 |
| Eastern Europe   |  10 |
| Nordic Countries |   7 |
| Southern Europe  |  15 |
| Western Europe   |   9 |
+------------------+-----+
6 rows in set (0.00 sec)

mysql> use znajomi
Database changed
mysql> select p pˆe†, s stan, count(*) ile
    -> from test
    -> group by 1, 2;
+------+------+-----+
| pˆe† | stan | ile |
+------+------+-----+
| k    | w    |   1 |
| k    | z    |   2 |
| p    | w    |   3 |
| p    | z    |   4 |
+------+------+-----+
4 rows in set (0.00 sec)

mysql> drop table test;
Query OK, 0 rows affected (0.00 sec)

mysql> use swiat
Database changed
mysql> -- kody na P paästw, liczb© miast w tym kraju, sum© mieszkaäc¢w miast danego kraju
mysql> -- posortowa† po ilo˜ci miast, a potem po miejscowych
mysql> select countrycode kod, count(*) "ile miast", sum(population) miastowi
    -> from city
    -> 
    -> where
    -> countrycode like "p%"
    -> group by 1
    -> order by 2, 3;
+-----+-----------+----------+
| kod | ile miast | miastowi |
+-----+-----------+----------+
| PCN |         1 |       42 |
| PLW |         1 |    12000 |
| PNG |         1 |   247000 |
| PYF |         2 |    51441 |
| PAN |         2 |   786755 |
| PRY |         5 |  1020020 |
| PRT |         5 |  1145011 |
| PSE |         6 |   902360 |
| PRI |         9 |  1564174 |
| PRK |        13 |  6476751 |
| PER |        22 | 12147242 |
| POL |        44 | 11687431 |
| PAK |        59 | 31546745 |
| PHL |       136 | 30934791 |
+-----+-----------+----------+
14 rows in set (0.00 sec)

mysql> select count(*) ile
    -> from country
    -> where
    -> name like "p%";
+-----+
| ile |
+-----+
|  12 |
+-----+
1 row in set (0.00 sec)

mysql> select count(gnpold) ile
    -> from country
    -> where
    -> name like "p%";
+-----+
| ile |
+-----+
|   9 |
+-----+
1 row in set (0.00 sec)

mysql> select countrycode kod, sum(population) miastowi
    -> from country
    -> where sum(population) > ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 3
mysql> select countrycode kod, sum(population) miastowi
    -> from city
    -> where sum(population) > 1e7
    -> group by 1;
ERROR 1111 (HY000): Invalid use of group function
mysql> select countrycode kod, sum(population) miastowi
    -> from city
    -> group by 1
    -> having
    -> sum(population) > 1e7
    -> order by 2;
+-----+-----------+
| kod | miastowi  |
+-----+-----------+
| SAU |  10636700 |
| AUS |  11313666 |
| POL |  11687431 |
| PER |  12147242 |
| VEN |  12251091 |
| CAN |  12673840 |
| TWN |  13569336 |
| ITA |  15087019 |
| ZAF |  15196370 |
| ESP |  16669189 |
| NGA |  17366900 |
| ARG |  19996563 |
| UKR |  20074000 |
| EGY |  20083079 |
| COL |  20250990 |
| GBR |  22436673 |
| IRN |  26032990 |
| DEU |  26245483 |
| TUR |  28327028 |
| PHL |  30934791 |
| PAK |  31546745 |
| IDN |  37485695 |
| KOR |  38999893 |
| MEX |  59752521 |
| RUS |  69150700 |
| JPN |  77965107 |
| USA |  78625774 |
| BRA |  85876862 |
| IND | 123298526 |
| CHN | 175953614 |
+-----+-----------+
30 rows in set (0.00 sec)

mysql> select countrycode kod, sum(population) miastowi
    -> from city
    -> where countrycode like "p%"
    -> group by 1
    -> having
    -> sum(population) > 1e7
    -> order by 2;
+-----+----------+
| kod | miastowi |
+-----+----------+
| POL | 11687431 |
| PER | 12147242 |
| PHL | 30934791 |
| PAK | 31546745 |
+-----+----------+
4 rows in set (0.00 sec)

mysql> use znajomi
Database changed
mysql> select osoby.imie, telefony.numer
    -> from osoby, telefony;
+--------+-----------+
| imie   | numer     |
+--------+-----------+
| Artur  | 321123321 |
| Artur  | 123456789 |
| Artur  | 987789987 |
| Artur  | 567432121 |
| Michaˆ | 321123321 |
| Michaˆ | 123456789 |
| Michaˆ | 987789987 |
| Michaˆ | 567432121 |
| Monika | 321123321 |
| Monika | 123456789 |
| Monika | 987789987 |
| Monika | 567432121 |
| Oliwia | 321123321 |
| Oliwia | 123456789 |
| Oliwia | 987789987 |
| Oliwia | 567432121 |
| Michaˆ | 321123321 |
| Michaˆ | 123456789 |
| Michaˆ | 987789987 |
| Michaˆ | 567432121 |
+--------+-----------+
20 rows in set (0.00 sec)

mysql> select count(*) from scal;
ERROR 1146 (42S02): Table 'znajomi.scal' doesn't exist
mysql> show tables;
+-------------------+
| Tables_in_znajomi |
+-------------------+
| lacznik           |
| osoby             |
| telefony          |
+-------------------+
3 rows in set (0.00 sec)

mysql> select count(*) from lacznik;
+----------+
| count(*) |
+----------+
|        4 |
+----------+
1 row in set (0.00 sec)

mysql> select osoby.imie, telefony.numer
    -> from osoby, telefony
    -> where 
    -> lacznik.id_o = osoby.id_o
    -> and
    -> lacznik.id_t = telefony.id_t;
ERROR 1054 (42S22): Unknown column 'lacznik.id_o' in 'where clause'
mysql> select osoby.imie, telefony.numer
    -> from osoby, telefony, lacznik
    -> where 
    -> lacznik.id_o = osoby.id_o
    -> and
    -> lacznik.id_t = telefony.id_t;
+--------+-----------+
| imie   | numer     |
+--------+-----------+
| Artur  | 321123321 |
| Michaˆ | 567432121 |
| Monika | 567432121 |
| Oliwia | 123456789 |
+--------+-----------+
4 rows in set (0.00 sec)

mysql> select osoby.imie, osoby.miasto, osoby.wiek, telefony.numer, telefony.typ
    -> from osoby, telefony, lacznik
    -> where
    -> lacznik.id_o = osoby.id_o
    -> and
    -> lacznik.id_t = telefony.id_t;
+--------+-----------------+------+-----------+-------------+
| imie   | miasto          | wiek | numer     | typ         |
+--------+-----------------+------+-----------+-------------+
| Artur  | Gliwice         |   31 | 321123321 | komorkowy   |
| Michaˆ | Tarnowskie G¢ry |   21 | 567432121 | stacjonarny |
| Monika | Gliwice         |   12 | 567432121 | stacjonarny |
| Oliwia | Knur¢w          |   34 | 123456789 | komorkowy   |
+--------+-----------------+------+-----------+-------------+
4 rows in set (0.00 sec)

mysql> select imie, miasto, wiek, numer, typ
    -> from osoby, telefony, lacznik
    -> where
    -> lacznik.id_o = osoby.id_o
    -> and
    -> lacznik.id_t = telefony.id_t;
+--------+-----------------+------+-----------+-------------+
| imie   | miasto          | wiek | numer     | typ         |
+--------+-----------------+------+-----------+-------------+
| Artur  | Gliwice         |   31 | 321123321 | komorkowy   |
| Michaˆ | Tarnowskie G¢ry |   21 | 567432121 | stacjonarny |
| Monika | Gliwice         |   12 | 567432121 | stacjonarny |
| Oliwia | Knur¢w          |   34 | 123456789 | komorkowy   |
+--------+-----------------+------+-----------+-------------+
4 rows in set (0.00 sec)

mysql> select imie, miasto, wiek, t.numer, typ
    -> from osoby o, telefony t, lacznik
    -> where
    -> lacznik.id_o = osoby.id_o
    -> and
    -> lacznik.id_t = telefony.id_t;
ERROR 1054 (42S22): Unknown column 'osoby.id_o' in 'where clause'
mysql> show tables
    -> ;
+-------------------+
| Tables_in_znajomi |
+-------------------+
| lacznik           |
| osoby             |
| telefony          |
+-------------------+
3 rows in set (0.00 sec)

mysql> use swiat
Database changed
mysql> show tables
    -> ;
+-----------------+
| Tables_in_swiat |
+-----------------+
| city            |
| country         |
| countrylanguage |
| test2           |
| testtest        |
| wiosna          |
+-----------------+
6 rows in set (0.01 sec)

mysql> desc country
    -> ;
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Field          | Type                                                                                  | Null | Key | Default | Extra |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
| Code           | char(3)                                                                               | NO   | PRI |         |       |
| Name           | char(52)                                                                              | NO   |     |         |       |
| Continent      | enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') | NO   |     | Asia    |       |
| Region         | char(26)                                                                              | NO   |     |         |       |
| SurfaceArea    | float(10,2)                                                                           | NO   |     | 0.00    |       |
| IndepYear      | smallint(6)                                                                           | YES  |     | NULL    |       |
| Population     | int(11)                                                                               | NO   |     | 0       |       |
| LifeExpectancy | float(3,1)                                                                            | YES  |     | NULL    |       |
| GNP            | float(10,2)                                                                           | YES  |     | NULL    |       |
| GNPOld         | float(10,2)                                                                           | YES  |     | NULL    |       |
| LocalName      | char(45)                                                                              | NO   |     |         |       |
| GovernmentForm | char(45)                                                                              | NO   |     |         |       |
| HeadOfState    | char(60)                                                                              | YES  |     | NULL    |       |
| Capital        | int(11)                                                                               | YES  |     | NULL    |       |
| Code2          | char(2)                                                                               | NO   |     |         |       |
+----------------+---------------------------------------------------------------------------------------+------+-----+---------+-------+
15 rows in set (0.02 sec)

mysql> select country.capital, country.name
    -> from capital, city
    -> where country.name like "p%";
ERROR 1146 (42S02): Table 'swiat.capital' doesn't exist
mysql> select k.name kraj, m.name stolica
    -> from country k, city m
    -> where
    -> capital = id
    -> order by 2 desc;
+---------------------------------------+-----------------------------------+
| kraj                                  | stolica                           |
+---------------------------------------+-----------------------------------+
| Croatia                               | Zagreb                            |
| Armenia                               | Yerevan                           |
| Nauru                                 | Yaren                             |
| Cameroon                              | Yaound‚                           |
| C“te d?Ivoire                         | Yamoussoukro                      |
| Namibia                               | Windhoek                          |
| Netherlands Antilles                  | Willemstad                        |
| Austria                               | Wien                              |
| Cocos (Keeling) Islands               | West Island                       |
| New Zealand                           | Wellington                        |
| United States                         | Washington                        |
| Poland                                | Warszawa                          |
| Lithuania                             | Vilnius                           |
| Laos                                  | Vientiane                         |
| Seychelles                            | Victoria                          |
| Hong Kong                             | Victoria                          |
| Malta                                 | Valletta                          |
| Liechtenstein                         | Vaduz                             |
| Mongolia                              | Ulan Bator                        |
| Tunisia                               | Tunis                             |
| Libyan Arab Jamahiriya                | Tripoli                           |
| Uzbekistan                            | Toskent                           |
| Faroe Islands                         | T¢rshavn                          |
| Japan                                 | Tokyo                             |
| Albania                               | Tirana                            |
| Bhutan                                | Thimphu                           |
| Anguilla                              | The Valley                        |
| Iran                                  | Teheran                           |
| Honduras                              | Tegucigalpa                       |
| Georgia                               | Tbilisi                           |
| Estonia                               | Tallinn                           |
| Taiwan                                | Taipei                            |
| Fiji Islands                          | Suva                              |
| Sweden                                | Stockholm                         |
| Falkland Islands                      | Stanley                           |
| Bulgaria                              | Sofija                            |
| Macedonia                             | Skopje                            |
| Singapore                             | Singapore                         |
| South Korea                           | Seoul                             |
| Bosnia and Herzegovina                | Sarajevo                          |
| Sao Tome and Principe                 | S?o Tom‚                          |
| Dominican Republic                    | Santo Domingo de Guzm n           |
| Chile                                 | Santiago de Chile                 |
| Colombia                              | Santaf‚ de Bogot                  |
| Yemen                                 | Sanaa                             |
| El Salvador                           | San Salvador                      |
| San Marino                            | San Marino                        |
| Puerto Rico                           | San Juan                          |
| Costa Rica                            | San Jos‚                          |
| Saint Pierre and Miquelon             | Saint-Pierre                      |
| R‚union                               | Saint-Denis                       |
| Antigua and Barbuda                   | Saint Johnïs                      |
| Grenada                               | Saint Georgeïs                    |
| Dominica                              | Roseau                            |
| Italy                                 | Roma                              |
| Virgin Islands, British               | Road Town                         |
| Saudi Arabia                          | Riyadh                            |
| Latvia                                | Riga                              |
| Iceland                               | Reykjav¡k                         |
| Myanmar                               | Rangoon (Yangon)                  |
| Morocco                               | Rabat                             |
| Ecuador                               | Quito                             |
| North Korea                           | Pyongyang                         |
| South Africa                          | Pretoria                          |
| Cape Verde                            | Praia                             |
| Czech Republic                        | Praha                             |
| Benin                                 | Porto-Novo                        |
| Vanuatu                               | Port-Vila                         |
| Trinidad and Tobago                   | Port-of-Spain                     |
| Mauritius                             | Port-Louis                        |
| Haiti                                 | Port-au-Prince                    |
| Papua New Guinea                      | Port Moresby                      |
| Montserrat                            | Plymouth                          |
| Cambodia                              | Phnom Penh                        |
| China                                 | Peking                            |
| France                                | Paris                             |
| Suriname                              | Paramaribo                        |
| French Polynesia                      | Papeete                           |
| Micronesia, Federated States of       | Palikir                           |
| Burkina Faso                          | Ouagadougou                       |
| Canada                                | Ottawa                            |
| Norway                                | Oslo                              |
| Aruba                                 | Oranjestad                        |
| Chad                                  | NïDjam‚na                         |
| Greenland                             | Nuuk                              |
| Tonga                                 | Nukuïalofa                        |
| New Caledonia                         | Noum‚a                            |
| Mauritania                            | Nouakchott                        |
| Cyprus                                | Nicosia                           |
| Niger                                 | Niamey                            |
| India                                 | New Delhi                         |
| Bahamas                               | Nassau                            |
| Kenya                                 | Nairobi                           |
| Russian Federation                    | Moscow                            |
| Comoros                               | Moroni                            |
| Uruguay                               | Montevideo                        |
| Liberia                               | Monrovia                          |
| Monaco                                | Monaco-Ville                      |
| Somalia                               | Mogadishu                         |
| Belarus                               | Minsk                             |
| Swaziland                             | Mbabane                           |
| Wallis and Futuna                     | Mata-Utu                          |
| Oman                                  | Masqat                            |
| Lesotho                               | Maseru                            |
| Mozambique                            | Maputo                            |
| Philippines                           | Manila                            |
| Nicaragua                             | Managua                           |
| Mayotte                               | Mamoutzou                         |
| Maldives                              | Male                              |
| Equatorial Guinea                     | Malabo                            |
| Spain                                 | Madrid                            |
| Macao                                 | Macao                             |
| Luxembourg                            | Luxembourg [Luxemburg/L‰tzebuerg] |
| Zambia                                | Lusaka                            |
| Angola                                | Luanda                            |
| Svalbard and Jan Mayen                | Longyearbyen                      |
| United Kingdom                        | London                            |
| Togo                                  | Lom‚                              |
| Slovenia                              | Ljubljana                         |
| Portugal                              | Lisboa                            |
| Peru                                  | Lima                              |
| Malawi                                | Lilongwe                          |
| Gabon                                 | Libreville                        |
| Bolivia                               | La Paz                            |
| Cuba                                  | La Habana                         |
| Denmark                               | K?benhavn                         |
| Ukraine                               | Kyiv                              |
| Kuwait                                | Kuwait                            |
| Malaysia                              | Kuala Lumpur                      |
| Palau                                 | Koror                             |
| Congo, The Democratic Republic of the | Kinshasa                          |
| Saint Vincent and the Grenadines      | Kingstown                         |
| Jamaica                               | Kingston                          |
| Norfolk Island                        | Kingston                          |
| Rwanda                                | Kigali                            |
| Sudan                                 | Khartum                           |
| Nepal                                 | Kathmandu                         |
| Uganda                                | Kampala                           |
| Afghanistan                           | Kabul                             |
| Israel                                | Jerusalem                         |
| Saint Helena                          | Jamestown                         |
| Indonesia                             | Jakarta                           |
| Pakistan                              | Islamabad                         |
| Solomon Islands                       | Honiara                           |
| Finland                               | Helsinki [Helsingfors]            |
| Zimbabwe                              | Harare                            |
| Vietnam                               | Hanoi                             |
| Bermuda                               | Hamilton                          |
| Gibraltar                             | Gibraltar                         |
| Guyana                                | Georgetown                        |
| Cayman Islands                        | George Town                       |
| Palestine                             | Gaza                              |
| Northern Mariana Islands              | Garapan                           |
| Botswana                              | Gaborone                          |
| Tuvalu                                | Funafuti                          |
| Sierra Leone                          | Freetown                          |
| Martinique                            | Fort-de-France                    |
| Christmas Island                      | Flying Fish Cove                  |
| Tokelau                               | Fakaofo                           |
| American Samoa                        | Fagatogo                          |
| Western Sahara                        | El-Aai£n                          |
| Tajikistan                            | Dushanbe                          |
| Ireland                               | Dublin                            |
| Qatar                                 | Doha                              |
| Tanzania                              | Dodoma                            |
| Djibouti                              | Djibouti                          |
| East Timor                            | Dili                              |
| Bangladesh                            | Dhaka                             |
| Syria                                 | Damascus                          |
| Marshall Islands                      | Dalap-Uliga-Darrit                |
| Senegal                               | Dakar                             |
| Guinea                                | Conakry                           |
| Sri Lanka                             | Colombo                           |
| Turks and Caicos Islands              | Cockburn Town                     |
| Panama                                | Ciudad de Panam                   |
| Mexico                                | Ciudad de M‚xico                  |
| Guatemala                             | Ciudad de Guatemala               |
| Holy See (Vatican City State)         | Citt? del Vaticano                |
| Moldova                               | Chisinau                          |
| Virgin Islands, U.S.                  | Charlotte Amalie                  |
| French Guiana                         | Cayenne                           |
| Saint Lucia                           | Castries                          |
| Venezuela                             | Caracas                           |
| Australia                             | Canberra                          |
| Egypt                                 | Cairo                             |
| Burundi                               | Bujumbura                         |
| Argentina                             | Buenos Aires                      |
| Hungary                               | Budapest                          |
| Romania                               | Bucuresti                         |
| Belgium                               | Bruxelles [Brussel]               |
| Barbados                              | Bridgetown                        |
| Congo                                 | Brazzaville                       |
| Slovakia                              | Bratislava                        |
| Brazil                                | Bras¡lia                          |
| Guinea-Bissau                         | Bissau                            |
| Kyrgyzstan                            | Bishkek                           |
| Switzerland                           | Bern                              |
| Germany                               | Berlin                            |
| Yugoslavia                            | Beograd                           |
| Belize                                | Belmopan                          |
| Lebanon                               | Beirut                            |
| Saint Kitts and Nevis                 | Basseterre                        |
| Guadeloupe                            | Basse-Terre                       |
| Gambia                                | Banjul                            |
| Central African Republic              | Bangui                            |
| Thailand                              | Bangkok                           |
| Brunei                                | Bandar Seri Begawan               |
| Mali                                  | Bamako                            |
| Azerbaijan                            | Baku                              |
| Kiribati                              | Bairiki                           |
| Iraq                                  | Baghdad                           |
| Cook Islands                          | Avarua                            |
| Greece                                | Athenai                           |
| Paraguay                              | Asunci¢n                          |
| Kazakstan                             | Astana                            |
| Eritrea                               | Asmara                            |
| Turkmenistan                          | Ashgabat                          |
| Samoa                                 | Apia                              |
| Madagascar                            | Antananarivo                      |
| Turkey                                | Ankara                            |
| Andorra                               | Andorra la Vella                  |
| Netherlands                           | Amsterdam                         |
| Jordan                                | Amman                             |
| Niue                                  | Alofi                             |
| Algeria                               | Alger                             |
| Bahrain                               | al-Manama                         |
| Guam                                  | Aga?a                             |
| Ethiopia                              | Addis Abeba                       |
| Pitcairn                              | Adamstown                         |
| Ghana                                 | Accra                             |
| Nigeria                               | Abuja                             |
| United Arab Emirates                  | Abu Dhabi                         |
+---------------------------------------+-----------------------------------+
232 rows in set (0.00 sec)

mysql> select k.name kraj, m.name stolica
    -> from country k, city m
    -> where
    -> k.name like "p%"
    -> and
    -> capital = id
    -> order by 2 desc;
+------------------+------------------+
| kraj             | stolica          |
+------------------+------------------+
| Poland           | Warszawa         |
| Puerto Rico      | San Juan         |
| Papua New Guinea | Port Moresby     |
| Philippines      | Manila           |
| Portugal         | Lisboa           |
| Peru             | Lima             |
| Palau            | Koror            |
| Pakistan         | Islamabad        |
| Palestine        | Gaza             |
| Panama           | Ciudad de Panam  |
| Paraguay         | Asunci¢n         |
| Pitcairn         | Adamstown        |
+------------------+------------------+
12 rows in set (0.00 sec)

