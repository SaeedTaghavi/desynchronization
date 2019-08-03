
subroutine derivs(dTheta_dt,theta,N,K,omega)
    implicit none
    integer::N           ! number of rotators
    real*8::theta(N)     ! phases of rotators
    real*8::omega(N)     ! natural frequencies 
    real*8::K            ! coupling const.
    real*8::dTheta_dt(N)  ! rate of change of phases
    real*8:: sumation
    integer::i,j
    do i =1,N
        sumation=0.0
        do j=1,N
            sumation = sumation + sin(theta(j)-theta(i))
        end do
        sumation = sumation * K/N
        sumation = sumation + omega(i)
        sumation = sumation 
        dTheta_dt (i) = sumation
    end do
end subroutine derivs
