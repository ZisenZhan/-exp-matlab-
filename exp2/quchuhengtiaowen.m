lena_bmp=imread('����ͼ��1.jpg');
lena_bmp=rgb2gray(lena_bmp);
figure;imshow(lena_bmp,[]);title('���и����źŵ�ԭͼ')
H1=fspecial('gaussian',[20 20],6);     %�˲����ߴ�ɸ��ģ���׼��ɸ���
H2=fspecial('average',15);
f1=filter2(H1,lena_bmp);
f2=filter2(H2,lena_bmp);
f3=medfilt2(lena_bmp,[15 15]);
figure;imshow(f1,[]);
title('��˹��ͨ�˲���������');
figure;imshow(f2,[]);
title('��ֵ�˲���������');
figure;imshow(f3,[]);
title('��ֵ�˲���������');
% 
% figure;imshow(lena_fft);title('������Ƶ��ͼ');     %��ʾ������Ƶ��ͼ
% lena_fix=ifft(lena_fft,[],2);                           %����һάFFT���任 
% figure;imshow(lena_fix,[0,255]);title('������ͼ��');   %��ʾ������ͼ��