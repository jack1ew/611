module decode (

/**** inputs *****************************************************************/

	input [31:0] instructaddr,
	
/**** outputs ****************************************************************/

	output [6:0] funct7,
	output [4:0] rs2,
	output [4:0] rs1,
	output [2:0] fuct3.
	output [4:0] rd,
	output [6:0] opcode,
	output [20:0] imm20,
	output [12:0] imm12,
);
	always @ (*) begin
		if (opcode == 7'b0110011)
			funct7 = instructaddr [31:25];
			rs2 = instructaddr [24:20];
			rs1 = instructadddr [19:15];
			funct3 = instructaddr [14:12];
			rd = instructadder [11:7];
			opcode = instructadder [6:0];
		else begin
			if (opcode == 7'b0010011)
				imm12 = instructadder [31:20];//
				rs1 = instructadder [19:15];
				funct3 = instructadder [14:12];
				rd = instructadder [11:7];
				opcode = instructadder [6:0];
			else if (opcode = 7'b0110111)
				imm20 = instuctadder [31:12];
				rd = instructadder [11:7];
				opcode = instructadder[6:0];
		end
	end
endmodule
		
