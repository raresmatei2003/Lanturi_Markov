function [Link] = get_link_matrix(Labyrinth)
  #obtin matricea de adiacenta a labirintului
  [Adj] = get_adjacency_matrix(Labyrinth);

  [dim dim] = size(Adj);
  Link = spalloc(dim,dim,dim*dim);

  for i=1:dim
    count = sum(Adj(i,1:dim));
    for j=1:dim
      if(Adj(i,j))
        Link(i,j) = 1/count;
      endif
    endfor
  endfor
endfunction
