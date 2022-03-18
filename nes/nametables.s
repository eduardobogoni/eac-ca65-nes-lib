; Reference: https://www.nesdev.org/wiki/PPU_nametables

NAMETABLE_TOP_LEFT = $2000
NAMETABLE_TOP_RIGHT = $2400
NAMETABLE_BOTTOM_LEFT = $2800
NAMETABLE_BOTTOM_RIGHT = $2C00
NAMETABLE_TILES_COLUMNS = 32
NAMETABLE_TILES_ROWS = 30

.macro nametable_fill nametable_mem_start, tile_value, attribute_value
  ppuaddr_write nametable_mem_start
  lda #tile_value
  for_y_desc_start #NAMETABLE_TILES_COLUMNS
    for_x_desc_start #NAMETABLE_TILES_ROWS
      sta PPUDATA
    for_x_desc_end
  for_y_desc_end
  ; set all attributes to #attribute_value
  lda #attribute_value
  for_x_desc_start #64 ; 64 bytes
    sta PPUDATA
  for_x_desc_end
.endmacro
