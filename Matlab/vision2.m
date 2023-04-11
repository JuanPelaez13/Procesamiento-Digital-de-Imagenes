RGB = imread('bote.jpg');
RGB1 = imread('paisaje.jpg');

RGB2 = RGB*0.5 + RGB1*0.5;

imshow(RGB2)