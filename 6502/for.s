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

.macro for_x_desc_end
  dex
  bne :-
.endmacro

.macro for_y_asc_start start_count
  .ifblank start_count
    ldy #0
  .else
    ldy start_count
  .endif
  :
.endmacro

.macro for_y_asc_end count
  iny
  cpy count
  bcc :--
.endmacro

.macro for_y_desc_start count
  ldy count
  :
.endmacro

.macro for_y_desc_end
  dey
  bne :--
.endmacro
