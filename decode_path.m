function [decoded_path] = decode_path(path, lines, cols)
  [n m]=size(path);
  n--;
  decoded_path = zeros(n,2);
  for i=1:n
    decoded_path(i,1)=floor((path(i)-1)/cols)+1;
    decoded_path(i,2)=mod((path(i)-1),cols)+1;
  endfor
endfunction
