import cv2
import numpy as np

bgr = cv2.imread("Untitled.png")
hsv = cv2.cvtColor(bgr, cv2.COLOR_BGR2HSV)
out = []

h, w, channels = bgr.shape

#hsv[0:][:][0], hsv[:][:][2] = hsv[:][:][2], hsv[:][:][0]

#cv2.imwrite("Untitiled-HSV.png", hsv)

cv2.imshow("image", hsv)

print('HSV-cv:')
print(hsv[0][0])
## H lấy ra theo độ thì HSV[0]x2
## S lấy theo % thì lấy HSV[1]/255
## V lấy theo % thì lấy HSV[2]/255
### Lý do python lấy theo như vậy vì khi chuyển thì 1 đơn vị tối đa là 255 nhưng H thuôc [0:360] nên phải -180 độ

for i in range(0,h):
    a = []
    for j in range(0,w):
        x = hsv[i][j][0]*2
        y = round(hsv[i][j][1]*100/255, 1)
        z = round(hsv[i][j][2]*100/255, 1)
        a += [[x, y, z]]
    out += [a]


print('BGR:')
print(bgr[0][0])
print('HSV-out:')
out = np.array(out)
print(out[0][0])

cv2.waitKey()

