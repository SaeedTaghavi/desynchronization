import numpy as np
import matplotlib.pyplot as plt

def find_order_param(phases,Nosc):
    r = psi = real_sum = img_sum = 0.0
    for i in range(Nosc):
        real_sum = real_sum + np.cos(phases[i])
        img_sum = img_sum + np.sin(phases[i])
    real_sum = real_sum / Nosc
    img_sum = img_sum / Nosc
    r=np.sqrt((real_sum*real_sum)+(img_sum*img_sum))
    psi=np.arccos(real_sum/r)
    return r , psi

def derivs(phases, omega, Nosc, K):
    dphases_dt = np.zeros((Nosc))
    for i in range(Nosc):
        sumation = 0.0
        for j in range(Nosc):
            sumation = sumation + np.sin(phases[j]-phases[i])
        sumation = sumation * K / Nosc
        sumation = sumation + omega[i]
        dphases_dt[i] = sumation
    return dphases_dt

def integrate_one_step(x,dxdt,dt):
    x=(dxdt*dt)+x
    return x

Nosc = 10
num_time_steps=500
K = 10.5
t=np.linspace(0.0, 50.0, num = num_time_steps)
dt = t[2] - t[1]

theta = np.zeros((Nosc,num_time_steps))
dtheta_dt = np.zeros((Nosc,num_time_steps))
omega = np.zeros((Nosc))
np.random.seed(9001)
theta0 = np.random.uniform(low=0.0, high=2.0*np.pi, size=Nosc)
thetaP = theta0
omega = np.random.uniform(0.0,10.0,size= Nosc)

for itime in range(num_time_steps):
    # print(thetaP)
    for iOsc in range(Nosc):
        theta[iOsc][itime] = thetaP[iOsc]
    dthetadt = derivs(thetaP,omega,Nosc, K)
    for iOsc in range(Nosc):
        dtheta_dt[iOsc][itime] = dthetadt[iOsc]
    thetaN = integrate_one_step(thetaP,dthetadt,dt)
    for iOsc in range(Nosc):
        thetaN[iOsc] = thetaN[iOsc] % (2.0*np.pi)
    thetaP = thetaN

# N=Nosc
# fig = plt.figure()
# fig.subplots_adjust(hspace=.0, wspace=.0)
# for i in range(1,N+1):
#     ax = fig.add_subplot(N,1,i)
#     ax.set_yticks([np.pi]) 
#     ax.plot(t,np.sin(theta[i-1]))
#     # ax.axis("off")
# plt.show()  

# fig = plt.figure()
# fig.subplots_adjust(hspace=.0, wspace=.0)
# ax = fig.add_subplot(111)
# for i in range(N):
#     ax.set_yticks([np.pi]) 
#     ax.plot(t,np.sin(theta[i-1]))
#     # ax.axis("off")
# # ax.hline(0.0,19.0)
# plt.show()  



# fig = plt.figure()
# fig.subplots_adjust(hspace=.0, wspace=.0)
# for i in range(1,N+1):
#     ax = fig.add_subplot(N,1,i)
#     ax.set_yticks([np.pi]) 
#     ax.plot(t,dtheta_dt[i-1])
#     # ax.axis("off")
# plt.show()   

r = np.zeros((num_time_steps))
psi = np.zeros((num_time_steps))
for itime in range(num_time_steps):
    theta_itime = np.zeros((Nosc))
    for iOsc in range(Nosc):
        theta_itime[iOsc] = theta[iOsc][itime]
    r[itime],psi[itime]=find_order_param(theta_itime,Nosc)

plt.plot(t,r)
plt.show()


# fig = plt.figure()
# fig.subplots_adjust(hspace=.0, wspace=.10)
# for i in range(1,3):
#     ax = fig.add_subplot(1, 2, i ,polar=True)
#     if (i==1):
#         ax.hist(theta0, bins = 360 ,bottom=10.0)
#         ax.set_title('initial')
#     if (i==2): 
#         ax.hist(thetaN, bins = 360 ,bottom=10.0)
#         ax.set_title('final')
#     ax.axis("off")
#     ax.set_yticks([])
#     ax.set_xticks([])
# plt.show()    

fig = plt.figure()
fig.subplots_adjust(hspace=.0, wspace=.10)

ax = fig.add_subplot(111 ,polar=True)
ax.hist(theta0, bins = 360 ,bottom=10.0)
ax.set_title('initial')
ax.axis("off")
ax.set_yticks([])
ax.set_xticks([])
plt.show()

fig = plt.figure()
fig.subplots_adjust(hspace=.0, wspace=.10)
ax = fig.add_subplot(111 ,polar=True)
ax.hist(thetaN, bins = 360 ,bottom=10.0)
ax.set_title('final')
ax.axis("off")
ax.set_yticks([])
ax.set_xticks([])
plt.show()

exit()
