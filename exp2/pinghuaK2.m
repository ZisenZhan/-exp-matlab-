
ii = imread("含噪图像2.jpg");
K1 = 1/25 * [1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1;1 1 1 1 1];
smoothedImage = imfilter(ii, K1);
imshow(smoothedImage);
