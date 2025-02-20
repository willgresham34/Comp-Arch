.data
arr:        .word   10, 3, 45, 90, 12
msg_res:    .asciiz "Largest in given array is"

.text
main:

    li      $t0,    0                           # init i
    la      $t1,    arr                         # load array
    lw      $s0,    0($t1)                      # get initial max value

Loop:
    beq     $t0,    5,      PrintMax            # if at end of array





PrintMax: