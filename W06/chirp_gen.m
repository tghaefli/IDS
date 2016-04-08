clear all; close all; clc;

wmin = 2*pi*0;
wmax = 2*pi*1000;
T = 1E-3;
tmin = 0;
tmax = 20;
t = (tmin:T:tmax)';

u = cos(wmin*t+1/2*1*t.^2);

plot(t,u)
