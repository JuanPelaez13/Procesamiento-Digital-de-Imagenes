clear all
function [Idx_pico_detect, Pico_detected]=PicosQRS(x)

load datosecg_JuanCamilo.mat   %Cargo los datos
x = A(1:26000,2);     %Selecciono los primeros 6000 datos de las filas 1 y 2
figure(1)
plot(x)
title('Señal Original')
[filas, columnas] = size(x);
%Filtro Pasa-bajo
y1 = zeros(filas, columnas);
for n = 13:filas
    y1(n) = 2*y1(n-1) - y1(n-2) + 1/32*(x(n)-2*x(n-6)+x(n-12));
end
figure(2)
plot(y1);
title('Salida Filtro Pasa-Bajo')
%Filtro Pasa-alto
x2=y1;
y2 = zeros(filas, columnas);
for n = 33:filas
    y2(n) =  y2(n-1) + ((x2(n))/32) +x2(n-16)-x2(n-17) + ((x2(n-32))/32);
end
figure(3)
plot(y2);
title('Salida Filtro Pasa-alto')
%Derivador
x3=y2;
for n = 5:filas
   y3(n) = 1/8 *(2*x3(n)+x3(n-1)-x3(n-3)-2*x3(n-4));
end
figure(4)
plot(y3);
title('Salida derivador')
%Cuadratura
x4=y3;
y4=x4.^2; 
figure(5)
plot(y4);
title('Salida cuadratura')
%Integrador
N=30;
x5=y4;
for n = N+1:filas
   y5(n) = 0;
    for i=1:(N-1)
   
   y5(n)= y5(n)+x5(n-i);
    
    end
    y5(n)=y5(n)/N;
end
figure(6)
plot(y5);
title('Salida integrador')
%Etapa de umbralización
%Y_Thereshold=zeros(filas, 1);
%umbral=600
%for n= 1:6000
%    if y5(n)>umbral
%    Y_Thereshold(n)= 1;
%    end
%end
%figure(9)
%plot(Y_Thereshold)
%Creacion de Picos
Y_Thereshold=zeros(filas, 1);
umbral=600
[picos, lugar]= findpeaks(y5);
figure(8) 
plot(y5)
hold on
plot(lugar,picos, 'ro')
%Creación de umbral constante
Num_picos=length(picos)
for i =1:Num_picos
    if picos(i)>umbral
        Y_Thereshold(lugar(i))=1;
        Pico_detected(i)=picos(i);
        Idx_pico_detect(i)=lugar(i);
    end
end
figure(9)
plot(y5)
hold on
title('Umbral constante')
plot(Idx_pico_detect,Pico_detected, 'ro')
picos(Idx_pico_detect==0)=[];
Idx_pico_detect(Idx_pico_detect==0)=[];
end

