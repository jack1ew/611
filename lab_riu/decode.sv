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
	output [20:0] immaddr,
	output [3:0] instruction_type
);
	always @ (*)
		case (opcode)
		7'b0110011: instruction_type = 4'b0001; // R-type
		7'b0010011: instruction_type = 4'b0010; // I-type
		7'b0110111: isntruction_type = 4'b0011; // U-type
	endcase

endmodule
		
