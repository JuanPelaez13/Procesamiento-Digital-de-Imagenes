clear all
clc

load tabla_entreno.mat

X=DATA(:,1:7);
Y=DATA(:,8);

ModelKNN= fitcknn(X,Y,'NumNeighbors',5,'Distance','euclidean','Standardize',1);

F= uigetfile('*.jpg','Selecciona archivo..')
RGB=imread(F);
G=rgb2gray(RGB);
B=~imbinarize(G,'adaptive','Sensitivity',0.7);

EE = strel('disk',9);


Bc = imclose(B,EE);


figure(1)
subplot(1,4,1)
imshow(RGB)

subplot(1,4,2)
imshow(G)

subplot(1,4,3)
imshow(Bc)

subplot(1,4,4)
imshow(B)
hold on




[L N]=bwlabel(Bc);
DATA =zeros(N,8);

for i=1:N
    S=L==i;
    C=regionprops(S,'Image','BoundingBox');

%     figure(2)
%     imshow(C.Image,'InitialMagnification','fit')
%     pause(0.2)
    rectangle('Position',C.BoundingBox,'EdgeColor','y','LineWidth',2)
    pause(0.2)
    Sr=imcrop(B,C.BoundingBox);
    M=invmoments(Sr);
    prediction_KNN = predict(ModelKNN,M)
    %%DATA(i,1:7)= M;
    figure(2)
    imshow(Sr)
    pause(0.2)
    
    
    %%V= input('Numero : ');
    %%DATA(i,8)= V;
end
