
subroutine random_gaussian(vec,vec_size,mu,sigma)
    implicit none
    integer::vec_size
    real*8::vec(vec_size)    ! random variable with a gaussian distribution of mean value mu, and standard deviation sigma
    real*8::z(vec_size)      ! random variable with a standard gaussian distribution, mu=0.0, sigma=1.0
    real*8::mu,sigma         ! mean value and standard deviation of the gaussian distribution function
    call random_standard_gaussian(z,vec_size)
    vec=(z*sigma)+mu
end subroutine random_gaussian

subroutine random_standard_gaussian(vec,vec_size)
    implicit none
    !using Box-Muller transform
    real*8,parameter::pi=4.0d0*datan(1.0d0)
    integer::vec_size
    real*8::vec(vec_size)
    real*8::u1(vec_size),u2(vec_size)    ! two independent random number from a uniform distribution on the interval (0,1)
    real*8::z1(vec_size),z2(vec_size)    ! two independent random variable with a standard gaussian distribution, mu=0.0, sigma=1.0
    real*8::r(vec_size),theta(vec_size)
    
    call random_number(u1)
    call random_number(u2)
    
    r=sqrt(-2.0*log(u1))
    theta=2.0*pi*u2
    
    z1=r*sin(theta)
    z2=r*cos(theta)
    vec=z1
end subroutine random_standard_gaussian
