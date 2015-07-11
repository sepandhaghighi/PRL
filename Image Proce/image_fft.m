function y = image_fft( image,index )
% This Function Get FFT And FFT-Inverse In 2 And 1 Dimention By Pass A
% Strig To Index Argument
temp=[];
image_size=size(image);
if strcmp('fft-1',index)
 temp=fft(image,[],1);    
    

elseif strcmp('fft-2',index)
    temp=fft(image,[],2);
    
elseif strcmp('fft2',index)
    temp=fft2(image,image_size(1),image_size(2));
elseif strcmp('ifft-1',index)
    temp=ifft(image,[],1);
elseif strcmp('ifft-2',index)
    temp=ifft(image,[],2);    
elseif strcmp('ifft2',index)
    temp=ifft2(image,image_size(1),image_size(2));
    
    
    
end

y=fftshift(temp);



end

