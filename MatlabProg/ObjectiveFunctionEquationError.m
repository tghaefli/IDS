function J = ObjectiveFunctionEquationError(theta, tk, u, y_m, T)

a1 = theta(1);
b1 = theta(2);

%y_hat(1,1) = y_m(1);
phi = [-y_m(1:end-1,1) u(1:end-1,1)];
Y_hat = phi * [a1 b1]';    
Y_hat = [y_m(1) ; Y_hat];


figure(1)
plot(tk,y_m,'+',tk,Y_hat,'+');
pause(0.1);
        
% Objective function computation
ee = y_m - Y_hat;
J = ee' * ee;

figure(2)
plot(tk,ee,'+');

end