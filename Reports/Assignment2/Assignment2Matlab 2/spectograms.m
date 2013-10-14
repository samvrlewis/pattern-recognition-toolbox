[Y,FS,NBITS]=wavread('music.wav');
spec_plot(Y, FS, 'Spectrogram for music.wav');

figure(2);
[Y,FS,NBITS]=wavread('female.wav');
spec_plot(Y, FS, 'Spectrogram for female.wav');
