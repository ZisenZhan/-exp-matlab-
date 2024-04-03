img = imread('D:\desk\dip\exp3\河流\water140.bmp');
gray_img = rgb2gray(img);

% 分割成 N 个区域并找到种子点
n = 10;  % 例如，分割成 5 个区域
seeds = find_max_seeds_per_region(gray_img, n);

% 设置阈值
threshold = 1;  % 阈值，可能需要根据图像调整

% 使用区域生长算法进行图像分割
segmented_img = region_growing_with_seeds(gray_img, seeds, threshold);
imshow(segmented_img);
