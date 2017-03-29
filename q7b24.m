[y,Fs] = audioread('recObj.wav');
[P,Q] = rat(24576/Fs);
ynew = resample(y,P,Q);
disp('playing sound with 24KHz sampling')
sound(ynew, Fs);
