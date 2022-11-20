function ecm = predicciones_4_armonico()

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

 frecuencias_importantes = indices #Esta linea es solo para que se muestre por pantalla

M=[fi1*fi1' fi1*fi2' fi1*fi3' fi1*fi4' fi1*fi5' fi1*fi6' fi1*fi7' fi1*fi8' fi1*fi9';
    fi2*fi1' fi2*fi2' fi2*fi3' fi2*fi4' fi2*fi5' fi2*fi6' fi2*fi7' fi2*fi8' fi2*fi9';
    fi3*fi1' fi3*fi2' fi3*fi3' fi3*fi4' fi3*fi5' fi3*fi6' fi3*fi7' fi3*fi8' fi3*fi9';
    fi4*fi1' fi4*fi2' fi4*fi3' fi4*fi4' fi5*fi5' fi4*fi6' fi4*fi7' fi4*fi8' fi4*fi9';
    fi5*fi1' fi5*fi2' fi5*fi3' fi5*fi4' fi5*fi5' fi5*fi6' fi5*fi7' fi5*fi8' fi5*fi9';
    fi6*fi1' fi6*fi2' fi6*fi3' fi6*fi4' fi6*fi5' fi6*fi6' fi6*fi7' fi6*fi8' fi6*fi9';
    fi7*fi1' fi7*fi2' fi7*fi3' fi7*fi4' fi7*fi5' fi7*fi6' fi7*fi7' fi7*fi8' fi7*fi9';
    fi8*fi1' fi8*fi2' fi8*fi3' fi8*fi4' fi8*fi5' fi8*fi6' fi8*fi7' fi8*fi8' fi8*fi9';
    fi9*fi1' fi9*fi2' fi9*fi3' fi9*fi4' fi9*fi5' fi9*fi6' fi9*fi7' fi9*fi8' fi9*fi9';];

  b = [y_2020*fi1'; y_2020*fi2'; y_2020*fi3'; y_2020*fi4'; y_2020*fi5'; y_2020*fi6' ;y_2020*fi7'; y_2020*fi8' ;y_2020*fi9'];
  coeficientes = inv(M)*b;
  coeficientes_fourrier = coeficientes #Esta linea es solo para que se muestre por pantalla
  transformada = coeficientes(1)*fi1 +coeficientes(2)*fi2 + coeficientes(3)*fi3 + coeficientes(4)*fi4 + coeficientes(5)*fi5 + coeficientes(6)*fi6 + coeficientes(7)*fi7 + coeficientes(8)*fi8 + coeficientes(9)*fi9;

  diferencia = y_2021 - transformada;


  ecm = sqrt(diferencia*diferencia'/cantidad_horas);


endfunction
