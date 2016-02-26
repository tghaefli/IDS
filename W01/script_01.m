close all;
clear all;

load('SprungAntwortSystem1.mat');
% Alles 0, ab t=0 Sprung auf 1

figure(1);
plotyy(tk,uk,tk,yk)

J_min=1e9;
iter_K = 0;
iter_Tau = 0;

for K = 1: 0.5 : 5
    iter_K = iter_K+1;
    iter_Tau=0;
    
    for Tau = 1 : 0.05 : 4 

        iter_Tau = iter_Tau+1;

        
        G=tf(K, [Tau,1]);
        %figure(2)

        yk_sim = lsim(G,uk,tk);
        %[Y,t,X] = step(G,tk)

        %figure(2)
        %plot(tk,yk,'+',tk,yk_sim)


        % Objective/Cost function
        yk_sim = yk_sim';
        J = sum((yk-yk_sim).^2);
        
        J_vec(iter_K,iter_Tau) = J;
        if J<J_min
            K_min=K
            J_min=J
            Tau_min=Tau
            
            pause(0.001)
            figure(2)
            plot(tk,yk,'+',tk,yk_sim)
        end
    end
    
end


%J_min
%min(min(J_vec))

%mesh(j_vec)

