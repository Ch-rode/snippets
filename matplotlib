## 1. Marker in a scatterpplot with the same scale of the axes

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
