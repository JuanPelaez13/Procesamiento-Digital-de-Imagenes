function Is =my_imadjust(Ie,E,S,n)

Em = E(1);
EM = E(2);
Sm = S(1);
SM = S(2);


Is = uint8((SM-Sm)/(EM-Em)^n*abs(Ie -Em).^n+Sm);
