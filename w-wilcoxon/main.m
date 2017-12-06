clear all;
clc;
close all;

alpha_1 = 0.005;
alpha_2 = 0.01;
alpha_3 = 0.05;

A = 1;
B = 2;
m1 = [1 100];
m2 = [1 100];
h1 = 10.0;
h2 = 10.0;

% generate X from the gamma distribution
X = gamrnd(A,B,m1)
%  generate Y from the gamma distribution
Y = gamrnd(A,B,m2)

figure;
subplot(2,2,1);
hist(X, h1);
x=min(X):(max(X)-min(X))/100:max(X);
fx= gampdf(x, A,B);
ffx=fx*100*((max(X)-min(X))/h1);
title('X Random numbers from the gamma distribution');
grid on;
legend('X');
hold on
plot(x,ffx,'r')

subplot(2,2,2);
hist(Y, h2);
y=min(Y):(max(Y)-min(Y))/100:max(Y);
fy= gampdf(y, A,B);
ffy=fy*100*((max(Y)-min(Y))/h2);
title('Y Random numbers from the gamma distribution');
grid on;
legend('Y');
hold on;
plot(y,ffy,'r');

subplot(2,2,3);
plot(X, 'r-');
grid on;
xlabel('i');
ylabel('X_i value');
subplot(2,2,4);
plot(Y, 'b-');
grid on;
xlabel('i');
ylabel('Y_i value');