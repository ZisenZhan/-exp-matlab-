% 读取图像
image = imread('62dc24bf764d5742927bab2d0f0834e.jpg');  % 替换'your_image.jpg'为你的图像文件路径

% 将彩色图像转换为灰度图像
gray_image = rgb2gray(image);

% 对灰度图像进行直方图均衡化
equalized_image = histeq(gray_image);

% 显示原始图像和均衡化后的图像
subplot(1, 2, 1);
imshow(gray_image);
title('原始图像');

subplot(1, 2, 2);
imshow(equalized_image);
title('均衡化后的图像');

% 计算均衡化后的直方图
figure;
imhist(equalized_image);
title('均衡化后的直方图');
