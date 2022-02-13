.macro push_registers
  pha
  txa
  pha
  tya
  pha
.endmacro


.macro pull_registers
  pla
  tay
  pla
  tax
  pla
.endmacro
