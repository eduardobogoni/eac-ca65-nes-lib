.include "nes/registers.s"
.include "nes/memory_map.s"
.include "nes/ppu.s"
.include "nes/nametables.s"
.include "nes/palettes.s"
.include "nes/sprites.s"
.include "nes/gamepad.s"
.include "nes/header.s"
.include "nes/reset.s"

.macro vblank_wait
  :
    bit PPUSTATUS
    bpl :-
.endmacro
