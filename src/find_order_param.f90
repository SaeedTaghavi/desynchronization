
subroutine find_order_param(theta,N,r,psi)
    ! computes the complex order parameterreturned as the variables r and psi,
    ! where r is the magnitude and psi is the angle
    implicit none
    integer::N            ! number of rotators
    real*8::theta(N)      ! phases of rotators
    real*8:: r , psi      ! order parameter at the moment
    real*8:: real_sum,imag_sum
    integer::j
    r=0.0d0
    psi=0.0d0
    real_sum=0.d0
    imag_sum=0.d0
    do j=1,N
        real_sum=real_sum+dcos(theta(j))
        imag_sum=imag_sum+dsin(theta(j))
    end do
    real_sum=real_sum/N
    imag_sum=imag_sum/N

    r=dsqrt((real_sum*real_sum)+(imag_sum*imag_sum))
    psi=dacos(real_sum/r)

end subroutine find_order_param
