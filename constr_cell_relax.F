!-----------------------------------------------------------------------
!
! At present, VASP does not allow to relax the cellshape selectively
! i.e. for instance only cell relaxation in x direction.
! To be more precisse, this behaviour can not be achived via the INCAR
! or POSCAR file.
! However, it is possible to set selected components of the stress tensor
! to zero.
! The most conveninent position to do this is the routines 
! CONSTR_CELL_RELAX  (constraint cell relaxation).
! FCELL contains the forces on the basis vectors.
! These forces are used to modify the basis vectors according
! to the following equations:
!
!      A_OLD(1:3,1:3)=A(1:3,1:3) ! F90 style 
!      DO J=1,3
!      DO I=1,3
!      DO K=1,3
!        A(I,J)=A(I,J) + FCELL(I,K)*A_OLD(K,J)*STEP_SIZE
!      ENDDO
!      ENDDO
!      ENDDO
! where A holds the basis vectors (in cartesian coordinates).
!
!-----------------------------------------------------------------------

      SUBROUTINE CONSTR_CELL_RELAX(FCELL)
      USE prec
      USE base
      USE vaspxml
      USE reader_tags
      IMPLICIT NONE
      REAL(q) FCELL(3,3)
      REAL :: SAVE1, SAVE2

      INTEGER IU5,IU0, i
      INTEGER ITYP,NTYP
      INTEGER IDUM, IERR
      REAL(q) RDUM
      COMPLEX(q) CDUM
      LOGICAL LOPEN,LDUM
      CHARACTER (1) :: CHARAC

      INTEGER, ALLOCATABLE :: CONSTRCELL(:)      ! 11 12 13 21 22 23 31 32 33
      ALLOCATE(CONSTRCELL(9))

      DO i=1,9
         CONSTRCELL(i)=1
      ENDDO

      CALL PROCESS_INCAR(LOPEN, IU0, IU5, 'CONSTRCELL', CONSTRCELL, 9, IERR, WRITEXMLINCAR)

        IF (CONSTRCELL(1).eq.0) FCELL(1,1)=0   
        IF (CONSTRCELL(2).eq.0) FCELL(1,2)=0
        IF (CONSTRCELL(3).eq.0) FCELL(1,3)=0
        IF (CONSTRCELL(4).eq.0) FCELL(2,1)=0
        IF (CONSTRCELL(5).eq.0) FCELL(2,2)=0
        IF (CONSTRCELL(6).eq.0) FCELL(2,3)=0
        IF (CONSTRCELL(7).eq.0) FCELL(3,1)=0
        IF (CONSTRCELL(8).eq.0) FCELL(3,2)=0
        IF (CONSTRCELL(9).eq.0) FCELL(3,3)=0

!      write(*,*) 'FCELL ACTIVATED', CONSTRCELL
!      write(*,*) FCELL

      RETURN
      END SUBROUTINE


