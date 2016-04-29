close all;  clear all;  clc;

PRBS_gen

K = 3.1;
Tau1 = 0.1;
Tau2 = 1/10*Tau1;

G = tf(K, [Tau1 1]) * tf(K, [Tau1 1])

H = c2d(G,T,'zoh');


y = lsim(H,u,tk);
plot(tk,y)

[w_u, fft_u] = FFTSpektrum(u(end-N+1:end)-mean(u(end-N+1:end)),T,1,2);    % fft_u
[w_y, fft_y] = FFTSpektrum(y(end-N+1:end)-mean(y(end-N+1:end)), T, 1, 4);



% FFT(y) / FFT(u)
% Falls FFT(u) = 0, Punkt aussortieren

I = find(abs(fft_u) > 10);
G_exp = fft_y(I) ./ fft_u(I);


figure(5)
semilogx(w_u(I) , 20*log10(abs(G_exp)));
xlabel('Frequency (rad/s)');
ylabel('Gain');
title('Spectrum');

figure(6)
semilogx(w_u(I) , angle(G_exp)*180/pi);
xlabel('Frequency (rad/s)');
ylabel('Phase');
title('Spectrum');