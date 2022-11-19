function ecm = predicciones_6_armonico()

  [datos, alturas_2020, datos_a_predecir, alturas_2021, x, y_2020, y_2021,cantidad_horas] = inicializar();

  vector = abs(fft(alturas_2020))(2:end/2);
  bar(vector)
  pause(2)
  [valores,indices] = nMaximos(6,vector);


  #Armamos la transformada discreta de Fourier usando los datos de 2020
  #para una sola componente armonica

  fi1 = ones(1,cantidad_horas);
  fi2 = cos(((2 * pi)/cantidad_horas) * indices(1) * x);
  fi3 = sin(((2 * pi)/cantidad_horas) * indices(1) * x);

  fi4 = cos(((2 * pi)/cantidad_horas) * indices(2) * x);
  fi5 = sin(((2 * pi)/cantidad_horas) * indices(2) * x);

  fi6 = cos(((2 * pi)/cantidad_horas) * indices(3) * x);
  fi7 = sin(((2 * pi)/cantidad_horas) * indices(3) * x);

  fi8 = cos(((2 * pi)/cantidad_horas) * indices(4) * x);
  fi9 = sin(((2 * pi)/cantidad_horas) * indices(4) * x);

  fi10 = cos(((2 * pi)/cantidad_horas) * indices(5) * x);
  fi11 = sin(((2 * pi)/cantidad_horas) * indices(5) * x);

  fi12 = cos(((2 * pi)/cantidad_horas) * indices(6) * x);
  fi13 = sin(((2 * pi)/cantidad_horas) * indices(6) * x);

  M=[fi1*fi1' fi1*fi2' fi1*fi3' fi1*fi4' fi1*fi5' fi1*fi6' fi1*fi7' fi1*fi8' fi1*fi9' fi1*fi10' fi1*fi11' fi1*fi12' fi1*fi13';
    fi2*fi1' fi2*fi2' fi2*fi3' fi2*fi4' fi2*fi5' fi2*fi6' fi2*fi7' fi2*fi8' fi2*fi9' fi2*fi10' fi2*fi11' fi2*fi12' fi2*fi13';
    fi3*fi1' fi3*fi2' fi3*fi3' fi3*fi4' fi3*fi5' fi3*fi6' fi3*fi7' fi3*fi8' fi3*fi9' fi3*fi10' fi3*fi11' fi3*fi12' fi3*fi13';
    fi4*fi1' fi4*fi2' fi4*fi3' fi4*fi4' fi5*fi5' fi4*fi6' fi4*fi7' fi4*fi8' fi4*fi9' fi4*fi10' fi4*fi11' fi4*fi12' fi4*fi13';
    fi5*fi1' fi5*fi2' fi5*fi3' fi5*fi4' fi5*fi5' fi5*fi6' fi5*fi7' fi5*fi8' fi5*fi9' fi5*fi10' fi5*fi11' fi5*fi12' fi5*fi13';
    fi6*fi1' fi6*fi2' fi6*fi3' fi6*fi4' fi6*fi5' fi6*fi6' fi6*fi7' fi6*fi8' fi6*fi9' fi6*fi10' fi6*fi11' fi6*fi12' fi6*fi13';
    fi7*fi1' fi7*fi2' fi7*fi3' fi7*fi4' fi7*fi5' fi7*fi6' fi7*fi7' fi7*fi8' fi7*fi9' fi7*fi10' fi7*fi11' fi7*fi12' fi7*fi13';
    fi8*fi1' fi8*fi2' fi8*fi3' fi8*fi4' fi8*fi5' fi8*fi6' fi8*fi7' fi8*fi8' fi8*fi9' fi8*fi10' fi8*fi11' fi8*fi12' fi8*fi13';
    fi9*fi1' fi9*fi2' fi9*fi3' fi9*fi4' fi9*fi5' fi9*fi6' fi9*fi7' fi9*fi8' fi9*fi9' fi9*fi10' fi9*fi11' fi9*fi12' fi9*fi13';
    fi10*fi1' fi10*fi2' fi10*fi3' fi10*fi4' fi10*fi5' fi10*fi6' fi10*fi7' fi10*fi8' fi10*fi9' fi10*fi10' fi10*fi11' fi10*fi12' fi10*fi13';
    fi11*fi1' fi11*fi2' fi11*fi3' fi11*fi4' fi11*fi5' fi11*fi6' fi11*fi7' fi11*fi8' fi11*fi9' fi11*fi10' fi11*fi11' fi11*fi12' fi11*fi13';
    fi12*fi1' fi12*fi2' fi12*fi3' fi12*fi4' fi12*fi5' fi12*fi6' fi12*fi7' fi12*fi8' fi12*fi9' fi12*fi10' fi12*fi11' fi12*fi12' fi12*fi13';
    fi13*fi1' fi13*fi2' fi13*fi3' fi13*fi4' fi13*fi5' fi13*fi6' fi13*fi7' fi13*fi8' fi13*fi9' fi13*fi10' fi13*fi11' fi13*fi12' fi13*fi13'];


  b = [y_2020*fi1'; y_2020*fi2'; y_2020*fi3'; y_2020*fi4'; y_2020*fi5'; y_2020*fi6' ;y_2020*fi7'; y_2020*fi8' ;y_2020*fi9'; y_2020*fi10' ;y_2020*fi11'; y_2020*fi12' ;y_2020*fi13'];
  coeficientes = inv(M)*b;

  transformada = coeficientes(1)*fi1 +coeficientes(2)*fi2 + coeficientes(3)*fi3 + coeficientes(4)*fi4 + coeficientes(5)*fi5 + coeficientes(6)*fi6 + coeficientes(7)*fi7 + coeficientes(8)*fi8 + coeficientes(9)*fi9 + coeficientes(10)*fi10 + coeficientes(11)*fi11 + coeficientes(12)*fi12 + coeficientes(13)*fi13;

  diferencia = y_2021 - transformada;


  ecm = sqrt(diferencia*diferencia'/cantidad_horas);


endfunction
