close all; 
clear all;
clc;

a = [1 2 3 4 5 6];
b = [1 1 1 1];

z = conv(a,b);  % <-- This is a LOT of steps

fft_a = fft(a)
fft_b = fft(b)

C = fft_a .* fft_b'

ifft(C)
