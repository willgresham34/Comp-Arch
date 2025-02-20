.data

a_arr:      .word   10, 5, 6, 15, 17, 19, 25, 30, 12, 56    # array a
b_arr:      .word   4, 15, 16, 5, 7, 9, 15, 10, 22, 6       # array b
c_arr:      .space  40                                      # init array c with 40 bytes
res_msg:    .asciiz "Result is: "
cs:         .asciiz ", "

.text
main:


    la      $t0,        a_arr                               # load pointer to a
    la      $t1,        b_arr                               # load pointer to b
    la      $t2,        c_arr                               # load pointer to c

    li      $s0,        0                                   # init i to 0

Loop:

    beq     $s0,        10,         PrintMsg                # if i = 10 got to done

    sll     $t3,        $s0,        2                       # multiply value of i by 4 to get mem address offset

    add     $t0,        $t0,        $t3                     # get mem address for a[i]
    lw      $s1,        0($t0)                              # load value from a[i]

    add     $t1,        $t1,        $t3                     # get mem address for b[i]
    lw      $s2,        0($t1)                              # load value from b[i]

    sub     $s3,        $s1,        $s2                     # a[i] - b[i]

    add     $t2,        $t2,        $t3                     # get mem address for c[i]
    sw      $s3,        0($t2)                              # store value to c[i] mem address

    addi    $s0,        $s0,        1                       # i++
    j       Loop                                            # jump back  to start

PrintMsg:

    la      $a0,        res_msg                             # put message in $a0
    li      $v0,        4                                   # print msg

    la      $t2,        c_arr                               # Rest t2 to start of array
    li      $s0,        0                                   #rest i to 0

PrintArr:

    beq     $s0,        10,         Done                    # if at end of array move to Done

    sll     $t3,        $s0,        2                       # get offset value
    add     $t2,        $t2,        $t3                     # create mem address for c[i]
    lw      $a0,        0($t2)                              # load number into $a0
    li      $v0,        1
    syscall

    la      $a0,        cs                                  # put comma space in $a0
    li      $v0,        4                                   # print comma space

    addi    $s0,        $s0,        1                       # i++
    j       PrintArr

Done:
    li      $v0,        10
    syscall






