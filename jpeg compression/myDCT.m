function [final] = myDCT(im,F)
% calculate transpose
Fin = F';
final = double(F) * double(im) * double(Fin);
end