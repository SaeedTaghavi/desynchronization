import numpy as np
import matplotlib.pyplot as plt

N = 360
bottom = 1
max_height = 1

theta = np.random.uniform(low=0.0,high=2.0*np.pi,size=N*N)

theta_bins = np.linspace(0.0, 2 * np.pi, N, endpoint=False)

radii = max_height*np.random.rand(N)
width = (2*np.pi) / N

ax = plt.subplot(111, polar=True)
bars = ax.bar(theta_bins, radii, width=width, bottom=bottom)
ax.axis("off")

# Use custom colors and opacity
#for r, bar in zip(radii, bars):
#    bar.set_facecolor(plt.cm.jet(r / 10.))
#    bar.set_alpha(0.8)

plt.show()
