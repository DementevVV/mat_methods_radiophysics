function Hd = fir
%FIR Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.4 and the Signal Processing Toolbox 6.22.
% Generated on: 11-Dec-2017 18:14:25

% Equiripple Highpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 16000;  % Sampling Frequency

Fstop = 2200;            % Stopband Frequency
Fpass = 2300;            % Passband Frequency
Dstop = 0.31622776602;   % Stopband Attenuation
Dpass = 0.057501127785;  % Passband Ripple
dens  = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop, Fpass]/(Fs/2), [0 1], [Dstop, Dpass]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]