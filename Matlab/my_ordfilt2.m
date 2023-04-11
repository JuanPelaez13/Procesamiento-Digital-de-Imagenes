function T = my_ordfilt2(I,N,K)
L=size(K);

Lx=L(1);
Ly=L(2);
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
        Orden = sort(S(:));
        T(i,j)= Orden(N);
    
    end
end

T=uint8(T);
T=T(iniF:F-finF,iniC:C-finC);