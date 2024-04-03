clear,clc;
% 读取图像
image = imread('lenna.bmp'); % 替换成你的图像文件路径

% 将图像转换为灰度图像（如果不是灰度图像）
if size(image, 3) == 3
    image = rgb2gray(image);
end

% 执行FFT
fft_image = fft2(double(image));
fft_shifted = fftshift(fft_image);

% 逆FFT以恢复原始图像
reconstructed_image = ifft2(ifftshift(fft_shifted));



% 显示原始图像
subplot(131);
imshow(image, []);
title('Original Image');

% 显示频谱图
subplot(132);
imshow(log(abs(fft_shifted) + 1), []);
title('Magnitude Spectrum (FFT)');

% 显示逆FFT后的图像
subplot(133);
imshow(reconstructed_image, []);
title('Reconstructed Image');

