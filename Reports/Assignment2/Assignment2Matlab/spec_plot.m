function spec_plot(Y, FS, plot_title)

[spectgram,f,t2]=GetSpeechFeatures(Y,FS,0.03);
imagesc(t2, f, log(spectgram));
axis xy;
xlabel('Time (s)');
ylabel('Frequency (Hz)');
colorbar; 
title(plot_title);
end

    
    
    
