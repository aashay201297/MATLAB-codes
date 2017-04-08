function [output] = myDCT_quantisation(imDCT,qm,c)
qm = c*qm;
output = round(imDCT./qm);
end