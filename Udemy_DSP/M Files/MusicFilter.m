%% Esatblish Our Parameters

% Number of poles for each filter
n_poles = 10;

% Where our corner will be
cutoff_frequency = 0.015;

% For use with bandpass/bandstop, we need two corners
freq_range = [0.10 0.4];

% The range of audio data we will use
start_sec = 10;
end_sec = 15;

%% Read Audio Data

% Read the actual file on disk
[data, Fs] = audioread('OVERWERK - After Hours - 01 Daybreak.flac');

% Credit to OVERWERK - http://www.overwerk.com/ for his great music
% Chop the data so we're only listening to 5 seconds instead of 6 minutes
chopped_data = data(Fs*start_sec:Fs*end_sec, :);

%% First Filter - Butterworth Lowpass

% Use MATLAB's built in butter function to compute the coefficients of the
% Butterworth filter

[b, a] = butter(n_poles,cutoff_frequency);

% Another MATLAB built-in, filter, will apply the filter we just designed
% to the audio data
filtered_song = filter(b,a,chopped_data);

% Play the music unedited first, then filtered
sound(chopped_data,Fs);
pause(end_sec + 1 - start_sec);
sound(filtered_song,Fs);
pause(end_sec + 1 - start_sec);

%% Second Filter - Butterworth Highpass

% Use MATLAB's built in butter function to compute the coefficients of the
% Butterworth filter
[b, a] = butter(n_poles,cutoff_frequency,'high');

% Another MATLAB built-in, filter, will apply the filter we just designed
% to the audio data
filtered_song = filter(b,a,chopped_data);

% Play the music unedited first, then filtered
%sound(chopped_data,Fs);
%pause(end_sec + 1 - start_sec);
sound(filtered_song,Fs);
pause(end_sec + 1 - start_sec);

%% Third Filter - Butterworth Bandpass

% Use MATLAB's built in butter function to compute the coefficients of the
% Butterworth filter
[b, a] = butter(n_poles,freq_range,'bandpass');

% Another MATLAB built-in, filter, will apply the filter we just designed
% to the audio data
filtered_song = filter(b,a,chopped_data);

% Play the music unedited first, then filtered
%sound(chopped_data,Fs);
%pause(end_sec + 1 - start_sec);
sound(filtered_song,Fs);
pause(end_sec + 1 - start_sec);

%% Final Filter - Butterworth Bandstop

% Use MATLAB's built in butter function to compute the coefficients of the
% Butterworth filter
[b, a] = butter(n_poles,freq_range,'stop');

% Another MATLAB built-in, filter, will apply the filter we just designed
% to the audio data
filtered_song = filter(b,a,chopped_data);

% Play the music unedited first, then filtered
%sound(chopped_data,Fs);
%pause(end_sec + 1 - start_sec);
sound(filtered_song,Fs);
pause(end_sec + 1 - start_sec);
