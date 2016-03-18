close all;
clear all;
clc;

%% Run script gen_meas_and_noise first
measurementGeneratorPT1;

%% Discrete
%Initial guess for th emodel parameters
clc;

theta = [0 0];

theta(1) = -exp(-T/0.1);
theta(2) = 3*(1-exp(-T/0.1));

Je = ObjectiveFunctionEquationError(theta, tk, uk, ym, T);
Je

Jo = ObjectiveFunctionOutputError(theta, tk, uk, ym, T);
Jo

%%
LB = [-100 -100 ];
UB = [100 100];

%@: anonymous, which variables can be varied

options = optimoptions('fmincon');
options.Display = 'iter';


[val J] = fmincon(@(theta) ObjectiveFunctionEquationError(theta, tk, uk, ym, T), theta_0, ...
    [], [], [], [], ...
    LB, UB, ...
    [], options)