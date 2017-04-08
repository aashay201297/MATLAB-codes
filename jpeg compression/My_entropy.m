function [final] = My_entropy(image)
a = imhist(uint8(image));
total = size(image,1)*size(image,2);
p = a/total;
p((p==0))=1;
p = p.*log2(p);
final = -1 * sum(p);
end