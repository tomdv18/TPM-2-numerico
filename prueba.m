function  prueba()
  datos_a_predecir = csvread("ArchivosCSV/Point_Reyes_CA_2021.csv");
  cantidad_horas = length(datos_a_predecir) - 1;

  alturas_2021 = datos_a_predecir(2:cantidad_horas,5); #Me quedo con la 5ta columna
  alturas_2021 = alturas_2021(1:cantidad_horas-1);

  datos = csvread("ArchivosCSV/Point_Reyes_CA_2020.csv");

  alturas_2020 = datos(2:cantidad_horas,5); #Me quedo con la 5ta columna
  alturas_2020 = alturas_2020(1:cantidad_horas-1);

  x = [1:1:cantidad_horas];
  y_2020 = alturas_2020';
  y_2021 = alturas_2021';


length(y_2020)
length(y_2021)
