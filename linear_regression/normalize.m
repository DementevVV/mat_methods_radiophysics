function [x1_normal, x2_normal, y_normal] = normalize(x1, x2, a1, a2, a3)

x1_normal = (x1 - mean(x1))/std(x1);
x2_normal = (x2 - mean(x2))/std(x2);
y_normal = a1 * x1_normal + a2 * x2_normal + a3;
% y_normal = awgn(y_normal, 5, 'measured');
