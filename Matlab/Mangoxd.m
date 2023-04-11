RGB= imread("mangot4.jpg");

B=RGB(:,:,3);

figure(1);
subplot(2,1,1);
imshow(B);
subplot(2,1,2);
imhist(B)
hist=imhist(B);

T= my_graythresh(B);
Ib= my_im2bw(B,T);

figure(2)
imshow(Ib)

