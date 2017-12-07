clear all;
clc;
close all;

p=3;
T=0.25; 
Fs=40000;
t=0:1/Fs:T-1/Fs;
N = length(t);
f1 = 7600; %Hz
f2 = 7500; %Hz
f3 = 2200; %Hz

A1 = 5;
A2 = 1; % if A2 = 0, harmonic down
A3 = 10;
noise_ampl = 0;
noise = normrnd(1,N);

S = A1*exp(1i*2*pi*f1*t)+A2*exp(1i*2*pi*f2*t)+A3*exp(1i*2*pi*f3*t)+noise_ampl*noise*(1+1i);
S_l=length(S);

Y = zeros(S_l-p,p);
b = zeros(S_l-p,1);
for i = 1 : S_l-p
    Y(i,:) = flip(S(i:i+2));
    b(i) = S(i+p);
end

a = inv(Y'*Y)*Y'*b;
a = [1; (-1)*a];
z = roots(a);

w = 1/(1/Fs) * (imag(log(z)));
F = w / (2 * pi);
F = round(sort(F))
F_inputs = [f1,f2,f3]'
MSE = std(F_inputs - F)