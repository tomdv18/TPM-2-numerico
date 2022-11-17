function [valores,indices] = nMinimos(n,vector)
  [ordenados , indicesOrdenados] = sort(vector);
   i = 1;
   while(i <= n)
    valores(i) = ordenados(i);
    indices(i) = indicesOrdenados(i);
    i++;
   endwhile

endfunction
