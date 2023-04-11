I = rgb2gray('DSCN2012.JPG');
paso = 5;
I=I(1:paso:end,1:paso:end);

In=I;
[F C]=size(I);
porcentaje=0.5;
puntos=F*C*porcentaje;


for i=1:puntos
    x=randi(F);
    y=randi(C);
    In(x,y)=255*randi(1);
end

figure(1)
imshow(In)
