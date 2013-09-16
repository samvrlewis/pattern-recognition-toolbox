mc = MarkovChain([0.75; 0.25], [0.99 0.01 ; 0.03 0.97]);

b1 = GaussD('Mean', 0, 'StDev', 1);
b2 = GaussD('Mean', 3, 'StDev', 2);

h = HMM(mc, [b1 ; b2]) ;

[X, S] = rand(h, 500);

plot(X);
hold on;

plot(S, '--r', 'LineWidth', 4);