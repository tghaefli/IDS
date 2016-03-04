clear all;
close all;
clc;


K = 0.05;			% Motor Konstante		[Nm/A] und [VS]
R = 0.5;			% Widerstand			[Ω]
J = 0.0025;			% Lastträgheit			[kgm^2 ]
alpha = 0.0001;		% Reibungskoeffizient	[Nms]

% dw/dt = 1/J*(alpha + K^2/R)*w = K/(JR)*u

%% 1.)
% 1/s*w-w(0) = 1/J*(alpha+K^2/R)*w = K/(JR)*u 	/w(0) = 0


Kp = K/(K^2 + alpha*R);
Tau = (J*R)/(K^2 + alpha*R);

s=tf('s');
G = tf(Kp,[Tau 1])



%% 2.)
z=tf('z');
T = 0.02;

H = (1-e^(-T/Tau))/(z-e^(-T/Tau)) * Kp
% H = c2d(G, T, 'zoh')
