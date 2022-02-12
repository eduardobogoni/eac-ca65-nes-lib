; https://wiki.nesdev.org/w/index.php?title=PPU_OAM

SPRITE_Y_OFFSET = 0
SPRITE_T_OFFSET = 1
SPRITE_A_OFFSET = 2
SPRITE_X_OFFSET = 3

.define sprite_address(sprite_index, byte_index) oam + (sprite_index * 4) + byte_index
.define sprite_y(sprite_index) sprite_address(sprite_index, SPRITE_Y_OFFSET)
.define sprite_t(sprite_index) sprite_address(sprite_index, SPRITE_T_OFFSET)
.define sprite_a(sprite_index) sprite_address(sprite_index, SPRITE_A_OFFSET)
.define sprite_x(sprite_index) sprite_address(sprite_index, SPRITE_X_OFFSET)
