function [number] = Eavesdrop(audio)
 Fs = 44100;            % Sampling frequency
 T = 1/Fs;             % Sampling period
 digits=zeros(10,2);
 for i=0:9
     S=audioread(strcat('201502112/q1/',num2str(i),'.ogg'));
     ans=fft(S);
     ans=abs(ans);
     ans=ans(1:size(ans,1)/2+1);  
     [m,digits(i+1,1)]=max(ans);    
     ans(digits(i+1,1))=0;     
     [m,digits(i+1,2)]=max(ans);   
end
S=audioread(audio);
L=size(S,1)/Fs;
number='';
for i=1:L
    Temp=S(1+Fs*(i-1):Fs*i);
    ans=fft(Temp);
    ans=abs(ans);
    ans=ans(1:size(ans,1)/2+1);
    [m,f1]=max(ans);
    ans(f1)=0;
    [m,f2]=max(ans);     
    for j=1:10
        if (f1==digits(j,1) && f2==digits(j,2)) || (f2==digits(j,1) && f1==digits(j,2))
            number=strcat(number,num2str(j-1));           
        end
    end
end
end
             
    
