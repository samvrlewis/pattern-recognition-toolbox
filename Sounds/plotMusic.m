[Y,FS,NBITS]=wavread('music.wav');

t = 1:length(Y);
t = t/FS;

plot(t, Y);
xlabel('Time (s)');
ylabel('Amplitude');
title('Music sample');