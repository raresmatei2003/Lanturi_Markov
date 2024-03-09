function [Adj] = get_adjacency_matrix(Labyrinth)
  [m n] = size(Labyrinth);
  Adj = spalloc(m*n+2,m*n+2,(m*n+2)*(m*n+2));
  #adiacenta WIN Nord
  #verific bitul b3 al nr de pe prima linie din
  #labirint si introdus negatul pe coloana WIN din Adj
  Adj(1:n,m*n+1) = !bitget(Labyrinth(1,1:n),4);

  #adiacenta WIN Sud
  #verific bitul b2 al nr de pe ultima linie din
  #labirint si introdus negatul pe coloana WIN din Adj
  Adj((m-1)*n+1:m*n,m*n+1) = !bitget(Labyrinth(m,1:n),3);

  #adiacenta LOSE Est
  #verific bitul b1 al nr de pe ultima coloana din
  #labirint si introdus negatul pe coloana LOSE din Adj
  Adj((1:m)*n,m*n+2) = !bitget(Labyrinth(1:m,n),2);

  #adiacenta LOSE Vest
  #verific bitul b0 al nr de pe prima coloana din
  #labirint si introdus negatul pe coloana LOSE din Adj
  Adj((0:m-1)*n+1,m*n+2) = !bitget(Labyrinth(1:m,1),1);

  #adiacenta WIN cu WIN
  Adj(m*n+1,m*n+1) = 1;

  #adiacenta LOSE cu LOSE
  Adj(m*n+2,m*n+2) = 1;

  nod = 0;

  for i=1:m
    for j=1:n
      nod = (i-1)*n+j;
      #daca nu sunt pe prima linie pot sa verific adiacenta cu nodul din nord
      #deoarece peretele blocheaza tranzitiile din ambele sensuri, daca din nod1
      #pot urca in nod2, atunci din nod2 pot sa cobor in nod1. Deoarece in matrice
      #sunt n numere pe linie, cand scad n dintr-un numar obtin vecinul de deasupra
      if(nod>n)
        Adj(nod,nod-n) = Adj(nod-n,nod) = !bitget(Labyrinth(i,j),4);
      endif

      #daca nod%n este diferit de zero inseamna ca nu sunt pe ultima coloana
      #si pot verifica adiacenta la dreapta. Analog ca mai sus este completata
      #si adiacenta la stanga
      if(mod(nod,n))
        Adj(nod,nod+1) = Adj(nod+1,nod) = !bitget(Labyrinth(i,j),2);
      endif
    endfor
  endfor
endfunction
