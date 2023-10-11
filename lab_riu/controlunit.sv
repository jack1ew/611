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
		else if (opcode == 7'b0110011 && funct3 == 3'b000 && funct7 == 7'b0000000) // add
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0011;
			gpio_we = 1'b0;
		else if (opcode == 7'b0110011 && funct3 == 3'b000 && funct7 == 7'b0100000) // sub
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0100;
			gpio_we = 1'b0;	
		else if (opcode == 7'b0110011 && funct3 == 3'b111) // and
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0000;
			gpio_we = 1'b0;
		else if (opcode == 7'b0110011 && funct3 == 3'b110) // or
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0001;
			gpio_we = 1'b0;
		else if (opcode == 7'b0110011 && funct3 == 3'b100) // xor
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0010;
			gpio_we = 1'b0;
		/*else if (opcode == 7'b0110011 && funct3 == 3'b001) // sll
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b1000;
			gpio_we = 1'b0;*/
		/*else if (opcode == 7'b0110011 && funct3 == 3'b101 && funct7 == 7'b0100000) // sra
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b01;
			op = 4'b0011;
			gpio_we = 1'b0;
		else if (opcode == 7'b0110011 && funct3 == 3'b101 && funct7 == 7'b0000000) // srl
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b01;
			op = 4'b0011;
			gpio_we = 1'b0;*/
		else if (opcode == 7'b0110011 && funct3 == 3'b010 && funct7 == 7'b0000000) // slt
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b1100;
			gpio_we = 1'b0;
		/*else if (opcode == 7'b0110011 && funct3 == 3'b011 && funct7 == 7'b0000000) // sltu
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b01;
			op = 4'b0011;
			gpio_we = 1'b0;*/
		else if (opcode == 7'b0110011 && funct3 == 3'b000 && funct7 == 7'b0000001) // mul
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0101;
			gpio_we = 1'b0;
		/*else if (opcode == 7'b0110011 && funct3 == 3'b001 && funct7 == 7'b0000001) // mulh
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b01;
			op = 4'b0011;
			gpio_we = 1'b0;
		else if (opcode == 7'b0110011 && funct3 == 3'b011 && funct7 == 7'b0000001) // mulhu
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b01;
			op = 4'b0011;
			gpio_we = 1'b0;
		else if (opcode == 7'b1110011 && funct3 == 3'b001) // csrrw
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b01;
			op = 4'b0011;
			gpio_we = 1'b0;*/
		else if (opcode == 7'b0010011 && funct3 == 3'b111) // andi
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0000;
			gpio_we = 1'b0;
		else if (opcode == 7'b0010011 && funct3 == 3'b110) // ori
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0001;
			gpio_we = 1'b0;
		else if (opcode == 7'b0010011 && funct3 == 3'b100) // xori
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0010;
			gpio_we = 1'b0;
		else if (opcode == 7'b0010011 && funct3 == 3'b001) // slli
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b1000;
			gpio_we = 1'b0;
		/*else if (opcode == 7'b0010011 && funct3 == 3'b101 && imm20 == 7'b0100000) // srai
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b01;
			op = 4'b0011;
			gpio_we = 1'b0;
		else if (opcode == 7'b0010011 && funct3 == 3'b101 && imm20 == 7'b0000000) // srli
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b01;
			op = 4'b0011;
			gpio_we = 1'b0;*/
		else if (opcode == 7'b0110111) // lui
			alusrc = 1'bX;
			regwrite = 1'b1;
			regsel = 2'b01;
			op = 4'bX;
			gpio_we = 1'b0;
	end

endmodule
			
			
