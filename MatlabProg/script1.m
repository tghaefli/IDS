close all;
clear all;
clc;

%% Run script gen_meas_and_noise first
measurementGeneratorPT1;




%% Discrete
clc;

%Initial guess for the model parameters
theta = [0 0];

theta(1) = -exp(-T/0.2);
%theta(2) = 2*(1-exp(-T/0.2));
theta(2) = 3*(1-exp(-T/0.2));

%Single shot, only 1 try
Je = ObjectiveFunctionEquationError(theta, tk, uk, ym, T);
Je

%Single shot, only 1 try
Jo = ObjectiveFunctionOutputError(theta, tk, uk, ym, T);
Jo




%% Equation Error
theta_0 = [0 0]';
LB = [-100 -100 ];
UB = [100 100];

options = optimoptions('fmincon');
options.Display = 'iter';

[val J] = fmincon(@(theta) ObjectiveFunctionEquationError(theta, tk, uk, ym, T), theta_0, ...
    [], [], [], [], ...
    LB, UB, ...
    [], options)




%% Output Error
theta_0 = [0 0]';
LB = [-100 -100 ];
UB = [100 100];

options = optimoptions('fmincon');
options.Display = 'iter';

[val J] = fmincon(@(theta) ObjectiveFunctionOutputError(theta, tk, uk, ym, T), theta_0, ...
    [], [], [], [], ...
    LB, UB, ...
    [], options)