%% This function will create the basis matrix for DCT 
function [ans1] = create_dct_mat()
%ans1 will be the final basis matrix 
ans1(1:8,1:8) = 1;
for i = 0:7
   for j = 0:7
       if i == 0
           ans1(i+1,j+1) = sqrt(1/8);
       else
           ans1(i+1,j+1) = sqrt(2/8) * cos((pi * (2*j+1) * i)/(16));
       end
    end
end
end
