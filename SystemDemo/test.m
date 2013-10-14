directories = {'Fridge', 'Light', 'Microwave', 'Oven', 'Phone', 'Television', 'TurnOff', 'TurnOn'};
recordingDir = '/Users/Sam/Dropbox/Uni/EN2202/Recordings/';

[sample,fs,nbits] = wavread(strcat(recordingDir, directories{2}, '/', int2str(1), '.wav'));
%words{word_i, sample_i} = sample;

mfccs=getNormalisedFeatures(sample, fs, window, bands);

lP = logprob(hmms, mfccs)
