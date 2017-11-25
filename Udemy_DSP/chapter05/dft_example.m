clear all;
close all;
clc;

x = [1 1 1 0 0 0 1 1 1];
y = [1 0 1 1];

% Select 16 samples so it is a power of 2 greater than L + M -1
% (size(x) + size(y) -1) Output should be 12 samples long
x_pad = [1 1 1 0 0 0 1 1 1 0 0 0 0 0 0 0 ];
y_pad = [1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 ];

%https://www.mathworks.com/help/signal/ug/discrete-fourier-transform.html
z = fft(x)                                % Compute DFT of x
m = abs(z);                               % Magnitude
p = unwrap(angle(z));                     % Phase

w = fft(y)                                % Compute DFT of x
m = abs(w);                               % Magnitude
p = unwrap(angle(w));                     % Phase

C = z .* w'
