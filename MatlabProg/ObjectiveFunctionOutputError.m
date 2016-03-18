function J = ObjectiveFunctionOutputError(theta, tk, u, y_m, T)

a1 = theta(1);
b1 = theta(2);

y_hat(1,1) = y_m(1);
for k = 2:length(tk)
    y_hat(k,1) = [-y_hat(k-1) u(k-1)] * [a1 b1]';
end


figure(11)
plot(tk,y_m,'+',tk,y_hat,'+');
pause(0.1);
        
% Objective function computation
eo = y_m - y_hat;
% J = 0;
% for iter_k = 1:length(eo)
%    J = J + eo(iter_k)^2;
% end

J = eo' * eo;

figure(12)
plot(tk,eo,'+');

end