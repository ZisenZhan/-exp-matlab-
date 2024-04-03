noisyImage = imread("含噪图像2.jpg"); 
K1 = 1/9 * [1 1 1; 1 1 1; 1 1 1];
smoothedImage = imfilter(noisyImage, K1);
imshow(smoothedImage);

