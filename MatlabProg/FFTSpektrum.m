function [w_out, fft_x] = FFTSpektrum(x,T, Np, figNumber)

N = length(x);


figure(figNumber)
if Np > N 
    y = fft(x,Np);    
    N = Np;
else
    y = fft(x);
end

w = (0:N-1)*2*pi/T/N;

M = ceil(N/2);

w_out = w(1:M);
fft_x = y(1:M);

semilogx(w(1:M),1/N*20*log10(abs(y(1:M))),'+');
xlabel('Frequency in \omega(rad/s)');
title('Spectrum');