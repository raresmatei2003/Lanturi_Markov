#Lanturi_Markov

parse_labyrinth: Citesc matricea din fisier.

get_adjacency_matrix: Am completat adiacenta pentru numerele ce se afla
la marginile matricei. Daca un numar are bitul de pe pozitia 3 sau 4 egal
cu 0 atunci inseamna ca este adiacent cu WIN si completez pe coloana m*n+1
cu negatul bitului(m si n fiind dimensiunile matricei). Analog fac pentru
bitii de pe pozitile 1 si 2 si starea LOSE.
Dupa ce am completat marginile, parcurg matricea si completez pentru fiecare
celula adiacenta cu vecinii ei.

get_link_matrix: Obtin matricea legaturilor folosind matricea de adiacenta.

get_Jacobi_parameters: G va contine submatricea din Link formata din primele
n-2 linii si coloane (n este numarul de linii din Link, Link este patratica),
acestea avand adiacenta celulelor din labirint.
c va retine primele n-2 elemente din coloana n-1 din Link(coloana n-2 contine
adiacenta fiecarei celule din labirint cu starea WIN)

perform_iterative: Aplic Jacobi pana cand eroarea actuala este mai mica decat
toleranta data sau pana cand a fost executat numarul de pasi maxim dati

heuristic_greedy: Introduc celula de start intr-o stiva.
Incepand de la celula data, verific daca am vecini. In caz
pozitiv, il caut pe cel ce are probabilitatea cea mai mare de a duca la WIN
si il pun in stiva unde retin drumul parcurs pana acum si il marchez ca vizitat.
Daca nu exista vecini, atunci scot celula actuala din stiva cu drumul parcurs,
dar il las marcat ca vizitat.
Repet algoritmul precedent cu ultima celula din stiva cu drumul parcurs pana
cand ajung la o celula cu probabilitatea 1 (am ajuns la WIN) sau pana cand
se goleste stiva (niciun drum nu a dus la WIN).

decode_path: Folosind stiva obtinuta precedent, traduc numarul fiecarei celule
in coordonate pentru o matrice de un numar de linii si coloane date.
Ex: lines = 3, cols = 4
celula cu numarul 7 se afla pe linia 2 coloana 3
7 = (2-1)*4 + 3;
