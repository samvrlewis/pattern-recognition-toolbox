[Y,FS,NBITS]=wavread('music.wav');

figure(1);
subplot(1, 2, 1);
spec_plot(Y, FS, 'Spectrogram for music.wav');

subplot(1, 2, 2);
cept_plot(Y, FS, 13, 'Cepstrogram for music.wav');

[Y,FS,NBITS]=wavread('female.wav');
figure(2);
subplot(2, 2, 1);
spec_plot(Y, FS, 'Spectrogram for female.wav');

subplot(2, 2, 2);
cept_plot(Y, FS, 13, 'Cepstrogram for female.wav');

[Y,FS,NBITS]=wavread('male.wav');
subplot(2, 2, 3);
spec_plot(Y, FS, 'Spectrogram for male.wav');

subplot(2, 2, 4);
cept_plot(Y, FS, 13, 'Cepstrogram for male.wav');