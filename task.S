.data
N:
.word 4
M:
.word 3
matrix:
.word 1, 2, 3, 4
.word 5, 60, 7, 8
.word 9, -100, 11, 12
result:
.word 0

.text

main:
la a2, N
la a3, M
la a4, matrix
la a5, result
call process
addi a2, x0, 1
la a3, result
call print
call exit

print:
addi a0, x0, 1 # print_int ecall
lw a1, 0(a3)
ecall
addi a0, x0, 11 # print_char ecall
addi a1, x0, 32 # this is space
ecall
ret

exit:
addi a0, x0, 10
ecall

process:
lw t1, 0(a2) # N
lw t2, 0(a3) # M
lw t5, 0(a4) # result to save
addi t4, x0, 0 # row pointer

init:
addi t3, x0, 0 # row element number

cycle:
lw t6, 0(a4) # load value from array
addi a4, a4, 4 # increment array pointer
bgt t6, t5, save_t6 # if t6 > t5 then save_t6
cycle_cont:
addi t3, t3, 1
blt t3, t1, cycle
addi t4, t4, 1
blt t4, t2, init
sw t5,  0(a5) # store result
ret

save_t6:
addi t5, t6, 0 # save [t6] into t5
j cycle_cont
