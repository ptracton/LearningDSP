

function wave = sine_wave(Amplitude, Frequency, Phase, SamplesPerSecond, StopTime)

  %% Time specifications:
  dt = 1/SamplesPerSecond;                   % seconds per sample 
  t = (0:dt:StopTime-dt)';     % seconds
  
  %% Sine wave:
  wave = Amplitude * sin((2*pi*Frequency*t) + Phase );
  
end
