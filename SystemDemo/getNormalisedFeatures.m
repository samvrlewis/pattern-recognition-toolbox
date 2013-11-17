function [mfccs, f, t] = getNormalisedFeatures(Y, FS, window, bands)

%get the coeffecients
[mfccs,~,f,t] = GetSpeechFeatures(Y,FS,window,bands);

for i=1:bands
    avg = mean(mfccs(i,:));
    std_dev = std(mfccs(i, :));
    mfccs(i, :) = (mfccs(i, :) - avg)/std_dev; %normalise
end

end