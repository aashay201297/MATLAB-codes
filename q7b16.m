[y,Fs] = audioread('recObj.wav');
[P,Q] = rat(16384/Fs);
ynew = resample(y,P,Q);
disp('playing sound with 16KHz sampling')
sound(ynew);