function ecm = predicciones_2_armonico()

  [datos, alturas_2020, datos_a_predecir, alturas_2021, x, y_2020, y_2021,cantidad_horas] = inicializar();

  vector = abs(fft(alturas_2020))(2:end/2);
  bar(vector)
  pause(2)
  filename = strcat("predicciones_2_armonico", ".jpg");

  [valores,indices] = nMaximos(6,vector);


  #Armamos la transformada discreta de Fourier usando los datos de 2020
  #para una sola componente armonica

  fi1 = ones(1,cantidad_horas);
  fi2 = cos(((2 * pi)/cantidad_horas) * indices(1) * x);
  fi3 = sin(((2 * pi)/cantidad_horas) * indices(1) * x);

  fi4 = cos(((2 * pi)/cantidad_horas) * indices(2) * x);
  fi5 = sin(((2 * pi)/cantidad_horas) * indices(2) * x);

  frecuencias_importantes = indices #Esta linea es solo para que se muestre por pantalla

  M=[fi1*fi1' fi1*fi2' fi1*fi3' fi1*fi4' fi1*fi5';
    fi2*fi1' fi2*fi2' fi2*fi3' fi2*fi4' fi2*fi5';
    fi3*fi1' fi3*fi2' fi3*fi3' fi3*fi4' fi3*fi5'
    fi4*fi1' fi4*fi2' fi4*fi3' fi4*fi4' fi4*fi5';
    fi5*fi1' fi5*fi2' fi5*fi3' fi5*fi4' fi5*fi5'];

  b = [y_2020*fi1'; y_2020*fi2'; y_2020*fi3'; y_2020*fi4'; y_2020*fi5'];
  coeficientes = inv(M)*b;
  coeficientes_fourrier = coeficientes #Esta linea es solo para que se muestre por pantalla
  transformada = coeficientes(1)*fi1 +coeficientes(2)*fi2 + coeficientes(3)*fi3 + coeficientes(4)*fi4 + coeficientes(5)*fi5;

  diferencia = y_2021 - transformada;


  ecm = sqrt(diferencia*diferencia'/cantidad_horas);


endfunction
