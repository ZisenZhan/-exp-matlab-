I=imread('Autumn.bmp');

gray_image = rgb2gray(I);

% 计算直方图
[counts, binLocations] = imhist(gray_image);

% 绘制直方图
figure;
bar(binLocations, counts);
title('Histogram');
xlabel('Pixel Value');
ylabel('Frequency');