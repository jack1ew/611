# Inital goal would be 0 and the initial step will be 256
# Input is already prescaled by 2^14
# The condition given for input_actual and output_actual is not done through RISC-V but by hand.
# Do until the steps are 0

# Read int
    li a7, 5
    ecall
    add t0, zero, a0
    addi t1, zero, 256
    slli t1, t1, 14  # Initial step
    addi t2, zero, 0 # guess   

Loop:
    mul t3, t2, t2
    mulhu t4, t2, t2
    srli t3, t3, 14
    slli t4, t4, 18
    or t5, t3, t4
    beq t5, t0, Exit
    bltu t5, t0, lessThan
    sub t2, t2, t1
    srli t1, t1, 1
    beq t1, zero, Exit
    beq zero, zero, Loop

Exit:
    add a0, zero, t2
    li a7, 1
    ecall
    li a7, 10
    ecall

lessThan:
    add t2, t2, t1
    srli t1, t1, 1
    beq t1, zero, Exit
    beq zero, zero, Loop
