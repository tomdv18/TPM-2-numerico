function [valores,indices] = nMaximos(n,vector)
  [ordenados , indicesOrdenados] = sort(vector, "descend");
   i = 1;
   while(i <= n)
    valores(i) = ordenados(i);
    indices(i) = indicesOrdenados(i);
    i++;
   endwhile

endfunction
