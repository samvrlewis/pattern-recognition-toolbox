[Y,FS,NBITS]=wavread('female.wav');
[spectgram,f,t2]=GetSpeechFeatures(Y,FS,0.03);

[mfccs,~,f,t] = GetSpeechFeatures(Y,FS,0.03,13);
for i=1:13
    avg = mean(mfccs(i,:));
    std_dev = std(mfccs(i, :));
    mfccs(i, :) = (mfccs(i, :) - avg)/std_dev; %normalise
end

subplot(1, 2, 1);
imagesc(t2, f, abs(corr(log(spectgram))));
title('Spectrogram correlation');
colormap gray;

subplot(1, 2, 2);
imagesc(t2, f, abs(corr(mfccs)));
title('Cepstragram correlation');
colormap gray;



