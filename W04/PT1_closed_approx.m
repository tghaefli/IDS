close all;  clear all;  clc;

% Generate measurment data
measurementGeneratorPT1;


% Method teacher
if true
    y = ym(2:end);
    phi = [-ym(1:end-1,1) uk(1:end-1,1)];
    theta = (phi'*phi)^(-1)*phi'*y
    
    y_hat = phi * theta;
    figure(1)
    plot(tk,ym,tk(2:end),y_hat);
    
    % Residuum
    figure(2)
    plot(tk(2:end),y-y_hat)
end


% My method
if true
    % Define phi
    y_tmp = [0 ; -ym(1:end-1)];
    u_tmp = [0 ; uk(1:end-1)];
    phi = [y_tmp u_tmp];
    
    % Calculate theta
    theta = (phi'*phi)^(-1)*phi'*ym
    
    % Plot with calculated theta
    y_hat(1,1)=0;
    for i=2:length(tk)
        y_hat(i,1) = -y_hat(i-1,1)*theta(1) + uk(i-1,1)*theta(2);
    end
    
    % Check
    figure(1)
    plot(tk,ym,'r',tk,y_hat,'g');

    % Residuum
    figure(2)
    plot(tk,ym-y_hat)
end