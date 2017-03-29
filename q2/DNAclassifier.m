function [species] = DNAclassifier(DNA)
 Fs = 1000;            % Sampling frequency
 load('201502112/q2/AncestorData.mat');
 load('201502112/q2/TestData.mat');
 
 human=zeros(4,2); 
 chimp=zeros(4,2);
 rhesu=zeros(4,2);
 for i=1:4
     S=chimps(i,:);
     a=fft(S);
     a=abs(a);
     a=a(1:size(a,2)/2);
     [m,chimp(i,1)]=max(a);
    if i<4
     a(chimp(i,1))=0; 
    end
     [m,chimp(i,2)]=max(a);
      
 end
 
 for i=1:4
     S=humans(i,:);
     a=fft(S);
     a=abs(a);
     a=a(1:size(a,2)/2);
     [m,human(i,1)]=max(a); 
     if i<4
         a(human(i,1))=0; 
     end
     [m,human(i,2)]=max(a);
      
 end
 
 for i=1:4
     S=rhesus(i,:);
     a=fft(S);
     a=abs(a);
     a=a(1:size(a,2)/2);
     [m,rhesu(i,1)]=max(a);   
     if i<4
        a(rhesu(i,1))=0;
     end
     [m,rhesu(i,2)]=max(a);
      
 end
F2=zeros(4,2);
for i=1:4
     S=DNA(i,:);
     a=fft(S);
     a=abs(a);
     a=a(1:size(a,2)/2);
     [m,F2(i,1)]=max(a);  
     if i<4
        a(F2(i,1))=0;     
     end
     [m,F2(i,2)]=max(a);
      
end

if isequal(F2,chimp)
    species='chimps';
end
if isequal(F2,human)
    species='humans';
end
if isequal(F2,rhesu)
    species='rhesus';
end

end
