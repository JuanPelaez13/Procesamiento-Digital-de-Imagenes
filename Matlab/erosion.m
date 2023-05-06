function result = erosion(image, se)

    % Obtiene las dimensiones de la imagen y del elemento estructurante
    [image_height, image_width] = size(image);
    [se_height, se_width] = size(se);

    % Calcula los márgenes del elemento estructurante
    se_margin_x = floor(se_width / 2);
    se_margin_y = floor(se_height / 2);

    % Prepara la imagen resultante
    result = zeros(image_height, image_width);

    % Realiza la erosión
    for i = (1 + se_margin_y):(image_height - se_margin_y)
        for j = (1 + se_margin_x):(image_width - se_margin_x)
            % Extrae la región de la imagen que se solapa con el elemento estructurante
            region = image(i - se_margin_y : i + se_margin_y, j - se_margin_x : j + se_margin_x);

            % Aplica el elemento estructurante a la región y guarda el resultado
            result(i, j) = all(all(region & se));
        end
    end
end


