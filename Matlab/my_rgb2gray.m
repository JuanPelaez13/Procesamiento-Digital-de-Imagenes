function gray=my_rgb2gray(RGB)
%     r=double(RGB(:,:,1));
%     g=double(RGB(:,:,2));
%     b=double(RGB(:,:,3));

    [r,g,b]=imsplit(RGB);

    wr=0.299;
    wg=0.587;
    wb=0.114;

    gray=uint8(wr*r+wg*g+wb*b);

