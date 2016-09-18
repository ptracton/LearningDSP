#! /usr/bin/env python3

import matplotlib.pyplot as plt
import numpy as np

def f(data):
    return np.sin(2*np.pi*data)

n = t = np.arange(-1.0, 1.0, 0.05)
x = np.sin(2*np.pi*n)

fig = plt.figure()
axes = fig.add_subplot(1, 1, 1)

plt.figure(1)
plt.subplot(311)
plt.stem(n, f(n))

plt.ylabel('Discrete Data x[n]')
plt.xlabel('Data Index n')
plt.title("Sine Plot")


plt.subplot(312)
plt.stem(n, f(2*n))


plt.ylabel('Discrete Data x[-1*n]')
plt.xlabel('Data Index n')
plt.title("Sine Plot")

plt.subplot(313)
plt.stem(n, f(n/3))


plt.ylabel('Discrete Data x[-1*n]')
plt.xlabel('Data Index n')
plt.title("Sine Plot")

ax = plt.gca()
ax.set_xticklabels([])
fig.tight_layout()
plt.show()
fig.savefig('simple_stem.png')
