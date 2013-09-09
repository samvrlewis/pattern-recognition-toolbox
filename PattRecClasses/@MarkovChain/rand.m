function S=rand(mc,T)
%S=rand(mc,T) returns a random state sequence from given MarkovChain object.
%
%Input:
%mc=    a single MarkovChain object
%T= scalar defining maximum length of desired state sequence.
%   An infinite-duration MarkovChain always generates sequence of length=T
%   A finite-duration MarkovChain may return shorter sequence,
%   if END state was reached before T samples.
%
%Result:
%S= integer row vector with random state sequence,
%   NOT INCLUDING the END state,
%   even if encountered within T samples
%If mc has INFINITE duration,
%   length(S) == T
%If mc has FINITE duration,
%   length(S) <= T
%
%---------------------------------------------
%Code Authors:
%---------------------------------------------

S=zeros(1,T);%space for resulting row vector
nS=mc.nStates;

%get the distribution for the starting state and find the starting state 
initialStateDist = DiscreteD(mc.InitialProb);
S(1) = rand(initialStateDist, 1);

for i = 2:T
    %get the distribution for the current state to all others
    transitionDist = DiscreteD(mc.TransitionProb(S(i-1), :));
    
    %find the next state that we'll go to
    S(i) = rand(transitionDist, 1);
    
    if S(i) == nS+1 && mc.finiteDuration() %do i need to check if it has a finite duration? think it only goes to nS+1 if it is
        %markov chain is finite and has reached its end point
        S = S(1:i-1); %resize the state chain and return
        break;
    end
end




