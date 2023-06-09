I = logical(    [0 0 0 0 0 0 0 0;
                 0 0 0 1 1 1 0 0;
                 0 0 1 1 1 1 0 0;
                 0 1 1 1 1 0 0 0;
                 0 1 1 1 0 0 0 0;
                 0 1 1 1 0 0 0 0;
                 0 0 0 0 0 0 0 0;
                 0 0 0 0 0 0 0 0;
                                 ]);

EE = logical([0 1 0 ;
      1 1 1 ; 
      0 1 0]);

IE = imerode(I,EE);
ID = imdilate(I,EE);


figure(1)

subplot(1,2,1)
imshow(I,"InitialMagnification",'fit')
title('Imágen')

subplot(1,2,2)
imshow(EE)
title('Elemento Estructural')


figure(2)
subplot(1,2,1)
imshow(IE,'InitialMagnification','fit')
title('Imágen Erosinada')

subplot(1,2,2)
imshow(ID,'InitialMagnification','fit')
title('Imágen Dilatada')

