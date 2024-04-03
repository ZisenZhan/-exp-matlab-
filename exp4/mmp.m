%实验实例
f = imread('D:\desk\dip\exp4\flowers\f1.jpg');
f1 = im2gray(f);
f1_resized = imresize(f1, [256, 256]);
f2 = imbinarize(f1_resized);
imshow(f2);
 
figure;
g = bwperim(f2,8);
imshow(g);
Q = qtdecomp(g, 0, 2);
 
array = qtgetblk(g,Q,2);
 
%这个作用就是把对应的的数值都设置为1，这里头是把矩阵设置成为2X2的1矩阵
valmodes = zeros(size(array));
for blknum = 1 : size(array,3)
    valmodes(:,:,blknum) = ones(2,2);
end
 
%这个函数调用有四个参数，第一个参数的作用是把g这个划分好边界的g传入，
%然后第二个q的作用是每个点的索引和大小，第三个是变成对应的块的大小，第四个的作用是吧重新划分好的每一块的样子传入到这个函数当中去
J = qtsetblk(g,Q,2,valmodes);
figure;
imshow(J);
 
%这个填充只能是白色作为边框，黑色作为背景
R = imfill(J,'holes');
figure;
imshow(R);
B = bwboundaries(R,4,"noholes");
 b = B{1};
b = bound2im(b);
figure;
imshow(b);
