#! /usr/bin/env python3

import math


class DSP():
    """
    DSP Demonstration class that implements the code
    from DSP For Scientists and Engineers, Second Edition
    """
    
    def __init__(self, samples=None):
        """
        """
        self.samples = samples
        return

    def Mean(self):
        """
        Calculate the mean of a list of values.
        The self.samples list should be set when instantiating
        this instance.
        """
        mean = 0
        for x in self.samples:
            mean = mean + x
        mean = mean/len(self.samples)
        return mean

    def StandardDeviation(self):
        """
        Calculate the standard deviation of a list of values.
        The self.samples list should be set when instantiating
        this instance.
        """
        mean = self.Mean()
        std = 0.0
        for x in self.samples:
            std = std + math.pow((x - mean), 2)
        std = std / (len(self.samples) - 1)
        std = math.sqrt(std)
        return std

    def Variance(self):
        """
        Calculate the variance of a list of values.
        The self.samples list should be set when instantiating
        this instance.
        """
        return math.pow(self.StandardDeviation(), 2)

    def RunningStatistics(self):
        """
        Calculate the mean, variance and std while running through a list of
        values. The self.samples list should be set when instantiating
        this instance.
        """
        mean = 0
        variance = 0
        std = 0
        temp_sum = 0
        sum_squares = 0
        N = len(self.samples)
        for x in self.samples:
            temp_sum = temp_sum + x
            sum_squares = sum_squares + math.pow(x, 2)
            mean = temp_sum/N
            variance = (sum_squares - (math.pow(temp_sum, 2)/N)) / (N - 1)
            std = math.sqrt(variance)
            print("RunningStatistics: Mean {} Variance {} STD {}".format(
                mean, variance, std))
        return mean, variance, std

    def SNR(self):
        """
        Calculate the Signal to Noise Ratio based on the
        already stored self.samples list
        """
        SNR = self.Mean()/self.StandardDeviation()
        return SNR

    def CV(self):
        """
        Calculate the Signal to Coefficient of Variation
        based on the already stored self.samples list
        """
        CV = (self.StandardDeviation()/self.Mean()) * 100
        return CV
