function [coeficientes, ecm] = fourierParte2e2(alturas)
  cantidad_horas = length(alturas)
  x = [1:1:cantidad_horas];
  y = alturas';

  fi1 = ones(1,cantidad_horas);

  fi2 = cos(((2 * pi)/cantidad_horas) * 705 * x);
  fi3 = sin(((2 * pi)/cantidad_horas) * 705 * x);

  fi4 = cos(((2 * pi)/cantidad_horas) * 366 * x);
  fi5 = sin(((2 * pi)/cantidad_horas) * 366* x);

  fi6 = cos(((2 * pi)/cantidad_horas) * 339 * x);
  fi7 = sin(((2 * pi)/cantidad_horas) * 339 * x);

  fi8 = cos(((2 * pi)/cantidad_horas) * 706 * x);
  fi9 = sin(((2 * pi)/cantidad_horas) * 706 * x);

  fi10 = cos(((2 * pi)/cantidad_horas) * 730 * x);
  fi11 = sin(((2 * pi)/cantidad_horas) * 730 * x);



  M=[fi1*fi1' fi1*fi2' fi1*fi3' fi1*fi4' fi1*fi5' fi1*fi6' fi1*fi7' fi1*fi8' fi1*fi9' fi1*fi10' fi1*fi11';
    fi2*fi1' fi2*fi2' fi2*fi3' fi2*fi4' fi2*fi5' fi2*fi6' fi2*fi7' fi2*fi8' fi2*fi9' fi2*fi10' fi2*fi11';
    fi3*fi1' fi3*fi2' fi3*fi3' fi3*fi4' fi3*fi5' fi3*fi6' fi3*fi7' fi3*fi8' fi3*fi9' fi3*fi10' fi3*fi11';
    fi4*fi1' fi4*fi2' fi4*fi3' fi4*fi4' fi5*fi5' fi4*fi6' fi4*fi7' fi4*fi8' fi4*fi9' fi4*fi10' fi4*fi11';
    fi5*fi1' fi5*fi2' fi5*fi3' fi5*fi4' fi5*fi5' fi5*fi6' fi5*fi7' fi5*fi8' fi5*fi9' fi5*fi10' fi5*fi11';
    fi6*fi1' fi6*fi2' fi6*fi3' fi6*fi4' fi6*fi5' fi6*fi6' fi6*fi7' fi6*fi8' fi6*fi9' fi6*fi10' fi6*fi11';
    fi7*fi1' fi7*fi2' fi7*fi3' fi7*fi4' fi7*fi5' fi7*fi6' fi7*fi7' fi7*fi8' fi7*fi9' fi7*fi10' fi7*fi11';
    fi8*fi1' fi8*fi2' fi8*fi3' fi8*fi4' fi8*fi5' fi8*fi6' fi8*fi7' fi8*fi8' fi8*fi9' fi8*fi10' fi8*fi11';
    fi9*fi1' fi9*fi2' fi9*fi3' fi9*fi4' fi9*fi5' fi9*fi6' fi9*fi7' fi9*fi8' fi9*fi9' fi9*fi10' fi9*fi11';
    fi10*fi1' fi10*fi2' fi10*fi3' fi10*fi4' fi10*fi5' fi10*fi6' fi10*fi7' fi10*fi8' fi10*fi9' fi10*fi10' fi10*fi11';
    fi11*fi1' fi11*fi2' fi11*fi3' fi11*fi4' fi11*fi5' fi11*fi6' fi11*fi7' fi11*fi8' fi11*fi9' fi11*fi10' fi11*fi11'];


  b = [y*fi1'; y*fi2'; y*fi3' ; y*fi4' ;y*fi5'; y*fi6' ;y*fi7'; y*fi8' ;y*fi9'; y*fi10' ;y*fi11'];
  coeficientes = inv(M)*b;

  ycalc = coeficientes(1)*fi1 +coeficientes(2)*fi2 + coeficientes(3)*fi3 + coeficientes(4)*fi4 + coeficientes(5)*fi5 + coeficientes(6)*fi6 + coeficientes(7)*fi7 + coeficientes(8)*fi8 + coeficientes(9)*fi9 + coeficientes(10)*fi10 + coeficientes(11)*fi11;

  diferencia = y - ycalc;

  ecm = sqrt(diferencia*diferencia'/cantidad_horas);


endfunction
