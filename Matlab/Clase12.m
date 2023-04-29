clc
clear all
I=my_rgb2gray(imread('Bogota.jpg'));
paso=5;
I=I(1:paso:end,1:paso:end);
figure(1)
subplot(2,2,1)
imshow(I)
title('Imagen Original')

Kg = my_fspecial('gaussian',19,18);
Kl = my_fspecial('laplacian',0);


Ig = my_imfilter(I,Kg);
Il = my_imfilter(I,Kl);
Ilg = my_imfilter(Ig,Kl);


subplot(2,2,2)
imshow(Il,[])
title('Filtro Laplaciano de bordes')


subplot(2,2,3)
imshow(Ig,[])
title('Filtro Gaussiano de difuminado')


subplot(2,2,4)
imshow(Ilg,[])
title('Filtro Laplaciano del Gaussian')


figure(2)

KLoG= my_fspecial('log',9,9/6);

ILoG = my_imfilter(I,KLoG);
subplot(1,2,1)
imshow(ILoG,[])
title('Kernel Ecuación LoG')

subplot(1,2,2)
imshow(Ilg,[])
title('Kernel Gaussiano y Laplaciano')


Ks5=[0 -1 0; -1 5 -1; 0 -1 0];

Is5 = my_imfilter(I,Ks5);

figure(3)

subplot(1,2,1)
imshow(I)
title('Original')

subplot(1,2,2)
imshow(Is5)
title('Sharpener')


Kprewit = my_fspecial('prewitt');
Iprewitx =my_imfilter(I,Kprewit);

Iprewity =my_imfilter(I,Kprewit');


figure(4)
subplot(1,2,1)
imshow(Iprewitx)
title('Filtro Prewitt X')

subplot(1,2,2)
imshow(Iprewity)
title('Filtro Prewitt y')


Ksobel = my_fspecial('sobel');
Isobelx =my_imfilter(I,Ksobel);

Isobel =my_imfilter(I,Ksobel');

figure(5)
subplot(1,2,1)
imshow(Iprewitx)
title('Filtro Sobel X')

subplot(1,2,2)
imshow(Iprewity)
title('Filtro Sobel y')



