module controlunit (
	input logic [6:0] funct7,
	input logic [4:0] rs2,
	input logic [4:0] rs1,
	input logic [2:0] funct3,
	input logic [4:0] rd,
	input logic [6:0] opcode,
	input logic [20:0] imm20,
	input logic [11:0] imm12,
	
	output logic alusrc,
	output logic regwrite,
	output logic [1:0] regsel,
	output logic [3:0] op,
	output logic gpio_we,
	output logic [31:0] gpio_out
);
	always @(*) begin
		if (opcode == 7'b0010011 && funct3 == 3'b000 && funct7 == 7'b0000000) begin // addi
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b01;
			op = 4'b0011;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0110011 && funct3 == 3'b000 && funct7 == 7'b0000000) begin // add
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0011;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0110011 && funct3 == 3'b000 && funct7 == 7'b0100000) begin // sub
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0100;
			gpio_we = 1'b0;	
		end else if (opcode == 7'b0110011 && funct3 == 3'b111 && funct7 == 7'b0000000) begin // and
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0000;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0110011 && funct3 == 3'b110 && funct7 == 7'b0000000) begin // or
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0001;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0110011 && funct3 == 3'b100 && funct7 == 7'b0000000) begin // xor
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0010;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0110011 && funct3 == 3'b001 && funct7 == 7'b0000000) begin // sll
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b1000;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0110011 && funct3 == 3'b101 && funct7 == 7'b0100000) begin // sra
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b1001;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0110011 && funct3 == 3'b101 && funct7 == 7'b0000000) begin // srl
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b1011;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0110011 && funct3 == 3'b010 && funct7 == 7'b0000000) begin // slt
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b1100;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0110011 && funct3 == 3'b011 && funct7 == 7'b0000000) begin // sltu
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b1101;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0110011 && funct3 == 3'b000 && funct7 == 7'b0000001) begin // mul
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0101;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0110011 && funct3 == 3'b001 && funct7 == 7'b0000001) begin // mulh
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0110;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0110011 && funct3 == 3'b011 && funct7 == 7'b0000001) begin // mulhu
			alusrc = 1'b0;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0111;
			gpio_we = 1'b0;
		end else if (opcode == 7'b1110011 && funct3 == 3'b001 && imm12 == 12'b1111_0000_0010) begin // csrrw hex
			alusrc = 1'bX;
			regwrite = 1'b0;
			regsel = 4'bX;
			op = 4'bX;
			gpio_we = 1'b1;
		end else if (opcode == 7'b1110011 && funct3 == 3'b001 && imm12 == 12'b1111_0000_0000) begin // csrrw sw
			alusrc = 1'bX;
			regwrite = 1'b1;
			regsel = 2'b00;
			op = 4'bX;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0010011 && funct3 == 3'b111) begin // andi
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0000;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0010011 && funct3 == 3'b110) begin // ori
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0001;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0010011 && funct3 == 3'b100) begin // xori
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b0010;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0010011 && funct3 == 3'b001) begin // slli
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b1000;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0010011 && funct3 == 3'b101 && imm20 == 7'b0100000) begin // srai
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b1001;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0010011 && funct3 == 3'b101 && imm20 == 7'b0000000) begin // srli
			alusrc = 1'b1;
			regwrite = 1'b1;
			regsel = 2'b10;
			op = 4'b1011;
			gpio_we = 1'b0;
		end else if (opcode == 7'b0110111) begin // lui
			alusrc = 1'bX;
			regwrite = 1'b1;
			regsel = 2'b01;
			op = 4'bX;
			gpio_we = 1'b0;
		end
	end

endmodule
			
			
