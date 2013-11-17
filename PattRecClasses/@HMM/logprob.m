function logP=logprob(hmm,x) 
%gives conditional log(probability densities)
%for an observed sequence of (possibly vector-valued) samples,
%for each HMM object in an array of HMM objects.
%This can be used to compare how well HMMs can explain data from an unknown source.
%
%Input:
%hmm=   array of HMM objects
%x=     matrix with a sequence of observed vectors, stored columnwise
%NOTE:  hmm DataSize must be same as observed vector length, i.e.
%       hmm(i).DataSize == size(x,1), for each hmm(i).
%       Otherwise, the probability is, of course, ZERO.
%
%Result:
%logP=  array with log probabilities of the complete observed sequence.
%logP(i)=   log P[x | hmm(i)]
%           size(logP)== size(hmm)
%
%The log representation is useful because the probability densities
%exp(logP) may be extremely small for random vectors with many elements
%
%Method: run the forward algorithm with each hmm on the data.
%
%Ref:   Arne Leijon (20xx): Pattern Recognition.
%
%----------------------------------------------------
%Code Authors:
%----------------------------------------------------
hmmSize=size(hmm);%size of hmm array
T=size(x,2);%number of vector samples in observed sequence
logP=zeros(hmmSize);%space for result
for i=1:numel(hmm)%for all HMM objects  
    
    [p,scaleFactors]=prob(hmm(i).OutputDistr,x);
    [~,c] = forward(hmm(i).StateGen, p);
    
    for j=1:length(c)
        logP(i) = logP(i) + log(c(j));
    end
    logP(i) = logP(i) + sum(scaleFactors);
    
end;