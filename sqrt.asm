# Inital goal would be 0 and the initial step will be 256
# Input is already prescaled by 2^14
# The condition given for input_actual and output_actual is not done through RISC-V but by hand.
# Do until the steps are 0

# Read int
    li a7, 5
    ecall

