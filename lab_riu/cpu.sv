module cpu (
input reg clck,
input reg rst_n,
input reg [31:0] io0_n,
output [31:0] io2_out
);
//logic [31:0] inst_ram [4095:0];
//initial $readmemh("program.rom", inst_ram);

  // Do I have to implement instruction memory block and PC block
reg [6:0] f7, op;
reg [4:0] r2, r1, r_d, wa;
reg [2:0] f3;
reg [19:0] imm20;
reg [11:0] imm12;
reg asrc, rw, gw, z;
reg [1:0] rs;
reg [3:0] opout;
reg [31:0] gout, wd, rd1, rd2, BB, RR;

assign wa = io0_n[11:7];

decode dc(.instructaddr(io0_n), .funct7(f7), .rs2(r2), .rs1(r1), .funct3(f3), .rd(r_d), .opcode(op), .imm20(imm20), .imm12(imm12));

controlunit cu (.funct7(f7), .rs2(r2), .rs1(r1), .funct3(f3), .rd(rd), .opcode(op),
                .imm20(imm20), .imm12(imm12), .alusrc(asrc), .regwrite(rw), .regsel(rs),
                .op(opout), .gpio_we(gw), .gpio_out(gout));

regfile re (.clk(clck), .we(rw), .readaddr1(io0_n[19:15]), .readaddr2(io0_n[24:20]),
             .writeaddr(io0_n[11:7]), .writedata(wd), .readdata1(rd1), .readdata2(rd2));

alu al (.A(rd1), .B(BB), .op(opout), .R(RR), .zero(z));

always @(*) begin
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
  end else if (1'b1 == gw) begin
    io2_out = rd1;
  end
end
endmodule
