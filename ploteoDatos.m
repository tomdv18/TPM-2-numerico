function alturas = ploteoDatos(cantidad_dias)
 datos = csvread("ArchivosCSV/Point_Reyes_CA_2020.csv");
 total_mediciones = length(datos)

 alturas = datos(2:total_mediciones,5); #Me quedo con la 5ta columna
 alturas = alturas(1:cantidad_dias * 24); #El 24 es por las horas de cada dia
 mediciones_usadas = (length(alturas))
 plot(alturas)
  endfunction
