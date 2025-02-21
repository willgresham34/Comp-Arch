.data
arr:        .word   10, 3, 45, 90, 12
arr_length: .word   5
res_msg:    .asciiz "Largest in given array is "

.text
main:

    li      $t0,    1                               # init i
    la      $t1,    arr                             # load array
    lw      $t3,    arr_length                      # get arr_length
    lw      $s0,    0($t1)                          # get initial max value

Loop:
    beq     $t0,    $t3,        PrintMax            # if at end of array length 5

    lw      $s1,    4($t1)                          # get a[i]
    bgt     $s1,    $s0,        SetMax              # if $s1 > $s0 then goto target

    addi    $t1,    $t1,        4                   #increment arr
    addi    $t0,    $t0,        1                   # i++

    j       Loop

SetMax:
    move    $s0,    $s1                             # store new max in $s0

    addi    $t1,    $t1,        4                   #increment arr
    addi    $t0,    $t0,        1                   # i++

    j       Loop

PrintMax:

    la      $a0,    res_msg                         # put message in $a0
    li      $v0,    4                               # print msg
    syscall

    move    $a0,    $s0                             # copy result to $a0
    li      $v0,    1                               # print value
    syscall

    li      $v0,    10
    syscall