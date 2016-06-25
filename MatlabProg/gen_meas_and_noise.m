close all;  clear all;  clc;

% Künstliche Messdaten für ein PT1 generieren
K = 5;
Tau = 0.3;
T = 0.03;

sigma = 1;

% Define Transfer Function
a1 = -exp(-T/Tau);
b1 = K*(1-exp(-T/Tau));

theta = [a1 b1]';


% Anregung
t_k = (0:T:5)';
t_step = 2.5;
u_init = 5;
u_end = 18;


u_k = u_init * ones(length(t_k),1); % Set the first few point to the init value

I = find(t_k >= t_step);           % Set other points to the end value
u_k(I) = u_end;

%plot(u_k);


% Simulation mit Hz
y_init = 0;
for sample_k_plus_1 = 1:length(t_k)
    if sample_k_plus_1 == 1
        y_k(sample_k_plus_1,1) = y_init;
        y_m_k(sample_k_plus_1,1) = y_k(sample_k_plus_1,1) + sigma*randn;
    else
    y_k(sample_k_plus_1,1) = [-y_k(sample_k_plus_1 - 1,1) u_k(sample_k_plus_1 - 1,1)] * theta;
    y_m_k(sample_k_plus_1,1) = y_k(sample_k_plus_1,1) + sigma*randn;               
    end
end
