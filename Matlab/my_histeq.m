function S=my_histeq(img)
    h=imhist(img);
    ha=zeros(1,256);
    for i=1:length(h)
        ha(i)=sum(h(1:i));
    end
    [r c]=size(img);
    he=(ha/sum(h))*255;
    S=uint8(zeros(r,c));
    S=uint8(he(img+1));
end
