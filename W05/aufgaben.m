%% Aufgabe 1
close all;  clear all;  clc;
%Nu = a*Re^b
% Not linear, can not be solved with linear approximation
% log10(Nu) = log10(a) + b*log(Re)


Re = (1E4 * [1:8])';
Nu = [49.5727 101.2204 129.1039 138.3338 188.6130 204.3007 226.6962 256.1783]';

phi = [ones(length(Re),1) log10(Re)];

theta = (phi'*phi)^-1*phi'*log10(Nu);
Nu_calc = 10.^(phi*theta);

%a = 10^theta(1);
%b = theta(2);
%Nu_calc = a*Re.^b;

plot(Re, Nu, Re, Nu_calc);

%% Aufgabe 2
close all;  clear all;  clc;

t = [0.1:0.1:0.9]';
h = [0.0384 0.2348 0.4379 0.7799 1.2083 1.7500 2.3844 3.1463 4.0050]';


% h = t^2*g
phi = 1/2*t.^2;

theta = (phi'*phi)^(-1)*phi'*h

% Check result
h_calc = phi*theta;
plot(t,h,t,h_calc);

%% Aufgabe 3
close all;  clear all;  clc;

load('IT1Exp')

%IT1: Gs = K/[(1+Tau*s)*s]

% b1*z + b0 /
% (z-1)(z-a1)
%
% a1 = e^(-T/Tau)
% b0 = K*Tau - K*Tau*e^(-T/Tau) - K*Tau*e^(-T/Tau)
% b1 = K*T - K*Tau + K*Tau*e^(-T/Tau)
%
% 2 Parameter --> K, Tau
% T ist fix
% Theta hat jedoch 3 Parameter --> a1, b0, b1
%
% b0+b1 = KT(1-e^(T/Tau))
% Reduktion auf 2

% b1*z^-1 + b0*z^-2 / 
% 1 - (1+a1)z^-1 + a1*z^-2

Y = [ym(3:end)-ym(2:end-1)];    %y[k] - y[k-1]
phi = [ym(2:end-1)-ym(1:end-2) u(1:end-2) u(2:end-1)];

theta = (phi'*phi)^(-1)*phi'*Y   % a1, b0, b1


Tau = -T/(log(theta(1)))                    % Nicht überdefiniert
K = (theta(2)+theta(3))/(T*(1-theta(1)))    % aus der Summe von b0 und b1

