
subroutine initiate(theta,omega,N,upper_theta0,mu_omega,sigma_omega)
    implicit none
    integer::N           ! number of rotators
    real*8::theta(N)     ! phases of rotators
    real*8::omega(N)     ! natural frequencies 
    real*8::mu_omega,sigma_omega  ! mean value and standard deviation of the gaussian distribution function
    real(8) :: upper_theta0
    call initiate_theta(theta,N,upper_theta0)
    call initiate_omega(omega,N,mu_omega,sigma_omega)
    call save_initials(theta, omega, N)
end subroutine initiate

subroutine initiate_theta(theta,N,upper_theta0)
    implicit none
    integer::N           ! number of rotators
    real*8::theta(N)     ! phases of rotators
    real(8) :: upper_theta0
    !theta(i) is choosen from a uniform random dist. in (0,2*pi)
    call random_number(theta)
    theta=theta*upper_theta0
end subroutine initiate_theta

subroutine  initiate_omega(omega,N,mu,sigma)
    implicit none
    integer::N           ! number of rotators
    real*8::omega(N)     ! natural frequencies 
    real*8::mu,sigma     ! mean value and standard deviation of the gaussian distribution function for natural frequencies
    !omega(i) is choosen from a gaussian dist. with mean value mu and standard deviation sigma
    ! call random_gaussian(omega,N,mu,sigma)
    call random_number(omega)
    omega = omega + 0.50d0
end subroutine  initiate_omega

subroutine read_initials(N,theta0,omega)
    implicit none
    integer :: N
    real(8) :: theta0(N)
    real(8) :: omega(N)
    integer:: i
    open (91,file="./input/theta0.in")
    open (92,file="./input/omega0.in")
    do i=1,N
        read(91,*)theta0(i)
        read(92,*)omega(i)
    end do
    close(92)
    close(91)
end subroutine read_initials
