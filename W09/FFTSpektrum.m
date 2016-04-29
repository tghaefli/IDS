function FFTSpektrum(x,T, Np, figNumber)

N = length(x);


figure(figNumber)
if Np > N 
    y = fft(x,Np);    
    N = Np;
else
    y = fft(x);
end

w = (0:N-1)*2*pi/T/N;

semilogx(w,1/N*20*log10(abs(y)),'+');
xlabel('Frequency (rad/s)');
title('Spectrum');