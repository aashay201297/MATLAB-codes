mat1 = zeros(250,500);
mat2 = 255*ones(250,500);
mat3 = [mat1;mat2];
black = [1/3 1/3 1/3; 0 0 0;-1/3 -1/3 -1/3];

ans = conv2(mat3,black);
imshow(ans);