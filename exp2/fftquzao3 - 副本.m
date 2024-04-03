% 读取含噪声的图像
img = imread('含噪图像1.jpg');

% 转换为灰度图像
noisy_img = rgb2gray(img);

% 将图像转换为双精度类型
noisy_img = im2double(noisy_img);

% 计算傅里叶变换
fft_img = fft2(noisy_img);

% 将零频率分量移到图像中心
fft_img_shifted = fftshift(fft_img);

% 设计带通滤波器（这里假设你想要在频域中保留的频率范围为某个区间）
% 你可以根据实际情况调整滤波器的参数
% 这里使用一个简单的示例，保留频率在50到200的区间
[M, N] = size(noisy_img);
center_x = M / 2;
center_y = N / 2;
radius_low = 150;
radius_high = 200;

% 创建带通滤波器
bandpass_filter = zeros(M, N);
for i = 1:M
    for j = 1:N
        distance = sqrt((i - center_x)^2 + (j - center_y)^2);
        if distance >= radius_low && distance <= radius_high
            bandpass_filter(i, j) = 1;
        end
    end
end

% 应用滤波器
filtered_fft = fft_img_shifted .* bandpass_filter;

% 将零频率分量移到原始位置
filtered_fft_shifted = ifftshift(filtered_fft);

% 进行反傅里叶变换
filtered_img = ifft2(filtered_fft_shifted);

% 显示原始图像和滤波后的图像
figure;
subplot(1, 2, 1);
imshow(noisy_img);
title('原始图像');

subplot(1, 2, 2);
imshow(abs(filtered_img), []);
title('滤波后的图像');
