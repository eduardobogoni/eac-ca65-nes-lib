.include "nes/registers.s"
.include "nes/memory_map.s"
.include "nes/ppu.s"
.include "nes/nametables.s"
.include "nes/palettes.s"
.include "nes/sprites.s"
.include "nes/gamepad.s"

INES_MAPPER = 0 ; 0 = NROM
INES_MIRROR = 1 ; 0 = horizontal mirroring, 1 = vertical mirroring
INES_SRAM   = 0 ; 1 = battery backed SRAM at $6000-7FFF

.macro nes_header
  .byte 'N', 'E', 'S', $1A ; ID
  .byte $02 ; 16k PRG chunk count
  .byte $01 ; 8k CHR chunk count
  .byte INES_MIRROR | (INES_SRAM << 1) | ((INES_MAPPER & $f) << 4)
  .byte (INES_MAPPER & %11110000)
  .byte $0, $0, $0, $0, $0, $0, $0, $0 ; padding
.endmacro

.macro nes_reset
  sei       ; mask interrupts
  lda #0
  sta PPUCTRL ; disable NMI
  sta PPUMASK ; disable rendering
  sta SND_CHN ; disable APU sound
  sta DMC_FREQ ; disable DMC IRQ
  lda #$40
  sta JOY2 ; disable APU IRQ
  cld       ; disable decimal mode
  ldx #$FF
  txs       ; initialize stack
  ; wait for first vblank
  bit PPUSTATUS
  vblank_wait
  ; clear all RAM to 0
  ram_clear
  sprites_clear
  ; wait for second vblank
  vblank_wait
  ; NES is initialized, ready to begin!
  ; enable the NMI for graphical updates, and jump to our main program
  lda #%10101000
  sta PPUCTRL
.endmacro

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
