from PIL import Image
import numpy as np
img = Image.new('RGB', (3, 3))






# Define los colores de cada píxel
pixels = [(255, 0, 0),  # rojo
          (0, 255, 0),  # verde
          (0, 0, 255),  # azul
          (255, 255, 0),  # amarillo
          (255, 0, 255),  # magenta
          (0, 255, 255),  # cian
          (255, 127, 80),   # marrón
          (0, 128, 0),   # verde oscuro
          (0, 0, 128)]   # azul oscuro

# Establece los colores de cada píxel en la imagen
for i in range(3):
    for j in range(3):
        index = i * 3 + j
        img.putpixel((i, j), pixels[index])

resize = (300,300)
Nueva_image = img.resize(resize)

Nueva_image.show()

# Guarda la imagen
#Nueva_image.save('cuadro.png')