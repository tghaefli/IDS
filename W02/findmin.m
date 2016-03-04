close all;
clear all;
clc;

load('SprungAntwortSystem1.mat');
T = 0.1;
ObjectiveFunctionIndentDisc([3 0.2], T, tk, uk, yk)

%% Discrete
%Initial guess for th emodel parameters
% K , Tau, Tau2
clc;

theta_0 = [3.0 1];
T = 0.1;

% 1.0 < Kp  < 10.0
% 0.1 < Tau < 20.0
LB = [1.0 0.1 ];
UB = [10 20];

%@: anonymous, which variables can be varied

options = optimoptions('fmincon');
options.Display = 'iter';

[val J] = fmincon(@(theta) ObjectiveFunctionIndentDisc(theta, T, tk,uk,yk), theta_0, ...
    [], [], [], [], ...
    LB, UB, ...
    [], options)

% F-count: how many times we calculated J
% f(x) = J
% First-order optimality: dJ/dt
% Norm of step: step size


%% Continous

%Initial guess for th emodel parameters
% K , Tau, Tau2
theta_0 = [300.0 0, 0];

% 1.0 < Kp  < 10.0
% 0.1 < Tau < 20.0
LB = [1.0 0.1, 1];
UB = [100.0 200, 100];

%@: anonymous, which variables can be varied

options = optimoptions('fmincon');
options.Display = 'iter';

[val J] = fmincon(@(theta) ObjectiveFunctionIndent(theta,tk,uk,yk), theta_0, ...
    [], [], [], [], ...
    LB, UB, ...
    [], options)

% F-count: how many times we calculated J
% f(x) = J
% First-order optimality: dJ/dt
% Norm of step: step size
