.macro nes_header mapper, mirror
  .ifnblank mapper
    v_mapper .set mapper
  .else
    v_mapper .set INES_MAPPER_DEFAULT
  .endif
  .ifnblank mirror
    v_mirror .set mirror
  .else
    v_mirror .set INES_MIRROR_DEFAULT
  .endif
  .segment "HEADER"

  .byte 'N', 'E', 'S', $1A ; ID
  .byte $02 ; 16k PRG chunk count
  .byte $01 ; 8k CHR chunk count
  .byte v_mirror | (INES_SRAM << 1) | ((v_mapper & $f) << 4)
  .byte (v_mapper & %11110000)
  .byte $0, $0, $0, $0, $0, $0, $0, $0 ; padding
.endmacro
