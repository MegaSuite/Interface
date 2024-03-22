.data
n:  .word 3

.text
.globl main

main:
    la t0, n            # load the address of n to t0
    lw t0, 0(t0)        # load val of n to t0
    li t1, 1            # save the ans
    li t2, 1            # to iteration

factorial:
    blez t0, end        # if n < 0 end
    mul t1, t1, t2      # t1 = t1 * t2
    addi t2, t2, 1      # iter
    addi t0, t0, -1     # as counter
    j factorial         # continue

end:
    mv a0, t1           # move the answer to a0
    ret