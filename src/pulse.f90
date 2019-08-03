
subroutine apply_pulse(dTheta_dt_pulsed,N,pulse)
    implicit none
    integer::N                  ! number of rotators
    real*8::dTheta_dt_pulsed(N) ! phases of rotators
    real*8::pulse(N)            ! pulse which will be applied to each rotator 
    dTheta_dt_pulsed = dTheta_dt_pulsed + pulse
end subroutine apply_pulse


subroutine calculate_pulse(theta_pulsed,N,pulse)
    implicit none
    integer::N                  ! number of rotators
    real*8::theta_pulsed(N)     ! phases of rotators
    real*8::pulse(N)            ! pulse which will be applied to each rotator 
    pulse = 5.0d0*dsin(theta_pulsed)
end subroutine calculate_pulse

