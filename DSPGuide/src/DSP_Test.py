#! /usr/bin/env python3

"""
Check Results:
http://www.calculator.net/standard-deviation-calculator.html?numberinputs=0%2C+1%2C+2%2C+3%2C+4%2C+5%2C+6%2C+7%2C+8%2C+9%2C+10%2C+11%2C+12%2C+13%2C+14%2C+15%2C+16%2C+17%2C+18%2C+19%2C+20%2C+21%2C+22%2C+23%2C+24%2C+25%2C+26%2C+27%2C+28%2C+29%2C+30%2C+31%2C+32%2C+33%2C+34%2C+35%2C+36%2C+37%2C+38%2C+39%2C+40%2C+41%2C+42%2C+43%2C+44%2C+45%2C+46%2C+47%2C+48%2C+49%2C+50%2C+51%2C+52%2C+53%2C+54%2C+55%2C+56%2C+57%2C+58%2C+59%2C+60%2C+61%2C+62%2C+63%2C+64%2C+65%2C+66%2C+67%2C+68%2C+69%2C+70%2C+71%2C+72%2C+73%2C+74%2C+75%2C+76%2C+77%2C+78%2C+79%2C+80%2C+81%2C+82%2C+83%2C+84%2C+85%2C+86%2C+87%2C+88%2C+89%2C+90%2C+91%2C+92%2C+93%2C+94%2C+95%2C+96%2C+97%2C+98%2C+99&x=68&y=19
"""

import random
import DSP


if __name__ == "__main__":
    samples = [x for x in range(100)]
    dsp = DSP.DSP(samples)
    print(samples)
    print("Mean {} ".format(dsp.Mean()))
    print("StandardDeviation {} ".format(dsp.StandardDeviation()))
    print("Variance {} ".format(dsp.Variance()))
    mean, variance, std = dsp.RunningStatistics()
    print("SNR: {}".format(dsp.SNR()))
    print("CV: {}".format(dsp.CV()))
    print("TypicalError: {}".format(dsp.TypicalError()))
    dsp.samples = random.sample(range(-100, 100), 100)
    dsp.Histogram("histogram.png")
