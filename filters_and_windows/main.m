clear all;
clc;
close all;

f1 = 7600;
f2 = 7500;
f3 = 2200;
A1 = 5;
A2 = 1;
A3 = 10;
fs = 16000;
dt=1/fs;
t=0:dt:0.01;
noise = normrnd(0, 1, [1 length(t)]);
x = A1 * sin(2*pi*f1*t) + A2 * sin(2*pi*f2*t) + A3 * sin(2*pi*f2*t)+noise;
y = filter(iir2,x);
N = floor(length(t)/2);
f = (0:N)/length(t)*fs;
spectrum_x = fft(x)/N;
spectrum_y = fft(y)/N;
figure(1)
plot(f,abs(spectrum_x(1:N+1)));
grid on
xlabel('F, Hz')
ylabel ('Amplitude')
figure(2)
plot(abs(spectrum_y));
grid on
xlabel('F, Hz');
ylabel('Amplitude');