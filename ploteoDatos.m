function ploteoDatos(cantidad_dias)
 datos = csvread("ArchivosCSV/Point_Reyes_CA_2020.csv");
 cantidad_mediciones = length(datos)
 alturas = datos(2:cantidad_mediciones,5); #Me quedo con la 5ta columna
 plot(alturas(1:cantidad_dias * 24)) #El 24 es por las horas de cada dia
  endfunction
