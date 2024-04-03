% 1. 读入两幅不同图像
image1 = imread('Autumn.bmp'); % 读入第一幅图像
image2 = imread('Eagle.bmp'); % 读入第二幅图像
% 2. 执行加、减、乘、除操作
addition_result = imadd(image1, image2); % 加法
subtraction_result = imsubtract(image1, image2); % 减法
multiplication_result = immultiply(image1, image2); % 乘法
division_result = imdivide(image1, image2); % 除法

figure;
subplot(2, 3, 1);
imshow(image1);
title('图像1');

subplot(2, 3, 2);
imshow(image2);
title('图像2');

subplot(2, 3, 3);
imshow(addition_result);
title('加法结果');

subplot(2, 3, 4);
imshow(subtraction_result);
title('减法结果');

subplot(2, 3, 5);
imshow(multiplication_result);
title('乘法结果');

subplot(2, 3, 6);
imshow(division_result);
title('除法结果');




