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
randNums = rand(1, nData); %uniformly random numbers in interval (0, 1)

for i = 1:nData
    %find the 'bin' each random number is in.. the actual random number is
    %then is this 'bin'
    R(i) = find(randNums(i) < cumProbs, 1); 
end
