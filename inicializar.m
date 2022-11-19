function [datos, alturas_2020, datos_a_predecir,alturas_2021, x, y_2020, y_2021, cantidad_horas] = inicializar()

  datos_a_predecir = csvread("ArchivosCSV/Point_Reyes_CA_2021.csv");
  total_mediciones = length(datos_a_predecir);

  cantidad_dias = 365;
  cantidad_horas = cantidad_dias * 24;

  alturas_2021 = datos_a_predecir(2:total_mediciones,5); #Me quedo con la 5ta columna
  alturas_2021 = alturas_2021(1:cantidad_horas);

  datos = csvread("ArchivosCSV/Point_Reyes_CA_2020.csv");

  alturas_2020 = datos(2:total_mediciones,5); #Me quedo con la 5ta columna
  alturas_2020 = alturas_2020(1:cantidad_horas);

  x = [1:1:cantidad_horas];
  y_2020 = alturas_2020';
  y_2021 = alturas_2021';

endfunction
