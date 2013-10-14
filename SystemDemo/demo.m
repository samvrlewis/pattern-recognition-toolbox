addpath('/Users/Sam/Dropbox/Uni/EN2202/PattRecClasses');
addpath('/Users/Sam/Dropbox/Uni/EN2202/GetSpeechFeatures');

load('hmms3.mat');

ar = audiorecorder(22050,16,1);
disp('Talk - you have 5 seconds');
record(ar);
pause(3);
stop(ar);
play(ar);

words = {'Fridge', 'Light', 'Microwave', 'Oven', 'Phone', 'Television', 'Turn Off', 'Turn On'};
inputWord = getaudiodata(ar);
mfccs=getNormalisedFeatures(inputWord, 22050, 0.030, 13);
lP = logprob(hmms, mfccs)
plot(lP);
set(gca,'XTickLabel', words)

[c, i] = max(lP);

disp(strcat(['Most likely word is ' words{i}]));