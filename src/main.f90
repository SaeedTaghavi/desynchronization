program kuramotoMain
implicit none
integer,parameter::N=20            ! number of rotators
real(8), parameter :: pi = 4.0d0*datan(1.0d0)
real*8,allocatable::theta(:)       ! phases of rotators
real*8,allocatable::theta_pulsed(:)       ! phases of rotators
real(8) :: upper_theta0
real*8,allocatable::dTheta_dt(:)   ! rate of change of phases
real*8,allocatable::dTheta_dt_pulsed(:)   ! rate of change of phases after applying pulse
real*8,allocatable::omega(:)       ! natural frequencies 
! real*8::mu_omega,sigma_omega       ! mean value and standard deviation of natural frequencies
real*8:: K                         ! coupling const.
real*8:: t, tstop,dt      ! time, end time and time step for simulation
integer::num_t                     ! total number of time steps
real(8):: r , psi , r_pulsed, r_nonpulsed,dr                   ! order parameter at the moment
integer::i,i_pulse
real(8) :: mean
real(8),allocatable :: pulse(:)
allocate(theta(N),dTheta_dt(N),omega(N), theta_pulsed(N),dTheta_dt_pulsed(N),pulse(N))

!checked  !todo t=250     
!checked  !todo pulse t=100
!checked  ! todo freeze initial constant
!todo jaye pulse ro taghir bedam 0,2*pi loop over ipulse time



theta=0.0
dTheta_dt=0.0
omega=0.0
t=0.d0
! mu_omega=0.0
! sigma_omega=1.0
! upper_theta0 = 2.0*pi
tstop=250.0
dt=0.1
num_t=int(tstop/dt)


! K=0.80d0
K=0.70d0

! call initiate(theta,omega,N,upper_theta0,mu_omega,sigma_omega)

! do i_pulse= (num_t/5)+1 , 2*num_t/5
do i_pulse=(4*num_t/10) , (5*num_t/10)
! i_pulse=((4*num_t/10)+20)
i=0
t=i*dt
call read_initials(N,theta,omega)
theta_pulsed = theta
call find_order_param(theta,N,r,psi)
call save_order_param(t,r,psi,dt,i_pulse)
! call calc_mean_phase(theta,N,mean)
! call save_mean_phase(mean,0,dt)


call find_order_param(theta_pulsed,N,r,psi)
call save_order_param_pulsed(t,r,psi,dt,i_pulse)
! call calc_mean_phase(theta_pulsed,N,mean)
! call save_mean_phase(mean,0,dt)

! for relaxing system we let it go for 1/5 of the simulation time
do i=1,4*num_t/10
    call derivs(dTheta_dt,theta,N,K,omega)
    call derivs(dTheta_dt_pulsed,theta_pulsed,N,K,omega)
    call integrate_one_step(theta,dTheta_dt,N,dt)
    theta = mod(theta,2.0d0*pi)
    call integrate_one_step(theta_pulsed,dTheta_dt_pulsed,N,dt)
    theta_pulsed = mod(theta_pulsed,2.0d0*pi)
    t=i*dt
    call find_order_param(theta,N,r,psi)
    call save_order_param(t,r,psi,dt,i_pulse)
    call save_phases(t,theta,N,dt,i_pulse)
    ! call save_derivs(t,dTheta_dt,N)

    call find_order_param(theta_pulsed,N,r,psi)
    call save_order_param_pulsed(t,r,psi,dt,i_pulse)
    call save_phases_pulsed(t,theta_pulsed,N,dt,i_pulse)
    ! call save_derivs_pulsed(t,dTheta_dt_pulsed,N)
end do

do i=(4*num_t/10)+1 , num_t
    call derivs(dTheta_dt,theta,N,K,omega)
    call derivs(dTheta_dt_pulsed,theta_pulsed,N,K,omega)
    ! call calc_mean_vector(theta_pulsed,N,mean)
    call calc_mean_phase(theta,N,mean)
    ! print*,mean
    call save_mean_phase(mean,i,dt,i_pulse)
    pulse =0.0d0
    ! print*,"****"
    ! if ( mod(mean,2*pi)-(pi/4.0) < 1.e-9) then 
    ! if ( mean-(pi/4.0) < 1.e-6) then 
    if (i==i_pulse) then 
        ! print*,mod(mean,2*pi)-(pi/4.0)
        ! print*,"true"
        call calculate_pulse(theta_pulsed,N,pulse)
        call apply_pulse(dTheta_dt_pulsed,N,pulse)
        ! call find_order_param(theta_pulsed,N,r,psi)
        ! r_pulsed= r
        ! call find_order_param(theta,N,r,psi)
        ! r_nonpulsed= r
        ! dr=r_nonpulsed-r_pulsed
        ! write(*,*) t_pulse , dr
    end if 
    if (i==i_pulse+1) then 
        call find_order_param(theta_pulsed,N,r,psi)
        ! print *,"r_pulsed:",r
        r_pulsed= r
        call find_order_param(theta,N,r,psi)
        ! print *,"r_nonpulsed:",r
        r_nonpulsed= r
        dr=r_pulsed-r_nonpulsed
        ! write(*,*) t_pulse , dr
        call save_dr(i_pulse,dt,dr)
    end if
    call save_pulse(t, pulse,N,dt,i_pulse)
    call integrate_one_step(theta,dTheta_dt,N,dt)
    theta = mod(theta,2.0d0*pi)
    call integrate_one_step(theta_pulsed,dTheta_dt_pulsed,N,dt)
    theta_pulsed = mod(theta_pulsed,2.0d0*pi)
    t=i*dt
    call find_order_param(theta,N,r,psi)
    call save_order_param(t,r,psi,dt,i_pulse)
    ! if (i>(num_t/5)+47 .and. i<(num_t/5)+53) then 
    !     print*,i,"order param",r
    ! end if
    call save_phases(t,theta,N,dt,i_pulse)
    call save_derivs(t,dTheta_dt,N,dt,i_pulse)
    call find_order_param(theta_pulsed,N,r,psi)
    ! if (i>(num_t/5)+47 .and. i<(num_t/5)+53) then 
    !     print*,i,"order param pulsed",r
    ! end if
    call save_order_param_pulsed(t,r,psi,dt,i_pulse)
    call save_phases_pulsed(t,theta_pulsed,N,dt,i_pulse)
    call save_derivs_pulsed(t,dTheta_dt_pulsed,N,dt,i_pulse) !inja))  
end do
end do  ! do i_pulse
end program kuramotoMain


! todo: hame save ha bayad be noei taghir konad ke esmeshan bar asas zaman pulse dadan entekhab
! shavad ta beshe baraye hame order parameter r, psi va hamintor dr-tpulse rasm kard
