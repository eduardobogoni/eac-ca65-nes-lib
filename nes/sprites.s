; https://wiki.nesdev.org/w/index.php?title=PPU_OAM

.segment "OAM"

oam: .res 256        ; sprite OAM data to be uploaded by DMA

SPRITE_Y_OFFSET = 0
SPRITE_T_OFFSET = 1
SPRITE_A_OFFSET = 2
SPRITE_X_OFFSET = 3

.define sprite_address(sprite_index, byte_index) oam + (sprite_index * 4) + byte_index
.define sprite_y(sprite_index) sprite_address(sprite_index, SPRITE_Y_OFFSET)
.define sprite_t(sprite_index) sprite_address(sprite_index, SPRITE_T_OFFSET)
.define sprite_a(sprite_index) sprite_address(sprite_index, SPRITE_A_OFFSET)
.define sprite_x(sprite_index) sprite_address(sprite_index, SPRITE_X_OFFSET)

.macro sprite_byte_offset_to_x sprite_offset, attr_offset
  .if attr_offset <> 0
    lda sprite_offset
    clc
    adc #attr_offset
    tax
  .else
    ldx sprite_offset
  .endif
.endmacro
