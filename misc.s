.macro for_x_asc_start
  ldx #0
  :
.endmacro

.macro for_x_asc_end count
  inx
  cpx count
  bcc :-
.endmacro

.macro for_x_desc_start count
  ldx count
  :
.endmacro

.macro for_x_desc_end count
  dex
  bne :-
.endmacro
