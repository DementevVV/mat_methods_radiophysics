% coefficietns a1, a2, a3
a1 = 1;
a2 = 1;
a3 = 1;

% generation x1, x2 and y
x1 = rand(1, 100)*1000;
x2 = rand(1, 100);
y = a1 * x1 + a2 * x2 + a3;

% addition white gaussian noise to y
Y = awgn(y, 5, 'measured');

% 3D image with experimental data
figure
plot3(x1, x2, Y, '.');
title('Experimental data');
xlabel('x1');
ylabel('x2');
zlabel('y');
