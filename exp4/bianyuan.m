% 加载图像
gray_img = imread('');
gray_img = rgb2gray(gray_img);
figure;
histogram = imhist(gray_img);
bar(histogram);
% 灰度化处理
% gray_img = rgb2gray(img);
%二值化
threshold = graythresh(gray_img);
binary_img1 = imbinarize(gray_img, threshold);
% interval1 = 50:100;
% [minVal1, minLoc1] = min(histogram(interval1));
% minLoc1 = minLoc1 + interval1(1) - 1;
% binary_img1 = imbinarize(gray_img, minLoc1/255);

% 应用不同的边缘检测算子
edge_sobel = edge(gray_img, 'sobel');
% edge_prewitt = edge(gray_img, 'prewitt');
edge_roberts = edge(gray_img, 'roberts');
% edge_log = edge(gray_img, 'log');
% edge_canny = edge(gray_img, 'canny');

% 显示所有结果
figure;
subplot(2,4,1),imshow(binary_img1)
% subplot(2,4,1), imshow(img), title('原图像');
subplot(2,4,2), imshow(gray_img), title('灰度图像');
subplot(2,4,3), imshow(edge_sobel), title('Sobel 边缘检测');
% subplot(2,4,4), imshow(edge_prewitt), title('Prewitt 边缘检测');
subplot(2,4,5), imshow(edge_roberts), title('Roberts 边缘检测');
% subplot(2,4,6), imshow(edge_log), title('LoG 边缘检测');
% subplot(2,4,7), imshow(edge_canny), title('Canny 边缘检测');

% 调整 subplot 间距
set(gcf, 'Position', get(0, 'Screensize'));
