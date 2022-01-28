; https://wiki.nesdev.org/w/index.php?title=PPU_OAM

.define sprite_address(sprite_index, byte_index) oam + (sprite_index * 4) + byte_index
.define sprite_y(sprite_index) sprite_address(sprite_index, 0)
.define sprite_i(sprite_index) sprite_address(sprite_index, 1)
.define sprite_a(sprite_index) sprite_address(sprite_index, 2)
.define sprite_x(sprite_index) sprite_address(sprite_index, 3)
