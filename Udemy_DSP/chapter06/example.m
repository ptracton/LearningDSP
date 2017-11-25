
% n = 16 so we get linear convolution output is 12 samples
% Need tp pad to get to 16 samples lone in each
a = [1 1 1 0 0 0 1 1 1];
b = [1 0 1 1];

x = [1 1 1 0 0 0 1 1 1 0 0 0 0 0 0 0];% manually added 0s, not good
                                      % for large sequences

clear x;

x = [a 0 0 0 0 0 0 0];
x = [a zeros(1,7)];
y = [b, zeros(1,12)];

A = fft(a, 16);
B = fft(b, 16);
X = fft(x);
Y = fft(y);

% . operations do element by element
C = A .* B;
Z = X .* Y;
Zi = ifft(Z)
Ci = ifft(C,16)
