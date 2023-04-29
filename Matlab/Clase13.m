clc
clear all

L=imread("línea1.jpg");


figure(1)
imshow(L)

%Binarización

L1=graythresh(L);

bin=~im2bw(L,L1);

figure(2)
imshow(bin)

[F C]=size(L);
Rmax =ceil((F^2+C^2)^(0.5));
H=zeros(181,2*Rmax);


for i=1:F
    for j=1:C
        if L(i,j)== 1
            for theta =-90:90
               R=ceil(i*cosd(theta)+j*sind(theta))+Rmax+1;
               H(theta+91,R)=H(theta+91,R)+1;
            end
        end
    end

end

% figure(3)
% 
% imshow(imadjust(H),[])
% 
angulo=[-90:90];
Rho = [-Rmax:Rmax-1];

figure(4)
imshow(imadjust(H'/max(H(:))),'XData',angulo,'YData',Rho,'InitialMagnification','fit');
title('Hough Transform')
axis on,axis normal,hold on;
colormap(hot);


figure(5)
[H,T,R]=hough(bin,'RhoResolution',1,'Theta',-90:1:89);
imshow(imadjust(rescale(H)),'XData',angulo,'YData',Rho,'InitialMagnification','fit');
title('Hough Transform MATLAB')
axis on,axis normal,hold on;
colormap(hot);
P=houghpeaks(H,1);
plot(T(P(:,2)),R(P(:,1)),'s','color','blue')


A=P(:,2)-90;
Ro=P(1)-length(R)/2;

b=Ro/sind(A);
m=-cot(A);
X =[1:500];
Y =m*X+b;

figure(6)
imshow(L)
hold on

plot(X,Y,'blue')





