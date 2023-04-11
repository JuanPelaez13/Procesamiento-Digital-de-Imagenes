clc 
clear all
RGB = rgb2gary(imread('pendulo3,jpg'));
T=graythresh(RGB);
Binaria=im2bw(RGB,T);

figure(1)
subplot(1,2,1)
imshow(RGB)

subplot(1,2,2)
imshow(Binaria)
title('Binaria Otsu')