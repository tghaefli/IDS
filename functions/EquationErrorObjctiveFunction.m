function J = EquationErrorObjctiveFunction(theta, T, t_k, u_k, y_m_k)

% Summary of this function goes here
%   Detailed explanation goes here

Kp   = theta(1);
Tau  = theta(2);

b1 = Kp*(1-exp(-T/Tau));
a1 = -exp(-T/Tau);

%u0 = 0;
%y0 = 0;
for k = 1:length(t_k)
    if k==1
        %yk_sim(k) = b1*u0 - a1*y0;    
        yk_sim(k) = 0;    
    else
        yk_sim(k) = [-y_m_k(k-1) u_k(k-1)] * [a1 b1]';    
    end
end


yk_sim = [-y_m_k(1:length(y_m_k)-1)' u_k(1:length(u_k)-1)]*[a1 b1]'
ee = y_m_k - yk_sim';

%ee = y_m_k - yk_sim;

plotyy(t_k,y_m_k, t_k, yk_sim)
drawnow()
    
J=0;
for n = 1:length(ee)
    J = J + ee(n)^2;
end

end

