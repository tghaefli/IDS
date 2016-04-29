# IDS
Identifikation dynamischer Systeme


y + noise = y_hat = y_m


## Define first measurment to be 0, then z^(-1)
y_tmp = [0 ; -y_m(1:length(y_m)-1)];
u_tmp = [0 ; u(1:length(u)-1)];
y_k_sim = [y_tmp u_tmp]*[a1 ; b0];


## Methoden

### Ausgangsfehler, Output Error (OE), e_o
mit fmincon:
    Requires y(k-1) to calculate y(k) ==> y[k] = f(k)
    Requires a criteria J
    With a for-loop for each element of theta

    ObjectiveFunctionOutputError.m needs fmincon

ohne fmincon:
    -


### Gleichungsfehler, Equation Error (ARX), e_e 

mit fmincon:
    Close form, Matrix --> Y = x * theta
    ObjectiveFunctionEquationError.m needs fmincon
ohne fmincon:
    -


Leastsquare = Close form with matirx --> gives theta



