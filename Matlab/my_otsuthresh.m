function umbral=my_otsuthresh(h)
    h= h';
    if l==3
        disp('La imagen debe estar en escala de grises');
    else
        h=imhist(RGBgray)';
        lh=length(h); %Longitud del histograma
        [filas,cols]=size(RGBgray); %Tamano de la imagen
        tam=filas*cols; 
        maxV=0;
        for T=1:lh-1 %
            Wb=sum(h(1:T))/tam;
            Ub=sum(([0:T-1]).*h(1:T))/sum(h(1:T));
            Wf=1-Wb;
            Uf=sum(([T:lh-1]).*h(T+1:end))/sum(h(T+1:end));
            BCV=Wb*Wf*(Ub-Uf)^2;
            if BCV>=maxV;
                maxV=BCV;
                umbral=(T-1)/255;
            end
        end 
    end 
end
