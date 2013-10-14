%logP=logprob(hmm,x) gives conditional log(probability densities)
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
%Code Authors: Anonymous
%----------------------------------------------------

function logP=logprob(hmm,x)
hmmSize=size(hmm);
T=size(x,2);
logP=zeros(hmmSize);
for i=1:numel(hmm)
    pr = 1;
    [pX, logS] = prob(hmm(i).OutputDistr, x);
    [alfaHat, c] = forward(hmm(i).StateGen,pX);
    
    for j = 1:length(logS)
        pr = pr*c(j)*exp(logS(j));
    end
    
    if length(c) == length(logS)
        logP(i) = sum(log(pr));
    else
        logP(i) = sum(log(pr)) + log(c(end));
    end
    
    
end
end