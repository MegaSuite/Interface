.data
a:  .word 48                # @param a
b:  .word 18                # @param b

.text
.globl main

main:
    la t0, a            # load the address of a to t0
    lw t1, 0(t0)        # load the value of a from address t0
    la t0, b            # load the address of b to t0
    lw t2, 0(t0)        # load the val of b from address t0

gcd_loop:
    beq t1, t2, end_loop        # if t1 == t2 jump to the end
    blt t1, t2, less_than       # if t1 < t2 jump to less_than
    sub t1, t1, t2              # if t1 > t2 , t1 = t1 - t2
    j gcd_loop                  # jump to the beginning

less_than:
    sub t2, t2, t1              # t2 = t2 -t1
    j gcd_loop                  # j to the bgn of the loop

end_loop:
    mv a0, t1
    ret