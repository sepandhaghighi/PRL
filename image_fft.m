function y = image_fft( image,index )

if strcmp('fft-1',index)
 y=fftshift(fft(image,[],1));
 
    

elseif strcmp('fft-2',index)
    y=fftshift(fft(image,[],2));
    
elseif strcmp('fft2',index)
    disp('test')
    temp=fft2(image);
    y=fftshift(temp);
    return y;
    
elseif strcmp('ifft-1',index)
    y=ifft(image,[],1);
elseif strcmp('ifft-2',index)
    y=ifft(image,[],2);    
elseif strcmp('ifft2',index)
    y=ifft2(image);
    
    
    
end



end

