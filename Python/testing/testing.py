#! /usr/bin/env python3

import matplotlib.pyplot as plt
import scipy.fftpack
import scipy.signal
import numpy as np
import Signals

if __name__ == "__main__":
    Amplitude = 2
    Frequency = 100
    SamplesPerSecond = 1024
    T = 1.0 / SamplesPerSecond
    Phase = 0
    StopTime = 1
    y = Signals.Signals(Amplitude, Frequency, Phase, SamplesPerSecond, StopTime)
    y.SineWave()

    w = Signals.Signals(3*Amplitude, 3*Frequency, Phase, SamplesPerSecond, StopTime)
    w.CosineWave()

    z = w + y

    y.do_fft()
    print(y.max_frequency())
    
    #yf = scipy.fftpack.fft(z)
    yf = z.do_fft()
    xf = np.linspace(0.0, 1.0/(2.0*T), SamplesPerSecond/2)

    
    freqs = scipy.fftpack.fftfreq(len(yf))
    idx = np.argmax(np.abs(yf))
    freq = freqs[idx]
    freq_in_hertz = abs(freq * SamplesPerSecond)
    print(freq_in_hertz)

    hamming = scipy.signal.hamming(SamplesPerSecond-1)
    hanning = scipy.signal.hanning(SamplesPerSecond-1)
    blackman = scipy.signal.blackman(SamplesPerSecond-1)
    rectangular = scipy.signal.boxcar(SamplesPerSecond-1)    
    
#    plt.plot(hamming)
#    plt.plot(hanning)
 #   plt.plot(blackman)
#    plt.plot(rectangular)
#    plt.show()

    plt.subplot(2, 1, 1)
    plt.plot(hamming)
    plt.title("Hamming window")
    plt.ylabel("Amplitude")
    plt.xlabel("Sample")
    #plt.figure()
    A = scipy.fftpack.fft(hamming, 1024) / (len(hamming)/2.0)
    freq = np.linspace(-0.5, 0.5, len(A))
    response = 20 * np.log10(np.abs(scipy.fftpack.fftshift(A / abs(A).max())))
    plt.subplot(2, 1, 2)
    plt.plot(freq, response)
    plt.axis([-0.5, 0.5, -120, 0])
    plt.title("Frequency response of the Hamming window")
    plt.ylabel("Normalized magnitude [dB]")
    plt.xlabel("Normalized frequency [cycles per sample]")
    plt.show()


#    fig, ax = plt.subplots()
#    ax.plot(xf, 2.0/SamplesPerSecond * np.abs(yf[:SamplesPerSecond//2]))
#    plt.grid(True)
#    plt.show()    

