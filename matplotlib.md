## 1. Marker in a scatterpplot with the same scale of the axes (from [here](https://stackoverflow.com/questions/36458458/python-scatter-plot-area-size-proportional-axis-length))
- the size of the markers is in points, not in pixels. In typography, the point is the smallest unit of measure and correspond in matplotlib to a fixed length of 1/72 inch. In contrast, the size of a pixel will vary following the figure dpi and size.
- the size of the markers in plt.scatter are related to the diameter of the circles, not the radius.

So the size in points of each marker should be calculated as:

`size_in_points = (2 * radius_in_pixels / fig_dpi * 72 points/inch)**2`

Moreover, as shown in the MWE below, it is possible to calculate the size of the marker radius in pixels directly with matplotlib transformations, without having to generate an empty figure beforehand.  Point at (1, 1) with radius 0.5 assigned will result in a circle in the plot centered at (1, 1) and with the border going throught the points (1.5, 1), (1, 1.5), (0.5, 1) and (1, 0.5):
```
import numpy as np
import matplotlib.pyplot as plt

plt.close('all')

# Generate some data :
N = 5
x = np.random.randint(1, 5, 5) 
y = np.random.randint(1, 5, 5) 
r = np.array([0.5,1,0.5,1,0.5]) 


# Plot the data :
fig = plt.figure(facecolor='white', figsize=(7, 7))
ax = fig.add_subplot(111, aspect='equal')
ax.grid(True)
scat = ax.scatter(x, y, s=0, alpha=0.5, clip_on=False)
ax.axis([0, 5, 0, 5])

# Draw figure :
fig.canvas.draw()

# Calculate radius in pixels :
rr_pix = (ax.transData.transform(np.vstack([r, r]).T) -
          ax.transData.transform(np.vstack([np.zeros(N), np.zeros(N)]).T))
rpix, _ = rr_pix.T

# Calculate and update size in points:
size_pt = (2*rpix/fig.dpi*72)**2
scat.set_sizes(size_pt)

# Save and show figure:
plt.show()
```
![image](https://github.com/Ch-rode/snippets/assets/61243245/5d6fae0b-879a-4bed-9248-b53a069fd3d9)

