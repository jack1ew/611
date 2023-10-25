module cpu (
  input reg clck,
  input reg rst_n,
  input reg [31:0] in,
  output reg [31:0] out
);
// Instruction memory portion
logic [31:0] inst_ram [4095:0];
initial $readmemh("program.txt",inst_ram);
logic [11:0] PC_FETCH;
logic [31:0] instruction_EX;
logic [4:0] regdest_WB;
logic [31:0] A_EX, B_EX;
logic alusrc_EX;
logic [31:0] regdata2_EX;
logic hex_we_EX;
logic regwrite_WB,regwrite_EX;
logic [2:0] regsel_WB,regsel_EX;
logic [31:0] lui_val_WB;
logic [31:0] R_WB, R_EX;
logic [31:0] writedata_WB;
logic [3:0] aluop_EX;
logic [6:0] f7, op;
logic [2:0] f3;
logic [4:0] r1, r2, r_d;
logic [11:0] imm12;
logic [19:0] imm20;
logic [31:0] in_WB;
logic z;

always_ff @(posedge clck)
  if (~rst_n) begin
    PC_FETCH <= 12'b0;
    instruction_EX <= 32'b0;
  end else begin
    PC_FETCH <= PC_FETCH + 1'b1;
    instruction_EX <= inst_ram[PC_FETCH];
  end

always_ff @(posedge clck) begin
  regdest_WB <= instruction_EX[11:7];
  if (hex_we_EX) out <= A_EX;
  //$display("%h", out);
  regwrite_WB <= regwrite_EX;
  regsel_WB <= regsel_EX;
  in_WB <= in;
  lui_val_WB <= {instruction_EX[31:12], 12'b0};
  R_WB <= R_EX;
end

assign B_EX = alusrc_EX == 1'b0 ? regdata2_EX : {{20{instruction_EX[31]}}, instruction_EX[31:20]};

assign writedata_WB = regsel_WB == 2'b00 ? in_WB : regsel_WB == 2'b01 ? lui_val_WB : R_WB;

decode dc(.instructaddr(instruction_EX), .funct7(f7), .rs2(r2), .rs1(r1), .funct3(f3), .rd(r_d), .opcode(op), .imm20(imm20), .imm12(imm12));
controlunit cu (.funct7(f7), .rs2(r2), .rs1(r1), .funct3(f3), .rd(r_d), .opcode(op),
                .imm20(imm20), .imm12(imm12), .alusrc(alusrc_EX), .regwrite(regwrite_EX), .regsel(regsel_EX),
                .op(aluop_EX), .gpio_we(hex_we_EX));

regfile re (.clk(clck), .we(regwrite_WB), .readaddr1(instruction_EX[19:15]), .readaddr2(instruction_EX[24:20]),
             .writeaddr(regdest_WB), .writedata(writedata_WB), .readdata1(A_EX), .readdata2(regdata2_EX));

alu myalu (.A(A_EX), .B(B_EX), .op(aluop_EX), .R(R_EX), .zero(z));


endmodule


