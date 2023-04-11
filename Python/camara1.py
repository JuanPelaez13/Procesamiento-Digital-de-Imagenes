from PIL import Image
import matplotlib.pyplot as plt
import numpy as np


A=Image.open('DSCN2012.JPG','r')
A.show()
Imagen= plt.imread('DSCN2012.JPG')

# plt.figure(10)
# plt.subplot(Imagen)

# plt.title('Color')
# plt.show()

# r=Imagen[:,:,0]
# plt.imshow(r,cmap='gray')
# plt.show()

# img = Image.new("RGB", (200,100), (255,0,0))
# img.show()}

R = np.array(Imagen)
R[:,:,1] = 0
R[:,:,2] = 0

G= np.array(Image)
G[:,:,0] = 0 
G[:,:,2] = 0

B=np.array(Image)
B[:,:,0] = 0
B[:,:,1] = 0 

plt.figure(figsize = (20,20))
plt.subplot(2,2,1)
plt.imshow(Image)
plt.title('Color')

plt.subplot(2,2,2)
plt.imshow(R, cmap = 'gray')
plt.title()

plt.subplot(2,2,3)
plt.imshow(G, cmap = 'gray')
plt.title()

plt.subplot(2,2,4)
plt.imshow(B, cmap = 'gray')
plt.title()


