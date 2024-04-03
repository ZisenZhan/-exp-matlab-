% 读取图像
I = imread('lenna.bmp');

% 对图像进行二维离散傅立叶变换
fftI1 = fft2(I);

% 将直流分量移到频谱中心
sfftI1 = fftshift(fftI1);

% 取傅立叶变换的实部和虚部
RR1 = real(sfftI1);
II1 = imag(sfftI1);

% 计算频谱幅值
A1 = sqrt(RR1.^2 + II1.^2);

% 归一化运算
A1 = (A1 - min(min(A1))) / (max(max(A1)) - min(min(A1))) * 225;

% 显示原图像
subplot(2, 2, 1);
imshow(I);
title('Original Image');

% 显示傅立叶变换的实部
subplot(2, 2, 2);
imshow(RR1, []);
title('Real part of FFT');

% 显示傅立叶变换的虚部
subplot(2, 2, 3);
imshow(II1, []);
title('Imaginary part of FFT');

% 显示归一化后的频谱幅值
subplot(2, 2, 4);
imshow(A1, []);
title('Normalized Magnitude Spectrum');

% 逆变换
inv_fftI1 = ifft2(ifftshift(sfftI1));

% 显示逆变换后的图像
figure;
imshow(uint8(abs(inv_fftI1)));
title('Inverse FFT');

% 若需要保存频谱图和逆变换后的图像，可以使用 imwrite 函数
% imwrite(uint8(A1), 'magnitude_spectrum.bmp');
% imwrite(uint8(abs(inv_fftI1)), 'inverse_fft_image.bmp');
