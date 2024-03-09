function [Labyrinth] = parse_labyrinth(file_path)
  #Labyrinth = dlmread(file_path,' ',1,0);
  in = fopen(file_path,"r");
  [m n] = fscanf(in,"%d%d","C");
  [Labyrinth] = fscanf(in,"%d",[n m]);
  Labyrinth = Labyrinth';
  fclose(in);
endfunction
