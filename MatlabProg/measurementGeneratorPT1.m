close all; clear all; clc;
% Measurement generator

% Process
K   = 3.0;
tau = 0.1;
T   = 0.005;

% Measurement noise (hypothesis gaussian)
sigma = 0.1;   % Standard deviation

a1 = -exp(-T/tau);
b0 = K*(1-exp(-T/tau));

disp(a1)
disp(b0)

% Step signal
simulationTime = 5;
tk = (0:T:5)';
uk = zeros(length(tk),1);
uk(find(tk >= 2.5)) = 1;        % Step function

y(1) = 0.0;
% Difference equation
for iterK = 2: length(tk)
    y(iterK,1) = -a1 * y(iterK-1,1) + b0 * uk(iterK-1,1);
end

% Noise measurement (gaussian, randn)
ym = y + sigma * randn(size(y));


clear K tau sigma a1 b0 y iterK;
