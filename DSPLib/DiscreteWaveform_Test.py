#! /usr/bin/env python3

import sys
import unittest
import numpy as np
import DiscreteWaveform


class TestDiscreteWaveform(unittest.TestCase):

    def setUp(self):
        return

    def tearDown(self):
        return

    def test_DiscreteWaveformDefaultValues(self):
        """
        Test the default values of the constructor
        """
        self.waveform = DiscreteWaveform.DiscreteWaveform()
        self.assertEqual(self.waveform.samples, np.array([0]))
        self.assertEqual(self.waveform.times, np.array([0]))
        self.assertEqual(self.waveform.framerate, 1)
        return

    def test_DiscreteWaveformConstructorValues(self):
        """
        Test setting values in the constructor
        """
        samples = [0, 1, 2, 3, 4]
        times = [5, 6, 7, 8, 9]
        framerate = 100
        self.waveform = DiscreteWaveform.DiscreteWaveform(samples=samples,
                                                          times=times,
                                                          framerate=framerate)
        self.assertEqual(self.waveform.samples, samples)
        self.assertEqual(self.waveform.times, times)
        self.assertEqual(self.waveform.framerate, framerate)
        return    

if __name__ == "__main__":
    print("Testing DiscreteWaveform")
    unittest.main()
    print("\nALL DONE\n")
    sys.exit(0)
