function In= my_imnoise(I,tipo,p)
In=I;
[F C]=size(I);

switch tipo
    case 'salt&pepper' 
       puntos=F*C*p;

    for i=1:puntos
       x=randi(F);
       y=randi(C);
       In(x,y)=255*round(rand(1));
    end 

    case 'gaussian'
        g=normrnd(0,p*128,[F,C]);
        In=uint8(double(I)+g)
    case 'speckle'
        s=normrnd(0,p,[F,C]);
        In=uint8(double(I).*(s+1));


end


end

