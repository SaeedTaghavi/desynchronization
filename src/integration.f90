
subroutine integrate_one_step(theta,dTheta_dt,N,dt)
    !forward euler integration
    implicit none
    integer::N            ! number of rotators
    real*8::theta(N)      ! phases of rotators
    real*8::dTheta_dt(N)  ! rate of change of phases
    real*8:: dt

    theta=(dTheta_dt*dt)+theta
end subroutine integrate_one_step
