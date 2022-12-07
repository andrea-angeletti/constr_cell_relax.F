# constr_cell_relax.F
This subroutine allows to block the relaxation of the unit cell only along specific direction by setting to zero the selected entries of the stress tensor in VASP. 

In fact, VASP does not allow by default to relax the cellshape selectively only along specific direction.

This behaviour can now be achived in the INCAR, by selecting certain components of the stress tensor to zero.

This is done via the routine CONSTR_CELL_RELAX which allow to constraint the cell relaxation.

FCELL contains the forces on the basis vectors. These forces are used to modify the basis vectors.

Stress_Tensor = 

| 11	12	13 |

| 21	22	23 |

| 31	32	33 |

The flag used in INCAR is "CONSTRCELL" and is built this way:

CONSTRCELL= 11 12 13 21 22 23 31 32 33 

By setting 0 or 1 in the INCAR file is possible to chose if the relative entry is set to zero or not.

For example with this FLAG:

CONSTRCELL= 1 0 0 0 0 0 0 0 0

In this way only the 11 entry of the stress tensor will be different from zero, and relaxation will be allowed only in that direction.


This subroutine is contained inside the src folder, it is only necessary to replace the existing file with the provided one and compile VASP again.


Developed by Pietro Maria Forcella and Andrea Angeletti.
