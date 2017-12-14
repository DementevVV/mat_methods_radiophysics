clear all;
clc;
Fs = 48000;
s1 = audioread('1.wav');
s2 = audioread('2.wav');
s_1 = s1 / max(abs(s1));
s_2 = s2 / max(abs(s2));

signal1 = s_1(1:20000);
signal2 = s_2(1:20000);

[P1,f1] = periodogram(signal1,[],[],Fs,'power');
[P2,f2] = periodogram(signal2,[],[],Fs,'power');

figure(1);
subplot(221);
plot(signal1), axis tight
xlabel('Time');
ylabel('Amplitude');
grid on;
subplot(212);
specgram(signal1);
grid on;
xlabel('Time');
ylabel('Frequency');
subplot(222)
plot(f1,P1,'k')
ylabel('P1')
grid on
axis tight
title('Power Spectrum')


figure(2);
subplot(221);
plot(signal2), axis tight
xlabel('Time');
ylabel('Amplitude');
grid on;
subplot(212);
specgram(signal2);
grid on;
xlabel('Time');
ylabel('Frequency');
subplot(222)
plot(f2,P2,'k')
ylabel('P2')
grid on
axis tight
title('Power Spectrum')

[C,lag1] = xcorr(signal1,signal2);        
C_max = max(C);
figure(3);
plot(lag1/Fs,C,'k')
ylabel('Amplitude')
grid on
title('Cross-correlation between Signal_1 and Signal_2')

