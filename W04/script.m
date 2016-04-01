%% Approximation closed form dim(theta) = 2
close all;  clear all;  clc;

x = (1:5)';
y = [4.53 7.98 8.77 10.78 12.77]';

phi = [x ones(length(x),1)];
theta_calc = (phi'*phi)^(-1)*phi'*y;

%y_calc = theta_calc(1)*x + theta_calc(2);  % long form
y_calc = phi*theta_calc;                    % short form

figure(1)
plot(x,y,x,y_calc);

disp(theta_calc)


%% Approximation closed form dim(theta) = 3
close all;  clear all;   clc
x = (1:5)';
y = [4.53 7.98 8.77 10.78 12.77]';

phi = [x.^2 x ones(length(x),1)];
theta_calc = (phi'*phi)^(-1)*phi'*y;

%y_calc = theta_calc(1)*x.^2 + theta_calc(2)*x + theta_calc(3);  % long form
y_calc = phi*theta_calc;    % short form

figure(2)
plot(x,y,'o',x,y_calc,'x')

disp(theta_calc)