%% Startup and Globals

% ------------------------------------------------------------------------
%       FilterImplementation.m
%
%       Uses standard looping methods to implement an IIR filter in 
%       software. 
%
%       Copyright Jake Bailey, August 2015. All Rights Reserved.
%
% ------------------------------------------------------------------------

clear all;
clc;

%% Filter Parameters

% Using low-pass from course example
%        0.02554 z^2 + 0.07528 z + 0.01412
% H(z) = ---------------------------------
%        z^3 - 1.849 z^2 + 1.27 z - 0.3058
%
% The difference equation will look like:
% Y(n) = 0.02554*x(n-1) + 0.07528*x(n-2) + 0.01412*x(n-3)
%   +1.849*y(n-1) - 1.27*y(n-2) + 0.3058*y(n-3)

% Coefficient arrays
b = [0.01412 0.07528 0.02554];
a = [-0.3058 1.27 -1.849 1];

%% Create some input

fs = 40000;
length = 100000;
n = 1:length;

% This input will give us two frequency peaks, one inside the passband and
% one in the stopband. 
input = sin(94247.*(n./fs)) + sin(12566.*(n./fs));

% Show the original input, and that its frequency response is what we
% expect.

plotlength = 500;
plot(n(1:plotlength),input(1:plotlength));

H = fft(input);
mag = sqrt(real(H).^2 + imag(H).^2);
phase = atan2(imag(H),real(H));

freq_axis = pi.*n./length;
freq_length = length/2;
figure;
subplot(2,1,1);
plot(freq_axis(1:freq_length),mag(1:freq_length));
subplot(2,1,2);
plot(freq_axis(1:freq_length),phase(1:freq_length));

%% Main Filter Loop

% Initialize the sample arrays
x = zeros(1,length);
y = zeros(1,length);

% Note we're only running for a set period of time
% In real time applications you will often set this
% to an infinite while loop [i.e. while(true)]

for i = 1:length 
    % Read input
    x(i) = input(i);
    
    if i < 4
        continue %Keyword to skip this iteration of the loop
    end
    
    % Calculate output via our difference equation
    y(i) = (1/a(4))*(b(3)*x(i-1) + b(2)*x(i-2) + b(1)*x(i-3) - a(3)*y(i-1) - a(2)*y(i-2) - a(1)*y(i-3));
    
    
end

figure;
plot(n(1:plotlength),y(1:plotlength));

H = fft(y);
mag = sqrt(real(H).^2 + imag(H).^2);
phase = atan2(imag(H),real(H));

freq_axis = pi.*n./length;
freq_length = length/2;
figure;
subplot(2,1,1);
plot(freq_axis(1:freq_length),mag(1:freq_length));
subplot(2,1,2);
plot(freq_axis(1:freq_length),phase(1:freq_length));