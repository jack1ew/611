module cpu (
input clck,
input rst_n,
input [31:0] io0_n,
output [31:0] io2_out,
);
logic [31;0] inst_ram [4095:0];
initial $readmemh("program.rom", inst_ram);

  // Do I have to implement instruction memory block and PC block
logic [6:0] f7, op;
logic [4:0] r2, r1, rd, wa;
logic [2:0] f3;
logic [20:0] imm20;
logic [11:0] imm12;
logic asrc, rw, gw, z;
logic [1:0] rs;
logic [3:0] opout;
  logic [31:0] gout, wd, rd1, rd2, BB, RR;
wa = io0_n[11:7];
  gout = {rd1, rw};
decode dc (.instructaddr(io0_n), .funct7(f7), .rs2(r2), .rs1(r1), .funct3(f3), .rd(rd),
           .opcode(op), .imm20(imm20), .imm12(imm12));

controlunit cu (.funct7(f7), .rs2(r2), rs1(r1), .funct3(f3), .rd(rd), .opcode(op),
                .imm20(imm20), .imm12(imm12), .alusrc(asrc), .regwrite(rw), .regsel(rs),
                .op(opout), .gpio_we(gw), .gpio_out(gout));

regfile reg (.clk(clck), .we(rw), .readaddr1(io0_n[19:15]), .readadder2(io0_n[24:20]),
             .writeaddr(io0_n[11:7]), .writedata(wd), .readdata1(rd1), .readdata2(rd2));

alu al (.A(rd1), .B(BB), .op(opout), .R(RR), .zero(z));

always_comb begin
  if (1'b0 == asrc) begin
    BB = rd2;
  end else if (1'b1 == asrc) begin
    BB = $signed(io0_n[31:20]);
  end else if (2'b00 == rs) begin
    wd = io0_n; // IDK if this is right
  end else if (2'b01 == rs) begin
    wd = {io0_n[31:12], 12'b0};
  end else if (2'b10 == rs) begin
    wd = RR;
  end
end
