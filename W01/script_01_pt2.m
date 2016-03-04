clc;
close all;
clear all;

load('SprungAntwortSystem1.mat');

%figure(1);
%plotyy(tk,uk,tk,yk)

J_min=1e9;

%    K     d     w0       J
%   3.2   14     11     81.846
%   3.2   18     14     81.836
%   3.2   19.9   15.5   81.835



% Conclusion: d +/- 50% und w0 +/- obwohl J gleich bleibt


K_tmp  =  3;
w0_tmp = 10;
d_tmp  = 13;

for K = K_tmp-0.5 : 0.1 : K_tmp+0.5  
    for w0 = 5 : 0.1 : 20
    	for d = 10 : 0.1 : 20


	        G=tf(K, [1/w0^2,2*d/w0,1]);
	        %figure(2)

	        yk_sim = lsim(G,uk,tk);
	        %[Y,t,X] = step(G,tk)

	        %figure(2)
	        %plot(tk,yk,'+',tk,yk_sim)


	        % Objective/Cost function
	        yk_sim = yk_sim';
	        J = sum((yk-yk_sim).^2);
	        
	        if J<J_min
	            J_min=J;

	        	K_min=K;
	        	d_min=d;
	            w0_min=w0;
	            
	            pause(0)
	            %figure(2)
	            plot(tk,yk,'+',tk,yk_sim)

	        endif	%endif
        end 		%end for d
    end 			%end for w0
end 				%end for K


K_min
d_min
w0_min
J_min
