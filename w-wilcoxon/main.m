clear all;
clc;
close all;

A = 1;
B = 2;
m = [1 100];
% generate X from the gamma distribution
X = gamrnd(A,B,m)
%  generate Y from the gamma distribution
Y = gamrnd(A,B,m)

figure;
plot(X, '-');
hold on;
plot(Y, 'r-');
grid on;
xlabel('i');
ylabel('value');
title('Random numbers from the gamma distribution');
legend('X', 'Y');