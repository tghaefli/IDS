# IDS
Identifikation dynamischer Systeme  


## Output Error  
    Equation, Code, Dis-Advantages

## equation Error  
    Equation, Code, Dis-Advantages

## Least Square  
    Equation, Code, Dis-Advantages

## Confidence Interval  
    Equation, Code, Dis-Advantages

## Excitation Signals
### Step
    Equation, Code, Dis-Advantages

### Chirp
    Equation, Code, Dis-Advantages

### PRBS  
    Equation, Code, Dis-Advantages































# obsolete

y + noise = y_hat = y_m  

Define first measurment to be 0, then z^(-1)  
y_tmp = [0 ; -y_m(1:length(y_m)-1)];  
u_tmp = [0 ; u(1:length(u)-1)];  
y_k_sim = [y_tmp u_tmp]*[a1 ; b0];  



## Ausgangsfehler, Output Error (OE), e_o  
mit fmincon:  
    Requires y(k-1) to calculate y(k) ==> y[k] = f(k)  
    Requires a criteria J  
    With a for-loop for each element of theta  

    ObjectiveFunctionOutputError.m needs fmincon  

ohne fmincon:  
    -  


## Gleichungsfehler, Equation Error (ARX), e_e   

mit fmincon:  
    Close form, Matrix --> Y = phi * theta  
    ObjectiveFunctionEquationError.m needs fmincon  
ohne fmincon:  
    -  


## Leastsquare 

Leastsquare = Close form with matirx --> gives theta  
ToDO:   Konfidenzintervall  
        Correlation (Überdimensioniert)  
        Noise / Sigma?  



## Anregungssignale  
### Chirp 
Summe von Sinussignalen   


### PRBS
More energy (points) in higher frequency  
Measurement needs 2 PRBS measurments to cover the full bandwidth  
Only a few points in low frequencies  

## SPS



