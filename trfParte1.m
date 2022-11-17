function [periodosHoras,periodosDias] = trfParte1()
  frec_mayores = [7,14,13,6,15] #surge de analizar el bar plot
  cantidad_horas = 168; #horas en 7 dias

  periodosHoras = cantidad_horas./frec_mayores;

  periodosDias = (cantidad_horas./frec_mayores)/24;

endfunction
