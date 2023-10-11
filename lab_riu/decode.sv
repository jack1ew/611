module decode (

/**** inputs *****************************************************************/

	input logic [31:0] instructaddr,
	
/**** outputs ****************************************************************/

	output logic [6:0] funct7,
	output logic [4:0] rs2,
	output logic [4:0] rs1,
	output logic [2:0] funct3,
	output logic [4:0] rd,
	output logic [6:0] opcode,
	output logic [19:0] imm20,
	output logic [11:0] imm12
);
        assign funct7 = instructaddr[31:25];
        assign rs2 = instructaddr [24:20];
        assign rs1 = instructaddr [19:15];
        assign funct3 = instructaddr [14:12];
        assign rd = instructaddr [11:7];
        assign opcode = instructaddr [6:0];
        assign imm20 = instructaddr [31:12];
        assign imm12 = instructaddr [31:20];
        
endmodule
		
