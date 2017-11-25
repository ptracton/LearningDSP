close all;
clear;
clc;

%% Time specifications:
Fs = 1000;                   % samples per second
dt = 1/Fs;                   % seconds per sample
StopTime = 2   ;             % seconds
t = (0:dt:StopTime-dt)';     % seconds
%% Sine wave:
Fc = 1;                     % hertz
x = sin(2*pi*Fc*t);

figure
subplot(3,1,1)
plot(t,x)

fft_x = fft(x)
real_x = real(fft_x)
imag_x = imag(fft_x)

subplot(3,1,2)
plot(t, real_x, 'bo')

subplot(3,1,3)
plot(t, imag_x, 'bo')

magnitude = sqrt(real_x.^2 + imag_x.^2);
phase = atand(imag_x / real_x);

figure
subplot(2,1,1)
plot(t, magnitude)

subplot(2,1,2)
plot(t, phase)

saveas(gcf, '../Notes/images/fft_example.png')
