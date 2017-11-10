x = -10:10;
y = zeros(1,10);
y = [y ones(1,11)]

stem(x,y)
title('Unit Step Function')
xlabel('Samples')
ylabel('Values')
saveas(gcf, '../Notes/images/unit_step_stemplot.png')
