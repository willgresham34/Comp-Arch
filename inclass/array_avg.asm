.data
arr:    .word   9, 12, 34, 44, 19
length: .word   5

.text

main:
    la      $a1,        array           # load array
    lw      $a2,        length          # load length
    jal     proc_avg                    # call proc_avg

    li      $v0,        10
    syscall

proc_avg:
    li      $t0,        0               # sum = 0
    li      $t1,        0               # i = 0

loop:
    beq     $t1,        $a2,    done    # i == length

    lw      $t2,        0($a1)          # arr[i]
    add     $t0,        $t0,    $t2     # sum += arr[i]
    addi    $a1,        $a1,    4       # increment arr
    addi    $t1,        $t1,    1       # i++
    j       loop

done:
    div     $t0,        $a2             # sum / length
    mflo    $v0                         # result to v0
    jr      $ra
