clc 
clear all

I=rgb2gray(imread(['Cartagena.JPG']));
paso=5;
I=I(1:paso:end,1:paso:end);
[F C]=size(I)

% g=normrnd(0,50,[F,C]);
% ig=uint8(double(I)+g)
In=my_imnoise(I,'salt&pepper',0.5);

Ig=my_imnoise(I,'gaussian',0.5)

figure(1)
imshow(In)
title('Ruido Salt&pepper')

figure(2)
plot(In(:,200),'k')%trazamos una linea en medio de la imagen y se gráfica
                  %de esta forma es posible visualizar el ruido inducido
title('Trazo Salt&pepper')

figure(3)
imshow(Ig)
title('Ruido Gaussiano')

figure(4)
plot(Ig(:,200),'k')
title('Trazo Gaussiano')

Is=my_imnoise(I,'speckle',0.1)

figure(5)
imshow(Is)
title('Ruido Speckle')

figure(6)
plot(Is(:,200),'k')
title('Trazo Speckle')
