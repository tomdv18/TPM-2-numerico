function [coeficientes, ecm] = fourierParte2d(alturas)
  cantidad_horas = length(alturas)
  x = [1:1:cantidad_horas];
  y = alturas';

  fi1 = ones(1,cantidad_horas);

  fi2 = cos(((2 * pi)/cantidad_horas) * 348 * x);
  fi3 = sin(((2 * pi)/cantidad_horas) * 348 * x);

  fi4 = cos(((2 * pi)/cantidad_horas) * 181 * x);
  fi5 = sin(((2 * pi)/cantidad_horas) * 181* x);

  fi6 = cos(((2 * pi)/cantidad_horas) * 167 * x);
  fi7 = sin(((2 * pi)/cantidad_horas) * 167* x);



  M=[fi1*fi1' fi1*fi2' fi1*fi3' fi1*fi4' fi1*fi5' fi1*fi6' fi1*fi7';
    fi2*fi1' fi2*fi2' fi2*fi3' fi2*fi4' fi2*fi5' fi2*fi6' fi2*fi7';
    fi3*fi1' fi3*fi2' fi3*fi3' fi3*fi4' fi3*fi5' fi3*fi6' fi3*fi7';
    fi4*fi1' fi4*fi2' fi4*fi3' fi4*fi4' fi5*fi5' fi4*fi6' fi4*fi7';
    fi5*fi1' fi5*fi2' fi5*fi3' fi5*fi4' fi5*fi5' fi5*fi6' fi5*fi7';
    fi6*fi1' fi6*fi2' fi6*fi3' fi6*fi4' fi6*fi5' fi6*fi6' fi6*fi7';
    fi7*fi1' fi7*fi2' fi7*fi3' fi7*fi4' fi7*fi5' fi7*fi6' fi7*fi7'];


  b = [y*fi1'; y*fi2'; y*fi3' ; y*fi4' ;y*fi5'; y*fi6' ;y*fi7'];
  coeficientes = inv(M)*b;

  ycalc = coeficientes(1)*fi1 +coeficientes(2)*fi2 + coeficientes(3)*fi3 + coeficientes(4)*fi4 + coeficientes(5)*fi5 + coeficientes(6)*fi6 + coeficientes(7)*fi7;

  diferencia = y - ycalc;

  ecm = sqrt(diferencia*diferencia'/cantidad_horas);


endfunction
