% coefficietns a1, a2, a3
a1 = 1;
a2 = 1;
a3 = 1;

% generation x1, x2 and y
x1 = rand(1, 100)*1000;
x2 = rand(1, 100);
x1_normal = (x1 - mean(x1))/std(x1);
x2_normal = (x2 - mean(x2))/std(x2);
y = a1 * x1 + a2 * x2 + a3;
y_normal = a1 * x1_normal + a2 * x2_normal + a3;
% addition white gaussian noise to y
Y = awgn(y, 5, 'measured');
Y_normal = awgn(y_normal, 5, 'measured');
% 3D image with experimental data
figure
plot3(x1, x2, Y, '.');
title('Experimental data');
xlabel('x1');
ylabel('x2');
zlabel('y');


figure
plot3(x1_normal, x2_normal, Y_normal, '.');
title('Experimental data after feature scaling');
xlabel('x1_n');
ylabel('x2_n');
zlabel('y_n');
