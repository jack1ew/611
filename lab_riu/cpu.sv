module cpu (
input clck,
input rst_n,
input [31:0] io0_n,
output [31:0] io2_out,
);
logic [31;0] inst_ram [4095:0];
initial $readmemh("program.rom", inst_ram);

logic [6:0] f7, op;
logic [4:0] r2, r1, rd;
logic [2:0] f3;
logic [20:0] imm20;
logic [11:0] imm12;

decode dc (.instructaddr(io0_n), 


