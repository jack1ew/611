module controlunit (
	input [6:0] funct7,
	input [4:0] rs2,
	input [4:0] rs1,
	input [2:0] funct3.
	input [4:0] rd,
	input [6:0] opcode,
	input [20:0] imm20,
	input [11:0] imm12,
	
	output alusrc,
	output regwrite,
	output [1:0] regsel,
	output [3:0] op,
	output gpio_we,
	output [31:0] gpio_out,
);
	always @ (*) begin
		if (opcode == 7'b0010011 && funct3 == 3'b000) // addi
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b01;
			op = 4'b0011;
			gpio_we = 1'b0;
	end

endmodule
			
			
