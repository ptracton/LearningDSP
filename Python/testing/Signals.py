#! /usr/bin/env python3

import numpy as np
import scipy.fftpack
import numpy as np

class Signals:

    def __init__(self, Amplitude=0, Frequency=0, Phase=0, SamplesPerSecond=0, StopTime=0):
        self.Amplitude = Amplitude
        self.Frequency = Frequency
        self.Phase = Phase
        self.SamplesPerSecond = SamplesPerSecond
        self.StopTime = StopTime
        self.x = 0
        self.signal = 0
        self.fft = 0
        self.max_freq = 0
        return

    def SineWave(self):
        dt = 1/self.SamplesPerSecond
        self.x = np.arange(0, self.StopTime-dt, dt)
        self.signal = self.Amplitude * np.sin((2*np.pi*self.Frequency*self.x) + self.Phase)
        return self.signal


    def CosineWave(self):
        dt = 1/self.SamplesPerSecond
        self.x = np.arange(0, self.StopTime-dt, dt)
        self.signal = self.Amplitude * np.cos((2*np.pi*self.Frequency*self.x) + self.Phase)
        return self.signal

    def do_fft(self):
        self.fft = scipy.fftpack.fft(self.signal)
        return self.fft

    def max_frequency(self):
        """
        # https://stackoverflow.com/questions/3694918/how-to-extract-frequency-associated-with-fft-values-in-python
        """
        freqs = scipy.fftpack.fftfreq(len(self.fft))
        idx = np.argmax(np.abs(self.fft))
        freq = freqs[idx]
        self.max_freq = abs(freq * self.SamplesPerSecond)
        return self.max_freq
    
    def __add__(self, x):
        z = x.signal + self.signal
        signal =Signals()
        signal.signal = z
        return signal
