# IDS
Identifikation dynamischer Systeme


## Define first measurment to be 0, then z^(-1)
y_tmp = [0 ; -y_m(1:length(y_m)-1)];
u_tmp = [0 ; u(1:length(u)-1)];
y_k_sim = [y_tmp u_tmp]*[a1 ; b0];