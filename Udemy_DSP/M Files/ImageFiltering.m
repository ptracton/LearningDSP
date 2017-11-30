%% Startup and Globals

clear all
clc

%% Filter Parameters
width = 3840;
height = 2160;
n = 1000;
sig = 5;

% Read in the image
A = imread('canyon.jpg');
% Convert it to grayscale to make things slightly simpler
A = rgb2gray(A);
% Display it. 
imshow(A);

% Convert the image to floating point numbers
A = double(A);
% Create a gaussian kernel (similar to a sinc wave in 2D, gives us 
% lowpass characteristics
H = fspecial('gaussian',n, sig);

% Do the filtering via direct convolution (and time it with tic/toc)
tic
A_conv = conv2(A,H,'same');
toc

% Display the result
figure;
imshow(A_conv, []);
%% FFT Convolution

% Dot he filterting via FFT convolution (and time it with tic/toc)
tic
A_freq = fft2(A,height+n-1,width+n-1);
H_freq = fft2(H,height+n-1,width+n-1);

Out_freq = A_freq.*H_freq;

Out = ifft2(Out_freq);
toc

% Display the result
figure;
imshow(Out,[]);
