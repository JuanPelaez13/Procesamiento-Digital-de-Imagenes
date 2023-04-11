function K=my_fspecial(tipo,T)

switch tipo
    case 'average'
        Tx=T;
        Ty=T;
     
        if length(T)==2
            Tx=T(1);
            Ty=T(2);
        end
        K=ones(Tx,Ty)*(1/(Tx*Ty));

end