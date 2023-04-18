function K = my_1fspecial(tipo, T, W)
    if nargin < 2
        T = 3;
    end
    
    if nargin < 3
        S = 0.5;
    end

    tipo = lower(tipo);

    if nargin == 1 && strcmp(tipo, 'laplacian')
        T = 0.2;
    end

    switch tipo
        case 'average'
            if length(T) == 2
                Tx = T(1);
                Ty = T(2);
            else
                Tx = T;
                Ty = T;
            end
            K = ones(Tx, Ty) * (1 / (Tx * Ty));

        case 'gaussian'
            S = W / 6;
            Limite = (T - 1) / 2;

            [X, Y] = meshgrid(-Limite:Limite, -Limite:Limite);

            K = (1 / (2 * pi() * S^2)) * exp(-(X.^2 + Y.^2) / (2 * S^2));
            K = K / sum(K(:));

        case 'laplacian'
            A = T;
            K = 4 / (A + 1) * [A / 4, (1 - A) / 4, A / 4;
                               (1 - A) / 4, -1, (1 - A) / 4;
                               A / 4, (1 - A) / 4, A / 4];
    end
end
