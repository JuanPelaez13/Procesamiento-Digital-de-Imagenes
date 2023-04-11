clc 
clear all
RGB = my_rgb2gray(imread('pendulo3.JPG'));
T=graythresh(RGB);
Binaria=my_im2bw(RGB,T);

figure(1)
subplot(1,2,1)
imshow(RGB)

subplot(1,2,2)
imshow(Binaria)
title('Binaria Otsu')