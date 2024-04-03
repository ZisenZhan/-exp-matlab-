% 读取图像
image = saltAndPepperNoise; % 替换成你的图像文件路径

% 将图像转换为灰度图像（如果不是灰度图像）
if size(image, 3) == 3
    image = rgb2gray(image);
end

% 执行FFT
fft_image = fft2(double(image));
fft_shifted = fftshift(fft_image);
magnitude_spectrum = log(abs(fft_shifted) + 1); % 对数变换以增强可视化效果

% 显示原始图像
subplot(121);
imshow(image, []);
title('Original Image');

% 显示频谱图
subplot(122);
imshow(magnitude_spectrum, []);
title('Magnitude Spectrum (FFT)');

% 可选：保存频谱图为图像文件
% imwrite(uint8(magnitude_spectrum), 'spectrum.jpg');

% 调整图形窗口大小以便更好地查看
set(gcf, 'Position', get(0, 'Screensize'));

% 等待用户关闭图像窗口
waitfor(gcf);


