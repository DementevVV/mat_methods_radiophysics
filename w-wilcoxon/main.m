clear all;
clc;
close all;

alpha_1 = 0.005;
alpha_2 = 0.01;
alpha_3 = 0.05;

A = 1;
B = 2;
m = [1 100];
n = [1 100];
h1 = 10.0;
h2 = 10.0;

% generate X from the gamma distribution
X = gamrnd(A,B,m);
%  generate Y from the gamma distribution
Y = gamrnd(A,B,n);

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

% common variational series
XY = union(X,Y);
l = length(XY);

[p1, h1] = ranksum(X, Y, alpha_1)
[p2, h2] = ranksum(X, Y, alpha_2)
[p3, h3] = ranksum(X, Y, alpha_3)

mX = mean(X)
mY = mean(Y)



% p = ranksum(x,y) функция предназначена для проведения двустороннего рангового теста Вилкоксона для проверки нулевой гипотезы состоящей в том, 
% что независимые выборки x и y взяты из генеральных совокупностей с равными медианами. 
% Выборки x и y задаются как векторы. 
% Функция возвращает значение уровня значимости p для проверки нулевой гипотезы. 
% Уровень значимости - вероятность ошибки первого рода, т.е. вероятность неверно отвергнуть нулевую гипотезу, в случае ее справедливости. 
% Если значение p≈0, то нулевая гипотеза может быть отвергнута, т.е. медианы сравниваемых выборок статистически значимо отличаются друг от друга.
% Нулевая гипотеза принимается если h=0.
% Если h=1, то нулевая гипотеза может быть отвергнута