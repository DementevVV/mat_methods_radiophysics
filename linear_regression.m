clear all;
clc;
close all;

% coefficietns a1, a2, a3
a1 = 1;
a2 = 5;
a3 = 1;

% generation x1, x2 and y
x1 = 1000 * rand(1000, 1);
x2 = rand(1000, 1);
X = [x1, x2];
y = a1 * x2 + a2 * x1 + a3;

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


m = length(y); % training examples length
d = size(X,2); % number of features
theta = zeros(d+1,1); % thetas - zero
alpha = 0.00000001; % learning rate
numIters = 1000;

% XNormEqn = [ones(m,1) X];
% thetaNorm = NormalEquation(XNormEqn,y);

% [X, mu, stddev] = featureNormalize(X);

X = [ones(m,1) X];
[theta, J_History] = gradientDescent(X, y, theta, alpha, numIters);

for ind=1:1000
	pr(ind) = theta(1) + theta(2) * ind + theta(3) * ind;
end

figure;
plot(J_History);



figure;
plot(1:length(y), y);
hold on;
plot(pr);