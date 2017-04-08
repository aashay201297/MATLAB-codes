function [RM] = RMSE(im1,im2)
RM = sqrt(mean2((double(im1) - double(im2)).^2));  
end
