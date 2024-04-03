% 1. 读入RGB图像
rgbImage = imread('Autumn.bmp');
% 2. 转换为灰度图像
grayImage = rgb2gray(rgbImage);
% 3. 二值化图像
threshold = graythresh(grayImage);  % 使用OTSU算法自动确定阈值
binaryImage = imbinarize(grayImage, threshold);
figure;
subplot(1, 3, 1);
imshow(rgbImage);
title('RGB 图像');
subplot(1, 3, 2);
imshow(grayImage);
title('灰度图像');
subplot(1, 3, 3);
imshow(binaryImage);
title('二值图像');
set(gcf, 'Name', '图像转换示例');
