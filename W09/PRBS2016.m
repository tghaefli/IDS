clear all

n = 5;

T = 0.005;

umin = 1;

umax = 7;

L = 2;   % Anzahl an Perioden

N = 2^n-1;

To = (2^n-1)*T;  % Periode

Tf = L*To;  % Dauer des Experiments
switch n
    case 3
        m = [2 3];
    case 4
        m = [3 4];
    case 5
        m = [3 5];
    case 6
        m = [5 6];
    case 7
        m = [6 7];
    case 8
        m = [4 5 6 8];
    case 9
        m = [5 9];
    case 10
        m = [7 10];
    case 11
        m = [9 11];
end
register = zeros(1,n);
register(n) = 1;
for iterK = 1:L*N
     register
     neuBitWert = mod(sum(register(m)),2);
     register(2:end) = register(1:end-1);
     register(1) = neuBitWert;
%     register shiften
      if register(n)
         u(iterK) = umax;
      else          
         u(iterK) = umin;
      end
end

tk = linspace(0,Tf-T,N*L);

figure(1)
plot(tk,u,'+');
xlabel('Time (s)');

FFTSpektrum(u-mean(u),T, 1, 2)

% Spektrum