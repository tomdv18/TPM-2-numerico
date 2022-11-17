function [coeficientes, ecm] = fourierParte2b(alturas)
  cantidad_horas = length(alturas)
  x = [1:1:cantidad_horas];
  y = alturas';

  fi1 = ones(1,cantidad_horas);

  fi2 = cos(((2 * pi)/cantidad_horas) * 174 * x);
  fi3 = sin(((2 * pi)/cantidad_horas) * 174 * x);

  fi4 = cos(((2 * pi)/cantidad_horas) * 90 * x);
  fi5 = sin(((2 * pi)/cantidad_horas) * 90 * x);

  M=[fi1*fi1' fi1*fi2' fi1*fi3' fi1*fi4' fi1*fi5';
    fi2*fi1' fi2*fi2' fi2*fi3' fi2*fi4' fi2*fi5';
    fi3*fi1' fi3*fi2' fi3*fi3' fi3*fi4' fi3*fi5';
    fi4*fi1' fi4*fi2' fi4*fi3' fi4*fi4' fi5*fi5';
    fi5*fi1' fi5*fi2' fi5*fi3' fi5*fi4' fi5*fi5'];

  b = [y*fi1'; y*fi2'; y*fi3' ; y*fi4' ;y*fi5'];
  coeficientes = inv(M)*b;

  ycalc = coeficientes(1)*fi1 +coeficientes(2)*fi2 + coeficientes(3)*fi3 + coeficientes(4)*fi4 + coeficientes(5)*fi5;

  diferencia = y - ycalc;

  ecm = sqrt(diferencia*diferencia'/cantidad_horas);


endfunction
