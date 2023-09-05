# Inital goal would be 0 and the initial step will be 256
# Input is already prescaled by 2^14
# The condition given for input_actual and output_actual is not done through RISC-V but by hand.
# Do until the steps are 0

# Read int
    li a7, 5
    ecall
    addi t0, zero, a0
    addi t1, zero, 256
    slli t1, t1, 14  # Initial step
    addi t2, zero, 0 # guess

Loop:
    mul t3, t2, t2
    mulhu t4, t2, t2
    srli t3, t3, 14
    slli t4, t4, 18
    or t3, t3, t4
    beq t3, a0, Exit
    blt t3, a0, lessThan
    sub t2, t2, t1
    srli t1, t1, 1
    beq t1, zero, Exit
    beq zero, zero, Loop

Exit:
    li a0, 0x0A
    li a7, 11
    ecall
    ecall x0, t3, 1

lessThan:
    add t2, t2, t1
    srli t1, t1, 1
    beq t1, zero, Exit
    beq zero, zero, Loop
