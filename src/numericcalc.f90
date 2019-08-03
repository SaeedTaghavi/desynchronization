
subroutine calc_mean_vector(vec,vec_size,mean)
    implicit none
    integer :: vec_size
    real(8) :: vec(vec_size)
    real(8) :: mean
    mean=0.0
    mean = sum(vec)
    mean = mean/real(vec_size)
end subroutine calc_mean_vector

subroutine calc_mean_phase(theta,N,mean)
    implicit none
    integer :: N
    real(8) :: theta(N),mean
    call calc_mean_vector(theta,N,mean)
end subroutine calc_mean_phase

