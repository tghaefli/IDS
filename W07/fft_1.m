close all; clear all; clc;

fs=5;
tk=[0:29]*1/fs;
T=2;
x=cos(2*pi*tk/T);
figure(1)
plot(tk,x,'+')   % 2 Hz,  5 samples per Period


y=x(1:10);
figure(2)
plot(y,'+')   % 2 Hz,  5 samples per Period


%%
clc;
FFTSpectrum(x(1:10), 1/fs, 500, 2)



%%

N1 = 64;
N2 = 128;
N3 = 256;

X1 = abs(fft(x,N1));   F1 = [0:N1-1]/N1;
X2 = abs(fft(x,N2));   F2 = [0:N2-1]/N2;
X3 = abs(fft(x,N3));   F3 = [0:N3-1]/N3;


figure(2)
subplot(3,1,1)
plot(F1,X1,'-x'),title('N=64'),axis([0 1 0 20])

subplot(3,1,2)
plot(F2,X2,'-x'),title('N=128'),axis([0 1 0 20])

subplot(3,1,3)
plot(F3,X3,'-x'),title('N=256'),axis([0 1 0 20])