clear all
clc

I=imread('tools.jpg');


G=rgb2gray(I);

B=~imbinarize(G);

figure(1)
subplot(1,2,1)
imshow(I)
title('Imágen a Color')

subplot(1,2,2)
imshow(G)
title('Imágen a Escala de grises')


figure(2)
subplot(1,3,1)
imshow(B)
title('Binaria')

%Elemento estructurante
EE= strel('square',5);

Id=imdilate(B,EE);
Ic=imerode(Id,EE);

subplot(1,3,2)
imshow(Id)
title('Dilatada')

subplot(1,3,3)
imshow(Ic)
title('Closing')

%Para tener los bordes
Borde_externo =Id-Ic;

figure(3)
imshow(Borde_externo)
title('Binaria con los bordes')

%Para etiquetar figuras
%L es la matriz con etiquetas
%N el numero de objetos

%EL algoritmo va de abajo hacia arriba por columnas
[L,N]=bwlabel(Ic,4);

figure(4)
subplot(1,2,1)
imshow(L,[])
title('Etiquetas Normalizadas')


Lbrgb =label2rgb(L);
subplot(1,2,2)
imshow(Lbrgb)
title('Etiquetas falso color')


%Seleccionar por etiquetas


Herramienta1= L == 1;
Herramienta2= L == 2;
Herramienta3= L == 3;
Herramienta4= L == 4;

figure(5)
subplot(1,4,1)
imshow(Herramienta1)
title('Herramienta 1')

subplot(1,4,2)
imshow(Herramienta2)
title('Herramienta 2')

subplot(1,4,3)
imshow(Herramienta3)
title('Herramienta 3')

subplot(1,4,4)
imshow(Herramienta4)
title('Herramienta 4')

%Etiquetado con color real

Segmentada1 = I.*uint8(Herramienta1);
Segmentada2 = I.*uint8(Herramienta2);
Segmentada3 = I.*uint8(Herramienta3);
Segmentada4 = I.*uint8(Herramienta4);

figure(6)
subplot(1,4,1)
imshow(Segmentada1)
title('Herramienta 1')

subplot(1,4,2)
imshow(Segmentada2)
title('Herramienta 2')

subplot(1,4,3)
imshow(Segmentada3)
title('Herramienta 3')

subplot(1,4,4)
imshow(Segmentada4)
title('Herramienta 4')



%Extracción de caracteristicas de cada elemento
%Basic extrae las tres caracteristicas principales de un objeto

propiedades = regionprops(Herramienta1,'basic');
           %Area: 34775
       %Centroid: [264.1136 372.9793]
    %BoundingBox: [22.5000 300.5000 464 155]

    %Pintar el bounding box

propiedades2 = regionprops(Herramienta2,'basic');
propiedades3 = regionprops(Herramienta3,'basic');
propiedades4 = regionprops(Herramienta4,'basic');

figure(7)
subplot(1,2,1)
imshow(Segmentada1)
title('Recuadro que contiene la imágen')
hold on
rectangle('Position',propiedades.BoundingBox,'EdgeColor','y','LineWidth',2);

subplot(1,2,2)
imshow(Segmentada1)
title('Imagen rodeada con ConvexHull')
hold on
propiedades11 = regionprops(Herramienta1,'ConvexHull','Image');
xc= floor(propiedades11.ConvexHull(:,1));
yc= floor(propiedades11.ConvexHull(:,2));

plot(xc,yc,'b')

figure(8)
imshow(propiedades11.Image)
title('Recorta la imágen')





