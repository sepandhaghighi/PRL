clear all
close all
clc
image_files=ls('*.bmp');
count=size(image_files,1);
disp('Image File In This Folder :');
file_name=[];
for i=1:count
    disp(image_files(i,:))
end

input_index=input('Please Enter One By Number :');
if isempty(input_index)
    input_index=1;
end
figure(1)
 switch(input_index)
     case 1
         file_name=image_files(1,:);
        image=imread(file_name);
        set(figure(1),'Name','Circle Fourier Spectrum');
     case 2
         file_name=image_files(2,:);
        image=imread(file_name);
         set(figure(1),'Name','Plus Fourier Spectrum');
     case 3
         file_name=image_files(3,:);
        image=imread(file_name);
         set(figure(1),'Name','Pointer Fourier Spectrum');
     case 4
         file_name=image_files(4,:);
        image=imread(file_name);
        set(figure(1),'Name','Rect Fourier Spectrum');
         
 end
 image=rgb2gray(image);
 image_size=size(image);
F=image_fft(image,'fft2');  % Get 2-Dim FFT Of Image Matrix And Pass It To F Variable
real_image_fft=F;
F = abs(F); % Get the magnitude
F = log(F+1); % Use log, for perceptual scaling, and +1 since log(0) is undefined
F = mat2gray(F); % Use mat2gray to scale the image between 0 and 1

imshow(F,[]); % Display the result
filter_index=input('Please Enter On Of This Filter To Applied To Image : \n 1.HighPass (First Order) \n 2.HighPass(Second Order) \n 3.LowPass \n');
 if (isempty(filter_index))
     filter_index=1;
 end
 figure(2);
 switch filter_index
     
     case 1
         filter=fspecial('prewit');
         
     case 2
         filter=fspecial('laplacian');
     case 3
         filter=fspecial('average');
         
 end
 filter_fft=fft2(filter,image_size(1),image_size(2));
 set(figure(2),'name','Filter Spectrum');
 filter_fft=fftshift(filter_fft);
 imshow(mat2gray(log(abs(filter_fft)+1)),[]);
 result_fft=filter_fft.*real_image_fft;
 figure(3);
 set(figure(3),'name','Output');
 imshow(ifft2(result_fft));
 
% cd fft
% imwrite(F,file_name(:));
% cd ..