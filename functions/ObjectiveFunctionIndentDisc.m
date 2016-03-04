function J = ObjectiveFunctionIndentDisc(theta, T, tk, uk, yk)


Kp   = theta(1);
Tau  = theta(2);

b0 = Kp*(1-exp(-T/Tau));
a1 = -exp(-T/Tau);

u0 = 0;
y0 = 0;
for k = 1:length(tk)
    if k==1
        yk_sim(k) = b0*u0 - a1*y0;    
    else
    yk_sim(k) = b0*uk(k-1) - a1*yk_sim(k-1);    
    end
end


J=0;
ek = yk - yk_sim;

for n = 1:length(ek)
    J = J + ek(n)^2;
end

end

