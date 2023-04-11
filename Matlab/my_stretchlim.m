function E = my_stretchlim(r,T)
    if nargin ==1
        T=0.01;
    end
    h= zeros(1,256);
    [F C]=size(r);

    for i =1:F
        for j=1:C
            P = r(i,j);
            h(P+1) =h(P+1)+1;
        end 
    end

    H=h/(F*C);

    T=0.01;
    for k=1:256
        A(k)=sum(H(1:k));
        if A(k)<=T
            Em=k;
        end
        if A(k)<=(1-T)
            EM=k;
        end
    end


    E = [Em EM];
