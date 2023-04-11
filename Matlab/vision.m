RGB = uint8(zeros(8,12,3));

% Rojo
RGB(1:6,9:10,1) = 255;
RGB(1:6,9:10,2) = 0;
RGB(1:6,9:10,3) = 0;

%Azul
RGB(1:6,11:12,1) = 0;
RGB(1:6,11:12,2) = 0;
RGB(1:6,11:12,3) = 255;

%Verde
RGB(1:6,5:6,1) = 0;
RGB(1:6,5:6,2) = 255;
RGB(1:6,5:6,3) = 0;

%Amarillo
RGB(1:6,1:2,1) = 255;
RGB(1:6,1:2,2) = 255;
RGB(1:6,1:2,3) = 0;

%Cian
RGB(1:6,3:4,1) = 0;
RGB(1:6,3:4,2) = 255;
RGB(1:6,3:4,3) = 255;

%Magenta
RGB(1:6,7:8,1) = 255;
RGB(1:6,7:8,2) = 0;
RGB(1:6,7:8,3) = 255;

%Blanco
RGB(7:8,1:2,:) = 255;


for i=1:1:12
    RGB(7:8,i,:) =255-i*21;
end




imshow(RGB,'InitialMagnification','fit')
