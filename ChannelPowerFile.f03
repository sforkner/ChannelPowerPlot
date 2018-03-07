PROGRAM ChannelPowerFile
  !======================================================================
  ! Reads in X,Y power map from GIST and outputs a data file formated
  ! for plotting by GNUplot  
  !======================================================================
  IMPLICIT NONE
  INTEGER, PARAMETER :: i_max=32, j_max=32
  INTEGER, PARAMETER :: ix_first=-1, ix_del=2, jy_first=62, jy_del=-2
  INTEGER  :: i, ix, j, jy
  REAL, DIMENSION(i_max,j_max) :: p
  !
  OPEN(unit=1, file='channelpower.txt')
  READ(unit=1,fmt='(32(32f7.3/))') p

  OPEN(unit=2, file='channelpower.dat')
  DO i=1,i_max
     ix = ix_first + (i-1)*ix_del
     DO j=1,j_max
        jy = jy_first + (j-1)*jy_del
        WRITE(unit=2,fmt='(2i3,f7.3)') ix, jy, p(i,j)
     END DO
  END DO
  CLOSE(unit=1)
  CLOSE(unit=2)
  !
END PROGRAM ChannelPowerFile
