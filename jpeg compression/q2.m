%% Calculate DCT and quantised DCT 
%% read the image and define quantisation matrix and basis matrix
image = imread('LAKE.TIF');
F = [16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101 ;
    72 92 95 98 112 100 103 99]; 
b = create_dct_mat();
%% calculate DCT, quantised DCT and reconstructed image for leftmost corner (45,420)
i = 45;
j = 420;
recDCT1 = myDCT(image(i:i+7,j:j+7) , b);
recDCTquan1 = myDCT_quantisation( recDCT1 , F , 2 );
rec1 = uint8( myIDCT(myDCT_dequantisation( myDCT_quantisation( myDCT(image(i:i+7,j:j+7),create_dct_mat()),F,2 ),F,2), create_dct_mat()));
%% calculate DCT, quantised DCT and reconstructed image for leftmost corner (298,427)
i = 298;
j = 427;
recDCT2 = myDCT(image(i:i+7,j:j+7) , b);
recDCTquan2 = myDCT_quantisation( recDCT2 , F , 2 );
rec2 = uint8( myIDCT(myDCT_dequantisation( myDCT_quantisation( myDCT(image(i:i+7,j:j+7),create_dct_mat()),F,2 ),F,2), create_dct_mat()));
%% calculate DCT, quantised DCT and reconstructed image for leftmost corner (230,30)
i = 230;
j = 30;
recDCT3 = myDCT(image(i:i+7,j:j+7) , b);
recDCTquan3 = myDCT_quantisation( recDCT3 , F , 2 );
rec3 = uint8( myIDCT(myDCT_dequantisation( myDCT_quantisation( myDCT(image(i:i+7,j:j+7),create_dct_mat()),F,2 ),F,2), create_dct_mat()));
%% show the DCT matrix and store the calculated values
disp('We observe that in quantised DCT bottom right triangle is mostly zero');
disp('The reconstructed image is almost the same as the original image');
figure , imshow(rec1);
disp('dct for image 1 :'); 
disp(recDCT1);
disp('quantised DCT for image 1 :'); 
disp(recDCTquan1);

figure , imshow(rec2);
disp('dct for image 2 :'); 
disp(recDCT2);
disp('quantised DCT for image 1 :'); 
disp(recDCTquan2);

figure , imshow(rec3);
disp('dct for image 3 :'); 
disp(recDCT3);
disp('quantised DCT for image 1 :'); 
disp(recDCTquan3);

imwrite(rec1,'q2image1.TIFF');
imwrite(recDCT1, 'q2image1DCT.TIFF')
imwrite(recDCTquan1, 'q2image1DCTquan.TIFF')
imwrite(rec2,'q2image2.TIFF');
imwrite(recDCT2, 'q2image1DCT.TIFF')
imwrite(recDCTquan2, 'q2image1DCTquan.TIFF')
imwrite(rec3,'q2image3.TIFF');
imwrite(recDCT3, 'q2image1DCT.TIFF')
imwrite(recDCTquan3, 'q2image1DCTquan.TIFF')