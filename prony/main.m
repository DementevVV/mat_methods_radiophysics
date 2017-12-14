clear all;
clc;
close all;

clear;
errors = zeros(7,3);
p = 3; 
for i = 0:1:6
tmp_err = zeros(10,p);
for j = 1:10
A1 = 5;
A2 = 1; % if A2 = 0, harmonic down
A3 = 10;
f1 = 7600; %Hz
f2 = 7500; %Hz
f3 = 2200; %Hz
Fs = 48000;
dt = 1/Fs;
k = 10000;
t = 0:dt:(k-1)*dt;

S = A1*exp(1i*2*pi*f1*t)+A2*exp(1i*2*pi*f2*t)+A3*exp(1i*2*pi*f3*t);
S_l = length(S);

noise = normrnd(0,1,1,length(t))+1i*normrnd(0,1,1,length(t));
sS = S+noise*0.001;

Y = zeros(S_l-p,p);
b = zeros(S_l-p,1);
for i2 = 1 : S_l-p
    Y(i2,:) = flip(sS(i2:i2+2));
    b(i2) = sS(i2+p);
end

a = inv(Y'*Y)*Y'*b;
a = [1; (-1)*a];
Z = roots(a);

W = 1/dt * (imag(log(Z)));
F = W / (2 * pi);
F
F = sort(F);

Ftrue = [f1,f3,f2];
for i2 = 1:p
    tmp = min(abs(F - Ftrue(i2)));
    F((abs(F - Ftrue(i2))) == tmp) = [];
    tmp_err(j,i2) = tmp/Ftrue(i2);
end
end
errors(i+1,:) = mean(tmp_err);
end

figure;
subplot(1,3,1);
plot((0:6)/1000,errors(:,1), '-o');
grid('on');
title('Errors for frequency 7600 Hz');
xlabel('Noise, A');
ylabel('The deviation in frequency, Hz');
subplot(1,3,2);
plot((0:6)/1000,errors(:,3), '-o');
grid('on');
title('Errors for frequency 7500 Hz');
xlabel('Noise, A');
ylabel('The deviation in frequency, Hz');
subplot(1,3,3)
plot((0:6)/1000,errors(:,2), '-o');
grid('on');
title('Errors for frequency 2200 Hz');
xlabel('Noise, A');
ylabel('The deviation in frequency, Hz');