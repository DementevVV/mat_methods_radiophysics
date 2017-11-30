clear all;
clc;
close all;

% coefficietns a1, a2, a3
a1 = 1;
a2 = 5;
a3 = -8;

% generation x1, x2 and y
x1 = rand(100, 1)*1000;
x2 = rand(100, 1);
X = [x1, x2];
y = a1 * x1 + a2 * x2 + a3;

% addition white gaussian noise to y
y = awgn(y, 5, 'measured');

% Normalization
[x1_normal, x2_normal, y_normal] = normalize(x1, x2, a1, a2, a3);

% 3D image with experimental data
figure
subplot(1,2,1);
plot3(x1, x2, y, '.');
title('Experimental data');
xlabel('x_1');
ylabel('x_2');
zlabel('y');

subplot(1,2,2);
plot3(x1_normal, x2_normal, y_normal, '.');
title('Experimental data after feature scaling');
xlabel('x_1_n');
ylabel('x_2_n');
zlabel('y_n');

figure
plot(y, '.');

m = length(y); % training examples length
d = size(X,2); % number of features
theta = zeros(d+1,1); % thetas - zero
alpha = 0.01; % learning rate
iterations = 1500; 
thetaLen = length(theta);
X = [ones(m,1) X]; % Add a col of 1's for the x0 terms

cost(X, y, theta)

[theta, J_history] = gradientDescent(X, y, theta, alpha, iterations);

% plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
% xlabel('Number of iterations');
% ylabel('Cost J');
%[theta, J_history] = gradientDescent(X, y, theta, alpha, iterations);

% figure;
% plot(J_history, 1:iterations);