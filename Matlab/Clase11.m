
clc
clear all
I=my_rgb2gray(imread('DSCN2012.JPG'));
paso=5;
I=I(1:paso:end,1:paso:end);
%I=my_imnoise(I,'salt&pepper',0.1);

figure(1)
imshow(I)
title('Imagen Original')

T=21;
K = my_fspecial('average',T);
Isp = my_imfilter(I,K);


figure(2)
imshow(Isp)
title('Filtro Promedio')

K1 = my_fspecial('gaussian',T,T);
Isp1 = my_imfilter(I,K1);

figure(3)
imshow(Isp1)
title('Filtro Gaussiano')

Km=ones(20,1)/20;
Il =imfilter(I,Km);

figure(4)
imshow(Il)
title('Mover la imágen')

%Primera derivada
K2 = [1 -1];
Idx = imfilter(I,K2);

figure(5)
imshow(Idx)
title('Filtro derivador')

%Segunda derivada

K3 = [1 -2 1];
Idx1 = imfilter(I,K3);

Idy = imfilter(I,K3');

figure(6)
imshow(Idx1)
title('Segunda derivada en X')

figure(7)
imshow(Idy)
title('Segunda derivada en y')


Id1 =(double(Idx1).^2+double(Idy).^2).^0.5;
figure(8)
imshow(Id1,[])
title('Derivada total')


Laplaciano4 = [0 1 0; 1 -4 1;0 1 0];
laplacian =imfilter(I,Laplaciano4);
figure(9)
imshow(laplacian,[])
title('Filtro Laplaciano')