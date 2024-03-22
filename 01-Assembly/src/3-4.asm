.data
array:  .word 34, 23, 12                   # define the array
size:   .word 3                            # define the length of the arr

.text
.globl main

main:

init:
    lw s1, size         
    addi s1, s1, -1                 # const num for comparing with
    mv t1, s1                       # the length of the array which needed to compare
    li t2, 0                        # take t2 as the counter for the outer loop

outer_loop:
    la t0, array                    # save the address of array to t0
    li t4, 0                        # take t4 as the flag, check if the elements were exchanged
    blt t2, s1, inner_loop_init     # if counter < size jump to inner loop
    j sort_done

outer_loop_end:
    beqz t4, sort_done              # if there's no change in the array, sort done 
    addi t2, t2, 1                  # outer counter +1
    addi t1, t1, -1                 # shrink the size of array which need to be compared
    j outer_loop

inner_loop_init:
    li t3, 0                        # take t3 as the counter for the innner loop

inner_loop:
    blt t3, t1, swap_check          # if inner counter < size check if the exchange needed
    j outer_loop_end                # one inner loop was done

swap_check:
    lw t5, 0(t0)                    # load the element needed
    lw t6, 4(t0)                    # next element
    blt t5, t6, no_swap             # if t5 < t6 , no need to swap
    
    sw t6, 0(t0)                    # otherwise exchange the position
    sw t5, 4(t0)                    
    li t4, 1                        # set the flag of exchanging to 1

no_swap:
    addi t0, t0, 4                  # move to next element
    addi t3, t3, 1                  # inner counter +1
    j inner_loop

sort_done:
    la t0, array
    lw a0, 0(t0)
    lw a1, 4(t0)
    lw a2, 8(t0)
    ret