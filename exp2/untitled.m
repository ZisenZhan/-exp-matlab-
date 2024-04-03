% 读取灰度图像
original_image = imread("lenna.bmp");
% 进行傅里叶变换
fft_result = fft2(double(original_image));
% 对傅里叶变换结果进行中心化
fft_shifted = fftshift(fft_result);
% 计算幅度谱
amplitude_spectrum = log(abs(fft_shifted) + 1); % 使用对数变换以增强可视化效果
% 显示原始图像和频谱图
figure;
% 进行逆变换
reconstructed_image = ifft2(fft_result);
% 显示原始图像和逆变换后的图像
subplot(1, 3, 1); imshow(original_image); title('原始图像');
subplot(1, 3, 2); imshow(uint8(abs(reconstructed_image))); title('逆变换后的图像');
subplot(1, 3, 3); imshow(amplitude_spectrum, []); title('频谱图');
