function [image] = DenoiseTwigs(inpImage)
    twigs_noise = imread(inpImage);

    r = size(twigs_noise, 1); c = size(twigs_noise, 2);
    a = uint8(zeros(r,c));
    
    red_fft = fftshift(fft2(twigs_noise(:,:,1))); % fft of red channel
    green_fft = fftshift(fft2(twigs_noise(:,:,2))); % fft of green channel
    blue_fft = fftshift(fft2(twigs_noise(:,:,3))); % fft of blue channel

    filter = double(ones(r,c)); 
    l = 100;     
    b = 1;      
    filter(1:l, c/2-b+1:c/2+b+1) = 0.0;
    filter(r-l:r, c/2-b+1:c/2+b+1) = 0.0;
    b = 2;
    filter(ceil(r/2)-b:ceil(r/2)+b, 1:l) = 0.0;
    filter(ceil(r/2)-b:ceil(r/2)+b, c-l:c) = 0.0;

    red_filtered = red_fft.*filter;
    green_filtered = green_fft.*filter;
    blue_filtered = blue_fft.*filter;
    red = uint8(abs(ifft2(ifftshift(red_filtered))));
    green = uint8(abs(ifft2(ifftshift(green_filtered))));
    blue = uint8(abs(ifft2(ifftshift(blue_filtered))));

    image = cat(3, red, green, blue);
    imshow(image)
end
