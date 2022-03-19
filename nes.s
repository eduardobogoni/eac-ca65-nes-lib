.include "nes/registers.s"
.include "nes/memory_map.s"
.include "nes/ppu.s"
.include "nes/nametables.s"
.include "nes/palettes.s"
.include "nes/sprites.s"
.include "nes/gamepad.s"
.include "nes/header.s"
.include "nes/reset.s"

.macro ram_clear
  lda #0
  ldx #0
  :
    sta $0000, X
    sta $0100, X
    sta $0200, X
    sta $0300, X
    sta $0400, X
    sta $0500, X
    sta $0600, X
    sta $0700, X
    inx
    bne :-
.endmacro

.macro vblank_wait
  :
    bit PPUSTATUS
    bpl :-
.endmacro
