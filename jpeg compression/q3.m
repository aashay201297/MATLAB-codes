%% Calculate the quantised DCT of LAKE.TIFF
%% Read the image
image = imread('LAKE.TIF');
%% calculate basis matrix and quantisation matrix 
F = create_dct_mat();
qm = [16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101 ;
    72 92 95 98 112 100 103 99]; 
%% calculate quantised DCT of LAKE.TIF
for i = 1:8:512
    for j = 1:8:512
        rec1 = myDCT_quantisation( myDCT(image(i:i+7,j:j+7),F) , qm , 1);
        im(i:i+7,j:j+7) = rec1;
    end
end
%% Show the image and write it
imshow(uint8(im));
imwrite(uint8(im),'q3.TIFF');
disp('We see white dots in the quantised DCT only on those points where the original image is also white');