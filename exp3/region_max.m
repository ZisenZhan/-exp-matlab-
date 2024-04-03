
% 使用函数的示例代码
img = imread('rose.bmp');     % 加载图像
gray_img = rgb2gray(img);        % 转换为灰度图像

% 设置一个阈值
threshold = 6; % 阈值，需要根据图像具体情况调整

% 应用区域生长算法
segmented_img = region_growing_2(gray_img, threshold);
imshow(segmented_img);          % 显示分割后的图像
