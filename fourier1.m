function [coeficientes, ecm] = fourier1(alturas)
  cantidad_horas = length(alturas)
  x = [1:1:cantidad_horas];
  y = alturas;

  fi1 = ones(1,cantidad_horas);
  fi2 = cos(((2 * pi)/cantidad_horas) * 7 * x);
  fi3 = sin(((2 * pi)/cantidad_horas) * 7 * x);


  M=[fi1*fi1' fi1*fi2' fi1*fi3'; fi2*fi1' fi2*fi2' fi2*fi3'; fi3*fi1' fi3*fi2' fi3*fi3'];
  b = [y*fi1; y*fi2; y*fi3b];
  coeficientes = inv(M)*b;

  ycalc = coeficientes(1)*fi1 +coeficientes(2)*fi2 + coeficientes(3)*fi3;

  diferencia = y - ycalc;

  ecm = sqrt(diferencia*diferencia'/cantidad_horas);


endfunction
