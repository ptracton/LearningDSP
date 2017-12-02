%% Startup and Globals 
clear all;
clc;

%% Filter Parameters
fs = 40000;  % 40 KHz

wc = 2000; % 2KHz
ws = 12000; % 12 Khz
ripple = 0.1; % in dB
atten = 40;  % in dB

%% Intermediate Calculations for Butterworth Filter Design
del = 10^(ripple/20) - 1;
A = 10^(atten/20);
eps = sqrt((1/(1-del))^2 - 1);

wcd = wc/fs*2*pi;
wsd = ws/fs*2*pi;

wc_warp = tan(wcd/2);
ws_warp = tan(wsd/2);

d = eps/sqrt(A^2 - 1);
k = wc_warp/ws_warp;
del_s = sqrt(d^2/((1-del)^(-2) - 1));

N = ceil(log(d)/log(k));

% Pre-warping of frequencies
wc_min = wc_warp*((1-del)^(-2) - 1)^(-1/(2*N));
wc_max = ws_warp*((del_s)^(-2) - 1)^(-1/(2*N));

wn = (wc_max + wc_min)/2;

%% Actual Filter Design

% Hey! Look at that, MATLAB has a function to design Butterworth Filters!
[b,a] = butter(N,wn,'s');

% This uses the coefficients to create a continuous time system object
sys = tf(b,a);
bode(sys);

% And this handy function converts that continuous time systems to 
% a digital one for us, using the bilinear transformation. 
d_sys = c2d(sys,2,'zoh')
