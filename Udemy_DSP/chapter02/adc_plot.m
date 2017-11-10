close all;
clear;
clc;

x = 0:.05:pi/2;
y= sin(x);

plot(x,y)
hold on
stem(x,y)
title('Sine Wave and Samples')
legend('Continuous Signal', 'Discrete Values')

saveas(gcf, '../Notes/images/adc_plot_example.png')
