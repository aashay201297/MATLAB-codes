%% This code calculates the evolution of entropy versus RMSE error as c increases
%% read the image and initial values
image = imread('LAKE.TIF');
rm = zeros(1,20);
ent = zeros(1,20);
F = [16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101 ;
    72 92 95 98 112 100 103 99];
%% loop over c and store values of RMSE error and entropy
for c = 1:50
    for i = 1:8:512
        for j = 1:8:512
            rec1 = uint8( myIDCT(myDCT_dequantisation( myDCT_quantisation( myDCT(image(i:i+7,j:j+7),create_dct_mat()),F,c ),F,c), create_dct_mat()));
            im(i:i+7,j:j+7) = rec1;
        end
    end
    rm(c) = RMSE(image,im);
    ent(c) = My_entropy(im);
end

plot(rm,ent)