originalImage = imread('lenna.bmp');
imshow(originalImage);
title('原始图像');
figure;
% 添加高斯噪声
gaussianNoise = imnoise(originalImage, 'gaussian', 0, 0.01); 
imshow(gaussianNoise);
title('高斯噪声图像');
figure;
% 添加椒盐噪声
saltAndPepperNoise = imnoise(originalImage, 'salt & pepper', 0.05); 
imshow(saltAndPepperNoise);
title('椒盐噪声图像');
figure;
% 添加乘法噪声
multiplicativeNoise = imnoise(originalImage, 'speckle', 0.02); 
imshow(multiplicativeNoise);
title('乘法噪声图像');
