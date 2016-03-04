function J = ObjectiveFunctionIndent(theta, tk, uk, yk)

Kp   = theta(1);
Tau  = theta(2);
Tau2 = theta(3);

%transfer function definition
%G = tf(Kp,[Tau 1]);
G=tf(Kp, [Tau*Tau2,Tau+Tau2,1]);

%Start simulation
yk_sim = lsim(G,uk,tk);

J=0;
ek = yk' - yk_sim;

for iter_K = 1:length(ek)
    J = J + ek(iter_K)^2;
end

end

