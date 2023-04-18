clc
clear all
I=my_rgb2gray(imread('DSCN2012.JPG'));
paso=5;
I=I(1:paso:end,1:paso:end);
%I=my_imnoise(I,'salt&pepper',0.1);

figure(1)
imshow(I)
title('Imagen Original')

% K=(1/9)[1 1 1;
%    1 1 1;
%    1 1 1];


% [F C] = size(I);
% T=zeros(F,C);
% % L=size(K);
% 
% 
% Lx=L(1);
% Ly=L(2);
% iniF=(Lx+1)/2;
% iniC=(Ly+1)/2;
% finF=(iniF-1);
% finC=(iniC-1);
% 
% for i=iniF:F-finF
%     for j=iniC:C-finC
%         V = double(I(i-finF:i+finF,j-finC:j+finC))
%         S=V.*K; %Promedio
%         T(i,j)=sum(S(:));
%         %K(i,j)=median(V(:)); %Media
%         %T(i,j)=mode(V(:)); %Moda
%         %K(i,j)=std(V(:)); %Desvest
% 
% 
%     
%     end
% end
% 
% T=uint8(T);

L=3;
K=my_fspecial('average',L);
If=my_imfilter(I,K);

W=5;
S=W/6;

Limte=(W-1)/2;

[X,Y]=meshgrid(-Limite:Limite,-Limite:Limite)

Z=(1/(2*pi())*S^2)*exp(-(X.^2))
figure(2)
imshow(If)
title('Imagen Filtrada')

Ko = ones(3);
Io = my_ordfilt2(I,1,Ko);
Im = my_ordfilt2(I,9,Ko);

Imed =my_ordfilt2(I,5,Ko);

Imed2 =my_medfilt2(I,[3 3]);

Imoda =my_modefilt(I,[3 3]);

Istd =my_stdfilt(I,[3 3]);


figure(3)
imshow(Io)
title('Filtro Bajo')

figure(4)
imshow(Im)
title('Filtro Alto')

figure(5)
imshow(Imed)
title('Filtro medio Ordfilt2')

figure(6)
imshow(Imed2)
title('Filtro Medfilt2')

figure(7)
imshow(Imoda)
title('Filtro Moda')

figure(8)
imshow(Istd,[])
title('Filtro Desviación Estándar')
