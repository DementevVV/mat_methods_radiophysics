clear all;
clc;
close all;

f1 = 7600; %Hz
f2 = 7500; %Hz
f3 = 2200; %Hz

A1 = 5;
A2 = 1; % if A2 = 0, harmonic down
A3 = 10;

T  = 0.1;
fs = 20000.0;
t  = 0:1/fs:T;
n  = length(t);
noise_ampl = 5;
noise = rand(1,n);
S = A1*exp(1i*2*pi*f1*t)+A2*exp(1i*2*pi*f2*t)+A3*exp(1i*2*pi*f3*t)+noise_ampl*noise*(1+1i);

F = abs(fft(S));
F = F./n;
F = 10 * log(F);
f=0:fs/n:fs/2-1/n;
figure;
subplot(2,2,1)
plot(t,real(S), 'b');
title('Input signal');
xlabel('t, s');
ylabel('Amplitude, dB');
grid on;
subplot(2,2,2);
plot(f,F(1:length(f)), 'g');
title('Spectrum');
xlabel('Frequency, Hz');
ylabel('Amplitude, dB');
grid on;
subplot(2,2,3:4)
plot(f,F(1:length(f)), 'r');
grid on
xlim([1500,9000]);
title('Spectrum');
xlabel('Frequency, Hz');
ylabel('Amplitude, dB');

win = hamming(n);
S_w = S.*win';
F_w = abs(fft(S_w));
F_w = F_w./n;
F_w = 10 * log(F_w);

figure;
subplot(2,1,1);
plot(t,real(S_w),'r');
title('Signal * window');
xlabel('time, s');
ylabel('Amplitude, dB');
grid on
subplot(2,1,2);
hold on
f=0:fs/n:fs/2-1/n;
plot(f,F(1:length(f)), 'r');
plot(f,F_w(1:length(f)),'b');
legend('Input spectrum','Output spectrum');
title('Spectrum');
xlabel('Frequency, Hz');
ylabel('Amplitude, dB');
grid on
