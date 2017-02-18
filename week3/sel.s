            .data
total:      .word   0               # allocate memory for 1 element of integer
array:      .space  80              # allocate memory for 20 elements of integer
newline:    .asciiz "\n"            # new line character

            .text
            .globl main

main:       
            li   $v0, 5             # for syscall read 1 integer
            syscall

            move $s0, $v0           # save int to $s0
            la   $t0, total         # load address variable total
            sw   $s0, 0($t0)        # save value on total

            la   $t0, array         # load address of array
            move $s1, $zero         # i = 0

            jal  input              # jump to input

            move $s1, $zero         # i = 0
            addi $s3, $s0, -1       # total - 1
            jal  select1            # jump to selection sort main loop

            move $s1, $zero         # i = 0
            jal print               # jump to print output

exit:       
            li   $v0, 10
            syscall


input:      
            move $t1, $s1           # allocate prepare for read integer
            sll  $t1, $t1, 2        # offset i*4

            li   $v0, 5             # scanf("%d", &temp)
            syscall

            add  $t2, $t0, $t1      # &arr[i]
            sw   $v0, 0($t2)        # arr[i] = temp

            addi $s1, $s1, 1        # i++
            bne  $s1, $s0, input    # i != total

            jr   $ra


select1:    
            addi $s2, $s1, 1        # j = i + 1
            j    select2            # nested for loop

cont1:      addi $s1, $s1, 1        # i++
            bne  $s1, $s3, select1  # if i != total-1

            jr   $ra                # return


select2:
            sll  $t3, $s1, 2        # offset for arr[i]
            add  $t3, $t0, $t3      # &arr[i]
            lw   $t1, 0($t3)        # arr[i]

            sll  $t4, $s2, 2        # offset for arr[j]
            add  $t4, $t0, $t4      # &arr[j]
            lw   $t2, 0($t4)        # arr[j]

            blt  $t2, $t1, swap     # if(arr[j] < arr[i]) goto if1

cont2:      addi $s2, $s2, 1        # j++
            bne  $s2, $s0, select2  # if(j != total)
            j    cont1


swap:        
            sw   $t1, 0($t4)        # swap(a, b)
            sw   $t2, 0($t3)
            j    cont2


print:      
            sll  $t1, $s1, 2        # offset  = i*4 
            add  $t1, $t1, $t0      # &arr[i] 

            lw   $a0, 0($t1)        # arr[i]
            li   $v0, 1             # print arr[i]
            syscall

            la   $a0, newline       # print newline
            li   $v0, 4     
            syscall

            addi $s1, $s1, 1        # i++
            bne  $s1, $s0, print    # i != total

            jr   $ra
