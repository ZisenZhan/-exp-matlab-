lena_bmp=imread('含噪图像1.jpg');
lena_bmp=rgb2gray(lena_bmp);
figure;imshow(lena_bmp,[]);title('带有干扰信号的原图')
H1=fspecial('gaussian',[20 20],6);     %滤波器尺寸可更改，标准差可更改
H2=fspecial('average',15);
f1=filter2(H1,lena_bmp);
f2=filter2(H2,lena_bmp);
f3=medfilt2(lena_bmp,[15 15]);
figure;imshow(f1,[]);
title('高斯低通滤波器处理结果');
figure;imshow(f2,[]);
title('均值滤波器处理结果');
figure;imshow(f3,[]);
title('中值滤波器处理结果');
% 
% figure;imshow(lena_fft);title('处理后的频谱图');     %显示处理后的频谱图
% lena_fix=ifft(lena_fft,[],2);                           %进行一维FFT反变换 
% figure;imshow(lena_fix,[0,255]);title('处理后的图像');   %显示处理后的图像