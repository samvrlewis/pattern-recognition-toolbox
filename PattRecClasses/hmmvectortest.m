mc = MarkovChain([0.75; 0.25], [0.99 0.01 ; 0.03 0.97]);

mean1 = [1 2];
mean2 = [5 7];

cov1 = [1 0; 0 1];
cov2 = [2 1; 1 4];

b1 = GaussD('Mean', mean1, 'Covariance', cov1);
b2 = GaussD('Mean', mean2, 'Covariance', cov2);

h = HMM(mc, [b1 ; b2]) ;

[X, S] = rand(h, 500);
