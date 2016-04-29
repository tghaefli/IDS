close all;  clear all;  clc;

n = 11;

T = 0.005;    % Abtastzeit

umin = 5;       % Nicht von 0 starten
umax = 8;       % Nur eine kleine Abweichung von umin

L = 3;              % Anzahl der Perioden
N = 2^n-1;          % Anzahl Messpunkte pro Sequenz
To = (2^n-1)*T;     % Periodenlänge

Tf = L*To;          % Experiment Dauer

reg = zeros(1,n);   reg(n) = 1;

switch n
    case {3, 6, 7}
        tap = [n n-1];
    case {4, 5}
        tap = [n n-2];
    case 8
        tap = [4 5 6 8];
    case 9
        tap = [5 9];
    case 10
        tap = [7 10];
    case 11
        tap = [9 11];
    otherwise
        warning('n too high');
end

% Calculate the sequence
for iterK=1:L*N    
    tmp = mod(sum(reg(tap)),2);
    reg(2:end) = reg(1:end-1);
    reg(1) = tmp;
    
    if reg(n)
        u(iterK) = umax;
    else
        u(iterK) = umin;
    end
        
end
u = u';
tk = linspace(0,Tf-T,N*L);
figure(10)
%plot(tk, u, '+');
stem(tk, u)

%FFTSpectrum(u-mean(u),T,1,2);   % my
FFTSpektrum(u-mean(u),T,1,2);   % teacher
clear iterK L n N reg tap tmp To umax umin