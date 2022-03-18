.macro for_x_asc_start start_count
  .ifblank start_count
    ldx #0
  .else
    ldx start_count
  .endif
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
