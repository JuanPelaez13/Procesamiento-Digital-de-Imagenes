function T = my_modefilt(I,M)

Lx = M(1);
Ly = M(2);
K = ones(Lx, Ly);


iniF=(Lx+1)/2;
iniC=(Ly+1)/2;

I=padarray(I,[iniF-1 iniC-1], 'symmetric');


[F C] = size(I);
T=zeros(F,C);

finF=(iniF-1);
finC=(iniC-1);

for i=iniF:F-finF
    for j=iniC:C-finC
        V = double(I(i-finF:i+finF,j-finC:j+finC));
        S=V.*K; 
        moda = mode(S(:));
        T(i,j)=moda;
    end
end

T=uint8(T);
T=T(iniF:F-finF,iniC:C-finC);
end