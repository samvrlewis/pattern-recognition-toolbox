function R=rand(pD,nData)
%R=rand(pD,nData) returns random scalars drawn from given Discrete Distribution.
%
%Input:
%pD=    DiscreteD object
%nData= scalar defining number of wanted random data elements
%
%Result:
%R= row vector with integer random data drawn from the DiscreteD object pD
%   (size(R)= [1, nData]
%
%----------------------------------------------------
%Code Authors:
%----------------------------------------------------

if numel(pD)>1
    error('Method works only for a single DiscreteD object');
end;

%*** Insert your own code here and remove the following error message 
R = zeros(1, nData);
cumProbs = cumsum(pD.ProbMass);

for i = 1:nData
    %generate a uniformly distributed number with rand in the interval (0,
    %1) then find the 'bin' that the random number is in according to the
    %probability mass function. the actual random number isthen is this 'bin'
    R(i) = find(rand(1) < cumProbs, 1); 
end
