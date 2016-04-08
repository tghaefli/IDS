%% Gen data
clear all; close all; clc;

n = 100;
x = ((1:100)/n)';
sigma = 0.4;
noise = sigma*randn(n,1);

phi = [ones(n,1) x x.^2];

(phi'*phi)^-1;

y = 1-3*x+noise;

theta = (phi'*phi)^(-1)*phi'*y

y_calc = theta(1) + theta(2)*x + theta(3)*x.^2;
plot(x,y,'+',x,phi*theta);


e = y-phi*theta;
sigma_hat = sqrt(1/(n-3)*(e'*e))

covTheta = (phi'*phi)^-1 * sigma_hat^2;

for k=1:size(covTheta)
    theta_min(k,1) = theta(k) - 1.96*sqrt(covTheta(k,k));
    theta_max(k,1) = theta(k) + 1.96*sqrt(covTheta(k,k));
    T_square(k,1)  = theta(k)^2 / covTheta(k,k)
end

[theta_min theta theta_max]
(T_square > 1.96^2)
