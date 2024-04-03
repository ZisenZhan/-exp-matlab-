% 读入图像
originalImage = imread('Eagle.bmp');
% 图像变亮
brightenedImage = imadjust(originalImage, [0 1], [0.4 1]);
% 图像变暗
darkenedImage = imadjust(originalImage, [0 1], [0 0.6]);
% 图像负片效果
negativeImage = imcomplement(originalImage);

figure;
subplot(2, 2, 1);
imshow(originalImage);
title('原始图像');

subplot(2, 2, 2);
imshow(brightenedImage);
title('变亮');

subplot(2, 2, 3);
imshow(darkenedImage);
title('变暗');

subplot(2, 2, 4);
imshow(negativeImage);
title('负片效果');

