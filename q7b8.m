[y,Fs] = audioread('recObj.wav');
[P,Q] = rat(8192/Fs);
ynew = resample(y,P,Q);
disp('playing sound with 8KHz sampling')
sound(ynew,Fs*P/Q);