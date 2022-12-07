# constr_cell_relax.F
This subroutine allows to block the relaxation of the unit cell along specific direction by setting to zero the selected entries of the stress tensor in VASP. In fact VASP, does not allow by default to relax the cellshape selectively only along specific direction. This behaviour can now be achived via the INCAR, by selecting certain components of the stress tensor to zero.
This is done via the routine CONSTR_CELL_RELAX which allow to constraint the cell relaxation.
FCELL contains the forces on the basis vectors. These forces are used to modify the basis vectors.
