import matplotlib.pyplot as plt
import numpy as np


fig = plt.figure()
# fig, ax = plt.subplots(3, 3, figsize=(5, 5))
fig.subplots_adjust(hspace=0, wspace=0)
for i in range(1,5):
    ax = fig.add_subplot(2, 2, i,polar=True)
    x = np.random.normal(loc=0.0,scale=1.0,size=1000)
    # x= np.random.uniform(low=0.0, high = 2.0*np.pi, size =1000)
    ax.hist(x, bins=360,bottom=10.0)
    ax.axis("off")
plt.show()    
exit()


# x = np.random.uniform(0.0,2.0*np.pi,size=5000)
x = np.random.normal(loc=0.0,scale=1.0,size=1000)
ax = plt.subplot(111, polar=True)
ax.hist(x, bins=360,bottom=10.0)
# plt.ylabel('No of times')
ax.axis("off")
plt.show()    
exit()
