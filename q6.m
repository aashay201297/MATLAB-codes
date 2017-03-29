sh = imread('shyam.jpg');
ku = imread('kumbhmela.jpg');
a = rgb2gray(sh);
b = rgb2gray(ku);
out = normxcorr2(a,b);
[ypeak, xpeak] = find(out==max(out(:)));
yoffSet = ypeak-size(sh,1);
xoffSet = xpeak-size(sh,2);
hFig = figure;
hAx  = axes;
imshow(ku,'Parent', hAx);
imrect(hAx, [xoffSet+1, yoffSet+1, size(sh,2), size(sh,1)]);