function J = ObjectiveFunctionEquationError(theta, tk, u, y_m, T)

a1  = theta(1);
b1  = theta(2);


% yk_sim = A * theta
y_tmp = [0 ; -y_m(1:length(y_m)-1)];
u_tmp = [0 ; u(1:length(u)-1)];
y_k_sim = [y_tmp u_tmp]*[a1 ; b1];

%optional plot
plot(tk,y_m, tk, y_k_sim);
drawnow();

%calc error
ee = y_m_k - y_k_sim;
J=ee' * ee;     %Sum

end