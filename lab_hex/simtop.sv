/* Copyright 2020 Jason Bakos, Philip Conrad, Charles Daniels */

/* Top-level module for CSCE611 RISC-V CPU, for running under simulation.  In
 * this case, the I/Os and clock are driven by the simulator. */

module simtop;

	logic clk;
	logic [17:0] SW;
	logic [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7;

	top dut
	(
		//////////// CLOCK //////////
		.CLOCK_50(clk),
		.CLOCK2_50(),
	        .CLOCK3_50(),

		//////////// LED //////////
		.LEDG(),
		.LEDR(),

		//////////// KEY //////////
		.KEY(),

		//////////// SW //////////
		.SW(SW),

		//////////// SEG7 //////////
		.HEX0(HEX0),
		.HEX1(HEX1),
		.HEX2(HEX2),
		.HEX3(HEX3),
		.HEX4(HEX4),
		.HEX5(HEX5),
		.HEX6(HEX6),
		.HEX7(HEX7)
	);

	initial begin
		SW=18'b11_0110_1000_1001_0101;
		if (HEX0 != 7'b001_0010) $display("HEX0 Fail");
		else $display("PASSED HEX0");
		if (HEX1 != 7'b001_0000) $display("HEX1 Fail");
		else $display("PASSED HEX1");
		if (HEX2 != 7'b000_0000) $display("HEX2 Fail");
		else $display("PASSED HEX2");
		if (HEX3 != 7'b000_0010) $display("HEX3 Fail");
		else $display("PASSED HEX3");
		if (HEX4 != 7'b011_0000) $display("HEX4 Fail");
		else $display("PASSED HEX4");
		if (HEX5 != 7'b111_1111) $display("HEX5 Fail");
		else $display("PASSED HEX5");
		if (HEX6 != 7'b111_1111) $display("HEX6 Fail");
		else $display("PASSED HEX6");
		if (HEX7 != 7'b111_1111) $display("HEX7 Fail");
		else $display("PASSED HEX7");
		SW=18'b10_0100_0110_0001_0111;
		if (HEX0 != 7'b111_1000) $display("HEX0 Fail");
		else $display("PASSED HEX0");
		if (HEX1 != 7'b111_1001) $display("HEX1 Fail");
		else $display("PASSED HEX1");
		if (HEX2 != 7'b000_0010) $display("HEX2 Fail");
		else $display("PASSED HEX2");
		if (HEX3 != 7'b001_1001) $display("HEX3 Fail");
		else $display("PASSED HEX3");
		if (HEX4 != 7'b010_0100) $display("HEX4 Fail");
		else $display("PASSED HEX4");
		if (HEX5 != 7'b111_1110) $display("HEX5 Fail");
		else $display("PASSED HEX5");
		if (HEX6 != 7'b111_1110) $display("HEX6 Fail");
		else $display("PASSED HEX6");
		if (HEX7 != 7'b111_1110) $display("HEX7 Fail");
		else $display("PASSED HEX7");
	end
		

endmodule

