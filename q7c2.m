file = 'church.wav';
[y,Fs] = audioread(file);
myVoice = audiorecorder;
recordblocking(myVoice,5);
myRec = getaudiodata(myVoice);
out = conv2(y,myRec);
disp('playing convuled sound');
sound(out)