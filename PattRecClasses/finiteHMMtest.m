mc = MarkovChain([0.75; 0.25], [0.89 0.01 0.1; 0.03 0.87 0.1]);

b1 = GaussD('Mean', 0, 'StDev', 1);
b2 = GaussD('Mean', 3, 'StDev', 2);

h = HMM(mc, [b1 ; b2]) ;

tests = 1000;
average = 0;

for i=1:tests
    [X, S] = rand(h, 500);
    average = average + length(X);
end

average/tests
