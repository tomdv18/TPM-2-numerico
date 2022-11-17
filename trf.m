function [periodosHoras,periodosDias] = trf(alturas)

  vector = abs(fft(alturas))(2:end/2);
  bar(vector)
  [valores,indices] = nMaximos(6,vector);
  frec_mayores = indices #tambien se puede sacar de analizar el bar plot
  cantidad_horas = length(alturas); #horas en 7 dias

  periodosHoras = cantidad_horas./frec_mayores;

  periodosDias = (cantidad_horas./frec_mayores)/24;

endfunction
