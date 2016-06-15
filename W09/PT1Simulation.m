K = 3.1;
tau = 0.1;
G = tf([K],[tau 1]);

H = c2d(G,T,'zoh');

y = lsim(H,u,tk);

figure(3)
plot(tk,y);

FFTSpektrum(y(end-N+1:end)-mean(y(end-N+1:end)),T, 1, 4)