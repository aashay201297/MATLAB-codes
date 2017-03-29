myVoice = audiorecorder;
disp('start speaking');
recordblocking(myVoice,5);
disp('stop speaking');
myRec = getaudiodata(myVoice);
sound(myRec); %this line is to listen to recorded voice
