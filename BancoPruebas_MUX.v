`timescale 	1ns				/ 100ps
`include "MUX.v"
`include "Probador_MUX.v"
`include "cmos_cells.v"
`include "MUX_estruct.v"


module BancoPruebas_FIFO; // Testbench

    wire [9:0] Out0_conduct, Out1_conduct, Out2_conduct, Out3_conduct;
    wire [9:0] Out0_estruct, Out1_estruct, Out2_estruct, Out3_estruct;
    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire [9:0]		P0;			// From prob of Probador_MUX.v
    wire [9:0]		P1;			// From prob of Probador_MUX.v
    wire [9:0]		P2;			// From prob of Probador_MUX.v
    wire [9:0]		P3;			// From prob of Probador_MUX.v
    wire		clk;			// From prob of Probador_MUX.v
    wire		state;			// From prob of Probador_MUX.v
    // End of automatics


    MUX conductual (
        .Out0(Out0_conduct),
        .Out1(Out1_conduct),
        .Out2(Out2_conduct),
        .Out3(Out3_conduct),
        /*AUTOINST*/
		    // Inputs
		    .clk		(clk),
		    .state		(state),
		    .P0			(P0[9:0]),
		    .P1			(P1[9:0]),
		    .P2			(P2[9:0]),
		    .P3			(P3[9:0]));

	Probador_MUX prob (
        /*AUTOINST*/
			   // Outputs
			   .clk			(clk),
			   .state		(state),
			   .P0			(P0[9:0]),
			   .P1			(P1[9:0]),
			   .P2			(P2[9:0]),
			   .P3			(P3[9:0]),
			   // Inputs
			   .Out0_conduct	(Out0_conduct[9:0]),
			   .Out1_conduct	(Out1_conduct[9:0]),
			   .Out2_conduct	(Out2_conduct[9:0]),
			   .Out3_conduct	(Out3_conduct[9:0]),
			   .Out0_estruct	(Out0_estruct[9:0]),
			   .Out1_estruct	(Out1_estruct[9:0]),
			   .Out2_estruct	(Out2_estruct[9:0]),
			   .Out3_estruct	(Out3_estruct[9:0]));

    MUX_estruct estructural (
        .Out0(Out0_estruct),
        .Out1(Out1_estruct),
        .Out2(Out2_estruct),
        .Out3(Out3_estruct),
        /*AUTOINST*/
			     // Inputs
			     .P0		(P0[9:0]),
			     .P1		(P1[9:0]),
			     .P2		(P2[9:0]),
			     .P3		(P3[9:0]),
			     .clk		(clk),
			     .state		(state));
    
endmodule
// Local Variable:
   // eval:(verilog-read-defines)
   // eval:(verilog-read-includes)
   // End:
