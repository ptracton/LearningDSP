clear all;
close all;
clc;


Frequency = 100;
Amplitude = 2;
SamplesPerSecond = 1024;
Phase = 0;
StopTime = 0.5; % seconds

s = sine_wave(Amplitude, Frequency, Phase, SamplesPerSecond, StopTime);
c = cosine_wave(-1*Amplitude, Frequency*3, Phase, SamplesPerSecond, StopTime);

s1 = s + c + rand(length(s), 1);

fftLength = 1024;
signalLength = length(s1);

win = rectwin(signalLength);
ham = hamming(signalLength);
black = blackman(signalLength);
han = hanning(signalLength);

yrect = fft(s1.*win, fftLength);
yham = fft(s1.*ham, fftLength);
yhan = fft(s1.*han, fftLength);
yblack = fft(s1.*black, fftLength);


figLength = fftLength/2 + 1;

figure
subplot(3,1,1)
plot(s1);
title('Initial Input Signal')
xlabel('Time (mS)')

subplot(3,1,2)
plot([1:figLength]*Frequency/(2*figLength),abs(yrect(1:figLength)));
hold on;
grid on;
plot([1:figLength]*Frequency/(2*figLength),abs(yham(1:figLength)));
plot([1:figLength]*Frequency/(2*figLength),abs(yblack(1:figLength)));
plot([1:figLength]*Frequency/(2*figLength),abs(yhan(1:figLength)));
title('Linear Magnitude')
xlabel('Frequency (Hz)')
ylabel('Magnitude')
legend('Rectangular Window', 'Hamming Window', 'Blackman Window', 'Hanning Window');

subplot(3,1,3)
plot([1:figLength]*Frequency/(2*figLength),20*log10(abs(yrect(1:figLength))));
hold on;
grid on;
plot([1:figLength]*Frequency/(2*figLength),20*log10(abs(yham(1:figLength))));
plot([1:figLength]*Frequency/(2*figLength),20*log10(abs(yblack(1:figLength))));
plot([1:figLength]*Frequency/(2*figLength),20*log10(abs(yhan(1:figLength))));
title('Log Magnitude')
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')
legend('Rectangular Window', 'Hamming Window', 'Blackman Window', 'Hanning Window');
