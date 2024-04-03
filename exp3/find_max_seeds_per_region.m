function seeds = find_max_seeds_per_region(img, n)
    [rows, cols] = size(img);
    seeds = zeros(n, 2);
    region_height = rows / n;
    
    for i = 1:n
        row_start = round((i-1) * region_height) + 1;
        row_end = round(i * region_height);
        region = img(row_start:row_end, :);
        [~, max_idx] = max(region(:));
        [max_row, max_col] = ind2sub(size(region), max_idx);
        max_row = max_row + row_start - 1;
        seeds(i, :) = [max_row, max_col];
    end
end
