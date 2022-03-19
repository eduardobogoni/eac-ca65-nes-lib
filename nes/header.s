.macro nes_header mapper, mirror, sram
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
  .ifnblank sram
    v_sram .set sram
  .else
    v_sram .set INES_SRAM_DEFAULT
  .endif
  .segment "HEADER"

  .byte 'N', 'E', 'S', $1A ; ID
  .byte $02 ; 16k PRG chunk count
  .byte $01 ; 8k CHR chunk count
  .byte v_mirror | (v_sram << 1) | ((v_mapper & $f) << 4)
  .byte (v_mapper & %11110000)
  .byte $0, $0, $0, $0, $0, $0, $0, $0 ; padding
.endmacro
