clear all; close all; clc;

% Frequenzbereich festlegen
wmin = 2*pi*0;
wmax = 2*pi*50;

% Dauer des Experiments (s)
Td = 100;  
k = (wmax-wmin) / Td;

% Abtastzeit
ws = wmax * 20;
T = 2*pi/ws;

% Chirp signal / Sweep
tk = (0:T:Td)';
u = (cos(wmin*tk+1/2*k*tk.^2))';


plot(tk,u)

% Spektrum
FFTSpektrum(u,T,length(tk),5);