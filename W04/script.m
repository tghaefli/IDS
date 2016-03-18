clc; close all; clear all;

x = (1:5)';
y = [4.53 7.98 8.77 10.78 12.77]';

figure(1)
plot(x,y)

%Jmin = 100000;
%theta_good = [0 0]';

phi = [x ones(length(x),1)]

theta_calc = (phi'*phi)^(-1)*phi'*y;
y_calc = theta_calc(1)*x+theta_calc(2);

plot(x,y,x,y_calc','o')
