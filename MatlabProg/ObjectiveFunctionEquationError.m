function J = ObjectiveFunctionEquationError(theta, tk, u, y_m, T)

a1 = theta(1);
b1 = theta(2);

%y_hat(1,1) = y_m(1);
%for k = 2:length(tk)
%    y_hat(k,1) = [-y_m(k-1) u(k-1)] * [a1 b1]';
%end

y_tmp = [0 ; -y_m(1:length(y_m)-1)];
u_tmp = [0 ; u(1:length(u)-1)];
y_hat = [y_tmp u_tmp]*[a1 ; b1];


figure(1)
plot(tk,y_m,'+',tk,y_hat,'+');
pause(0.1);
        
% Objective function computation
ee = y_m - y_hat;
% J = 0;
% for iter_k = 1:length(ee)
%    J = J + ee(iter_k)^2;
% end

J = ee' * ee;

figure(2)
plot(tk,ee,'+');

end