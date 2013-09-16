 %% Verify use of vector?valued output distributions

mc = MarkovChain([0.75; 0.25], [0.99 0.01; 0.03 0.97]); 
d = 10; % dimension
a = 1.5; % factor for the mean generation
b = 3; % additive constant for the mean generation

% Generate a symmetric matrix to use as covariance
A = rand(10);
B = A+A';

% distribution for state 1
g1 = GaussD('Mean', a*randn(1,d), 'Covariance', B);
% distribution for state 2
g2 = GaussD('Mean', b+a*randn(1,d), ...
'Covariance', diag(rand(1,10)));
h = HMM(mc, [g1; g2]);  % the HMM
X = h.rand(1e4);        % data generation
