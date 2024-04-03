clear all;
f = imread('D:\desk\dip\exp4\flowers\f1.jpg');
grayImage = im2gray(f);
% se = offsetstrel('ball',6,6);
se = strel('disk',4);
erodedI = imerode(grayImage,se);
% figure;
% imshow(erodedI);
dilatedI = imdilate(grayImage,se);
openedImage = imopen(grayImage, se);
closedImage = imclose(grayImage, se);

topHatImage = imtophat(grayImage, se);
bottomHatImage = imbothat(grayImage, se);
figure;
subplot(2,4,1), imshow(dilatedI), title('dilated');
subplot(2,4,2), imshow(openedImage), title('openedImage');
subplot(2,4,3), imshow(closedImage), title('closedImage');
subplot(2,4,5), imshow(topHatImage), title('topHatImage');
subplot(2,4,6), imshow(bottomHatImage), title('bottomHatImage');
subplot(2,4,7),imshow(erodedI),title('eroded')