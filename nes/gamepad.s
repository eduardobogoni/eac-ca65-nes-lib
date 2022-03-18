KEY_A = $01
KEY_B = $02
KEY_SELECT = $04
KEY_START = $08
KEY_UP = $10
KEY_DOWN = $20
KEY_LEFT = $40
KEY_RIGHT = $80

.macro joy1_down key, routine
  lda joy1_current
  and #key
  beq :+
    jsr routine
  :
.endmacro

.macro joy1_up key, routine
  lda joy1_current
  and #key
  bne :+
    jsr routine
  :
.endmacro

.macro joy1_press key, routine
  lda joy1_previous
  and #key
  bne :+
  joy1_down key, routine
.endmacro

.macro joy1_release key, routine
  lda joy1_previous
  and #key
  beq :+
  joy1_up key, routine
.endmacro

.segment "CODE"

joy1_poll:
@copy_current_to_previous:
  lda joy1_current
  sta joy1_previous
@strobe_the_gamepad_to_latch_current_button_state:
  lda #1
  sta JOY1
  lda #0
  sta JOY1
@read_8_bytes_from_the_interface_at_4016:
  for_x_desc_start #8
    pha
    lda JOY1
    ; combine low two bits and store in carry bit
    and #%00000011
    cmp #%00000001
    pla
    ; rotate carry into gamepad variable
    ror
  for_x_desc_end
  sta joy1_current
  rts
