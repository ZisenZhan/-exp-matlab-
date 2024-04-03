function extract_pca(mul)
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % 该函数用来抽取并显示pca的各个主成分
% % %   param：
% % %       mul--输入图像是多光谱图像或者高光谱图像
% % %  @author：chaolei
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
[r,c,bands]=size(mul);
[vector,~,tempMul]= my_pca(mul);
% Y=AX（X中列为样本，若X行为样本，则Y =XA）
% PCA正变换
PC = tempMul*vector; 
% 提取多光谱图像的各个主成分
for i = 1:bands
    outPic = PC(:,i);
    min_value = min(outPic);
    max_value = max(outPic);
    outPic = reshape(outPic,[r,c]);
    figure;
    str = sprintf('%s%d%s','第',i,'主成分');
    imshow(outPic,[min_value,max_value]);title(str);
%     filename = sprintf('%d%s',i,'.jpg');
%     imwrite(outPic,filename);
end
end