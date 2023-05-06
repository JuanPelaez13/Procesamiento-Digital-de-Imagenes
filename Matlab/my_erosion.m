function result = my_erosion(image, se)
    % Convierte la imagen a binaria si es necesario
    if size(image, 3) > 1
        image = rgb2gray(image);
    end
    image = im2bw(image);

    % Obtiene las dimensiones de la imagen y del elemento estructurante
    [image_height, image_width] = size(image);
    [se_height, se_width] = size(se);

    % Calcula los márgenes del elemento estructurante
    se_margin_x = floor(se_width / 2);
    se_margin_y = floor(se_height / 2);

    % Prepara la imagen resultante
    result = false(image_height, image_width);

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
Esta función toma como entrada una imagen en escala de grises o en color y un elemento estructurante (SE) en forma de matriz binaria. La función convierte la imagen a una imagen binaria si es necesario y luego realiza la erosión utilizando el elemento estructurante proporcionado. La imagen resultante se devuelve al final de la función.

Aquí tienes un ejemplo de cómo utilizar la función erosion:

matlab
Copy code
% Carga una imagen
image = imread('tu_imagen.jpg');

% Define un elemento estructurante (SE)
se = [0 1 0; 1 1 1; 0 1 0];

% Realiza la erosión
eroded_image = erosion(image, se);

% Muestra las imágenes original y erosionada
subplot(1, 2, 1);
imshow(image);
title('Imagen original');

subplot(1, 2, 2);
imshow(eroded_image);
title('Imagen erosionada');
Este ejemplo carga una imagen, define un elemento estructurante (SE) en forma de cruz, realiza la erosión utilizando la función erosion y muestra las imágenes original y erosionada en una ventana.





User
el código no ha funcionado

