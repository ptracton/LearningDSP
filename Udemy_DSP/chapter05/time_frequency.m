% https://www.mathworks.com/matlabcentral/answers/36428-sine-wave-plot
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
% Plot the signal versus time:
figure;
subplot(2,1,1)
plot(t,x);
grid on
xlabel('time (in miliseconds)');
title('Signal versus Time');

freq = fft(x);
subplot(2,1,2)
plot(freq)
axis([-10 10 -10  10])
title('1 KHz signal in Frequency Domain')

saveas(gcf, '../Notes/images/time_freq_plot.png')
