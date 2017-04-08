function [final] = myIDCT(im,F)
Fin = F';
final = double(Fin) * double(im) * double(F);
end
