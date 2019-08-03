import numpy as np
from matplotlib import animation
import matplotlib.pyplot as plt
from matplotlib import rc, rcParams

rc('text',usetex=True)
# Change all fonts to 'Computer Modern'
rc('font',**{'family':'serif','serif':['Computer Modern']})

base_address="../output/"
base_filename="order_param-"
base_filename_pulsed="order_param_pulsed-"
base_filename_pulse="pulse-"
base_filename_phase="theta-"
base_filename_phase_pulsed="theta_pulsed-"
ext_filename=".txt"
i=1022
filename_phase_pulsed=base_filename_phase_pulsed+'%04d' % i + ext_filename
file_phase_address_pulsed=base_address+filename_phase_pulsed

phases_pulsed=np.loadtxt(file_phase_address_pulsed)
phases_pulsed=np.transpose(phases_pulsed)
# print(np.shape(phases_pulsed)[0])
# print(np.shape(phases_pulsed)[1])
num_osilators=np.shape(phases_pulsed)[0]-1
num_timesteps=np.shape(phases_pulsed)[0]
times=phases_pulsed[0][:]
phases_pulsed=phases_pulsed[1:][:]  #first index indicates the rotator id, and the second index indicates that rotator in time 
# print(np.shape(phases_pulsed))
# print(np.shape(phases_pulsed[2][:]))
# print(np.shape(phases_pulsed))
phases_pulsed=np.transpose(phases_pulsed)
# print(np.shape(phases_pulsed))
# print(phases_pulsed[1])

# First set up the figure, the axis, and the plot element we want to animate
fig = plt.figure()
ax = plt.axes(xlim=(-1.1, 1.1), ylim=(-1.1, 1.1))
pointS, = ax.plot([], [], 'ro')
time_text = ax.text(0.05, 0.95,'',horizontalalignment='left',verticalalignment='top', transform=ax.transAxes)


# initialization function: plot the background of each frame
def init():
    pointS.set_data([], [])
    time_text.set_text(0)

    return time_text ,pointS,

# animation function.  This is called sequentially
def animate(i):
    # x=np.sin(np.random.random(20))
    # y=np.cos(np.random.random(20))
    x=np.sin(phases_pulsed[i])
    y=np.cos(phases_pulsed[i])
    
    pointS.set_data(x ,y)
    time_text.set_text(i)

    return time_text,pointS,

# call the animator.  blit=True means only re-draw the parts that have changed.
anim = animation.FuncAnimation(fig, animate, init_func=init,frames=1250, interval=50, blit=True)
Writer = animation.writers['ffmpeg']
writer = Writer(fps=15, metadata=dict(artist='Me'), bitrate=1800)
anim.save('im.mp4', writer=writer)
# anim.save('./animation.gif', writer='imagemagick', fps=30)
# plt.show()
exit()

