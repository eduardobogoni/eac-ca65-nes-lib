.macro ppuaddr_write value
  lda PPUSTATUS ; reset latch
  lda #>value
  sta PPUADDR
  lda #<value
  sta PPUADDR
.endmacro
