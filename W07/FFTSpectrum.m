function [ output_args ] = FFTSpectrum(x, Ts, Np, figNumbers)

warning('obsolete spectrum, use FFTSpektrum');

        
N=length(x);
y=fft(x,Np)/N;

if(N>=Np)
    w=(0:N-1)*2*pi/Ts/N;
else
     w=(0:Np-1)*2*pi/Ts/Np;
end

y=fftshift(y);
if(N>=Np)
    w=(-N/2:N/2-1)*2*pi/Ts/N;
else
     w=(-Np/2:Np/2-1)*2*pi/Ts/Np;
end


figure(figNumbers)
semilogx(w,abs(y),'b+');
xlabel('Frequency (rad/s)');
title('Spectrum');

end

