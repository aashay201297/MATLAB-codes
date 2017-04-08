%% This code will calculate reconstructed image for c = 1 to 50
%% Read the image
image = imread('LAKE.TIF');
F = [16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101 ;
    72 92 95 98 112 100 103 99];
%% start loop for c
for c = 1:50
    for i = 1:8:512
        for j = 1:8:512
            % reconstruct image
            rec1 = uint8( myIDCT(myDCT_dequantisation( myDCT_quantisation( myDCT(image(i:i+7,j:j+7),create_dct_mat()),F,c ),F,c), create_dct_mat()));
            im(i:i+7,j:j+7) = rec1;
        end
    end
    if c == 10
        imwrite(uint8(im),'q4c10.TIFF');
        disp('We observe that as the c increases the perceptibility of the image decreases');
        imshow(im) , title('c = 10');
    end
    rm(c) = RMSE(image,im);
    ent(c) = My_entropy(im);
    %store values for rmse error and entropy
end
rm 
ent


