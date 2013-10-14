function cept_plot(Y, FS, bands, plot_title)

%get the coeffecients
[mfccs,~,f,t] = GetSpeechFeatures(Y,FS,0.03,bands);

for i=1:bands
    avg = mean(mfccs(i,:));
    std_dev = std(mfccs(i, :));
    mfccs(i, :) = (mfccs(i, :) - avg)/std_dev; %normalise
end

imagesc(t, f, mfccs);
axis xy;
colorbar;
title(plot_title);
xlabel('Time (s)');
ylabel('Frequency (Hz)');
end

    
    
    
