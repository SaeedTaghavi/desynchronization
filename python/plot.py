import numpy as np
import pylab as plt
from matplotlib import rc, rcParams
rc('text',usetex=True)
# Change all fonts to 'Computer Modern'
rc('font',**{'family':'serif','serif':['Computer Modern']})

order_param = np.loadtxt("../output/order_param-1015.txt")
order_param = np.transpose(order_param)
order_param_pulsed = np.loadtxt("../output/order_param_pulsed-1015.txt")
order_param_pulsed = np.transpose(order_param_pulsed)
mean_phase = np.loadtxt("../output/mean_phase-1015.txt")
mean_phase = np.transpose(mean_phase)

pulse = np.loadtxt("../output/pulse-1015.txt")
pulse = np.transpose(pulse)
print(np.shape(pulse)[1])
for i in range(np.shape(pulse)[1]):
     if (pulse[1][i] != 0.0):
         pulse_time = pulse[0][i]
# print(np.shape(order_param))
# print(order_param[0][:])

plt.figure(1)
plt.plot(order_param[0][:],order_param[1][:],'b--')
plt.plot(order_param_pulsed[0][:],order_param_pulsed[1][:],'r:',label='pulsed')
plt.vlines(pulse_time,np.min(order_param_pulsed[1]),np.max(order_param_pulsed[1]))
plt.ylim(0, 1)
plt.title(r'order parameter', fontsize=18)
plt.xlabel(r'time',fontsize=17)
plt.ylabel(r'r', fontsize=17)
plt.legend(loc='upper right')
# plt.savefig('order_param_r.png')
# plt.savefig('order_param_r.eps', format='eps', dpi=1000)
plt.savefig('order_param_r.eps', format='eps', dpi=300)

# plt.show()
# exit()

plt.figure(2)
plt.subplot(2, 1, 1)
plt.plot(order_param[0][:],order_param[2][:])
plt.plot(order_param_pulsed[0][:],order_param_pulsed[2][:],label='pulsed')
plt.vlines(pulse_time,np.min(order_param_pulsed[2]),np.max(order_param_pulsed[2]))
plt.title(r'order parameter', fontsize=18)
# plt.xlabel(r'time',fontsize=17)
plt.ylabel(r'$ \psi $', fontsize=17)
plt.legend(loc='upper right')

plt.subplot(2, 1, 2)
plt.plot(order_param[0][1010:1175],order_param[2][1010:1175])
plt.plot(order_param_pulsed[0][1010:1175],order_param_pulsed[2][1010:1175],label='pulsed')
plt.vlines(pulse_time,np.min(order_param_pulsed[2]),np.max(order_param_pulsed[2]))
plt.xlabel(r'time',fontsize=17)
plt.ylabel(r'$ \psi $', fontsize=17)
plt.legend(loc='upper right')
plt.savefig('order_param_psi.eps', format='eps', dpi=300)
# plt.savefig('order_param_psi.png')



# plt.figure(3,figsize=(20,5))
plt.figure(3)
plt.subplot(2, 1, 1)
plt.plot(mean_phase[1][:],mean_phase[2][:])
plt.vlines(pulse_time,np.min(mean_phase[2]),np.max(mean_phase[2]))
plt.title(r'mean phases', fontsize=18)
# plt.xlabel(r'time',fontsize=17)
plt.ylabel(r'$ \frac{\Sigma_{i=1}^{N} \theta_{i}}{N} $', fontsize=17)
# plt.legend(loc='upper right')

plt.subplot(2, 1, 2)
plt.plot(mean_phase[1][5:180],mean_phase[2][5:180])
plt.vlines(pulse_time,np.min(mean_phase[2]),np.max(mean_phase[2]))
# plt.title(r'mean phases', fontsize=18)
plt.xlabel(r'time',fontsize=17)
plt.ylabel(r'$ \frac{\Sigma_{i=1}^{N} \theta_{i}}{N} $', fontsize=17)

plt.savefig('mean_phases.eps', format='eps', dpi=300)


plt.figure(4)
plt.subplot(2, 1, 1)
plt.plot(mean_phase[1][5:180],mean_phase[2][5:180],label ='non-pulsed')
plt.vlines(pulse_time,np.min(mean_phase[2]),np.max(mean_phase[2]))
plt.title(r'mean phases', fontsize=18)
plt.ylabel(r'$ \frac{\Sigma_{i=1}^{N} \theta_{i}}{N} $', fontsize=17)
plt.legend(loc='upper right')

plt.subplot(2, 1, 2)

# plt.title(r'mean phases', fontsize=18)
plt.plot(order_param[0][1010:1175],order_param[2][1010:1175],label ='non-pulsed')
plt.plot(order_param_pulsed[0][1010:1175],order_param_pulsed[2][1010:1175],label='pulsed')
plt.vlines(pulse_time,np.min(order_param_pulsed[2]),np.max(order_param_pulsed[2]))
plt.xlabel(r'time',fontsize=17)
plt.ylabel(r'$\psi$ (order paramter)', fontsize=17)
plt.legend(loc='upper right')

plt.savefig('period.eps', format='eps', dpi=300)


# plt.show()



# # sample plot
# x=np.linspace(0,10,100)
# y=np.random.uniform(low=0.0,high=1.0 , size=100)
# plt.figure(1)
# plt.plot(x,y)
# plt.title(r'random uniform number', fontsize=18)
# plt.xlabel(r'$ X $',fontsize=17)
# plt.ylabel(r'Y', fontsize=17)
# plt.savefig('plot.png')
# plt.show()
