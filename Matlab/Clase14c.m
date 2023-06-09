I = zeros(8,8);
I(2:3,5:7)=1;
I(5:7,2:4)=1;

EE = logical([0 1 0 ;
      1 1 1 ; 
      0 1 0]);




ID =imdilate(I,EE);
Ic=imerode(ID,EE);


IC = imclose(I,EE);


figure(1)

subplot(1,2,1)
imshow(I,"InitialMagnification",'fit')
title('Imágen')

subplot(1,2,2)
imshow(EE)
title('Elemento Estructural')


figure(2)
subplot(1,2,1)
imshow(IC,'InitialMagnification','fit')
title('Cerramiento/Closing con 1 paso')

subplot(1,2,2)
imshow(Ic,'InitialMagnification','fit')
title('Cerramiento/Closing con 2 pasos ')

