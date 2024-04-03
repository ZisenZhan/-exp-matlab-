
noisyImage =imread("含噪图像2.jpg");
noisyImage=rgb2gray(noisyImage);
figure;
% 子图2：使用中值滤波去噪
filteredImage1 = medfilt2(noisyImage, [3, 3]);
subplot(2, 2, 2);
imshow(filteredImage1);
title('Median Filter');

% 子图3：使用高斯滤波去噪
filteredImage2 = imgaussfilt(noisyImage,6);
subplot(2, 2, 3);
imshow(filteredImage2);
title('Gaussian Filter');

% 子图4：使用小波去噪
filteredImage3 = wdenoise2(noisyImage, 2, 'sym6', 's', 3, 'Soft');
subplot(2, 2, 4);
imshow(filteredImage3);
title('Wavelet Denoising');

% 调整图像窗口大小以适应所有子图
set(gcf, 'Position', get(0, 'Screensize'));

% 可选：保存结果图像
% saveas(gcf, 'denoised_image_subplot.png');

% 可选：关闭图像窗口
% close(gcf);
