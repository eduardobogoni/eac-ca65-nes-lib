.macro nes_header
  .segment "HEADER"

  .byte 'N', 'E', 'S', $1A ; ID
  .byte $02 ; 16k PRG chunk count
  .byte $01 ; 8k CHR chunk count
  .byte INES_MIRROR | (INES_SRAM << 1) | ((INES_MAPPER & $f) << 4)
  .byte (INES_MAPPER & %11110000)
  .byte $0, $0, $0, $0, $0, $0, $0, $0 ; padding
.endmacro
