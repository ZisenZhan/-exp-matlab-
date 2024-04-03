image=imread("含噪图像2.jpg");
image = rgb2gray(image);
%average_image = imfilter(image, fspecial('average', [10, 10]));

% 使用高斯滤波器
gaussian_image = imgaussfilt(image, 6); % 2是高斯滤波器的标准差，可以根据需要调整

% 使用中值滤波器
median_image = medfilt2(image, [10, 10]); % 3x3中值滤波器窗口，可以根据需要调整

% 显示原始图像和处理后的图像
figure;
subplot(2, 2, 1); imshow(image); title('原始图像');
subplot(2, 2, 4); imshow(gaussian_image);
subplot(2, 2, 3); imshow(median_image);