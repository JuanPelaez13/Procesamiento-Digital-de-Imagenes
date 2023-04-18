

clc
clear all
img=my_rgb2gray(imread('DSCN2012.JPG'));
paso=5;
img=img(1:paso:end,1:paso:end);
% Obtener las dimensiones de la imagen
[rows, cols] = size(img);

% Crear una matriz para almacenar las coordenadas de los vectores
X = zeros(rows, cols);
Y = zeros(rows, cols);
U = zeros(rows, cols);
V = zeros(rows, cols);

% Rellenar la matriz con las coordenadas de los vectores
for i = 1:rows
    for j = 1:cols
        X(i, j) = j; % Coordenada x
        Y(i, j) = i; % Coordenada y
        U(i, j) = 0; % Desplazamiento horizontal del vector (no hay desplazamiento en este caso)
        V(i, j) = -double(img(i, j)); % Desplazamiento vertical del vector (negativo porque la imagen se muestra con el eje Y invertido)
    end
end

% Graficar los vectores
figure;
quiver(X, Y, U, V);
axis ij; % Asegurar que el eje Y está invertido para que coincida con la representación de la imagen
title('Vectores de píxeles');