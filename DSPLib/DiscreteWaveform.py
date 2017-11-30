#! /usr/bin/env python3

import numpy as np
import scipy as sp


class DiscreteWaveform():
    """
    A class representing a discrete time waveform
    """

    def __init__(self, samples=None, times=None, framerate=None):

        if samples is None:
            self.samples = np.array([0])
        else:
            self.samples = samples

        if times is None:
            self.times = np.array([0])
        else:
            self.times = times

        if framerate is None:
            self.framerate = 1
        else:
            self.framerate = framerate
            
        return
