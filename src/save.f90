
subroutine save_pulse(t, pulse,N,dt,i_pulse)
    implicit none
    real(8) :: t,dt
    integer :: N
    real(8) :: pulse (N)
    integer:: i_pulse
    character(*),parameter::base_filename="pulse-"
    character(len=50) :: filename
    WRITE(filename,'(a,i4.4,a)') base_filename, i_pulse, ".txt"
    call save_vec_t(t, pulse, N,filename)
end subroutine save_pulse

subroutine save_dr(i_pulse,dt,dr)
    implicit none
    real(8):: dr, dt
    integer:: i_pulse
    character(len=50) :: filename
    filename="dr_t_pulse.txt"
    open(unit=91,file=filename,action="write",position="append")
    write(91,*)i_pulse, i_pulse*dt,dr
    close(91)
end subroutine 

subroutine save_mean_phase(mean_phase,i,dt,i_pulse)
    implicit none
    real(8):: dt,mean_phase
    integer:: i,i_pulse
    character(*),parameter::base_filename="mean_phase-"
    character(len=50) :: filename
    WRITE(filename,'(a,i4.4,a)') base_filename, i_pulse, ".txt"
    open(unit=91,file=filename,action="write",position="append")
    write(91,*)i,i*dt,mean_phase
    close(91)
end subroutine 

subroutine save_initials(theta, omega, N)
    implicit none
    integer :: N
    real(8) :: theta(N)
    real(8) :: omega(N)
    integer :: i
    open (91,file="omega0.txt")
    open (92,file="theta0.txt")
    do i=1,N
        write(91,*) omega(i)
        write(92,*) cos(theta(i)) , sin(theta(i))
    end do
    close(92)
    close(91)
end subroutine

subroutine save_derivs(t,dTheta_dt,N,dt,i_pulse) 
    implicit none
    integer :: N        ! number of rotators
    integer :: i_pulse
    real(8) :: t ,dt    ! time
    real(8) :: dTheta_dt(N) ! phases of all rotators
    character(*),parameter::base_filename="dtheta_dt-"
    character(len=50) :: filename
    WRITE(filename,'(a,i4.4,a)') base_filename, i_pulse, ".txt"
    call save_vec_t(t, dTheta_dt, N,filename)
end subroutine save_derivs

subroutine save_derivs_pulsed(t,dTheta_dt,N,dt,i_pulse) !inja
    implicit none
    integer :: N        ! number of rotators
    integer :: i_pulse
    real(8) :: t , dt   ! time
    real(8) :: dTheta_dt(N) ! phases of all rotators
    character(*),parameter::base_filename="dtheta_dt_pulsed-"
    character(len=50) :: filename
    WRITE(filename,'(a,i4.4,a)') base_filename, i_pulse, ".txt"
    call save_vec_t(t, dTheta_dt, N,filename)
end subroutine save_derivs_pulsed

subroutine save_phases(t,theta,N,dt,i_pulse)
    implicit none
    integer :: N        ! number of rotators
    integer :: i_pulse
    real(8), parameter :: pi = 4.0d0*datan(1.0d0)
    real(8) :: t ,dt    ! time
    real(8) :: theta(N) ! phases of all rotators
    ! real(8) :: theta_mod2pi(N) ! phases of all rotators
    ! character(len=50) :: filename_theta, filename_thetaMOD2pi
    character(*),parameter::base_filename="theta-"
    character(len=50) :: filename
    WRITE(filename,'(a,i4.4,a)') base_filename, i_pulse, ".txt"
    ! filename_theta="theta_t.txt"
    ! filename_thetaMOD2pi="thetaMOD2pi_t.txt"
    ! theta_mod2pi = mod(theta,2.0d0*pi)
    call save_vec_t(t, theta, N,filename)
    ! call save_vec_t(t, theta_mod2pi, N,filename_thetaMOD2pi)
end subroutine save_phases

subroutine save_phases_pulsed(t,theta,N,dt,i_pulse)
    implicit none
    integer :: N        ! number of rotators
    integer :: i_pulse
    real(8), parameter :: pi = 4.0d0*datan(1.0d0)
    real(8) :: t , dt   ! time
    real(8) :: theta(N) ! phases of all rotators
    ! real(8) :: theta_mod2pi(N) ! phases of all rotators
    ! character(len=50) :: filename_theta, filename_thetaMOD2pi
    ! filename_theta="theta_pulsed_t.txt"
    ! filename_thetaMOD2pi="theta_pulsedMOD2pi_t.txt"
    ! theta_mod2pi = mod(theta,2.0d0*pi)
    ! call save_vec_t(t, theta, N,filename_theta)
    ! call save_vec_t(t, theta_mod2pi, N,filename_thetaMOD2pi)
    character(*),parameter::base_filename="theta_pulsed-"
    character(len=50) :: filename
    WRITE(filename,'(a,i4.4,a)') base_filename, i_pulse, ".txt"
    call save_vec_t(t, theta, N,filename)
end subroutine save_phases_pulsed

subroutine save_vec_t(t, vec, vec_size,filename)
    integer :: vec_size
    real(8) :: t
    real(8) :: vec(vec_size)
    integer :: i
    character(50)::filename
    open(unit=91,file=filename,action="write",position="append")
    write(91,'(f8.3$)') t
    ! write(*,'(f8.3$)') t
    do i =1 , vec_size
        write(91,'(f8.3$)') vec(i)
        ! write(*,'(f8.3$)') vector(i)
    end do
    write(91,*) ""
    close(91)
end subroutine save_vec_t

subroutine save_order_param(t,r,psi,dt,i_pulse)
    implicit none
    real*8::t             ! time
    real*8::r,psi         ! order complex order parameter at time t
    real(8)::dt
    integer:: i_pulse
    character(*),parameter::base_filename="order_param-"
    character(len=50) :: filename
    WRITE(filename,'(a,i4.4,a)') base_filename, i_pulse, ".txt"
    open(unit=91,file=filename,action="write",position="append")
    write(91,*)t,r,psi
    ! write(91,"(3f7.2)")t,r,psi
    close(91)
end subroutine save_order_param

subroutine save_order_param_pulsed(t,r,psi,dt,i_pulse) !inja
    implicit none
    real*8::t  ,dt        ! time
    real*8::r,psi         ! order complex order parameter at time t
    integer :: i_pulse

    character(*),parameter::base_filename="order_param_pulsed-"
    character(len=50) :: filename
    WRITE(filename,'(a,i4.4,a)') base_filename, i_pulse, ".txt"
    open(unit=91,file=filename,action="write",position="append")
    write(91,*)t,r,psi
    ! write(91,"(3f7.2)")t,r,psi
    close(91)

end subroutine save_order_param_pulsed

subroutine save_vector(vec,vec_size)
    implicit none
    integer::vec_size,i
    real*8::vec(vec_size)
    ! open(91,file="filename")
    do i=1,vec_size
        write(1,"(f7.2)") vec(i)
    end do
end subroutine save_vector