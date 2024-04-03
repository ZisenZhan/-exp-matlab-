img = imread('D:\desk\dip\exp3\云\云4.png'); % 加载图像
gray_img = rgb2gray(img); % 转换为灰度图像
imshow(gray_img)
% I_eq  = imadjust(gray_img, stretchlim(gray_img), []);
%imshow(I_eq)
gamma = 1.0; % 伽马值，可以改变这个值来观察不同的效果
I_gamma = imadjust(gray_img, [], [], gamma);
figure;
imshow(I_gamma)
[rows, cols] = size(gray_img);
seed = [220,150]; 
% 设置一个阈值
threshold =3; % 阈值，需要根据图像具体情况调整
% 应用区域生长算法
segmented_img = region_growing(I_gamma, seed, threshold);
figure;
imshow(segmented_img); % 显示分割后的图像