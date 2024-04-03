img1 = imread("dog.jpg");
img2 = imread("Butterfly.bmp");
I1 = rgb2gray(img1);
I2 = rgb2gray(img2);

figure;
subplot(1,2,1);
imshow(I1);
subplot(1,2,2);
imshow(I2);
