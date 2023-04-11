from PIL import Image
import matplotlib.pyplot as plt
import numpy as np




def my_imnoise (I,tipo,p):

    In=I.copy()
    F,C,_ = I.shape

    if tipo == 'salt&pepper':
        puntos = int(F*C*p)

        for _ in range(puntos):
            x = np.random.randint(0, F)
            y = np.random.randint(0, C)
            In[x, y,:] = 255 * round(np.random.rand())
    

    if tipo == 'gaussian':
        g= np.random.normal(0,p*64,(F,C,3))
        In = np.uint8(np.double(I) + g)  

    if tipo == 'speckle':
        s=np.random.normal(0,p,(F,C,3))
        In = np.uint8(np.double(I) *(s+1))  


    return In

def my_immse(Iref,In):
    assert Iref.shape == In.shape
    error = np.sum((Iref.astype(np.float64) - In.astype(np.float64)) ** 2)
    mse = error / float(Iref.shape[0] * Iref.shape[1] * Iref.shape[2])
    return mse



Imagen= plt.imread('DSCN2012.JPG')

In = my_imnoise(Imagen,'gaussian',0.5)
In1 = my_imnoise(Imagen,'salt&pepper',0.5)
In2 = my_imnoise(Imagen,'speckle',0.5)

mse_gaussian = my_immse(Imagen, In)
mse_salt_pepper = my_immse(Imagen, In1)
mse_speckle = my_immse(Imagen, In2)


plt.figure(figsize = (20,20))
plt.subplot(2, 2, 1)
plt.imshow(Imagen)
plt.title('Color')

plt.subplot(2, 2, 2)
plt.imshow(In)
plt.title(f'Ruido Gaussiano\nMSE: {mse_gaussian:.2f}')

plt.subplot(2, 2, 3)
plt.imshow(In1)
plt.title(f'Ruido Salt & Pepper\nMSE: {mse_salt_pepper:.2f}')

plt.subplot(2, 2, 4)
plt.imshow(In2)
plt.title(f'Ruido Speckle\nMSE: {mse_speckle:.2f}')

plt.subplots_adjust(hspace=0.4)
plt.show()