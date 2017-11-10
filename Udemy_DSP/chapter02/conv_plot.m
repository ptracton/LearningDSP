
% simple decresing line
x = 11:-1:0;

% y is the unit impulse function
y = zeros(1,5);
y = [y, ones(1,5)];

z = conv(x,y);

figure
subplot(3,1,1);
stem(x);
axis([0 25 0 15])
title('Input Signal')

subplot(3,1,2);
stem(y);
axis([0 25 0 5])
title('Unit Step');

subplot(3,1,3);
stem(z);
title('Convolution In Action')

saveas(gcf, '../Notes/images/convolution_stemplot.png')
