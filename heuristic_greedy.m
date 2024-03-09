function [path] = heuristic_greedy(start_position,probabilities,Adj)
  [n n]=size(Adj);
  path=[start_position];
  visited(start_position)=true;
  while path
    position=path(end);
    if(probabilities(position)==1)
      return;
    endif
    nr_vecini = 0;
    for i=1:n
      nr_vecini += Adj(position,i);
    endfor
    if(nr_vecini == 0)
      path(end)=[];
    else
      max_prob = 0;
      for i=1:n
        if(Adj(position,i) && probabilities(i)>max_prob)
          max_prob = probabilities(i);
          neigh = i;
        endif
      endfor
      visited(neigh)=true;
      path=[path; neigh];
    endif
  endwhile
endfunction
