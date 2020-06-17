W_cont = -1:0.001:1;
W_discrete = W_cont*15;
W_discrete = round(W_discrete,0);
W_discrete = W_discrete/15;

plot(W_cont, W_discrete);
xlabel("Continuous Value");
ylabel("Binary weighted value");
