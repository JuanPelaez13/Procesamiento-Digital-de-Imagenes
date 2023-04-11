function Imed = medfilt2(I,M)
Lx = M(1);
Ly = M(2);
Ko = ones(Lx,Ly);

N=(Lx*Ly+1)/2;

    
Imed =my_ordfilt2(I,N,Ko);

    
end