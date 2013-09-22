[Y,FS,NBITS]=wavread('female.wav');
t = 1:length(Y);
t = t/FS;

plot(t, Y);
xlabel('Time (s)');
ylabel('Amplitude');
title('Female speech sample');

figure(2);
plot(t, Y);
xlabel('Time (s)');
ylabel('Amplitude');
title('Female speech - voiced segment');
xlim([0.6 0.65]);

figure(3);
plot(t, Y);
xlabel('Time (s)');
ylabel('Amplitude');
title('Female speech - unvoiced segment');
xlim([0.46 0.49]);

figure(4);
[Y,FS,NBITS]=wavread('music.wav');
t = 1:length(Y);
t = t/FS;

plot(t, Y);
xlabel('Time (s)');
ylabel('Amplitude');
title('Music sample');