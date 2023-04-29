clc
clear all

RGB=imread('bullet.jpg');
I=rgb2gray(RGB);
T=0.3;
S=5;
bin=edge(I,'canny',T,S);
figure(1)

imshow(I)
title('Imágen Original')

figure(2)
imshow(bin)
title('Imagen Binaria')

[centers,radii]=imfindcircles(bin,[80 130],'Sensitivity',0.95);
[centers2,radii2]=imfindcircles(bin,[35 45],'Sensitivity',0.95);

figure(3)
imshow(RGB)

hold on
viscircles(centers,radii,'LineStyle','-','Color','b')
viscircles(centers2,radii2,'LineStyle','-','Color','r')

