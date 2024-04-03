function segmented_image = region_growing_2(img, threshold)
    % img: 输入图像
    % threshold: 用于确定像素是否相似的阈值

    % 获取图像的尺寸
    [rows, cols] = size(img);

    % 找到灰度值最大的像素点作为种子点
    [~, maxIndex] = max(img(:));
    [seedX, seedY] = ind2sub(size(img), maxIndex);
    seed = [seedX, seedY];

    % 初始化一个标记矩阵，用于记录像素是否已被访问
    visited = false(rows, cols);

    % 初始化队列，用于存储待处理的像素点
    queue = []; 
    queue(end+1,:) = seed; % 将种子点添加到队列中

    % 循环直到队列为空
    while ~isempty(queue)
        % 弹出队列中的一个像素
        pixel = queue(1,:);
        queue(1,:) = []; % 移除处理过的像素

        x = pixel(1);
        y = pixel(2);

        % 检查当前像素是否已经被访问过
        if visited(x, y)
            continue;
        end

        % 标记当前像素为已访问
        visited(x, y) = true;

        % 检查四邻域像素
        for dx = -1:1
            for dy = -1:1
                newX = x + dx;
                newY = y + dy;
                % 确保邻域像素在图像内
                if newX > 0 && newX <= rows && newY > 0 && newY <= cols
                    % 检查邻域像素是否与当前像素相似
                    if abs(img(newX, newY) - img(x, y)) <= threshold
                        % 将相似的像素加入到队列中
                        queue(end+1,:) = [newX newY];
                    end
                end
            end
        end
    end

    % 使用访问过的像素构建分割后的图像
    segmented_image = uint8(visited) * 255;
end
