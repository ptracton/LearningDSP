x = -10:10;
y = zeros(1,21);
y(11) = 1;

stem(x,y)
title('Unit Sample Function')
xlabel('Samples')
ylabel('Values')
saveas(gcf, '../Notes/images/dirac_stemplot.png')
