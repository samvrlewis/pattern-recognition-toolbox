pd(1) = GaussD('Mean', 0, 'StDev', 1);
pd(2) = GaussD('Mean', 3, 'StDev', 2);
mc=MarkovChain([1 0],[0.9 0.1; 0.9 0.1]);
h = HMM(mc, pd);

x = [-0.2 2.6 1.3];
c = [1 0.1625 0.8266 0.0581];

scaledX = prob(pd, x);
[a, c] = forward(mc, scaledX)
logprob(h, x)