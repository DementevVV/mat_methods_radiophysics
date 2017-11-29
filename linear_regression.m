clear all;
clc;
close all;

% coefficietns a1, a2, a3
a1 = 1;
a2 = 1;
a3 = 1;

% generation x1, x2 and y
x1 = rand(80, 1)*1000;
x2 = rand(80, 1);
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

% training examples length
m = length(y);