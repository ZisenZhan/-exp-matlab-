function img = bound2im(boundary)
    % 创建一个全黑的图像
    imageSize =[256,256];
    img = false(imageSize);

    % 遍历边界点，将对应的像素设置为白色
    for k = 1:size(boundary, 1)
        row = boundary(k, 1);
        col = boundary(k, 2);
        img(row, col) = true;
    end
end
