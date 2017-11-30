%% Startup and Globals

clear all
clc

n = -100000:100000;

h = zeros(1,length(n));

for i=1:length(n)
    if n(i) == 0
        h(i) = 1;
    else
        h(i) = sin(0.6*pi*n(i))/(0.6*pi*n(i));
    end
end

% This step ensures the DC gain of the filter is 0 (no change to DC
% signals).
gain = sum(h);
h = h./gain;

%% Hanning Window

hann_N = 100;
w_hann = zeros(1,hann_N);
h_hann = zeros(1,hann_N);

midpoint = ceil(length(n)/2);
window_start = midpoint - ceil(hann_N/2) - 1;
for i=1:hann_N
    w_hann(i) = 0.5 - 0.5*cos(2*pi*n(i)/hann_N);
    h_hann(i) = w_hann(i)*h(i+ window_start);
end

% This step ensures the DC gain of the filter is 0 (no change to DC
% signals).
gain = sum(h_hann);
h_hann = h_hann./gain;

%% Hamming Window

hamm_N = 100;
w_hamm = zeros(1,hamm_N);
h_hamm = zeros(1,hamm_N);

window_start = midpoint - ceil(hamm_N/2) - 1;

for i=1:hamm_N
    w_hamm(i) = 0.54 - 0.46*cos(2*pi*n(i)/hamm_N);
    h_hamm(i) = w_hamm(i)*h(i + window_start);
end

% This step ensures the DC gain of the filter is 0 (no change to DC
% signals).
gain = sum(h_hamm);
h_hamm = h_hamm./gain;

%% Blackman Window

black_N = 100;
w_black = zeros(1,black_N);
h_black = zeros(1,black_N);

window_start = midpoint - ceil(black_N/2) - 1;

for i=1:black_N
    w_black(i) = 0.42 - 0.5*cos(2*pi*n(i)/black_N) + 0.08*cos(4*pi*n(i)/black_N);
    h_black(i) = w_black(i)*h(i + window_start);
end

% This step ensures the DC gain of the filter is 0 (no change to DC
% signals).
gain = sum(h_black);
h_black = h_black./gain;

%% Comparing Frequency Responses
% Freqz will easily calculate the frequency response of an FIR filter.
[a, b] = freqz(h);
[a_hann, b_hann] = freqz(h_hann);
[a_hamm, b_hamm] = freqz(h_hamm);
[a_black, b_black] = freqz(h_black);
close all;

%% Plot results and save
figure;
hold on;
subplot(2,1,1);
plot(b,10*log(abs(a)));
title('Magnitude - Ideal');
ylabel('dB');
subplot(2,1,2);
phase = atan2(imag(a),real(a));
plot(b,phase);
title('Phase - Ideal');
ylabel('Radians');
saveas(gcf,'Filter Comparison 1','jpg');

figure;
subplot(2,1,1);
plot(b,10*log(abs(abs(a_hann))));
title('Magnitude - Hanning');
ylabel('dB');
subplot(2,1,2);
phase = atan2(imag(a_hann),real(a_hann));
plot(b,phase);
title('Phase - Hanning');
ylabel('Radians');
saveas(gcf,'Filter Comparison 2','jpg');

figure;
subplot(2,1,1);
plot(b,10*log(abs(abs(a_hamm))));
title('Magnitude - Hamming');
ylabel('dB');
subplot(2,1,2);
phase = atan2(imag(a_hamm),real(a_hamm));
plot(b,phase);
title('Phase - Hamming');
ylabel('Radians');
saveas(gcf,'Filter Comparison 3','jpg');

figure;
subplot(2,1,1);
plot(b,10*log(abs(abs(a_black))));
title('Magnitude - Blackman');
ylabel('dB');
subplot(2,1,2);
phase = atan2(imag(a_black),real(a_black));
plot(b,phase);
title('Phase - Blackman');
ylabel('Radians');
saveas(gcf,'Filter Comparison 4','jpg');

%close all;
