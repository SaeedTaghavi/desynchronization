import numpy as np
import matplotlib.pyplot as plt

# N=10
# fig = plt.figure()
# fig.subplots_adjust(hspace=.0, wspace=.0)
# for i in range(1,N+1):
#     ax = fig.add_subplot(N,1,i)
#     x = np.random.normal(loc=0.0,scale=1.0,size=1000)
#     ax.set_yticks([20]) 
#     ax.hist(x, bins=100)
#     # ax.axis("off")
# plt.show()    

# exit()

# N=10
# fig = plt.figure()
# fig.subplots_adjust(hspace=.0, wspace=.0)
# for i in range(1,N+1):
#     ax = fig.add_subplot(N/2,2,i)
#     x = np.random.normal(loc=0.0,scale=1.0,size=1000)
#     ax.set_yticks([20]) 
#     ax.hist(x, bins=100)
#     # ax.axis("off")
#     if (i % 2 != 1 ):
#         ax.axes.get_yaxis().set_visible(False)
# plt.show()

# exit()

N=12
fig = plt.figure()
fig.subplots_adjust(hspace=.0, wspace=.0)
for i in range(1,N+1):
    ax = fig.add_subplot(N/3,3,i)
    x = np.random.normal(loc=0.0,scale=1.0,size=1000)
    ax.set_yticks([20]) 
    ax.hist(x, bins=100)
    # ax.axis("off")
    if (i % 3 != 1 ):
        ax.axes.get_yaxis().set_visible(False)
plt.show()    
exit()
