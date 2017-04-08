function [output] = myDCT_dequantisation(imqDCT,qm,c)
qm = c*qm;
output = imqDCT.*qm;
end