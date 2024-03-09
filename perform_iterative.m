function [x err steps] = perform_iterative(G, c, x0, tol, max_steps)
  [n n]=size(G);
  x=zeros(n,1);
  for steps=1:max_steps
    x(:) = c(:) + G(:,:) * x0(:);
    err = norm(x-x0);
    if (err < tol)
      return;
    endif
    x0=x;
  endfor
endfunction
