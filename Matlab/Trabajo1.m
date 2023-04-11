RGB1 = imread('Color2.jpeg');
R1 = imread('Rojo2.jpeg');
G1 = imread('Verde2.jpeg');
B1 = imread('Azul2.jpeg');

%Creación de histograma


figure(1)

r = R1(:,:,1);


subplot(1,2,1)
imhist(r)

h= zeros(1,256);
[F C]=size(r);

for i =1:F
    for j=1:C
        P = r(i,j);
        h(P+1) =h(P+1)+1;
    end 
end


subplot(1,2,2)
bar([0:255],h)
axis([0,255 0 max(h)])
grid




figure(2)
Nueva1 = uint8(zeros(1200,1600,3));
Nueva1(:,:,1) = 2*R1(:,:,1);
Nueva1(:,:,2) = 0.8*G1(:,:,2);
Nueva1(:,:,3) = 0.9*B1(:,:,3);

title('Imágen Obtenida')

subplot(1,2,1)
imshow(RGB1)
subplot(1,2,2)
imshow(Nueva1)


% 
% figure;
% subplot(2,2,1);
% imshow(RGB1);
% title('Color');
% subplot(2,2,2);
% imshow(R1);
% title('Rojo');
% subplot(2,2,3);
% imshow(G1);
% title('Verde');
% subplot(2,2,4);
% imshow(B1);
% title('Azul');