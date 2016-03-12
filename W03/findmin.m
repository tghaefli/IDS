close all;
clear all;
clc;

%% Run script gen_meas_and_noise first
gen_meas_and_noise;

%% Discrete
%Initial guess for th emodel parameters
% K , Tau, Tau2
clc;

theta_0 = [3.0 0.1];
%T = 0.005;

% 1.0 < Kp  < 10.0
% 0.01 < Tau < 20.0
LB = [1.0 0.001 ];
UB = [100 20];

%@: anonymous, which variables can be varied

options = optimoptions('fmincon');
options.Display = 'iter';

[val J] = fmincon(@(theta) EquationErrorObjctiveFunction(theta, T, t_k, u_k, y_m_k), theta_0, ...
    [], [], [], [], ...
    LB, UB, ...
    [], options)
