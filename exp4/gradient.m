clear all;
I = imread("D:\desk\dip\exp4\flowers\f1.jpg");
I = rgb2gray(I);
[Gx,Gy] = imgradientxy(I);
imshowpair(Gx,Gy,'montage')
title('Directional Gradients Gx and Gy, Using Sobel Method')